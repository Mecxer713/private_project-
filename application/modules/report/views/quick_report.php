<div class="x_content quick-link no-print">
    <div class="row">                   
        <div class="col-md-12 col-sm-12 col-xs-12">
            <span><?php echo $this->lang->line('select'); ?> <?php echo $this->lang->line('report'); ?>:</span>
            <select  class="form-control" name="report" id="report" onchange="get_report_action(this.value);">
                    <?php 
                    $reports = array(); 
                    $reports[site_url('report/income')] = $this->lang->line('income') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/expenditure')] = $this->lang->line('expenditure') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/invoice')] = $this->lang->line('invoice') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/duefee')] = $this->lang->line('due_fee') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/feecollection')] = $this->lang->line('fee') .' ' .$this->lang->line('collection') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/balance')] = $this->lang->line('accounting') .' ' . $this->lang->line('balance') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/library')] = $this->lang->line('library') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/sattendance')] = $this->lang->line('student').' '. $this->lang->line('attendance') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/syattendance')] = $this->lang->line('student').' '. $this->lang->line('yearly').' '. $this->lang->line('attendance') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/tattendance')] = $this->lang->line('teacher').' '. $this->lang->line('attendance') .' ' . $this->lang->line('report');  
                    $reports[site_url('report/tyattendance')] = $this->lang->line('teacher').' '. $this->lang->line('yearly').' '. $this->lang->line('attendance') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/eattendance')] = $this->lang->line('employee').' '. $this->lang->line('attendance') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/eyattendance')] = $this->lang->line('employee').' '. $this->lang->line('yearly').' '. $this->lang->line('attendance') .' ' . $this->lang->line('report'); 
                    $reports[site_url('report/student')] = $this->lang->line('student').' '. $this->lang->line('report'); 
                    $reports[site_url('report/sinvoice')] = $this->lang->line('student').' '. $this->lang->line('invoice').' '.  $this->lang->line('report'); 
                    $reports[site_url('report/sactivity')] = $this->lang->line('student').' '. $this->lang->line('activity').' '.  $this->lang->line('report'); 
                    $reports[site_url('report/payroll')] = $this->lang->line('payroll').' '. $this->lang->line('report'); 
                    $reports[site_url('report/transaction')] = $this->lang->line('daily').' '. $this->lang->line('transaction').' '. $this->lang->line('report'); 
                    $reports[site_url('report/statement')] = $this->lang->line('daily').' '. $this->lang->line('statement').' '. $this->lang->line('report'); 
                    $reports[site_url('report/examresult')] = $this->lang->line('exam').' '. $this->lang->line('result').' '. $this->lang->line('report'); 
                    ?>
                    <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                    <?php foreach($reports as $key=>$value){ ?>
                    <option value="<?php echo $key; ?>" <?php if(isset($action) && $action == $value){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                    <?php } ?>
                </select>
        </div>
    </div>             
</div>

<script src="<?php echo VENDOR_URL; ?>chart/js/highcharts.js"></script>
<script src="<?php echo VENDOR_URL; ?>chart/js/highcharts-3d.js"></script>
<script src="<?php echo VENDOR_URL; ?>chart/js/modules/exporting.js"></script>

<script type="text/javascript">
    function get_report_action(url){          
       if(url){
           window.location.href = url; 
       }
    }
</script>

 