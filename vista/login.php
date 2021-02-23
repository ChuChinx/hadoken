<?php
    session_start();

    if(isset($_SESSION['S_IDUSUARIO'])){ //si sesion existe redireccionar 
        header('Location: index.php');
    }
?>


<!DOCTYPE html>
<html style="height: 100vh;">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>SIS | Login</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="plantilla/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="plantilla/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="plantilla/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
        <!-- THEME STYLES-->
        <link href="plantilla/assets/css/main.css" rel="stylesheet" />
        <!-- PAGE LEVEL STYLES-->
        <link href="plantilla/assets/css/pages/auth-light.css" rel="stylesheet" />
    </head>

    <body class="bg-silver-300" style="height: 100vh;display: flex;align-items: center;background: linear-gradient(to right top, #309fc4, #fcbf036e);">
        <div class="content" style="width: 90%;max-width:500px;background-image: url(../img/maki_hadoken_logo.png);background-repeat: no-repeat;background-position: right;">
            
            <form id="login-form" action="javascript:;" method="post" style="border-radius: 10px;box-shadow: 0 30px 60px 0 rgb(0 0 0 / 30%);background: linear-gradient( to right bottom, rgb(255 251 251 / 70%), rgba(255, 255, 255, 0.3) );">
                <!-- <h2 class="login-title">Log in</h2>-->
                <div class="" style="text-align: center;padding: 0 0 15px;">
                    <img src="../img/Logo_Hadoken.png" alt="" class="">
                </div>
                <div class="form-group" style="margin-bottom: 2rem;">
                    <div class="input-group-icon right">
                        <div class="input-icon"><i class="fa fa-user"></i></div>
                        <input class="form-control" type="text" name="text" placeholder="Usuario" autocomplete="off" id="usuario" style="border: none;font-size: 18px;background: transparent;border-bottom: 1px solid #6badad;">
                    </div>
                </div>
                <div class="form-group" style="margin-bottom: 2rem;">
                    <div class="input-group-icon right">
                        <div class="input-icon"><i class="fa fa-lock font-16"></i></div>
                        <input class="form-control" type="password" name="password" placeholder="Password" id="password" style="border: none;font-size: 18px;background: transparent;border-bottom: 1px solid #6badad;">
                    </div>
                </div>
                <div class="form-group d-flex justify-content-between">
                    <label class="ui-checkbox ui-checkbox-info" style="font-size: 16px;">
                        <input type="checkbox">
                        <span class="input-span" style="border: 1px solid #fff;"></span>Recordarme</label>
                </div>
                <div class="form-group">
                    <button class="btn btn-info btn-block" style="border-radius: 5px;box-shadow: 0 10px 30px 0 rgb(95 186 233 / 75%);background: #43a4bd;font-size: 20px;cursor:pointer" onclick="Verificar_Usuario()">Login</button>
                </div>
                
            </form>
        </div>
        <!-- BEGIN PAGA BACKDROPS-->
        <div class="sidenav-backdrop backdrop"></div>
        <div class="preloader-backdrop">
            <div class="page-preloader">Loading</div>
        </div>
        <!-- END PAGA BACKDROPS-->
        <!-- CORE PLUGINS -->
        <script src="plantilla/assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
        <script src="plantilla/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
        <script src="plantilla/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL PLUGINS -->
        <script src="plantilla/assets/vendors/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="plantilla/assets/js/app.js" type="text/javascript"></script>
        <script src="../js/console_usuario.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <!-- PAGE LEVEL SCRIPTS-->
        <script type="text/javascript">
        </script>
    </body>

</html>