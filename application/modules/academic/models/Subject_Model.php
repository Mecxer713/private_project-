<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Subject_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_subject_list($class_id = null ){
       
        if(!$class_id){
           $class_id = $this->session->userdata('class_id');
        }
        
        $this->db->select('S.*, C.name AS class_name, T.name AS teacher');
        $this->db->from('subjects AS S');
        $this->db->join('teachers AS T', 'T.id = S.teacher_id', 'left');
        $this->db->join('classes AS C', 'C.id = S.class_id', 'left');
        
        if($this->session->userdata('role_id') == TEACHER){
            $this->db->where('S.teacher_id', $this->session->userdata('profile_id'));
        }
        
        if($class_id){
            $this->db->where('S.class_id', $class_id);
        }
       
        return $this->db->get()->result();
        
    }
    
    public function get_single_subject($id){
        
        $this->db->select('S.*, C.name AS class_name, T.name AS teacher');
        $this->db->from('subjects AS S');
        $this->db->join('teachers AS T', 'T.id = S.teacher_id', 'left');
        $this->db->join('classes AS C', 'C.id = S.class_id', 'left');
        $this->db->where('S.id', $id);
        return $this->db->get()->row();
        
    }
    
    function duplicate_on_create($class_id, $name){           
        
            $data = array(
                'class_id' => $class_id,
                'name' => $name
            );
            
            $this->db->where($data);
            return $this->db->get('subjects')->num_rows();            
    }
    
    function duplicate_on_update($id, $class_id, $name){           
        
            $data = array(
                'class_id' => $class_id,
                'name' => $name
            );
            
            $this->db->where_not_in('id', $id);
            $this->db->where($data);
            return $this->db->get('subjects')->num_rows();            
    }

}
