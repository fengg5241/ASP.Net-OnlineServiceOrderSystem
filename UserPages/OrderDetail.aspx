<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="UserPages_OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%" align="center">
        <tr>
            <td width="100%" align="center">
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
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price", "{0:N2}") %>' /></td>
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
                                    <asp:Label ID="lblTimeslotCount" runat="server" Text='<%# Bind("TimeslotCount") %>' />
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
                                        <asp:HyperLink ID="lnkPay" runat="server" NavigateUrl='<%# "~/UserPages/OrderForm.aspx?Id=" + Eval("Id") %>' Text="Make Payment" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:HyperLink ID="lnkOrderEdit" runat="server" NavigateUrl='<%# "~/UserPages/OrderEdit.aspx?Id=" + Eval("Id") %>' Text="Change Timeslot" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="lnkOrderCancel" runat="server" Text="Cancel Order" OnClick="lnkOrderCancel_Click"></asp:LinkButton>
                                    </asp:Panel>
                                    <asp:Panel ID="pReview" runat="server" Visible="false">
                                        <asp:HyperLink ID="lnkReview" runat="server" NavigateUrl='<%# "~/UserPages/WriteReview.aspx?OrderId=" + Eval("Id") %>' Text="Write Review" />
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
                        <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsTimeslot" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderTimeslot] WHERE ([OrderID] = @OrderID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OrderID" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvReview" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderId" DataSourceID="sdsOrderReview" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" ItemStyle-Width="10%"/>
                        <asp:BoundField DataField="Reviews" HeaderText="Reviews" SortExpression="Reviews" ItemStyle-Width="70%"/>
                        <asp:BoundField DataField="CreatedDateTime" HeaderText="Date" SortExpression="CreatedDateTime" ItemStyle-Width="20%" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"/>
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="sdsOrderReview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderReview] WHERE ([OrderId] = @OrderId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OrderId" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

