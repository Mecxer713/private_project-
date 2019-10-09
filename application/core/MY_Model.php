<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class MY_Model extends CI_Model {

    function __construct() {

        parent::__construct();
    }

    // insert new data

    function insert($table_name, $data_array) {

        $this->db->insert($table_name, $data_array);

        return $this->db->insert_id();
    }

    // insert new data

    function insert_batch($table_name, $data_array) {

        $this->db->insert_batch($table_name, $data_array);

        return $this->db->insert_id();
    }

    // update data by index

    function update($table_name, $data_array, $index_array) {

        $this->db->update($table_name, $data_array, $index_array);

        return $this->db->affected_rows();
    }

    // delete data by index

    function delete($table_name, $index_array) {
        $this->db->delete($table_name, $index_array);

        return $this->db->affected_rows();
    }

    public function get_list($table_name, $index_array, $columns = null, $limit = null, $offset = 0, $order_field = null, $order_type = null) {

        if ($columns)
            $this->db->select($columns);

        if ($limit)
            $this->db->limit($limit, $offset);

        if ($order_type) {
            $this->db->order_by($order_field, $order_type);
        } else {
            $this->db->order_by('id', 'DESC');
        }

        return $this->db->get_where($table_name, $index_array)->result();
    }

    // get data list by index order

    function get_list_order($table_name, $index_array, $order_array, $limit = null) {

        if ($limit) {

            $this->db->limit($limit);
        }

        if ($order_array) {

            $this->db->order_by($order_array['by'], $order_array['type']);
        } else {

            $this->db->order_by('created', 'desc');
        }

        return $this->db->get_where($table_name, $index_array)->result();
    }

    // get single data by index

    function get_single($table_name, $index_array, $columns = null) {

        if ($columns)
            $this->db->select($columns);

        $this->db->order_by('id', 'desc');
        $this->db->limit(1);

        $row = $this->db->get_where($table_name, $index_array)->row();

        return $row;
    }

    function get_single_random($table_name, $index_array, $columns = null) {

        if ($columns)
            $this->db->select($columns);

        $this->db->order_by('rand()');
        $this->db->limit(1);
        $row = $this->db->get_where($table_name, $index_array)->row();
        return $row;
    }

    // get number of rows in database

    function count_all($table_name, $index_array = null) {

        if ($index_array) {
            $this->db->where($index_array);
        }
        return $this->db->count_all_results($table_name);
    }

    // get data with paging

    function get_paged_list($table_name, $index_array, $url, $segment, $offset = 0, $order_by = null) {

        $result = array('rows' => array(), 'total_rows' => 0);



        $this->load->library('pagination');



        $limit = $this->config->item('admin_per_page');



        $this->db->where($index_array);



        $this->db->order_by('id', 'desc');


        /* if($order_by){
          $this->db->order_by('sort_order', 'ASC');
          }else{
          $this->db->order_by('modified', 'desc');
          } */


        $result['rows'] = $this->db->get($table_name, $limit, $offset)->result();


        $this->db->where($index_array);

        $result['total_rows'] = $total_rows = $this->db->count_all_results($table_name);


        $config['uri_segment'] = $segment;

        $config['base_url'] = site_url() . $url;

        $config['total_rows'] = $total_rows;

        $config['per_page'] = $this->config->item('admin_per_page');



        $this->pagination->initialize($config);

        $result['pagination'] = $this->pagination->create_links();



        return $result;
    }

// get data with paging

    function get_paged_list_order($table_name, $index_array, $order_array, $limit = 10, $offset = 0) {

        $result = array('rows' => array(), 'total_rows' => 0);



        if ($order_array) {

            $this->db->order_by($order_array['by'], $order_array['type']);
        } else {

            $this->db->order_by('created', 'desc');
        }



        $this->db->where($index_array);

        $result['rows'] = $this->db->get($table_name, $limit, $offset)->result();



        $this->db->where($index_array);

        $result['total_rows'] = $this->db->count_all_results($table_name);



        return $result;
    }

    public function send_email($mail_info) {



        $this->load->library('email');



        $config['mailtype'] = 'html';

        $config['charset'] = 'iso-8859-1';

        $config['wordwrap'] = TRUE;



        $this->email->initialize($config);



        $from = $mail_info['from'] ? $mail_info['from'] : '';

        $from_name = $mail_info['from_name'] ? $mail_info['from_name'] : '';

        $to = $mail_info['to'] ? $mail_info['to'] : 'yousuf361@gmail.com';

        $cc = $mail_info['cc'] ? $mail_info['cc'] : '';

        $bcc = $mail_info['bcc'] ? $mail_info['bcc'] : '';

        $subject = $mail_info['subject'] ? $mail_info['subject'] : '';

        $message = $mail_info['message'] ? $mail_info['message'] : '';



        $this->email->from($from, $from_name);

        $this->email->to($to);

        $this->email->cc($cc);

        $this->email->bcc($bcc);

        $this->email->subject($subject);

        $this->email->message($message);



        return ($this->email->send()) ? TRUE : FALSE;



        //echo $this->email->print
    }

    // get single data by index

    function get_single_order($table_name, $index_array, $order_array, $columns = null) {

        if ($columns)
            $this->db->select($columns);

        $this->db->limit(1);

        if ($order_array) {

            $this->db->order_by($order_array['by'], $order_array['type']);
        } else {

            $this->db->order_by('created', 'desc');
        }

        $row = $this->db->get_where($table_name, $index_array)->row();

        return $row;
    }


    public function get_table_fields($table) {

        return $this->db->list_fields($table);
    }
    
    public function create_user(){
        
        $data = array();
        $data['role_id']    = $this->input->post('role_id');
        $data['password']   = md5($this->input->post('password'));
        $data['temp_password'] = base64_encode($this->input->post('password'));
        $data['email']      = $this->input->post('email');
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['created_by'] = logged_in_user_id();
        $data['modified_at'] = date('Y-m-d H:i:s');
        $data['modified_by'] = logged_in_user_id();
        $data['status']     = 1; // by default would not be able to login
        $this->db->insert('users', $data);
        $user_id = $this->db->insert_id();
        
        // Process Sending email/ sms with login info
        $this->_send_email();        
        $this->_send_sms();       
        
        return $user_id;
    }
    
    
    public function _send_email() {

        if($this->input->post('email')){         
     
            $this->load->library('email');
            $config['protocol'] = 'sendmail';
            $config['mailpath'] = '/usr/sbin/sendmail';
            $config['charset'] = 'iso-8859-1';
            $config['wordwrap'] = TRUE;
            $config['mailtype'] = 'html';
            $this->email->initialize($config);
            
            $to         = $this->input->post('email');
            $password   = $this->input->post('password');

            $setting = $this->db->get_where('settings', array('status'=>1))->row();
            $from_email = $setting->email ? $setting->email : 'info@'.$_SERVER['HTTP_HOST'];
            $from_name  = $setting->school_name;
           
            
            $this->email->from($from_email, $from_name);
            $this->email->to($to);
            $this->email->subject('Your login credentials on ' .$from_name);       

            $message = 'Hi '. $this->input->post('name');
            $message .= '<br/><br/>';
            $message .= 'Following is your ' . $from_name . ' login credentials.<br/>';
            $message .= '<br/><br/>';
            $message .= 'Your Email : ' . $to;
            $message .= '<br/>';
            $message .= 'Your Password : ' . $password;
            $message .= '<br/>';
            $message .= 'Login url : <a href="'.site_url('login').'"> Login Here </a>';      
            $message .= '<br/><br/>';

            $message .= 'If you are not right person, Plesae ignore this email.<br/><br/>';
            $message .= 'Thank you<br/>';
            $message .= $from_name;

            $this->email->message($message);
            $this->email->send();        
        }
    }
    
    public function _send_sms(){
        
        if($this->input->post('phone')){ 

            $this->load->library('twilio');
            $this->load->library('clickatell');
            $this->load->library('bulk');
            $this->load->library('msg91');
            $this->load->library('plivo');
            $this->load->library('smscountry');
            $this->load->library('textlocalsms');
            
            // get active sms gateway 
            $sms_gateway = $this->db->get_where('sms_settings', array('status' => 1))->row(); 
            $gateway = '';
            
            if ($sms_gateway->clickatell_status) {
                $gateway = 'clicktell';
            }
            if ($sms_gateway->twilio_status) {
                $gateway = 'twilio';
            }
            if ($sms_gateway->bulk_status) {
                $gateway = 'bulk';
            }
            if ($sms_gateway->msg91_status) {
                $gateway = 'msg91';
            }
            if ($sms_gateway->plivo_status) {
                $gateway = 'plivo';
            }
            if ($sms_gateway->textlocal_status) {
                $gateway = 'text_local';
            }
            if ($sms_gateway->smscountry_status) {
                $gateway = 'sms_country';
            }
            
            if($this->sms_gateway($gateway)){
                
                $phone = '+'.$this->input->post('phone');
                $email   = $this->input->post('email');
                $password   = $this->input->post('password');
                $setting =  $this->db->get_where('settings', array('status'=>1))->row(); 
            
                $message = 'Hi '.$this->input->post('name'). ', Your '.$setting->school_name .' login info: Email:' .$email . ' Password: '.$password;
                $this-> _send($gateway, $phone, $message);
            }            
        }
    }
    
    public function sms_gateway($gateway) {

        if ($gateway == "clicktell") {
            if ($this->clickatell->ping() == TRUE) {
                return TRUE;
            } else {
                return FALSE;
            }
        } elseif ($gateway == 'twilio') {            
            $get = $this->twilio->get_twilio();
            $ApiVersion = $get['version'];
            $AccountSid = $get['accountSID'];
            $check = $this->twilio->request("/$ApiVersion/Accounts/$AccountSid/Calls");

            if ($check->IsError) {
                return FALSE;
            }
            return TRUE;
        } elseif ($gateway == 'bulk') {
            if ($this->bulk->ping() == TRUE) {
                return TRUE;
            } else {
                return FALSE;
            }
        } elseif ($gateway == 'msg91') {
            return true;
        } elseif ($gateway == 'plivo') {
            return true;
        } elseif ($gateway == 'text_local') {
            return true;       
        } elseif ($gateway == 'sms_country') {
            return true;
        }
    }

    public function _send($sms_gateway, $phone, $message) {

        if ($sms_gateway == "clicktell") {
            
            $this->clickatell->send_message($phone, $message);
        } elseif ($sms_gateway == 'twilio') {
            
            $get = $this->twilio->get_twilio();
            $from = $get['number'];            
            $response = $this->twilio->sms($from, $phone, $message);          
        } elseif ($sms_gateway == 'bulk') {

            //https://github.com/anlutro/php-bulk-sms     
            
            $this->bulk->send($phone, $message);
        } elseif ($sms_gateway == 'msg91') {
            
            $response = $this->msg91->send($phone, $message);
        } elseif ($sms_gateway == 'plivo') {
            
            $response = $this->twilio->send($phone, $message);
        }elseif ($sms_gateway == 'sms_country') { 
            
            $response = $this->smscountry->sendSMS($phone, $message);            
        } elseif ($sms_gateway == 'text_local') {  
            
            $response = $this->textlocalsms->sendSms(array($phone), $message);
        }
    }
        
    
    public function create_log($activity = null){
        
        $data = array();
        
        $data['user_id']    = logged_in_user_id();
        $data['role_id']    = logged_in_role_id();
        $data['ip_address'] = $_SERVER['REMOTE_ADDR'];
        $data['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
        $data['activity']   = $activity;
        $data['status']     = 1; 
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['created_by'] = logged_in_user_id();
        $data['modified_at'] = date('Y-m-d H:i:s');
        $data['modified_by'] = logged_in_user_id();
        
        $this->db->insert('activity_logs', $data);       
    }
    
   public function get_custom_id($table, $prefix)
   {
      $max_id = '';
      $this->db->select_max('id');
      $max_id = $this->db->get($table)->row()->id;
      
      if(isset($max_id) && $max_id > 0)
      {
        $max_id = $max_id+1;
      }else{
          $max_id = 1;
      }
      
      if(!$max_id){
        $max_id = '0000'.$max_id;
      }elseif($max_id > 0 && $max_id < 10){
          $max_id = '0000'.$max_id;      
      }elseif($max_id >= 10 && $max_id < 100){
          $max_id = '000'.$max_id;
      }elseif($max_id >= 100 && $max_id < 1000){
          $max_id = '00'.$max_id;
      }elseif($max_id >= 1000 && $max_id < 10000){
          $max_id = '0'.$max_id;
      }else{
          $max_id = $max_id;
      }      
      return $prefix.$max_id;
   }    
  
}

?>