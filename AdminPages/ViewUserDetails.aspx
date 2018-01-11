<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewUserDetails.aspx.cs" Inherits="ViewUserDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>View User Details</h1>
    <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="userId" OnRowDeleting="gvUser_RowDeleting" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnSelectedIndexChanged="gvUser_SelectedIndexChanged" Height="249px" Width="833px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="userId" HeaderText="User ID" />
            <asp:BoundField DataField="userName" HeaderText="UserName" />
            <asp:BoundField DataField="userFName" HeaderText="First Name" />
            <asp:BoundField DataField="userLName" HeaderText="Last Name" />
            <asp:BoundField DataField="userEmail" HeaderText="Email" />
            <asp:BoundField DataField="userPassword" HeaderText="Password" />
            <asp:BoundField DataField="userHp" HeaderText="Phone No" />
            <asp:BoundField DataField="userGender" HeaderText="Gender" />
            <asp:BoundField DataField="userDateOfBirth" HeaderText="Date Of Birth" />
            <asp:CommandField ShowSelectButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:CommandField ShowEditButton="True" />
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

</asp:Content>

