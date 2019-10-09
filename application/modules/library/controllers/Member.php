<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Member.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Member
 * @description     : Manage library member, from the student whose are library member.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Member extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Book_Model', 'book', true);        
    }

        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Library Member List" user interface                 
    *                        
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);
        $this->data['members'] = $this->book->get_library_member_list($is_library_member = 1);        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('library') . ' ' . $this->lang->line('member') . ' | ' . SMS);
        $this->layout->view('member/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new Library Member" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);

        $this->data['non_members'] = $this->book->get_library_member_list($is_library_member = 0);
        
        $this->data['non_list'] = TRUE;
        $this->layout->title($this->lang->line('library') . ' ' . $this->lang->line('non_member') . ' | ' . SMS);
        $this->layout->view('member/index', $this->data);
    }

        
    /*****************Function delete**********************************
    * @type            : Function
    * @function name   : delete
    * @description     : delete "Library member" data from library member list                  
    *                       
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function delete($id = null) {

        check_permission(DELETE);

        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('library/member/index');
        }
        
        $member = $this->book->get_single('library_members', array('id' => $id));
        if ($this->book->delete('library_members', array('id' => $id))) {
            $this->book->update('students', array('is_library_member' => 0), array('user_id' => $member->user_id));
            
            $student = $this->book->get_single('students', array('user_id' => $member->user_id));
            create_log('Has been deleted a Library Member : '.$student->name);
            
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('library/member/index');
    }


    /*****************Function delete**********************************
    * @type            : Function
    * @function name   : delete
    * @description     : Process to add/store "Library Member" into database                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */
    public function add_to_library() {

        $user_id = $this->input->post('user_id');

        if ($user_id) {

            $member = $this->book->get_single('library_members', array('user_id' => $user_id));
            if (empty($member)) {

                $data['user_id'] = $user_id;
                $data['custom_member_id'] = $this->book->get_custom_id('library_members', 'LM');
                $data['status'] = 1;
                $data['created_at'] = date('Y-m-d H:i:s');
                $data['created_by'] = logged_in_user_id();
                $data['modified_at'] = date('Y-m-d H:i:s');
                $data['modified_by'] = logged_in_user_id();

                $insert_id = $this->book->insert('library_members', $data);
                $this->book->update('students', array('is_library_member' => 1), array('user_id' => $user_id));
                
                $student = $this->book->get_single('students', array('user_id' => $member->user_id));
                create_log('Has been added a Library Member : '.$student->name);
                
                echo TRUE;
            } else {
                echo FALSE;
            }
        } else {
            echo FALSE;
        }
    }

}
