<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Member_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
     public function get_hostel_member_list($is_hostel_member = 1) {

        $this->db->select('ST.*, HM.id AS hm_id, H.name AS hostel_name, R.room_no, R.room_type, R.cost, E.roll_no, C.name AS class_name, S.name AS section');
        $this->db->from('students AS ST');
        $this->db->join('enrollments AS E', 'E.student_id = ST.id', 'left');
        $this->db->join('classes AS C', 'C.id = E.class_id', 'left');
        $this->db->join('sections AS S', 'S.id = E.section_id', 'left');
        $this->db->join('hostel_members AS HM', 'HM.user_id = ST.user_id', 'left');
        $this->db->join('hostels AS H', 'H.id = HM.hostel_id', 'left');
        $this->db->join('rooms AS R', 'R.id = HM.room_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);
        $this->db->where('ST.is_hostel_member', $is_hostel_member);
        $this->db->order_by('HM.id', 'DESC');
        return $this->db->get()->result();
    }
}
