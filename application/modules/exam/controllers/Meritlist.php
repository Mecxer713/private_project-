<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Meritlist.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Meritlist
 * @description     : Manage exam merit list.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Meritlist extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Meritlist_Model', 'merit', true);
        $this->data['academic_years'] = $this->merit->get_list('academic_years', array('status' => 1));
        $this->data['classes'] = $this->merit->get_list('classes', array('status' => 1), '', '', '', 'id', 'ASC');
    }

    
        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Exam final result sheet" user interface                 
    *                    with class/section wise filtering option    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        if ($_POST) {
           
            $academic_year_id = $this->input->post('academic_year_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');
           
            $this->data['academic_year_id'] = $academic_year_id;
            $this->data['class_id'] = $class_id;         
            $this->data['section_id'] = $section_id;         

            $this->data['class'] = $this->db->get_where('classes', array('id'=>$class_id))->row()->name;
            if($section_id){
                $this->data['section'] = $this->db->get_where('sections', array('id'=>$section_id))->row()->name;
            }
            
            $this->data['academic_year'] = $this->db->get_where('academic_years', array('id'=>$academic_year_id))->row()->session_year;
            $this->data['examresult'] = $this->merit->get_merit_list($academic_year_id, $class_id, $section_id);
        }
        
        $this->layout->title($this->lang->line('exam') . ' ' . $this->lang->line('merit_list') . ' | ' . SMS);
        $this->layout->view('merit_list/index', $this->data);
        
    }
}