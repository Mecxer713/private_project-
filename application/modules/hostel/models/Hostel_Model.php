<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Hostel_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_hostel_list(){
        
        $this->db->select('H.*');
        $this->db->from('hostels AS H');
        return $this->db->get()->result();
        
    }
    
    function duplicate_check($name, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('name', $name);
        return $this->db->get('hostels')->num_rows();            
    }
}
