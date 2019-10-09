<!DOCTYPE html>
<html>
<head>      

        <title><?php echo $this->lang->line('generate'); ?> <?php echo $this->lang->line('certificate'); ?></title>
        <link rel="icon" href="<?php echo IMG_URL; ?>favicon.ico" type="image/x-icon" />        
         <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Allerta+Stencil" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Fira+Sans+Extra+Condensed" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Limelight" rel="stylesheet">  
        <link href="https://fonts.googleapis.com/css?family=Michroma" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css?family=Prosto+One" rel="stylesheet">         
        <!-- Bootstrap -->
        <link href="<?php echo VENDOR_URL; ?>bootstrap/bootstrap.min.css" rel="stylesheet">       
        <!-- Custom Theme Style -->
        <link href="<?php echo CSS_URL; ?>custom.css" rel="stylesheet">
        
        <style>
            body {background: #fff;}
            @page { margin: 0; }   
            @media print {
                .certificate {                   
                    background: url("<?php echo UPLOAD_PATH; ?>certificate/<?php echo $certificate->background; ?>") no-repeat !important;    
                    min-height: 550px;
                    padding: 10%;
                    width: 100%;
                    margin-left: auto;
                    margin-right: auto;
                    background-size: 100% 100% !important;
                   -webkit-print-color-adjust: exact !important; 
                    color-adjust: exact !important; 
                    text-align: center;
                }              
            } 
   
            .certificate {
                min-height: 550px;
                margin-left: auto;
                margin-right: auto;
                padding: 80px 120px;
                background: url("<?php echo UPLOAD_PATH; ?>certificate/<?php echo $certificate->background; ?>") no-repeat;    
                background-size: 100% 100%;
                -webkit-print-color-adjust: exact !important;
                color-adjust: exact !important;
                text-align: center;
            }
            .x_content{
                width:98%;
            }

    </style>
    </head>

    <body>
        <div class="x_content">
             <div class="row">
                 <div class="col-sm-12">                 
                    <div class="certificate">

                        <div class="certificate-top">
                            <h2 class="top-heading-title"><?php echo $certificate->top_title; ?></h2>
                           <div class="row">
                                <span class="sub-title-img">
                                    <img src="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $settings->logo; ?>" alt="" width="70" />
                                </span> 
                           </div>
                        </div>

                        <div class="name-ection">
                            <div class="row" >
                                <div class="col-sm-12" style="text-align:center;">
                                    <div class="name-text"><?php echo $certificate->name; ?></div>
                                </div>
                            </div>
                        </div>

                        <div class="main-text-block">
                            <p class="main-text">
                                <?php echo $certificate->main_text; ?>
                            </p>
                        </div>
                        <div class="footer-section">
                            <div class="row" >
                                <div class="col-sm-4 <?php if($certificate->footer_left){ echo 'footer_text'; } ?>"><?php echo $certificate->footer_left; ?></div>
                                <div class="col-sm-4 <?php if($certificate->footer_middle){ echo 'footer_text'; } ?>"><?php echo $certificate->footer_middle; ?></div>
                                <div class="col-sm-4 <?php if($certificate->footer_right){ echo 'footer_text'; } ?>"><?php echo $certificate->footer_right; ?></div>
                            </div>
                        </div>
                    </div>                 
                 </div>
             </div>

            <!-- this row will not appear when printing -->
            <center class="row no-print">
                <div class="col-xs-12">
                    <button class="btn btn-default" onclick="window.print();"><i class="fa fa-print"></i> <?php echo $this->lang->line('print'); ?></button>
                </div>
            </center>
        </div>
    </body>
</html>