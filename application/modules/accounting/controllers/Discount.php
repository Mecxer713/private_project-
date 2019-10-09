<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Discount.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Discount
 * @description     : Manage all discount type/head/title as per accounting term.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Discount extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
         $this->load->model('Discount_Model', 'discount', true);               
    }

    
    
     /*****************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : Load "Discount List" user interface                 
     *                     
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function index() {
        
        check_permission(VIEW);
        $this->data['discounts'] = $this->discount->get_list('discounts', array('status'=> 1), '', '', '', 'id', 'DESC');  
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('discount'). ' | ' . SMS);
        $this->layout->view('discount/index', $this->data);            
       
    }

    
     /*****************Function add**********************************
     * @type            : Function
     * @function name   : add
     * @description     : Load "Add new Discount" user interface                 
     *                    and store "Discount" into database 
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function add() {

        check_permission(ADD);
        
        if ($_POST) {
            $this->_prepare_discount_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_discount_data();

                $insert_id = $this->discount->insert('discounts', $data);
                if ($insert_id) {
                    
                    create_log('Has been created a discount : '.$data['title']);
                    
                    success($this->lang->line('insert_success'));
                    redirect('accounting/discount/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('accounting/discount/add');
                }
            } else {
                $this->data['post'] = $_POST;
            }
        }

        $this->data['discounts'] = $this->discount->get_list('discounts', array('status'=> 1), '', '', '', 'id', 'DESC');  
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add'). ' ' . $this->lang->line('discount'). ' | ' . SMS);
        $this->layout->view('discount/index', $this->data);
    }

    
     /*****************Function edit**********************************
     * @type            : Function
     * @function name   : edit
     * @description     : Load Update "Discount" user interface                 
     *                    with populated "Discount" value 
     *                    and update "Discount" database    
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function edit($id = null) {       
       
        check_permission(EDIT);
        
          
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('accounting/discount/index');   
        }
        
        if ($_POST) {
            $this->_prepare_discount_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_discount_data();
                $updated = $this->discount->update('discounts', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    
                    create_log('Has been updated a discount : '.$data['title']);
                    
                    success($this->lang->line('update_success'));
                    redirect('accounting/discount/index');                   
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('accounting/discount/edit/' . $this->input->post('id'));
                }
            } else {
                 $this->data['discount'] = $this->discount->get_single('discounts', array('id' => $this->input->post('id')));
            }
        }
        
        if ($id) {
            $this->data['discount'] = $this->discount->get_single('discounts', array('id' => $id));

            if (!$this->data['discount']) {
                 redirect('accounting/discount/index');
            }
        }

        $this->data['discounts'] = $this->discount->get_list('discounts', array('status'=> 1), '', '', '', 'id', 'DESC');  
        $this->data['edit'] = TRUE;       
        $this->layout->title($this->lang->line('edit'). ' ' . $this->lang->line('discount'). ' | ' . SMS);
        $this->layout->view('discount/index', $this->data);
    }

    
    
    /*****************Function _prepare_discount_validation**********************************
     * @type            : Function
     * @function name   : _prepare_discount_validation
     * @description     : Process "Discount" user input data validation                 
     *                       
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    private function _prepare_discount_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
        
        $this->form_validation->set_rules('title', $this->lang->line('title'), 'trim|required|callback_title');   
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'trim|required');   
    }
    
    
    
        
    /*****************Function title**********************************
     * @type            : Function
     * @function name   : title
     * @description     : Unique check for "discount title" data/value                  
     *                       
     * @param           : null
     * @return          : boolean true/false 
     * ********************************************************** */ 
   public function title()
   {             
      if($this->input->post('id') == '')
      {   
          $title = $this->discount->duplicate_check($this->input->post('title')); 
          if($title){
                $this->form_validation->set_message('title', $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }          
      }else if($this->input->post('id') != ''){   
         $title = $this->discount->duplicate_check($this->input->post('title'), $this->input->post('id')); 
          if($title){
                $this->form_validation->set_message('title', $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }
      }   
   }

   
     /*****************Function _get_posted_discount_data**********************************
     * @type            : Function
     * @function name   : _get_posted_discount_data
     * @description     : Prepare "Discount" user input data to save into database                  
     *                       
     * @param           : null
     * @return          : $data array(); value 
     * ********************************************************** */
    private function _get_posted_discount_data() {

        $items = array();
        $items[] = 'title';
        $items[] = 'amount';
        $items[] = 'note';
        $data = elements($items, $_POST);  
    
        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id(); 
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        }

        return $data;
    }

    
    
    /*****************Function delete**********************************
     * @type            : Function
     * @function name   : delete
     * @description     : delete "Discount" from database                  
     *                       
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function delete($id = null) {
        
        check_permission(DELETE);
        
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('accounting/discount/index');   
        }
        
        $discount = $this->discount->get_single('discounts', array('id' => $id));
        
        if ($this->discount->delete('discounts', array('id' => $id))) {

            create_log('Has been deleted a discount : '.$discount->title);
            
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('accounting/discount/index');
    }

}
