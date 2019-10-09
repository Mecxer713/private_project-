<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Web.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Web
 * @description     : Manage frontend website.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Web extends CI_Controller {

    public $data = array();
    public $setting = array();
    
    function __construct() {
        parent::__construct();
        $this->load->model('Web_Model', 'web', true);        
        $this->data['settings'] = $this->web->get_single('settings', array('status' => 1));
        $this->data['theme'] = $this->web->get_single('themes', array('is_active' => 1));
        
        if($this->data['settings']){
            $this->setting = $this->data['settings'];
        }
        
        $this->data['footer_pages'] = $this->web->get_list('pages', array('status' => 1, 'page_location'=>'footer'));
        $this->data['header_pages'] = $this->web->get_list('pages', array('status' => 1, 'page_location'=>'header'));
    }

    
    
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Frontend home page" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        $this->data['sliders'] = $this->web->get_list('sliders', array('status' => 1), '', '', '', 'id', 'ASC');
        
        $this->data['notices'] = $this->web->get_notice_list(3);
        $this->data['events'] = $this->web->get_event_list(3);
        $this->data['news'] = $this->web->get_news_list(3);
        $this->data['feedbacks'] = $this->web->get_feedback_list(20);
        
        $this->data['teacher'] = $this->web->get_total_teacher();
        $this->data['student'] = $this->web->get_total_student();
        $this->data['staff'] = $this->web->get_total_staff();
        $this->data['user'] = $this->web->get_total_user();     
        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('home') . ' | ' . SMS);
        $this->layout->view('index', $this->data);
    }
    
    
    /*****************Function news**********************************
    * @type            : Function
    * @function name   : news
    * @description     : Load "news listing" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function news() {

        $this->data['news'] = $this->web->get_news_list(100);
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('news') . ' | ' . SMS);
        $this->layout->view('news', $this->data);
    }
    
    
    /*****************Function news**********************************
    * @type            : Function
    * @function name   : news
    * @description     : Load "news detail" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function news_detail($id) {

        $this->data['news'] = $this->web->get_single_news($id); 
        $this->data['latest_news'] = $this->web->get_news_list(6);
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('news') . ' | ' . SMS);
        $this->layout->view('news_detail', $this->data);
    }
    
    
    
    /*****************Function notice**********************************
    * @type            : Function
    * @function name   : notice
    * @description     : Load "notice listing" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function notice() {

        $this->data['notices'] = $this->web->get_notice_list(50);
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('notice') . ' | ' . SMS);
        $this->layout->view('notice', $this->data);
    }
    
    /*****************Function notice_detail**********************************
    * @type            : Function
    * @function name   : notice_detail
    * @description     : Load "notice_detail" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function notice_detail($id) {

        $this->data['notice'] = $this->web->get_single_notice($id);
        $this->data['notices'] = $this->web->get_notice_list(6);
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('notice') . ' | ' . SMS);
        $this->layout->view('notice_detail', $this->data);
    }
    
    
    /*****************Function holiday**********************************
    * @type            : Function
    * @function name   : holiday
    * @description     : Load "holiday listing" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function holiday() {

        $this->data['holidays'] = $this->web->get_list('holidays', array('status'=>1, 'is_view_on_web'=>1), '', '', '', 'id', 'DESC');
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('holiday') . ' | ' . SMS);
        $this->layout->view('holiday', $this->data);
    }
    
    /***************** Function holiday_detail **********************************
    * @type            : Function
    * @function name   : holiday_detail
    * @description     : Load "holiday_detail" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function holiday_detail($id) {

        $this->data['holiday']  = $this->web->get_single('holidays', array('id'=>$id));
        $this->data['holidays'] = $this->web->get_list('holidays', array('status'=>1, 'is_view_on_web'=>1), '', '10', '', 'id', 'DESC');
        $this->data['list']     = TRUE;
        $this->layout->title($this->lang->line('holiday') . ' | ' . SMS);
        $this->layout->view('holiday_detail', $this->data);
    }
    
    /*****************Function event**********************************
    * @type            : Function
    * @function name   : event
    * @description     : Load "event listing" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function events() {

        $this->data['events'] = $this->web->get_event_list(6);
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('event') . ' | ' . SMS);
        $this->layout->view('event', $this->data);
    }
    
    /*****************Function event_detail**********************************
    * @type            : Function
    * @function name   : event_detail
    * @description     : Load "event_detail" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function event_detail($id){

        $this->data['event'] = $this->web->get_single_event($id);
        $this->data['events'] = $this->web->get_event_list(10);
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('event') . ' | ' . SMS);
        $this->layout->view('event_detail', $this->data);
    }
    
    
    
    /*****************Function gallery**********************************
    * @type            : Function
    * @function name   : gallery
    * @description     : Load "gallery listing" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function galleries() {

        $this->data['galleries'] = $this->web->get_list('galleries', array('status'=>1, 'is_view_on_web'=>1), '', '', '', 'id', 'DESC');
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('media_gallery') . ' | ' . SMS);
        $this->layout->view('gallery', $this->data);
    }

    
    /*****************Function teacher**********************************
    * @type            : Function
    * @function name   : teacher
    * @description     : Load "teacher listing" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function teachers() {

        $this->data['teachers'] = $this->web->get_teacher_list();
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('teacher') . ' | ' . SMS);
        $this->layout->view('teacher', $this->data);
    }
    
    
    /*****************Function staff**********************************
    * @type            : Function
    * @function name   : staff
    * @description     : Load "staff listing" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function staff() {

        $this->data['employees'] = $this->web->get_employee_list();
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('staff') . ' | ' . SMS);
        $this->layout->view('staff', $this->data);
    }
    
    

    
    /*****************Function Page**********************************
    * @type            : Function
    * @function name   : Page
    * @description     : Load "Dynamic Pages" user interface                 
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function page($slug = null) { 
        
     
        $this->data['page'] = $this->web->get_single('pages', array('status' => 1, 'page_slug'=>$slug));

        if(empty($this->data['page'])){
            redirect('/', 'refresh');
        }

        $this->layout->title($this->lang->line('page') . ' | ' . SMS);
        $this->layout->view('page', $this->data);            
         
    }
    
    
    /*****************Function About**********************************
    * @type            : Function
    * @function name   : About
    * @description     : Load "About Us" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function about() {
        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('about') . ' ' . $this->lang->line('school'). ' | ' . SMS);
        $this->layout->view('about', $this->data);
    }
    
    /*****************Function admission**********************************
    * @type            : Function
    * @function name   : admission
    * @description     : Load "admission" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function admission() {
        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('admission_form') . ' | ' . SMS);
        $this->layout->view('admission', $this->data);
    }
    
    
    /*****************Function contact**********************************
    * @type            : Function
    * @function name   : contact
    * @description     : Load "contact" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function contact() {

        if($_POST){
            if($this->_send_email()){
                $this->session->set_flashdata('success', $this->lang->line('email_send_success'));
            }else{
                 $this->session->set_flashdata('error', $this->lang->line('email_send_failed'));
            }
            
            redirect(site_url('contact'));
        }
        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('contact_us') . ' | ' . SMS);
        $this->layout->view('contact', $this->data);
    }
    
        /*     * ***************Function _send_email**********************************
     * @type            : Function
     * @function name   : _send_email
     * @description     : this function used to send recover forgot password email 
     * @param           : $data array(); 
     * @return          : null 
     * ********************************************************** */

    private function _send_email() {

        $this->load->library('email');
        $config['protocol'] = 'sendmail';
        $config['mailpath'] = '/usr/sbin/sendmail';
        $config['charset'] = 'iso-8859-1';
        $config['wordwrap'] = TRUE;
        $config['mailtype'] = 'html';
        $this->email->initialize($config);

        $setting = $this->web->get_single('settings', array('status' => 1));

        $this->email->from($this->input->post('email'), $this->input->post('first_name'));
        $this->email->to($setting->email);
        //$this->email->to('yousuf361@gmail.com');
        $this->email->subject($setting->school_name . ': Contact email from visitor');       

        $message = 'Contact mail from ' . $setting->school_name . ' website.<br/>';          
        $message .= '<br/><br/>';
         $message .= '<br/><br/>';
        $message .= 'Name: ' . $this->input->post('name');
        $message .= '<br/><br/>';      
        $message .= 'Email: ' . $this->input->post('email');
        $message .= '<br/><br/>';
        $message .= 'Phone: ' . $this->input->post('phone');
        $message .= '<br/><br/>';
        $message .= 'Subject: ' . $this->input->post('subject');
        $message .= '<br/><br/>';
        $message .= 'Message: ' . $this->input->post('message');
        $message .= '<br/><br/>';
        $message .= 'Thank you<br/>';

        $this->email->message($message);
        if($this->email->send()){
            return TRUE;
        } else {
            return FALSE;
        }
    }

}
