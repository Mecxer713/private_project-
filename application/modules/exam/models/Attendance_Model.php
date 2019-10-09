<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Attendance_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_student_list($exam_id = null, $class_id = null, $section_id = null, $subject_id = null){
        
        $this->db->select('ES.*, E.roll_no,   C.name AS class_name, S.id AS student_id, S.name AS student_name, S.photo,  S.phone');
        $this->db->from('exam_schedules AS ES');        
        $this->db->join('classes AS C', 'C.id = ES.class_id', 'left');
        $this->db->join('enrollments AS E', 'E.class_id = ES.class_id', 'left');        
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);       
        $this->db->where('E.class_id', $class_id);
        $this->db->where('E.section_id', $section_id);
        $this->db->where('ES.exam_id', $exam_id);
        $this->db->where('ES.subject_id', $subject_id);
       
        return $this->db->get()->result();        
    }

}
