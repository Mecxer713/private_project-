<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Smstemplate_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
    public function get_template_list(){
        $this->db->select('T.*, R.name AS receiver_type');
        $this->db->from('sms_templates AS T');
        $this->db->join('roles AS R', 'R.id = T.role_id', 'left');

        return $this->db->get()->result();    
    }
        
    function duplicate_check($title, $role_id, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('title', $title);
        $this->db->where('role_id', $role_id);
        return $this->db->get('sms_templates')->num_rows();            
    }
}
