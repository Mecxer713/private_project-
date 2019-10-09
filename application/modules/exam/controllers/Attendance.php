<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Attendance.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Attendance
 * @description     : Manage attendance for student who attend in the exam.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Attendance extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Attendance_Model', 'attendance', true);
        $this->data['classes'] = $this->attendance->get_list('classes', array('status' => 1), '', '', '', 'id', 'ASC');
        $this->data['exams'] = $this->attendance->get_list('exams', array('status' => 1, 'academic_year_id' => $this->academic_year_id), '', '', '', 'id', 'ASC');
    }

    
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Exam Attendance" user interface                 
    *                    and Process to manage Student exam attendance    
    * @param           : null
    * @return          : null 
    * ********************************************************** */ 
    public function index() {

        check_permission(VIEW);

        if ($_POST) {

            $exam_id = $this->input->post('exam_id');
            $class_id = $this->input->post('class_id');
            $section_id = $this->input->post('section_id');
            $subject_id = $this->input->post('subject_id');

            $this->data['students'] = $this->attendance->get_student_list($exam_id, $class_id, $section_id, $subject_id);

            $condition = array(
                'exam_id' => $exam_id,
                'class_id' => $class_id,
                'section_id' => $section_id,
                'academic_year_id' => $this->academic_year_id,
                'subject_id' => $subject_id
            );

            $data = $condition;
            if (!empty($this->data['students'])) {

                foreach ($this->data['students'] as $obj) {

                    $condition['student_id'] = $obj->student_id;
                    $attendance = $this->attendance->get_single('exam_attendances', $condition);

                    if (empty($attendance)) {
                        $data['student_id'] = $obj->student_id;
                        $data['status'] = 1;
                        $data['created_at'] = date('Y-m-d H:i:s');
                        $data['created_by'] = logged_in_user_id();
                        $data['modified_at'] = date('Y-m-d H:i:s');
                        $data['modified_by'] = logged_in_user_id();
                        $this->attendance->insert('exam_attendances', $data);
                    }
                }
            }

            $this->data['exam_id'] = $exam_id;
            $this->data['class_id'] = $class_id;
            $this->data['section_id'] = $section_id;
            $this->data['subject_id'] = $subject_id;
            
           $exam = $this->attendance->get_single('exams', array('id'=>$exam_id));
           $class = $this->attendance->get_single('classes', array('id'=>$class_id));
           $subject = $this->attendance->get_single('subjects', array('id'=>$subject_id));
            
            create_log('Has been process exam attendance for : '.$exam->title. ', '. $class->name.', '. $subject->name);   
        }

        $this->layout->title($this->lang->line('exam') . ' ' . $this->lang->line('attendance') . ' | ' . SMS);
        $this->layout->view('attendance/index', $this->data);
    }



    /*****************Function update_single**********************************
    * @type            : Function
    * @function name   : update_single
    * @description     : Process to update single student exam attendance status               
    *                        
    * @param           : null
    * @return          : null 
    * ********************************************************** */ 
    public function update_single() {

        $status = $this->input->post('status');
        $condition['student_id'] = $this->input->post('student_id');
        $condition['exam_id'] = $this->input->post('exam_id');
        $condition['class_id'] = $this->input->post('class_id');
        $condition['section_id'] = $this->input->post('section_id');
        $condition['subject_id'] = $this->input->post('subject_id');
        $condition['academic_year_id'] = $this->academic_year_id;

        $data['is_attend'] = $status ? 1 : 0;
        $data['modified_at'] = date('Y-m-d H:i:s');
        $data['modified_by'] = logged_in_user_id();

        if ($this->attendance->update('exam_attendances', $data, $condition)) {
            echo TRUE;
        } else {
            echo FALSE;
        }
    }

    
    /*****************Function update_all**********************************
    * @type            : Function
    * @function name   : update_all
    * @description     : Process to update all student exam attendance status                 
    *                        
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function update_all() {

        $status = $this->input->post('status');

        $condition['exam_id'] = $this->input->post('exam_id');
        $condition['class_id'] = $this->input->post('class_id');
        $condition['section_id'] = $this->input->post('section_id');
        $condition['subject_id'] = $this->input->post('subject_id');
        $condition['academic_year_id'] = $this->academic_year_id;

        $data['is_attend'] = $status ? 1 : 0;
        $data['modified_at'] = date('Y-m-d H:i:s');
        $data['modified_by'] = logged_in_user_id();

        if ($this->attendance->update('exam_attendances', $data, $condition)) {
            echo TRUE;
        } else {
            echo FALSE;
        }
    }

}
