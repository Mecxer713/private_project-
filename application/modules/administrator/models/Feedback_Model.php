<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Feedback_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_feedback_list(){
        
        $this->db->select('GF.*');
        $this->db->from('guardian_feedbacks AS GF');   
        return $this->db->get()->result();        
    }
    
    public function get_single_feedback($id){
        
        $this->db->select('GF.*');
        $this->db->from('guardian_feedbacks AS GF');
        $this->db->where('GF.id', $id);        
        return $this->db->get()->row();
        
    }
}