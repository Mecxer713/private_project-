<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-male"></i><small> <?php echo $this->lang->line('manage_visitor'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                    
                    <ul  class="nav nav-tabs bordered">
                        <li class="<?php if(isset($list)){ echo 'active'; }?>"><a href="#tab_visitor_list"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo $this->lang->line('visitor_info'); ?> <?php echo $this->lang->line('list'); ?></a> </li>
                        <?php if(has_permission(ADD, 'visitor', 'visitor')){ ?> 
                            <li  class="<?php if(isset($add)){ echo 'active'; }?>"><a href="#tab_add_visitor"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-plus-square-o"></i> <?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('visitor_info'); ?></a> </li>                          
                        <?php } ?>
                        <?php if(isset($edit)){ ?>
                            <li  class="active"><a href="#tab_edit_visitor"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> <?php echo $this->lang->line('visitor_info'); ?></a> </li>                          
                        <?php } ?>                
                        <?php if(isset($detail)){ ?>
                            <li  class="active"><a href="#tab_view_visitor"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-eye"></i> <?php echo $this->lang->line('view'); ?> <?php echo $this->lang->line('visitor_info'); ?></a> </li>                          
                        <?php } ?>                
                    </ul>
                    <br/>
                    
                    <div class="tab-content">
                        <div  class="tab-pane fade in <?php if(isset($list)){ echo 'active'; }?>" id="tab_visitor_list" >
                            <div class="x_content">
                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('sl_no'); ?></th>
                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('phone'); ?></th>
                                        <th><?php echo $this->lang->line('to_meet'); ?></th>
                                        <th><?php echo $this->lang->line('reason_to_meet'); ?></th>
                                        <th><?php echo $this->lang->line('check_in'); ?></th>
                                        <th><?php echo $this->lang->line('check_out'); ?></th>
                                        <th><?php echo $this->lang->line('action'); ?></th>                                            
                                    </tr>
                                </thead>
                                <tbody>   
                                    <?php $count = 1; if(isset($visitors) && !empty($visitors)){ ?>
                                        <?php foreach($visitors as $obj){ ?>
                                        <tr>
                                            <td><?php echo $count++; ?></td>
                                            <td  data-toggle="tooltip" data-original-title="<?php echo $obj->note; ?>">
                                                <a><?php echo $obj->name; ?></a>
                                            </td>
                                            <td><?php echo $obj->phone; ?></td>
                                            <td><?php $user = get_user_by_role($obj->role_id, $obj->user_id); echo $user->name; ?><br/>(<?php echo $obj->role; ?>)</td>
                                            <td><?php echo $this->lang->line($obj->reason); ?></td>                                           
                                            <td><?php echo date($this->gsms_setting->sms_date_format. ' h:i:s A', strtotime($obj->check_in)); ?></td>                                           
                                            <td><?php echo $obj->check_out ? date($this->gsms_setting->sms_date_format . ' H:i:s A', strtotime($obj->check_out)) : '<a style="color:red;" href="javascript:void(0);" onclick="check_out('.$obj->id.');">'.$this->lang->line('check_out').'</a>'; ?></td>                                           
                                            <td>
                                                <?php if(has_permission(EDIT, 'visitor', 'visitor')){ ?>
                                                    <a href="<?php echo site_url('visitor/edit/'.$obj->id); ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> </a>
                                                <?php } ?>
                                                <?php if(has_permission(VIEW, 'visitor', 'visitor')){ ?>
                                                    <a  onclick="get_visitor_modal(<?php echo $obj->id; ?>);"  data-toggle="modal" data-target=".bs-visitor-modal-lg"  class="btn btn-success btn-xs"><i class="fa fa-eye"></i> <?php echo $this->lang->line('view'); ?> </a>
                                                <?php } ?>
                                                <?php if(has_permission(DELETE, 'visitor', 'visitor')){ ?>
                                                    <a href="<?php echo site_url('visitor/delete/'.$obj->id); ?>" onclick="javascript: return confirm('<?php echo $this->lang->line('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo $this->lang->line('delete'); ?> </a>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                        </div>

                        <div  class="tab-pane fade in <?php if(isset($add)){ echo 'active'; }?>" id="tab_add_visitor">
                            <div class="x_content"> 
                               <?php echo form_open_multipart(site_url('visitor/add'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo $this->lang->line('name'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="name"  id="name" value="<?php echo isset($post['name']) ?  $post['name'] : ''; ?>" placeholder="<?php echo $this->lang->line('name'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('name'); ?></div>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone"><?php echo $this->lang->line('phone'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="phone"  id="phone" value="<?php echo isset($post['phone']) ?  $post['phone'] : ''; ?>" placeholder="<?php echo $this->lang->line('phone'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('phone'); ?></div>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="coming_from"><?php echo $this->lang->line('coming_from'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="coming_from"  id="coming_from" value="<?php echo isset($post['coming_from']) ?  $post['coming_from'] : ''; ?>" placeholder="<?php echo $this->lang->line('coming_from'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('coming_from'); ?></div>
                                    </div>
                                </div>

                                 <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role_id"><?php echo $this->lang->line('to_meet'); ?> <?php echo $this->lang->line('user'); ?> <?php echo $this->lang->line('type'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_user_by_role(this.value, '');">
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option> 
                                            <?php foreach($roles as $obj ){ ?>
                                                <?php if(!in_array($obj->id, array(GUARDIAN))){ ?>
                                                <option value="<?php echo $obj->id; ?>" ><?php echo $obj->name; ?></option>
                                                <?php } ?>                                            
                                            <?php } ?>                                            
                                        </select>
                                        <div class="help-block"><?php echo form_error('role_id'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_id"><?php echo $this->lang->line('to_meet'); ?>  <?php echo $this->lang->line('user'); ?> <?php echo $this->lang->line('name'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="user_id"  id="add_user_id" required="required" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>                                                                                         
                                        </select>
                                        <div class="help-block"><?php echo form_error('user_id'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="reason"><?php echo $this->lang->line('reason_to_meet'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="reason"  id="reason" required="required" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>  
                                            <?php $reasons = get_visitor_reasons(); ?>
                                            <?php foreach($reasons as $key=>$value){ ?>
                                                <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
                                            <?php } ?>
                                        </select>
                                        <div class="help-block"><?php echo form_error('reason'); ?></div>
                                    </div>
                                </div>
                                
                              
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="note"><?php echo $this->lang->line('note'); ?></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea  class="form-control col-md-7 col-xs-12"  name="note"  id="note" placeholder="<?php echo $this->lang->line('note'); ?>"><?php echo isset($post['note']) ?  $post['note'] : ''; ?></textarea>
                                        <div class="help-block"><?php echo form_error('note'); ?></div>
                                    </div>
                                </div>
                               
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('visitor'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>  

                        <?php if(isset($edit)){ ?>
                        <div class="tab-pane fade in active" id="tab_edit_visitor">
                            <div class="x_content"> 
                               <?php echo form_open_multipart(site_url('visitor/edit'), array('name' => 'edit', 'id' => 'edit', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo $this->lang->line('name'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="name"  id="name" value="<?php echo isset($visitor->name) ?  $visitor->name : $post['name']; ?>" placeholder="<?php echo $this->lang->line('name'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('name'); ?></div>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone"><?php echo $this->lang->line('phone'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="phone"  id="phone" value="<?php echo isset($visitor->phone) ?  $visitor->phone : $post['phone']; ?>" placeholder="<?php echo $this->lang->line('phone'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('phone'); ?></div>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="coming_from"><?php echo $this->lang->line('coming_from'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="coming_from"  id="coming_from" value="<?php echo isset($visitor->coming_from) ?  $visitor->coming_from : $post['coming_from']; ?>" placeholder="<?php echo $this->lang->line('coming_from'); ?>" required="required" type="text" autocomplete="off">
                                        <div class="help-block"><?php echo form_error('coming_from'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role_id"><?php echo $this->lang->line('to_meet'); ?> <?php echo $this->lang->line('user'); ?> <?php echo $this->lang->line('type'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_user_by_role(this.value, '<?php echo $visitor->user_id; ?>');">
                                             <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                            <?php foreach($roles as $obj ){ ?>
                                                <?php if(!in_array($obj->id, array(GUARDIAN))){ ?>
                                                <option value="<?php echo $obj->id; ?>" <?php if($visitor->role_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->name; ?></option>
                                                <?php } ?>                                            
                                            <?php } ?>                                            
                                        </select>
                                        <div class="help-block"><?php echo form_error('role_id'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_id"><?php echo $this->lang->line('to_meet'); ?>  <?php echo $this->lang->line('user'); ?> <?php echo $this->lang->line('name'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="user_id"  id="edit_user_id" required="required" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>                                                                                         
                                        </select>
                                        <div class="help-block"><?php echo form_error('user_id'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="reason"><?php echo $this->lang->line('reason_to_meet'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="reason"  id="reason" required="required" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>  
                                            <?php $reasons = get_visitor_reasons(); ?>
                                            <?php foreach($reasons as $key=>$value){ ?>
                                                <option value="<?php echo $key; ?>" <?php if($visitor->reason == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                            <?php } ?>
                                        </select>
                                        <div class="help-block"><?php echo form_error('reason'); ?></div>
                                    </div>
                                </div>
                                
                                                                                 
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="note"><?php echo $this->lang->line('note'); ?></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea  class="form-control col-md-7 col-xs-12"  name="note"  id="note" placeholder="<?php echo $this->lang->line('note'); ?>"><?php echo isset($visitor->note) ?  $visitor->note : $post['note']; ?></textarea>
                                        <div class="help-block"><?php echo form_error('note'); ?></div>
                                    </div>
                                </div>
                                                             
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <input type="hidden" value="<?php echo isset($visitor) ? $visitor->id : $id; ?>" name="id" />
                                        <a href="<?php echo site_url('visitor'); ?>"  class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('update'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>  
                        <?php } ?>
                                            
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-visitor-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
          <h4 class="modal-title"><?php echo $this->lang->line('visitor_info'); ?> </h4>
        </div>
        <div class="modal-body fn_visitor_data">
            
        </div>       
      </div>
    </div>
</div>
<script type="text/javascript">
         
    function get_visitor_modal(visitor_id){
         
        $('.fn_visitor_data').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?php echo IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
          type   : "POST",
          url    : "<?php echo site_url('visitor/get_single_visitor'); ?>",
          data   : {visitor_id : visitor_id},  
          success: function(response){                                                   
            if(response)
            {
               $('.fn_visitor_data').html(response);
            }
          }
       });
    }
</script>

 <script type="text/javascript">
     
  <?php if(isset($edit)){ ?>
        get_user_by_role('<?php echo $visitor->role_id; ?>', "<?php echo $visitor->user_id; ?>");
    <?php } ?>
    
    function get_user_by_role(role_id, user_id){       
           
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_user_by_role'); ?>",
            data   : { role_id : role_id , user_id: user_id},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                   if(user_id != ''){
                       $('#edit_user_id').html(response); 
                   }else{
                        $('#add_user_id').html(response);                       
                   }
               }
            }
        });  
   }
    function check_out(visitor_id){       
           
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('visitor/visitor_check_out'); ?>",
            data   : { visitor_id : visitor_id},               
            async  : false,
            success: function(response){  
                if(response){
                     toastr.success('<?php echo $this->lang->line('update_success'); ?>');  
                      location.reload();
                }else{
                     toastr.error('<?php echo $this->lang->line('update_failed'); ?>');  
                }
                toastr.options = {
                "closeButton": true,               
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "showDuration": "400",
                "hideDuration": "400",
                "timeOut": "5000",              
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
              }               
            }
        });  
   }
</script> 
<!-- datatable with buttons -->
 <script type="text/javascript">
        $(document).ready(function() {
          $('#datatable-responsive').DataTable( {
              dom: 'Bfrtip',
              iDisplayLength: 15,
              buttons: [
                  'copyHtml5',
                  'excelHtml5',
                  'csvHtml5',
                  'pdfHtml5',
                  'pageLength'
              ],
              search: true
          });
        });
    $("#add").validate();     
    $("#edit").validate();  
</script>