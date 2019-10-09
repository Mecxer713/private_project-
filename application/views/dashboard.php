<!-- top tiles -->
<div class="row tile_count">
     <?php if(has_permission(VIEW, 'student', 'student')){ ?>
    <div class="col-md-2 col-sm-4 col-xs-12 tile_stats_count">
        <div class="stats-count-inner">
            <span class="count_top"><i class="fa fa-group"></i> 
                <?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('student'); ?>                
            </span>
            <div class="count"><?php echo $total_student ? $total_student : 0; ?></div>
            <span class="count_bottom">
                <?php if($this->session->userdata('role_id') == STUDENT){ ?>
                    <?php echo $this->lang->line('class'); ?> <?php echo $class_name; ?><br/>
                <?php } ?>
                <?php echo isset($year_session->session_year) ? $year_session->session_year : '' ; ?>
            </span>
        </div>
    </div>
     <?php } ?>
     <?php if(has_permission(VIEW, 'guardian', 'guardian') && $this->session->userdata('role_id') != STUDENT){ ?>
    <div class="col-md-2 col-sm-4 col-xs-12 tile_stats_count">
        <div class="stats-count-inner">
            <span class="count_top"><i class="fa fa-paw"></i> <?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('guardian'); ?></span>
            <div class="count"><?php echo $total_guardian ? $total_guardian : 0; ?></div>
            <span class="count_bottom"><?php echo isset($year_session->session_year) ? $year_session->session_year : '' ; ?></span>
        </div>
    </div>
     <?php } ?>
    <?php if(has_permission(VIEW, 'teacher', 'teacher')){ ?>
    <div class="col-md-2 col-sm-4 col-xs-12 tile_stats_count">
        <div class="stats-count-inner">
            <span class="count_top"><i class="fa fa-users"></i> <?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('teacher'); ?></span>
            <div class="count"><?php echo $total_teacher ? $total_teacher : 0; ?></div>
            <span class="count_bottom"><?php echo isset($year_session->session_year) ? $year_session->session_year : '' ; ?></span>
        </div>
    </div>
    <?php } ?>
    <?php if(has_permission(VIEW, 'hrm', 'employee')){ ?>
    <div class="col-md-2 col-sm-4 col-xs-12 tile_stats_count">
        <div class="stats-count-inner">
            <span class="count_top"><i class="fa fa-user-md"></i> <?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('employee'); ?></span>
            <div class="count"><?php echo $total_employee ? $total_employee :0; ?></div>
            <span class="count_bottom"><?php echo isset($year_session->session_year) ? $year_session->session_year : '' ; ?></span>
        </div>
    </div>
    <?php } ?>
    <?php if(has_permission(VIEW, 'accounting', 'income')){ ?>
        <div class="col-md-2 col-sm-4 col-xs-12 tile_stats_count">
            <div class="stats-count-inner">
                <span class="count_top"><strong class="green"><?php echo $this->gsms_setting->currency_symbol; ?></strong> <?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('income'); ?></span>
                <div class="count green"><?php echo $total_income ? $total_income : '0.00'; ?></div>
                <span class="count_bottom"><?php echo isset($year_session->session_year) ? $year_session->session_year : '' ; ?></span>
            </div>
        </div>
     <?php } ?>
    <?php if(has_permission(VIEW, 'accounting', 'expenditure')){ ?>
    <div class="col-md-2 col-sm-4 col-xs-12 tile_stats_count">
        <div class="stats-count-inner">
            <span class="count_top"> <strong class="red"><?php echo $this->gsms_setting->currency_symbol; ?></strong> <?php echo $this->lang->line('total'); ?> <?php echo $this->lang->line('expenditure'); ?></span>
            <div class="count red"><?php echo $total_expenditure? $total_expenditure : '0.00'; ?></div>
            <span class="count_bottom"><?php echo isset($year_session->session_year) ? $year_session->session_year : '' ; ?></span>
        </div>
    </div>
     <?php } ?>
    
</div>
<!-- /top tiles -->

