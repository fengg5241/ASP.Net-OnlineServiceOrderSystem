<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="UserSignup.aspx.cs" Inherits="UserSignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="~/Styles/UserSignUp.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
         h2 {
    text-decoration: underline;
    font-weight: bold;
    font-size: 65px;
    color: #003399; 
    text-shadow: 2px 2px 4px #ffffff;
}
.para2{
         font-style: italic;
         font-weight: bold;
            font-size: 20px;
            font-family: 'Tempus Sans ITC';
            color: white;
}
 body{
            
            font-size: 100%;
           
}
 .Button{
     font-family: 'Trebuchet MS';
 }
        .table {
            width: 50%;
            border: 2px solid black;
            border-radius: 5px;
             font-family: 'Trebuchet MS';
             
        }
        .auto-style49 {
            width: 120px;
        }
        .auto-style52 {
            height: 37px;
        }
        .auto-style53 {
            width: 199px;
        }
        .auto-style54 {
            width: 69px;
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
                        color = "darkblue";
                        break;
                }
                password_strength.innerHTML = strength;
                password_strength.style.color = color;
            }
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Create Your Account</h2>
    <p class="para2">Come & join as part of our website now! Already have an acccount?&nbsp;<asp:LinkButton ID="btnSignIn" runat="server" OnClick="btnSignIn_Click" >Sign In</asp:LinkButton></p>
    
    <table class="table">
        <tr>
                
                <th colspan="4" class="auto-style52">
                    Registration
                </th>
                
    </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpUserName" runat="server" Text="Username:"></asp:Label>
                <br />
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbUserName" runat="server" placeholder="Enter a unique username" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="tbUserName" ErrorMessage="* Please enter a username that allows us to uniquely identify you." ForeColor="Red">*</asp:RequiredFieldValidator>
                <br />
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpFName" runat="server" Text="First Name:"></asp:Label>
                <br />
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbUserFName" runat="server" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserFName" runat="server" ControlToValidate="tbUserFName" ErrorMessage="* Please enter your first name." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblUserLName" runat="server" Text="Last Name:"></asp:Label>
                <br />
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbUserLName" runat="server" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserLName" runat="server" ControlToValidate="tbUserLName" ErrorMessage="* Please enter a last name" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblUserPwd" runat="server" Text="Password:"></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style53">
               
                <asp:TextBox ID="tbUserPwd" runat="server" TextMode="Password" onkeyup="CheckPasswordStrength(this.value)" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server" ControlToValidate="tbUserPwd" ErrorMessage="* Password field cannot be blank!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54"><span id="password_strength">
                        <asp:Label ID="userPwdStrengthChckr" runat="server"></asp:Label>
                         <br />
                         </span></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblUserCfmPwd" runat="server" Text="Confirm Password:"></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbUserCfmPwd" runat="server" TextMode="Password" onkeyup="CheckPasswordStrength(this.value)" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvUserCfmPwd" runat="server" ControlToValidate="tbUserCfmPwd" ErrorMessage="*Confirm password field cannot be blank!" ForeColor="Red">*</asp:RequiredFieldValidator>
                <br />
            </td>
            <td class="auto-style54">
                &nbsp;</td>
            <td>
                <asp:CompareValidator ID="cvUserPwd" runat="server" ControlToCompare="tbUserPwd" ControlToValidate="tbUserCfmPwd" ErrorMessage="*Password mismatch*" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblUserEmail" runat="server" Text="Email:"></asp:Label>
                <br />
                <br />
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbUserEmail" runat="server" placeholder="Someone@example.com" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvUserEmail" runat="server" ControlToValidate="tbUserEmail" ErrorMessage="* Email field cannot be blank!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblUserDOB" runat="server" Text="Date Of Birth:"></asp:Label>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbDateOfBirth" runat="server" Width="224px" TextMode="Date"></asp:TextBox>
                <br /></td>
            <td class="auto-style54"> </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <hr />
            </td>
        </tr>
            <tr>
                <th colspan="4" class="auto-style14">
                    Additional Information
                </th>
    </tr>
        <tr>
            <td class="auto-style3">
                Address:</td>
            <td class="auto-style40" colspan="2">
                <asp:TextBox ID="tbUserAddr" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td class="auto-style37">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                Postal Code:</td>
            <td class="auto-style40" colspan="2">
                Singapore
                <asp:TextBox ID="tbPostalCode" runat="server" Width="189px" placeholder="123456"></asp:TextBox>
            </td>
            <td class="auto-style37">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserPhoneNo" runat="server" Text="Phone Number:"></asp:Label>

            </td>
            <td class="auto-style40" colspan="2">
               <asp:TextBox ID="tbUserPhoneNo" runat="server" Width="224px" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvUserPhone" runat="server" ControlToValidate="tbUserPhoneNo" ErrorMessage="*Please enter a phone number for easy identitfication." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style37">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblUserGender" runat="server" Text="Gender:"></asp:Label>

            </td>
            <td class="auto-style40" colspan="2">
                <asp:RadioButtonList ID="rblUserGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                        </asp:RadioButtonList>
            </td>
            <td class="auto-style37">
                <asp:RequiredFieldValidator ID="rvUserGender" runat="server" ControlToValidate="rblUserGender" ErrorMessage="*Please select a gender." ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="4">
                <hr />

            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please note:" ShowMessageBox="True" ShowSummary="False" />

            </td>
        </tr>
    </table>
    <br />
<asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />

    <div class="Button"><asp:Button ID="btnSignUp" runat="server" Text="Sign Up" Width="194px" OnClick="btnSignUp_Click" /></div>
    <br />
</asp:Content>

