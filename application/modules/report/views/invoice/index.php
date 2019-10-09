<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-bar-chart"></i><small> <?php echo $this->lang->line('invoice'); ?> <?php echo $this->lang->line('report'); ?></small></h3>                
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            
            <?php $this->load->view('quick_report'); ?>   
            
             <div class="x_content filter-box no-print"> 
                <?php echo form_open_multipart(site_url('report/invoice'), array('name' => 'invoice', 'id' => 'invoice', 'class' => 'form-horizontal form-label-left'), ''); ?>
                <div class="row">                    
                    <div class="col-md-10 col-sm-10 col-xs-12">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <?php echo $this->lang->line('academic_year'); ?>
                            <select  class="form-control col-md-7 col-xs-12" name="academic_year_id" id="academic_year_id">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php foreach ($academic_years as $obj) { ?>
                                <option value="<?php echo $obj->id; ?>" <?php if(isset($academic_year_id) && $academic_year_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->session_year; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <?php echo $this->lang->line('group_by_data'); ?> <span class="required">*</span>
                            <select  class="form-control col-md-7 col-xs-12" name="group_by" id="group_by" required="required">
                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                <?php $groups = get_group_by_type(); ?>
                                <?php foreach ($groups as $key=>$value) { ?>
                                <option value="<?php echo $key; ?>" <?php if(isset($group_by) && $group_by == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                <?php } ?>
                                <option value="fee_head" <?php if(isset($group_by) && $group_by == 'fee_head'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('fee_type'); ?></option>
                                <option value="class" <?php if(isset($group_by) && $group_by == 'class'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('class'); ?></option>
                                <option value="paid_status" <?php if(isset($group_by) && $group_by == 'paid_status'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('pais'); ?> <?php echo $this->lang->line('status'); ?></option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <?php echo $this->lang->line('from_date'); ?>
                            <input  class="form-control col-md-7 col-xs-12"  name="date_from"  id="date_from" value="<?php echo isset($date_from) && $date_from != '' ?  date('d-m-Y', strtotime($date_from)) : ''; ?>" placeholder="<?php echo $this->lang->line('from_date'); ?>" type="text" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="item form-group"> 
                            <?php echo $this->lang->line('end_date'); ?>
                            <input  class="form-control col-md-7 col-xs-12"  name="date_to"  id="date_to" value="<?php echo isset($date_to) && $date_to != '' ?  date('d-m-Y', strtotime($date_to)) : ''; ?>" placeholder="<?php echo $this->lang->line('to_date'); ?>" type="text" autocomplete="off">
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

            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                    
                    
                    <div class="x_content">             
                       <div class="row">
                           <div class="col-sm-6 col-xs-6  col-sm-offset-3 col-xs-offset-3 layout-box">
                               <p>
                                   <div><img   src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->gsms_setting->logo; ?>" alt="" width="70" /></div>
                                   <h4><?php echo $this->gsms_setting->school_name; ?></h4>
                                   <p><?php echo $this->gsms_setting->address; ?></p>
                                   <h3 class="head-title ptint-title"><i class="fa fa-bar-chart"></i><small> <?php echo $this->lang->line('invoice'); ?> <?php echo $this->lang->line('report'); ?></small></h3>                
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
                                        <th><?php echo $this->lang->line('group_by_data'); ?></th>
                                        <th><?php echo $this->lang->line('amount'); ?></th>
                                        <th><?php echo $this->lang->line('discount'); ?></th>
                                        <th><?php echo $this->lang->line('net_amount'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>   
                                    <?php 
                                    $grand_total = 0;
                                    $discount_total = 0;
                                    $count = 1; if(isset($invoice) && !empty($invoice)){ ?>
                                        <?php foreach($invoice as $obj){ ?>
                                        <tr>
                                            <td><?php echo $count++; ?></td>                                            
                                            <td><?php echo $obj->session_year; ?></td>
                                            <td>
                                                 <?php                                                       
                                                    if($group_by == 'fee_head' || $group_by == 'paid_status'){
                                                        $obj->group_by_field = $this->lang->line($obj->group_by_field) ? $this->lang->line($obj->group_by_field) : $obj->group_by_field;
                                                    } 
                                                 ?>
                                                <?php echo $obj->group_by_field; ?>
                                            </td>
                                            <td><?php echo $obj->total_amount; $grand_total +=$obj->total_amount; ?></td>                                           
                                            <td><?php echo  $obj->total_discount; $discount_total += $obj->total_discount; ?></td>                                           
                                            <td><?php echo  number_format(($obj->total_amount - $obj->total_discount),2); ?></td>                                           
                                        </tr>
                                        <?php } ?>
                                        <tr>
                                            <td colspan="3"><strong><?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('amount'); ?></strong></td>
                                            <td><strong><?php echo number_format($grand_total,2); ?></strong></td>                                           
                                            <td><strong><?php echo number_format($discount_total,2); ?></strong></td>                                           
                                            <td><strong><?php echo number_format(($grand_total - $discount_total),2); ?></strong></td>                                           
                                        </tr>
                                    <?php }else{ ?>
                                        <tr><td colspan="6" class="text-center"><?php echo $this->lang->line('no_data_found'); ?></td></tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                        </div>
                        <div  class="tab-pane fade in active" id="tab_graphical" >
                            <div class="x_content">
                                <?php if(isset($invoice) && !empty($invoice)){ ?>
                                 <script type="text/javascript">

                                    $(function () {
                                        $('#invoice-report').highcharts({
                                            chart: {
                                                type: 'pie',
                                                options3d: {
                                                    enabled: true,
                                                    alpha: 45
                                                }
                                            },
                                            title: {
                                                text: '<?php echo $this->lang->line('invoice'); ?> <?php echo $this->lang->line('report'); ?>'
                                            },
                                            subtitle: {
                                                text: ''
                                            },
                                            plotOptions: {
                                                pie: {
                                                    innerSize: 100,
                                                    depth: 45,
                                                    dataLabels: {
                                                        format: '{point.name}'
                                                    }
                                                }
                                            },
                                            series: [{
                                                name: '<?php echo $this->lang->line('amount'); ?>',
                                                data: [ 
                                                    
                                                    <?php foreach($invoice as $obj){ ?>
                                                     <?php                                                       
                                                        if($group_by == 'fee_head' || $group_by == 'paid_status'){
                                                            $obj->group_by_field = $this->lang->line($obj->group_by_field) ? $this->lang->line($obj->group_by_field) : $obj->group_by_field;
                                                        } 
                                                        ?>       
                                                    <?php $discount = ($obj->total_discount/100)*$obj->total_amount; ?>                        
                                                    ['<?php echo $obj->session_year.'<br/>'.$obj->total_amount; ?><br/><?php echo $obj->group_by_field; ?><br/>', <?php echo $obj->total_amount; ?>],
                                                    <?php } ?>                                                   
                                                ]
                                            }],
                                            credits: {
                                            enabled: false
                                            }
                                        });
                                     });
                                </script>
                                <div id="invoice-report" style="width: 99%; height: 500px; margin: 0 auto"></div>
                                 <?php }else{ ?>
                                <p class="text-center"><?php echo $this->lang->line('no_data_found'); ?></p>
                                 <?php } ?>
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
</div>
<link href="<?php echo VENDOR_URL; ?>datepicker/datepicker.css" rel="stylesheet">
 <script src="<?php echo VENDOR_URL; ?>datepicker/datepicker.js"></script>
 <script type="text/javascript">
     
    $('#date_from').datepicker();
    $('#date_to').datepicker();
    $("#invoice").validate();  
       
</script>
