<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Examresult.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Examresult
 * @description     : Manage exam term result and prepare promotion to next class.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Examresult extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Examresult_Model', 'result', true);
        $this->data['classes'] = $this->result->get_list('classes', array('status' => 1), '', '', '', 'id', 'ASC');
        $this->data['grades'] = $this->result->get_list('grades', array('status' => 1), '', '', '', 'id', 'ASC');
        $this->data['exams'] = $this->result->get_list('exams', array('status' => 1, 'academic_year_id'=> $this->academic_year_id), '', '', '', 'id', 'ASC');
    }

    
        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Exam result sheet" user interface                 
    *                    with class/section wise filtering option    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        if ($_POST) {

            $exam_id = $this->input->post('exam_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');

            $this->data['students'] = $this->result->get_student_list($class_id, $section_id);

            $condition = array(               
                'exam_id' => $exam_id,
                'class_id' => $class_id,
                'section_id' => $section_id,
                'academic_year_id' => $this->academic_year_id
            );

            $data = $condition;
            if (!empty($this->data['students'])) {

                foreach ($this->data['students'] as $obj) {

                    $condition['student_id'] = $obj->id;
                    $result = $this->result->get_single('exam_results', $condition);

                    if (empty($result)) {
                        $data['student_id'] = $obj->id;
                        $data['exam_id'] = $exam_id;
                        $data['class_id'] = $class_id;
                        $data['section_id'] = $section_id;
                        $data['academic_year_id'] = $this->academic_year_id;
                        $data['status'] = 1;
                        $data['created_at'] = date('Y-m-d H:i:s');
                        $data['created_by'] = logged_in_user_id();
                        $data['modified_at'] = date('Y-m-d H:i:s');
                        $data['modified_by'] = logged_in_user_id();
                        $this->result->insert('exam_results', $data);
                    }
                }
            }

            $this->data['exam'] =  $this->result->get_single('exams', array('id'=>$exam_id));;
            $this->data['exam_id'] = $exam_id;
            $this->data['class_id'] = $class_id;
            $this->data['section_id'] = $section_id;
            
            $class = $this->result->get_single('classes', array('id'=>$class_id));
            create_log('Has been process exam result for class: '. $class->name);
        }

        $this->layout->title($this->lang->line('exam') . ' ' . $this->lang->line('result') . ' | ' . SMS);
        $this->layout->view('exam_result/index', $this->data);
    }

    
    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Process exam result and save into database                  
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);

        if ($_POST) {

            $exam_id = $this->input->post('exam_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');

            $condition = array(
                'exam_id' => $exam_id,
                'class_id' => $class_id,
                'section_id' => $section_id,
                'academic_year_id' => $this->academic_year_id,
            );

            $data = $condition;

            if (!empty($_POST['students'])) {

                foreach ($_POST['students'] as $key => $value) {

                    $condition['student_id'] = $value;
                    $data['total_subject'] = $_POST['total_subject'][$value];
                    $data['total_mark'] = $_POST['total_mark'][$value];
                    $data['total_obtain_mark'] = $_POST['total_obtain_mark'][$value];
                    $data['avg_grade_point'] = $_POST['avg_grade_point'][$value];
                    $data['grade_id'] = $_POST['grade_id'][$value];
                    $data['remark'] = $_POST['remark'][$value];
                    $data['status'] = 1;
                    $data['created_at'] = date('Y-m-d H:i:s');
                    $data['created_by'] = logged_in_user_id();
                    $data['modified_at'] = date('Y-m-d H:i:s');
                    $data['modified_by'] = logged_in_user_id();
                    
                    // process result status
                    $grade = $this->result->get_single('grades', array('id'=>$data['grade_id']));
                    if($grade->point <= 0){                        
                        $data['result_status'] = 'failed';
                    }else{
                        $data['result_status'] = 'passed'; 
                    }
                    
                    $this->result->update('exam_results', $data, $condition);
                }
            }
            
            $class = $this->result->get_single('classes', array('id'=>$class_id));
            create_log('Has been process and save exam result for class: '. $class->name);
            
            success($this->lang->line('insert_success'));
            redirect('exam/examresult');
        }

        $this->layout->title($this->lang->line('exam') . ' ' . $this->lang->line('result') . ' | ' . SMS);
        $this->layout->view('exam_result/index', $this->data);
    }

}
