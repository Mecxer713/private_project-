<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Auth_Model
 *
 * @author Nafeesa
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Type_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    function duplicate_check($name, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('name', $name);
        return $this->db->get('certificates')->num_rows();            
    }
    
    public function get_student_list($class_id = null ) {

            $this->db->select('S.*, U.email, U.role_id, U.status AS login_status ');
            $this->db->from('enrollments AS E');
            $this->db->join('students AS S', 'S.id = E.student_id', 'left');
            $this->db->join('users AS U', 'U.id = S.user_id', 'left');
            $this->db->where('E.academic_year_id', $this->academic_year_id);
            
            if($class_id){
                $this->db->where('E.class_id', $class_id);
            }            
             
            return $this->db->get()->result();
    }
    
    public function get_student($student_id = null, $class_id = null ) {

            $this->db->select('S.*, U.email, U.role_id, U.status AS login_status ');
            $this->db->from('enrollments AS E');
            $this->db->join('students AS S', 'S.id = E.student_id', 'left');
            $this->db->join('users AS U', 'U.id = S.user_id', 'left');
            $this->db->where('E.academic_year_id', $this->academic_year_id);
            $this->db->where('S.id', $student_id);
            $this->db->where('E.class_id', $class_id);
                   
             
            return $this->db->get()->row();
    }
}