<div class="row">
    <div class="col-md-8 col-sm-8 col-xs-12">
        <div class="col-md-12 col-sm-12 col-xs-12">

            <div class="x_panel tile overflow_hidden">
                <div class="x_title">
                    <h3 class="head-title"><?php echo $this->lang->line('calendar'); ?></h3>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                                
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div id="calendar"></div>
                    <link rel='stylesheet' href='<?php echo VENDOR_URL; ?>fullcalendar/lib/cupertino/jquery-ui.min.css' />
                    <link rel='stylesheet' href='<?php echo VENDOR_URL; ?>fullcalendar/fullcalendar.css' />
                    <script type="text/javascript" src='<?php echo VENDOR_URL; ?>fullcalendar/lib/jquery-ui.min.js'></script>
                    <script type="text/javascript" src='<?php echo VENDOR_URL; ?>fullcalendar/lib/moment.min.js'></script>
                    <script type="text/javascript" src='<?php echo VENDOR_URL; ?>fullcalendar/fullcalendar.min.js'></script> 
                    <script type="text/javascript">
                        $(function () {
                            $('#calendar').fullCalendar({
                                header: {
                                    left: 'prev,next today',
                                    center: 'title',
                                    right: 'month,agendaWeek,agendaDay'
                                },
                                buttonText: {
                                    today: 'today',
                                    month: 'month',
                                    week: 'week',
                                    day: 'day'
                                },

                                //events and holidays
                                events: [
                                    <?php if(isset($events) && !empty($events)){ ?>
                                        <?php foreach($events as $obj){ ?>
                                        {
                                            title: "<?php echo $obj->title; ?>",
                                            start: '<?php echo date('Y-m-d', strtotime($obj->event_from)); ?>T<?php echo date('H:i:s', strtotime($obj->event_from)); ?>',
                                            end: '<?php echo date('Y-m-d', strtotime($obj->event_to)); ?>T<?php echo date('H:i:s', strtotime($obj->event_to)); ?>',
                                            backgroundColor: '<?php echo $theme->color_code; ?>', //red
                                            url: '<?php echo site_url('event/view/'.$obj->id); ?>', //red
                                            color: '#ffffff' //red
                                        },
                                        <?php } ?> 
                                    <?php } ?> 
                                    <?php if(isset($holidays) && !empty($holidays)){ ?>
                                        <?php foreach($holidays as $obj){ ?>
                                        {
                                            title: "<?php echo $obj->title; ?>",
                                            start: '<?php echo date('Y-m-d', strtotime($obj->date_from)); ?>T<?php echo date('H:i:s', strtotime($obj->date_from)); ?>',
                                            end: '<?php echo date('Y-m-d', strtotime($obj->date_to)); ?>T<?php echo date('H:i:s', strtotime($obj->date_to)); ?>',
                                            backgroundColor: '<?php echo $theme->color_code; ?>', //red
                                            url: '<?php echo site_url('announcement/holiday/view/'.$obj->id); ?>', //red
                                            color: '#ffffff' //red
                                        },
                                        <?php } ?> 
                                    <?php } ?>                                     
                                ]
                            });
                        });
                    </script>

                </div>                
            </div>          
        </div>          

        <div class="col-md-6 col-sm-4 col-xs-12">
            <div class="x_panel tile overflow_hidden">
                <div class="x_title">
                    <h4 class="head-title"><?php echo $this->lang->line('latest'); ?> <?php echo $this->lang->line('news'); ?></h4>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                                
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <ul  class="list-unstyled msg_list">
                        <?php if(isset($news) && !empty($news)){ ?>
                            <?php foreach($news as $obj ){ ?>
                            <li>
                                <a href="<?php echo site_url('announcement/news/view/'.$obj->id); ?>">
                                    <span class="image">
                                    <?php  if($obj->image != ''){ ?>
                                            <img src="<?php echo UPLOAD_PATH; ?>/news/<?php echo $obj->image; ?>" alt="" width="70" /> 
                                            <?php }else{ ?>
                                            <img src="<?php echo IMG_URL; ?>default-user.png" alt="Profile Image" />
                                    <?php } ?>
                                    </span>
                                    <span><?php echo $obj->title; ?></span>                                    
                                    <span class="message">
                                    </span>
                                    <span class="time"><?php echo get_nice_time($obj->created_at); ?></span>
                                </a>
                            </li>
                            <?php } ?>
                        <?php } ?> 
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6 col-xs-12">
            <div class="x_panel tile overflow_hidden">
                <div class="x_title">
                    <h4 class="head-title"><?php echo $this->lang->line('latest'); ?> <?php echo $this->lang->line('notice'); ?></h4>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                                
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <ul  class="list-unstyled msg_list">
                        <?php if(isset($notices) && !empty($notices)){ ?>
                            <?php foreach($notices as $obj ){ ?>
                            <li>
                                <a href="<?php echo site_url('announcement/notice/view/'.$obj->id); ?>">
                                     <span><?php echo $obj->title; ?></span>                                        
                                    <span class="message">
                                    </span>
                                    <span class="time"><?php echo get_nice_time($obj->created_at); ?></span>
                                </a>
                            </li>
                            <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
            </div>
        </div>

    </div>

    <div class="col-md-4 col-sm-4 col-xs-12">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel tile fixed_height_320 overflow_hidden">
                    <div class="x_title">
                        <h4 class="head-title"><?php echo $this->lang->line('student'); ?> <?php echo $this->lang->line('statistics'); ?></h4>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                                
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <script type="text/javascript">

                            $(function () {
                                $('#student-stats').highcharts({
                                    chart: {
                                        type: 'pie',
                                        options3d: {
                                            enabled: true,
                                            alpha: 45,
                                            beta: 0
                                        }
                                    },
                                    title: {
                                        text: '<?php echo $this->lang->line('class'); ?> <?php echo $this->lang->line('statistics'); ?>'
                                    },
                                    tooltip: {
                                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                                    },
                                    plotOptions: {
                                        pie: {
                                            allowPointSelect: true,
                                            cursor: 'pointer',
                                            depth: 35,
                                            dataLabels: {
                                                enabled: true,
                                                format: '{point.name}'
                                            }
                                        }
                                    },
                                    series: [{
                                            type: 'pie',
                                            name: '<?php echo $this->lang->line('student'); ?>',
                                            data: [
                                                <?php if(isset($students) && !empty($students)){ ?>
                                                    <?php foreach($students as $obj){ ?>
                                                    ['<?php echo $this->lang->line('class'); ?> <?php echo $obj->class_name; ?>', <?php echo $obj->total_student; ?>],
                                                    <?php } ?>
                                                <?php } ?>                                                
                                            ]
                                        }],
                                    credits: {
                                        enabled: false
                                    }
                                });
                            });
                        </script>
                        <div id="student-stats" style=" width: 99%; vertical-align: top; height:250px; direction: rtl;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel tile fixed_height_320">
                    <div class="x_title">
                        <h4 class="head-title"><?php echo $this->lang->line('message'); ?></h4>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>                                
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <script type="text/javascript">
                            $(function () {
                                $('#private-message').highcharts({
                                    chart: {
                                        type: 'column'
                                    },
                                    title: {
                                        text: ''
                                    },
                                    xAxis: {
                                        type: 'category'
                                    },
                                    yAxis: {
                                        title: {
                                            text: '<?php echo $this->lang->line('private_messaging'); ?>'
                                        }
                                    },
                                    legend: {
                                        enabled: false
                                    },
                                    plotOptions: {
                                        series: {
                                            borderWidth: 0,
                                            dataLabels: {
                                                enabled: true,
                                                format: '{point.y:.1f}%'
                                            }
                                        }
                                    },
                                    tooltip: {
                                        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                                        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                                    },
                                    series: [{
                                            name: '<?php echo $this->lang->line('message'); ?>',
                                            colorByPoint: true,
                                            data: [{
                                                    name: '<?php echo $this->lang->line('new'); ?>',
                                                    y: <?php echo count($new); ?>,
                                                    drilldown: null
                                                },{
                                                    name: '<?php echo $this->lang->line('inbox'); ?>',
                                                    y: <?php echo count($inboxs); ?>,
                                                    drilldown: null
                                                },{
                                                    name: '<?php echo $this->lang->line('send'); ?>',
                                                    y: <?php echo count($sents); ?>,
                                                    drilldown: null
                                                }, {
                                                    name: '<?php echo $this->lang->line('draft'); ?>',
                                                    y: <?php echo count($drafts); ?>,
                                                    drilldown: null
                                                }, {
                                                    name: '<?php echo $this->lang->line('trash'); ?>',
                                                    y: <?php echo count($trashs); ?>,
                                                    drilldown: null
                                                }]
                                        }],
                                    credits: {
                                        enabled: false
                                    }
                                });
                            });
                        </script>
                        <div id="private-message" style=" width: 99%; vertical-align: top;height: 260px;"></div>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h4 class="head-title"><?php echo $this->lang->line('user'); ?></h4>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <script type="text/javascript">

                            $(function () {
                                $('#system-users').highcharts({
                                    chart: {
                                        type: 'pie',
                                        options3d: {
                                            enabled: true,
                                            alpha: 45
                                        }
                                    },
                                    title: {
                                        text: ''
                                    },
                                    tooltip: {
                                        pointFormat: '{series.name}: <b>{point.percentage:.2f}%</b>'
                                    },
                                    subtitle: {
                                        text: ''
                                    },
                                    plotOptions: {
                                        pie: {
                                            allowPointSelect: true,
                                            innerSize: 100,
                                            depth: 30,
                                            dataLabels: {
                                                format: '<b>{point.name}</b>'
                                            }
                                        }
                                    },
                                    credits: {
                                        enabled: false
                                    },
                                    series: [{
                                            name: '<?php echo $this->lang->line('user'); ?>',
                                            data: [
                                                <?php if(isset($users) && !empty($users)){ ?>
                                                    <?php foreach($users as $obj){ ?>
                                                    ['<?php echo $obj->name; ?>', <?php echo $obj->total_user; ?>],
                                                    <?php } ?>
                                                <?php } ?>
                                            ]
                                        }]
                                });
                            });

                        </script>
                        <div id="system-users" style=" width: 100%; vertical-align: top; height:260px; "></div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</div>
<script src="<?php echo VENDOR_URL; ?>/chart/js/highcharts.js"></script>
<script src="<?php echo VENDOR_URL; ?>/chart/js/highcharts-3d.js"></script>
<script src="<?php echo VENDOR_URL; ?>/chart/js/modules/exporting.js"></script>
