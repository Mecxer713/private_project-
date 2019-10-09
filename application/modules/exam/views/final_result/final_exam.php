<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-file-text-o"></i><small> <?php echo $this->lang->line('manage'); ?> <?php echo $this->lang->line('exam_final_result'); ?></small></h3>
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
                <?php echo form_open_multipart(site_url('exam/finalresult/index'), array('name' => 'result', 'id' => 'result', 'class' => 'form-horizontal form-label-left'), ''); ?>
                <div class="row">  
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
                            <select  class="form-control col-md-7 col-xs-12" name="class_id" id="class_id"  required="required" onchange="get_section_by_class(this.value,'');">
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
                            <h4><?php echo $this->lang->line('exam_final_result'); ?></h4>                            
                        </p>
                    </div>
                </div>            
            </div>
             <?php } ?>
            
            <div class="x_content">
                 <?php echo form_open(site_url('exam/finalresult/add'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo $this->lang->line('roll_no'); ?></th>
                            <th><?php echo $this->lang->line('name'); ?></th>
                            <th><?php echo $this->lang->line('photo'); ?></th>                            
                            <th><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('title'); ?></th>                                            
                            <th><?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('subject'); ?></th>                                            
                            <th><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('mark'); ?></th>                                            
                            <th><?php echo $this->lang->line('obtain'); ?> <?php echo $this->lang->line('total'); ?> </th>                                            
                            <th> <?php echo $this->lang->line('average_grade_point'); ?></th>                                            
                            <th><?php echo $this->lang->line('grade'); ?></th>                                            
                            <th><?php echo $this->lang->line('comment'); ?></th>                                            
                        </tr>
                    </thead>
                    <tbody id="fn_result">   
                        <?php
                        $count = 1;
                        if (isset($students) && !empty($students)) {
                            ?>
                            <?php foreach ($students as $obj) { ?>                           
                            <?php  $result = get_exam_final_result($obj->id, $this->academic_year_id,  $class_id, $section_id ); ?>
                                
                                <tr>
                                    <td><?php echo $obj->roll_no; ?></td>
                                    <td><?php echo ucfirst($obj->name); ?></td>
                                    <td>
                                        <?php if ($obj->photo != '') { ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/student-photo/<?php echo $obj->photo; ?>" alt="" width="45" /> 
                                        <?php } else { ?>
                                            <img src="<?php echo IMG_URL; ?>/default-user.png" alt="" width="45" /> 
                                        <?php } ?>
                                        <input type="hidden" value="<?php echo $obj->id; ?>"  name="students[]" />       
                                    </td>  
                                    
                                    <?php                                    
                                    $exam_title = "";
                                    $subject = "";
                                    $total_subject = "";
                                    
                                    $exam_mark = "";
                                    $exam_total_mark = "";
                                    
                                    $obtain_mark = "";
                                    $obtain_total_mark = "";
                                    
                                    $grade_point = "";
                                    $total_grade_point = "";
                                    
                                    $avg_grade_point = "";
                                    $total_exam = 0;
                                    
                                    foreach($result_exams as $ex){
                                        
                                       $exam_title .= $ex->title.'<br/>';
                                       
                                       $mark = get_exam_result($ex->id, $obj->id, $this->academic_year_id,  $class_id, $section_id );
                                       if(empty($mark)){
                                           continue;
                                       }                                       
                                       $subject .= $mark->total_subject > 0 ? $mark->total_subject.'<br/>' : '--'.'<br/>';
                                       $total_subject += $mark->total_subject;
                                       
                                       $exam_mark .= $mark->total_mark.'<br/>';
                                       $exam_total_mark += $mark->total_mark;
                                       
                                       
                                       $obtain_mark .= $mark->total_obtain_mark.'<br/>';
                                       $obtain_total_mark += $mark->total_obtain_mark;
                                       
                                       $grade_point .= $mark->avg_grade_point > 0 ? $mark->avg_grade_point.'<br/>' : '--'.'<br/>';
                                       $total_grade_point += $mark->avg_grade_point > 0 ? $mark->avg_grade_point : '';
                                       
                                       $mark->total_subject > 0 ? $total_exam++ : '';                                       
                                       
                                    }                                    
                                    ?>                                    
                                    <td width="15%"> <?php echo $exam_title; ?></td>
                                    <td> 
                                        <?php echo $subject; ?>
                                        <input type="hidden" name="total_subject[<?php echo $obj->id; ?>]" value="<?php echo $total_subject; ?>" />
                                    </td>
                                    <td>
                                        <?php echo $exam_mark; ?>
                                        <input type="hidden" name="total_mark[<?php echo $obj->id; ?>]" value="<?php echo $exam_total_mark; ?>" />
                                    </td> 
                                    <td>
                                        <input class="form-control col-md-7 col-xs-12 " type="text" name="total_obtain_mark[<?php echo $obj->id; ?>]" value="<?php echo $obtain_total_mark; ?>" style="width: 60px;" />
                                    </td>                                                                   
                                    <td>
                                        <input class="form-control col-md-7 col-xs-12 " type="text" name="avg_grade_point[<?php echo $obj->id; ?>]" value="<?php echo @number_format($total_grade_point/$total_exam,2); ?>" style="width: 60px;" />
                                    </td>  
                                    <td>
                                        <select class="form-control col-md-7 col-xs-12" name="grade_id[<?php echo $obj->id; ?>]"  required="required">                                
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                             <?php foreach ($grades as $grade) { ?>
                                            <option value="<?php echo $grade->id; ?>" <?php if(isset($result) && $result->grade_id == $grade->id){ echo 'selected="selected"';} ?>><?php echo $grade->name; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>                                    
                                    <td><input type="text" value="<?php if(isset($result) && $result->remark != ''){ echo $result->remark; } ?>"  name="remark[<?php echo $obj->id; ?>]" class="form-control col-md-7 col-xs-12" /></td>
                                </tr>
                            <?php } ?>
                        <?php }else{ ?>
                                <tr>
                                    <td colspan="12" align="center"><?php echo $this->lang->line('no_data_found'); ?></td>
                                </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <div class="ln_solid"></div>
                <div class="form-group">
                    <div class="col-md-6 col-md-offset-5">
                        <?php  if (isset($students) && !empty($students)) { ?>
                         <input type="hidden" value="<?php echo $class_id; ?>"  name="class_id" />
                         <input type="hidden" value="<?php echo $section_id; ?>"  name="section_id" />
                         <a href="<?php echo site_url('exam/result'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                         <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('submit'); ?></button>
                        <?php } ?>
                    </div>
                </div>
                 <?php echo form_close(); ?>
                
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="instructions"><strong><?php echo $this->lang->line('instruction'); ?>: </strong> <?php echo $this->lang->line('exam_result_instruction'); ?></div>
                </div>
                
            </div> 
            
        </div>
    </div>
</div>
 <script type="text/javascript">     
  
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
 $("#result").validate(); 
 $("#add").validate(); 
 
</script>
<style>
#datatable-responsive label.error{display: none !important;}
</style>


