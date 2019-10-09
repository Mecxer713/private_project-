<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Section_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_section_list($class_id){
        
       if(!$class_id){
           $class_id = $this->session->userdata('class_id');
        }
        
        $this->db->select('S.*, C.name AS class_name, T.name AS teacher');
        $this->db->from('sections AS S');
        $this->db->join('teachers AS T', 'T.id = S.teacher_id', 'left');
        $this->db->join('classes AS C', 'C.id = S.class_id', 'left');
        
        /*if($this->session->userdata('role_id') == TEACHER){
            $this->db->where('S.teacher_id', $this->session->userdata('profile_id'));
        }*/
        
        if($class_id){
            $this->db->where('S.class_id', $class_id); 
        }
        $this->db->order_by('S.class_id', 'ASC');
        
        return $this->db->get()->result();
        
    }
    
    public function get_single_section($id){
        
        $this->db->select('S.*, C.name AS class_name, T.name AS teacher');
        $this->db->from('sections AS S');
        $this->db->join('teachers AS T', 'T.id = S.teacher_id', 'left');
        $this->db->join('classes AS C', 'C.id = S.class_id', 'left');
        $this->db->where('S.id', $id);
        return $this->db->get()->row();
        
    }
    
    function duplicate_check($class_id, $name, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('class_id', $class_id);
        $this->db->where('name', $name);
        return $this->db->get('sections')->num_rows();            
    }
 
}
