<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Expenditure.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Expenditure
 * @description     : Manage all kind of expenditure of the school.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Expenditure extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
         $this->load->model('Expenditure_Model', 'expenditure', true);              
    }

    
    /*****************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : Load "Expenditure Listing" user interface                 
     *                    
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function index() {
        
        check_permission(VIEW);
        
        $this->data['expenditure_heads'] = $this->expenditure->get_list('expenditure_heads', array('status'=> 1));        
        $this->data['expenditures'] = $this->expenditure->get_expenditure_list();  
        $this->data['list'] = TRUE;
        $this->layout->title( $this->lang->line('manage_expenditure'). ' | ' . SMS);
        $this->layout->view('expenditure/index', $this->data);            
       
    }

    
     /*****************Function add**********************************
     * @type            : Function
     * @function name   : add
     * @description     : Load "Add new Expenditure" user interface                 
     *                    and store "Expenditure" into database 
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function add() {
        
        check_permission(ADD);
        if ($_POST) {
            $this->_prepare_expenditure_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_expenditure_data();

                $insert_id = $this->expenditure->insert('expenditures', $data);
                if ($insert_id) {
                    
                    create_log('Has been added expenditure : '.$data['amount']);
                    
                    success($this->lang->line('insert_success'));
                    redirect('accounting/expenditure/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('accounting/expenditure/add');
                }
            } else {
                $this->data['post'] = $_POST;
            }
        }

        $this->data['expenditure_heads'] = $this->expenditure->get_list('expenditure_heads', array('status'=> 1));        
        $this->data['expenditures'] = $this->expenditure->get_expenditure_list();  
         
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add'). ' ' . $this->lang->line('expenditure'). ' | ' . SMS);
        $this->layout->view('expenditure/index', $this->data);
    }

    
        
    /*****************Function edit**********************************
     * @type            : Function
     * @function name   : edit
     * @description     : Load Update "Expenditure" user interface                 
     *                    with populated "Expenditure" value 
     *                    and update "Expenditure" database    
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function edit($id = null) {  
        
       check_permission(EDIT);
       
        
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('accounting/expenditure/index');
        }
        
        if ($_POST) {
            $this->_prepare_expenditure_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_expenditure_data();
                $updated = $this->expenditure->update('expenditures', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    
                    create_log('Has been updated expenditure : '.$data['amount']);
                    
                    success($this->lang->line('update_success'));
                    redirect('accounting/expenditure/index');                   
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('accounting/expenditure/edit/' . $this->input->post('id'));
                }
            } else {
                 $this->data['expenditure'] = $this->expenditure->get_single('expenditures', array('id' => $this->input->post('id')));
            }
        }
        
        if ($id) {
            $this->data['expenditure'] = $this->expenditure->get_single('expenditures', array('id' => $id));

            if (!$this->data['expenditure']) {
                 redirect('accounting/expenditure/index');
            }
        }
        
        $this->data['expenditure_heads'] = $this->expenditure->get_list('expenditure_heads', array('status'=> 1));        
        $this->data['expenditures'] = $this->expenditure->get_expenditure_list();  
        $this->data['edit'] = TRUE;       
        $this->layout->title($this->lang->line('edit'). ' ' . $this->lang->line('expenditure'). ' | ' . SMS);
        $this->layout->view('expenditure/index', $this->data);
    }
    
    
     /*****************Function view**********************************
     * @type            : Function
     * @function name   : view
     * @description     : Load user interface with specific expenditure data                 
     *                       
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function view($id = null){
        
        check_permission(VIEW);
        
         
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('accounting/expenditure/index');
        }
        
        $this->data['expenditure_heads'] = $this->expenditure->get_list('expenditure_heads', array('status'=> 1));        
        $this->data['expenditures'] = $this->expenditure->get_expenditure_list();  
        $this->data['expenditure'] = $this->expenditure->get_single_expenditure($id);
        $this->data['detail'] = TRUE;       
        $this->layout->title($this->lang->line('view'). ' ' . $this->lang->line('expenditure'). ' | ' . SMS);
        $this->layout->view('expenditure/index', $this->data); 
    }
    
        
           
     /*****************Function get_single_expenditure**********************************
     * @type            : Function
     * @function name   : get_single_slider
     * @description     : "Load single expenditure information" from database                  
     *                    to the user interface   
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function get_single_expenditure(){
        
       $expenditure_id = $this->input->post('expenditure_id');       
       $this->data['expenditure'] = $this->expenditure->get_single_expenditure($expenditure_id);
       echo $this->load->view('expenditure/get-single-expenditure', $this->data);
    }

    
     /*****************Function _prepare_expenditure_validation**********************************
     * @type            : Function
     * @function name   : _prepare_expenditure_validation
     * @description     : Process "expenditure" user input data validation                 
     *                       
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    private function _prepare_expenditure_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
        
        $this->form_validation->set_rules('expenditure_head_id', $this->lang->line('expenditure_head'), 'trim|required');   
        $this->form_validation->set_rules('amount', $this->lang->line('amount'), 'trim|required|numeric');   
        $this->form_validation->set_rules('date', $this->lang->line('date'), 'trim|required');   
        $this->form_validation->set_rules('expenditure_via', $this->lang->line('expenditure') .' '. $this->lang->line('method'), 'trim|required');   
        $this->form_validation->set_rules('note', $this->lang->line('note'), 'trim');   
    }


     /*****************Function _get_posted_expenditure_data**********************************
     * @type            : Function
     * @function name   : _get_posted_expenditure_data
     * @description     : Prepare "expenditure" user input data to save into database                  
     *                       
     * @param           : null
     * @return          : $data array(); value 
     * ********************************************************** */
    private function _get_posted_expenditure_data() {

        $items = array();
        $items[] = 'expenditure_head_id';
        $items[] = 'amount';
        $items[] = 'expenditure_via';
        $items[] = 'note';
        
        $data = elements($items, $_POST);  
        
        $data['date'] = date('Y-m-d', strtotime($this->input->post('date')));
        
        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['status'] = 1;
            $data['expenditure_type'] = 'general';
            $data['academic_year_id'] = $this->academic_year_id;
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
     * @description     : delete "Expenditure" from database                  
     *                       
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function delete($id = null) {
        
        check_permission(DELETE);
        
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('accounting/expenditure/index');
        }
        
        $expenditure = $this->expenditure->get_single('expenditures', array('id' => $id));
        
        if ($this->expenditure->delete('expenditures', array('id' => $id))) {  
            
            create_log('Has been deleted expenditure : '.$expenditure->amount);            
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('accounting/expenditure/index');
    }    
   
}
