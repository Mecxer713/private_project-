<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Feetype_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
     
    public function get_fee_type(){
        
        $this->db->select('IH.*');
        $this->db->from('income_heads AS IH'); 
        $this->db->where('IH.head_type', 'fee'); 
        $this->db->or_where('IH.head_type', 'hostel'); 
        $this->db->or_where('IH.head_type', 'transport'); 
             
        return $this->db->get()->result();  
    }
            
    function duplicate_check($field, $value, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where($field, $value);
        return $this->db->get('income_heads')->num_rows();            
    }

}
