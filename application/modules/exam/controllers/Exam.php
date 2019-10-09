<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Exam.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Exam
 * @description     : Manage exam term.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Exam extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Exam_Model', 'exam', true);
        
         // check running session
        if(!$this->academic_year_id){
            error($this->lang->line('academic_year_setting'));
            redirect('setting');
        } 
               
    }

    
        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Exam term List" user interface                
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);
        
        $this->data['exams'] = $this->exam->get_exam_list();
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('exam_term') . ' | ' . SMS);
        $this->layout->view('exam/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new Eaxm term" user interface                 
    *                    and process to store "Exam term" into database 
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);

        if ($_POST) {
            $this->_prepare_exam_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_exam_data();

                $insert_id = $this->exam->insert('exams', $data);
                if ($insert_id) {
                    
                    create_log('Has been created an Exam : '.$data['title']);   
                    
                    success($this->lang->line('insert_success'));
                    redirect('exam/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('exam/add');
                }
            } else {
                $this->data['post'] = $_POST;
            }
        }

        $this->data['exams'] = $this->exam->get_exam_list();
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add') . ' ' . $this->lang->line('exam_term') . ' | ' . SMS);
        $this->layout->view('exam/index', $this->data);
    }

    
    /*****************Function edit**********************************
    * @type            : Function
    * @function name   : edit
    * @description     : Load Update "Exam term" user interface                 
    *                    with populate "Exam term" value 
    *                    and process to update "exam term" into database    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function edit($id = null) {

        check_permission(EDIT);

        if(!is_numeric($id)){
             error($this->lang->line('unexpected_error'));
             redirect('exam/index');
        }
        
        if ($_POST) {
            $this->_prepare_exam_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_exam_data();
                $updated = $this->exam->update('exams', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    
                    create_log('Has been udated an Exam : '.$data['title']); 
                    
                    success($this->lang->line('update_success'));
                    redirect('exam/index');
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('exam/edit/' . $this->input->post('id'));
                }
            } else {
                $this->data['post'] = $_POST;
                $this->data['exam'] = $this->exam->get_single('exams', array('id' => $this->input->post('id')));
            }
        }

        if ($id) {
            $this->data['exam'] = $this->exam->get_single('exams', array('id' => $id));

            if (!$this->data['exam']) {
                redirect('exam/index');
            }
        }

        $this->data['exams'] = $this->exam->get_exam_list();
        $this->data['edit'] = TRUE;
        $this->layout->title($this->lang->line('edit') . ' ' . $this->lang->line('exam_term') . ' | ' . SMS);
        $this->layout->view('exam/index', $this->data);
    }

    
    /*****************Function view**********************************
    * @type            : Function
    * @function name   : view
    * @description     : Load user interface with specific exam term data                 
    *                       
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function view($id = null) {

        check_permission(VIEW);
        if(!is_numeric($id)){
             error($this->lang->line('unexpected_error'));
             redirect('exam/index');
        }
        
        $this->data['exams'] = $this->exam->get_exam_list();
        $this->data['exam'] = $this->exam->get_single_exam($id);
        $this->data['detail'] = TRUE;
        $this->layout->title($this->lang->line('view') . ' ' . $this->lang->line('exam_term') . ' | ' . SMS);
        $this->layout->view('exam/index', $this->data);
    }

    
    /*****************Function _prepare_exam_validation**********************************
    * @type            : Function
    * @function name   : _prepare_exam_validation
    * @description     : Process "exam term" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_exam_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');

        $this->form_validation->set_rules('title', $this->lang->line('exam') . '' . $this->lang->line('title'), 'trim|required|callback_title');
        $this->form_validation->set_rules('start_date', $this->lang->line('start_date'), 'trim|required');
        $this->form_validation->set_rules('note', $this->lang->line('note'), 'trim');
    }

    
    /*****************Function title**********************************
    * @type            : Function
    * @function name   : title
    * @description     : Unique check for "Exam term title" data/value                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
    public function title() {
        if ($this->input->post('id') == '') {
            $exam = $this->exam->duplicate_check($this->input->post('title'));
            if ($exam) {
                $this->form_validation->set_message('title', $this->lang->line('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else if ($this->input->post('id') != '') {
            $exam = $this->exam->duplicate_check($this->input->post('title'), $this->input->post('id'));
            if ($exam) {
                $this->form_validation->set_message('title', $this->lang->line('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        }
    }

    
    /*****************Function _get_posted_exam_data**********************************
    * @type            : Function
    * @function name   : _get_posted_exam_data
    * @description     : Prepare "Exam term" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_exam_data() {

        $items = array();
        $items[] = 'title';
        $items[] = 'note';
        $data = elements($items, $_POST);

        $data['start_date'] = date('Y-m-d', strtotime($this->input->post('start_date')));

        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['academic_year_id'] = $this->academic_year_id;
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
    * @description     : delete "Exam Term" from database                  
    *                       
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function delete($id = null) {

        check_permission(DELETE);

         if(!is_numeric($id)){
             error($this->lang->line('unexpected_error'));
             redirect('exam/index');
        }
        
        $exam = $this->exam->get_single('exams', array('id' => $id));
        
        if ($this->exam->delete('exams', array('id' => $id))) {
            
            create_log('Has been deleted an Exam : '.$exam->title); 
            
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('exam/index');
    }

}
