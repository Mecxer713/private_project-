<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Ajax_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_student_list($class_id){
        $this->db->select('E.roll_no,  S.id, S.user_id, S.name');
        $this->db->from('enrollments AS E');        
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);       
        $this->db->where('E.class_id', $class_id);       
        return $this->db->get()->result();       
    }
    
    public function get_student_list_by_section($section_id = null){
        
        $this->db->select('E.roll_no, S.name, S.id');
        $this->db->from('enrollments AS E');        
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);       
        $this->db->where('E.section_id', $section_id);
       
        if($this->session->userdata('role_id') == GUARDIAN){
            $this->db->where('S.guardian_id', $this->session->userdata('profile_id'));
        }
        
        return $this->db->get()->result();        
    }
    
    public function get_user_list($type) {
        
        if ($type == 'teacher') {
            
            $this->db->select('T.name, T.user_id, T.responsibility AS designation, SG.grade_name, U.email, U.role_id');
            $this->db->from('teachers AS T');
            $this->db->join('users AS U', 'U.id = T.user_id', 'left');  
            $this->db->join('salary_grades AS SG', 'SG.id = T.salary_grade_id', 'left');
            $this->db->where('T.salary_grade_id >', 0);
            $this->db->order_by('T.id', 'ASC');
            return $this->db->get()->result();
            
        } elseif ($type == 'employee') { 
            
            $this->db->select('E.name, E.user_id, SG.grade_name, U.email, U.role_id, D.name AS designation');
            $this->db->from('employees AS E');
            $this->db->join('users AS U', 'U.id = E.user_id', 'left');
            $this->db->join('designations AS D', 'D.id = E.designation_id', 'left'); 
            $this->db->join('salary_grades AS SG', 'SG.id = E.salary_grade_id', 'left'); 
            $this->db->where('E.salary_grade_id >', 0);
            $this->db->order_by('E.id', 'ASC');
            return $this->db->get()->result();
            
        } else {
            return array();
        }
    }
      
    
}
