<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-pencil-square-o"></i><small> <?php echo $this->lang->line('reset_user_email'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            
            <div class="x_content quick-link">
                <strong> <?php echo $this->lang->line('quick_link'); ?>: </strong>
                <?php if(has_permission(VIEW, 'administrator', 'year')){ ?>
                    <a href="<?php echo site_url('administrator/year'); ?>"><?php echo $this->lang->line('academic_year'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'administrator', 'role')){ ?>
                   | <a href="<?php echo site_url('administrator/role'); ?>"><?php echo $this->lang->line('user_role'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'administrator', 'permission')){ ?>
                   | <a href="<?php echo site_url('administrator/permission'); ?>"><?php echo $this->lang->line('role_permission'); ?></a>                   
                <?php } ?>
                <?php if(has_permission(VIEW, 'administrator', 'user')){ ?>
                   | <a href="<?php echo site_url('administrator/user'); ?>"><?php echo $this->lang->line('manage_user'); ?></a>                
                <?php } ?>
                <?php if(has_permission(EDIT, 'administrator', 'password')){ ?>
                   | <a href="<?php echo site_url('administrator/password'); ?>"><?php echo $this->lang->line('reset_password'); ?></a>                   
                <?php } ?>
                <?php if(has_permission(EDIT, 'administrator', 'email')){ ?>
                   | <a href="<?php echo site_url('administrator/email'); ?>"><?php echo $this->lang->line('reset_email'); ?></a>                   
                <?php } ?>
                <?php if(has_permission(VIEW, 'administrator', 'backup')){ ?>
                   | <a href="<?php echo site_url('administrator/backup'); ?>"><?php echo $this->lang->line('backup'); ?> <?php echo $this->lang->line('database'); ?></a>                  
                <?php } ?>
                <?php if(has_permission(EDIT, 'administrator', 'emailtemplate')){ ?>
                   | <a href="<?php echo site_url('administrator/emailtemplate'); ?>"><?php echo $this->lang->line('email'); ?> <?php echo $this->lang->line('template'); ?></a>                   
                <?php } ?>
                <?php if(has_permission(VIEW, 'administrator', 'smstemplate')){ ?>
                   | <a href="<?php echo site_url('administrator/smstemplate'); ?>"><?php echo $this->lang->line('sms'); ?> <?php echo $this->lang->line('template'); ?></a>                  
                <?php } ?>
                <?php if(has_permission(VIEW, 'administrator', 'activitylog')){ ?>
                   | <a href="<?php echo site_url('administrator/activitylog'); ?>"><?php echo $this->lang->line('activity_log'); ?></a>                  
                <?php } ?>
                 <?php if(has_permission(VIEW, 'administrator', 'feedback')){ ?>
                   | <a href="<?php echo site_url('administrator/feedback'); ?>"><?php echo $this->lang->line('guardian'); ?> <?php echo $this->lang->line('feedback'); ?></a>                  
                <?php } ?>   
            </div>
            <div class="x_content">

                <div class="" data-example-id="togglable-tabs">
                    
                    <ul  class="nav nav-tabs bordered">                 
                        <li  class="active"><a href="#tab_email_reset" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-envelope-o"></i> <?php echo $this->lang->line('reset_email'); ?></a></li>                          
                    </ul>
                    <br/>
                     <div class="tab-content">
                        <div  class="tab-pane fade in active" id="tab_email_reset" >
                            <div class="x_content">
                                <?php echo form_open(site_url('administrator/email'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                 <div class="item form-group"> 
                                     <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role_id"><?php echo $this->lang->line('user'); ?> <?php echo $this->lang->line('type'); ?> <span class="required">*</span></label>
                                     <div class="col-md-6 col-sm-6 col-xs-12">
                                         <select  class="form-control col-md-12 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_user_by_role(this.value, '');">
                                             <option value="">--<?php echo $this->lang->line('select'); ?>--</option> 
                                             <?php foreach($roles as $obj ){ ?>
                                             <option value="<?php echo $obj->id; ?>"><?php echo $obj->name; ?></option>
                                             <?php } ?>                                            
                                         </select>
                                         <div class="help-block"><?php echo form_error('role_id'); ?></div>
                                     </div>
                                 </div>

                                 <div class="item form-group display"> 
                                     <label class="control-label col-md-3 col-sm-3 col-xs-12" for="class_id"><?php echo $this->lang->line('class'); ?> <span class="required">*</span></label>
                                     <div class="col-md-6 col-sm-6 col-xs-12">
                                         <select  class="form-control col-md-12 col-xs-12"  name="class_id"  id="class_id"  onchange="get_user('', this.value,'');">
                                             <option value="">--<?php echo $this->lang->line('select'); ?>--</option>  
                                             <?php foreach($classes as $obj ){ ?>
                                             <option value="<?php echo $obj->id; ?>" ><?php echo $obj->name; ?></option>
                                             <?php } ?> 
                                         </select>
                                         <div class="help-block"><?php echo form_error('class_id'); ?></div>
                                     </div>
                                 </div>

                                 <div class="item form-group">  
                                     <label class="control-label col-md-3 col-sm-3 col-xs-12" for="user_id"><?php echo $this->lang->line('user'); ?> <span class="required">*</span></label>
                                     <div class="col-md-6 col-sm-6 col-xs-12">
                                         <select  class="form-control col-md-12 col-xs-12"  name="user_id"  id="user_id" required="required" >
                                             <option value="">--<?php echo $this->lang->line('select'); ?>--</option>                                                                                         
                                         </select>
                                         <div class="help-block"><?php echo form_error('user_id'); ?></div>
                                     </div>
                                 </div>
                                 <div class="item form-group">
                                     <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email"><?php echo $this->lang->line('email'); ?> <span class="required">*</span>
                                     </label>
                                     <div class="col-md-6 col-sm-6 col-xs-12">
                                         <input  class="form-control col-md-7 col-xs-12"  name="email"  id="email" value="" placeholder="<?php echo $this->lang->line('email'); ?>" required="required" type="email">
                                         <div class="help-block"><?php echo form_error('email'); ?></div>
                                     </div>
                                 </div>
                                 
                                 <div class="ln_solid"></div>
                                 <div class="form-group">
                                     <div class="col-md-6 col-md-offset-3">
                                         <a href="<?php echo site_url('administrator/user'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                         <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('update'); ?></button>
                                     </div>
                                 </div>
                                 <?php echo form_close(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    
    function get_user_by_role(role_id, user_id){       
       
       if(role_id == <?php echo STUDENT; ?>){
           $('.display').show();
           $('#class_id').prop('required', true);
           $('#user_id').html('<option value="">--<?php echo $this->lang->line('select'); ?>--</option>'); 
       }else{
           get_user(role_id, '', user_id);
           $('#class_id').prop('required', false);
           $('.display').hide();
       }       
   }
   
   function get_user(role_id, class_id, user_id){
       
       if(role_id == ''){
           role_id = $('#role_id').val();
       }
       
       $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_user_by_role'); ?>",
            data   : { role_id : role_id , class_id: class_id, user_id:user_id, message:true},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                   $('#user_id').html(response); 
               }
            }
        }); 
   }
   
    $("#add").validate({
        rules: {
        password: {
            required: true,
            minlength: 6
        },
        conf_password: {
            required: true,
            minlength: 6,
            equalTo: "#password"
        }
        }  
    }); 

</script> 
