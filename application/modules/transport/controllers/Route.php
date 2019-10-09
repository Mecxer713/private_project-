<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/* * *****************Route.php**********************************
 * @product name    : Global School Management System Pro
 * @type            : Class
 * @class name      : Route
 * @description     : Manage transport route.  
 * @author          : Codetroopers Team 	
 * @url             : https://themeforest.net/user/codetroopers      
 * @support         : yousuf361@gmail.com	
 * @copyright       : Codetroopers Team	 	
 * ********************************************************** */

class Route extends MY_Controller {

    public $data = array();

    function __construct() {
        parent::__construct();
       
        $this->load->model('Route_Model', 'route', true);      
        
    }

        
    /*****************Function index**********************************
    * @type            : Function
    * @function name   : index
    * @description     : Load "Transport Route List" user interface                 
    *                    
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    public function index() {

        check_permission(VIEW);

        $this->data['routes'] = $this->route->get_list('routes', array('status' => 1));
        $this->data['add_vehicles'] = $this->route->get_vehicle_list();
       
        $this->data['list'] = TRUE;
        $this->layout->title($this->lang->line('manage_route') . ' | ' . SMS);
        $this->layout->view('route/index', $this->data);
    }

    
    /*****************Function add**********************************
    * @type            : Function
    * @function name   : add
    * @description     : Load "Add new Transport Route" user interface                 
    *                    and process to store "Transport Route" into database 
    * @param           : null
    * @return          : null 
    * ***********************************************************/
    public function add() {

        check_permission(ADD);

        if ($_POST) {
            $this->_prepare_route_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_route_data();

                $insert_id = $this->route->insert('routes', $data);
                if ($insert_id) {
                    $this->_save_stop($insert_id);
                    
                    create_log('Has been created a Route : '.$data['title']);
                    success($this->lang->line('insert_success'));
                    redirect('transport/route/index');
                } else {
                    error($this->lang->line('insert_failed'));
                    redirect('transport/route/add');
                }
            } else {
                $this->data['post'] = $_POST;
            }
        }

        $this->data['routes'] = $this->route->get_list('routes', array('status' => 1));
        $this->data['add_vehicles'] = $this->route->get_vehicle_list();
        
