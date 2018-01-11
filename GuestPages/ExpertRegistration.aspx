<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ExpertRegistration.aspx.cs" Inherits="ExpertRegistration" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
            width: 7px;
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
    <h2>Create Your Account</h2>
    <p class="para2">Come & join as part of our website now! Already have an acccount?<asp:LinkButton ID="btnSignIn" runat="server" OnClick="btnSignIn_Click" >Sign In</asp:LinkButton></p>
    
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
                <asp:TextBox ID="tbExpUserName" runat="server" placeholder="Enter a unique username" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvExpUserName" runat="server" ControlToValidate="tbExpUserName" ErrorMessage="*Please enter a unique username that allows us to uniquely identify you." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpFName" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbExpFName" runat="server" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvExpFName" runat="server" ControlToValidate="tbExpFName" ErrorMessage="*Please enter your first name!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpLName" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbExpLName" runat="server" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvExpLName" runat="server" ControlToValidate="tbExpLName" ErrorMessage="*Please enter your last name!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpPwd" runat="server" Text="Password:"></asp:Label>
            </td>
            <td class="auto-style53">
               
                <asp:TextBox ID="tbExpPwd" runat="server" TextMode="Password" onkeyup="CheckPasswordStrength(this.value)" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvExpPassword" runat="server" ControlToValidate="tbExpPwd" ErrorMessage="*Password field cannot be blank!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54"><span id="password_strength">
                        <asp:Label ID="userPwdStrengthChckr" runat="server"></asp:Label>
                         </span></td>
            <td>
                <asp:CompareValidator ID="cvExpPwd" runat="server" ControlToCompare="tbExpPwd" ControlToValidate="tbExpCfmPwd" ErrorMessage="*Password mismatch*" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpCfmPwd" runat="server" Text="Confirm Password:"></asp:Label>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbExpCfmPwd" runat="server" TextMode="Password" onkeyup="CheckPasswordStrength(this.value)" Width="224px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvExpCfmPwd" runat="server" ControlToValidate="tbExpCfmPwd" ErrorMessage="*Confirm password field cannot be blank!" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpEmail" runat="server" Text="Email:"></asp:Label>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbExpEmail" ControlToValidate="tbUserEmail" runat="server" placeholder="Someone@exameple.com" Width="224px"></asp:TextBox>
                <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="tbExpEmail" ForeColor="Red" ErrorMessage="*Email field cannot be blank!" ID="rvExpEmail" >*</asp:RegularExpressionValidator>
            </td>
            <td class="auto-style54">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style49">
                <asp:Label ID="lblExpDOB" runat="server" Text="Date Of Birth:"></asp:Label>
            </td>
            <td class="auto-style53">
                <asp:TextBox ID="tbExpDOB" runat="server" Width="224px" TextMode="Date"></asp:TextBox>
            </td>
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
                <asp:Label ID="lblExpAddress" runat="server" Text="Address:"></asp:Label>
                <br /> 
            </td>
            <td class="auto-style39" colspan="2">
                <asp:TextBox ID="tbExpAddress" runat="server" placeholder="Street Address, Block Number, Unit Number, Postal Code/Zip Code" Width="344px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvExpAddress" runat="server" ControlToValidate="tbExpAddress" ErrorMessage="*Please provide an address for identification purposes." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblExpPhoneNo" runat="server" Text="Phone Number:"></asp:Label>

            </td>
            <td class="auto-style40" colspan="2">
               <asp:TextBox ID="tbExpPhoneNo" runat="server" Width="224px" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvExpHp" runat="server" ControlToValidate="tbExpPhoneNo" ErrorMessage="*Phone Number field cannot be blank! Please provide a phone number so that we can contact you." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style37">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblExpGender" runat="server" Text="Gender:"></asp:Label>

            </td>
            <td class="auto-style40" colspan="2">
                <asp:RadioButtonList ID="rblExpGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                        </asp:RadioButtonList>
            </td>
            <td class="auto-style37">
                &nbsp;</td>
        </tr>
    </table>
    <br />
<asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />

    <div class="Button"><asp:Button ID="btnSignUp" runat="server" Text="Sign Up" Width="194px" OnClick="btnSignUp_Click" /></div>
    <br />
</asp:Content>

