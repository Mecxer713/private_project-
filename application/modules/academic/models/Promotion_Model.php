<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Promotion_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
      
     public function get_student_list($current_session_id = null, $class_id = null ){
        
        $this->db->select('S.*, E.roll_no');
        $this->db->distinct('FR.student_id');
        $this->db->from('enrollments AS E');        
        //$this->db->join('classes AS C', 'C.id = E.class_id', 'left');
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->join('final_results AS FR', 'FR.class_id = E.class_id', 'left');
        $this->db->where('E.academic_year_id', $current_session_id);       
        $this->db->where('FR.academic_year_id', $current_session_id);       
        $this->db->where('E.class_id', $class_id);       
        $this->db->where('FR.class_id', $class_id);       
        $this->db->order_by('FR.avg_grade_point', 'DESC');       
        return $this->db->get()->result();          
         //echo $this->db->last_query();
    }

}
