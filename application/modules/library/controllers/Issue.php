<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Issue.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Issue
 * @description     : Manage library book issue and return by student from library.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Issue extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
        $this->load->model('Book_Model', 'book', true);
        
       // check running session
        if(!$this->academic_year_id){
            error($this->lang->line('academic_year_setting'));
            redirect('setting');
        }   
    }

        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Issued Book List" user interface                 
    *                        
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        $this->data['books'] = $this->book->get_list('books', array('status' => 1));        
        $this->data['members'] = $this->book->get_library_member_list($is_library_member = 1);
        $this->data['issue_books'] = $this->book->get_book_issued_list();
        
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('issue_and_return') . ' | ' . SMS);
        $this->layout->view('issue/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new Issue Book" user interface                 
    *                    and process to store "Issued List" into database 
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function add() {

        check_permission(ADD);

        if ($_POST) {
            $this->_prepare_issue_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_issue_data();

                $insert_id = $this->book->insert('book_issues', $data);
                if ($insert_id) {
                    
                    $book = $this->book->get_single('books', array('id' => $data['book_id']));
                    create_log('Has been issued a Book : '.$book->title);
                    
                    $this->book->update_qty($data['book_id'], 'issue');
                    success($this->lang->line('insert_success'));
                } else {
                    error($this->lang->line('insert_failed'));
                }
                redirect('library/issue');
            }
        }

        $this->data['books'] = $this->book->get_list('books', array('status' => 1));
        $this->data['members'] = $this->book->get_library_member_list($is_library_member = 1);
        $this->data['issue_books'] = $this->book->get_book_issued_list();
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('issue_and_return') . ' | ' . SMS);
        $this->layout->view('issue/index', $this->data);
    }

        
    /*****************Function _prepare_issue_validation**********************************
    * @type            : Function
    * @function name   : _prepare_issue_validation
    * @description     : Process "Issue Book" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_issue_validation() {
        
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error-message" style="text-align: center;color: red;">', '</div>');

        $this->form_validation->set_rules('library_member_id', $this->lang->line('library') . ' ' . $this->lang->line('member'), 'trim|required');
        $this->form_validation->set_rules('book_id', $this->lang->line('book'), 'trim|required');
    }

       
    /*****************Function _get_posted_issue_data**********************************
    * @type            : Function
    * @function name   : _get_posted_issue_data
    * @description     : Prepare "Issue Book" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_issue_data() {

        $items = array();
        $items[] = 'library_member_id';
        $items[] = 'book_id';

        $data = elements($items, $_POST);

        $data['due_date'] = date('Y-m-d', strtotime($this->input->post('due_date')));

        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        } else {
            $data['academic_year_id'] = $this->academic_year_id;
            $data['is_returned'] = 0;
            $data['status'] = 1;
            $data['issue_date'] = date('Y-m-d');

            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id();
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
        }
        return $data;
    }


       
    /*****************Function get_book_by_id**********************************
    * @type            : Function
    * @function name   : get_book_by_id
    * @description     : get a Book data/information as per Ajax request                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function get_book_by_id() {

        $book_id = $this->input->post('book_id');
        $book = $this->book->get_single('books', array('id' => $book_id));
        echo json_encode($book);
    }

           
    /*****************Function return_book_by_id**********************************
    * @type            : Function
    * @function name   : return_book_by_id
    * @description     : process to return a issued book to the library               
    *                       
    * @param           : null
    * @return          : null
    * ********************************************************** */
    public function return_book_by_id() {

        $issue_id = $this->input->post('issue_id');
        $book_id = $this->input->post('book_id');
        $return_date = date('Y-m-d');      
        $this->book->update('book_issues', array('is_returned' => 1, 'return_date' => $return_date), array('id' => $issue_id));
        $this->book->update_qty($book_id, 'return');
        
        $book = $this->book->get_single('books', array('id' => $book_id));
        create_log('Has been return a Book : '.$book->title);
        
        echo TRUE;
    }

}
