<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * ***************Dashboard.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Dashboard
 * @description     : This class used to showing basic statistics of whole application 
 *                    for logged in user.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers    
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Dashboard extends MY_Controller {

    public function __construct() {

        parent::__construct();
        $this->load->model('Dashboard_Model', 'dashboard', true);
    }

    public $data = array();

    /*     * ***************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : Default function, Load logged in user dashboard stattistics  
     * @param           : null 
     * @return          : null 
     * ********************************************************** */

    public function index() {
        
        
      $this->data['year_session'] = $this->dashboard->get_single('academic_years', array('is_running' => 1));

        $this->data['news'] = $this->dashboard->get_list('news', array('status' => 1), '', '5', '', 'id', 'ASC');
        $this->data['notices'] = $this->dashboard->get_list('notices', array('status' => 1), '', '5', '', 'id', 'ASC');
        $this->data['events'] = $this->dashboard->get_list('events', array('status' => 1), '', '', '', 'id', 'ASC');
        $this->data['holidays'] = $this->dashboard->get_list('holidays', array('status' => 1), '', '', '', 'id', 'ASC');
        $this->data['theme'] = $this->dashboard->get_single('themes', array('status' => 1, 'is_active' => 1));
        $this->data['users'] = $this->dashboard->get_user_by_role();
        $this->data['students'] = $this->dashboard->get_student_by_class();

        $this->data['total_student'] = $this->dashboard->get_total_student();
        $this->data['total_guardian'] = $this->dashboard->get_total_guardian();
        $this->data['total_teacher'] = $this->dashboard->get_total_teacher();
        $this->data['total_employee'] = $this->dashboard->get_total_employee();
        $this->data['total_expenditure'] = $this->dashboard->get_total_expenditure();
        $this->data['total_income'] = $this->dashboard->get_total_income();

        $this->data['sents'] = $this->dashboard->get_message_list($type = 'sent');
        $this->data['drafts'] = $this->dashboard->get_message_list($type = 'draft');
        $this->data['trashs'] = $this->dashboard->get_message_list($type = 'trash');
        $this->data['inboxs'] = $this->dashboard->get_message_list($type = 'inbox');
        $this->data['new'] = $this->dashboard->get_message_list($type = 'new');
        
        if($this->session->userdata('role_id') == STUDENT){
            $this->data['class_name'] = $this->db->get_where('classes', array('id'=>$this->session->userdata('class_id')))->row()->name;
        }
        
        $this->layout->title($this->lang->line('dashboard') . ' | ' . SMS);
        $this->layout->view('dashboard', $this->data);
    }

}
