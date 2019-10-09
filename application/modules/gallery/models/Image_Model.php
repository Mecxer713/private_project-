<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Image_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
      
    public function get_image_list(){
        
        $this->db->select('GI.*, G.title');
        $this->db->from('gallery_images AS GI');
        $this->db->join('galleries AS G', 'G.id = GI.gallery_id', 'left');
        return $this->db->get()->result();        
    }
    
    public function get_single_image($id){
        
        $this->db->select('GI.*, G.title');
        $this->db->from('gallery_images AS GI');
        $this->db->join('galleries AS G', 'G.id = GI.gallery_id', 'left');
        $this->db->where('GI.id', $id);
        return $this->db->get()->row();        
    }

}