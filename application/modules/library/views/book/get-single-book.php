<table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <th width="20%"><?php echo $this->lang->line('book'); ?> <?php echo $this->lang->line('title'); ?> </th>
            <td><?php echo $book->title; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('book_cover'); ?></th>
            <td>
                <?php if($book->cover){ ?>
                <img src="<?php echo UPLOAD_PATH; ?>/book-cover/<?php echo $book->cover; ?>" alt="" width="70" /><br/><br/>
                <?php } ?>
            </td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('book_id'); ?></th>
            <td><?php echo $book->custom_id; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('edition'); ?></th>
            <td><?php echo $book->edition; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('author'); ?></th>
            <td><?php echo $book->author; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('language'); ?></th>
            <td><?php echo $book->language; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('quantity'); ?></th>
            <td><?php echo $book->qty; ?></td>
        </tr>
        <tr>
            <th><?php echo $this->lang->line('price'); ?></th>
            <td><?php echo $this->session->userdata('currency_symbol'); ?> <?php echo $book->price; ?></td>
        </tr>        
        <tr>
            <th><?php echo $this->lang->line('almira_rack'); ?></th>
            <td><?php echo $book->rack_no; ?>   </td>
        </tr>
        
        <tr>
            <th><?php echo $this->lang->line('created'); ?></th>
            <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($book->created_at)); ?></td>
        </tr>       
    </tbody>
</table>