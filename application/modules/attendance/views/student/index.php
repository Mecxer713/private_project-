<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-check-square-o"></i><small> <?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('attendance'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="x_content quick-link">
                 <strong> <?php echo $this->lang->line('quick_link'); ?>: </strong>
                <?php if(has_permission(VIEW, 'attendance', 'student')){ ?>
                    <a href="<?php echo site_url('attendance/student'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('attendance'); ?></a>
                <?php } ?>
                 <?php if(has_permission(VIEW, 'attendance', 'teacher')){ ?>
                   | <a href="<?php echo site_url('attendance/teacher'); ?>"><?php echo $this->lang->line('teacher'); ?> <?php echo $this->lang->line('attendance'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'attendance', 'employee')){ ?>
                   | <a href="<?php echo site_url('attendance/employee'); ?>"><?php echo $this->lang->line('employee'); ?> <?php echo $this->lang->line('attendance'); ?></a>                    
                <?php } ?>
                <?php if(has_permission(VIEW, 'attendance', 'absentemail')){ ?>
                   | <a href="<?php echo site_url('attendance/absentemail/index'); ?>"><?php echo $this->lang->line('absent'); ?> <?php echo $this->lang->line('email'); ?></a>                    
                <?php } ?>
                <?php if(has_permission(VIEW, 'attendance', 'absentsms')){ ?>
                   | <a href="<?php echo site_url('attendance/absentsms/index'); ?>"><?php echo $this->lang->line('absent'); ?> <?php echo $this->lang->line('sms'); ?></a>                    
                <?php } ?>
            </div>
            
            <div class="x_content"> 
                <?php echo form_open_multipart(site_url('attendance/student/index'), array('name' => 'student', 'id' => 'student', 'class' => 'form-horizontal form-label-left'), ''); ?>
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('class'); ?> <span class="required"> *</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="class_id" id="class_id"  required="required" onchange="get_section_by_class(this.value, '');">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php foreach ($classes as $obj) { ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($class_id) && $class_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></option>
                                <?php } ?>
                            </select>
                            <div class="help-block"><?php echo form_error('class_id'); ?></div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('section'); ?> <span class="required"> *</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="section_id" id="section_id" required="required">                                
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                            </select>
                            <div class="help-block"><?php echo form_error('section_id'); ?></div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group">  
                            <div><?php echo $this->lang->line('date'); ?> <span class="required"> *</span></div>
                            <input  class="form-control col-md-7 col-xs-12"  name="date"  id="date" value="<?php if(isset($date)){ echo $date;} ?>" placeholder="<?php echo $this->lang->line('date'); ?>" required="required" type="text" autocomplete="off">
                            <div class="help-block"><?php echo form_error('date'); ?></div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="form-group"><br/>
                            <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('find'); ?></button>
                        </div>
                    </div>
                </div>
                <?php echo form_close(); ?>
            </div>

           <?php  if (isset($students) && !empty($students)) { ?>
            <div class="x_content">             
                <div class="row">
                    <div class="col-sm-4  col-sm-offset-4 layout-box">
                        <p>
                            <h4><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('attendance'); ?></h4>
                            <?php echo $this->lang->line('day'); ?> : <?php echo date('l', strtotime($date)); ?><br/>
                            <?php echo $this->lang->line('date'); ?> : <?php echo date($this->gsms_setting->sms_date_format, strtotime($date)); ?>
                        </p>
                    </div>
                </div>            
            </div>
             <?php } ?>
            
            <div class="x_content">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo $this->lang->line('sl_no'); ?></th>
                            <th><?php echo $this->lang->line('photo'); ?></th>
                            <th><?php echo $this->lang->line('name'); ?></th>
                            <th><?php echo $this->lang->line('email'); ?></th>
                            <th><?php echo $this->lang->line('phone'); ?></th>
                            <th><?php echo $this->lang->line('roll_no'); ?></th>
                            <th><input type="checkbox" value="P" name="present" id="fn_present" class="fn_all_attendnce"/> <?php echo $this->lang->line('present_all'); ?></th>                                            
                            <th><input type="checkbox" value="L" name="late" id="fn_late"  class="fn_all_attendnce"/> <?php echo $this->lang->line('late_all'); ?></th>                                            
                            <th><input type="checkbox" value="A" name="absent" id="fn_absent"  class="fn_all_attendnce"/> <?php echo $this->lang->line('absent_all'); ?></th>                                            
                        </tr>
                    </thead>
                    <tbody id="fn_attendance">   
                        <?php
                        $count = 1;
                        if (isset($students) && !empty($students)) {
                            ?>
                            <?php foreach ($students as $obj) { ?>
                            <?php  $attendance = get_student_attendance($obj->id, $academic_year_id, $class_id, $section_id, $year, $month, $day ); ?>
                                <tr>
                                    <td><?php echo $count++;  ?></td>
                                    <td>
                                        <?php if ($obj->photo != '') { ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/student-photo/<?php echo $obj->photo; ?>" alt="" width="60" /> 
                                        <?php } else { ?>
                                            <img src="<?php echo IMG_URL; ?>/default-user.png" alt="" width="60" /> 
                                        <?php } ?>
                                    </td>  
                                    <td><?php echo ucfirst($obj->name); ?></td>
                                    <td><?php echo $obj->email; ?></td>
                                    <td><?php echo $obj->phone; ?></td>
                                    <td><?php echo $obj->roll_no; ?></td>
                                    <td><input type="radio" value="P" itemid="<?php echo $obj->id; ?>" name="student_<?php echo $obj->id; ?>" class="present fn_single_attendnce" <?php if($attendance == 'P'){ echo 'checked="checked"'; } ?> /></td>
                                    <td><input type="radio" value="L" itemid="<?php echo $obj->id; ?>"  name="student_<?php echo $obj->id; ?>" class="late fn_single_attendnce" <?php if($attendance == 'L'){ echo 'checked="checked"'; } ?>/></td>
                                    <td><input type="radio" value="A" itemid="<?php echo $obj->id; ?>" name="student_<?php echo $obj->id; ?>" class="absent fn_single_attendnce" <?php if($attendance == 'A'){ echo 'checked="checked"'; } ?>/></td>
                                </tr>
                            <?php } ?>
                        <?php }else{ ?>
                                <tr>
                                    <td colspan="9" align="center"><?php echo $this->lang->line('no_data_found'); ?></td>
                                </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div> 
            
        </div>
    </div>
</div>


 <!-- bootstrap-datetimepicker -->
<link href="<?php echo VENDOR_URL; ?>datepicker/datepicker.css" rel="stylesheet">
 <script src="<?php echo VENDOR_URL; ?>datepicker/datepicker.js"></script>
 <script type="text/javascript">
     
  $('#date').datepicker();
  
    <?php if(isset($class_id) && isset($section_id)){ ?>
        get_section_by_class('<?php echo $class_id; ?>', '<?php echo $section_id; ?>');
    <?php } ?>
    
    function get_section_by_class(class_id, section_id){       
           
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_section_by_class'); ?>",
            data   : { class_id : class_id , section_id: section_id},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                  $('#section_id').html(response);
               }
            }
        }); 
    }
  
  $(document).ready(function(){
  
       $('#fn_present').click(function(){
           
           if($(this).prop('checked')) {   
               $('input:checkbox').removeAttr('checked');
               $(this).prop('checked', true);
               $('.present').prop('checked', true);
           }else{
               $('.present').prop('checked', false);
           }           
       });
       
       
       $('#fn_late').click(function(){
           
           if($(this).prop('checked')) {   
               $('input:checkbox').removeAttr('checked');
               $(this).prop('checked', true);
               $('.late').prop('checked', true);
           }else{
              $('.late').prop('checked', false); 
           }           
       });
       
       $('#fn_absent').click(function(){
           
           if($(this).prop('checked')) {   
               $('input:checkbox').removeAttr('checked');
               $(this).prop('checked', true);
               $('.absent').prop('checked', true);
           }else{
               $('.absent').prop('checked', false);
           }           
       });
       
       
       $('.fn_single_attendnce').click(function(){
           
          var status     = $(this).prop('checked') ? $(this).val() : '';
          var student_id = $(this).prop('checked') ? $(this).attr('itemid') : '';
          var class_id   = $('#class_id').val();
          var section_id = $('#section_id').val();
          var date       = $('#date').val();
          
          $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('attendance/student/update_single_attendance'); ?>",
            data   : { status : status , student_id: student_id, class_id:class_id, section_id:section_id, date:date},               
            async  : false,
            success: function(response){ 
                if(response){
                     toastr.success('<?php echo $this->lang->line('update_success'); ?>');  
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
                      
       });
       
         $('.fn_all_attendnce').click(function(){
           
          var status     = $(this).prop('checked') ? $(this).val() : '';         
          var class_id   = $('#class_id').val();
          var section_id = $('#section_id').val();
          var date       = $('#date').val();
          
          $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('attendance/student/update_all_attendance'); ?>",
            data   : { status : status , class_id:class_id, section_id:section_id, date:date},               
            async  : false,
            success: function(response){ 
                if(response){
                     toastr.success('<?php echo $this->lang->line('update_success'); ?>');  
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
                      
       });
  });
   $("#student").validate();    
</script>



