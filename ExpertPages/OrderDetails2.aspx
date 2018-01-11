<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertMasterPage.master" AutoEventWireup="true" CodeFile="OrderDetails2.aspx.cs" Inherits="OrderDetails2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 271px;
        }

        .auto-style3 {
            width: 265px;
        }

        .auto-style7 {
            width: 265px;
            height: 51px;
        }

        .auto-style8 {
            height: 51px;
        }

        .auto-style5 {
            width: 265px;
            height: 48px;
        }

        .auto-style6 {
            height: 48px;
        }
    </style>
    <script type="text/javascript">
        function confirmDecline() {
            var txt;
            if (confirm("Are you sure want to reject this order?") == true) {
                txt = "You have rejectd Order!";
            }
            else {
                txt = "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%" align="center">
        <tr>
            <td width="100%" align="center">
                <h1>Order Details</h1>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FormView ID="fvOrder" runat="server" DataKeyNames="Id" DataSourceID="sdsOrder" Width="100%" OnDataBound="fvOrder_DataBound">
                    <ItemTemplate>
                        <table width="50%" cellspacing="2">
                            <tr>
                                <td rowspan="9" width="30%">
                                    <asp:Image ID="imgPhoto" runat="server" Width="200px" ImageUrl="~/Images/DefaultPhoto.png" />
                                </td>
                                <td width="20%">Service</td>
                                <td width="50%">
                                    <asp:Label ID="lblServiceName" runat="server" Text='<%# Bind("ServiceName") %>' /></td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td>
                                    <asp:Label ID="lblServiceDescription" runat="server" Text='<%# Bind("ServiceDescription") %>' /></td>
                            </tr>
                            <tr>
                                <td>Expert</td>
                                <td>
                                    <asp:Label ID="lblExpertFullName" runat="server" Text='<%# Bind("ExpertFullName") %>' /></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>' /></td>
                            </tr>
                            <tr>
                                <td>Price</td>
                                <td>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>' /></td>
                            </tr>
                            <tr>
                                <td>Service Date
                                </td>
                                <td>
                                    <asp:Label ID="lblServiceDate" runat="server" Text='<%# Bind("ServiceDate", "{0:yyyy-MM-dd}") %>' /></td>
                            </tr>
                            <tr>
                                <td valign="top">Timeslot</td>
                                <td>Total
                                    <asp:Label ID="lblTimeslotCount" runat="server" Text='<%# Bind("TimeslotCount", "{0}") %>' />
                                    Hours
                                    <br />
                                    <asp:GridView ID="gvTimeslot" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID,ServiceId,Timeslot" DataSourceID="sdsTimeslot" ShowHeader="false">
                                        <Columns>
                                            <asp:BoundField DataField="Timeslot" DataFormatString="{0: HH:mm}" HeaderText="Timeslot" ReadOnly="True" SortExpression="Timeslot" />
                                        </Columns>
                                    </asp:GridView>

                                </td>
                            </tr>
                            <tr>
                                <td>Order Date</td>
                                <td>
                                    <asp:Label ID="lblCreatedDateTime" runat="server" Text='<%# Bind("CreatedDateTime") %>' /></td>
                            </tr>
                            <tr>
                                <td>Status</td>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Panel ID="pEdit" runat="server" Visible="false">
                                        <asp:Button OnClientClick="confirmDecline()" ID="btn_Decline" runat="server" Text="Decline" OnClick="btn_Decline_Click"/>
                                    </asp:Panel>
                                    <asp:Panel ID="pNoEdit" runat="server" Visible="true">
                                        You are not allowed to change timeslot or cancel order.
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderView] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="OrderId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsTimeslot" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderTimeslot] WHERE ([OrderID] = @OrderID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OrderID" QueryStringField="OrderId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_Back" runat="server" Text="Back" OnClick="btn_Back_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

