<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Assignment_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_assignment_list($class_id = null ){
         
        $this->db->select('A.*, C.name AS class_name, S.name AS subject, AY.session_year');
        $this->db->from('assignments AS A');
        $this->db->join('classes AS C', 'C.id = A.class_id', 'left');
        $this->db->join('subjects AS S', 'S.id = A.subject_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = A.academic_year_id', 'left');
        $this->db->where('A.academic_year_id', $this->academic_year_id);
        if($class_id){
             $this->db->where('A.class_id', $class_id);
        }        
        $this->db->order_by('A.id', 'DESC');
        
        return $this->db->get()->result();
        
    }
    
    public function get_single_assignment($id){
        
        $this->db->select('A.*, C.name AS class_name, S.name AS subject');
        $this->db->from('assignments AS A');
        $this->db->join('classes AS C', 'C.id = A.class_id', 'left');
        $this->db->join('subjects AS S', 'S.id = A.subject_id', 'left');
        $this->db->where('A.id', $id);
        return $this->db->get()->row();        
    } 
}
