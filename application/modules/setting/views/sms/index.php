<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-envelope-o"></i><small> <?php echo $this->lang->line('sms'); ?> <?php echo $this->lang->line('setting'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content quick-link">
                <strong> <?php echo $this->lang->line('quick_link'); ?>: </strong>
                <?php if(has_permission(VIEW, 'setting', 'setting')){ ?>
                    <a href="<?php echo site_url('setting'); ?>"><?php echo $this->lang->line('general'); ?> <?php echo $this->lang->line('setting'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'setting', 'payment')){ ?>
                   | <a href="<?php echo site_url('setting/payment'); ?>"><?php echo $this->lang->line('payment'); ?> <?php echo $this->lang->line('setting'); ?></a>
                <?php } ?>
                <?php if(has_permission(VIEW, 'setting', 'sms')){ ?>
                   | <a href="<?php echo site_url('setting/sms'); ?>"><?php echo $this->lang->line('sms'); ?> <?php echo $this->lang->line('setting'); ?></a>                    
                <?php } ?>
                <?php if(has_permission(VIEW, 'frontend', 'frontend')){ ?>
                   | <a href="<?php echo site_url('frontend'); ?>"><?php echo $this->lang->line('manage_frontend'); ?> </a>                    
                <?php } ?>    
            </div>
            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                    <ul  class="nav nav-tabs bordered">                     
                        <li  class="<?php echo isset($clickatell) ? 'active':''; ?>"><a href="#tab_clickatell_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('clicktell'); ?> <?php echo $this->lang->line('setting'); ?></a> </li>                          
                        <li  class="<?php echo isset($twilio) ? 'active':''; ?>"><a href="#tab_twilio_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('twilio'); ?> <?php echo $this->lang->line('setting'); ?></a> </li>                          
                        <li  class="<?php echo isset($bulk) ? 'active':''; ?>"><a href="#tab_bulk_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('bulk'); ?> <?php echo $this->lang->line('setting'); ?></a> </li>                          
                        <li  class="<?php echo isset($msg91) ? 'active':''; ?>"><a href="#tab_msg91_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('msg91'); ?> <?php echo $this->lang->line('setting'); ?></a> </li>                          
                        <li  class="<?php echo isset($plivo) ? 'active':''; ?>"><a href="#tab_plivo_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('plivo'); ?> <?php echo $this->lang->line('setting'); ?></a> </li>                          
                        <li  class="<?php echo isset($textlocal) ? 'active':''; ?>"><a href="#tab_textlocal_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('text_local'); ?> <?php echo $this->lang->line('setting'); ?></a> </li>                          
                        <li  class="<?php echo isset($smscountry) ? 'active':''; ?>"><a href="#tab_smscountry_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('sms_country'); ?> <?php echo $this->lang->line('setting'); ?></a> </li>                          
                    </ul>
                    <br/>
                    <div class="tab-content">
               
                        <div class="tab-pane fade in <?php echo isset($clickatell) ? 'active':''; ?>" id="tab_clickatell_setting">
                            <div class="x_content"> 
                                <?php echo form_open_multipart(site_url('setting/sms/clickatell'), array('name' => 'clickatell', 'id' => 'clickatell', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                <input type="hidden" value="1" name="clickatell" />
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_username"><?php echo $this->lang->line('username'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="clickatell_username" value="<?php echo isset($setting) ? $setting->clickatell_username : ''; ?>"  placeholder="<?php echo $this->lang->line('username'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('clickatell_username'); ?></div>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_password"><?php echo $this->lang->line('password'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="clickatell_password" value="<?php echo isset($setting) ? $setting->clickatell_password : ''; ?>"  placeholder="<?php echo $this->lang->line('password'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('clickatell_password'); ?></div>
                                    </div>
                                </div>                  
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_api_key"><?php echo $this->lang->line('api_key'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="clickatell_api_key" value="<?php echo isset($setting) ? $setting->clickatell_api_key : ''; ?>"  placeholder="<?php echo $this->lang->line('api_key'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('clickatell_api_key'); ?></div>
                                    </div>
                                </div>       
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_from_number"><?php echo $this->lang->line('from_number'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="clickatell_from_number" value="<?php echo isset($setting) ? $setting->clickatell_from_number : ''; ?>"  placeholder="<?php echo $this->lang->line('from_number'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('clickatell_from_number'); ?></div>
                                    </div>
                                </div>       
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_mo_no"><?php echo $this->lang->line('clickatell_mo_no'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="clickatell_mo_no" value="<?php echo isset($setting) ? $setting->clickatell_mo_no : ''; ?>"  placeholder="<?php echo $this->lang->line('clickatell_mo_no'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('clickatell_mo_no'); ?></div>
                                    </div>
                                </div>       
                        
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="clickatell_status"><?php echo $this->lang->line('is_active'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="clickatell_status" required="required">
                                            <option value="1" <?php if(isset($setting) && $setting->clickatell_status == '1'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                            <option value="0" <?php if(isset($setting) && $setting->clickatell_status == '0'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                        </select>
                                        <div class="help-block"><?php echo form_error('clickatell_status'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <a href="https://www.clickatell.com/" target="_blank"><img src="<?php echo IMG_URL; ?>clickatell-sms.png" alt="" /></a> 
                                    </div>
                                </div>
                          
                         
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ? $this->lang->line('update') : $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div> 
                        
                          <div class="tab-pane fade in <?php echo isset($twilio) ? 'active':''; ?>" id="tab_twilio_setting">
                             <div class="x_content"> 
                                <?php echo form_open_multipart(site_url('setting/sms/twilio'), array('name' => 'twilio', 'id' => 'twilio', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                <input type="hidden" value="1" name="twilio" />
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_account_sid"><?php echo $this->lang->line('account_sid'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="twilio_account_sid" value="<?php echo isset($setting) ? $setting->twilio_account_sid : ''; ?>"  placeholder="twilio_account_sid" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('twilio_account_sid'); ?></div>
                                    </div>
                                </div>                                               
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_auth_token"><?php echo $this->lang->line('auth_token'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="twilio_auth_token" value="<?php echo isset($setting) ? $setting->twilio_auth_token : ''; ?>"  placeholder="twilio_auth_token" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('twilio_auth_token'); ?></div>
                                    </div>
                                </div>                                               
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_from_number"><?php echo $this->lang->line('from_number'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="twilio_from_number" value="<?php echo isset($setting) ? $setting->twilio_from_number : ''; ?>"  placeholder="twilio_from_number" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('twilio_from_number'); ?></div>
                                    </div>
                                </div>                                               
                       
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="twilio_status"><?php echo $this->lang->line('is_active'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="twilio_status" required="required">
                                            <option value="1" <?php if(isset($setting) && $setting->twilio_status == '1'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                            <option value="0" <?php if(isset($setting) && $setting->twilio_status == '0'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                        </select>
                                        <div class="help-block"><?php echo form_error('twilio_status'); ?></div>
                                    </div>
                                </div>
                          
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <a href="https://www.twilio.com" target="_blank"><img src="<?php echo IMG_URL; ?>twilio-sms.png" alt="" /></a> 
                                    </div>
                                </div>
                                
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ?  $this->lang->line('update') : $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div> 
                        
                        <div class="tab-pane fade in <?php echo isset($bulk) ? 'active':''; ?>" id="tab_bulk_setting">
                            <div class="x_content"> 
                                <?php echo form_open_multipart(site_url('setting/sms/bulk'), array('name' => 'bulk', 'id' => 'bulk', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                 <input type="hidden" value="1" name="bulk" />
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bulk_username"><?php echo $this->lang->line('username'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="bulk_username" value="<?php echo isset($setting) ? $setting->bulk_username : ''; ?>"  placeholder="<?php echo $this->lang->line('username'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('bulk_username'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bulk_password"><?php echo $this->lang->line('password'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="bulk_password" value="<?php echo isset($setting) ? $setting->bulk_password : ''; ?>"  placeholder="<?php echo $this->lang->line('password'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('bulk_password'); ?></div>
                                    </div>
                                </div>                  
                        
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="bulk_status"><?php echo $this->lang->line('is_active'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="bulk_status">
                                            <option value="1" <?php if(isset($setting) && $setting->bulk_status == '1'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                            <option value="0" <?php if(isset($setting) && $setting->bulk_status == '0'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                        </select>
                                        <div class="help-block"><?php echo form_error('bulk_status'); ?></div>
                                    </div>
                                </div>
                                 
                                 <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <a href="https://www.bulksms.com/" target="_blank"><img src="<?php echo IMG_URL; ?>bulk-sms.png" alt="" /></a> 
                                    </div>
                                </div>
                                 
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ? $this->lang->line('update') : $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div> 
                        
                        <div class="tab-pane fade in <?php echo isset($msg91) ? 'active':''; ?>" id="tab_msg91_setting">
                            <div class="x_content"> 
                                <?php echo form_open_multipart(site_url('setting/sms/msg91'), array('name' => 'msg91', 'id' => 'msg91', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                 <input type="hidden" value="1" name="msg91" />
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="msg91_auth_key"><?php echo $this->lang->line('auth_key'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="msg91_auth_key" value="<?php echo isset($setting) ? $setting->msg91_auth_key : ''; ?>"  placeholder="<?php echo $this->lang->line('auth_key'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('msg91_auth_key'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="msg91_sender_id"><?php echo $this->lang->line('sender_id'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="msg91_sender_id" value="<?php echo isset($setting) ? $setting->msg91_sender_id : ''; ?>"  placeholder="<?php echo $this->lang->line('sender_id'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('msg91_sender_id'); ?></div>
                                    </div>
                                </div>                  
             
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="msg91_status"><?php echo $this->lang->line('is_active'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="msg91_status" required="required">
                                            <option value="1" <?php if(isset($setting) && $setting->msg91_status == '1'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                            <option value="0" <?php if(isset($setting) && $setting->msg91_status == '0'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                        </select>
                                        <div class="help-block"><?php echo form_error('msg91_status'); ?></div>
                                    </div>
                                </div>
                          
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <a href="https://msg91.com/" target="_blank"><img src="<?php echo IMG_URL; ?>msg91-sms.png" alt="" /></a> 
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ?  $this->lang->line('update'): $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div> 
                        
                        <div class="tab-pane fade in <?php echo isset($plivo) ? 'active':''; ?>" id="tab_plivo_setting">
                            <div class="x_content"> 
                                <?php echo form_open_multipart(site_url('setting/sms/plivo'), array('name' => 'plivo', 'id' => 'plivo', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                 <input type="hidden" value="1" name="plivo" />
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="plivo_auth_id"><?php echo $this->lang->line('auth_id'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="plivo_auth_id" value="<?php echo isset($setting) ? $setting->plivo_auth_id : ''; ?>"  placeholder="<?php echo $this->lang->line('auth_id'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('plivo_auth_id'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="plivo_auth_token"><?php echo $this->lang->line('auth_token'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="plivo_auth_token" value="<?php echo isset($setting) ? $setting->plivo_auth_token : ''; ?>"  placeholder="<?php echo $this->lang->line('auth_token'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('plivo_auth_token'); ?></div>
                                    </div>
                                </div>  
                                 
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="plivo_from_number"><?php echo $this->lang->line('from_number'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="plivo_from_number" value="<?php echo isset($setting) ? $setting->plivo_from_number : ''; ?>"  placeholder="<?php echo $this->lang->line('from_number'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('plivo_from_number'); ?></div>
                                    </div>
                                </div>                  
                     
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="plivo_status"><?php echo $this->lang->line('is_active'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="plivo_status" required="required">
                                            <option value="1" <?php if(isset($setting) && $setting->plivo_status == '1'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                            <option value="0" <?php if(isset($setting) && $setting->plivo_status == '0'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                        </select>
                                        <div class="help-block"><?php echo form_error('plivo_status'); ?></div>
                                    </div>
                                </div>
                          
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <a href="https://www.plivo.com/" target="_blank"><img src="<?php echo IMG_URL; ?>plivo-sms.png" alt="" /></a> 
                                    </div>
                                </div>
                         
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ?  $this->lang->line('update') :  $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div> 
                        
                        <div class="tab-pane fade in <?php echo isset($textlocal) ? 'active':''; ?>" id="tab_textlocal_setting">
                            <div class="x_content"> 
                                <?php echo form_open_multipart(site_url('setting/sms/textlocal'), array('name' => 'textlocal', 'id' => 'textlocal', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                 <input type="hidden" value="1" name="textlocal" />
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textlocal_username"><?php echo $this->lang->line('username'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="textlocal_username" value="<?php echo isset($setting) ? $setting->textlocal_username : ''; ?>"  placeholder="<?php echo $this->lang->line('username'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('textlocal_username'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textlocal_hash_key"><?php echo $this->lang->line('hash_key'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="textlocal_hash_key" value="<?php echo isset($setting) ? $setting->textlocal_hash_key : ''; ?>"  placeholder="<?php echo $this->lang->line('hash_key'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('textlocal_hash_key'); ?></div>
                                    </div>
                                </div>  
                                 
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textlocal_sender_id"><?php echo $this->lang->line('sender_id'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="textlocal_sender_id" value="<?php echo isset($setting) ? $setting->textlocal_sender_id : ''; ?>"  placeholder="<?php echo $this->lang->line('sender_id'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('textlocal_sender_id'); ?></div>
                                    </div>
                                </div>                  
                     
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textlocal_status"><?php echo $this->lang->line('is_active'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="textlocal_status" required="required">
                                            <option value="1" <?php if(isset($setting) && $setting->textlocal_status == '1'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                            <option value="0" <?php if(isset($setting) && $setting->textlocal_status == '0'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                        </select>
                                        <div class="help-block"><?php echo form_error('textlocal_status'); ?></div>
                                    </div>
                                </div>
                          
                                 <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <a href="https://www.textlocal.com/" target="_blank"><img src="<?php echo IMG_URL; ?>textlocal-sms.png" alt="" /></a> 
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ?  $this->lang->line('update') :  $this->lang->line('submit'); ?></button>
                                    </div>
                                </div>
                                <?php echo form_close(); ?>
                            </div>
                        </div> 
                        
                        <div class="tab-pane fade in <?php echo isset($smscountry) ? 'active':''; ?>" id="tab_smscountry_setting">
                            <div class="x_content"> 
                                <?php echo form_open_multipart(site_url('setting/sms/smscountry'), array('name' => 'smscountry', 'id' => 'smscountry', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                 <input type="hidden" value="1" name="smscountry" />
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="smscountry_username"><?php echo $this->lang->line('username'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="smscountry_username" value="<?php echo isset($setting) ? $setting->smscountry_username : ''; ?>"  placeholder="<?php echo $this->lang->line('username'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('smscountry_username'); ?></div>
                                    </div>
                                </div>
                                
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="smscountry_password"><?php echo $this->lang->line('password'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="smscountry_password" value="<?php echo isset($setting) ? $setting->smscountry_password : ''; ?>"  placeholder="<?php echo $this->lang->line('password'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('smscountry_password'); ?></div>
                                    </div>
                                </div>  
                                 
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="smscountry_sender_id"><?php echo $this->lang->line('sender_id'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input  class="form-control col-md-7 col-xs-12"  name="smscountry_sender_id" value="<?php echo isset($setting) ? $setting->smscountry_sender_id : ''; ?>"  placeholder="<?php echo $this->lang->line('sender_id'); ?>" required="required" type="text">
                                        <div class="help-block"><?php echo form_error('smscountry_sender_id'); ?></div>
                                    </div>
                                </div>                  
                     
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="smscountry_status"><?php echo $this->lang->line('is_active'); ?> <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select  class="form-control col-md-7 col-xs-12"  name="smscountry_status" required="required">
                                            <option value="1" <?php if(isset($setting) && $setting->smscountry_status == '1'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                            <option value="0" <?php if(isset($setting) && $setting->smscountry_status == '0'){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                        </select>
                                        <div class="help-block"><?php echo form_error('smscountry_status'); ?></div>
                                    </div>
                                </div>
                          
                               <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">&nbsp;</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <a href="https://www.smscountry.com/" target="_blank"><img src="<?php echo IMG_URL; ?>country-sms.png" alt="" /></a> 
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php echo isset($setting) ?  $this->lang->line('update') :  $this->lang->line('submit'); ?></button>
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
<script type="text/javascript">
    $("#clickatell").validate();  
    $("#twilio").validate();  
    $("#bulk").validate();  
    $("#msg91").validate();  
    $("#plivo").validate();  
</script>