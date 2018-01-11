<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="PastRewards.aspx.cs" Inherits="PastRewards" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css">
        .body{
            margin-left:20%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="body">
        <div class="List" id="OrderList">
            <div class="Note" id="OrderNote">
                <h1>Past Rewards</h1>
                <p>View Coupon Generations made on your account.</p>
                <h3>Your Codes</h3>
            </div>
            <asp:GridView ID="gv_Rewards" runat="server" AutoGenerateColumns="False" OnRowDataBound ="OnRowDataBound" Width="696px">
                <Columns>
                    <asp:BoundField DataField="CouponCode" ItemStyle-Font-Bold="true" HeaderText="Coupon Code" />
                    <asp:BoundField DataField="CouponType" HeaderText="Coupon Value($)" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

