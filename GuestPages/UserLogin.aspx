<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="~/Styles/UserLogin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
body {
        text-align: center;
        position: relative;
        font-size: 100%;
        font-family: 'Century Gothic';
        background: url(../Images/userbg.jpg) no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
}
h2 {
    text-decoration: underline;
    font-weight: bold;
    text-align: center;
    font-size: 65px;
    color: #003399; 
    text-shadow: 2px 2px 4px #ffffff;
}
p{
    font-style: italic;
         font-weight: bold;
             text-align:center;
            font-size: 20px;
            font-family: 'Tempus Sans ITC';
            color: floralwhite;
}
.SignInBtn{
   border-radius: 12px;
}
button1{
    border-radius: 12px;
}
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 362px;
        }
        .auto-style11 {
            height: 52px;
            width: 362px;
        }
        .auto-style15 {
            height: 76px;
            width: 362px;
        }
        .auto-style17 {
            height: 52px;
            width: 520px;
        }
        .auto-style18 {
            width: 520px;
        }
        .auto-style19 {
            width: 520px;
            text-align: center;
        }
        .auto-style20 {
            height: 76px;
            width: 520px;
        }
        .auto-style21 {
            width: 34%;
        }
        .auto-style22 {
            width: 362px;
            height: 53px;
        }
        .auto-style23 {
            width: 520px;
            text-align: center;
            height: 53px;
        }
        .auto-style24 {
            height: 53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>User Login</h2>
    <p>Please enter your email and password to login.
        </p>
        <table class="table">
        <tr>
            <td class="auto-style11">
                &nbsp;</td>
            <td class="auto-style17">
                <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                <br />
                <asp:TextBox ID="tbUserEmail" runat="server" Height="31px" Width="298px" TextMode="Email"></asp:TextBox>
            </td>
            <td rowspan="4">
                <asp:Image ID="imgUser" runat="server" Height="398px" ImageUrl="~/Images/UserLogo.png" Width="417px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                </td>
            <td class="auto-style18">
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                <br />
                <asp:TextBox ID="tbUserPwd" runat="server" Height="30px" Width="298px" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style19">
                <asp:Label ID="lblCheck" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                &nbsp;</td>
            <td class="auto-style20">
                <div class="SignInBtn"><asp:Button ID="btnSignIn" runat="server" Height="50px"  Text="Sign In" Width="241px" backcolor="black" bordercolor="#CCCCCC" borderstyle="Double" forecolor="white" OnClick="btnSignIn_Click"  /></div>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">
                <asp:Label ID="lblQuestion" runat="server" Text="Don't have an account?"></asp:Label>
      &nbsp;<asp:LinkButton ID="BtnSignUp" runat="server" OnClick="BtnSignUp_Click">Sign Up</asp:LinkButton>
           
                
                
            </td>
            <td class="auto-style23">
                 <div style="text-align: left; margin: auto;" class="auto-style21">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="189px">
                    <asp:ListItem>Remember Me</asp:ListItem>
                </asp:CheckBoxList>
                     </div>
            &nbsp; </td>
            <td class="auto-style24">
                <asp:LinkButton ID="btnUserForgetPwd" runat="server" OnClick="btnUserForgetPwd_Click">Forgot your password?</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style19">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        </table>
    
</asp:Content>

