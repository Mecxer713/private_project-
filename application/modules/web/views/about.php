<section class="page-breadcumb-area bg-with-black">
    <div class="container text-center">
        <h2 class="title"><?php echo $this->lang->line('about'); ?> <?php echo $this->lang->line('school'); ?></h2>
        <ul class="links">
            <li><a href="<?php echo site_url(); ?>"><?php echo $this->lang->line('home'); ?></a></li>
            <li><a href="javascript:void(0);"><?php echo $this->lang->line('about'); ?> <?php echo $this->lang->line('school'); ?></a></li>
        </ul>
    </div>
</section>

<?php if(isset($this->setting->about_text) && !empty($this->setting->about_text)){ ?>
<section class="top-banner-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                <div class="top-banner-content">
                    <h3 class="intro"><?php echo $this->lang->line('welcome_to'); ?></h3>
                    <h2 class="title">
                        <?php if(isset($this->setting->school_name)){ ?>
                            <?php echo $this->setting->school_name; ?>
                        <?php }else{ ?>
                              <?php echo SMS; ?>
                        <?php } ?>
                    </h2>
                    <div class="text">                        
                         <?php echo $this->setting->about_text; ?>                       
                    </div>                    
                </div>
            </div>            
            <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-center">
                <div class="top-banner-img">
                    <?php if(isset($this->setting->about_image) && !empty($this->setting->about_image)){ ?>
                            <img src="<?php echo UPLOAD_PATH; ?>about/<?php echo $this->setting->about_image; ?>" alt="">
                    <?php }else{ ?>
                            <img src="<?php echo IMG_URL; ?>about-image.jpg" alt="">
                    <?php } ?>                    
                </div>
            </div>
        </div>
    </div>
</section>
 <?php } ?> 
