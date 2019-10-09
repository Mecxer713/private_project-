<table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <th><?php echo $this->lang->line('session_year'); ?></th>
            <td><?php echo $email->session_year; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('receiver_type'); ?></th>
            <td><?php echo $email->receiver_type; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('receiver'); ?> <?php echo $this->lang->line('name'); ?></th>
            <td><?php echo $email->receivers; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('subject'); ?></th>
            <td><?php echo $email->subject; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('email_body'); ?></th>
            <td><?php echo $email->body; ?></td>
        </tr>        
        <tr>
            <th><?php echo $this->lang->line('attachment'); ?></th>
            <td>
                <?php if($email->attachment){ ?>
                    <img src="<?php echo UPLOAD_PATH; ?>/email-attachment/<?php echo $email->attachment; ?>" alt=""  class="img-responsive" /><br/><br/>
                <?php } ?>
            </td>
        </tr>        
        <tr>
            <th><?php echo $this->lang->line('send'); ?> <?php echo $this->lang->line('time'); ?></th>
            <td><?php echo get_nice_time($email->created_at); ?></td>
        </tr> 
    </tbody>
</table>
