<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************News.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : News
 * @description     : Manage school academic news.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * *********************** *********************************** */

class News extends MY_Controller {

    public $data = array();
    
    
    function __construct() {
        parent::__construct();
         $this->load->model('News_Model', 'news', true);               
    }

    
    
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "News List" user interface                 
    *                        
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {
        
         check_permission(VIEW);
        
         $this->data['news_list'] = $this->news->get_list('news', array('status'=>1), '','', '', 'id', 'DESC');  
        $this->data['list'] = TRUE;
        $this->layout->title( $this->lang->line('manage_news'). ' | ' . SMS);
        $this->layout->view('news/index', $this->data);            
       
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new News" user interface                 
    *                    and store "News" into database 
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);
         
        if ($_POST) {
            $this->_prepare_news_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_news_data();

                $insert_id = $this->news->insert('news', $data);
                if ($insert_id) {
                    
                    create_log('Has been created a news : '.$data['title']); 
                    
                    success($this->lang->line('insert_success'));
                    redirect('announcement/news/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('announcement/news/add');
                }
            } else {
                $this->data['post'] = $_POST;
            }
        }
        
        $this->data['news_list'] = $this->news->get_list('news', array('status'=>1));  
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add'). ' ' . $this->lang->line('news'). ' | ' . SMS);
        $this->layout->view('news/index', $this->data);
    }

    
    /*****************Function edit**********************************
    * @type            : Function
    * @function name   : edit
    * @description     : Load Update "News" user interface                 
    *                    with populated "News" value 
    *                    and update "News" database    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function edit($id = null) {       
       
         check_permission(EDIT);
        
         if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('announcement/news/index');    
        }
        
        if ($_POST) {
            $this->_prepare_news_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_news_data();
                $updated = $this->news->update('news', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    
                    create_log('Has been updated a news : '.$data['title']); 
                    
                    success($this->lang->line('update_success'));
                    redirect('announcement/news/index');                   
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('announcement/news/edit/' . $this->input->post('id'));
                }
            } else {
                 $this->data['news'] = $this->news->get_single('news', array('id' => $this->input->post('id')));
            }
        }
        
        if ($id) {
            $this->data['news'] = $this->news->get_single('news', array('id' => $id));

            if (!$this->data['news']) {
                 redirect('announcement/news/index');
            }
        }

        $this->data['news_list'] = $this->news->get_list('news', array('status'=>1));  
        $this->data['edit'] = TRUE;       
        $this->layout->title($this->lang->line('edit'). ' ' . $this->lang->line('news'). ' | ' . SMS);
        $this->layout->view('news/index', $this->data);
    }
    
    
    /*****************Function view**********************************
    * @type            : Function
    * @function name   : view
    * @description     : Load user interface with specific news data                 
    *                       
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function view($id = null){
        
         check_permission(VIEW);
         if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('announcement/news/index');    
        }
        
        $this->data['news_list'] = $this->news->get_list('news', array('status'=>1)); 
        $this->data['news'] = $this->news->get_single('news', array('id' => $id));
        $this->data['detail'] = TRUE;       
        $this->layout->title($this->lang->line('view'). ' ' . $this->lang->line('news'). ' | ' . SMS);
        $this->layout->view('news/index', $this->data);
    }
    
               
     /*****************Function get_single_news**********************************
     * @type            : Function
     * @function name   : get_single_news
     * @description     : "Load single news information" from database                  
     *                    to the user interface   
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function get_single_news(){
        
       $news_id = $this->input->post('news_id');
       
       $this->data['news'] = $this->news->get_single('news', array('id' => $news_id));
       echo $this->load->view('news/get-single-news', $this->data);
    }
    

    
    
    /*****************Function _prepare_news_validation**********************************
    * @type            : Function
    * @function name   : _prepare_news_validation
    * @description     : Process "News" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_news_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="color: red;">', '</div>');
        
        $this->form_validation->set_rules('title', $this->lang->line('title'), 'trim|required|callback_title');   
        $this->form_validation->set_rules('date', $this->lang->line('date'), 'trim|required');   
        $this->form_validation->set_rules('news', $this->lang->line('news'), 'trim|required');   
        $this->form_validation->set_rules('image', $this->lang->line('image'), 'trim|callback_image');   
    }
   
    
    /*****************Function title**********************************
    * @type            : Function
    * @function name   : title
    * @description     : Unique check for "news title" data/value                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
   public function title()
   {             
      if($this->input->post('id') == '')
      {   
          $news = $this->news->duplicate_check($this->input->post('title'), $this->input->post('date')); 
          if($news){
                $this->form_validation->set_message('title', $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }          
      }else if($this->input->post('id') != ''){   
         $news = $this->news->duplicate_check($this->input->post('title'),$this->input->post('date'), $this->input->post('id')); 
          if($news){
                $this->form_validation->set_message('title', $this->lang->line('already_exist'));         
                return FALSE;
          } else {
              return TRUE;
          }
      }   
   }

   
   
    /*****************Function image**********************************
    * @type            : Function
    * @function name   : image
    * @description     : Check image format validation                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
   public function image()
   {   
        if($_FILES['image']['name']){
            $name = $_FILES['image']['name'];
            $arr = explode('.', $name);
            $ext = end($arr); 
            if($ext == 'jpg' || $ext == 'jpeg' || $ext == 'png' || $ext == 'gif'){
                return TRUE;
            } else {
                $this->form_validation->set_message('image', $this->lang->line('select_valid_file_format'));         
                return FALSE; 
            }
        }       
   }
   
   
    /*****************Function _get_posted_news_data**********************************
    * @type            : Function
    * @function name   : _get_posted_news_data
    * @description     : Prepare "News" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_news_data() {

        $items = array();
        $items[] = 'title';
        $items[] = 'news';
        $items[] = 'is_view_on_web';
         
        $data = elements($items, $_POST);  
      
        $data['date'] = date('Y-m-d', strtotime($this->input->post('date')));
        
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
        
        if(isset($_FILES['image']['name'])){  
            $data['image'] =  $this->_upload_image();
          }

        return $data;
    }

    
    
    /*****************Function _upload_image**********************************
    * @type            : Function
    * @function name   : _upload_image
    * @description     : Process to upload news image and return image name                 
    *                       
    * @param           : null
    * @return          : $return_image  string value 
    * ********************************************************** */
      private function _upload_image(){
       
        $prev_image     = $this->input->post('prev_image');
        $image          = $_FILES['image']['name'];
        $image_type     = $_FILES['image']['type'];
        $return_image   = '';
        if ($image != "") {
            if ($image_type == 'image/jpeg' || $image_type == 'image/pjpeg' ||
                    $image_type == 'image/jpg' || $image_type == 'image/png' ||
                    $image_type == 'image/x-png' || $image_type == 'image/gif') {

                $destination = 'assets/uploads/news/';               

                $file_type  = explode(".", $image);
                $extension  = strtolower($file_type[count($file_type) - 1]);
                $image_path = 'news-'.time() . '-sms.' . $extension;

                move_uploaded_file($_FILES['image']['tmp_name'], $destination . $image_path);

                // need to unlink previous image
                if ($prev_image != "") {
                    if (file_exists($destination . $prev_image)) {
                        @unlink($destination . $prev_image);
                    }
                }

                $return_image = $image_path;
            }
        } else {
            $return_image = $prev_image;
        }

        return $return_image;
    }
    
    
     /*****************Function delete**********************************
     * @type            : Function
     * @function name   : delete
     * @description     : delete "News" from database                  
     *                    and unlink news image from server   
     * @param           : $id integer value
     * @return          : null 
     * ********************************************************** */
    public function delete($id = null) {
        
         check_permission(DELETE);
         
        if(!is_numeric($id)){
            error($this->lang->line('unexpected_error'));
            redirect('announcement/news/index');    
        }
        
        $news = $this->news->get_single('news', array('id' => $id));
        if ($this->news->delete('news', array('id' => $id))) {  
            
            // delete teacher resume and image
            $destination = 'assets/uploads/';
            if (file_exists( $destination.'/news/'.$news->image)) {
                @unlink($destination.'/news/'.$news->image);
            }
            
            create_log('Has been deleted a news : '.$news->title); 
            
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('announcement/news/index'); 
    }

}
