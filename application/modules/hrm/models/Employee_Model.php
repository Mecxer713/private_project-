<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Employee_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_employee_list(){
        
        $this->db->select('E.*, U.email, U.role_id, D.name AS designation');
        $this->db->from('employees AS E');
        $this->db->join('users AS U', 'U.id = E.user_id', 'left');
        $this->db->join('designations AS D', 'D.id = E.designation_id', 'left');
        return $this->db->get()->result();
        
    }
    
    public function get_single_employee($id){
        
        $this->db->select('E.*, U.email, U.role_id, R.name AS role, D.name AS designation, SG.grade_name');
        $this->db->from('employees AS E');
        $this->db->join('users AS U', 'U.id = E.user_id', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
        $this->db->join('designations AS D', 'D.id = E.designation_id', 'left');
        $this->db->join('salary_grades AS SG', 'SG.id = E.salary_grade_id', 'left');
        $this->db->where('E.id', $id);
        return $this->db->get()->row();
        
    }
    
     function duplicate_check($email, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('email', $email);
        return $this->db->get('users')->num_rows();            
    }
}
