<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class News_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
        
     function duplicate_check($title, $date, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('title', $title);
        $this->db->where('date', date('Y-m-d', strtotime($date)));
        return $this->db->get('news')->num_rows();            
    }

}
