<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ScheduleMeeting.aspx.cs" Inherits="ScheduleMeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Select a Date & Time</h2>
    <p>Please enter a date you are free and your preffered timing for the meeting.</p>
    <asp:Label ID="lblExpEmail" runat="server"></asp:Label>
    <br />
    Date:
    <asp:TextBox ID="tbDate" runat="server" TextMode="Date"></asp:TextBox>
    <br />
    <br />
    Time:
    <asp:TextBox ID="tbTime" runat="server" TextMode="Time"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
    <br />

</asp:Content>

