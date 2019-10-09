<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-bar-chart"></i><small> <?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('report'); ?></small></h3>                
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            
            <?php $this->load->view('quick_report'); ?>   
            
             <div class="x_content filter-box no-print"> 
                <?php echo form_open_multipart(site_url('report/student'), array('name' => 'student', 'id' => 'student', 'class' => 'form-horizontal form-label-left'), ''); ?>
                <div class="row">   
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div> <?php echo $this->lang->line('academic_year'); ?> <span class="required">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="academic_year_id" id="academic_year_id" required="required">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php foreach ($academic_years as $obj) { ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($academic_year_id) && $academic_year_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->session_year; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <div><?php echo $this->lang->line('group_by_data'); ?> <span class="required">*</span></div>
                            <select  class="form-control col-md-7 col-xs-12" name="group_by" id="group_by" required="required"> 
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>                               
                                <option value="gender" <?php if(isset($group_by) && $group_by == 'gender'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('gender'); ?></option>
                                <option value="vehicle" <?php if(isset($group_by) && $group_by == 'vehicle'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('vehicle'); ?></option>
                                <option value="library" <?php if(isset($group_by) && $group_by == 'library'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('library'); ?></option>
                                <option value="hostel" <?php if(isset($group_by) && $group_by == 'hostel'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('hostel'); ?></option>
                                <option value="class" <?php if(isset($group_by) && $group_by == 'class'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('class'); ?></option>
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
                                   <h4 class="head-title ptint-title"><i class="fa fa-bar-chart"></i><small> <?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('report'); ?></small></h4>                
                                   <?php if(isset($academic_year)){ ?>
                                   <div><?php echo $this->lang->line('academic_year'); ?>: <?php echo $academic_year; ?></div>
                                   <?php } ?>
                                   <?php if(isset($group_by)){ ?>
                                   <div><?php echo $this->lang->line('report'); ?>: <?php echo $this->lang->line($group_by); ?></div>
                                   <?php } ?>
                               </p>
                           </div>
                       </div>            
                   </div>
                    
                    
                    <ul  class="nav nav-tabs bordered no-print">
                        <li class=""><a href="#tab_tabular"   role="tab" data-toggle="tab"   aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo $this->lang->line('tabular'); ?> <?php echo $this->lang->line('report'); ?></a> </li>
                        <li  class="active"><a href="#tab_graphical"   role="tab" data-toggle="tab"  aria-expanded="false"><i class="fa fa-line-chart"></i> <?php echo $this->lang->line('graphical'); ?> <?php echo $this->lang->line('report'); ?></a> </li>                          
                    </ul>
                    <br/>
                    
                    <div class="tab-content">
                        <div  class="tab-pane fade in" id="tab_tabular" >
                            <div class="x_content">
                            <table id="datatable-keytable" class="datatable-responsive table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('sl_no'); ?></th>
                                        <th><?php echo $this->lang->line('academic_year'); ?></th>
                                        <th><?php echo $this->lang->line('class'); ?> <?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('male'); ?></th>
                                        <th><?php echo $this->lang->line('female'); ?></th>
                                        <th><?php echo $this->lang->line('total'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>   
                                    <?php 
                                    $grand_total = 0;
                                    $male_arr = array();
                                    $female_arr = array();
                                    $total_arr = array();
                                    
                                    $count = 1; if(isset($students) && !empty($students)){ ?>
                                        <?php foreach($students as $obj){ ?>
                                        <tr>
                                            <td><?php echo $count++; ?></td>                                            
                                            <td><?php echo $obj->session_year; ?></td>
                                            <td><?php echo $this->lang->line('class'); ?> <?php echo $obj->group_by_field; ?></td>
                                            <td><?php echo $obj->male; $male_arr[] = $obj->male; ?></td>
                                            <td><?php echo $obj->female; $female_arr[] = $obj->female; ?></td>
                                            <td><?php echo $obj->total; $grand_total +=$obj->total; $total_arr[] = $obj->total; ?></td>                                           
                                        </tr>
                                        <?php } ?>
                                        <tr>
                                            <td colspan="5"><strong><?php echo $this->lang->line('total'); ?> </strong></td>
                                            <td><strong><?php echo $grand_total; ?></strong></td>                                           
                                        </tr>
                                    <?php }else{ ?>
                                        <tr><td class="text-center" colspan="6"><?php echo $this->lang->line('no_data_found'); ?></td></tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        
                        <div  class="tab-pane fade in active" id="tab_graphical" >
                            <div class="x_content">
                                <?php if(isset($students) && !empty($students)){ ?>
                                 <script type="text/javascript">
                                     
                                      $(function () {
                                        $('#student-report').highcharts({
                                                chart: {
                                                type: 'column'
                                                },
                                                title: {
                                                    text: '<?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('report'); ?>'
                                                },
                                                xAxis: {
                                                    categories: [
                                                        <?php foreach($students as $obj){ ?> 
                                                         '<?php echo $this->lang->line('class'); ?> <?php echo $obj->group_by_field; ?>',
                                                         <?php } ?>         
                                                     ]
                                                },
                                                credits: {
                                                    enabled: false
                                                },
                                                series: [{
                                                    name: '<?php echo $this->lang->line('male'); ?>',
                                                    data: [<?php echo implode(',', $male_arr); ?>]
                                                }, {
                                                    name: '<?php echo $this->lang->line('female'); ?>',
                                                    data: [<?php echo implode(',', $female_arr); ?>]
                                                }, {
                                                    name: '<?php echo $this->lang->line('total'); ?>',
                                                    data: [<?php echo implode(',', $total_arr); ?>]
                                                }],
                                            credits: {
                                            enabled: false
                                            }
                                        });
                                     });
                                     
                                </script>
                                
                                <div id="student-report" style="width: 99%; height:<?php echo count($students)*30+250 ?>px !important; margin: 0 auto"></div>
                                 <?php }else{ ?>
                                <p class="text-center"><?php echo $this->lang->line('no_data_found'); ?></p>
                                 <?php } ?>
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

    $("#student").validate();  
       
</script>

