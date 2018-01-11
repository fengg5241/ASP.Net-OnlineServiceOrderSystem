<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ForgotPassword2.aspx.cs" Inherits="ForgotPassword2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        h1{
            text-align: center;
        }
    .Welcome{
        text-align: center;
        font-size: 25px;
    }
    .Message{
        text-align: center;
        color: blue;
    }
        .updateBtn{
            text-align: center;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 38px;
        }
        .auto-style3 {
            height: 38px;
            width: 116px;
        }
        .auto-style4 {
            width: 116px;
        }
        .auto-style7 {
            height: 38px;
            width: 419px;
        }
        .auto-style8 {
            width: 419px;
        }
        .auto-style9 {
            height: 38px;
            width: 257px;
        }
        .auto-style10 {
            width: 257px;
        }
    </style>
    <script type="text/javascript">
            function CheckPasswordStrength(password) {
                var password_strength = document.getElementById("password_strength");
 
                //TextBox left blank.
                if (password.length == 0) {
                    password_strength.innerHTML = "";
                    return;
                }
 
                //Regular Expressions.
                var regex = new Array();
                regex.push("[A-Z]"); //Uppercase Alphabet.
                regex.push("[a-z]"); //Lowercase Alphabet.
                regex.push("[0-9]"); //Digit.
                regex.push("[$@$!%*#?&]"); //Special Character.
 
                var passed = 0;
 
                //Validate for each Regular Expression.
                for (var i = 0; i < regex.length; i++) {
                    if (new RegExp(regex[i]).test(password)) {
                        passed++;
                    }
                }
 
                //Validate for length of Password.
                if (passed > 2 && password.length > 8) {
                    passed++;
                }
 
                //Display status.
                var color = "";
                var strength = "";
                switch (passed) {
                    case 0:
                    case 1:
                        strength = "Weak";
                        color = "red";
                        break;
                    case 2:
                        strength = "Good";
                        color = "darkorange";
                        break;
                    case 3:
                    case 4:
                        strength = "Strong";
                        color = "green";
                        break;
                    case 5:
                        strength = "Very Strong";
                        color = "darkgreen";
                        break;
                }
                password_strength.innerHTML = strength;
                password_strength.style.color = color;
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Password Recovery</h1>&nbsp;<div class="Welcome"><asp:Label ID="lblWelcome" runat="server" ForeColor="#CCFFFF"></asp:Label>
&nbsp;You may now reset your password.</div><br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style7">
                &nbsp;</td>
            <td class="auto-style3">User Name:</td>
            <td class="auto-style9">
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8"></td>
            <td class="auto-style4"><asp:Label ID="lblNewPwd" runat="server" Text="New Password:"></asp:Label></td>
            <td class="auto-style10"><asp:TextBox ID="tbNewPwd" runat="server" TextMode="Password" onkeyup="CheckPasswordStrength(this.value)" Width="239px"></asp:TextBox></td>
            <td>
                <span id="password_strength">
                        <asp:Label ID="userPwdStrengthChckr" runat="server"></asp:Label>
                         </span>

            </td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style4"><asp:Label ID="lblCfmPwd" runat="server" Text="Confirm Password:"></asp:Label></td>
            <td class="auto-style10"><asp:TextBox ID="tbCfmPwd" TextMode="Password" onkeyup="CheckPasswordStrength(this.value)" runat="server" Width="239px"></asp:TextBox></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">&nbsp;</td>
            <td colspan="2">
               <div class="Message"><asp:Label ID="lblMessage" runat="server"></asp:Label></div> 
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
     <div class="updateBtn">
        <asp:Button ID="btnUpdate" runat="server" Text="Update Password" OnClick="btnUpdate_Click" />
    </div>
</asp:Content>

