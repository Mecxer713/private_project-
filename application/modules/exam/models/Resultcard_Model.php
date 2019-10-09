<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Resultcard_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_student_list($section_id = null){
        
        $this->db->select('E.roll_no, S.name, S.id');
        $this->db->from('enrollments AS E');        
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);       
        $this->db->where('E.section_id', $section_id);
       
        return $this->db->get()->result();        
    }
    
    public function get_final_result($academic_year_id, $class_id, $section_id, $student_id){
        $this->db->select('FR.*, G.name AS grade');
        $this->db->from('final_results AS FR');        
        $this->db->join('grades AS G', 'G.id = FR.grade_id', 'left');
        $this->db->where('FR.academic_year_id', $academic_year_id);
        $this->db->where('FR.class_id', $class_id);
        $this->db->where('FR.section_id', $section_id);
        $this->db->where('FR.student_id', $student_id);
         return $this->db->get()->row();   
    }


}
