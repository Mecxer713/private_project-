<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-comments-o"></i><small> <?php echo $this->lang->line('manage_message'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-3">
                            <?php $this->load->view('message-nav'); ?>   
                        </div>
                        <!-- /.col -->
                        <div class="col-md-9">
                            <div class="box-header">
                                <h3 class="box-title"><?php echo $this->lang->line('compose'); ?></h3>              
                            </div>
                            <div class="box box-primary">
                                <?php echo form_open_multipart(site_url('message/compose/'), array('name' => 'compose', 'id' => 'compose', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <div class="box-body">
                                <div class="item form-group">                                    
                                    <select  class="form-control col-md-12 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_user_by_role(this.value, '');">
                                        <option value="">--<?php echo $this->lang->line('select'); ?> <?php echo $this->lang->line('receiver_type'); ?> *--</option> 
                                        <?php foreach($roles as $obj ){ ?>
                                        <option value="<?php echo $obj->id; ?>" <?php if(isset($message) && $message->role_id == $obj->id ){ echo 'selected="selected"';} ?> ><?php echo $obj->name; ?></option>
                                        <?php } ?>                                            
                                    </select>
                                    <div class="help-block"><?php echo form_error('role_id'); ?></div>
                                </div>
                                    
                                <div class="item form-group display">                                 
                                    <select  class="form-control col-md-12 col-xs-12"  name="class_id"  id="class_id"  onchange="get_user('', this.value,'');">
                                        <option value="">--<?php echo $this->lang->line('select'); ?> *--</option>  
                                        <?php foreach($classes as $obj ){ ?>
                                        <option value="<?php echo $obj->id; ?>" ><?php echo $obj->name; ?></option>
                                        <?php } ?> 
                                    </select>
                                    <div class="help-block"><?php echo form_error('class_id'); ?></div>
                                </div>
                                    
                                    <div class="item form-group">                                 
                                        <select  class="form-control col-md-12 col-xs-12"  name="receiver_id"  id="receiver_id" required="required" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?> <?php echo $this->lang->line('receiver'); ?> *--</option>                                                                                         
                                        </select>
                                        <div class="help-block"><?php echo form_error('receiver_id'); ?></div>
                                    </div>
                                    
                                   
                                    <div class="form-group">                                     
                                        <input  class="form-control col-md-7 col-xs-12"  name="subject"  id="subject" value="<?php if(isset($message)){ echo $message->subject;} ?>" placeholder="<?php echo $this->lang->line('subject'); ?> *" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('subject'); ?></div>
                                    </div>
                                    <div class="form-group">
                                        <textarea  class="form-control" name="body" id="body" required="required" placeholder="<?php echo $this->lang->line('message'); ?> *"><?php if(isset($message)){ echo $message->body;} ?></textarea>
                                        <div class="help-block"><?php echo form_error('body'); ?></div>
                                    </div>                                    
                                </div>
                                <!-- /.box-body -->
                                 <div class="ln_solid"></div>
                                <div class="box-footer">
                                    <div class="pull-right">
                                        <?php if(isset($message)){  ?>
                                            <input type="hidden" name="message_id" id="message_id" value="<?php echo $message->message_id; ?>" />
                                        <?php } ?>
                                            
                                        <button type="submit" name="draft" class="btn btn-default"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('draft'); ?></button>
                                        <button type="submit" name="send" class="btn btn-primary"><i class="fa fa-envelope-o"></i> <?php echo $this->lang->line('send'); ?></button>
                                    </div>
                                    <a href="<?php echo site_url('message/compose'); ?>" ><button type="reset" class="btn btn-default"><i class="fa fa-times"></i> <?php echo $this->lang->line('discard'); ?></button></a>
                                </div>
                                  <?php echo form_close(); ?>
                            </div>
                            <!-- /. box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.content -->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
     
  <?php if(isset($message)){ ?>
        get_user_by_role('<?php echo $message->role_id; ?>', '<?php echo $message->receiver_id; ?>');
        
    <?php } ?>
    
    function get_user_by_role(role_id, user_id){       
       
       if(role_id == <?php echo STUDENT; ?>){
           $('.display').show();
           $('#class_id').attr("required");
           $('#receiver_id').html('<option value=""><?php echo $this->lang->line('select'); ?> <?php echo $this->lang->line('receiver'); ?></option>'); 
       }else{
           get_user(role_id, '', user_id);
           $('#class_id').removeAttr("required");
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
                   $('#receiver_id').html(response); 
               }
            }
        }); 
   }
    $("#compose").validate();
</script> 
