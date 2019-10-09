<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-gears "></i><small> <?php echo $this->lang->line('general'); ?> <?php echo $this->lang->line('setting'); ?></small></h3>
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
                   | <a href="<?php echo site_url('frontend/index'); ?>"><?php echo $this->lang->line('manage_frontend'); ?> </a>                    
                <?php } ?>
            </div>
            
            
             <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                     <ul  class="nav nav-tabs bordered">                     
                        <li  class="active"><a href="#tab_setting"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo $this->lang->line('general'); ?> <?php echo $this->lang->line('setting'); ?></a> </li> 
                     </ul>
                     <br/>
                     <div class="tab-content">
                         <div class="tab-pane fade in active"id="tab_setting">
                            <div class="x_content"> 
                                <?php $action = isset($setting) ? 'edit' : 'add'; ?>
                                <?php echo form_open_multipart(site_url('setting/'. $action), array('name' => 'setting', 'id' => 'setting', 'class'=>'form-horizontal form-label-left'), ''); ?>
                                <input type="hidden" value="<?php echo isset($setting) ? $setting->id : ''; ?>" name="id" />
                                
                                <div class="row">                  
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5  class="column-title"><strong><?php echo $this->lang->line('basic'); ?> <?php echo $this->lang->line('information'); ?>:</strong></h5>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="school_code"><?php echo $this->lang->line('school_code'); ?></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="school_code"  id="school_code" value="<?php echo isset($setting) ? $setting->school_code : ''; ?>" placeholder="<?php echo $this->lang->line('school_code'); ?> "  type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('school_code'); ?></div> 
                                        </div>
                                    </div>
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="school_name"><?php echo $this->lang->line('school'); ?> <?php echo $this->lang->line('name'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="school_name"  id="school_name" value="<?php echo isset($setting) ? $setting->school_name : ''; ?>" placeholder="<?php echo $this->lang->line('school'); ?> <?php echo $this->lang->line('name'); ?>" required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('school_name'); ?></div> 
                                        </div>
                                    </div>
                                      <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="address"><?php echo $this->lang->line('address'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="address"  id="address" value="<?php echo isset($setting) ? $setting->address : ''; ?>" placeholder="<?php echo $this->lang->line('address'); ?> " required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('address'); ?></div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="phone"><?php echo $this->lang->line('phone'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="phone"  id="phone" value="<?php echo isset($setting) ? $setting->phone : ''; ?>" placeholder="<?php echo $this->lang->line('phone'); ?> " required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('phone'); ?></div> 
                                        </div>
                                    </div>
                                    
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="registration_date"><?php echo $this->lang->line('registration'); ?> <?php echo $this->lang->line('date'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="registration_date"  id="registration_date" value="<?php echo isset($setting) ? date('d-m-Y', strtotime($setting->registration_date)) : ''; ?>" placeholder="<?php echo $this->lang->line('registration'); ?> <?php echo $this->lang->line('date'); ?> " required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('registration_date'); ?></div> 
                                        </div>
                                    </div>
                                    
                                     
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="email"><?php echo $this->lang->line('email'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="email"  id="email" value="<?php echo isset($setting) ? $setting->email : ''; ?>" placeholder="<?php echo $this->lang->line('email'); ?> " required="required" type="email" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('email'); ?></div> 
                                        </div>
                                    </div>
                                    
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="school_fax"><?php echo $this->lang->line('school_fax'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="school_fax"  id="school_fax" value="<?php echo isset($setting) ? $setting->school_fax : ''; ?>" placeholder="<?php echo $this->lang->line('school_fax'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('school_fax'); ?></div> 
                                        </div>
                                    </div>
                                    
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="footer"><?php echo $this->lang->line('footer'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="footer"  id="footer" value="<?php echo isset($setting) ? $setting->footer : ''; ?>" placeholder="<?php echo $this->lang->line('footer'); ?> " required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('footer'); ?></div> 
                                        </div>
                                    </div>                                    
                                </div>
                                
                                
                                  
                                <div class="row">                  
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5  class="column-title"><strong><?php echo $this->lang->line('setting'); ?> <?php echo $this->lang->line('information'); ?>:</strong></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="currency"><?php echo $this->lang->line('currency'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="currency"  id="currency" value="<?php echo isset($setting) ? $setting->currency : ''; ?>" placeholder="<?php echo $this->lang->line('currency'); ?> " required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('currency'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="currency_symbol"><?php echo $this->lang->line('currency_symbol'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="currency_symbol"  id="currency_symbol" value="<?php echo isset($setting) ? $setting->currency_symbol : ''; ?>" placeholder="<?php echo $this->lang->line('currency_symbol'); ?> " required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('currency_symbol'); ?></div> 
                                        </div>
                                    </div>
                                      <?php $months = get_months(); ?>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="session_start_month"><?php echo $this->lang->line('session_start_month'); ?> <span class="required">*</span></label>
                                            <select  class="form-control col-md-7 col-xs-12"  name="session_start_month" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php foreach($months as $key=>$value){ ?>
                                                    <option value="<?php echo $key; ?>" <?php if(isset($setting) && $setting->session_start_month == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block"><?php echo form_error('session_start_month'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="session_end_month"><?php echo $this->lang->line('session_end_month'); ?> <span class="required">*</span></label>
                                            <select  class="form-control col-md-7 col-xs-12"  name="session_end_month" >
                                            <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php foreach($months as $key=>$value){ ?>
                                                    <option value="<?php echo $key; ?>" <?php if(isset($setting) && $setting->session_end_month == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block"><?php echo form_error('session_end_month'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="enable_frontend"><?php echo $this->lang->line('enable_frontend'); ?> <span class="required">*</span></label>
                                            <select  class="form-control col-md-7 col-xs-12"  name="enable_frontend" required="required">
                                                <option value="1" <?php if(isset($setting) && $setting->enable_frontend == 1){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?></option>
                                                <option value="0" <?php if(isset($setting) && $setting->enable_frontend == 0){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?></option>
                                            </select>
                                            <div class="help-block"><?php echo form_error('enable_frontend'); ?></div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="final_result_type"><?php echo $this->lang->line('exam_final_result'); ?> <span class="required">*</span></label>
                                            <select  class="form-control col-md-7 col-xs-12"  name="final_result_type" required="required">
                                                <option value="0" <?php if(isset($setting) && $setting->final_result_type == 0){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('avg_of_all_exam'); ?> </option>
                                                <option value="1" <?php if(isset($setting) && $setting->final_result_type == 1){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('only_of_fianl_exam'); ?> </option>
                                            </select>
                                            <div class="help-block"><?php echo form_error('final_result_type'); ?></div> 
                                        </div>
                                    </div>                                     
                                    
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="language"><?php echo $this->lang->line('language'); ?> <span class="required">*</span></label>
                                             <select  class="form-control col-md-7 col-xs-12"  name="language"  required="required">
                                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php foreach($fields as $field){ ?>
                                                    <?php  if($field == 'id' || $field == 'label'){ continue; } ?>
                                                <option value="<?php echo $field; ?>" <?php if(isset($setting) && $setting->language == $field){ echo 'selected="selected"';} ?>><?php echo ucfirst($field); ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block"><?php echo form_error('language'); ?></div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="purchase_code"><?php echo $this->lang->line('purchase_code'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="purchase_code"  id="school_lng" value="<?php echo isset($purchase) ? $purchase->purchase_code : ''; ?>" placeholder="<?php echo $this->lang->line('purchase_code'); ?> "  type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('purchase_code'); ?></div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="enable_rtl"><?php echo $this->lang->line('enable_rtl'); ?> <span class="required">*</span></label>
                                            <select  class="form-control col-md-7 col-xs-12"  name="enable_rtl" required="required">
                                                <option value="0" <?php if(isset($setting) && $setting->enable_rtl == 0){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('no'); ?> </option>
                                                <option value="1" <?php if(isset($setting) && $setting->enable_rtl == 1){ echo 'selected="selected"';} ?>><?php echo $this->lang->line('yes'); ?> </option>
                                            </select>
                                            <div class="help-block"><?php echo form_error('enable_rtl'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="running_year"><?php echo $this->lang->line('running_year'); ?> <span class="required">*</span></label>
                                            <select  class="form-control col-md-7 col-xs-12"  name="running_year" >
                                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php foreach($years as $obj){ ?>
                                                    <option value="<?php echo $obj->session_year; ?>" <?php if(isset($setting) && $setting->running_year == $obj->session_year){ echo 'selected="selected"';} ?>><?php echo $obj->session_year; ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block"><?php echo form_error('running_year'); ?></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="default_time_zone"><?php echo $this->lang->line('default_time_zone'); ?> <span class="required">*</span></label>
                                           <?php $timezones = get_timezones(); ?>
                                            <select  class="form-control col-md-7 col-xs-12"  name="default_time_zone" required="required">
                                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php foreach($timezones as $key=>$value){ ?>
                                                    <option value="<?php echo $key; ?>" <?php if(isset($setting) && $setting->default_time_zone == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?> </option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block"><?php echo form_error('default_time_zone'); ?></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="sms_date_format"><?php echo $this->lang->line('date_format'); ?> <span class="required">*</span></label>
                                                <?php $dates = get_date_format(); ?>
                                              <select  class="form-control col-md-7 col-xs-12"  name="sms_date_format" required="required">
                                                  <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                  <?php foreach($dates as $key=>$value){ ?>
                                                      <option value="<?php echo $key; ?>" <?php if(isset($setting) && $setting->sms_date_format == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?> </option>
                                                  <?php } ?>
                                              </select>
                                              <div class="help-block"><?php echo form_error('sms_date_format'); ?></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="school_lat"><?php echo $this->lang->line('school_lat'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="school_lat"  id="school_lat" value="<?php echo isset($setting) ? $setting->school_lat : ''; ?>" placeholder="<?php echo $this->lang->line('school_lat'); ?> "  type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('school_lat'); ?></div> 
                                        </div>
                                    </div>    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="school_lng"><?php echo $this->lang->line('school_lng'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="school_lng"  id="school_lng" value="<?php echo isset($setting) ? $setting->school_lng : ''; ?>" placeholder="<?php echo $this->lang->line('school_lng'); ?> "  type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('school_lng'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="map_api_key"><?php echo $this->lang->line('api_key'); ?> 
                                                [ <a target="_blank" href="https://developers.google.com/maps/documentation/embed/get-api-key">Get Api Key</a>]
                                            </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="map_api_key"  id="map_api_key" value="<?php echo isset($setting) ? $setting->map_api_key : ''; ?>" placeholder="<?php echo $this->lang->line('api_key'); ?> "  type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('map_api_key'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="google_analytics"><?php echo $this->lang->line('google_analytics'); ?> <?php echo $this->lang->line('code'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="google_analytics"  id="google_analytics" value="<?php echo isset($setting) ? $setting->google_analytics : ''; ?>" placeholder="<?php echo $this->lang->line('google_analytics'); ?>  <?php echo $this->lang->line('code'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('google_analytics'); ?></div> 
                                        </div>
                                    </div>
                                    
                                </div>   
                                                     
                               
                                <div class="row">                  
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5  class="column-title"><strong><?php echo $this->lang->line('social'); ?> <?php echo $this->lang->line('information'); ?>:</strong></h5>
                                    </div>
                                </div>
                                
                                <div class="row">
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="facebook_url"><?php echo $this->lang->line('facebook_url'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="facebook_url"  id="facebook_url" value="<?php echo isset($setting) ? $setting->facebook_url : ''; ?>" placeholder="<?php echo $this->lang->line('facebook_url'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('facebook_url'); ?></div> 
                                        </div>
                                    </div>
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="twitter_url"><?php echo $this->lang->line('twitter_url'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="twitter_url"  id="twitter_url" value="<?php echo isset($setting) ? $setting->twitter_url : ''; ?>" placeholder="<?php echo $this->lang->line('twitter_url'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('twitter_url'); ?></div> 
                                        </div>
                                    </div>
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="linkedin_url"><?php echo $this->lang->line('linkedin_url'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="linkedin_url"  id="linkedin_url" value="<?php echo isset($setting) ? $setting->linkedin_url : ''; ?>" placeholder="<?php echo $this->lang->line('linkedin_url'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('linkedin_url'); ?></div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="google_plus_url"><?php echo $this->lang->line('google_plus_url'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="google_plus_url"  id="google_plus_url" value="<?php echo isset($setting) ? $setting->google_plus_url : ''; ?>" placeholder="<?php echo $this->lang->line('google_plus_url'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('google_plus_url'); ?></div> 
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="youtube_url"><?php echo $this->lang->line('youtube_url'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="youtube_url"  id="youtube_url" value="<?php echo isset($setting) ? $setting->youtube_url : ''; ?>" placeholder="<?php echo $this->lang->line('youtube_url'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('youtube_url'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="instagram_url"><?php echo $this->lang->line('instagram_url'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="instagram_url"  id="instagram_url" value="<?php echo isset($setting) ? $setting->instagram_url : ''; ?>" placeholder="<?php echo $this->lang->line('instagram_url'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('instagram_url'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="pinterest_url"><?php echo $this->lang->line('pinterest_url'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="pinterest_url"  id="pinterest_url" value="<?php echo isset($setting) ? $setting->pinterest_url : ''; ?>" placeholder="<?php echo $this->lang->line('pinterest_url'); ?> " type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('pinterest_url'); ?></div> 
                                        </div>
                                    </div>
                                    
                                </div>
                                
                                 <div class="row">                  
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5  class="column-title"><strong><?php echo $this->lang->line('other'); ?> <?php echo $this->lang->line('information'); ?>:</strong></h5>
                                    </div>
                                </div>
                               <div class="row">                             
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="logo"><?php echo $this->lang->line('logo'); ?> </label>
                                            <div class="btn btn-default btn-file"><i class="fa fa-paperclip"></i> <?php echo $this->lang->line('upload'); ?>
                                                <input  class="form-control col-md-7 col-xs-12"  name="logo" id="logo"  type="file">
                                            </div>
                                            <div class="help-block"><?php echo form_error('logo'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="logo">&nbsp;</label>
                                            <?php if($setting->logo){ ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $setting->logo; ?>" alt="" width="70" style="background: <?php echo $theme->color_code; ?>; padding: 5px;"/><br/><br/>
                                                 <input name="logo_prev" value="<?php echo isset($setting) ? $setting->logo : ''; ?>"  type="hidden">
                                            <?php } ?>
                                        </div>
                                    </div>
                                   
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="front_logo"><?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('logo'); ?></label>
                                            <div class="btn btn-default btn-file"><i class="fa fa-paperclip"></i> <?php echo $this->lang->line('upload'); ?>
                                                <input  class="form-control col-md-7 col-xs-12"  name="front_logo" id="front_logo"  type="file">
                                            </div>
                                            <div class="help-block"><?php echo form_error('front_logo'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="front_logo">&nbsp;</label>
                                            <?php if($setting->front_logo){ ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $setting->front_logo; ?>" alt="" width="70" style="background: <?php echo $theme->color_code; ?>; padding: 5px;"/><br/><br/>
                                                 <input name="front_logo_prev" value="<?php echo isset($setting) ? $setting->front_logo : ''; ?>"  type="hidden">
                                            <?php } ?>
                                        </div>
                                    </div>
                                    
                                </div>   

                                
                                <?php if(empty($years)){ ?>
                                 <div class="item form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12  col-md-offset-3">
                                        <div class="instructions no-margin"><strong><?php echo $this->lang->line('instruction'); ?>: </strong> <?php echo $this->lang->line('create'); ?> <?php echo $this->lang->line('academic_year'); ?></div>
                                    </div>
                                </div>
                                <?php } ?>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('dashboard'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <button id="send" type="submit" class="btn btn-success"><?php  echo $action == 'add' ? $this->lang->line('submit') : $this->lang->line('update'); ?></button>
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

<link href="<?php echo VENDOR_URL; ?>datepicker/datepicker.css" rel="stylesheet">
 <script src="<?php echo VENDOR_URL; ?>datepicker/datepicker.js"></script>
 <script type="text/javascript">
     
  $('#registration_date').datepicker();

    $("#setting").validate();  
</script>