<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Profile_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_single_employee($id){
        
        $this->db->select('E.*, U.email, U.role_id, D.name AS designtion');
        $this->db->from('employees AS E');
        $this->db->join('users AS U', 'U.id = E.user_id', 'left');
        $this->db->join('designations AS D', 'D.id = E.designation_id', 'left');
        $this->db->where('E.user_id', $id);
        return $this->db->get()->row();        
    }
    
    
    public function get_student_list($guardian_id){
        
        $this->db->select('S.*, E.roll_no, E.class_id, U.email, U.role_id,  C.name AS class_name, SE.name AS section');
        $this->db->from('enrollments AS E');
        $this->db->join('students AS S', 'S.id = E.student_id', 'left');
        $this->db->join('users AS U', 'U.id = S.user_id', 'left');
        $this->db->join('classes AS C', 'C.id = E.class_id', 'left');
        $this->db->join('sections AS SE', 'SE.id = E.section_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);
        $this->db->where('S.guardian_id', $guardian_id);
        return $this->db->get()->result();
   }
    
    
}
