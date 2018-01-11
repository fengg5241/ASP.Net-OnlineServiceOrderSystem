<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="BlockListPage.aspx.cs" Inherits="BlockListPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Block /Unblock List</h1>
    <br />
    <asp:GridView ID="gvBlockList" runat="server" AutoGenerateColumns="False" Height="200px" Width="900px" OnRowEditing="gvBlockList_RowEditing" OnRowUpdating="gvBlockList_RowUpdating" OnSelectedIndexChanged="gvBlockList_SelectedIndexChanged1" DataKeyNames="Id"     >
         
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Expert ID" />
            <asp:BoundField DataField="UserName" HeaderText="Username" ReadOnly="True" />
            <asp:BoundField HeaderText="Gender" ReadOnly="True" DataField="Gender" />
            <asp:BoundField HeaderText="Date Of Birth" DataField="DateOfBirth" ReadOnly="True" />
            <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />
            <asp:BoundField DataField="Enabled" HeaderText="Enable" />
            <asp:CommandField CausesValidation="False" ShowEditButton="True" />
            <asp:ButtonField Text="Send Email" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <br />
</asp:Content>

