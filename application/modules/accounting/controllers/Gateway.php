<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Gateway.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Gateway
 * @description     : Process payment gateway notiication.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */
class Gateway extends CI_Controller {

    public $data = array();
    public $academic_year_id;
            
    function __construct() {
        parent::__construct();
         $this->load->model('Payment_Model', 'payment', true);
         $this->load->model('Invoice_Model', 'invoice', true);
         
         $this->academic_year_id = $this->db->get_where('academic_years', array('is_running'=>1))->row()->id;         
         $this->config->load('custom');
         $this->load->library("paypal"); 
         
         $gsms_setting = $this->db->get_where('settings',array('status'=>1))->row();
         date_default_timezone_set($gsms_setting->default_time_zone);
    }

        
    
    /*****************Function paypal_notify**********************************
    * @type            : Function
    * @function name   : paypal_notify
    * @description     : paypal peyment processing notify url                 
    *                    internally paypal send some post data
                         which are procesing here.   
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function paypal_notify(){
        
        //mail('yousuf361@gmail.com', 'Paypal notify out', json_encode($_POST));
        
        if (isset($_POST['ipn_track_id']) && !empty($_POST['ipn_track_id'])) {
            
            // mail('yousuf361@gmail.com', 'Paypal notify in', json_encode($_POST));
                  
            $invoice = $this->invoice->get_single_invoice($_POST['custom']);
            $payment = $this->payment->get_invoice_amount($_POST['custom']);             
                       
            $data['invoice_id'] = $_POST['custom'];
            $data['amount'] = $invoice->temp_amount; 
            $data['payment_method'] = 'Paypal';
            $data['transaction_id'] = $_POST['txn_id'];            
            $data['note'] = $_POST['item_name'];      
            $data['status'] = 1;
            $data['academic_year_id'] = $this->academic_year_id;
            $data['payment_date'] = date('Y-m-d');
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id(); 
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
            
            $this->payment->insert('transactions', $data);            
            $due_amount = $invoice->net_amount-$payment->paid_amount;
            
            if(floatval($data['amount']) < floatval($due_amount)){
                $update = array('paid_status'=> 'partial');
            }else{
               $update = array('paid_status'=> 'paid', 'modified_at'=>date('Y-m-d H:i:s'));
            }                    
            $this->payment->update('invoices', $update, array('id'=>$data['invoice_id']));            
        }
    } 

}
