<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Syllabus_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_syllabus_list($class_id = null ){
        
        if(!$class_id){
           $class_id = $this->session->userdata('class_id');
        }
         
        $this->db->select('SY.*, C.name AS class_name, S.name AS subject, AY.session_year');
        $this->db->from('syllabuses AS SY');
        $this->db->join('classes AS C', 'C.id = SY.class_id', 'left');
        $this->db->join('subjects AS S', 'S.id = SY.subject_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = SY.academic_year_id', 'left');
        
        if($this->session->userdata('role_id') == TEACHER){
            $this->db->where('S.teacher_id', $this->session->userdata('profile_id'));
        }
        
        if($class_id){
            $this->db->where('SY.class_id', $class_id);
        }
       
        return $this->db->get()->result();
        
    }
    
    public function get_single_syllabus($id){
        
        $this->db->select('SY.*, C.name AS class_name, S.name AS subject, AY.session_year');
        $this->db->from('syllabuses AS SY');
        $this->db->join('classes AS C', 'C.id = SY.class_id', 'left');
        $this->db->join('subjects AS S', 'S.id = SY.subject_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = SY.academic_year_id', 'left');
        $this->db->where('SY.id', $id);
        return $this->db->get()->row();
        
    } 
}
