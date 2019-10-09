<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Payment.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Payment
 * @description     : Manage Employee and Teacher Salary.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Payment extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
         $this->load->model('Payment_Model', 'payment', true);              
    }

    
    /*****************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : Load "Employee & Teacher Payment" user interface                 
     *                    
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    
    public function index($user_id = null) {
        
        check_permission(VIEW);
        
        $this->data['users'] = '';
        
         if ($_POST) {
             
            $payment_to  = $this->input->post('payment_to');
            $user_id  = $this->input->post('user_id');
        
            $this->data['payment_to'] = $payment_to;
            $this->data['user_id'] = $user_id;
            
            $this->data['user']    = $this->payment->get_single('users', array('id' => $user_id));        
            $this->data['payment'] = $this->payment->get_single_payment_user($this->data['user']->role_id, $user_id); 
            $this->data['add'] = TRUE;   
            
            $this->data['payments'] = $this->payment->get_payment_list($user_id, $payment_to);
            
            create_log('Has been process a Payment for : '.$this->data['user']->email);
            
            
         }else{
             
            if($user_id){
                
                $this->data['user']    = $this->payment->get_single('users', array('id' => $user_id)); 
                
                $payment_to  = $this->data['user']->role_id == TEACHER ? 'teacher' : 'employee';
               
                $this->data['payment_to'] = $payment_to;
                $this->data['user_id'] = $user_id;

                $this->data['payment'] = $this->payment->get_single_payment_user($this->data['user']->role_id, $user_id); 
                $this->data['payments'] = $this->payment->get_payment_list($user_id, $payment_to);
            }
            
            $this->data['list'] = TRUE;
        }
        
        $this->data['exp_heads'] = $this->payment->get_list('expenditure_heads', array('status'=> 1));
        $this->layout->title( $this->lang->line('manage_payment'). ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);            
       
    }


    
     /*****************Function add**********************************
     * @type            : Function
     * @function name   : add
     * @description     : Load "Add new Payment" user interface                 
     *                    and store "Payment" into database 
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function add() {
        
        check_permission(ADD);
        
        if ($_POST) {
            $this->_prepare_payment_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_payment_data();

                $insert_id = $this->payment->insert('salary_payments', $data);
                if ($insert_id) {
                    
                    $user = $this->payment->get_single('users', array('id' => $data['user_id'])); 
                    create_log('Has been process a Payment and save for : '.$user->email);
                    
                    success($this->lang->line('insert_success'));
                    redirect('payroll/payment/index/'.$this->input->post('user_id'));
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('payroll/payment/index/'.$this->input->post('user_id'));
                }
            } else {
                
                $payment_to  = $this->input->post('payment_to');
                $user_id  = $this->input->post('user_id');
                
                $this->data['payment_to'] = $payment_to;
                $this->data['user_id'] = $user_id;

                $this->data['user']    = $this->payment->get_single('users', array('id' => $user_id));        
                $this->data['payment'] = $this->payment->get_single_payment_user($this->data['user']->role_id, $user_id); 
                $this->data['exp_heads'] = $this->payment->get_list('expenditure_heads', array('status'=> 1));
                $this->data['payments'] = $this->payment->get_payment_list($user_id, $payment_to);
                $this->data['post'] = $_POST;
            }
        }

        $this->data['exp_heads'] = $this->payment->get_list('expenditure_heads', array('status'=> 1));          
         
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add'). ' ' . $this->lang->line('payment'). ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }

    
        
    /*****************Function edit**********************************
     * @type            : Function
     * @function name   : edit
     * @description     : Load Update "Payment" user interface                 
     *                    with populated "Payment" value 
     *                    and update "Payment" database    
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function edit($id = null) {  
        
       check_permission(EDIT);
       
        
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('payroll/payment/index');
        }
        
        if ($_POST) {
            $this->_prepare_payment_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_payment_data();
                $updated = $this->payment->update('salary_payments', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    
                    $user = $this->payment->get_single('users', array('id' => $data['user_id'])); 
                    create_log('Has been process a Payment and Update for : '.$user->email);
                    
                    success($this->lang->line('update_success'));
                    redirect('payroll/payment/index/' . $this->input->post('user_id'));                
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('payroll/payment/edit/' . $this->input->post('id'));
                }
            } else {
                
                  error($this->lang->line('unexpected_error'));
                 // redirect('payroll/payment/edit/' . $this->input->post('id'));
            }
        }
        
        if ($id) {
            
            
            $this->data['edit_payment'] = $this->payment->get_single('salary_payments', array('id' => $id));

            if (!$this->data['edit_payment']) {
                 redirect('payroll/payment/index');
            }
            
            $user         = $this->payment->get_single('users', array('id' => $this->data['edit_payment']->user_id));
            
            $salary_grade = $this->payment->get_single('salary_grades', array('id' => $this->data['edit_payment']->salary_grade_id));
            $this->data['expenditure'] = $this->payment->get_single('expenditures', array('id' => $this->data['edit_payment']->expenditure_id));
            $this->data['edit_payment']->grade_name = $salary_grade->grade_name;
            
            $payment_to  = $user->role_id == TEACHER ? 'teacher' : 'employee';
            $this->data['payment_to'] = $payment_to;
            $this->data['user_id'] = $user->id;
            
            $this->data['payment'] = $this->payment->get_single_payment_user($user->role_id, $user->id); 
            $this->data['exp_heads'] = $this->payment->get_list('expenditure_heads', array('status'=> 1));
            $this->data['payments'] = $this->payment->get_payment_list($user->id, $payment_to);
        }
       
        
        $this->data['edit'] = TRUE;       
        $this->layout->title($this->lang->line('edit'). ' ' . $this->lang->line('payment'). ' | ' . SMS);
        $this->layout->view('payment/index', $this->data);
    }
    
    
     /*****************Function _prepare_payment_validation**********************************
     * @type            : Function
     * @function name   : _prepare_payment_validation
     * @description     : Process "payment" user input data validation                 
     *                       
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    private function _prepare_payment_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
        
        $this->form_validation->set_rules('salary_type', $this->lang->line('salary_type'), 'trim|required');   
        $this->form_validation->set_rules('salary_month', $this->lang->line('month'), 'trim|required|callback_salary_month'); 
        $this->form_validation->set_rules('gross_salary', $this->lang->line('gross_salary'), 'trim|required'); 
        $this->form_validation->set_rules('net_salary', $this->lang->line('net_salary'), 'trim|required'); 
        $this->form_validation->set_rules('note', $this->lang->line('note'), 'trim');   
    }
    
    
     /*****************Function salary_month**********************************
     * @type            : Function
     * @function name   : salary_month
     * @description     : Unique check for "Salary payment" data/value                  
     *                       
     * @param           : null
     * @return          : boolean true/false 
     * ********************************************************** */  
   public function salary_month()
   {             
      if($this->input->post('id') == '')
      {   
          $payment = $this->payment->duplicate_check($this->input->post('salary_month'), $this->input->post('user_id')); 
          if($payment){
                $this->form_validation->set_message('salary_month',  $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }          
      }else if($this->input->post('id') != ''){   
         $payment = $this->payment->duplicate_check($this->input->post('salary_month'), $this->input->post('user_id'), $this->input->post('id')); 
          if($payment){
                $this->form_validation->set_message('salary_month', $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }
      }   
   }


     /*****************Function _get_posted_payment_data**********************************
     * @type            : Function
     * @function name   : _get_posted_payment_data
     * @description     : Prepare "payment" user input data to save into database                  
     *                       
     * @param           : null
     * @return          : $data array(); value 
     * ********************************************************** */
    private function _get_posted_payment_data() {

        $items = array();
        $items[] = 'user_id';
        $items[] = 'salary_grade_id';       
        $items[] = 'salary_type';
        $items[] = 'salary_month';
        
        if( strtolower($this->input->post('salary_type')) == 'monthly'){
            
            $items[] = 'basic_salary';
            $items[] = 'house_rent';
            $items[] = 'transport';
            $items[] = 'medical';
            $items[] = 'over_time_hourly_rate';
            $items[] = 'over_time_total_hour';
            $items[] = 'over_time_amount';
            $items[] = 'provident_fund';
            
        }else{
            
            $items[] = 'hourly_rate';
            $items[] = 'total_hour';
        }
        
        
        $items[] = 'bonus';
        $items[] = 'penalty';
        $items[] = 'gross_salary';
        $items[] = 'total_allowance';
        $items[] = 'total_deduction';
        $items[] = 'net_salary';
        $items[] = 'payment_method';
        $items[] = 'payment_to';
        
        $items[] = 'bank_name';
        $items[] = 'cheque_no';
        
        $items[] = 'note';
        
        $data = elements($items, $_POST);  
        
        if($this->input->post('payment_method') == 'cash'){
            $data['bank_name'] = ''; 
            $data['cheque_no'] = ''; 
        }
      
        
        if ($this->input->post('id')) {
            
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
            
            // Update data into Expenditure table
            $exp_data = array();
            $exp_data['amount'] = $data['net_salary'];
            $exp_data['expenditure_via'] = $data['payment_method'];
            $exp_data['note'] = $data['note'];
            $exp_data['modified_at'] = $data['modified_at'];
            $exp_data['modified_by'] = $data['modified_by'];
            $this->payment->update('expenditures', $exp_data, array('id' => $this->input->post('expenditure_id')));
            
        } else {
            
            $data['status'] = 1;
            $data['academic_year_id'] = $this->academic_year_id;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id();
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
            
            // Insert data into Expenditure table
            $exp_data = array();
            
            $exp_data['expenditure_head_id'] = $this->input->post('expenditure_head_id');
            $exp_data['status'] = 1;
            $exp_data['expenditure_type'] = 'salary';
            $exp_data['date'] = date('Y-m-d');
            $exp_data['amount'] = $data['net_salary'];
            $exp_data['expenditure_via'] = $data['payment_method'];
            $exp_data['note'] = $data['note'];
            $exp_data['academic_year_id'] = $data['academic_year_id'];
            $exp_data['created_at'] = $data['created_at'];
            $exp_data['created_by'] = $data['created_by'];
            $exp_data['modified_at'] = $data['created_at'];
            $exp_data['modified_by'] = $data['created_by'];
                    
            $data['expenditure_id'] = $this->payment->insert('expenditures', $exp_data);
        }

        return $data;
    }

    
    /*****************Function delete**********************************
     * @type            : Function
     * @function name   : delete
     * @description     : delete "Salary Payment and Expenditure amount as Salary" from database                  
     *                       
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function delete($id = null) {
        
        check_permission(DELETE);
        
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('payroll/payment/index');
        }
        
        $payment = $this->payment->get_single('salary_payments', array('id' => $id));
        
        if ($this->payment->delete('salary_payments', array('id' => $id))) {

            $this->payment->delete('expenditures', array('id' => $payment->expenditure_id)); 
            
            $user = $this->payment->get_single('users', array('id' => $payment->user_id)); 
            create_log('Has been deleted a Payment for : '.$user->email);
                    
            success($this->lang->line('delete_success'));
            
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('payroll/payment/index/'.$payment->user_id);
    } 
    
    
    
     /*****************Function get_single_payment**********************************
     * @type            : Function
     * @function name   : get_single_payment
     * @description     : "Load single salary payment information" from database                  
     *                    to the user interface   
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function get_single_payment(){
        
       $payment_id = $this->input->post('payment_id');
       $payment_to = $this->input->post('payment_to');
       
       $this->data['payment'] = $this->payment->get_single_payment($payment_id, $payment_to);
       echo $this->load->view('get-single-payment', $this->data);
    }
    
    
    /*****************Function history**********************************
     * @type            : Function
     * @function name   : history
     * @description     : Load "Employee & Teacher Payment History" user interface                 
     *                    
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    
    public function history() {
        
        check_permission(VIEW);
        
        $this->data['users'] = '';
        
         if ($_POST) {
             
            $payment_to  = $this->input->post('payment_to');
            $user_id  = $this->input->post('user_id');
        
            $this->data['payment_to'] = $payment_to;
            $this->data['user_id'] = $user_id;
            
            $this->data['payments'] = $this->payment->get_payment_list($user_id, $payment_to);
            
         }
        
        $this->data['list'] = TRUE;       
        $this->layout->title( $this->lang->line('manage_payment'). ' | ' . SMS);
        $this->layout->view('payment/history', $this->data);            
       
    }

   
}
