<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h3 class="head-title"><i class="fa fa-lock"></i><small> <?php echo $this->lang->line('my_profile'); ?></small></h3>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                    
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content quick-link">
                <strong> <?php echo $this->lang->line('quick_link'); ?>: </strong>
                <a href="<?php echo site_url('profile'); ?>"><?php echo $this->lang->line('my_profile'); ?></a> |
                <a href="<?php echo site_url('profile/password'); ?>"><?php echo $this->lang->line('reset_password'); ?></a> |
                <a href="<?php echo site_url('auth/logout'); ?>"><?php echo $this->lang->line('logout'); ?></a>                  
            </div>
            <div class="x_content">
                <div class="" data-example-id="togglable-tabs">
                    
                    <ul  class="nav nav-tabs bordered">
                        <li class="<?php if(isset($info)){ echo 'active'; }?>"><a href="#tab_profile"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-eye"></i> <?php echo $this->lang->line('profile'); ?></a> </li>
                        <li  class=""><a href="#tab_parent"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('parent'); ?></a> </li>                          
                        <li  class="<?php if(isset($update)){ echo 'active'; }?>"><a href="#tab_update"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo $this->lang->line('update'); ?></a> </li>                          
                    </ul>
                    <br/>
                    
                    <div class="tab-content">                  

                        <div  class="tab-pane fade in <?php if(isset($info)){ echo 'active'; }?>" id="tab_profile">
                            <div class="x_content">  
                                <div class="col-md-12">
                                    <div class="profile_img">
                                        <?php if($profile->photo){ ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/student-photo/<?php echo $profile->photo; ?>" alt="" width="100" />
                                        <?php }else{ ?>
                                            <img class="" src="<?php echo IMG_URL; ?>default-user.png" width="100" alt="Avatar" title="Change the avatar">
                                        <?php } ?>
                                        <h3><?php echo $profile->name; ?></h3><br/>
                                      </div>
                                  </div>
                                
                                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <th width="18%"><?php echo $this->lang->line('name'); ?></th>
                                            <td width="32%"><?php echo $profile->name; ?></td>
                                            <th width="18%"><?php echo $this->lang->line('group'); ?></th>
                                            <td width="32%"><?php echo $this->lang->line($profile->group); ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('admission_no'); ?></th>
                                            <td><?php echo $profile->admission_no; ?></td>
                                            <th><?php echo $this->lang->line('admission'); ?> <?php echo $this->lang->line('date'); ?></th>
                                            <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($profile->admission_date)); ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('guardian'); ?></th>
                                            <td><?php echo $profile->guardian; ?></td>
                                            <th><?php echo $this->lang->line('relation_with'); ?></th>
                                            <td><?php echo $this->lang->line($profile->relation_with); ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('email'); ?></th>
                                            <td><?php echo $profile->email; ?></td>
                                            <th><?php echo $this->lang->line('phone'); ?></th>
                                            <td><?php echo $profile->phone; ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('present'); ?> <?php echo $this->lang->line('address'); ?></th>
                                            <td><?php echo $profile->present_address; ?></td>
                                            <th><?php echo $this->lang->line('permanent'); ?> <?php echo $this->lang->line('address'); ?></th>
                                            <td><?php echo $profile->permanent_address; ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('gender'); ?></th>
                                            <td><?php echo $this->lang->line($profile->gender); ?></td>
                                            <th><?php echo $this->lang->line('blood_group'); ?></th>
                                            <td><?php echo $this->lang->line($profile->blood_group); ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('religion'); ?></th>
                                            <td><?php echo $profile->religion; ?></td>
                                            <th><?php echo $this->lang->line('birth_date'); ?></th>
                                            <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($profile->dob)); ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('registration_no'); ?></th>
                                            <td><?php echo $profile->registration_no; ?></td>
                                            <th><?php echo $this->lang->line('national_id'); ?></th>
                                            <td><?php echo $profile->national_id; ?></td>
                                        </tr>                                                                                
                                        <tr>
                                            <th><?php echo $this->lang->line('library'); ?> <?php echo $this->lang->line('member'); ?></th>
                                            <td><?php echo $profile->is_library_member ?  $this->lang->line('yes') : $this->lang->line('no'); ?></td>
                                            <th><?php echo $this->lang->line('hostel'); ?> <?php echo $this->lang->line('member'); ?></th>
                                            <td><?php echo $profile->is_hostel_member ? $this->lang->line('yes') : $this->lang->line('no'); ?></td>
                                        </tr>                                                                        
                                        <tr>
                                            <th><?php echo $this->lang->line('transport'); ?> <?php echo $this->lang->line('member'); ?></th>
                                            <td><?php echo $profile->is_transport_member ? $this->lang->line('yes') : $this->lang->line('no'); ?></td>
                                            <th><?php echo $this->lang->line('discount'); ?> (%)</th>
                                            <td><?php echo $profile->discount; ?></td>
                                        </tr>  
                                        <tr>
                                            <th><?php echo $this->lang->line('discount'); ?></th>
                                            <td><?php echo $profile->discount; ?></td>
                                            <th><?php echo $this->lang->line('second'); ?> <?php echo $this->lang->line('language'); ?></th>
                                            <td><?php echo $profile->second_language; ?></td>
                                        </tr>  
                                        <tr>
                                            <th><?php echo $this->lang->line('class'); ?></th>
                                            <td><?php echo $profile->class_name; ?></td>
                                            <th><?php echo $this->lang->line('section'); ?></th>
                                            <td><?php echo $profile->section; ?></td>
                                        </tr>  
                                        <tr>
                                            <th><?php echo $this->lang->line('roll_no'); ?></th>
                                            <td><?php echo $profile->roll_no; ?></td>
                                            <th><?php echo $this->lang->line('previous'); ?> <?php echo $this->lang->line('school'); ?></th>
                                            <td><?php echo $profile->previous_school; ?></td>
                                        </tr> 
                                         
                                        <tr>
                                            <th><?php echo $this->lang->line('health_condition'); ?></th>
                                            <td><?php echo $profile->health_condition; ?></td>
                                            <th><?php echo $this->lang->line('other_info'); ?></th>
                                            <td><?php echo $profile->other_info; ?></td>
                                        </tr>  
                                        <tr>
                                            <th><?php echo $this->lang->line('created'); ?></th>
                                            <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($profile->created_at)); ?></td>
                                            <th><?php echo $this->lang->line('modified'); ?></th>
                                            <td><?php echo date($this->gsms_setting->sms_date_format, strtotime($profile->modified_at)); ?></td>
                                        </tr>                                                                        
                                        
                                    </tbody> 
                                </table> 
                            </div>
                        </div>  
                        
                        <div  class="tab-pane fade in " id="tab_parent">
                            <div class="x_content"> 
                                
                                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                                    <tbody>                                       
                                        <tr>
                                            <th width="18%"><?php echo $this->lang->line('father'); ?> <?php echo $this->lang->line('name'); ?></th>
                                            <td width="32%"><?php echo $profile->father_name; ?></td>
                                            <th width="18%"><?php echo $this->lang->line('mother'); ?> <?php echo $this->lang->line('name'); ?></th>
                                            <td width="32%"><?php echo $profile->mother_name; ?></td>
                                        </tr>  
                                        <tr>
                                            
                                            <th><?php echo $this->lang->line('father'); ?> <?php echo $this->lang->line('phone'); ?></th>
                                            <td><?php echo $profile->father_phone; ?></td>
                                             <th><?php echo $this->lang->line('mother'); ?> <?php echo $this->lang->line('phone'); ?></th>
                                            <td><?php echo $profile->mother_phone; ?></td>
                                        </tr>
                                        
                                         <tr>
                                            <th><?php echo $this->lang->line('father'); ?> <?php echo $this->lang->line('education'); ?></th>
                                            <td><?php echo $profile->father_education; ?></td>
                                            <th><?php echo $this->lang->line('mother'); ?> <?php echo $this->lang->line('education'); ?></th>
                                            <td><?php echo $profile->mother_education; ?></td>
                                        </tr> 
                                        
                                        <tr>                                           
                                            <th><?php echo $this->lang->line('father'); ?> <?php echo $this->lang->line('profession'); ?></th>
                                            <td><?php echo $profile->father_profession; ?></td>
                                            <th><?php echo $this->lang->line('mother'); ?> <?php echo $this->lang->line('profession'); ?></th>
                                            <td><?php echo $profile->mother_profession; ?></td>
                                        </tr>  
                                         <tr>
                                            <th><?php echo $this->lang->line('father'); ?> <?php echo $this->lang->line('designation'); ?></th>
                                            <td><?php echo $profile->father_designation; ?></td>
                                             <th><?php echo $this->lang->line('mother'); ?> <?php echo $this->lang->line('designation'); ?></th>
                                            <td><?php echo $profile->mother_designation; ?></td>
                                        </tr> 
                                        
                                        <tr>                                           
                                            <th><?php echo $this->lang->line('father'); ?> <?php echo $this->lang->line('photo'); ?></th>
                                            <td>
                                                <?php if($profile->father_photo){ ?>
                                                <img src="<?php echo UPLOAD_PATH; ?>/father-photo/<?php echo $profile->father_photo; ?>" alt="" width="70" /><br/><br/>
                                                <?php } ?>
                                            </td>
                                             <th><?php echo $this->lang->line('mother'); ?> <?php echo $this->lang->line('photo'); ?></th>
                                            <td>
                                                <?php if($profile->mother_photo){ ?>
                                                <img src="<?php echo UPLOAD_PATH; ?>/mother-photo/<?php echo $profile->mother_photo; ?>" alt="" width="70" /><br/><br/>
                                                <?php } ?>
                                            </td>
                                        </tr>                                                                
                                        
                                    </tbody> 
                                </table> 
                            </div>
                        </div>  

                       
                        <div class="tab-pane fade in" id="tab_update">
                           <div class="x_content"> 
                            <?php echo form_open_multipart(site_url('profile/update/'. $profile->id), array('name' => 'profile', 'id' => 'profile', 'class'=>'form-horizontal form-label-left'), ''); ?>
                               
                                
                                <div class="row">                  
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5  class="column-title"><strong><?php echo $this->lang->line('basic'); ?> <?php echo $this->lang->line('information'); ?>:</strong></h5>
                                    </div>
                                </div>
                               
                               <div class="row">                  
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="name"><?php echo $this->lang->line('name'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="name"  id="name" value="<?php echo isset($profile->name) ?  $profile->name : ''; ?>" placeholder="<?php echo $this->lang->line('name'); ?>" required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('name'); ?></div> 
                                        </div>
                                    </div>
                                   <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="admission_no"><?php echo $this->lang->line('admission_no'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="admission_no"  id="admission_no" value="<?php echo isset($profile->admission_no) ?  $profile->admission_no : ''; ?>" placeholder="<?php echo $this->lang->line('admission_no'); ?>" readonly="readonly" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('admission_no'); ?></div> 
                                        </div>
                                    </div>
                                   <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="admission_date"><?php echo $this->lang->line('admission'); ?> <?php echo $this->lang->line('date'); ?><span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="admission_date"  id="edit_admission_date" value="<?php echo isset($profile->admission_date) ?   date('d-m-Y', strtotime($profile->admission_date)) : ''; ?>" placeholder="<?php echo $this->lang->line('admission'); ?> <?php echo $this->lang->line('date'); ?>" readonly="readonly" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('admission_date'); ?></div> 
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                            <label  for="dob"><?php echo $this->lang->line('birth_date'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="dob"  id="dob" value="<?php echo isset($profile->dob) ?  date('d-m-Y', strtotime($profile->dob)) : ''; ?>" placeholder="<?php echo $this->lang->line('birth_date'); ?>" required="required" type="text" autocomplete="off">
                                            <div class="help-block"><?php echo form_error('dob'); ?></div>
                                         </div>
                                    </div>
                                    
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                             <label for="gender"><?php echo $this->lang->line('gender'); ?> <span class="required">*</span></label>
                                              <select  class="form-control col-md-7 col-xs-12"  name="gender"  id="gender" required="required">
                                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php $genders = get_genders(); ?>
                                                <?php foreach($genders as $key=>$value){ ?>
                                                    <option value="<?php echo $key; ?>" <?php if($profile->gender == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block"><?php echo form_error('gender'); ?></div>
                                         </div>
                                     </div>
                                    
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                             <label for="blood_group"><?php echo $this->lang->line('blood_group'); ?></label>
                                              <select  class="form-control col-md-7 col-xs-12" name="blood_group" id="blood_group">
                                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php $bloods = get_blood_group(); ?>
                                                <?php foreach($bloods as $key=>$value){ ?>
                                                    <option value="<?php echo $key; ?>" <?php if($profile->blood_group == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                                <?php } ?>
                                                </select>
                                            <div class="help-block"><?php echo form_error('blood_group'); ?></div>
                                         </div>
                                     </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                              <label for="religion"><?php echo $this->lang->line('religion'); ?></label>
                                              <input  class="form-control col-md-7 col-xs-12"  name="religion"  id="add_religion" value="<?php echo isset($profile->religion) ?  $profile->religion : ''; ?>" placeholder="<?php echo $this->lang->line('religion'); ?>" type="text">
                                               <div class="help-block"><?php echo form_error('religion'); ?></div>
                                         </div>
                                     </div>
                                   
                               </div>
                               
                                <div class="row">                  
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5  class="column-title"><strong><?php echo $this->lang->line('contact'); ?> <?php echo $this->lang->line('information'); ?>:</strong></h5>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="guardian_id"><?php echo $this->lang->line('guardian'); ?> </label>
                                            <select  class="form-control col-md-7 col-xs-12 quick-field" name="guardian_id" id="guardian_id" disabled="disabled">
                                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php foreach($guardians as $obj){ ?>
                                                    <option value="<?php echo $obj->id; ?>" <?php if($profile->guardian_id == $obj->id){ echo 'selected="selected"';} ?>><?php echo $obj->name; ?></option>
                                                <?php } ?>
                                            </select>
                                            <a href="<?php echo site_url('guardian/add'); ?>" class="btn btn-success btn-md quick-add">+</a>
                                            <div class="help-block"><?php echo form_error('guardian_id'); ?></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label for="relation_with"><?php echo $this->lang->line('relation_with'); ?> </label>
                                            <select  class="form-control col-md-7 col-xs-12" name="relation_with" id="guardian_id" >
                                                <option value="">--<?php echo $this->lang->line('select'); ?>--</option>
                                                <?php $relation_types = get_relation_types(); ?>
                                                <?php foreach($relation_types as $key=>$value){ ?>
                                                    <option value="<?php echo $key; ?>" <?php if($profile->relation_with == $key){ echo 'selected="selected"';} ?>><?php echo $value; ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block"><?php echo form_error('relation_with'); ?></div>
                                        </div>
                                    </div>
                                    
                                     
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                             <label for="phone"><?php echo $this->lang->line('phone'); ?> <span class="required">*</span></label>
                                             <input  class="form-control col-md-7 col-xs-12"  name="phone"  id="add_phone" value="<?php echo isset($profile->phone) ?  $profile->phone : ''; ?>" placeholder="<?php echo $this->lang->line('phone'); ?>" required="required" type="text">
                                             <div class="help-block"><?php echo form_error('phone'); ?></div>
                                         </div>
                                     </div>
                                    
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                             <label for="national_id"><?php echo $this->lang->line('national_id'); ?> </label>
                                             <input  class="form-control col-md-7 col-xs-12"  name="national_id"  id="national_id" value="<?php echo isset($profile->national_id) ?  $profile->national_id : ''; ?>" placeholder="<?php echo $this->lang->line('national_id'); ?>" type="text" autocomplete="off">
                                             <div class="help-block"><?php echo form_error('national_id'); ?></div>
                                         </div>
                                     </div>
                                    
                                     <div class="col-md-6 col-sm-6 col-xs-12">
                                         <div class="item form-group">
                                             <label for="present_address"><?php echo $this->lang->line('present'); ?> <?php echo $this->lang->line('address'); ?> </label>
                                              <textarea  class="form-control col-md-7 col-xs-12 textarea-4column"  name="present_address"  id="add_present_address"  placeholder="<?php echo $this->lang->line('present'); ?> <?php echo $this->lang->line('address'); ?>"><?php echo isset($profile->present_address) ?  $profile->present_address : ''; ?></textarea>
                                              <div class="help-block"><?php echo form_error('present_address'); ?></div>
                                         </div>
                                     </div>                                    
                                     <div class="col-md-6 col-sm-6 col-xs-12">
                                         <div class="item form-group">
                                            <label for="permanent_address"><?php echo $this->lang->line('permanent'); ?> <?php echo $this->lang->line('address'); ?></label>
                                            <textarea  class="form-control col-md-7 col-xs-12 textarea-4column"  name="permanent_address"  id="add_permanent_address"  placeholder="<?php echo $this->lang->line('permanent'); ?> <?php echo $this->lang->line('address'); ?>"><?php echo isset($profile->permanent_address) ?  $profile->permanent_address : ''; ?></textarea>
                                            <div class="help-block"><?php echo form_error('permanent_address'); ?></div>
                                         </div>
                                     </div>
                                    
                                </div>
                         
                                <div class="row">                  
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <h5 class="column-title"><strong><?php echo $this->lang->line('other'); ?> <?php echo $this->lang->line('information'); ?>:</strong></h5>
                                    </div>
                                </div>    
                                <div class="row">   
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                            <label for="email"><?php echo $this->lang->line('email'); ?> <span class="required">*</span></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="email"  readonly="readonly"  id="email" value="<?php echo isset($profile->email) ?  $profile->email : ''; ?>" placeholder="<?php echo $this->lang->line('email'); ?>" required="email" type="email">
                                            <div class="help-block"><?php echo form_error('email'); ?></div>
                                         </div>
                                     </div>
                                     <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                            <label for="health_condition"><?php echo $this->lang->line('health_condition'); ?> </label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="health_condition"  id="health_condition" value="<?php echo isset($profile->health_condition) ?  $profile->health_condition : ''; ?>" placeholder="<?php echo $this->lang->line('health_condition'); ?>" type="text">
                                            <div class="help-block"><?php echo form_error('health_condition'); ?></div>
                                         </div>
                                     </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                            <label for="second_language"><?php echo $this->lang->line('second'); ?> <?php echo $this->lang->line('language'); ?></label>
                                            <input  class="form-control col-md-7 col-xs-12"  name="second_language"  id="second_language" value="<?php echo isset($profile->second_language) ?  $profile->second_language : ''; ?>" placeholder="<?php echo $this->lang->line('second'); ?> <?php echo $this->lang->line('second'); ?>" type="text">
                                            <div class="help-block"><?php echo form_error('second_language'); ?></div>
                                         </div>
                                     </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <div class="item form-group">
                                           <label for="other_info"><?php echo $this->lang->line('other_info'); ?></label> 
                                           <textarea  class="form-control col-md-6 col-xs-12 textarea-4column"  name="other_info"  id="other_info" placeholder="<?php echo $this->lang->line('other_info'); ?>"><?php echo isset($profile->other_info) ?  $profile->other_info : ''; ?></textarea>
                                           <div class="help-block"><?php echo form_error('other_info'); ?></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <div class="item form-group">
                                            <label ><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('photo'); ?></label>
                                            <div class="btn btn-default btn-file">
                                                <i class="fa fa-paperclip"></i> <?php echo $this->lang->line('upload'); ?>
                                                <input  class="form-control col-md-7 col-xs-12"  name="photo"  id="photo" type="file">
                                            </div>
                                            <div class="text-info"><?php echo $this->lang->line('valid_file_format_img'); ?></div>
                                            <div class="help-block"><?php echo form_error('photo'); ?></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                         <div class="item form-group">
                                             <input type="hidden" name="prev_photo" id="prev_photo" value="<?php echo $profile->photo; ?>" />
                                            <?php if($profile->photo){ ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/student-photo/<?php echo $profile->photo; ?>" alt="" width="70" /><br/><br/>
                                            <?php } ?>
                                         </div>
                                    </div>    
                                </div>
                               
                           
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <a href="<?php echo site_url('profile'); ?>" class="btn btn-primary"><?php echo $this->lang->line('cancel'); ?></a>
                                        <input type="hidden" name="id" id="id" value="<?php echo $profile->id; ?>" />
                                        <input type="hidden" name="user_type" id="user_type" value="student" />
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

  <!-- bootstrap-datetimepicker -->
 <link href="<?php echo VENDOR_URL; ?>datepicker/datepicker.css" rel="stylesheet">
 <script src="<?php echo VENDOR_URL; ?>datepicker/datepicker.js"></script>
 <script type="text/javascript">
     
  $('#dob').datepicker();
  $('#joining_date').datepicker();
  $("#profile").validate(); 
  </script> 