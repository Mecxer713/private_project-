<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Member.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Member
 * @description     : Manage hostel member from the student whose are resident in the hostel.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Member extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Member_Model', 'member', true);
        $this->data['members'] = $this->member->get_hostel_member_list($is_hostel_member = 1);
        $this->data['non_members'] = $this->member->get_hostel_member_list($is_hostel_member = 0);
    }

    
       
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Hostel Hostel List" user interface                 
    *                      
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('hostel') . ' ' . $this->lang->line('member') . ' | ' . SMS);
        $this->layout->view('member/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new Member" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);

        $this->data['hostels'] = $this->member->get_list('hostels', array('status' => 1));
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('hostel') . ' ' . $this->lang->line('non_member') . ' | ' . SMS);
        $this->layout->view('member/index', $this->data);
    }

    
        
    /*****************Function delete**********************************
    * @type            : Function
    * @function name   : delete
    * @description     : delete "Student" data from hostel member list                   
    *                       
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function delete($id = null) {

        check_permission(DELETE);

        $member = $this->member->get_single('hostel_members', array('id' => $id));
        if ($this->member->delete('hostel_members', array('id' => $id))) {

            $this->member->update('students', array('is_hostel_member' => 0), array('user_id' => $member->user_id));
            
            $student = $this->member->get_single('students', array('user_id' => $member->user_id));
            create_log('Has been deleted a Hostel Member : '.$student->name);
            
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('hostel/member/index');
    }


    
    /*****************Function add_to_hostel**********************************
    * @type            : Function
    * @function name   : add_to_hostel
    * @description     : Add student to Hostel via ajax call from user interface                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */
    public function add_to_hostel() {

        $user_id = $this->input->post('user_id');
        $hostel_id = $this->input->post('hostel_id');
        $room_id = $this->input->post('room_id');

        if ($user_id) {

            $member = $this->member->get_single('hostel_members', array('user_id' => $user_id));
            if (empty($member)) {

                $data['user_id'] = $user_id;
                $data['custom_member_id'] = $this->member->get_custom_id('hostel_members', 'HM');
                $data['hostel_id'] = $hostel_id;
                $data['room_id'] = $room_id;
                $data['status'] = 1;
                $data['created_at'] = date('Y-m-d H:i:s');
                $data['created_by'] = logged_in_user_id();
                $data['modified_at'] = date('Y-m-d H:i:s');
                $data['modified_by'] = logged_in_user_id();

                $insert_id = $this->member->insert('hostel_members', $data);
                $this->member->update('students', array('is_hostel_member' => 1), array('user_id' => $user_id));
                
                $member = $this->member->get_single('students', array('user_id' => $user_id));
                create_log('Has been added a Hostel Member : '.$member->name);
                
                echo TRUE;
            } else {
                echo FALSE;
            }
        } else {
            echo FALSE;
        }
    }

}
