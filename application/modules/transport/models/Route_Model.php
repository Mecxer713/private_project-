<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Route_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_vehicle_list($route_id = null ){
        $route = $this->route->get_single('routes', array('id' => $route_id));
        if(isset($route->vehicle_ids) && $route->vehicle_ids != '' && $route_id){
            //$sql = "SELECT * FROM `vehicles` WHERE `id` IN($route->vehicle_ids) OR is_allocated = 0";
            $sql = "SELECT * FROM `vehicles` WHERE `id` IN($route->vehicle_ids) OR status = 1";
        } else {
            //$sql = "SELECT * FROM `vehicles` WHERE is_allocated = 0";
            $sql = "SELECT * FROM `vehicles` WHERE status = 1";
        }
        return $this->db->query($sql)->result();
    }

    function duplicate_check($number, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        $this->db->where('title', $number);
        return $this->db->get('routes')->num_rows();            
    }

}
