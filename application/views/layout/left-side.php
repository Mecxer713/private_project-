<div class="col-md-3 <?php echo $this->gsms_setting->enable_rtl ? 'right_col' : 'left_col'; ?>">
    <div class="<?php echo $this->gsms_setting->enable_rtl ? 'right_col' : 'left_col'; ?> scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="<?php echo site_url('dashboard'); ?>" class="site_title_">
                <span>Global School</span>
                <?php if(isset($this->gsms_setting->logo) && !empty($this->gsms_setting->logo)){ ?>
                    <img class="logo" src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->gsms_setting->logo; ?>" alt="" width="60" />
                <?php }else{ ?>
                    <img class="logo" src="<?php echo IMG_URL; ?>/sms-logo-50.png">
                <?php } ?>
            </a>
        </div>
        <div class="clearfix"></div>   
        
        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <?php $classes = get_classes(); ?>
                <ul class="nav side-menu">                    
                    <li><a href="<?php echo site_url('dashboard'); ?>"><i class="fa fa-dashboard"></i> <?php echo $this->lang->line('dashboard'); ?></a>  </li>
                    
                    <?php if(has_permission(VIEW, 'setting', 'setting') || has_permission(VIEW, 'setting', 'payment') || has_permission(VIEW, 'setting', 'sms')){ ?>
                    <li><a><i class="fa fa-gears"></i> <?php echo $this->lang->line('setting'); ?> <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">                            
                            <?php if(has_permission(VIEW, 'setting', 'setting')){ ?>
                                <li><a href="<?php echo site_url('setting'); ?>"><?php echo $this->lang->line('general'); ?> <?php echo $this->lang->line('setting'); ?></a></li>
                            <?php } ?>
                            <?php if(has_permission(VIEW, 'setting', 'payment')){ ?> 
                                <li><a href="<?php echo site_url('setting/payment'); ?>"><?php echo $this->lang->line('payment'); ?> <?php echo $this->lang->line('setting'); ?></a></li>
                            <?php } ?>
                            <?php if(has_permission(VIEW, 'setting', 'sms')){ ?>
                                <li><a href="<?php echo site_url('setting/sms'); ?>"><?php echo $this->lang->line('sms'); ?> <?php echo $this->lang->line('setting'); ?></a></li>
                            <?php } ?>
                        </ul>
                    </li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'theme', 'theme')){ ?>
                        <li><a  href="<?php echo site_url('theme'); ?>"><i class="fa fa-cubes"></i> <?php echo $this->lang->line('theme'); ?></a></li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'language', 'language')){ ?>
                        <li><a  href="<?php echo site_url('language'); ?>"><i class="fa fa-language"></i> <?php echo $this->lang->line('language'); ?></a></li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'administrator', 'year') || has_permission(VIEW, 'administrator', 'role') || has_permission(VIEW, 'administrator', 'permission') || has_permission(VIEW, 'administrator', 'user') || has_permission(EDIT, 'administrator', 'password') || has_permission(VIEW, 'administrator', 'backup')){ ?>    
                        <li><a><i class="fa fa-user"></i> <?php echo $this->lang->line('administrator'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'administrator', 'year')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/year'); ?>"> <?php echo $this->lang->line('academic_year'); ?></a></li>
                                 <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'role')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/role'); ?>"> <?php echo $this->lang->line('user_role'); ?> (ACL)</a></li> 
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'permission')){ ?> 
                                    <li><a href="<?php echo site_url('administrator/permission'); ?>"><?php echo $this->lang->line('role_permission'); ?> (ACL)</a></li> 
                                 <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'user')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/user'); ?>"><?php echo $this->lang->line('manage_user'); ?></a></li> 
                                 <?php } ?>
                                <?php if(has_permission(EDIT, 'administrator', 'password')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/password'); ?>"><?php echo $this->lang->line('reset_user_password'); ?></a></li> 
                                 <?php } ?>
                                <?php if(has_permission(EDIT, 'administrator', 'email')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/email'); ?>"><?php echo $this->lang->line('reset_user_email'); ?></a></li> 
                                 <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'backup')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/backup'); ?>"><?php echo $this->lang->line('backup'); ?></a></li>                         
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'emailtemplate')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/emailtemplate'); ?>"><?php echo $this->lang->line('email'); ?> <?php echo $this->lang->line('template'); ?></a></li>                         
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'smstemplate')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/smstemplate'); ?>"><?php echo $this->lang->line('sms'); ?> <?php echo $this->lang->line('template'); ?></a></li>                         
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'activitylog')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/activitylog'); ?>"><?php echo $this->lang->line('activity_log'); ?></a></li>                         
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'administrator', 'feedback')){ ?>   
                                    <li><a href="<?php echo site_url('administrator/feedback'); ?>"><?php echo $this->lang->line('publish'); ?> <?php echo $this->lang->line('guardian'); ?> <?php echo $this->lang->line('feedback'); ?></a></li>                         
                                <?php } ?>     
                            </ul>
                        </li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'hrm', 'designation') || has_permission(VIEW, 'hrm', 'employee')){ ?>    
                    <li><a><i class="fa fa-user-md"></i> <?php echo $this->lang->line('human_resource'); ?> <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <?php if(has_permission(VIEW, 'hrm', 'designation')){ ?>   
                                <li><a href="<?php echo site_url('hrm/designation'); ?>"><?php echo $this->lang->line('manage_designation'); ?></a></li>
                            <?php } ?>
                            <?php if(has_permission(VIEW, 'hrm', 'employee')){ ?>   
                                <li><a href="<?php echo site_url('hrm/employee'); ?>"><?php echo $this->lang->line('manage_employee'); ?></a></li>                            
                            <?php } ?>
                        </ul>
                    </li> 
                    <?php } ?>
                   
                    <?php if(has_permission(VIEW, 'teacher', 'teacher')){ ?>
                        <li><a href="<?php echo site_url('teacher'); ?>"><i class="fa fa-users"></i> <?php echo $this->lang->line('teacher'); ?></a> </li>  
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'academic', 'classes')){ ?>
                        <li><a href="<?php echo site_url('academic/classes/index'); ?>"><i class="fa fa-slideshare"></i> <?php echo $this->lang->line('class'); ?></a> </li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'academic', 'section')){ ?>                    
                        <li><a <?php if(empty($classes)){ ?> onclick="alert('<?php echo $this->lang->line('class_add_alert'); ?>');" <?php } ?>><i class="fa fa-bars"></i> <?php echo $this->lang->line('section'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">                            
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                        <li><a href="<?php echo site_url('academic/section/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                        <li><a href="<?php echo site_url('academic/section/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?>
                                <?php } ?>
                            </ul>                    
                        </li>         
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'academic', 'subject')){ ?>
                        <li><a <?php if(empty($classes)){ ?> onclick="alert('<?php echo $this->lang->line('class_add_alert'); ?>');" <?php } ?>><i class="fa fa-folder-open"></i> <?php echo $this->lang->line('subject'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">                            
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                        <li><a href="<?php echo site_url('academic/subject/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                        <li><a href="<?php echo site_url('academic/subject/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?>
                                <?php } ?>
                            </ul>                    
                        </li>  
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'academic', 'syllabus')){ ?>
                        <li><a <?php if(empty($classes)){ ?> onclick="alert('<?php echo $this->lang->line('class_add_alert'); ?>');" <?php } ?>><i class="fa fa-clipboard"></i> <?php echo $this->lang->line('syllabus'); ?> <span class="fa fa-chevron-down"></span></a> 
                            <ul class="nav child_menu">
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                        <li><a href="<?php echo site_url('academic/syllabus/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                        <li><a href="<?php echo site_url('academic/syllabus/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?>
                                <?php } ?>
                            </ul>                    
                        </li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'academic', 'routine')){ ?>
                        <li <?php if(empty($classes)){ ?> onclick="alert('<?php echo $this->lang->line('class_add_alert'); ?>');" <?php } ?>><a><i class="fa fa-clock-o"></i> <?php echo $this->lang->line('class'); ?> <?php echo $this->lang->line('routine'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                        <li><a href="<?php echo site_url('academic/routine/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                        <li><a href="<?php echo site_url('academic/routine/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?>
                                <?php } ?>
                            </ul>
                        </li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'guardian', 'guardian')){ ?>    
                        <li><a href="<?php echo site_url('guardian/index/'); ?>"><i class="fa fa-paw"></i> <?php echo $this->lang->line('guardian'); ?></a> </li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'student', 'student') || has_permission(ADD, 'student', 'student')){ ?>    
                        <li><a><i class="fa fa-group"></i> <?php echo $this->lang->line('student'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(ADD, 'student', 'student')){ ?>
                                    <li><a href="<?php echo site_url('student/add/'); ?>"> <?php echo $this->lang->line('admit'); ?> <?php echo $this->lang->line('student'); ?></a></li>
                                    <li><a href="<?php echo site_url('student/advanced/'); ?>"> <?php echo $this->lang->line('advanced'); ?> <?php echo $this->lang->line('admission'); ?></a></li>
                                    <li><a href="<?php echo site_url('student/bulk/add'); ?>"> <?php echo $this->lang->line('bulk'); ?> <?php echo $this->lang->line('admission'); ?></a></li>
                                <?php } ?>                               
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                       <li><a href="<?php echo site_url('student/index/'.$obj->id); ?>"> <?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                       <li><a href="<?php echo site_url('student/index/'.$obj->id); ?>"> <?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?>
                                <?php } ?>                                       
                                <?php if(has_permission(ADD, 'student', 'activity')){ ?>
                                    <li><a href="<?php echo site_url('student/activity/index'); ?>"> <?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('activity'); ?></a></li>
                                <?php } ?>       
                            </ul>
                        </li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'attendance', 'student') || has_permission(VIEW, 'attendance', 'teacher') || has_permission(VIEW, 'attendance', 'employee')){ ?>
                        <li><a><i class="fa fa-check-circle-o"></i> <?php echo $this->lang->line('attendance'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'attendance', 'student')){ ?>                                    
                                    <?php if($this->session->userdata('role_id') == GUARDIAN){ ?>
                                        <li><a href="<?php echo site_url('attendance/student/guardian'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                     <?php }else{ ?>   
                                        <li><a href="<?php echo site_url('attendance/student'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                     <?php } ?>   
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'attendance', 'teacher')){ ?>
                                    <li><a href="<?php echo site_url('attendance/teacher'); ?>"><?php echo $this->lang->line('teacher'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'attendance', 'employee')){ ?>
                                    <li><a href="<?php echo site_url('attendance/employee'); ?>"><?php echo $this->lang->line('employee'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <?php } ?>                                    
                                <?php if(has_permission(VIEW, 'attendance', 'absentemail')){ ?>  
                                    <li><a href="<?php echo site_url('attendance/absentemail/index/'); ?>"><?php echo $this->lang->line('absent'); ?> <?php echo $this->lang->line('email'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'attendance', 'absentsms')){ ?>  
                                    <li><a href="<?php echo site_url('attendance/absentsms/index/'); ?>"><?php echo $this->lang->line('absent'); ?> <?php echo $this->lang->line('sms'); ?></a></li>
                                <?php } ?>                                     
                            </ul>
                        </li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'assignment', 'assignment')){ ?>
                        <li  <?php if(empty($classes)){ ?> onclick="alert('<?php echo $this->lang->line('class_add_alert'); ?>');" <?php } ?>><a><i class="fa fa-file-word-o"></i> <?php echo $this->lang->line('assignment'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">                                                                                                                   
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                        <li><a href="<?php echo site_url('assignment/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                        <li><a href="<?php echo site_url('assignment/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?> 
                                <?php } ?> 
                            </ul>
                        </li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'exam', 'grade') || has_permission(VIEW, 'exam', 'exam') || has_permission(VIEW, 'exam', 'schedule') || has_permission(VIEW, 'exam', 'suggestion') || has_permission(VIEW, 'exam', 'attendance')){ ?>    
                        <li><a><i class="fa fa-graduation-cap"></i> <?php echo $this->lang->line('exam'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'exam', 'grade')){ ?>
                                    <li><a href="<?php echo site_url('exam/grade/'); ?>"><?php echo $this->lang->line('exam_grade'); ?></a></li>                         
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'exam')){ ?>
                                    <li><a href="<?php echo site_url('exam/index'); ?>"><?php echo $this->lang->line('exam_term'); ?></a></li>                         
                                <?php } ?> 
                            </ul>
                        </li> 
                    <?php } ?>
                        
                      <?php if(has_permission(VIEW, 'exam', 'schedule')){ ?>
                        <li><a <?php if(empty($classes)){ ?> onclick="alert('<?php echo $this->lang->line('class_add_alert'); ?>');" <?php } ?>><i class="fa fa-thumb-tack"></i><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('schedule'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">                                                          
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                        <li><a href="<?php echo site_url('exam/schedule/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                        <li><a href="<?php echo site_url('exam/schedule/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?>                            
                                <?php } ?>                            
                            </ul>
                        </li> 
                    <?php } ?>   
                        
                     <?php if(has_permission(VIEW, 'exam', 'suggestion')){ ?>
                        <li><a <?php if(empty($classes)){ ?> onclick="alert('<?php echo $this->lang->line('class_add_alert'); ?>');" <?php } ?>><i class="fa fa-file-text"></i><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('suggestion'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">                                                          
                                <?php foreach($classes as $obj){ ?>
                                    <?php if($this->session->userdata('role_id') == STUDENT && $this->session->userdata('class_id') == $obj->id){ ?>
                                        <li><a href="<?php echo site_url('exam/suggestion/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php }elseif($this->session->userdata('role_id') != STUDENT){ ?>
                                        <li><a href="<?php echo site_url('exam/suggestion/index/'.$obj->id); ?>"><?php echo $this->lang->line('class'); ?> <?php echo $obj->name; ?></a></li>  
                                    <?php } ?>                              
                                <?php } ?>                              
                            </ul>
                        </li> 
                    <?php } ?> 
                        
                    <?php if(has_permission(VIEW, 'exam', 'attendance')){ ?>
                        <li><a  href="<?php echo site_url('exam/attendance/'); ?>"><i class="fa fa-check"></i> <?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                    <?php } ?>    
                        
                    <?php if(has_permission(VIEW, 'exam', 'mark') || has_permission(VIEW, 'exam', 'marksheet') || has_permission(VIEW, 'exam', 'result') || has_permission(VIEW, 'exam', 'sms') || has_permission(VIEW, 'exam', 'mail')){ ?>    
                        <li><a><i class="fa fa-file-text-o"></i> <?php echo $this->lang->line('exam_mark'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'exam', 'mark')){ ?>
                                    <li><a href="<?php echo site_url('exam/mark'); ?>"><?php echo $this->lang->line('manage_mark'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'examresult')){ ?>
                                    <li><a href="<?php echo site_url('exam/examresult'); ?>"><?php echo $this->lang->line('exam_term'); ?> <?php echo $this->lang->line('result'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'finalresult')){ ?>
                                    <li><a href="<?php echo site_url('exam/finalresult'); ?>"><?php echo $this->lang->line('exam_final_result'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'finalresult')){ ?>
                                    <li><a href="<?php echo site_url('exam/meritlist'); ?>"><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('merit_list'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'marksheet')){ ?>
                                    <li><a href="<?php echo site_url('exam/marksheet'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('mark_sheet'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'resultcard')){ ?>
                                    <li><a href="<?php echo site_url('exam/resultcard'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('result_card'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'result')){ ?>
                                    <li><a href="<?php echo site_url('exam/result'); ?>"><?php echo $this->lang->line('exam_final_result'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'mail')){ ?>
                                    <li><a href="<?php echo site_url('exam/mail'); ?>"><?php echo $this->lang->line('mark_send_by_email'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'text')){ ?>
                                    <li><a href="<?php echo site_url('exam/text'); ?>"><?php echo $this->lang->line('mark_send_by_sms'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'resultemail')){ ?>  
                                    <li><a href="<?php echo site_url('exam/resultemail/index/'); ?>"><?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('email'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'exam', 'resultsms')){ ?>  
                                    <li><a href="<?php echo site_url('exam/resultsms/index/'); ?>"><?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('sms'); ?></a></li>
                                <?php } ?>    
                            </ul>
                        </li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'academic', 'promotion')){ ?>
                        <li><a href="<?php echo site_url('academic/promotion'); ?>"><i class="fa fa-mail-forward"></i><?php echo $this->lang->line('promotion'); ?></a></li>                   
                    <?php } ?>
                        
                    <?php if(has_permission(VIEW, 'certificate', 'certificate') || has_permission(VIEW, 'certificate', 'type')){ ?>
                    <li><a><i class="fa fa-certificate"></i> <?php echo $this->lang->line('certificate'); ?> <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <?php if(has_permission(VIEW, 'certificate', 'type')){ ?>
                                <li><a href="<?php echo site_url('certificate/type'); ?>"><?php echo $this->lang->line('certificate'); ?> <?php echo $this->lang->line('type'); ?></a></li>
                            <?php } ?>
                            <?php if(has_permission(VIEW, 'certificate', 'certificate')){ ?>
                                <li><a href="<?php echo site_url('certificate/index'); ?>"><?php echo $this->lang->line('generate'); ?> <?php echo $this->lang->line('certificate'); ?></a></li>
                            <?php } ?>                                
                        </ul>
                    </li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'library', 'book') || has_permission(VIEW, 'library', 'member') || has_permission(VIEW, 'library', 'issue')){ ?>    
                        <li><a><i class="fa fa-book"></i> <?php echo $this->lang->line('library'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'library', 'book')){ ?>
                                    <li><a href="<?php echo site_url('library/book/index/'); ?>"><?php echo $this->lang->line('book'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'library', 'member')){ ?>
                                    <li><a href="<?php echo site_url('library/member/index/'); ?>"><?php echo $this->lang->line('library'); ?> <?php echo $this->lang->line('member'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'library', 'issue')){ ?>
                                    <li><a href="<?php echo site_url('library/issue/index'); ?>"><?php echo $this->lang->line('issue_and_return'); ?></a></li>
                                <?php } ?>
                            </ul>
                        </li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'transport', 'vehicle') || has_permission(VIEW, 'transport', 'route') || has_permission(VIEW, 'transport', 'member')){ ?>        
                        <li><a><i class="fa fa-bus"></i> <?php echo $this->lang->line('transport'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'transport', 'vehicle')){ ?>
                                    <li><a href="<?php echo site_url('transport/vehicle/index/'); ?>"><?php echo $this->lang->line('vehicle'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'transport', 'route')){ ?>
                                    <li><a href="<?php echo site_url('transport/route/index/'); ?>"><?php echo $this->lang->line('manage_route'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'transport', 'member')){ ?>
                                    <li><a href="<?php echo site_url('transport/member/index/'); ?>"><?php echo $this->lang->line('transport'); ?> <?php echo $this->lang->line('member'); ?></a></li>
                                <?php } ?>
                            </ul>
                        </li>  
                    <?php } ?>
                        
                    <?php if(has_permission(VIEW, 'hostel', 'hostel') || has_permission(VIEW, 'hostel', 'room') || has_permission(VIEW, 'hostel', 'member')){ ?>        
                        <li><a><i class="fa fa-hotel"></i> <?php echo $this->lang->line('hostel'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'hostel', 'hostel')){ ?>
                                    <li><a href="<?php echo site_url('hostel/index/'); ?>"><?php echo $this->lang->line('manage_hostel'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'hostel', 'room')){ ?>
                                    <li><a href="<?php echo site_url('hostel/room/index/'); ?>"><?php echo $this->lang->line('manage_room'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'hostel', 'member')){ ?>
                                    <li><a href="<?php echo site_url('hostel/member/index/'); ?>"><?php echo $this->lang->line('hostel'); ?> <?php echo $this->lang->line('member'); ?></a></li>
                                <?php } ?>
                            </ul>
                        </li>
                   <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'message', 'message')){ ?>    
                        <li><a href="<?php echo site_url('message/inbox'); ?>"><i class="fa fa-comments-o"></i> <?php echo $this->lang->line('message'); ?></a></li>                   
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'message', 'mail') || has_permission(VIEW, 'message', 'text')){ ?>
                        <li><a><i class="fa fa-envelope-o"></i> <?php echo $this->lang->line('mail_and_sms'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'message', 'mail')){ ?>  
                                    <li><a href="<?php echo site_url('message/mail/index/'); ?>"><?php echo $this->lang->line('general'); ?> <?php echo $this->lang->line('email'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'message', 'text')){ ?>  
                                    <li><a href="<?php echo site_url('message/text/index/'); ?>"><?php echo $this->lang->line('general'); ?> <?php echo $this->lang->line('sms'); ?></a></li>
                                <?php } ?>                                 
                            </ul>
                        </li>   
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'announcement', 'notice') || has_permission(VIEW, 'announcement', 'news') || has_permission(VIEW, 'announcement', 'holiday')){ ?>            
                        <li><a><i class="fa fa-bullhorn"></i> <?php echo $this->lang->line('announcement'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'announcement', 'notice')){ ?>
                                    <li><a href="<?php echo site_url('announcement/notice/index/'); ?>"><?php echo $this->lang->line('notice'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'announcement', 'news')){ ?>
                                    <li><a href="<?php echo site_url('announcement/news/index/'); ?>"><?php echo $this->lang->line('news'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'announcement', 'holiday')){ ?>
                                    <li><a href="<?php echo site_url('announcement/holiday/index/'); ?>"><?php echo $this->lang->line('holiday'); ?></a></li>
                                <?php } ?>
                            </ul>
                        </li>  
                    <?php } ?>
                   
                    <?php if(has_permission(VIEW, 'event', 'event')){ ?>    
                        <li><a href="<?php echo site_url('event/index/'); ?>"><i class="fa fa fa-calendar-check-o"></i> <?php echo $this->lang->line('event'); ?></a></li>
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'visitor', 'visitor')){ ?> 
                        <li><a href="<?php echo site_url('visitor/index/'); ?>"><i class="fa fa-male"></i> <?php echo $this->lang->line('visitor_info'); ?></a></li>
                    <?php } ?>
                        
                        
                    <?php if(has_permission(VIEW, 'payroll', 'grade') || has_permission(VIEW, 'payroll', 'payment')){ ?>
                        <li><a><i class="fa fa-dollar"></i> <?php echo $this->lang->line('payroll'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <?php if(has_permission(VIEW, 'payroll', 'grade')){ ?>  
                                    <li><a href="<?php echo site_url('payroll/grade/index'); ?>"><?php echo $this->lang->line('salary_grade'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'payroll', 'payment')){ ?>  
                                    <li><a href="<?php echo site_url('payroll/payment/index'); ?>"> <?php echo $this->lang->line('salary'); ?> <?php echo $this->lang->line('payment'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'payroll', 'payment')){ ?>  
                                    <li><a href="<?php echo site_url('payroll/history/index'); ?>"> <?php echo $this->lang->line('payment'); ?> <?php echo $this->lang->line('history'); ?></a></li>
                                <?php } ?>
                            </ul>
                        </li>   
                    <?php } ?>    
                    
                    <?php if(has_permission(VIEW, 'accounting', 'invoice') || has_permission(VIEW, 'accounting', 'exphead') || has_permission(VIEW, 'accounting', 'expenditure') || has_permission(VIEW, 'accounting', 'incomehead') || has_permission(VIEW, 'accounting', 'income')){ ?>                
                        <li><a><i class="fa fa-calculator"></i> <?php echo $this->lang->line('accounting'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                               <?php if(has_permission(VIEW, 'accounting', 'discount')){ ?>
                                    <li><a href="<?php echo site_url('accounting/discount'); ?>"><?php echo $this->lang->line('discount'); ?></a></li> 
                                <?php } ?>
                               <?php if(has_permission(VIEW, 'accounting', 'discount')){ ?>
                                    <li><a href="<?php echo site_url('accounting/feetype'); ?>"> <?php echo $this->lang->line('fee_type'); ?></a></li> 
                                <?php } ?>
                               
                                <?php if(has_permission(VIEW, 'accounting', 'invoice')){ ?>
                                    
                                    <?php if($this->session->userdata('role_id') == STUDENT || $this->session->userdata('role_id') == GUARDIAN){ ?>
                                        <li><a href="<?php echo site_url('accounting/invoice/due'); ?>"><?php echo $this->lang->line('due_invoice'); ?></a></li>
                                    <?php }else{ ?>
                                        <li><a href="<?php echo site_url('accounting/invoice/add'); ?>"><?php echo $this->lang->line('fee'); ?> <?php echo $this->lang->line('collection'); ?></a></li>                            
                                        <li><a href="<?php echo site_url('accounting/invoice/index'); ?>"><?php echo $this->lang->line('manage_invoice'); ?></a></li>                            
                                        <li><a href="<?php echo site_url('accounting/invoice/due'); ?>"><?php echo $this->lang->line('due_fee'); ?></a></li>
                                    <?php } ?>                                    
                                <?php } ?>
                                        
                                <?php if(has_permission(VIEW, 'accounting', 'duefeeemail')){ ?>  
                                    <li><a href="<?php echo site_url('accounting/duefeeemail/index/'); ?>"><?php echo $this->lang->line('due_fee'); ?> <?php echo $this->lang->line('email'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'accounting', 'duefeesms')){ ?>  
                                    <li><a href="<?php echo site_url('accounting/duefeesms/index/'); ?>"><?php echo $this->lang->line('due_fee'); ?> <?php echo $this->lang->line('sms'); ?></a></li>
                                <?php } ?>
                                    
                                <?php if(has_permission(VIEW, 'accounting', 'incomehead')){ ?>
                                    <li><a href="<?php echo site_url('accounting/incomehead'); ?>"><?php echo $this->lang->line('income_head'); ?></a></li> 
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'accounting', 'income')){ ?>
                                    <li><a href="<?php echo site_url('accounting/income'); ?>"><?php echo $this->lang->line('income'); ?></a></li> 
                                <?php } ?>        
                                <?php if(has_permission(VIEW, 'accounting', 'exphead')){ ?>
                                    <li><a href="<?php echo site_url('accounting/exphead'); ?>"><?php echo $this->lang->line('expenditure_head'); ?></a></li>
                                <?php } ?>
                                <?php if(has_permission(VIEW, 'accounting', 'expenditure')){ ?>
                                    <li><a href="<?php echo site_url('accounting/expenditure'); ?>"><?php echo $this->lang->line('expenditure'); ?></a></li>
                                <?php } ?>                                
                            </ul>
                        </li> 
                    <?php } ?>
                    
                    <?php if(has_permission(VIEW, 'report', 'report')){ ?>
                        <li><a><i class="fa fa-bar-chart"></i> <?php echo $this->lang->line('report'); ?> <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="<?php echo site_url('report/income'); ?>"><?php echo $this->lang->line('income'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/expenditure'); ?>"><?php echo $this->lang->line('expenditure'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/invoice'); ?>"><?php echo $this->lang->line('invoice'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/duefee'); ?>"><?php echo $this->lang->line('due_fee'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/feecollection'); ?>"><?php echo $this->lang->line('fee'); ?> <?php echo $this->lang->line('collection'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/balance'); ?>"><?php echo $this->lang->line('accounting'); ?> <?php echo $this->lang->line('balance'); ?> <?php echo $this->lang->line('report'); ?></a></li> 
                                <li><a href="<?php echo site_url('report/library'); ?>"><?php echo $this->lang->line('library'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/sattendance'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <li><a href="<?php echo site_url('report/syattendance'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('yearly'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <li><a href="<?php echo site_url('report/tattendance'); ?>"><?php echo $this->lang->line('teacher'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <li><a href="<?php echo site_url('report/tyattendance'); ?>"><?php echo $this->lang->line('teacher'); ?> <?php echo $this->lang->line('yearly'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <li><a href="<?php echo site_url('report/eattendance'); ?>"><?php echo $this->lang->line('employee'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <li><a href="<?php echo site_url('report/eyattendance'); ?>"><?php echo $this->lang->line('employee'); ?> <?php echo $this->lang->line('yearly'); ?> <?php echo $this->lang->line('attendance'); ?></a></li>
                                <li><a href="<?php echo site_url('report/student'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/sinvoice'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('invoice'); ?> <?php echo $this->lang->line('report'); ?></a></li> 
                                <li><a href="<?php echo site_url('report/sactivity'); ?>"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('activity'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/payroll'); ?>"><?php echo $this->lang->line('payroll'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/transaction'); ?>"><?php echo $this->lang->line('daily'); ?> <?php echo $this->lang->line('transaction'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/statement'); ?>"><?php echo $this->lang->line('daily'); ?> <?php echo $this->lang->line('statement'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                                <li><a href="<?php echo site_url('report/examresult'); ?>"><?php echo $this->lang->line('exam'); ?> <?php echo $this->lang->line('result'); ?> <?php echo $this->lang->line('report'); ?></a></li>
                            </ul>
                        </li> 
                    <?php } ?>
                   
                   <?php if(has_permission(VIEW, 'gallery', 'gallery') || has_permission(VIEW, 'gallery', 'image')){ ?>     
                    <li><a><i class="fa fa-image"></i><?php echo $this->lang->line('media_gallery'); ?> <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <?php if(has_permission(VIEW, 'gallery', 'gallery')){ ?>
                                <li><a href="<?php echo site_url('gallery/index'); ?>"><?php echo $this->lang->line('manage_gallery'); ?></a></li>
                           <?php } ?>
                           <?php if(has_permission(VIEW, 'gallery', 'image')){ ?>      
                                <li><a href="<?php echo site_url('gallery/image/index'); ?>"><?php echo $this->lang->line('manage_gallery_image'); ?></a></li>
                           <?php } ?>
                        </ul>
                    </li> 
                    <?php } ?>
                   
                    <?php if(has_permission(VIEW, 'frontend', 'frontend') || has_permission(VIEW, 'frontend', 'slider')){ ?>
                    <li><a><i class="fa fa-desktop"></i><?php echo $this->lang->line('frontend'); ?> <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <?php if(has_permission(VIEW, 'frontend', 'frontend')){ ?>
                            <li><a href="<?php echo site_url('frontend/index'); ?>"> <?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('page'); ?></a></li>
                            <?php } ?>
                            <?php if(has_permission(VIEW, 'frontend', 'slider')){ ?>
                                <li><a href="<?php echo site_url('frontend/slider/index'); ?>"> <?php echo $this->lang->line('manage_slider'); ?></a></li>
                            <?php } ?>
                            <?php if(has_permission(VIEW, 'setting', 'setting')){ ?>
                                <li><a href="<?php echo site_url('setting'); ?>"> <?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('setting'); ?></a></li>
                            <?php } ?>
                            <?php if(has_permission(VIEW, 'frontend', 'about')){ ?>
                                <li><a href="<?php echo site_url('frontend/about/index'); ?>"> <?php echo $this->lang->line('frontend'); ?> <?php echo $this->lang->line('about'); ?></a></li>
                            <?php } ?>        
                        </ul>
                    </li>  
                    <?php } ?>
                    
                    <li><a><i class="fa fa-lock"></i><?php echo $this->lang->line('profile'); ?> <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="<?php echo site_url('profile'); ?>"><?php echo $this->lang->line('my_profile'); ?></a></li>
                            <li><a href="<?php echo site_url('profile/password'); ?>"><?php echo $this->lang->line('reset_password'); ?></a></li>
                            <?php if($this->session->userdata('role_id') == STUDENT){ ?>
                                <li><a href="<?php echo site_url('accounting/invoice/due'); ?>"><?php echo $this->lang->line('invoice'); ?></a></li>
                            <?php } ?>
                            <?php if($this->session->userdata('role_id') == GUARDIAN){ ?>
                                <li><a href="<?php echo site_url('guardian/invoice'); ?>"><?php echo $this->lang->line('invoice'); ?></a></li>
                                <li><a href="<?php echo site_url('guardian/feedback'); ?>"><?php echo $this->lang->line('feedback'); ?></a></li>
                            <?php } ?>
                            <li><a href="<?php echo site_url('auth/logout'); ?>"><?php echo $this->lang->line('logout'); ?></a></li>
                        </ul>
                    </li>  
                    
                </ul>
            </div>     
        </div>
        <!-- /sidebar menu -->
    </div>
</div>