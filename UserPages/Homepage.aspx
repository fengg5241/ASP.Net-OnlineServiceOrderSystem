<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .auto-style3 {
            margin-left: 15px;
        }
        .panel{
            margin-left: 10%;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <p>
        <a href="ServiceView.aspx">
        <div class="panel">
        <asp:Panel ID="panel_Image" runat="server" BackImageUrl="~/Images/home3.jpg" Width="1000px" Height="640px">
        
        </asp:Panel>
        </div>
        </a>
        <table width="100%" aling="center">
            <tr>
                <td width="100%" align="center">
                    <h2>Top Order</h2>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:ListView ID="lsServiceTopOrder1" runat="server" OnItemDataBound="lvService_ItemDataBound" DataSourceID="sdsServiceTopOrder3">
                        <LayoutTemplate>
                            <table runat="server" id="tbServiceOrderTop3" cellspacing="10">
                                <tr>
                                    <td runat="server" id="itemPlaceHolder" />
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <td runat="server" id="tdService" style="background-color: antiquewhite">
                                <%-- Data-bound content. --%>
                                <div align="center">
                                    <a runat="server" href='<%# "~/UserPages/ServiceDetail.aspx?Id=" + Eval("Id") %>'>
                                        <asp:Image ID="imgPhoto" runat="server" Width="200px" Height="200px" ImageUrl="~/Images/DefaultPhoto.png" />
                                    </a>
                                    <br />
                                    <asp:Label ID="lblExpertFullName" runat="server"
                                        Text='<%# Bind("ExpertFullName") %>' />
                                    <br />
                                    $<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price", "{0:N2}") %>' />
                                    / Hour
                                </div>
                                <br />
                                <div>
                                    <asp:Label ID="lblServiceName" runat="server" Text='<%# Bind("ServiceName") %>' />
                                    <br />
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>' />
                                </div>
                                <table width="100%">
                                    <tr>
                                        <td width="60%">Rating :
                                        <asp:Label ID="lblRating" runat="server" Text='<%# Bind("Rating", "{0:N2}") %>' />
                                        </td>
                                        <td width="40%">
                                            <asp:Label ID="lblOrderCount" runat="server" Text='<%# Bind("OrderCount") %>' />
                                            Orders
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="sdsServiceTopOrder3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (3) [Id], [TypeId], [Description], [Price], [ExpertId], [UrgentDays], [Surcharge], [ServiceName], [ServiceDescription], [ExpertFullName], [Rating], [OrderCount] 
FROM [ServiceView]
ORDER BY [OrderCount] DESC"></asp:SqlDataSource>
                </td>
            </tr>
            <tr height="20px">
                <td></td>
            </tr>
            <tr>
                <td align="center">
                    <h2>Top Rating</h2>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:ListView ID="lvServiceRatingTop3" runat="server" OnItemDataBound="lvService_ItemDataBound" DataSourceID="sdsServceTopRating3">
                        <LayoutTemplate>
                            <table runat="server" id="tbServiceRatingTop3" cellspacing="10">
                                <tr>
                                    <td runat="server" id="itemPlaceHolder" />
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <td runat="server" id="tdService" style="background-color: antiquewhite">
                                <%-- Data-bound content. --%>
                                <div align="center">
                                    <a runat="server" href='<%# "~/UserPages/ServiceDetail.aspx?Id=" + Eval("Id") %>'>
                                        <asp:Image ID="imgPhoto" runat="server" Width="200px" Height="200px" ImageUrl="~/Images/DefaultPhoto.png" />
                                    </a>
                                    <br />
                                    <asp:Label ID="lblExpertFullName" runat="server"
                                        Text='<%# Bind("ExpertFullName") %>' />
                                    <br />
                                    $<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price", "{0:N2}") %>' />
                                    / Hour
                                </div>
                                <br />
                                <div>
                                    <asp:Label ID="lblServiceName" runat="server" Text='<%# Bind("ServiceName") %>' />
                                    <br />
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>' />
                                </div>
                                <table width="100%">
                                    <tr>
                                        <td width="60%">Rating :
                                        <asp:Label ID="lblRating" runat="server" Text='<%# Bind("Rating", "{0:N2}") %>' />
                                        </td>
                                        <td width="40%">
                                            <asp:Label ID="lblOrderCount" runat="server" Text='<%# Bind("OrderCount") %>' />
                                            Orders
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="sdsServceTopRating3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP (3) Id, TypeId, Description, Price, ExpertId, UrgentDays, Surcharge, ServiceName, ServiceDescription, ExpertFullName, Rating, OrderCount FROM ServiceView ORDER BY Rating DESC"></asp:SqlDataSource>
                </td>
            </tr>
            <tr height="20px">
                <td></td>
            </tr>
            <tr>
                <td align="center">
                    <asp:TextBox ID="tb_Search" runat="server" Width="337px" placeholder="Search..." Height="31px"></asp:TextBox>
                    <asp:Button ID="btn_Search" runat="server" CssClass="auto-style3" Text="Search" OnClick="btn_Search_Click" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" Width="780px" DataKeyNames="Id">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a runat="server" href='<%# "~/UserPages/ServiceDetail.aspx?Id=" + Eval("Id") %>'>Select</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ExpertFullName" HeaderText="Expert" SortExpression="ExpertFullName" />
                            <asp:BoundField DataField="Description" HeaderText="Service" SortExpression="Description" />
                            <asp:BoundField DataField="ServiceName" HeaderText="Type" SortExpression="ServiceName" />
                            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="OrderCount" HeaderText="Order" SortExpression="OrderCount" />
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
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Expert] WHERE [ExpertId] = @ExpertId" InsertCommand="INSERT INTO [Expert] ([ExpertId], [Gender], [TypeOfService]) VALUES (@ExpertId, @Gender, @TypeOfService)" SelectCommand="SELECT Id, TypeId, Description, Price, ExpertId, UrgentDays, Surcharge, ServiceName, ServiceDescription, ExpertFullName, Rating, OrderCount FROM ServiceView WHERE (ExpertFullName LIKE '%' + @text + '%') OR (ServiceName LIKE '%' + @text + '%') OR (Description LIKE '%' + @text + '%')">
                        <DeleteParameters>
                            <asp:Parameter Name="ExpertId" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ExpertId" />
                            <asp:Parameter Name="Gender" />
                            <asp:Parameter Name="TypeOfService" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="tb_Search" Name="text" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

