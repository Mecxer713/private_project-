<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Promotion.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Promotion
 * @description     : Manage student promotion from one academic class to another academic class.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Promotion extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
        $this->load->model('Promotion_Model', 'promotion', true);
        
        if(!$this->academic_year_id){
            error($this->lang->line('academic_year_setting'));
            redirect('setting');
        }
        
        $this->data['classes'] = $this->promotion->get_list('classes', array('status' => 1), '', '', '', 'id', 'ASC');
        $this->data['exams'] = $this->promotion->get_list('exams', array('status' => 1, 'academic_year_id' => $this->academic_year_id), '', '', '', 'id', 'ASC');
        $this->data['grades'] = $this->promotion->get_list('grades', array('status' => 1), '', '', '', 'id', 'ASC');
        $this->data['curr_session'] = $this->promotion->get_single('academic_years', array('is_running' => 1));
        $this->data['next_session'] = $this->promotion->get_list('academic_years', array('id !=' => $this->academic_year_id, 'status'=>1), '','', '', 'session_year', 'ASC');
    }

        
    /*****************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : load "Promotion" user input interface and 
     *                      process/filter promotion calss
     *                       
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function index() {                
        
        check_permission(VIEW);
        if($_POST){
            
            $current_session_id   = $this->input->post('current_session_id');
            $next_session_id   = $this->input->post('next_session_id');
            $current_class_id = $this->input->post('current_class_id');
            $next_class_id = $this->input->post('next_class_id'); 
            
            
            $this->data['students'] = $this->promotion->get_student_list($current_session_id, $current_class_id);
            
            $this->data['current_class'] = $this->promotion->get_single('classes', array('id' => $current_class_id));
            $this->data['next_class'] = $this->promotion->get_single('classes', array('id' => $next_class_id));
                                              
            $this->data['current_session_id'] = $current_session_id;
            $this->data['next_session_id'] = $next_session_id;
            $this->data['current_class_id'] = $current_class_id;
            $this->data['next_class_id'] = $next_class_id;          
            
        }

        $this->layout->title( $this->lang->line('manage_promotion'). ' | ' . SMS);
        $this->layout->view('promotion/index', $this->data);  
    }
    
    
            
    /*****************Function add**********************************
     * @type            : Function
     * @function name   : add
     * @description     : Process "Promotion" to next/promoted class                 
     *                    and store promoted class information into database    
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function add() {                
        
        check_permission(ADD);
        
        if($_POST){
            
            $current_session_id   = $this->input->post('current_session_id');
            $next_session_id   = $this->input->post('next_session_id');
            $current_class_id = $this->input->post('current_class_id');
            $next_class_id = $this->input->post('next_class_id');  
                      
           
            // get next class default section
            $next_class_default_section = $this->promotion->get_single('sections', array('class_id'=>$next_class_id, 'name'=>'A'));
            
            if(!empty($_POST['students'])){
                
                foreach($_POST['students'] as $key=>$value){
                    
                    $data = array();
                     
                    // process failed or passed category different
                    if($_POST['promotion_class_id'][$value] == $current_class_id){
                        
                        $data['student_type'] = 'failed';
                        $enroll = $this->promotion->get_single('enrollments', array('class_id'=>$current_class_id, 'student_id'=>$value, 'academic_year_id'=>$current_session_id));
                        $data['section_id'] = $enroll->section_id; 
                        
                    }else{
                        
                        $data['student_type'] = 'promoted';
                        $data['section_id'] = $next_class_default_section->id ? $next_class_default_section->id : '';
                        
                    }
                    
                    // need to check is any student alredy enrolled
                     $exist = $this->promotion->get_single('enrollments', array('class_id'=>$next_class_id, 'student_id'=>$value, 'academic_year_id'=>$next_session_id));
                    
                     $data['class_id'] = $_POST['promotion_class_id'][$value]; 
                     $data['roll_no'] = $_POST['roll_no'][$value]; 
                     

                    if(empty($exist)){
                         
                        // need to check is any student alredy enrolled as a failed
                        $filed = $this->promotion->get_single('enrollments', array('class_id'=>$current_class_id, 'student_id'=>$value, 'academic_year_id'=>$next_session_id));
                     
                        if(empty($filed)){
                            
                            $data['academic_year_id'] = $next_session_id; 
                            $data['student_id'] = $value;                          
                            $data['status'] = 1;                         
                            $data['created_at'] = date('Y-m-d H:i:s');
                            $data['created_by'] = logged_in_user_id();    
                            $data['modified_at'] = date('Y-m-d H:i:s');
                            $data['modified_by'] = logged_in_user_id(); 
                            $this->promotion->insert('enrollments', $data);
                            
                        }else{
                            
                            $data['modified_at'] = date('Y-m-d H:i:s');
                            $data['modified_by'] = logged_in_user_id(); 
                            $this->promotion->update('enrollments', $data, array('student_id'=>$value, 'academic_year_id'=>$next_session_id)); 
                        }
                         
                    }else{
                        
                        $data['modified_at'] = date('Y-m-d H:i:s');
                        $data['modified_by'] = logged_in_user_id(); 
                        $this->promotion->update('enrollments', $data, array('student_id'=>$value, 'academic_year_id'=>$next_session_id)); 
                        
                    }
                }
            }
            
            $class = $this->promotion->get_single('classes', array('id'=>$current_class_id));
            create_log('Has been promoted a class : '. $class->name);
            
            success($this->lang->line('promotion') .' '. $this->lang->line('insert_success'));                      
        }else{
            error($this->lang->line('promotion').' '.$this->lang->line('insert_failed'));  
        }        
       
        redirect('academic/promotion/index');
    }

}
