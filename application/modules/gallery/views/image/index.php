<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa fa-image"></i><small> <?php echo $this->lang->line('manage_gallery_image'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
             <div class="x_content quick-link">
                <strong> <?php echo $this->lang->line('quick_link'); ?>: </strong>
                <?php if(has_permission(VIEW, 'gallery', 'gallery')){ ?>
                    <a href="<?php echo site_url('gallery/index'); ?>"><?php echo $this->lang->line('manage_gallery'); ?> </a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'gallery', 'image')){ ?>
                  |  <a href="<?php echo site_url('gallery/image'); ?>"><?php echo $this->lang->line('manage_gallery_image'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'frontend', 'frontend')){ ?>
                  |  <a href="<?php echo site_url('frontend/index'); ?>"><?php echo $this->lang->line('manage_frontend'); ?></a>
                <?php } ?>
            </div>
            
            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                    
                    <ul  class="nav nav-tabs bordered">
                        <li class="<?php if(isset($list)){ echo 'active'; }?>"><a href="#tab_image_list"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo $this->lang->line('image'); ?> <?php echo $this->lang->line('list'); ?></a> </li>
                        <?php if(has_permission(ADD, 'gallery', 'image')){ ?>
                            <li  class="<?php if(isset($add)){ echo 'active'; }?>"><a href="#tab_add_image"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-plus-square-o"></i> <?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('image'); ?></a> </li>                          
                        <?php } ?> 
                        <?php if(isset($edit)){ ?>
                            <li  class="active"><a href="#tab_edit_image"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> <?php echo $this->lang->line('image'); ?></a> </li>                          
                        <?php } ?>    
                    </ul>
                    <br/>
                    
                    <div class="tab-content">
                        <div  class="tab-pane fade in <?php if(isset($list)){ echo 'active'; }?>" id="tab_image_list" >
                            <div class="x_content">
                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('sl_no'); ?></th>
                                        <th><?php echo $this->lang->line('gallery'); ?> <?php echo $this->lang->line('image'); ?></th>
                                        <th><?php echo $this->lang->line('image'); ?> <?php echo $this->lang->line('caption'); ?></th>
                                        <th><?php echo $this->lang->line('gallery'); ?> <?php echo $this->lang->line('title'); ?></th>
                                        <th><?php echo $this->lang->line('action'); ?></th>                                            
                                    </tr>
                                </thead>
                                <tbody>   
                                    <?php $count = 1; if(isset($images) && !empty($images)){ ?>
                                        <?php foreach($images as $obj){ ?>
                                        <tr>
                                            <td><?php echo $count++; ?></td>
                                            <td>
                                                <?php  if($obj->image != ''){ ?>
                                                <img src="<?php echo UPLOAD_PATH; ?>/gallery/<?php echo $obj->image; ?>" alt="" width="100" /> 
                                                <?php } ?>
                                            </td>
                                            <td><?php echo $obj->caption; ?></td>
                                            <td><?php echo $obj->title; ?></td>
                                            <td>
                                                <?php if(has_permission(EDIT, 'gallery', 'image')){ ?>
                                                    <a href="<?php echo site_url('gallery/image/edit/'.$obj->id); ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> </a>
                                                <?php } ?>
                                                <?php if(has_permission(VIEW, 'gallery', 'image')){ ?>
                                                    <a  onclick="get_image_modal(<?php echo $obj->id; ?>);"  data-toggle="modal" data-target=".bs-image-modal-lg"  class="btn btn-success btn-xs"><i class="fa fa-eye"></i> <?php echo $this->lang->line('view'); ?> </a>
                                                <?php  } ?> 
                                                <?php if(has_permission(DELETE, 'gallery', 'image')){ ?>
                                                    <a href="<?php echo site_url('gallery/image/delete/'.$obj->id); ?>" onclick="javascript: return confirm('<?php echo $this->lang->line('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo $this->lang->line('delete'); ?> </a>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                        </div>

                        <div  class="tab-pane fade in <?php if(isset($add)){ echo 'active'; }?>" id="tab_add_image">
                            <div class="x_content"> 
                               <?php echo form_open_multipart(site_url('gallery/image/add'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gallery_id"><?php echo $this->lang->line('gallery'); ?> <?php echo $this->lang->line('title'); ?><span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="gallery_id"  id="gallery_id" required="required">
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option> 
                                            <?php foreach($galleries as $obj){ ?>
                                             <option value="<?php echo $obj->id; ?>" <?php echo isset($post['caption']) ?  'selected="selected"' : ''; ?>><?php echo $obj->title; ?></option> 
                                            <?php } ?>                                                                              
                                        </select>
                                        <div class="help-block"><?php echo form_error('gallery_id'); ?></div>
                                    </div>
                                </div>
                                                         
                                
                               <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"> <?php echo $this->lang->line('gallery'); ?> <?php echo $this->lang->line('image'); ?>  <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="btn btn-default btn-file">
                                            <i class="fa fa-paperclip"></i> <?php echo $this->lang->line('upload'); ?>
                                            <input  class="form-control col-md-7 col-xs-12"  name="image"  id="image" type="file" required="required">
                                        </div>
                                        <div class="text-info"><?php echo $this->lang->line('valid_file_format_img'); ?></div>
                                        <div class="help-block"><?php echo form_error('image'); ?></div>
                                    </div>
                               </div>
                                
                               <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="caption"><?php echo $this->lang->line('image'); ?> <?php echo $this->lang->line('caption'); ?> </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="caption"  id="caption" value="<?php echo isset($post['caption']) ?  $post['caption'] : ''; ?>" placeholder="<?php echo $this->lang->line('image'); ?> <?php echo $this->lang->line('caption'); ?>" type="text">
                                        <div class="help-block"><?php echo form_error('caption'); ?></div>
                                    </div>
                                </div>
                                
                                                              
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('gallery/image/index'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>  

                        <?php if(isset($edit)){ ?>
                        <div class="tab-pane fade in active" id="tab_edit_image">
                            <div class="x_content"> 
                               <?php echo form_open_multipart(site_url('gallery/image/edit/'.$image->id), array('name' => 'edit', 'id' => 'edit', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gallery_id"><?php echo $this->lang->line('gallery'); ?> <?php echo $this->lang->line('title'); ?><span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="gallery_id"  id="gallery_id" required="required">
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option> 
                                            <?php foreach($galleries as $obj){ ?>
                                             <option value="<?php echo $obj->id; ?>" <?php echo isset($post['caption']) || $obj->id == $image->gallery_id ?  'selected="selected"' : ''; ?>><?php echo $obj->title; ?></option> 
                                            <?php } ?>                                                                              
                                        </select>
                                        <div class="help-block"><?php echo form_error('gallery_id'); ?></div>
                                    </div>
                                </div>                                                                                             
                                                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"> <?php echo $this->lang->line('gallery'); ?> <?php echo $this->lang->line('image'); ?> </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="hidden" name="prev_image" id="prev_image" value="<?php echo $image->image; ?>" />
                                        <?php if($image->image){ ?>
                                        <img src="<?php echo UPLOAD_PATH; ?>/gallery/<?php echo $image->image; ?>" alt="" width="120" /><br/><br/>
                                        <?php } ?>
                                        <div class="btn btn-default btn-file">
                                            <i class="fa fa-paperclip"></i> <?php echo $this->lang->line('upload'); ?>
                                            <input  class="form-control col-md-7 col-xs-12"  name="image"  id="image" type="file">
                                        </div>
                                        <div class="text-info"><?php echo $this->lang->line('valid_file_format_img'); ?></div>
                                        <div class="help-block"><?php echo form_error('image'); ?></div>
                                    </div>
                                </div>
                                
                                 
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="caption"><?php echo $this->lang->line('image'); ?> <?php echo $this->lang->line('caption'); ?> </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="caption"  id="caption" value="<?php echo isset($image->caption) ?  $image->caption : $post['caption']; ?>" placeholder="<?php echo $this->lang->line('image'); ?> <?php echo $this->lang->line('caption'); ?>" type="text">
                                        <div class="help-block"><?php echo form_error('caption'); ?></div>
                                    </div>
                                </div>
                                                         
                                                                                            
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <input type="hidden" value="<?php echo isset($image) ? $image->id : $id; ?>" name="id" />
                                        <a href="<?php echo site_url('gallery/image/index'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('update'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>  
                        <?php } ?>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade bs-image-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
          <h4 class="modal-title"><?php echo $this->lang->line('image'); ?> <?php echo $this->lang->line('information'); ?></h4>
        </div>
        <div class="modal-body fn_image_data">
            
        </div>       
      </div>
    </div>
</div>
<script type="text/javascript">
         
    function get_image_modal(image_id){
         
        $('.fn_image_data').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?php echo IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
          type   : "POST",
          url    : "<?php echo site_url('gallery/image/get_single_image'); ?>",
          data   : {image_id : image_id},  
          success: function(response){                                                   
             if(response)
             {
                $('.fn_image_data').html(response);
             }
          }
       });
    }
</script>


 <script type="text/javascript"> 
  
  $(document).ready(function() {
      $('#datatable-responsive').DataTable( {
          dom: 'Bfrtip',
          iDisplayLength: 15,
          buttons: [
              'copyHtml5',
              'excelHtml5',
              'csvHtml5',
              'pdfHtml5',
              'pageLength'
          ],
          search: true
      });
    });
    $("#add").validate();     
    $("#edit").validate();  
  </script> 