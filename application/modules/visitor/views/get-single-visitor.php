<table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <th width="20%"><?php echo $this->lang->line('name'); ?></th>
            <td><?php echo $visitor->name; ?></td>
        </tr>
              
        <tr>
            <th><?php echo $this->lang->line('phone'); ?> </th>
            <td><?php echo $visitor->phone; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('coming_from'); ?> </th>
            <td><?php echo $visitor->coming_from; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('user'); ?> <?php echo $this->lang->line('type'); ?></th>
            <td><?php echo $visitor->role; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('to_meet'); ?> </th>
            <td><?php $user = get_user_by_role($visitor->role_id, $visitor->user_id); echo $user->name; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('reason_to_meet'); ?></th>
            <td><?php echo $this->lang->line($visitor->reason); ?></td>
        </tr>        
        <tr>
            <th><?php echo $this->lang->line('check_in'); ?></th>
            <td><?php echo date($this->gsms_setting->sms_date_format. ' h:i:s A', strtotime($visitor->check_in)); ?></td>
        </tr>        
        <tr>
            <th><?php echo $this->lang->line('check_out'); ?></th>
            <td><?php echo $visitor->check_out ? date($this->gsms_setting->sms_date_format . ' H:i:s A', strtotime($visitor->check_out)) : '<a style="color:red;" href="javascript:void(0);" onclick="check_out('.$visitor->id.');">'.$this->lang->line('check_out').'</a>'; ?></td>
        </tr>        
        <tr>
            <th><?php echo $this->lang->line('note'); ?></th>
            <td><?php echo $visitor->note; ?></td>
        </tr>               
    </tbody>
</table>
