<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Examresult_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_student_list($class_id = null, $section_id = null){
        
        $this->db->select('S.*, E.roll_no, C.name AS class_name, AY.session_year');
        $this->db->from('enrollments AS E');        
        $this->db->join('classes AS C', 'C.id = E.class_id', 'left');
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = E.academic_year_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);       
        $this->db->where('E.class_id', $class_id);
        
        if($section_id){
            $this->db->where('E.section_id', $section_id);
        }
       
        return $this->db->get()->result();        
    }

}
