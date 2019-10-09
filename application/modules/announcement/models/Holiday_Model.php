<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Holiday_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_holiday_list(){
        
        $this->db->select('H.*');
        $this->db->from('holidays AS H');
        $this->db->order_by('H.id', 'DESC');
        return $this->db->get()->result();
        
    }
    
    public function get_single_holiday($id){
        
        $this->db->select('H.*');
        $this->db->from('holidays AS H');
        $this->db->where('H.id', $id);
        return $this->db->get()->row();
        
    }
    
     function duplicate_check($title, $date_from, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('title', $title);
        $this->db->where('date_from', date('Y-m-d', strtotime($date_from)));
        return $this->db->get('holidays')->num_rows();            
    }

}
