<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertMasterPage.master" AutoEventWireup="true" CodeFile="ExpertEditProfile.aspx.cs" Inherits="ExpertProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        h2 {
            text-align: center;
        }

        .auto-style3 {
            width: 251px;
        }

        .auto-style6 {
            width: 251px;
            height: 32px;
        }

        .auto-style7 {
            height: 32px;
        }

        .auto-style8 {
            width: 251px;
            height: 37px;
        }

        .auto-style9 {
            height: 37px;
        }

        .auto-style10 {
            width: 251px;
            height: 43px;
        }

        .auto-style11 {
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>Edit Your Profile</h2>
    <table style="width: 100%;">
        <tr>
            <td rowspan="11">
                <asp:Image ID="imgPhoto" runat="server" ImageUrl="~/Images/DefaultPhoto.png" Width="250px" Height="250px" />
            </td>
            <td class="auto-style9" colspan="2">
                <asp:Label ID="lblId" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Username:</td>
            <td class="auto-style9">
                <asp:TextBox ID="tbExpUserName" runat="server" Width="254px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">First Name:</td>
            <td class="auto-style9">
                <asp:TextBox ID="tbExpFirstName" runat="server" Width="254px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Last Name:</td>
            <td class="auto-style9">
                <asp:TextBox ID="tbExpLastName" runat="server" Width="254px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Email:</td>
            <td class="auto-style7">
                <asp:Label ID="lblExpEmail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Phone Number:</td>
            <td>
                <asp:TextBox ID="tbExpPhoneNumber" runat="server" Width="231px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Gender:</td>
            <td class="auto-style11">
                <asp:RadioButtonList ID="rblExpGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Address:</td>
            <td>
                <asp:TextBox ID="tbExpAddress" runat="server" Width="399px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                New Photo:<br />
                (Only .jpg allowed. Max 1MB)
            </td>
            <td>
                <asp:FileUpload ID="fuPhoto" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnProfileView" runat="server" Text="View Profile" OnClick="btnProfileView_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

