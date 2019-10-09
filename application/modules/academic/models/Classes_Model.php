<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Classes_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_class_list(){
        
        $this->db->select('C.*, T.name AS teacher');
        $this->db->from('classes AS C');
        $this->db->join('teachers AS T', 'T.id = C.teacher_id', 'left');
        return $this->db->get()->result();
        
    }
    

    
    function duplicate_check($name, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('name', $name);
        return $this->db->get('classes')->num_rows();            
    }
}
