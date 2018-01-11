<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="MyTickets.aspx.cs" Inherits="MyTickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
<style type="text/css">
    .body{
        margin-left:20%;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="body">
        <div class="List" id="OrderList">
            <div class="Note" id="OrderNote">
                <h1>My Tickets</h1>
                <p>View Support Tickets opened on your account.</p>
                <h3>Your Tickets</h3>
                <asp:ImageButton ID="btn_NewTicket" runat="server" Width="175px" ImageUrl="~/Images/AddTicket.jpg" alt="View My Coupons" OnClick="btn_NewTicket_Click" />
            </div>
            <asp:Panel ID="unread" runat="server" Visible ="false">
            <h3>Unread</h3>
            <asp:GridView ID="gv_Unread" runat="server" AutoGenerateColumns="False" Width="696px" OnSelectedIndexChanged="gv_Unread_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ThreadId" HeaderText="Ticket ID" />
                    <asp:CommandField HeaderText="Full Details" SelectText="Chat Log" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            </asp:Panel>
            <h3>ALL</h3>
            <asp:GridView ID="gv_Tickets" runat="server" AutoGenerateColumns="False" Width="696px" OnSelectedIndexChanged="gv_Tickets_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ThreadId" HeaderText="Ticket ID" />
                    <asp:BoundField HeaderText="Title" DataField="Title" />
                    <asp:TemplateField HeaderText="Expert">
                    <ItemTemplate>
                        <%# Eval("FirstName") + " " + Eval("LastName")%>
                    </ItemTemplate>
                    </asp:TemplateField>   
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:CommandField HeaderText="Full Details" SelectText="Chat Log" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>        

        </div>
    </div>
</asp:Content>

