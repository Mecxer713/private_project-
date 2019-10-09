<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Guardian_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    
    public function get_guardian_list(){
        
        if($this->session->userdata('role_id') == STUDENT){
            
            $profile_id = $this->session->userdata('profile_id');
            $student = $this->get_single('students', array('id'=>$profile_id));
            $this->db->select('G.*, U.email, U.role_id');
            $this->db->from('guardians AS G');
            $this->db->join('users AS U', 'U.id = G.user_id', 'left');
            $this->db->where('G.id', $student->guardian_id);
            
        }else{            
            $this->db->select('G.*, U.email, U.role_id');
            $this->db->from('guardians AS G');
            $this->db->join('users AS U', 'U.id = G.user_id', 'left');
        }
        return $this->db->get()->result();
        
    }
    
    public function get_single_guardian($id){
        
        $this->db->select('G.*, U.email, U.role_id, R.name as role');
        $this->db->from('guardians AS G');
        $this->db->join('users AS U', 'U.id = G.user_id', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
        $this->db->where('G.id', $id);
        return $this->db->get()->row();
        
    }
    
    function duplicate_check($email, $id = null) {

        if ($id) {
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('email', $email);
        return $this->db->get('users')->num_rows();
    }
    
    public function get_invoice_list($guardian_id = null){ 
        
        $this->db->select('I.*, IH.title AS head, S.name AS student_name, AY.session_year, C.name AS class_name');
        $this->db->from('invoices AS I');        
        $this->db->join('classes AS C', 'C.id = I.class_id', 'left');
        $this->db->join('students AS S', 'S.id = I.student_id', 'left');
        $this->db->join('income_heads AS IH', 'IH.id = I.income_head_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = I.academic_year_id', 'left');        
        $this->db->where('I.invoice_type !=', 'income'); 
        $this->db->where('I.paid_status !=', 'paid'); 
        $this->db->where('S.guardian_id', $guardian_id);       
        $this->db->order_by('I.id', 'DESC'); 
       
        return $this->db->get()->result();        
        //echo $this->db->last_query();
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
