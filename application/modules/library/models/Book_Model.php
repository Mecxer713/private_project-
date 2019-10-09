<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Book_Model extends MY_Model {

    function __construct() {
        parent::__construct();
    }

    public function get_book_issued_list() {

        $user_id = '';
        if($this->session->userdata('role_id') == STUDENT){
            $user_id = $this->session->userdata('user_id');
        }
        $this->db->select('B.*, BI.id AS issue_id, BI.is_returned, BI.due_date, BI.return_date, BI.issue_date, S.name, S.photo, S.phone');
        $this->db->from('book_issues AS BI');
        $this->db->join('books AS B', 'B.id = BI.book_id', 'left');
        $this->db->join('library_members AS LM', 'LM.id = BI.library_member_id', 'left');
        $this->db->join('students AS S', 'S.user_id = LM.user_id', 'left');
        if($user_id){
            $this->db->where('S.user_id', $user_id);
        }
        $this->db->order_by('BI.is_returned', 'ASC');
        return $this->db->get()->result();
    }

    public function get_library_member_list($is_library_member = 1) {

        $this->db->select('ST.*, LM.id AS lm_id, LM.custom_member_id, E.roll_no, C.name AS class_name, S.name AS section');
        $this->db->from('students AS ST');
        $this->db->join('enrollments AS E', 'E.student_id = ST.id', 'left');
        $this->db->join('classes AS C', 'C.id = E.class_id', 'left');
        $this->db->join('sections AS S', 'S.id = E.section_id', 'left');
        $this->db->join('library_members AS LM', 'LM.user_id = ST.user_id', 'left');
        $this->db->where('E.academic_year_id', $this->academic_year_id);
        $this->db->where('ST.is_library_member', $is_library_member);
        $this->db->order_by('LM.id', 'DESC');
        return $this->db->get()->result();
    }
    
    public function update_qty($book_id, $type = null){
        
        if($type == 'issue'){
            $sql = "UPDATE books SET qty = qty - 1 WHERE id = $book_id";
        }else{
            $sql = "UPDATE books SET qty = qty + 1 WHERE id = $book_id";
        }
        
        $this->db->query($sql);
    }

}
