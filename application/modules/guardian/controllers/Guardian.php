<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Guardian.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Guardian
 * @description     : Manage guardian information.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Guardian extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Guardian_Model', 'guardian', true);        
    }

    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Guardian List" user interface                 
    *                     
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);
        
        $this->data['guardians'] = $this->guardian->get_guardian_list();
        
        $this->data['roles'] = $this->guardian->get_list('roles', array('status' => 1), '', '', '', 'id', 'ASC');
        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('manage_guardian') . ' | ' . SMS);
        $this->layout->view('guardian/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new Guardian" user interface                 
    *                    and process to store "Guardian" into database 
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);

        if ($_POST) {
            $this->_prepare_guardian_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_guardian_data();

                $insert_id = $this->guardian->insert('guardians', $data);
                if ($insert_id) {
                    
                    create_log('Has been added a Guardian : '.$data['name']);
                    
                    success($this->lang->line('insert_success'));
                    redirect('guardian/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('guardian/add');
                }
            } else {

                $this->data['post'] = $_POST;
            }
        }

        $this->data['guardians'] = $this->guardian->get_guardian_list();
        $this->data['roles'] = $this->guardian->get_list('roles', array('status' => 1), '', '', '', 'id', 'ASC');
        
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add') . ' ' . $this->lang->line('guardian') . ' | ' . SMS);
        $this->layout->view('guardian/index', $this->data);
    }

    
    /*****************Function edit**********************************
    * @type            : Function
    * @function name   : edit
    * @description     : Load Update "Guardian" user interface                 
    *                    with populate "Guardian" value 
    *                    and process to update "Guardian" into database    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function edit($id = null) {

        check_permission(EDIT);

        if(!is_numeric($id)){
             error($this->lang->line('unexpected_error'));
              redirect('guardian/index');
        }
        
        if ($_POST) {
            $this->_prepare_guardian_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_guardian_data();
                $updated = $this->guardian->update('guardians', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    
                    create_log('Has been updated a Guardian : '.$data['name']);
                    
                    success($this->lang->line('update_success'));
                    redirect('guardian/index');
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('guardian/edit/' . $this->input->post('id'));
                }
            } else {
                $this->data['guardian'] = $this->guardian->get_single_guardian($this->input->post('id'));
            }
        }

        if ($id) {
            $this->data['guardian'] = $this->guardian->get_single_guardian($id);

            if (!$this->data['guardian']) {
                redirect('guardian/index');
            }
        }

        $this->data['guardians'] = $this->guardian->get_guardian_list();
        $this->data['roles'] = $this->guardian->get_list('roles', array('status' => 1), '', '', '', 'id', 'ASC');
        
        $this->data['edit'] = TRUE;
        $this->layout->title($this->lang->line('edit') . ' ' . $this->lang->line('guardian') . ' | ' . SMS);
        $this->layout->view('guardian/index', $this->data);
    }

    
    /*****************Function view**********************************
    * @type            : Function
    * @function name   : view
    * @description     : Load user interface with specific Guardian data                 
    *                       
    * @param           : $guardian_id integer value
    * @return          : null 
    * ********************************************************** */
    public function view($guardian_id = null) {

        check_permission(VIEW);

        if(!is_numeric($guardian_id)){
             error($this->lang->line('unexpected_error'));
             redirect('guardian/index');
        }
        
        $this->data['guardians'] = $this->guardian->get_guardian_list();
        $this->data['roles'] = $this->guardian->get_list('roles', array('status' => 1), '', '', '', 'id', 'ASC');
        
        
        $this->data['guardian'] = $this->guardian->get_single_guardian($guardian_id);
        
        
        
        $this->data['detail'] = TRUE;
        $this->layout->title($this->lang->line('view') . ' ' . $this->lang->line('guardian') . ' | ' . SMS);
        $this->layout->view('guardian/index', $this->data);
    }
    
    
         /*****************Function get_single_guardian**********************************
     * @type            : Function
     * @function name   : get_single_guardian
     * @description     : "Load single guardian information" from database                  
     *                    to the user interface   
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function get_single_guardian(){
        
       $guardian_id = $this->input->post('guardian_id');
       
       $this->data['guardian'] = $this->guardian->get_single_guardian($guardian_id);
       $this->data['students'] = $this->guardian->get_student_list($guardian_id);
       $this->data['invoices'] = $this->guardian->get_invoice_list($guardian_id);  
       
       echo $this->load->view('get-single-guardian', $this->data);
    }
    
        
    /*****************Function _prepare_guardian_validation**********************************
    * @type            : Function
    * @function name   : _prepare_guardian_validation
    * @description     : Process "Guardian" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_guardian_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');

        if (!$this->input->post('id')) {
            $this->form_validation->set_rules('email', $this->lang->line('email'), 'trim|required|valid_email|callback_email');
            $this->form_validation->set_rules('password', $this->lang->line('password'), 'trim|required');
        }

        $this->form_validation->set_rules('role_id', $this->lang->line('role'), 'trim|required');
        $this->form_validation->set_rules('name', $this->lang->line('name'), 'trim|required');
        $this->form_validation->set_rules('phone', $this->lang->line('phone'), 'trim|required');
        $this->form_validation->set_rules('profession', $this->lang->line('profession'), 'trim');
        $this->form_validation->set_rules('present_address', $this->lang->line('present') . ' ' . $this->lang->line('address'), 'trim');
        $this->form_validation->set_rules('permanent_address', $this->lang->line('permanent') . ' ' . $this->lang->line('address'), 'trim');
        $this->form_validation->set_rules('religion', $this->lang->line('religion'), 'trim');
        $this->form_validation->set_rules('other_info', $this->lang->line('other_info'), 'trim');
    }

                        
    /*****************Function email**********************************
    * @type            : Function
    * @function name   : email
    * @description     : Unique check for "Guardian Email" data/value                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
    public function email() {
        if ($this->input->post('id') == '') {
            $email = $this->guardian->duplicate_check($this->input->post('email'));
            if ($email) {
                $this->form_validation->set_message('email', $this->lang->line('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else if ($this->input->post('id') != '') {
            $email = $this->guardian->duplicate_check($this->input->post('email'), $this->input->post('id'));
            if ($email) {
                $this->form_validation->set_message('email', $this->lang->line('already_exist'));
                return FALSE;
            } else {
                return TRUE;
            }
        } else {
            return TRUE;
        }
    }
       
    /*****************Function _get_posted_guardian_data**********************************
    * @type            : Function
    * @function name   : _get_posted_guardian_data
    * @description     : Prepare "Guardian" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_guardian_data() {

        $items = array();

        $items[] = 'name';
        $items[] = 'national_id';
        $items[] = 'phone';
        $items[] = 'profession';
        $items[] = 'present_address';
        $items[] = 'permanent_address';
        $items[] = 'religion';
        $items[] = 'other_info';

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
            // create user 
            $data['user_id'] = $this->guardian->create_user();
        }

        if ($_FILES['photo']['name']) {
            $data['photo'] = $this->_upload_photo();
        }

        return $data;
    }

    
          
    /*****************Function _upload_photo**********************************
    * @type            : Function
    * @function name   : _upload_photo
    * @description     : Process to upload "Guardian" photo in the server                  
    *                    and return photo name    
    * @param           : null
    * @return          : $return_photo string value 
    * ********************************************************** */ 
    private function _upload_photo() {

        $prev_photo = $this->input->post('prev_photo');
        $photo = $_FILES['photo']['name'];
        $photo_type = $_FILES['photo']['type'];
        $return_photo = '';
        if ($photo != "") {
            if ($photo_type == 'image/jpeg' || $photo_type == 'image/pjpeg' ||
                    $photo_type == 'image/jpg' || $photo_type == 'image/png' ||
                    $photo_type == 'image/x-png' || $photo_type == 'image/gif') {

                $destination = 'assets/uploads/guardian-photo/';

                $file_type = explode(".", $photo);
                $extension = strtolower($file_type[count($file_type) - 1]);
                $photo_path = 'photo-' . time() . '-sms.' . $extension;

                move_uploaded_file($_FILES['photo']['tmp_name'], $destination . $photo_path);

                // need to unlink previous photo
                if ($prev_photo != "") {
                    if (file_exists($destination . $prev_photo)) {
                        @unlink($destination . $prev_photo);
                    }
                }

                $return_photo = $photo_path;
            }
        } else {
            $return_photo = $prev_photo;
        }

        return $return_photo;
    }

    
    /*****************Function delete**********************************
    * @type            : Function
    * @function name   : delete
    * @description     : delete "Guardian" data from database                  
    *                    and unlink guardian photo from server   
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function delete($id = null) {

        check_permission(DELETE);
        
        if(!is_numeric($id)){
             error($this->lang->line('unexpected_error'));
             redirect('guardian/index');
        }
        
        $guardian = $this->guardian->get_single('guardians', array('id' => $id));
        if (!empty($guardian)) {

            // delete guardian data
            $this->guardian->delete('guardians', array('id' => $id));
            // delete guardian login data
            $this->guardian->delete('users', array('id' => $guardian->user_id));

            // delete guardian resume and photo
            $destination = 'assets/uploads/';
            if (file_exists($destination . '/guardian-photo/' . $guardian->photo)) {
                @unlink($destination . '/guardian-photo/' . $guardian->photo);
            }
            
            create_log('Has been deleted a Guardian : '.$guardian->name);

            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
       redirect('guardian/index');
    }

    /*****************Function due**********************************
    * @type            : Function
    * @function name   : due
    * @description     : Load "Due Invoice List" user interface                 
    *                        
    * @param           : null
    * @return          : null 
    * ***********************************************************/
    public function invoice() {    
        
        if(GUARDIAN != logged_in_role_id()){
             error($this->lang->line('unexpected_error'));
             redirect('dashboard');
        }
         
        $this->data['invoices'] = $this->guardian->get_invoice_list($this->session->userdata('profile_id'));  
        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('invoice'). ' | ' . SMS);
        $this->layout->view('invoice/invoice', $this->data);            
       
    }
}
