<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Email.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Email
 * @description     : Reset users email by System administrator.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Email extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
         $this->load->model('Administrator_Model', 'administrator', true);
         $this->data['roles'] = $this->administrator->get_list('roles', array('status' => 1), '','', '', 'id', 'ASC');
         $this->data['years'] = $this->administrator->get_list('academic_years', array('status' => 1), '','', '', 'id', 'ASC');
    }


    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load reset email user interface                 
    *                    and reset user email processing    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */ 
   public function index() {

       check_permission(EDIT);
       
        if($_POST){
            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
            $this->form_validation->set_rules('role_id', $this->lang->line('user'). ' ' .$this->lang->line('type'), 'trim|required');
            if($this->input->post('role_id') == STUDENT){
                $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required');  
            }
            $this->form_validation->set_rules('user_id', $this->lang->line('user'), 'trim|required');
            $this->form_validation->set_rules('email', $this->lang->line('email'), 'trim|required|valid_email|callback_email');
            
             if ($this->form_validation->run() === TRUE) {
                $data['email']      = $this->input->post('email');
                $data['modified_at'] = date('Y-m-d H:i:s');
                $data['modified_by'] = logged_in_user_id();
                $this->administrator->update('users', $data, array('id'=> $this->input->post('user_id')));
                success($this->lang->line('update_success'));
                
                $user = $this->administrator->get_single('users', array('id' => $this->input->post('user_id')));
                create_log('Has been updated email for user : '. $user->email);
                
                redirect('administrator/email');
             }
        }
        
        $this->data['classes'] = $this->administrator->get_list('classes', array('status' => 1), '','', '', 'id', 'ASC');
        $this->layout->title($this->lang->line('reset_user_email'). ' | ' . SMS);
        $this->layout->view('email/index', $this->data);
    }
    
    
        
                    
    /*****************Function email**********************************
    * @type            : Function
    * @function name   : email
    * @description     : Unique check for "User Email" data/value                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
    public function email() {
        if ($this->input->post('user_id') == '') {
            $email = $this->administrator->duplicate_check($this->input->post('email'));
            if ($email) {
                $this->form_validation->set_message('email', $this->lang->line('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else if ($this->input->post('user_id') != '') {
            $email = $this->administrator->duplicate_check($this->input->post('email'), $this->input->post('user_id'));
            if ($email) {
                $this->form_validation->set_message('email', $this->lang->line('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else {
            return TRUE;
        }
    }
    
}
