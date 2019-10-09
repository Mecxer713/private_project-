<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Payment.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Payment
 * @description     : Manage payment gateway settings.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Payment extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Setting_Model', 'setting', true);
        $this->data['setting'] = $this->setting->get_single('payment_settings', array('status' => 1));
    }

        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Payment Setting" user interface                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        $this->data['paypal'] = TRUE;
        $this->layout->title($this->lang->line('payment') . ' ' . $this->lang->line('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

            
    /*****************Function paypal**********************************
    * @type            : Function
    * @function name   : paypal
    * @description     : Load "Paypal Setting Tab" user interface                 
    *                     and process to save paypal setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function paypal() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_paypal_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated Paypal payment gateway setting');
                        success($this->lang->line('update_success'));
                    } else {
                        error($this->lang->line('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added Paypal payment gateway setting');                        
                        success($this->lang->line('insert_success'));
                    } else {
                        error($this->lang->line('insert_failed'));
                    }
                }
                redirect('setting/payment/paypal');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['paypal'] = TRUE;
        $this->layout->title($this->lang->line('payment') . ' ' . $this->lang->line('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

        
    /*****************Function _prepare_paypal_validation**********************************
    * @type            : Function
    * @function name   : _prepare_paypal_validation
    * @description     : Process "paypal" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_paypal_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');

        //$this->form_validation->set_rules('paypal_api_username', $this->lang->line('teacher'), 'trim|required');
        //$this->form_validation->set_rules('paypal_api_password', $this->lang->line('teacher'), 'trim|required');
        //$this->form_validation->set_rules('paypal_api_signature', $this->lang->line('teacher'), 'trim|required');
        $this->form_validation->set_rules('paypal_email', $this->lang->line('paypal') . ' ' . $this->lang->line('email'), 'trim|required');
        $this->form_validation->set_rules('paypal_demo', $this->lang->line('is_demo'), 'trim|required');
        $this->form_validation->set_rules('paypal_status', $this->lang->line('is_active'), 'trim|required');
    }

                
    /*****************Function stripe**********************************
    * @type            : Function
    * @function name   : stripe
    * @description     : Load "Stripe Setting Tab" user interface                 
    *                     and process to save stripe setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function stripe() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_stripe_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated Stripe payment gateway setting');
                        success($this->lang->line('update_success'));
                    } else {
                        error($this->lang->line('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added Stripe payment gateway setting');
                        success($this->lang->line('insert_success'));
                    } else {
                        error($this->lang->line('insert_failed'));
                    }
                }
                redirect('setting/payment/stripe');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['stripe'] = TRUE;
        $this->layout->title($this->lang->line('payment') . ' ' . $this->lang->line('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

            
    /*****************Function _prepare_stripe_validation**********************************
    * @type            : Function
    * @function name   : _prepare_stripe_validation
    * @description     : Process "stripe" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_stripe_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('stripe_secret', $this->lang->line('secret') . ' ' . $this->lang->line('key'), 'trim|required');
        $this->form_validation->set_rules('stripe_demo', $this->lang->line('is_demo'), 'trim|required');
        $this->form_validation->set_rules('stripe_status', $this->lang->line('is_active'), 'trim|required');
    }

                
    /*****************Function payumoney**********************************
    * @type            : Function
    * @function name   : payumoney
    * @description     : Load "Payumoney Setting Tab" user interface                 
    *                     and process to save payumoney setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function payumoney() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_payumoney_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated payUMoney payment gateway setting');
                        success($this->lang->line('update_success'));
                    } else {
                        error($this->lang->line('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added payUMoney payment gateway setting');
                        success($this->lang->line('insert_success'));
                    } else {
                        error($this->lang->line('insert_failed'));
                    }
                }
                redirect('setting/payment/payumoney');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['payumoney'] = TRUE;
        $this->layout->title($this->lang->line('payment') . ' ' . $this->lang->line('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

                
    /*****************Function _prepare_payumoney_validation**********************************
    * @type            : Function
    * @function name   : _prepare_payumoney_validation
    * @description     : Process "payumoney" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_payumoney_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('payumoney_key', $this->lang->line('payumoney') . ' ' . $this->lang->line('key'), 'trim|required');
        $this->form_validation->set_rules('payumoney_salt', $this->lang->line('payumoney') . ' ' . $this->lang->line('key_salt'), 'trim|required');
        $this->form_validation->set_rules('payumoney_demo', $this->lang->line('is_demo'), 'trim|required');
        $this->form_validation->set_rules('payumoney_status', $this->lang->line('is_active'), 'trim|required');
    }

    
    
    
    
                
    /*****************Function paytm**********************************
    * @type            : Function
    * @function name   : paytm
    * @description     : Load "PayTM Setting Tab" user interface                 
    *                     and process to save paytm setting inormation into database  
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function paytm() {

        check_permission(EDIT);

        if ($_POST) {
            $this->_prepare_paytm_validation();

            if ($this->form_validation->run() == TRUE) {
                $data = $this->_get_posted_payment_data();
                if ($this->input->post('id')) {
                    $update = $this->setting->update('payment_settings', $data, array('id' => $this->input->post('id')));
                    if ($update) {
                        
                        create_log('Has been updated PauTM payment gateway setting');
                        success($this->lang->line('update_success'));
                    } else {
                        error($this->lang->line('update_failed'));
                    }
                } else {
                    $insert_id = $this->setting->insert('payment_settings', $data);
                    if ($insert_id) {
                        
                        create_log('Has been added PayTM payment gateway setting');
                        success($this->lang->line('insert_success'));
                    } else {
                        error($this->lang->line('insert_failed'));
                    }
                }
                redirect('setting/payment/paytm');
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['paytm'] = TRUE;
        $this->layout->title($this->lang->line('payment') . ' ' . $this->lang->line('setting') . ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

                
    /*****************Function _prepare_paytm_validation**********************************
    * @type            : Function
    * @function name   : _prepare_paytm_validation
    * @description     : Process "PayTM" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_paytm_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('paytm_merchant_key', $this->lang->line('paytm') . ' ' . $this->lang->line('merchant_key'), 'trim|required');
        $this->form_validation->set_rules('paytm_merchant_mid', $this->lang->line('paytm') . ' ' . $this->lang->line('merchant_mid'), 'trim|required');
        $this->form_validation->set_rules('paytm_merchant_website', $this->lang->line('paytm') . ' ' . $this->lang->line('website'), 'trim|required');
        $this->form_validation->set_rules('paytm_demo', $this->lang->line('is_demo'), 'trim|required');
        $this->form_validation->set_rules('paytm_industry_type', $this->lang->line('paytm') . ' ' . $this->lang->line('industry_type'), 'trim|required');
        $this->form_validation->set_rules('paytm_status', $this->lang->line('is_active'), 'trim|required');
    }

    
    
    
    
       
    /*****************Function _get_posted_payment_data**********************************
    * @type            : Function
    * @function name   : _get_posted_payment_data
    * @description     : Prepare "Payment Settings" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_payment_data() {

        $items = array();

        if ($this->input->post('paypal')) {
            //$items[] = 'paypal_api_username';
            //$items[] = 'paypal_api_password';
            //$items[] = 'paypal_api_signature';
            $items[] = 'paypal_email';
            $items[] = 'paypal_demo';
            $items[] = 'paypal_status';
            $items[] = 'paypal_extra_charge';
        }

       
        if ($this->input->post('payumoney')) {
            $items[] = 'payumoney_key';
            $items[] = 'payumoney_salt';
            $items[] = 'payumoney_demo';
            $items[] = 'payumoney_status';
            $items[] = 'payu_extra_charge';
        }
        
                
        if ($this->input->post('paytm')) {
            $items[] = 'paytm_merchant_key';
            $items[] = 'paytm_merchant_mid';
            $items[] = 'paytm_merchant_website';
            $items[] = 'paytm_industry_type';
            $items[] = 'paytm_demo';
            $items[] = 'paytm_status';
            $items[] = 'paytm_extra_charge';
        }

        $data = elements($items, $_POST);

        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id();
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
            $data['status'] = 1;
        }

        return $data;
    }

}
