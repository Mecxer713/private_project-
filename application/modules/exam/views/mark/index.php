<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-file-text-o"></i><small> <?php echo $this->lang->line('manage_mark'); ?></small></h3>
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
                <?php echo form_open_multipart(site_url('exam/mark/index'), array('name' => 'mark', 'id' => 'mark', 'class' => 'form-horizontal form-label-left'), ''); ?>
                <div class="row">
                    
                    <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('exam'); ?>  <span class="required">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="exam_id" id="exam_id"  required="required">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php foreach ($exams as $obj) { ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($exam_id) && $exam_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->title; ?></option>
                                <?php } ?>
                            </select>
                            <div class="help-block"><?php echo form_error('exam_id'); ?></div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('class'); ?>  <span class="required">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="class_id" id="class_id"  required="required" onchange="get_section_subject_by_class(this.value,'','');">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php foreach ($classes as $obj) { ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($class_id) && $class_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->name; ?></option>
                                <?php } ?>
                            </select>
                            <div class="help-block"><?php echo form_error('class_id'); ?></div>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('section'); ?>  <span class="required">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="section_id" id="section_id" required="required">                                
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                            </select>
                            <div class="help-block"><?php echo form_error('section_id'); ?></div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('subject'); ?>  <span class="required">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="subject_id" id="subject_id" required="required">                                
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                            </select>
                            <div class="help-block"><?php echo form_error('subject_id'); ?></div>
                        </div>
                    </div>
                    </div>
                
                    <div class="col-md-2 col-sm-2 col-xs-12">
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
                            <h4><?php echo $this->lang->line('exam_mark'); ?></h4>                            
                        </p>
                    </div>
                </div>            
            </div>
             <?php } ?>
            
            <div class="x_content">
                 <?php echo form_open(site_url('exam/mark/add'), array('name' => 'addmark', 'id' => 'addmark', 'class'=>'form-horizontal form-label-left'), ''); ?>
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th rowspan="2"><?php echo $this->lang->line('roll_no'); ?></th>
                            <th rowspan="2"><?php echo $this->lang->line('name'); ?></th>
                            <th rowspan="2"><?php echo $this->lang->line('photo'); ?></th>
                            <th colspan="2"><?php echo $this->lang->line('written'); ?></th>                                            
                            <th colspan="2"><?php echo $this->lang->line('tutorial'); ?></th>                                            
                            <th colspan="2"><?php echo $this->lang->line('practical'); ?></th>                                            
                            <th colspan="2"><?php echo $this->lang->line('viva'); ?></th>                                            
                            <th colspan="2"><?php echo $this->lang->line('total'); ?></th>                                            
                            <th rowspan="2"><?php echo $this->lang->line('grade'); ?></th>                                            
                            <th rowspan="2"><?php echo $this->lang->line('comment'); ?></th>                                            
                        </tr>
                        <tr>                           
                            <th><?php echo $this->lang->line('mark'); ?></th>                                            
                            <th><?php echo $this->lang->line('obtain'); ?></th>                                            
                            <th><?php echo $this->lang->line('mark'); ?></th>                                            
                            <th><?php echo $this->lang->line('obtain'); ?></th>                                            
                            <th><?php echo $this->lang->line('mark'); ?></th>                                            
                            <th><?php echo $this->lang->line('obtain'); ?></th>                                            
                            <th><?php echo $this->lang->line('mark'); ?></th>                                            
                            <th><?php echo $this->lang->line('obtain'); ?></th>                                            
                            <th><?php echo $this->lang->line('mark'); ?></th>                                            
                            <th><?php echo $this->lang->line('obtain'); ?></th>                                           
                                                                      
                        </tr>
                    </thead>
                    <tbody id="fn_mark">   
                        <?php
                        $count = 1;
                        if (isset($students) && !empty($students)) {
                            ?>
                            <?php foreach ($students as $obj) { ?>
                            <?php  $mark = get_exam_mark($obj->student_id, $this->academic_year_id, $exam_id, $class_id, $section_id, $subject_id); ?>
                            <?php  $attendance = get_exam_attendance($obj->student_id, $this->academic_year_id, $exam_id, $class_id, $section_id, $subject_id); ?>
                                <tr>
                                    <td><?php echo $obj->roll_no; ?></td>
                                    <td><?php echo ucfirst($obj->student_name); ?></td>
                                    <td>
                                        <?php if ($obj->photo != '') { ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/student-photo/<?php echo $obj->photo; ?>" alt="" width="40" /> 
                                        <?php } else { ?>
                                            <img src="<?php echo IMG_URL; ?>/default-user.png" alt="" width="40" /> 
                                        <?php } ?>
                                    </td>  
                                    <td>
                                        <input type="hidden" value="<?php echo $obj->student_id; ?>"  name="students[]" />                                       
                                        <input type="number" id="written_mark_<?php echo $obj->student_id; ?>" itemid="<?php echo $obj->student_id; ?>" value="<?php if(!empty($mark) && $mark->written_mark > 0){ echo $mark->written_mark; }else{ echo '';} ?>"  name="written_mark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 fn_mark_total"  />
                                    </td>
                                    <td>
                                        <?php if(!empty($attendance)){ ?>
                                            <input type="number"  id="written_obtain_<?php echo $obj->student_id; ?>"  itemid="<?php echo $obj->student_id; ?>"  value="<?php if(!empty($mark) && $mark->written_obtain > 0 ){ echo $mark->written_obtain; }else{ echo ''; } ?>"  name="written_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 fn_mark_total"  />
                                        <?php }else{ ?>
                                            <input readonly="readonly" type="number" value="0"  name="written_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12" />
                                        <?php } ?>
                                    </td>
                                    
                                    <td>
                                        <input type="number"  id="tutorial_mark_<?php echo $obj->student_id; ?>" itemid="<?php echo $obj->student_id; ?>"  value="<?php if(!empty($mark) && $mark->tutorial_mark > 0){ echo $mark->tutorial_mark; }else{ echo '';} ?>"  name="tutorial_mark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 fn_mark_total"  />
                                    </td>
                                    <td>
                                        <?php if(!empty($attendance)){ ?>
                                            <input type="number"  id="tutorial_obtain_<?php echo $obj->student_id; ?>" itemid="<?php echo $obj->student_id; ?>"   value="<?php if(!empty($mark) && $mark->tutorial_obtain > 0 ){ echo $mark->tutorial_obtain; }else{ echo ''; } ?>"  name="tutorial_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 fn_mark_total" />
                                        <?php }else{ ?>
                                            <input readonly="readonly" type="number" value="0"  name="tutorial_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12"  />
                                        <?php } ?>
                                    </td>
                                    
                                    <td>
                                        <input type="number"  id="practical_mark_<?php echo $obj->student_id; ?>" itemid="<?php echo $obj->student_id; ?>"  value="<?php if(!empty($mark) && $mark->practical_mark > 0){ echo $mark->practical_mark; }else{ echo '';} ?>"  name="practical_mark[<?php echo $obj->student_id; ?>]" class="form-control col-md-7 form-mark col-xs-12 fn_mark_total"  />
                                    </td>
                                    <td>
                                        <?php if(!empty($attendance)){ ?>
                                            <input type="number"  id="practical_obtain_<?php echo $obj->student_id; ?>" itemid="<?php echo $obj->student_id; ?>"   value="<?php if(!empty($mark) && $mark->practical_obtain > 0 ){ echo $mark->practical_obtain; }else{ echo ''; } ?>"  name="practical_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 fn_mark_total"  />
                                        <?php }else{ ?>
                                            <input readonly="readonly" type="number" value="0"  name="practical_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12" />
                                        <?php } ?>
                                    </td>
                                    
                                    <td>
                                        <input type="number"  id="viva_mark_<?php echo $obj->student_id; ?>" itemid="<?php echo $obj->student_id; ?>"  value="<?php if(!empty($mark) && $mark->viva_mark > 0){ echo $mark->viva_mark; }else{ echo '';} ?>"  name="viva_mark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 fn_mark_total" />
                                    </td>
                                    <td>
                                        <?php if(!empty($attendance)){ ?>
                                            <input type="number"  id="viva_obtain_<?php echo $obj->student_id; ?>" itemid="<?php echo $obj->student_id; ?>"  value="<?php if(!empty($mark) && $mark->viva_obtain > 0 ){ echo $mark->viva_obtain; }else{ echo ''; } ?>"  name="viva_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 fn_mark_total"  />
                                        <?php }else{ ?>
                                            <input readonly="readonly" type="number" value="0"  name="viva_obtain[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12"  />
                                        <?php } ?>
                                    </td>
                                    
                                    <td>
                                        <input type="number"  id="exam_total_mark_<?php echo $obj->student_id; ?>" value="<?php if(!empty($mark) && $mark->exam_total_mark > 0){ echo $mark->exam_total_mark; }else{ echo '';} ?>"  name="exam_total_mark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12"  />
                                    </td>
                                    <td>
                                        <?php if(!empty($attendance)){ ?>
                                            <input type="number"  id="obtain_total_mark_<?php echo $obj->student_id; ?>" value="<?php if(!empty($mark) && $mark->obtain_total_mark > 0 ){ echo $mark->obtain_total_mark; }else{ echo ''; } ?>"  name="obtain_total_mark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12" />
                                        <?php }else{ ?>
                                            <input readonly="readonly" type="number" value="0"  name="obtain_total_mark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12" required="required" />
                                        <?php } ?>
                                    </td>
                                    
                                    <td>
                                        <select  class="form-control col-md-7 col-xs-12" name="grade_id[<?php echo $obj->student_id; ?>]"  required="required">                                
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                             <?php foreach ($grades as $grade) { ?>
                                            <option value="<?php echo $grade->id; ?>" <?php if(isset($mark) && $mark->grade_id == $grade->id){ echo 'selected="selected"';} ?>><?php echo $grade->name; ?> [<?php echo $grade->point; ?>]</option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                    <td>
                                        <?php if(!empty($attendance)){ ?>
                                            <input type="text"  id="remark_<?php echo $obj->student_id; ?>" value="<?php if(!empty($mark) && $mark->remark != '' ){ echo $mark->remark; }else{ echo ''; } ?>"  name="remark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 remark" />
                                        <?php }else{ ?>
                                            <input readonly="readonly" type="text" value=""  name="remark[<?php echo $obj->student_id; ?>]" class="form-control form-mark col-md-7 col-xs-12 remark"  />
                                        <?php } ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php }else{ ?>
                                <tr>
                                    <td colspan="15" align="center"><?php echo $this->lang->line('no_data_found'); ?></td>
                                </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-md-offset-5">
                        <?php  if (isset($students) && !empty($students)) { ?>
                            <input type="hidden" value="<?php echo $exam_id; ?>"  name="exam_id" />
                            <input type="hidden" value="<?php echo $class_id; ?>"  name="class_id" />
                            <input type="hidden" value="<?php echo $section_id; ?>"  name="section_id" />
                            <input type="hidden" value="<?php echo $subject_id; ?>"  name="subject_id" />                        
                            <a href="<?php echo site_url('exam/mark'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                           <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('submit'); ?></button>
                        <?php } ?>
                    </div>
                </div>
                 <?php echo form_close(); ?>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="instructions"><strong><?php echo $this->lang->line('instruction'); ?>: </strong> <?php echo $this->lang->line('exam_mark_instruction'); ?></div>
                </div>
            </div> 
            
        </div>
    </div>
</div>
 
 <script type="text/javascript">     
  
    <?php if(isset($class_id) && isset($section_id)){ ?>
        get_section_subject_by_class('<?php echo $class_id; ?>', '<?php echo $section_id; ?>', '<?php echo $subject_id; ?>');
    <?php } ?>
    
    function get_section_subject_by_class(class_id, section_id, subject_id){       
           
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
        
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_subject_by_class'); ?>",
            data   : { class_id : class_id , subject_id: subject_id},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                  $('#subject_id').html(response);
               }
            }
        }); 
        
        
    }
  
  $(document).ready(function(){
  
       $('.fn_mark_total').keyup(function(){
           
          var student_id = $(this).attr('itemid');
          var written_mark       = $('#written_mark_'+student_id).val() ?  parseFloat($('#written_mark_'+student_id).val()) : 0;
          var written_obtain     = $('#written_obtain_'+student_id).val() ? parseFloat($('#written_obtain_'+student_id).val()) : 0;
          var tutorial_mark      = $('#tutorial_mark_'+student_id).val() ? parseFloat($('#tutorial_mark_'+student_id).val()) : 0;
          var tutorial_obtain    = $('#tutorial_obtain_'+student_id).val() ? parseFloat($('#tutorial_obtain_'+student_id).val()) : 0;
          var practical_mark     = $('#practical_mark_'+student_id).val() ? parseFloat($('#practical_mark_'+student_id).val()) : 0;
          var practical_obtain   = $('#practical_obtain_'+student_id).val() ? parseFloat($('#practical_obtain_'+student_id).val()) : 0;
          var viva_mark          = $('#viva_mark_'+student_id).val() ? parseFloat($('#viva_mark_'+student_id).val()) : 0;
          var viva_obtain        = $('#viva_obtain_'+student_id).val() ? parseFloat($('#viva_obtain_'+student_id).val()) : 0;
          
          $('#exam_total_mark_'+student_id).val(written_mark+tutorial_mark+practical_mark+viva_mark);
          $('#obtain_total_mark_'+student_id).val(written_obtain+tutorial_obtain+practical_obtain+viva_obtain);
          
            
       }); 
      
  }); 
  
 $("#mark").validate();  
 $("#addmark").validate();  
</script>

<style>
    .form-mark {width: 60px;}
     label.error {display: none !important;}
    .form-control {padding: 1px;}
    .table>tbody>tr>td {padding: 1px;}
    .remark{width: 100%;}
</style>



