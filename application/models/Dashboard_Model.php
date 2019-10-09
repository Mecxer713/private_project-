<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_message_list($type){
        
        $this->db->select('MR.*, M.*');
        $this->db->from('message_relationships AS MR');
        $this->db->join('messages AS M', 'M.id = MR.message_id', 'left');
        
        if($type == 'draft'){
            $this->db->where('MR.status', 1);
            $this->db->where('MR.is_draft', 1);
            $this->db->where('MR.owner_id', logged_in_user_id());
            $this->db->where('MR.sender_id', logged_in_user_id());
        }
        if($type == 'inbox'){
            $this->db->where('MR.status', 1);
            $this->db->where('MR.owner_id', logged_in_user_id());
            $this->db->where('MR.receiver_id', logged_in_user_id());
        }
        if($type == 'new'){
            $this->db->where('MR.status', 1);
            $this->db->where('MR.owner_id', logged_in_user_id());
            $this->db->where('MR.is_read', 0);
            $this->db->where('MR.receiver_id', logged_in_user_id());
        }
        if($type == 'trash'){
            $this->db->where('MR.status', 1);
            $this->db->where('MR.is_trash', 1);
            $this->db->where('MR.owner_id', logged_in_user_id());
        }
        if($type == 'sent'){
            $this->db->where('MR.status', 1);
            $this->db->where('MR.is_draft', 0);
            $this->db->where('MR.is_trash', 0);
            $this->db->where('MR.sender_id', logged_in_user_id());
            $this->db->where('MR.owner_id', logged_in_user_id());
        }
        
        return $this->db->get()->result();        
    }
    
    public function get_user_by_role(){
        
       $this->db->select('COUNT(U.role_id) AS total_user, R.name');
       $this->db->from('users AS U');
       $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
       $this->db->group_by('U.role_id'); 
       $this->db->where('U.status', 1);
       return $this->db->get()->result();    
    }
    
    public function get_student_by_class(){
        
       $this->db->select('COUNT(E.student_id) AS total_student, C.name AS class_name');
       $this->db->from('enrollments AS E');
       $this->db->join('classes AS C', 'C.id = E.class_id', 'left');
       $this->db->group_by('E.class_id'); 
       $this->db->where('E.status', 1);
       $this->db->where('E.status', 1);
       return $this->db->get()->result();    
    }
    
    public function get_total_student(){
        
       $this->db->select('COUNT(E.student_id) AS total_student');
       $this->db->from('enrollments AS E');
       $this->db->join('classes AS C', 'C.id = E.class_id', 'left');
       $this->db->where('E.status', 1);       
       $this->db->where('E.academic_year_id', $this->academic_year_id);
       
        if($this->session->userdata('role_id') == STUDENT){
            $this->db->where('E.class_id', $this->session->userdata('class_id'));
        }
       return $this->db->get()->row()->total_student;  
       
    }
    public function get_total_guardian(){
        
       $this->db->select('COUNT(G.id) AS total_guardian');
       $this->db->from('guardians AS G');
       $this->db->where('G.status', 1);       
       return $this->db->get()->row()->total_guardian;    
    }
    public function get_total_teacher(){
        
       $this->db->select('COUNT(G.id) AS total_teacher');
       $this->db->from('teachers AS G');
       $this->db->where('G.status', 1);
       return $this->db->get()->row()->total_teacher;    
    }
    public function get_total_employee(){
        
       $this->db->select('COUNT(E.id) AS total_employee');
       $this->db->from('employees AS E');
       $this->db->where('E.status', 1);
       return $this->db->get()->row()->total_employee;    
    }

    
    public function get_total_expenditure(){
        
       $this->db->select('SUM(E.amount) AS total_expenditure');
       $this->db->from('expenditures AS E');
       $this->db->where('E.academic_year_id', $this->academic_year_id);
       return $this->db->get()->row()->total_expenditure;    
    }
    
    public function get_total_income(){
        
       $this->db->select('SUM(I.net_amount) AS total_income');
       $this->db->from('invoices AS I');
       $this->db->where('I.academic_year_id', $this->academic_year_id);
       return $this->db->get()->row()->total_income;    
    }
    
}
