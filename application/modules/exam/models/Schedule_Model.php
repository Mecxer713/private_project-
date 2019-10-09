<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Schedule_Model extends MY_Model {
    
    function __construct() {
        parent::__construct();
    }
    
     public function get_schedule_list($class_id){
        
        if(!$class_id){
           $class_id = $this->session->userdata('class_id');
        } 
       
        $this->db->select('ES.*, E.title, C.name AS class_name, S.name AS subject, AY.session_year');
        $this->db->from('exam_schedules AS ES');
        $this->db->join('classes AS C', 'C.id = ES.class_id', 'left');
        $this->db->join('subjects AS S', 'S.id = ES.subject_id', 'left');
        $this->db->join('exams AS E', 'E.id = ES.exam_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = ES.academic_year_id', 'left');
        $this->db->where('AY.id', $this->academic_year_id);
        
        if($this->session->userdata('role_id') == TEACHER){
            $this->db->where('S.teacher_id', $this->session->userdata('profile_id'));
        }
        
        if($class_id){
            $this->db->where('ES.class_id', $class_id);            
        }
        $this->db->order_by('ES.id', 'DESC');            
        return $this->db->get()->result();
        
    }
     public function get_single_schedule($id){
         
        $this->db->select('ES.*, E.title, C.name AS class_name, S.name AS subject, AY.session_year');
        $this->db->from('exam_schedules AS ES');
        $this->db->join('classes AS C', 'C.id = ES.class_id', 'left');
        $this->db->join('subjects AS S', 'S.id = ES.subject_id', 'left');
        $this->db->join('exams AS E', 'E.id = ES.exam_id', 'left');
        $this->db->join('academic_years AS AY', 'AY.id = ES.academic_year_id', 'left');
        $this->db->where('AY.id', $this->academic_year_id);
        $this->db->where('ES.id', $id);
        return $this->db->get()->row();
        
    }

    
     function duplicate_check($exam_id, $class_id, $subject_id, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        
        $this->db->where('exam_id', $exam_id);
        $this->db->where('class_id', $class_id);
        $this->db->where('subject_id', $subject_id);        
        $this->db->where('academic_year_id', $this->academic_year_id);        
        return $this->db->get('exam_schedules')->num_rows();            
    }
    
     function duplicate_room_check($room_no, $exam_date, $start_time, $id = null ){           
           
        if($id){
            $this->db->where_not_in('id', $id);
        }
        
        $this->db->where('room_no', $room_no);
        $this->db->where('exam_date', $exam_date);
        $this->db->where('start_time', $start_time);        
        $this->db->where('academic_year_id', $this->academic_year_id);
        
        return $this->db->get('exam_schedules')->num_rows();            
    }

}
