<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertMasterPage.master" AutoEventWireup="true" CodeFile="ExpertTickets.aspx.cs" Inherits="ExpertTickets" %>

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
                <p>All Tickets opened on your Services</p>
                <h3>Your Tickets</h3>
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
            <h3> ALL </h3>
            <asp:GridView ID="gv_Tickets" runat="server" AutoGenerateColumns="False" Width="696px" OnSelectedIndexChanged="gv_Tickets_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="ThreadId" HeaderText="Ticket ID" />
                    <asp:BoundField HeaderText="Title" DataField="Title" />   
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:CommandField HeaderText="Full Details" SelectText="Chat Log" ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

