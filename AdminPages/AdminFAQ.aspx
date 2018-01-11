<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminFAQ.aspx.cs" Inherits="AdminFAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            margin-left: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:DropDownList ID="ddl_Filter" runat="server" Width="194px" OnSelectedIndexChanged="ddl_Filter_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value ="0" Selected="True">All</asp:ListItem>
                        <asp:ListItem Value ="1">Answered</asp:ListItem>
                        <asp:ListItem Value ="2">Unanswered</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
    
        <asp:GridView ID="gvAdminFAQ" runat="server" CellPadding="4" DataKeyNames="FAQID" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="gvAdminFAQ_RowCancelingEdit" OnRowDeleting="gvAdminFAQ_RowDeleting" OnRowEditing="gvAdminFAQ_RowEditing" OnRowUpdating="gvAdminFAQ_RowUpdating" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="FAQID" HeaderText="FAQID" />
                <asp:BoundField DataField="userid" HeaderText="user email" />
                <asp:BoundField DataField="Question" HeaderText="Question" />
                <asp:BoundField DataField="Answer" HeaderText="Answer" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    
                </td>
            </tr>
        </table>
</asp:Content>
