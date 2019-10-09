<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Web_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }

    
     public function get_notice_list($limit){
        
        $this->db->select('N.*, RA.name AS notice_for, R.name');
        $this->db->from('notices AS N');
        $this->db->join('roles AS RA', 'RA.id = N.role_id', 'left');
        $this->db->join('users AS U', 'U.id = N.created_by', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
         $this->db->where('N.is_view_on_web', 1);
        $this->db->order_by('N.id', 'DESC');
        $this->db->limit($limit);
        return $this->db->get()->result();
        
    }
     public function get_single_notice($id){
        
        $this->db->select('N.*, RA.name AS notice_for, R.name');
        $this->db->from('notices AS N');
        $this->db->join('roles AS RA', 'RA.id = N.role_id', 'left');
        $this->db->join('users AS U', 'U.id = N.created_by', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
        $this->db->where('N.is_view_on_web', 1);
        $this->db->where('N.id', $id);
        return $this->db->get()->row();            
    }
    
     public function get_event_list($limit){
        
        $this->db->select('E.*, R.name AS event_for');
        $this->db->from('events AS E');
        $this->db->join('roles AS R', 'R.id = E.role_id', 'left');
        $this->db->where('E.is_view_on_web', 1);
        $this->db->order_by('E.id', 'DESC');
        $this->db->limit($limit);
        return $this->db->get()->result();
        
    }
       
    public function get_single_event($id){
        
        $this->db->select('E.*, R.name AS event_for');
        $this->db->from('events AS E');
        $this->db->join('roles AS R', 'R.id = E.role_id', 'left');
        $this->db->where('E.is_view_on_web', 1);
        $this->db->where('E.id', $id);
        return $this->db->get()->row();
        
    }
    
    
    
    
            
    public function get_news_list($limit){
        
        $this->db->select('N.*, R.name');
        $this->db->from('news AS N');     
        $this->db->join('users AS U', 'U.id = N.created_by', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
        $this->db->where('N.is_view_on_web', 1);
        $this->db->order_by('N.id', 'DESC');
        $this->db->limit($limit);
        return $this->db->get()->result();
        
    }
    
      public function get_single_news($id){
        
        $this->db->select('N.*, R.name');
        $this->db->from('news AS N');     
        $this->db->join('users AS U', 'U.id = N.created_by', 'left');
        $this->db->join('roles AS R', 'R.id = U.role_id', 'left');
        $this->db->where('N.is_view_on_web', 1);
        $this->db->where('N.id', $id);
        return $this->db->get()->row();
        
    }
      
    
     public function get_image_list($id){
        
        $this->db->select('GI.*, G.title');
        $this->db->from('gallery_images AS GI');
        $this->db->join('galleries AS G', 'G.id = GI.gallery_id', 'left');
        $this->db->where('GI.gallery_id', $id);
        return $this->db->get()->result();        
    }
    
    
    
    public function get_teacher_list(){
        
        $this->db->select('T.*, U.email, U.role_id');
        $this->db->from('teachers AS T');
        $this->db->join('users AS U', 'U.id = T.user_id', 'left');
        $this->db->where('T.is_view_on_web', 1);
        $this->db->order_by('T.id', 'DESC');
        return $this->db->get()->result();
        
    }
    
     public function get_employee_list(){
        
        $this->db->select('E.*, U.email, U.role_id, D.name AS designation');
        $this->db->from('employees AS E');
        $this->db->join('users AS U', 'U.id = E.user_id', 'left');
        $this->db->join('designations AS D', 'D.id = E.designation_id', 'left');
        $this->db->where('E.is_view_on_web', 1);
        $this->db->order_by('E.id', 'DESC');
        return $this->db->get()->result();
        
    }
    
    
       public function get_feedback_list( $limit){
        
        $this->db->select('GF.*, G.name, G.photo');
        $this->db->from('guardian_feedbacks AS GF');
        $this->db->join('guardians AS G', 'G.id = GF.guardian_id', 'left');
        $this->db->where('GF.is_publish', 1);
        $this->db->order_by('GF.id', 'DESC');
        return $this->db->get()->result();        
    }
    
    public function get_total_teacher(){
        
        $this->db->select('T.id');
        $this->db->from('teachers AS T');
        return $this->db->count_all_results();
    }
    
    public function get_total_student(){
        
        $this->db->select('S.id');
        $this->db->from('students AS S');
        return $this->db->count_all_results();
    }
    
    public function get_total_staff(){
        
        $this->db->select('E.id');
        $this->db->from('employees AS E');
        return $this->db->count_all_results();
    }
    
    public function get_total_user(){
        
        $this->db->select('U.id');
        $this->db->from('users AS U');
        return $this->db->count_all_results();
    }
    
    
  
}
