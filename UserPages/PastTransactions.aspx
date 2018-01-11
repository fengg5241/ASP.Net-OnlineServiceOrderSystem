<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="PastTransactions.aspx.cs" Inherits="PastTransactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="Sidebar"">
        <ul class="SidebarList">
            <li><a runat="server" href="~/UserPages/PaymentMethods.aspx">Payment Methods</a></li>
            <li> <a runat="server" href="~/UserPages/AddressBook.aspx">Address Book</a></li>
            <li><a runat="server" href="~/UserPages/PastTransactions.aspx">Order History</a></li>
        </ul>
    </div>
    <div class="body">
        <div class="List" id="OrderList">
            <div class="Note" id="OrderNote">
                <h1>Past Transactions</h1>
                <p>View Past Transactions made on your account.</p>
                <h3>Your Past Orders</h3>
            </div>
            <asp:GridView ID="gv_Transactions" runat="server" AutoGenerateColumns="False" Width="696px" OnSelectedIndexChanged="gv_Transactions_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Order ID" />
                    <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%# Eval("FirstName") + " " + Eval("LastName")%>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Service" DataField="Type" />
                    <asp:BoundField HeaderText="Duration" DataField="Duration" />
                    <asp:BoundField HeaderText="Price ($)" DataField="Price" DataFormatString="{0:0.00}" />
                    <asp:CommandField HeaderText="Full Details" SelectText="View Receipt" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

