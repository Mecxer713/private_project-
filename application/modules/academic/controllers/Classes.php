<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Classes.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Classes
 * @description     : Manage academic class.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Classes extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
         $this->load->model('Classes_Model', 'classes', true);
         
    }

    
    /*****************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : load "class listing" in user interface
     *                       
     * @param           : null 
     * @return          : null 
     * ********************************************************** */
    public function index() {
        
        check_permission(VIEW);
        $this->data['classes'] = $this->classes->get_class_list();        
         $this->data['teachers'] = $this->classes->get_list('teachers', array('status' => 1), '','', '', 'id', 'ASC');
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('manage_class'). ' | ' . SMS);
        $this->layout->view('class/index', $this->data);            
       
    }

     /*****************Function add**********************************
     * @type            : Function
     * @function name   : add
     * @description     : load "add new class" user interface and 
                          process to save "new class" into database
     *                       
     * @param           : null 
     * @return          : null 
     * ********************************************************** */
    public function add() {
        
        check_permission(ADD);
        
        if ($_POST) {
            $this->_prepare_class_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_class_data();

                $insert_id = $this->classes->insert('classes', $data);
                if ($insert_id) { 
                    
                    create_log('Has been created a class :'.$data['name']);
                    
                    success($this->lang->line('insert_success'));
                    $this->__create_default_section($insert_id);
                    redirect('academic/classes/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('academic/classes/add');
                }
            } else {
                $this->data['post'] = $_POST;
            }
        }

        $this->data['classes'] = $this->classes->get_class_list();        
        $this->data['teachers'] = $this->classes->get_list('teachers', array('status' => 1), '','', '', 'id', 'ASC');
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add'). ' ' . $this->lang->line('class'). ' | ' . SMS);
        $this->layout->view('class/index', $this->data);
    }

     /*****************Function edit**********************************
     * @type            : Function
     * @function name   : edit
     * @description     : load "update class" user interface and
                          process to update "class" into database 
     *                       
     * @param           : $id integetr value 
     * @return          : null 
     * ********************************************************** */
    public function edit($id = null) {       
       
        check_permission(EDIT);
        
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
           redirect('academic/classes/index');  
        }
        
        if ($_POST) {
            $this->_prepare_class_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_class_data();
                $updated = $this->classes->update('classes', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    
                    create_log('Has been updated a class :'.$data['name']);
                    
                    success($this->lang->line('update_success'));
                    redirect('academic/classes/index');                   
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('academic/classes/edit/' . $this->input->post('id'));
                }
            } else {
                $this->data['class'] = $this->classes->get_single('classes', array('id' => $this->input->post('id')));
            }
        }
        
        if ($id) {
            $this->data['class'] = $this->classes->get_single('classes', array('id' => $id));

            if (!$this->data['class']) {
                 redirect('academic/classes/index');
            }
        }

        $this->data['classes'] = $this->classes->get_class_list();        
        $this->data['teachers'] = $this->classes->get_list('teachers', array('status' => 1), '','', '', 'id', 'ASC');
        $this->data['edit'] = TRUE;       
        $this->layout->title($this->lang->line('edit'). ' ' . $this->lang->line('class'). ' | ' . SMS);
        $this->layout->view('class/index', $this->data);
    }

    /*****************Function _prepare_class_validation**********************************
     * @type            : Function
     * @function name   : _prepare_class_validation
     * @description     : Process "class" user input data validation
     *                       
     * @param           : null 
     * @return          : null 
     * ********************************************************** */
    private function _prepare_class_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required|callback_name');
      
    }
    
    /*****************Function name**********************************
     * @type            : Function
     * @function name   : name
     * @description     : unique check for "Class name"
     *                       
     * @param           : null 
     * @return          : boolean true/flase 
     * ********************************************************** */
    public function name()
   {             
      if($this->input->post('id') == '')
      {   
          $name = $this->classes->duplicate_check($this->input->post('name')); 
          if($name){
                $this->form_validation->set_message('name', $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }          
      }else if($this->input->post('id') != ''){   
         $name = $this->classes->duplicate_check($this->input->post('name'), $this->input->post('id')); 
          if($name){
                $this->form_validation->set_message('name', $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }
      }   
   }


     /*****************Function _get_posted_class_data**********************************
     * @type            : Function
     * @function name   : _get_posted_class_data
     * @description     : Prepare "Class" user input data to save into database 
     *                       
     * @param           : null 
     * @return          : $data array() value 
     * ********************************************************** */
    private function _get_posted_class_data() {

        $items = array();
        $items[] = 'teacher_id';
        $items[] = 'name';
        $items[] = 'numeric_name';        
        $items[] = 'note';
        $data = elements($items, $_POST);        
        
        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id();
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
                       
        }

        return $data;
    }

    
     /*****************Function delete**********************************
     * @type            : Function
     * @function name   : delete
     * @description     : delete "class" data from database
     *                       
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function delete($id = null) {
        
        check_permission(DELETE);
        
        if(!is_numeric($id)){
             error($this->lang->line('unexpected_error'));
             redirect('academic/classes/index');    
        }
        
        $class = $this->classes->get_single('classes', array('id' => $id));
                
        if ($this->classes->delete('classes', array('id' => $id))) { 
            
            // delete section
            $this->classes->delete('sections', array('class_id' => $id));
            
            create_log('Has been deleted a class : '. $class->name);
            success($this->lang->line('delete_success'));
            
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('academic/classes/index');
    }
    
    /*****************Function __create_default_section**********************************
     * @type            : Function
     * @function name   : __create_default_section
     * @description     : create default section while create a new class
     *                       
     * @param           : $insert_id integer value
     * @return          : null 
     * ********************************************************** */
    private function __create_default_section($insert_id){
        
        $data = array();
        $data['class_id']    = $insert_id;
        $data['teacher_id']  = $this->input->post('teacher_id');
        $data['name']       = 'A';
        $data['note']       = 'Default Section';
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['created_by'] = logged_in_user_id();
        $data['modified_at'] = date('Y-m-d H:i:s');
        $data['modified_by'] = logged_in_user_id();
        $data['status']     = 1; 
        $this->classes->insert('sections', $data);
        
    }

}
