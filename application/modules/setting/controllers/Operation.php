<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Operation.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Opration
 * @description     : Manage application controller.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Operation extends CI_Controller {

    public $data = array();
    public $gsms_setting = array();
    
    function __construct() {
        parent::__construct();
         $this->load->model('Setting_Model', 'setting', true);
         $this->data['modules'] = $this->setting->get_list('modules', array('status'=>1), '','', '', 'id', 'ASC'); 
         $this->data['operations'] = $this->setting->get_operation_list();
         $gsms_setting = $this->db->get_where('settings',array('status'=>1))->row();
         $this->gsms_setting = $gsms_setting;
    }

    public function index($value = null) {         
        
        $this->session->unset_userdata($value);
        $this->data['list'] = TRUE;
        $this->layout->title('SMS | Operation');
        $this->layout->view('operation/index', $this->data);            
       
    }

    public function add() {

        if ($_POST) {
            $this->_prepare_operation_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_operation_data();

                $insert_id = $this->setting->insert('operations', $data);
                if ($insert_id) {
                    success($this->lang->line('insert_success'));
                    redirect('setting/operation/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('setting/operation/add');
                }
            } else {
                $this->data = $_POST;
            }
        }

        $this->data['add'] = TRUE;
        $this->layout->title('SMS | Operation Add');
        $this->layout->view('operation/index', $this->data);
    }

    public function edit($id = null) {       
       
        if ($_POST) {
            $this->_prepare_operation_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_operation_data();
                $updated = $this->setting->update('operations', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    success($this->lang->line('update_success'));
                    redirect('setting/operation/index');                   
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('setting/operation/edit/' . $this->input->post('id'));
                }
            } else {
                 $this->data = $_POST;
            }
        } else {
            if ($id) {
                $this->data['operation'] = $this->setting->get_single('operations', array('id' => $id));
 
                if (!$this->data['operation']) {
                     redirect('setting/operation/index');
                }
            }
        }

        $this->data['edit'] = TRUE;       
        $this->layout->title('SMS | Operation Edit');
        $this->layout->view('operation/index', $this->data);
    }

    private function _prepare_operation_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
        $this->form_validation->set_rules('module_id', 'module_id', 'trim|required');
        $this->form_validation->set_rules('operation_name', 'operation_name', 'trim|required');
        $this->form_validation->set_rules('operation_slug', 'operation_slug', 'trim|required');       
    }

    private function _get_posted_operation_data() {

        $items = array();
        $items[] = 'module_id';
        $items[] = 'operation_name';
        $items[] = 'operation_slug';
        $items[] = 'is_view_vissible';
        $items[] = 'is_add_vissible';
        $items[] = 'is_edit_vissible';
        $items[] = 'is_delete_vissible';
        
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

    
    public function delete($id = null) {
        if ($this->setting->delete('operations', array('id' => $id))) {            
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('setting/operation');
    }

}
