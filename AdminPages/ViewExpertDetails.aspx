<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewExpertDetails.aspx.cs" Inherits="ViewExpertDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Expert Details</h1>
    
<br />
<asp:GridView ID="gvExpert" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="gvExpert_RowDeleting" DataKeyNames="expId" OnRowCancelingEdit="gvExpert_RowCancelingEdit" OnRowEditing="gvExpert_RowEditing" OnRowUpdating="gvExpert_RowUpdating" OnSelectedIndexChanged="gvExpert_SelectedIndexChanged">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="expId" HeaderText="Expert ID" />
        <asp:BoundField DataField="expUserName" HeaderText="Username" />
        <asp:BoundField DataField="expFName" HeaderText="First Name" />
        <asp:BoundField DataField="expLName" HeaderText="Last Name" />
        <asp:BoundField DataField="expEmail" HeaderText="Email" />
        <asp:BoundField DataField="expPassword" HeaderText="Password" />
        <asp:BoundField DataField="expAddress" HeaderText="Address" />
        <asp:BoundField DataField="expHp" HeaderText="Phone No" />
        <asp:BoundField DataField="expGender" HeaderText="Gender" />
        <asp:BoundField HeaderText="Date Of Birth" />
        <asp:CommandField ShowSelectButton="True" />
        <asp:CommandField ShowEditButton="True" />
        <asp:CommandField ShowDeleteButton="True" />
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="btnManage" runat="server" CausesValidation="false" CommandName="" Text="Manage" OnClick="btnManage_Click"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Approved">
            <ItemTemplate>
                <asp:CheckBox ID="IsApproved" runat="server" OnCheckedChanged="IsApproved_CheckedChanged" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="Status" />
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
    
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
<br />
    <br />


</asp:Content>

