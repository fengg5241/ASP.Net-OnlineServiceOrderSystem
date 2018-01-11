<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="ServiceView.aspx.cs" Inherits="UserPages_ServiceView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr height="3px">
            <td width="20%">Order By
            </td>
            <td width="70%">
                <asp:DropDownList ID="ddlSortColumn" runat="server" OnSelectedIndexChanged="ddlSortColumn_SelectedIndexChanged" Width="200px" AutoPostBack="true">
                    <asp:ListItem Value="" Selected="true">Please Select</asp:ListItem>
                    <asp:ListItem Value="ExpertFullName">Expert(A-Z)</asp:ListItem>
                    <asp:ListItem Value="Price ASC">Price(low-high)</asp:ListItem>
                    <asp:ListItem Value="Price DESC">Price(high-low)</asp:ListItem>
                    <asp:ListItem Value="Rating DESC">Rating</asp:ListItem>
                    <asp:ListItem Value="OrderCount DESC">Popularity</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ListView ID="lvService" runat="server" DataSourceID="sdsService" GroupItemCount="5" OnItemDataBound="lvService_ItemDataBound">
                    <LayoutTemplate>
                        <table runat="server" id="tbService" cellspacing="10">
                            <tr runat="server" id="groupPlaceholder">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr runat="server" id="trServiceGroup">
                            <td runat="server" id="itemPlaceholder" />
                        </tr>
                    </GroupTemplate>
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
                <asp:SqlDataSource ID="sdsService" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ServiceView] WHERE (@TypeId = 'ALL' OR [TypeId] = @TypeId)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="ALL" Name="TypeId" QueryStringField="TypeId" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

