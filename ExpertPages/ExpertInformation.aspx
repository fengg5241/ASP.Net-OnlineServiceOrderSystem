<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ExpertInformation.aspx.cs" Inherits="ExpertInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 150px;
        }
        .auto-style6 {
            width: 259px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>EXPERT DETAILS</h1>
    <asp:LinkButton ID="btnBack" runat="server">&lt;&lt; Back to Expert List</asp:LinkButton>
    <br />
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">Username:</td>
            <td class="auto-style6">
                <asp:Label ID="UserNameLabel" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Approved/Enabled: </td>
            <td class="auto-style6">
                <asp:CheckBox ID="IsApproved" runat="server" OnCheckedChanged="IsApproved_CheckedChanged" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Locked Out:</td>
            <td class="auto-style6">
                <asp:Label ID="LastLockoutDateLabel" runat="server"></asp:Label>
                <br />
                <asp:Button ID="UnlockUserButton" runat="server" Text="Unlock Expert" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:Label ID="StatusMessage" runat="server"></asp:Label>
    <br />

</asp:Content>

