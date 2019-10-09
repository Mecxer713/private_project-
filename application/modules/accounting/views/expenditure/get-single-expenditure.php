<table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <th width="20%"><?php echo $this->lang->line('academic_year'); ?></th>
            <td><?php echo $expenditure->session_year; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('expenditure_head'); ?></th>
            <td><?php echo $expenditure->head; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('expenditure'); ?> <?php echo $this->lang->line('method'); ?></th>
            <td><?php echo $this->lang->line($expenditure->expenditure_via); ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('amount'); ?></th>
            <td><?php echo $expenditure->amount; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('expenditure'); ?> <?php echo $this->lang->line('date'); ?></th>
            <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($expenditure->date)); ?></td>
        </tr> 
        <tr>
            <th><?php echo $this->lang->line('note'); ?></th>
            <td><?php echo $expenditure->note; ?></td>
        </tr> 
    </tbody>
</table>
