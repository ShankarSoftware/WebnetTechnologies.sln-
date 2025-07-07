<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="forgetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0"/>
	<link rel="shortcut icon" type="image/x-icon" href="logo/Webnet-Logo.png"/>
 <title>Forgot Password</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet"/>
 <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
 <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css"/>
 <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
    <style>
    	.account-logo img {
    		width: 70%;
    	}

    	.account-title {
    		font-weight: bold;
    	}

    	body {
    		background-size: cover;
    		background-repeat: no-repeat;
    		background-image: url(backgroundimg.jpg) !important;
    	}

    	.account-box {
    		margin-top: 25%;
    		border-top: 5px solid #13726a;
    	}

    	.form-control {
    		border-radius: 10px;
    	}
    </style>
     <script type="text/javascript">
         function validate() {
             var txtEmpId = document.getElementById('<%=txtEmpId.ClientID%>').value;
             if (txtEmpId == "") {
                 alert("Enter Employee Id");
                 document.getElementById('<%=txtEmpId.ClientID%>').focus();
                 return false;
             }
         }
         function validate1() {
             var OTP = document.getElementById('<%=txtOTP.ClientID%>').value;
             if (OTP == "") {
         alert("Enter OTP");
                  document.getElementById('<%=txtOTP.ClientID%>').focus();
                  return false;
              }
          }
     </script>
</head>
<body>
    <form id="form1" runat="server">
       <div class="main-wrapper">
	<div class="account-page">
		<div class="container">
			<h3 class="account-title"> </h3>
			<div class="account-box">
				<div class="account-wrapper">
               <div class="account-logo">
                   <a href="#">
                       <img src="logo/Webnet-Logo.png" alt="Webnet Technologies" /></a>
               </div>
               <div class="form-group form-focus">
                   <label class="control-label">Employee ID</label>
                   <%--<input class="form-control floating" type="text">--%>
                   <asp:TextBox ID="txtEmpId" class="form-control floating" type="text" runat="server"></asp:TextBox>
               </div>
               <div class="form-group form-focus" runat="server" id="OtpField">
                    <label class="control-label">Enter OTP</label>
                    <asp:TextBox ID="txtOTP" class="form-control floating" type="password" runat="server"></asp:TextBox>
               </div>
                    <asp:Label ID="SuccessMessage" runat="server" ></asp:Label>
           <asp:Label ID="ErrorMessage" runat="server" ></asp:Label>
               <div class="form-group text-center" runat="server" id="ResetPassWord">
                   <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block account-btn" type="submit" Style="border-radius: 10px" Text="Reset Password" OnClientClick="return validate();" OnClick="SendEmpIdAndOtp_method" />
                   <%--<button class="btn btn-primary btn-block account-btn" type="submit" style="border-radius:10px">Reset Password</button>--%>
               </div>
           <div class="form-group text-center" runat="server" id="SubmitOtp">
               <asp:Button ID="Button2" runat="server" class="btn btn-primary btn-block account-btn" type="submit" Style="border-radius: 10px" Text="Submit" OnClientClick="return validate1();" OnClick="SubmitOtp_method" />
               <%--<button class="btn btn-primary btn-block account-btn" type="submit" style="border-radius:10px">Reset Password</button>--%>
           </div>
               <div class="text-center">
                   <a href="Index.aspx" style="font-weight: bold;">Back to Login</a>
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
