<table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <th width="20%"><?php echo $this->lang->line('session_year'); ?> </th>
            <td><?php echo $activity->session_year; ?></td>
        </tr>       
        <tr>
            <th><?php echo $this->lang->line('student'); ?></th>
            <td><?php echo $activity->student; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('phone'); ?></th>
            <td><?php echo $activity->phone; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('class'); ?></th>
            <td><?php echo $activity->class_name; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('section'); ?></th>
            <td><?php echo $activity->section; ?></td>
        </tr>
         <tr>
            <th><?php echo $this->lang->line('activity'); ?> </th>
            <td><?php echo $activity->activity; ?></td>
        </tr>        
        <tr>
            <th><?php echo $this->lang->line('activity'); ?> <?php echo $this->lang->line('date'); ?></th>
            <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($activity->activity_date)); ?>   </td>
        </tr>
    </tbody>
</table>
