<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa fa-desktop"></i><small> <?php echo $this->lang->line('manage'); ?> <?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('about'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            
            <div class="x_content quick-link">
                <?php echo $this->lang->line('quick_link'); ?>:
                <?php if(has_permission(VIEW, 'frontend', 'frontend')){ ?>
                   <a href="<?php echo site_url('frontend/index'); ?>"><?php echo $this->lang->line('manage_frontend'); ?> </a>                    
                <?php } ?>
                <?php if(has_permission(VIEW, 'frontend', 'slider')){ ?>
                   | <a href="<?php echo site_url('frontend/slider/index'); ?>"><?php echo $this->lang->line('manage_slider'); ?> </a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'frontend', 'about')){ ?>
                   | <a href="<?php echo site_url('frontend/about/index'); ?>"><?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('about'); ?></a>
                <?php } ?>               
                <?php if(has_permission(VIEW, 'setting', 'setting')){ ?>                   
                   | <a href="<?php echo site_url('setting'); ?>"><?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('setting'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'announcement', 'notice')){ ?>
                   | <a href="<?php echo site_url('announcement/notice/index'); ?>"><?php echo $this->lang->line('manage_notice'); ?></a>
                <?php } ?>    
                <?php if(has_permission(VIEW, 'announcement', 'news')){ ?>
                   | <a href="<?php echo site_url('announcement/news/index'); ?>"><?php echo $this->lang->line('manage_news'); ?></a>
                <?php } ?>    
                <?php if(has_permission(VIEW, 'announcement', 'holiday')){ ?>
                   | <a href="<?php echo site_url('announcement/holiday/index'); ?>"><?php echo $this->lang->line('manage_holiday'); ?></a>                    
                <?php } ?>
                <?php if(has_permission(VIEW, 'teacher', 'teacher')){ ?>
                  | <a href="<?php echo site_url('teacher/index'); ?>"><?php echo $this->lang->line('manage_teacher'); ?> </a>                    
                <?php } ?>   
                <?php if(has_permission(VIEW, 'hrm', 'employee')){ ?>
                   | <a href="<?php echo site_url('hrm/employee'); ?>"><?php echo $this->lang->line('manage_employee'); ?></a>
                <?php } ?>  
                
                
            </div>
            
            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">                    
                    <ul  class="nav nav-tabs bordered"> 
                        <li  class="active"><a href="#tab_edit_about"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> <?php echo $this->lang->line('about'); ?>  <?php echo $this->lang->line('school'); ?></a> </li>                          
                    </ul>
                    <br/>
                    
                    <div class="tab-content">
                       
                        <div class="tab-pane fade in active" id="tab_edit_about">
                            <div class="x_content"> 
                               <?php echo form_open_multipart(site_url('frontend/about/edit/'), array('name' => 'edit', 'id' => 'edit', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                                                 
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="about_text"><?php echo $this->lang->line('about'); ?> <?php echo $this->lang->line('school'); ?></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <textarea  class="form-control col-md-7 col-xs-12"  name="about_text"  id="edit_about_text" placeholder="<?php echo $this->lang->line('about'); ?> <?php echo $this->lang->line('school'); ?>"><?php echo isset($setting->about_text) ?  $setting->about_text : ''; ?></textarea>
                                        <div class="help-block"><?php echo form_error('about_text'); ?></div>
                                    </div>
                                </div>                                                         
                                                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo $this->lang->line('about'); ?> <?php echo $this->lang->line('image'); ?></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="hidden" name="prev_about_image" id="prev_about_image" value="<?php echo $setting->about_image; ?>" />
                                        <?php if($setting->about_image){ ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/about/<?php echo $setting->about_image; ?>" alt="" width="250" /><br/><br/>
                                        <?php } ?>
                                        <div class="btn btn-default btn-file">
                                            <i class="fa fa-paperclip"></i> <?php echo $this->lang->line('upload'); ?>
                                            <input  class="form-control col-md-7 col-xs-12"  name="about_image"  id="about_image" type="file">
                                        </div>
                                        <div class="text-info"><?php echo $this->lang->line('valid_file_format_img'); ?></div>
                                        <div class="help-block"><?php echo form_error('about_image'); ?></div>
                                    </div>
                                </div>
                                                         
                                                                                             
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <input type="hidden" value="<?php echo isset($setting) ? $setting->id : $id; ?>" name="id" />
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('update'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>                         
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade bs-frontend-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
          <h4 class="modal-title"><?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('about'); ?></h4>
        </div>
        <div class="modal-body fn_frontend_data">            
        </div>       
      </div>
    </div>
</div>

<script type="text/javascript">
         
    function get_frontend_modal(school_id){
         
        $('.fn_frontend_data').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?php echo IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
          type   : "POST",
          url    : "<?php echo site_url('frontend/about/get_single_school'); ?>",
          data   : {school_id : school_id},  
          success: function(response){                                                   
             if(response)
             {
                $('.fn_frontend_data').html(response);
             }
          }
       });
    }
</script>


 <link href="<?php echo VENDOR_URL; ?>editor/jquery-te-1.4.0.css" rel="stylesheet">
 <script type="text/javascript" src="<?php echo VENDOR_URL; ?>editor/jquery-te-1.4.0.min.js"></script>
 <script type="text/javascript">
     
 $('#edit_about_text').jqte();
  
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
        search: true,         
        responsive: true
      });
    });
    
    $("#edit").validate();  
  </script> 
  
  <style type="text/css">
      .jqte_editor{height: 250px;}
  </style>
  
      