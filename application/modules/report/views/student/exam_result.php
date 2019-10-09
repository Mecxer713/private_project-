<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-bar-chart"></i><small> <?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('report'); ?></small></h3>                
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            
            <?php $this->load->view('quick_report'); ?>   
            
             <div class="x_content filter-box no-print"> 
                <?php echo form_open_multipart(site_url('report/examresult'), array('name' => 'examresult', 'id' => 'examresult', 'class' => 'form-horizontal form-label-left'), ''); ?>
                <div class="row">                    
                   <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('academic_year'); ?> <span class="red">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="academic_year_id" required="required" id="academic_year_id">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php foreach ($academic_years as $obj) { ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($academic_year_id) && $academic_year_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->session_year; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                   <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('class'); ?> <span class="red">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="class_id" id="class_id" required="required" onchange="get_section_by_class(this.value, '');">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php foreach ($classes as $obj) { ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($class_id) && $class_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->name; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                   <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('section'); ?></div>
                            <select  class="form-control col-md-7 col-xs-12" name="section_id" id="section_id">                                
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                            </select>
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

            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                    
                     
                    <div class="x_content">             
                       <div class="row">
                           <div class="col-sm-6 col-xs-6  col-sm-offset-3 col-xs-offset-3 layout-box">
                               <p>
                                   <div><img   src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->gsms_setting->logo; ?>" alt="" width="70" /></div>
                                   <h4><?php echo $this->gsms_setting->school_name; ?></h4>
                                   <p><?php echo $this->gsms_setting->address; ?></p>
                                   <h4 class="head-title ptint-title"><i class="fa fa-bar-chart"></i><small> <?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('report'); ?></small></h4>                
                                   <?php if(isset($academic_year)){ ?>
                                   <div><?php echo $this->lang->line('academic_year'); ?>: <?php echo $academic_year; ?></div>
                                   <?php } ?>
                                   <div>
                                   <?php if(isset($class)){ ?>
                                   <?php echo $this->lang->line('class'); ?>: <?php echo $class; ?>
                                   <?php } ?>
                                   <?php if(isset($section)){ ?>
                                   , <?php echo $this->lang->line('section'); ?>: <?php echo $section; ?>
                                   <?php } ?>
                                   </div>
                               </p>
                           </div>
                       </div>            
                   </div>
                    
                    
                    <ul  class="nav nav-tabs bordered no-print">
                        <li class="active"><a href="#tab_tabular"   role="tab" data-toggle="tab"   aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo $this->lang->line('tabular'); ?> <?php echo $this->lang->line('report'); ?></a> </li>
                    </ul>
                    <br/>
                   
                    <div class="tab-content">
                        <div  class="tab-pane fade in active" id="tab_tabular" >
                            <div class="x_content">
                            <table id="datatable-keytable" class="datatable-responsive table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('roll_no'); ?></th>
                                        <th><?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('subject'); ?></th>                                            
                                        <th><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('mark'); ?></th>                                            
                                        <th><?php echo $this->lang->line('obtain'); ?> <?php echo $this->lang->line('mark'); ?></th> 
                                        <th ><?php echo $this->lang->line('percentage'); ?></th> 
                                        <th> <?php echo $this->lang->line('average_grade_point'); ?></th>                                            
                                        <th><?php echo $this->lang->line('grade'); ?></th>                                            
                                        <th><?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('status'); ?></th>                                            
                                        <th ><?php echo $this->lang->line('position_in_section'); ?></th>                                            
                                        <th ><?php echo $this->lang->line('position_in_class'); ?></th>   
                                        <th><?php echo $this->lang->line('remark'); ?></th>  
                                    </tr>
                                </thead>
                                <tbody>   
                                    <?php 
                                    
                                    $count = 1; if(isset($examresult) && !empty($examresult)){ ?>
                                        <?php foreach($examresult as $obj){ ?>
                                        <?php $class_position = get_position_student_position($academic_year_id, $class_id, $obj->student_id); ?>    
                                        <?php $section_position = get_position_student_position($academic_year_id, $class_id,$obj->student_id, $obj->section_id); ?> 
                                        <tr>
                                            <td><?php echo $obj->student; ?></td>
                                            <td><?php echo $obj->roll_no; ?></td>
                                            <td><?php echo $obj->total_subject; ?></td>
                                            <td><?php echo $obj->total_mark; ?></td>
                                            <td><?php echo $obj->total_obtain_mark; ?></td>
                                            <td><?php echo $obj->total_mark > 0 ? number_format(@$obj->total_obtain_mark/$obj->total_mark*100, 2) : 0; ?>%</td> 
                                            <td><?php echo $obj->avg_grade_point; ?></td>
                                            <td><?php echo $obj->grade; ?></td>
                                            <td><?php echo $this->lang->line($obj->result_status); ?></td>
                                            <td><?php echo $section_position; ?></td> 
                                            <td><?php echo $class_position; ?></td> 
                                            <td><?php echo $obj->remark; ?></td>
                                        </tr>
                                        <?php } ?>                                        
                                    <?php }else{ ?>
                                        <tr><td colspan="12" class="text-center"><?php echo $this->lang->line('no_data_found'); ?></td></tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
            
             <div class="row no-print">
                <div class="col-xs-12 text-right">
                    <button class="btn btn-default " onclick="window.print();"><i class="fa fa-print"></i> <?php echo $this->lang->line('print'); ?></button>
                </div>
            </div>
            
        </div>
    </div>
</div>

 <script type="text/javascript">

    $("#examresult").validate(); 
    
    <?php if(isset($class_id) && isset($section_id)){ ?>
        get_section_by_class('<?php echo $class_id; ?>', '<?php echo $section_id; ?>');
    <?php } ?>
      function get_section_by_class(class_id, section_id){       
           
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_section_by_class'); ?>",
            data   : {class_id: class_id, section_id:section_id},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                  $('#section_id').html(response);
               }
            }
        });         
    }
    
       
</script>
