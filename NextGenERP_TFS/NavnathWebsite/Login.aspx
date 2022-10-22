<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NavnathWebsite.Login"%>




<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
 

  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>SM | Login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css"/>
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css"/>
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="dist/css/skins/skin-blue.min.css"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
 
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition login-page">
<form id="Form1" runat="server">
    <div class="login-box">
  <div class="login-logo">
    <a href="http://app.standardmetalspune.com"><b>Standard</b>Metals | Books</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Standard Metals Books - Please Log In</p>

    <form action="../../index2.html" method="post">
      <div class="form-group has-feedback">
        <%--<input type="email" class="form-control" placeholder="Email">--%>
          
          <asp:TextBox runat="server" ID="txtusername" CssClass="form-control" 
              ontextchanged="txtusername_TextChanged" />
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" TextMode="Password" />
        <%--<input type="password" class="form-control" placeholder="Password">--%>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" /> Remember Me
            </label>
             
          </div>
           <asp:CheckBox ID="CheckBox1" runat="server" Text="New Remember Me"/>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <%--<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>--%>
            <asp:Button runat="server" ID="btnlogin" Text="Sign In"  
                class="btn btn-primary btn-block btn-flat" onclick="btnlogin_Click" />
        </div>
        <!-- /.col -->
      </div>
    </form>

    

    <a href="mailto:shirkeamy@gmail.com,nextgensofttec@gmail.com">I forgot my password</a><br/>
    
    <p> <small>Designed & Developed by <b>NextGen SoftTech</b></small></p>
  </div>
        
  <!-- /.login-box-body -->
</div>

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
</script>


<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</form>
</body>
</html>