        $this->data['add'] = TRUE;
        $this->layout->title($this->lang->line('add') . ' ' . $this->lang->line('route') . ' | ' . SMS);
        $this->layout->view('route/index', $this->data);
    }

    
    /*****************Function edit**********************************
    * @type            : Function
    * @function name   : edit
    * @description     : Load Update "Transport Route" user interface                 
    *                    with populate "Transport Route" value 
    *                    and process to update "Transport Route" into database    
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function edit($id = null) {

        check_permission(EDIT);

        if(!is_numeric($id)){
           error($this->lang->line('unexpected_error'));
          redirect('transport/route/index');
        }
        
        if ($_POST) {
            $this->_prepare_route_validation();
            if ($this->form_validation->run() === TRUE) {
                $data = $this->_get_posted_route_data();
                $updated = $this->route->update('routes', $data, array('id' => $this->input->post('id')));

                if ($updated) {
                    $this->_save_stop($this->input->post('id'));
                    
                    create_log('Has been updated a Route : '.$data['title']);
                    success($this->lang->line('update_success'));
                    redirect('transport/route/index');
                } else {
                    error($this->lang->line('update_failed'));
                    redirect('transport/route/edit/' . $this->input->post('id'));
                }
            } else {
                $this->data['post'] = $_POST;
                $this->data['route'] = $this->route->get_single('routes', array('id' => $this->input->post('id')));
            }
        }

        if ($id) {
            $this->data['route'] = $this->route->get_single('routes', array('id' => $id));

            if (!$this->data['route']) {
                redirect('transport/route/index');
            }
        }
        
       
        $this->data['edit_vehicles'] = $this->route->get_vehicle_list($this->data['route']->id); 
        $this->data['add_vehicles'] = $this->route->get_vehicle_list();
        $this->data['routes'] = $this->route->get_list('routes', array('status' => 1));
        
        $this->data['route_stops'] = $this->route->get_list('route_stops', array('status' => 1,'route_id'=>$id), '','', '','','id','ASC');
        
        $this->data['edit'] = TRUE;
        $this->layout->title($this->lang->line('edit') . ' ' . $this->lang->line('route') . ' | ' . SMS);
        $this->layout->view('route/index', $this->data);
    }

        
    /*****************Function view**********************************
    * @type            : Function
    * @function name   : view
    * @description     : Load user interface with specific Transport Route data                 
    *                       
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function view($id = null) {

        check_permission(VIEW);

        if(!is_numeric($id)){
           error($this->lang->line('unexpected_error'));
          redirect('transport/route/index');
        }
        
        $this->data['route'] = $this->route->get_single('routes', array('id' => $id));
        $this->data['add_vehicles'] = $this->route->get_vehicle_list();
        $this->data['routes'] = $this->route->get_list('routes', array('status' => 1));
        
        $this->data['detail'] = TRUE;
        $this->layout->title($this->lang->line('view') . ' ' . $this->lang->line('route') . ' | ' . SMS);
        $this->layout->view('route/index', $this->data);
    }
    
    
        
     /*****************Function get_single_route**********************************
     * @type            : Function
     * @function name   : get_single_route
     * @description     : "Load single route information" from database                  
     *                    to the user interface   
     * @param           : null
     * @return          : null 
     * ********************************************************** */
    public function get_single_route(){
        
       $route_id = $this->input->post('route_id');
       
       $this->data['route'] = $this->route->get_single('routes', array('id' => $route_id));
       $this->data['route_stops'] = $this->route->get_list('route_stops', array('status' => 1,'route_id'=>$route_id), '','', '','','id','ASC');
       echo $this->load->view('route/get-single-route', $this->data);
    }

        
    /*****************Function _prepare_route_validation**********************************
    * @type            : Function
    * @function name   : _prepare_route_validation
    * @description     : Process "Transport Route" user input data validation                 
    *                       
    * @param           : null
    * @return          : null 
    * ********************************************************** */
    private function _prepare_route_validation() {
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div route="error-message" style="color: red;">', '</div>');

        $this->form_validation->set_rules('title', $this->lang->line('transport_route'), 'trim|required|callback_title');
        $this->form_validation->set_rules('vehicle_ids', $this->lang->line('assign_vehicle'), 'trim|callback_vehicle_ids');
        $this->form_validation->set_rules('route_start', $this->lang->line('route_start'), 'trim|required');
        $this->form_validation->set_rules('route_end', $this->lang->line('route_end'), 'trim|required');
        $this->form_validation->set_rules('note', $this->lang->line('note'), 'trim');
    }

        
    /*****************Function vehicle_ids**********************************
    * @type            : Function
    * @function name   : vehicle_ids
    * @description     : Validate vehicle for the Transport Route                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
    public function vehicle_ids() {

        if (!$this->input->post('vehicle_ids')) {
            $this->form_validation->set_message('title', $this->lang->line('already_exist'));
            return FALSE;
        } else {
            return TRUE;
        }
    }

    /*****************Function title**********************************
    * @type            : Function
    * @function name   : title
    * @description     : Validate title for the Transport Route                  
    *                       
    * @param           : null
    * @return          : boolean true/false 
    * ********************************************************** */ 
    public function title() {
        if ($this->input->post('id') == '') {
            $route = $this->route->duplicate_check($this->input->post('title'));
            if ($route) {
                $this->form_validation->set_message('title', 'This route title alredy exists');
                return FALSE;
            } else {
                return TRUE;
            }
        } else if ($this->input->post('id') != '') {
            $route = $this->route->duplicate_check($this->input->post('title'), $this->input->post('id'));
            if ($route) {
                $this->form_validation->set_message('title', 'This route title alredy exists');
                return FALSE;
            } else {
                return TRUE;
            }
        } else {
            return TRUE;
        }
    }

       
    /*****************Function _get_posted_route_data**********************************
    * @type            : Function
    * @function name   : _get_posted_route_data
    * @description     : Prepare "Transport Route" user input data to save into database                  
    *                       
    * @param           : null
    * @return          : $data array(); value 
    * ********************************************************** */
    private function _get_posted_route_data() {

        $items = array();
        $items[] = 'title';
        $items[] = 'route_start';
        $items[] = 'route_end';
        $items[] = 'note';

        $data = elements($items, $_POST);

        if ($this->input->post('id')) {
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
            $this->_update_vehicle_status($this->input->post('id'));
        } else {
            $data['status'] = 1;
            $data['created_at'] = date('Y-m-d H:i:s');
            $data['created_by'] = logged_in_user_id();
            $data['modified_at'] = date('Y-m-d H:i:s');
            $data['modified_by'] = logged_in_user_id();
            $this->_update_vehicle_status();
        }

        $data['vehicle_ids'] = $this->input->post('vehicle_ids') ? implode(',', $this->input->post('vehicle_ids')) : '';


        return $data;
    }

           
    /*****************Function __update_vehicle_status**********************************
    * @type            : Function
    * @function name   : __update_vehicle_status
    * @description     : process to update vehicle status while create/update a Transport Route                  
    *                       
    * @param           : null
    * @return          : null
    * ********************************************************** */
    private function _update_vehicle_status($id = null) {

        if ($id) {
            $route = $this->route->get_single('routes', array('id' => $id));
            $ids = explode(',', $route->vehicle_ids);
            if (!empty($ids)) {
                foreach ($ids as $key => $value) {
                    $this->route->update('vehicles', array('is_allocated' => 0), array('id' => $value));
                }
            }
        }

        if ($this->input->post('vehicle_ids')) {
            foreach ($this->input->post('vehicle_ids') as $key => $value) {
                $this->route->update('vehicles', array('is_allocated' => 1), array('id' => $value));
            }
        }
    }

        
    /***************** Function delete **********************************
    * @type            : Function
    * @function name   : delete
    * @description     : delete "Transpoer Route" data from database                  
    *                       
    * @param           : $id integer value
    * @return          : null 
    * ********************************************************** */
    public function delete($id = null) {

        check_permission(DELETE);

        if(!is_numeric($id)){
         error($this->lang->line('unexpected_error'));
          redirect('transport/route/index');
        }
        
        // update vehicle status
        $route = $this->route->get_single('routes', array('id' => $id));

        if ($this->route->delete('routes', array('id' => $id))) {

            // delete route stop
            $this->route->delete('route_stops', array('route_id' => $id));
            
            // update vehicle assign status
            $ids = explode(',', $route->vehicle_ids);
            if (!empty($ids)) {
                foreach ($ids as $key => $value) {
                    $this->route->update('vehicles', array('is_allocated' => 0), array('id' => $value));
                }
            }
            
            create_log('Has been deleted a Route : '.$route->title);
            success($this->lang->line('delete_success'));
        } else {
            error($this->lang->line('delete_failed'));
        }
        redirect('transport/route/index');
    }
    
    
    /*****************Function _save_stop**********************************
    * @type            : Function
    * @function name   : _save_stop
    * @description     : delete "Save bus stop " into database                  
    *                       
    * @param           : $route_id integer value
    * @return          : null 
    * ********************************************************** */
    private function _save_stop($route_id){
        
        foreach($this->input->post('stop_name') as $key=>$value){
            
            if($value){
                
                $data = array();
                $exist = '';
                //$stop_id = @$this->input->post('stop_id')[$key];
                $stop_id = @$_POST['stop_id'][$key];

                if($stop_id){
                   $exist = $this->route->get_single('route_stops', array('route_id'=>$route_id, 'id'=>$stop_id));
                }         


                $data['stop_name'] = $value;
                //$data['stop_km'] = $this->input->post('stop_km')[$key];
                //$data['stop_fare'] = $this->input->post('stop_fare')[$key];
                $data['stop_km'] = @$_POST['stop_km'][$key];
                $data['stop_fare'] = @$_POST['stop_fare'][$key];

                if ($this->input->post('id') && $exist) {                

                    $data['modified_at'] = date('Y-m-d H:i:s');
                    $data['modified_by'] = logged_in_user_id();                
                    $this->route->update('route_stops', $data, array('id'=>$exist->id));

                } else {

                    $data['route_id'] = $route_id;                                   
                    $data['status'] = 1;
                    $data['created_at'] = date('Y-m-d H:i:s');
                    $data['created_by'] = logged_in_user_id(); 
                    $data['modified_at'] = date('Y-m-d H:i:s');
                    $data['modified_by'] = logged_in_user_id();
                    $this->route->insert('route_stops', $data);
                }
            }
        }
    }
    
    
    public function remove_stop(){
        
        $stop_id = $this->input->post('stop_id');
        echo $this->route->delete('route_stops', array('id' => $stop_id));
    }

}
