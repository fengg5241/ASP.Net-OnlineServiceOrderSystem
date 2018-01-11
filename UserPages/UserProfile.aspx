<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        th {
            font-weight: bold;
            font-family: 'Trebuchet MS';
            text-decoration: underline;
            font-size: 35px;
        }

        .Welcome {
            font-family: 'Trebuchet MS';
            font-style: italic;
            font-size: 25px;
            color: #3399FF;
        }

        .auto-style1 {
        }

        .auto-style2 {
            width: 391px;
            border: 2px solid black;
            border-radius: 5px;
        }

        .auto-style4 {
            height: 37px;
            border: 2px solid black;
            border-radius: 5px;
        }

        .auto-style6 {
            height: 34px;
            border: 2px solid black;
        }

        .auto-style7 {
            height: 34px;
            width: 155px;
            border: 2px solid black;
        }

        .auto-style8 {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="4" class="auto-style8">
                <div class="Welcome">
                    <asp:Label ID="lblWelcome" runat="server"></asp:Label></div>
            </td>
        </tr>
        <tr>
            <th colspan="4" class="auto-style4">My Profile
            </th>
        </tr>
        <tr>
            <td class="auto-style2" rowspan="4">
                <asp:LinkButton ID="btnEdit" runat="server" OnClick="btnEdit_Click">Edit</asp:LinkButton>
                <br />
                Username:
                &nbsp;<asp:Label ID="lblUserName" runat="server"></asp:Label>
                <br />
                First Name:
                <asp:Label ID="lblUserFName" runat="server"></asp:Label>
                <br />
                Last Name:
                <asp:Label ID="lblUserLName" runat="server"></asp:Label>
                <br />
                Gender:
                &nbsp;<asp:Label ID="lblUserGender" runat="server"></asp:Label>
                <br />
                Date of Birth:
                &nbsp;<asp:Label ID="lblUserBirthdate" runat="server"></asp:Label>
                <br />
                Email:
                &nbsp;<asp:Label ID="lblUserEmail" runat="server"></asp:Label>
                <br />
                Address:
                <asp:Label ID="lblUserAddress" runat="server"></asp:Label>
                <br />
                Postal Code:
                <asp:Label ID="lblUserPostalCode" runat="server"></asp:Label>
                <br />
                Phone:
                &nbsp;<asp:Label ID="lblUserPhone" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblUserNewPwd" runat="server" Text="New Password:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="tbUserNewPwd" runat="server" Width="239px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:Label ID="lblCheck" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblUserCfmPwd" runat="server" Text="Confirm Password:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="tbUserCfmPwd" runat="server" Width="239px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2">
                <asp:Button ID="saveBtn" runat="server" Text="Save" OnClick="saveBtn_Click" />
                &nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
    </table>
    <br />

</asp:Content>

