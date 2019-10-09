<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3  class="head-title"><i class="fa fa-language"></i><small> <?php echo $this->lang->line('manage_language'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            
            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                    <ul  class="nav nav-tabs bordered">
                        <li class="<?php if(isset($list)){ echo 'active'; }?>"><a href="#tab_language_list"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo $this->lang->line('language'); ?> <?php echo $this->lang->line('list'); ?></a> </li>
                        <?php if(has_permission(ADD, 'language', 'language')){ ?>
                            <li  class=""><a href="#tab_add_language"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-plus-square-o"></i> <?php echo $this->lang->line('add'); ?> <?php echo $this->lang->line('language'); ?></a> </li>                          
                        <?php } ?>
                        <?php if(isset($edit)){ ?>
                            <li  class="active"><a href="#tab_edit_language"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> <?php echo $this->lang->line('languge'); ?></a> </li>                          
                        <?php } ?>
                        <?php if(isset($labels)){ ?>
                        <li  class="active"><a href="#tab_label" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> <?php echo $this->lang->line('label'); ?></a></li>                          
                        <?php } ?>
                    </ul>
                    <br/>
                    <div class="tab-content">
                        <div  class="tab-pane fade in <?php if(isset($list)){ echo 'active'; }?>" id="tab_language_list" >
                            <div class="x_content">
                            <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('sl_no'); ?></th>
                                        <th><?php echo $this->lang->line('language'); ?></th>
                                        <th><?php echo $this->lang->line('action'); ?></th>                                            
                                    </tr>
                                </thead>
                                <tbody>   
                                    <?php $count = 1; if(isset($fields) && !empty($fields)){ ?>
                                        <?php foreach($fields as $field){ ?>
                                        <?php  if($field == 'id' || $field == 'label'){ continue; } ?>
                                        <tr>
                                            <td><?php echo $count++; ?></td>
                                            <td><?php echo ucfirst($field); ?></td>
                                            <td>
                                                
                                                 <?php if(has_permission(EDIT, 'language', 'language')){ ?>
                                                    <a href="<?php echo site_url('language/label/'.$field); ?>" class="btn btn-success btn-xs"><i class="fa fa-folder-open-o"></i> <?php echo $this->lang->line('update'); ?> <?php echo $this->lang->line('label'); ?> </a>
                                                 <?php } ?>
                                                    
                                                <?php if($active_lang == $field){ ?>
                                                    <a class="btn btn-warning btn-xs"><i class="fa fa-check"></i> <?php echo $this->lang->line('active'); ?></a>
                                                <?php }else{ ?>
                                                    <?php if(has_permission(EDIT, 'language', 'language') || has_permission(ADD, 'language', 'language')){ ?>
                                                        <a href="<?php echo site_url('language/activate/'.$field); ?>"  class="btn btn-success btn-xs"> <?php echo  $this->lang->line('activate'); ?></a>
                                                    <?php } ?>
                                                <?php } ?>
                                                    
                                                <?php if(!get_default_lang_list($field)){ ?> 
                                                    <?php if(has_permission(EDIT, 'language', 'language')){ ?>
                                                        <a href="<?php echo site_url('language/edit/'.$field); ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('edit'); ?> </a>
                                                    <?php } ?>
                                                    <?php if(has_permission(DELETE, 'language', 'language')){ ?>    
                                                        <a href="<?php echo site_url('language/delete/'.$field); ?>" onclick="javascript: return confirm('<?php echo $this->lang->line('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo $this->lang->line('delete'); ?> </a>
                                                    <?php } ?>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                    <?php } ?>
                                </tbody>
                            </table>
                            </div>
                        </div>

                        <div  class="tab-pane fade in " id="tab_add_language">
                            <div class="x_content"> 
                               <?php echo form_open(site_url('language/add'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo $this->lang->line('language'); ?> <?php echo $this->lang->line('name'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="name"  id="name" placeholder="<?php echo $this->lang->line('language'); ?> <?php echo $this->lang->line('name'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('name'); ?></div>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('language'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>  

                        <?php if(isset($edit)){ ?>
                        <div class="tab-pane fade in active" id="tab_edit_language">
                            <div class="x_content"> 
                               <?php echo form_open(site_url('language/edit/'.$language), array('name' => 'edit', 'id' => 'edit', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo $this->lang->line('language'); ?> <?php echo $this->lang->line('name'); ?> <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="hidden" value="<?php echo isset($language) ? $language : ''; ?>" name="old_name" />
                                        <input  class="form-control col-md-7 col-xs-12"  name="name" value="<?php echo isset($language) ? $language : ''; ?>"  placeholder="<?php echo $this->lang->line('language'); ?> <?php echo $this->lang->line('name'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('name'); ?></div>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('language'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo $this->lang->line('update'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div>  
                        <?php } ?>

                        <?php if(isset($labels) && !empty($labels)){ ?>
                        <div class="tab-pane pade active" id="tab_label">                                
                            <?php echo form_open(site_url('language/update'), array('name' => 'update', 'id' => 'update', 'class'=>'form-horizontal form-label-left'), ''); ?>
                            <input type="hidden" name="language" value="<?php echo $language; ?>" />
                            <div class="row"> 
                                 <?php foreach($labels as $obj){ ?>
                                    <div class="col-sm-3">
                                        <div class="lang-label item form-group">
                                        <p>
                                            <?php echo $obj->label; ?>
                                            <input type="hidden" name="label_id[]" value="<?php echo $obj->id; ?>" />
                                            <input type="text" name="label[<?php echo $obj->id; ?>]" value="<?php echo $obj->$language; ?>"  class="form-control"/>
                                        </p>
                                        </div>
                                    </div>                                    
                                <?php } ?>

                            </div> 
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6">
                                    <a href="<?php echo site_url('language'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                    <button  type="submit" class="btn btn-success"><?php echo $this->lang->line('update'); ?> <?php echo $this->lang->line('label'); ?></button>
                                </div>
                            </div>                                    
                           <?php echo form_close(); ?> 
                        </div>   
                       <?php } ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- datatable with buttons -->
 <script type="text/javascript">
        $(document).ready(function() {
          $('#datatable-responsive').DataTable( {
              dom: 'Bfrtip',
              iDisplayLength: 50,
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