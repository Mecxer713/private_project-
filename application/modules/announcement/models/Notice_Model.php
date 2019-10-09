<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Notice_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_notice_list(){
        
        $this->db->select('N.*, R.name');
        $this->db->from('notices AS N');
        $this->db->join('roles AS R', 'R.id = N.role_id', 'left');
        $this->db->order_by('N.id', 'DESC');
        return $this->db->get()->result();
        
    }
    
    public function get_single_notice($id){
        
        $this->db->select('N.*, R.name');
        $this->db->from('notices AS N');
        $this->db->join('roles AS R', 'R.id = N.role_id', 'left');
        $this->db->where('N.id', $id);
        return $this->db->get()->row();
        
    }
    
     function duplicate_check($title, $date, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('title', $title);
        $this->db->where('date', date('Y-m-d', strtotime($date)));
        return $this->db->get('notices')->num_rows();            
    }

}
