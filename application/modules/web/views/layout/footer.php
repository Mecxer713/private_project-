<footer>
    <div class="footer-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-7 col-sm-7 col-12">
                    <div class="footer-widget">
                        <div class="fw-logo">
                            <?php if(isset($this->setting->front_logo)){ ?>                            
                                <img src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->setting->front_logo; ?>" alt=""  />
                            <?php }else{ ?>
                                <img src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->setting->logo; ?>" alt=""  />
                            <?php } ?> 
                        </div>
                        <p class="text">
                            <?php if(isset($this->setting->about_text) && !empty($this->setting->about_text)){ ?>
                                <?php echo strip_tags(substr($this->setting->about_text, 0, 350)); ?>
                            <?php } ?> 
                        </p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-5 col-sm-5 col-12">
                    <div class="footer-widget">
                        <h2 class="fw-title"> <span><?php echo $this->lang->line('quick_link'); ?></span></h2>
                        <ul class="links">
                            <li><a href="<?php echo site_url('admission'); ?>"><?php echo $this->lang->line('admission'); ?></a></li>
                            <li><a href="<?php echo site_url('news'); ?>"><?php echo $this->lang->line('news'); ?></a></li>
                            <li><a href="<?php echo site_url('notice'); ?>"><?php echo $this->lang->line('notice'); ?></a></li>
                            <li><a href="<?php echo site_url('holiday'); ?>"><?php echo $this->lang->line('holiday'); ?></a></li>
                            <li><a href="<?php echo site_url('events'); ?>"><?php echo $this->lang->line('event'); ?></a></li>
                            <li><a href="<?php echo site_url('galleries'); ?>"><?php echo $this->lang->line('gallery'); ?></a></li>
                            <li><a href="<?php echo site_url('teachers'); ?>"><?php echo $this->lang->line('teacher'); ?></a></li>
                            <li><a href="<?php echo site_url('staff'); ?>"><?php echo $this->lang->line('staff'); ?></a></li>
                            <li><a href="<?php echo site_url('contact'); ?>"><?php echo $this->lang->line('contact_us'); ?></a></li>
                            <?php if(isset($footer_pages) && !empty($footer_pages)){ ?>
                               <?php foreach($footer_pages AS $obj ){ ?>
                                    <li><a href="<?php echo site_url('page/'.$obj->page_slug); ?>"><?php echo $obj->page_title; ?></a></li>
                                <?php } ?> 
                            <?php } ?> 
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-5 col-sm-5 col-12">
                    <div class="footer-widget">
                        <h2 class="fw-title"><?php echo $this->lang->line('social_link'); ?></h2>
                        <ul class="social">
                            <?php if(isset($this->setting->facebook_url) && !empty($this->setting->facebook_url)){ ?>
                                <li><a href="<?php echo $this->setting->facebook_url; ?>" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
                            <?php } ?> 
                            <?php if(isset($this->setting->twitter_url)  && !empty($this->setting->twitter_url)){ ?>
                                <li><a href="<?php echo $this->setting->twitter_url; ?>" target="_blank"><i class="fab fa-twitter"></i></a></li>
                            <?php } ?>                             
                            <?php if(isset($this->setting->linkedin_url)  && !empty($this->setting->linkedin_url)){ ?>
                                <li><a href="<?php echo $this->setting->linkedin_url; ?>" target="_blank"><i class="fab fa-linkedin-in"></i></a></li>
                            <?php } ?>                             
                            <?php if(isset($this->setting->google_plus_url)  && !empty($this->setting->google_plus_url)){ ?>
                                <li><a href="<?php echo $this->setting->google_plus_url; ?>" target="_blank"><i class="fab fa-google-plus-g"></i></a></li>
                            <?php } ?>                              
                            <?php if(isset($this->setting->youtube_url)  && !empty($this->setting->youtube_url)){ ?>
                                <li><a href="<?php echo $this->setting->youtube_url; ?>" target="_blank"><i class="fab fa-youtube"></i></a></li>
                            <?php } ?>                              
                            <?php if(isset($this->setting->instagram_url)  && !empty($this->setting->instagram_url)){ ?>
                                <li><a href="<?php echo $this->setting->instagram_url; ?>" target="_blank"><i class="fab fa-instagram"></i></a></li>
                            <?php } ?>                              
                            <?php if(isset($this->setting->pinterest_url)  && !empty($this->setting->pinterest_url)){ ?>
                                <li><a href="<?php echo $this->setting->pinterest_url; ?>" target="_blank"><i class="fab fa-pinterest-p"></i></a></li>
                            <?php } ?> 
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-7 col-sm-7 col-12">
                    <div class="footer-widget">
                        <h2 class="fw-title"><?php echo $this->lang->line('get_in_touch'); ?></h2>
                        <ul class="address">
                            <li><span class="icon"><i class="fas fa-phone"></i></span> 
                                <?php if(isset($this->setting->phone)){ ?>
                                     <?php echo $this->setting->phone; ?>
                                <?php } ?> 
                            </li>
                            <li><span class="icon"><i class="fas fa-envelope"></i></span>
                                <?php if(isset($this->setting->email)){ ?>
                                     <?php echo $this->setting->email; ?>
                                <?php } ?>
                            </li>
                            <li><span class="icon"><i class="fas fa-map-marker-alt"></i></span> 
                                <?php if(isset($this->setting->address)){ ?>
                                     <?php echo $this->setting->address; ?>
                                <?php } ?>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container text-center">
            <p class="copyright">
                <?php if(isset($this->setting->footer)){ ?>                            
                    <?php echo $this->setting->footer; ?>                
                <?php } ?>                 
            </p>
        </div>
    </div>
</footer>
