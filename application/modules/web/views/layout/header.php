<header>
    <div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 col-md-8 col-sm-12 col-12 hta-left">
                    <div class="hta-box">
                        <p class="text"><?php echo $this->lang->line('have_any_question'); ?></p>
                    </div>                    
                    <?php if(isset($this->setting->phone)){ ?>
                        <div class="hta-box">
                            <span class="icon"><i class="fas fa-phone"></i></span>
                            <p class="text"><?php echo $this->lang->line('call_us'); ?> : <?php echo $this->setting->phone; ?></p>
                        </div>                       
                   <?php } ?>   
                    <?php if(isset($this->setting->email)){ ?>
                        <div class="hta-box">
                            <span class="icon"><i class="fas fa-envelope"></i></span>
                            <p class="text"><?php echo $this->lang->line('email_us'); ?> : <?php echo $this->setting->email; ?></p>
                        </div>                        
                   <?php } ?>
                    
                </div>
                <div class="col-lg-5 col-md-4 col-sm-12 col-12 hta-right text-right">              
                    
                    <div class="hta-box">
                        <a class="text" href="<?php echo site_url('admission'); ?>"><?php echo $this->lang->line('admission'); ?></a>
                    </div>
                    <?php if (logged_in_user_id()) { ?>  
                    
                        <div class="hta-box">
                            <a class="text" href="<?php echo site_url('dashboard'); ?>"><?php echo $this->lang->line('dashboard'); ?></a>
                        </div>
                        <div class="hta-box">
                            <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
                            <a class="text" href="<?php echo site_url('auth/logout'); ?>"><?php echo $this->lang->line('logout'); ?></a>
                        </div>
                    <?php }else{ ?>
                        <div class="hta-box">
                            <span class="icon"><i class="fas fa-sign-in-alt"></i></span>
                            <a class="text" href="<?php echo site_url('login'); ?>"><?php echo $this->lang->line('login'); ?></a>
                        </div>
                    <?php } ?>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 offset-lg-0 col-md-4 offset-md-3 col-sm-6 col-6">
                    <div class="logo">
                        <a href="<?php echo site_url(); ?>">
                            <?php if(isset($this->setting->front_logo)){ ?>                            
                                <img src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->setting->front_logo; ?>" alt=""  />
                            <?php }else{ ?>
                                <img src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->setting->logo; ?>" alt=""  />
                            <?php } ?>    
                        </a>
                    </div>
                </div>
                <div class="col-lg-10 offset-lg-0 col-md-8 offset-md-2 col-sm-12 col-12">
                    <div class="menu">
                        <nav id="mobile_menu_active">
                            <ul id="menu">
                                <li><a href="<?php echo site_url(); ?>"><?php echo $this->lang->line('home'); ?></a></li>
                                <li><a href="#"><?php echo $this->lang->line('announcement'); ?> <span class="icon fas fa-chevron-down"></span></a>
                                    <ul class="drop">
                                        <li><a href="<?php echo site_url('news'); ?>"><?php echo $this->lang->line('news'); ?></a></li>
                                        <li><a href="<?php echo site_url('notice'); ?>"><?php echo $this->lang->line('notice'); ?></a></li>
                                        <li><a href="<?php echo site_url('holiday'); ?>"><?php echo $this->lang->line('holiday'); ?></a></li>
                                    </ul>                                
                                </li>
                                <li><a href="<?php echo site_url('events'); ?>"><?php echo $this->lang->line('event'); ?></a></li>
                                <li><a href="<?php echo site_url('galleries'); ?>"><?php echo $this->lang->line('gallery'); ?></a></li>
                                <li><a href="<?php echo site_url('teachers'); ?>"><?php echo $this->lang->line('teacher'); ?></a></li>
                                <li><a href="<?php echo site_url('staff'); ?>"><?php echo $this->lang->line('staff'); ?></a></li>
                                <li><a href="<?php echo site_url('contact'); ?>"><?php echo $this->lang->line('contact_us'); ?></a></li>
                                <?php if(isset($header_pages) && !empty($header_pages)){ ?>
                                    <li><a href="javascript:void(0)"><?php echo $this->lang->line('page'); ?> <span class="icon fas fa-chevron-down"></span></a>
                                        <ul class="drop">
                                        <?php foreach($header_pages AS $obj ){ ?>
                                             <li><a href="<?php echo site_url('page/'.$obj->page_slug); ?>"><?php echo $obj->page_title; ?></a></li>
                                         <?php } ?> 
                                        </ul>                                
                                    </li>    
                                <?php } ?> 
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
