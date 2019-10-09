<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * ***************Profile.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Profile
 * @description     : This class used to manage logged in users 
 *                    profile information of the application.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Profile extends My_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->model('Profile_Model', 'profile', true);
        $this->data['designations'] = $this->profile->get_list('designations', array('status' => 1), '', '', '', 'id', 'ASC');
    }

    public $data = array();

    /**     * *************Function index**********************************
     * @type            : Function
     * @function name   : index
     * @description     : this function used to load logged in user profile information            
     * @param           : null; 
     * @return          : null 
     * ********************************************************** */
    public function index() {

        $this->layout->title($this->lang->line('my_profile') . ' | ' . SMS);

        $role_id = $this->session->userdata('role_id');
        $user_id = $this->session->userdata('user_id');
        $profile_id = $this->session->userdata('profile_id');

        $this->data['profile'] = get_user_by_role($role_id, $user_id);
        $this->data['info'] = TRUE;

        if ($role_id == STUDENT) {
            $this->data['guardians'] = $this->profile->get_list('guardians', array('status' => 1), '', '', '', 'id', 'ASC');
            $this->layout->view('profile/student', $this->data);
        } elseif ($role_id == GUARDIAN) {
            
            $this->data['students'] = $this->profile->get_student_list($profile_id);
            $this->layout->view('profile/guardian', $this->data);
            
        } elseif ($role_id == TEACHER) {
            $this->layout->view('profile/teacher', $this->data);
        } else {
            $this->layout->view('profile/employee', $this->data);
        }
    }

    /**     * *************Function update**********************************
     * @type            : Function
     * @function name   : update
     * @description     : this function used to update logged user profile inormation            
     * @param           : null; 
     * @return          : null 
     * ********************************************************** */
    public function update() {

        if ($_POST) {

            if ($this->input->post('user_type') == 'employee') {
                $data = $this->_get_posted_data();
                $updated = $this->profile->update('employees', $data, array('id' => $this->input->post('id')));
            }
            if ($this->input->post('user_type') == 'teacher') {
                $data = $this->_get_posted_data();
                $updated = $this->profile->update('teachers', $data, array('id' => $this->input->post('id')));
            }
            if ($this->input->post('user_type') == 'guardian') {
                $data = $this->_get_posted_data();
                $updated = $this->profile->update('guardians', $data, array('id' => $this->input->post('id')));
            }
            if ($this->input->post('user_type') == 'student') {
                $data = $this->_get_posted_data();
                $updated = $this->profile->update('students', $data, array('id' => $this->input->post('id')));
            }
        }
        
        create_log('Update Profile');
        success($this->lang->line('update_success'));
        redirect('profile');
    }

    /**     * *************Function password**********************************
     * @type            : Function
     * @function name   : password
     * @description     : this function used to reset logged user password            
     * @param           : null; 
     * @return          : null 
     * ********************************************************** */
    public function password() {

        if ($_POST) {
            $this->load->library('form_validation');
            $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
            $this->form_validation->set_rules('password', $this->lang->line('password'), 'trim|required|min_length[5]|max_length[12]');
            $this->form_validation->set_rules('conf_password', $this->lang->line('conf_password'), 'trim|required|matches[password]');

            if ($this->form_validation->run() === TRUE) {
                $data['password'] = md5($this->input->post('password'));
                $data['temp_password'] = base64_encode($this->input->post('password'));
                $data['modified_at'] = date('Y-m-d H:i:s');
                $data['modified_by'] = logged_in_user_id();
                $this->profile->update('users', $data, array('id' => logged_in_user_id()));
                
                create_log('Update Password');
                success($this->lang->line('update_success'));
                redirect('profile');
            }
        }

        $this->layout->title($this->lang->line('reset_password') . ' | ' . SMS);
        $this->layout->view('profile/password', $this->data);
    }

    /**     * *************Function _get_posted_data**********************************
     * @type            : Function
     * @function name   : _get_posted_data
     * @description     : this private function used to maintain/prepare user post data/value            
     * @param           : null; 
     * @return          : null 
     * ********************************************************** */
    private function _get_posted_data() {

        $items = array();
        // only for employee
        if ($this->input->post('user_type') == 'employee') {
            
            $items[] = 'gender';
            $items[] = 'blood_group';           
            $items[] = 'facebook_url';
            $items[] = 'linkedin_url';
            $items[] = 'google_plus_url';
            $items[] = 'instagram_url';
            $items[] = 'pinterest_url';
            $items[] = 'twitter_url';
            $items[] = 'youtube_url';
        }
        // only for teacher
        if ($this->input->post('user_type') == 'teacher') {
            
            $items[] = 'gender';
            $items[] = 'blood_group';           
            $items[] = 'facebook_url';
            $items[] = 'linkedin_url';
            $items[] = 'google_plus_url';
            $items[] = 'instagram_url';
            $items[] = 'pinterest_url';
            $items[] = 'twitter_url';
            $items[] = 'youtube_url';
        }

        // only for guardian
        if ($this->input->post('user_type') == 'guardian') {
             $items[] = 'profession';
        }

        // only ro student
        if ($this->input->post('user_type') == 'student') {           
            $items[] = 'gender';
            $items[] = 'blood_group';           
            $items[] = 'relation_with';          
            $items[] = 'second_language';
            $items[] = 'health_condition';
        }

        // common data
        $items[] = 'name';
        $items[] = 'national_id';
        $items[] = 'phone';
        $items[] = 'present_address';
        $items[] = 'permanent_address';
        $items[] = 'religion';
        $items[] = 'other_info';
        $data = elements($items, $_POST);

        if ($this->input->post('user_type') == 'employee' || $this->input->post('user_type') == 'teacher') {

            $data['dob'] = date('Y-m-d', strtotime($this->input->post('dob')));

            if ($_FILES['resume']['name']) {
                $data['resume'] = $this->_upload_resume();
            }
        }

        if ($this->input->post('user_type') == 'student') {
            $data['dob'] = date('Y-m-d', strtotime($this->input->post('dob')));
        }

        if ($_FILES['photo']['name']) {
            $data['photo'] = $this->_upload_photo();
        }

        // common data 
        $data['modified_at'] = date('Y-m-d H:i:s');
        $data['modified_by'] = logged_in_user_id();
        return $data;
    }

    /**     * *************Function _upload_photo**********************************
     * @type            : Function
     * @function name   : _upload_photo
     * @description     : this private function used to upload user profile photo            
     * @param           : null; 
     * @return          : null 
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

                $destination = 'assets/uploads/' . $this->input->post('user_type') . '-photo/';

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

    /*     * **************Function _upload_photo**********************************
     * @type            : Function
     * @function name   : _upload_photo
     * @description     : this private function used to upload user profile resume            
     * @param           : null; 
     * @return          : null 
     * ********************************************************** */

    private function _upload_resume() {

        $prev_resume = $this->input->post('prev_resume');
        $resume = $_FILES['resume']['name'];
        $resume_type = $_FILES['resume']['type'];
        $return_resume = '';

        if ($resume != "") {
            if ($resume_type == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ||
                    $resume_type == 'application/msword' || $resume_type == 'text/plain' ||
                    $resume_type == 'application/vnd.ms-office' || $resume_type == 'application/pdf') {

                $destination = 'assets/uploads/' . $this->input->post('user_type') . '-resume/';

                $file_type = explode(".", $resume);
                $extension = strtolower($file_type[count($file_type) - 1]);
                $resume_path = 'resume-' . time() . '-sms.' . $extension;

                move_uploaded_file($_FILES['resume']['tmp_name'], $destination . $resume_path);

                // need to unlink previous photo
                if ($prev_resume != "") {
                    if (file_exists($destination . $prev_resume)) {
                        @unlink($destination . $prev_resume);
                    }
                }

                $return_resume = $resume_path;
            }
        } else {
            $return_resume = $prev_resume;
        }

        return $return_resume;
    }

}
