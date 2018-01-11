<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ExpertDetails.aspx.cs" Inherits="ExpertDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 207px;
        }
        .auto-style6 {
            width: 207px;
            height: 37px;
        }
        .auto-style7 {
            height: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Manage Expert</h2>
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">Username:</td>
            <td>
                <asp:Label ID="lblExpUsername" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">First Name:</td>
            <td>
                <asp:Label ID="lblExpFirstName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Last Name:</td>
            <td>
                <asp:Label ID="lblExpLastName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Email:</td>
            <td class="auto-style7">
                <asp:Label ID="lblExpEmail" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Phone Number:</td>
            <td>
                <asp:Label ID="lblExpPhoneNumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Gender:</td>
            <td>
                <asp:Label ID="lblExpGender" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    Expert ID =
    <asp:Label ID="lblExpId" runat="server"></asp:Label>
    <br />
    <asp:ImageButton ID="btnAccept" runat="server" Height="100px" ImageUrl="~/Images/AcceptBtn.png" OnClick="btnAccept_Click" />
    &nbsp;<asp:ImageButton ID="btnReject" runat="server" Height="100px" ImageUrl="~/Images/RejectBtn.png" OnClick="btnReject_Click" />
    <br />

</asp:Content>

