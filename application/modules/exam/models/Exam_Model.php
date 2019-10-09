<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Exam_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_exam_list(){
        
        $this->db->select('E.*, AY.session_year');
        $this->db->from('exams AS E');
        $this->db->join('academic_years AS AY', 'AY.id = E.academic_year_id', 'left');
        $this->db->where('AY.id', $this->academic_year_id);
        $this->db->order_by('id', 'DESC');
        return $this->db->get()->result();
        
    }
    
     public function get_single_exam($id){
        
        $this->db->select('E.*, AY.session_year');
        $this->db->from('exams AS E');
        $this->db->join('academic_years AS AY', 'AY.id = E.academic_year_id', 'left');
        $this->db->where('AY.id', $this->academic_year_id);
        $this->db->where('E.id', $id);
        return $this->db->get()->row();
        
    }
    
     function duplicate_check($title, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('title', $title);
        $this->db->where('academic_year_id', $this->academic_year_id);
        return $this->db->get('exams')->num_rows();            
    }

}
