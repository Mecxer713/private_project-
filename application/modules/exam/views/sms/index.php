<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-mobile-phone"></i><small> <?php echo $this->lang->line('mark_send_by_sms'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content quick-link">
                <strong> <?php echo $this->lang->line('quick_link'); ?>: </strong>
                <?php if(has_permission(VIEW, 'exam', 'mark')){ ?>
                    <a href="<?php echo site_url('exam/mark'); ?>"><?php echo $this->lang->line('manage_mark'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'exam', 'examresult')){ ?>
                   | <a href="<?php echo site_url('exam/examresult'); ?>"><?php echo $this->lang->line('exam_term'); ?> <?php echo $this->lang->line('result'); ?></a>                 
                <?php } ?>
                <?php if(has_permission(VIEW, 'exam', 'finalresult')){ ?>
                   | <a href="<?php echo site_url('exam/finalresult'); ?>"><?php echo $this->lang->line('exam_final_result'); ?></a>                 
                <?php } ?>
                <?php if(has_permission(VIEW, 'exam', 'meritlist')){ ?>
                   | <a href="<?php echo site_url('exam/meritlist'); ?>"><?php echo $this->lang->line('merit_list'); ?></a>                 
                <?php } ?>   
                <?php if(has_permission(VIEW, 'exam', 'marksheet')){ ?>
                   | <a href="<?php echo site_url('exam/marksheet'); ?>"><?php echo $this->lang->line('mark_sheet'); ?></a>
                <?php } ?>
                 <?php if(has_permission(VIEW, 'exam', 'resultcard')){ ?>
                   | <a href="<?php echo site_url('exam/resultcard'); ?>"><?php echo $this->lang->line('result_card'); ?></a>
                <?php } ?>   
                <?php if(has_permission(VIEW, 'exam', 'mail')){ ?>
                   | <a href="<?php echo site_url('exam/mail'); ?>"><?php echo $this->lang->line('mark_send_by_email'); ?></a>                    
                <?php } ?>
                <?php if(has_permission(VIEW, 'exam', 'text')){ ?>
                   | <a href="<?php echo site_url('exam/text'); ?>"><?php echo $this->lang->line('mark_send_by_sms'); ?></a>                  
                <?php } ?>
                <?php if(has_permission(VIEW, 'exam', 'resultemail')){ ?>
                   | <a href="<?php echo site_url('exam/resultemail/index'); ?>"> <?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('email'); ?></a>                    
                <?php } ?>
                <?php if(has_permission(VIEW, 'exam', 'resultsms')){ ?>
                   | <a href="<?php echo site_url('exam/resultsms/index'); ?>"> <?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('sms'); ?></a>                  
                <?php } ?>
            </div>
            
            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">                    
                    <ul  class="nav nav-tabs bordered">
                        <li class="<?php if(isset($list)){ echo 'active'; }?>"><a href="#tab_send_sms_list"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo $this->lang->line('sms'); ?> <?php echo $this->lang->line('list'); ?></a> </li>
                        <li class="<?php if(isset($add)){ echo 'active'; }?>"><a href="#tab_send_sms"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-location-arrow"></i> <?php echo $this->lang->line('send'); ?> <?php echo $this->lang->line('sms'); ?></a> </li>
                        
                    </ul>
                    <br/>
                    
                    <div class="tab-content"> 
                        
                        
                            <div  class="tab-pane fade in <?php if(isset($list)){ echo 'active'; }?>" id="tab_send_sms_list" >
                            <div class="x_content">
                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('sl_no'); ?></th>
                                        <th><?php echo $this->lang->line('exam'); ?></th>
                                        <th><?php echo $this->lang->line('class'); ?></th>
                                        <th><?php echo $this->lang->line('receiver_type'); ?></th>
                                        <th><?php echo $this->lang->line('gateway'); ?></th>
                                        <th><?php echo $this->lang->line('send'); ?> <?php echo $this->lang->line('date'); ?></th>
                                        <th><?php echo $this->lang->line('action'); ?></th>                                            
                                    </tr>
                                </thead>
                                <tbody>   
                                    <?php $count = 1; if(isset($mark_smses) && !empty($mark_smses)){ ?>
                                        <?php foreach($mark_smses as $obj){ ?>
                                        <tr>
                                            <td><?php echo $count++; ?></td>
                                            <td><?php echo $obj->exam_name; ?></td>
                                            <td><?php echo $obj->class_name; ?></td>
                                            <td><?php echo $obj->receiver_type; ?></td>
                                            <td><?php echo $this->lang->line($obj->sms_gateway); ?></td>
                                            <td><?php echo get_nice_time($obj->created_at); ?></td>
                                            <td>
                                                <?php if(has_permission(VIEW, 'exam', 'text')){ ?>
                                                    <a  onclick="get_sms_modal(<?php echo $obj->id; ?>);"  data-toggle="modal" data-target=".bs-sms-modal-lg"  class="btn btn-success btn-xs"><i class="fa fa-eye"></i> <?php echo $this->lang->line('view'); ?> </a>
                                                <?php } ?>
                                                <?php if(has_permission(VIEW, 'exam', 'text')){ ?>    
                                                    <a href="<?php echo site_url('exam/text/delete/'.$obj->id); ?>" onclick="javascript: return confirm('<?php echo $this->lang->line('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo $this->lang->line('delete'); ?> </a>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        
                        
                        <div  class="tab-pane fade in <?php if(isset($add)){ echo 'active'; }?>" id="tab_send_sms">
                            <div class="x_content"> 
                               <?php echo form_open_multipart(site_url('exam/text/send'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                
                                
                                <div class="item form-group"> 
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="exam_id"><?php echo $this->lang->line('exam'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-12 col-xs-12 quick-field"  name="exam_id"  id="exam_id" required="required">
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>  
                                            <?php foreach($exams as $obj ){ ?>
                                            <option value="<?php echo $obj->id; ?>" ><?php echo $obj->title; ?></option>
                                            <?php } ?> 
                                        </select>
                                        <a href="<?php echo site_url('exam/add'); ?>" class="btn btn-success btn-md quick-add">+</a>
                                        <div class="help-block"><?php echo form_error('exam_id'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group"> 
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role_id"><?php echo $this->lang->line('receiver_type'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-12 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_user_by_role(this.value, '');">
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option> 
                                            <?php foreach($roles as $obj ){ ?>
                                            <?php if($obj->id == STUDENT || $obj->id == GUARDIAN){ ?>
                                                    <option value="<?php echo $obj->id; ?>" ><?php echo $obj->name; ?></option>
                                                <?php } ?>
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
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="receiver_id"><?php echo $this->lang->line('student'); ?>  <?php echo $this->lang->line('mark'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-12 col-xs-12"  name="receiver_id"  id="receiver_id" required="required" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>                                                                                         
                                        </select>
                                        <div class="help-block"><?php echo form_error('receiver_id'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">  
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="template"><?php echo $this->lang->line('template'); ?> </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-12 col-xs-12"  name="template"  id="fn_template" onchange="get_template(this.value)">
                                            <option itemid="" value="">--<?php echo $this->lang->line('select'); ?>--</option>                                                                                         
                                        </select>
                                        <div class="help-block"><?php echo form_error('template'); ?></div>
                                    </div>
                                </div>                                  
                        
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="body"><?php echo $this->lang->line('sms'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea  class="form-control" name="body" id="body"  onKeyDown="limitText(this.value);" onKeyUp="limitText(this.value);" maxlength="160"  required="required" placeholder="<?php echo $this->lang->line('sms'); ?>"></textarea>
                                        <div class="help-block"><?php echo form_error('body'); ?></div>
                                        <div class="help-block fn_countdown"><?php echo $this->lang->line('you_have_remain_character'); ?>:160</div>
                                    </div>
                                </div>                      
                                                              
                                <div class="item form-group">  
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sms_gateway"><?php echo $this->lang->line('gateway'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <?php $services = get_sms_gateways(); ?>
                                        <select  class="form-control col-md-12 col-xs-12"  name="sms_gateway"  id="sms_gateway" required="required" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>  
                                            <?php foreach($services AS $key=>$value){ ?>
                                            <option value="<?php echo $key; ?>"><?php echo $value; ?></option>  
                                            <?php } ?>
                                        </select>
                                        <div class="help-block"><?php echo form_error('sms_gateway'); ?></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('dynamic_tag'); ?></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12"  id="fn_tag"  style="padding-top: 6px;">[name] [email] [phone] [exam_mark]</div>
                                </div>  
                               
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('exam/sms'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('submit'); ?></button>
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


<div class="modal fade bs-sms-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
          <h4 class="modal-title"><?php echo $this->lang->line('sms'); ?> <?php echo $this->lang->line('information'); ?></h4>
        </div>
        <div class="modal-body fn_sms_data">
            
        </div>       
      </div>
    </div>
</div>
<script type="text/javascript">
         
    function get_sms_modal(sms_id){
         
        $('.fn_sms_data').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?php echo IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
          type   : "POST",
          url    : "<?php echo site_url('exam/text/get_single_sms'); ?>",
          data   : {sms_id : sms_id},  
          success: function(response){                                                   
             if(response)
             {
                $('.fn_sms_data').html(response);
             }
          }
       });
    }
</script>


 <script type="text/javascript">   

    function get_user_by_role(role_id, user_id){       
       
       if(role_id == <?php echo STUDENT; ?> || role_id == <?php echo GUARDIAN; ?>){
           $('.display').show();
           $('#class_id').prop('required', true);
           $("select#class_id").prop('selectedIndex', 0);
           $('#receiver_id').html('<option value="">--<?php echo $this->lang->line('select'); ?>--</option>'); 
       }else{
           get_user(role_id, '', user_id);
           $('#class_id').prop('required', false);
           $('.display').hide();
       }
       
       get_sms_template_by_role(role_id);
   }
   
   function get_user(role_id, class_id, user_id){
       
       if(role_id == ''){
           role_id = $('#role_id').val();
       }
       
        if(role_id == <?php echo GUARDIAN; ?>){
           role_id = '<?php echo STUDENT; ?>'; 
       }
       
       $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_user_by_role'); ?>",
            data   : { role_id : role_id , class_id: class_id, user_id:user_id},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                   $('#receiver_id').html(response); 
               }
            }
        }); 
   }
   
      function get_sms_template_by_role(role_id){
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('/ajax/get_sms_template_by_role'); ?>",
            data   : { role_id : role_id},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                   $('#fn_template').html(response); 
               }
            }
        }); 
   }
   
   function get_template(template){       
        $('#body').html(template);
   }
    
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
     
     function limitText(text) {       
       $('.fn_countdown').text('<?php echo $this->lang->line('you_have_remain_character'); ?>:'+(160 - text.length));        
     }

</script> 
