<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="logo/Webnet-Logo.png" />
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    <style>
        .account-logo img {
            width: 90%;
        }
        body {
            background-size: cover;
            background-repeat: no-repeat;
            background-image: url(backgroundimg.jpg) !important;
          
        }

        .account-box {
            margin-top: 20%;
            border-top: 5px solid #13726a;
        }

        .account-title {
            font-weight: bold;
        }

        .form-control {
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="account-page">
                <div class="container">
                    <h3 class="account-title"></h3>
                    <div class="account-box">
                        <div class="account-wrapper">
                            <div class="account-logo">
                                <a href="#">
                                    <img src="logo/Webnet-Logo.png" alt="Webnet-logo" /></a>
                            </div>
                            <div class="form-group form-focus">
                                <label class="control-label">User id </label>
                                <asp:TextBox ID="txtUserName" runat="server" class="form-control floating"></asp:TextBox>
                            </div>
                            <div class="form-group form-focus">
                                <label class="control-label">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" class="form-control floating" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group text-center">

                                <asp:Button ID="btnSubmit" runat="server" Text="Login" class="btn btn-primary btn-block account-btn" OnClick="Button1_Click" Style="border-radius: 10px" />
                            </div>
                            <div id="td_message" runat="server" style="text-align: center; color: black; margin-top: 20px;"></div>
                            <div class="text-center">
                                <a href="forgetpassword.aspx" style="font-weight:bold;">Forgot your password?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="sidebar-overlay" data-reff="#sidebar"></div>
    <script type="text/javascript" src="assets/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assets/js/app.js"></script>
</body>
</html>
