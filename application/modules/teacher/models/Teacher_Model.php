<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Teacher_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_teacher_list(){
        
        $this->db->select('T.*, U.email, U.role_id');
        $this->db->from('teachers AS T');
        $this->db->join('users AS U', 'U.id = T.user_id', 'left');
        return $this->db->get()->result();
        
    }
    
    public function get_single_teacher($id){
        
        $this->db->select('T.*, U.email, U.role_id, R.name AS role, SG.grade_name');
        $this->db->from('teachers AS T');
        $this->db->join('users AS U', 'U.id = T.user_id', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
        $this->db->join('salary_grades AS SG', 'SG.id = T.salary_grade_id', 'left');
        $this->db->where('T.id', $id);
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
