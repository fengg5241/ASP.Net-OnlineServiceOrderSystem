<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="OrderView.aspx.cs" Inherits="UserPages_OrderView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:GridView ID="gvOrder" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsOrder" Width="100%" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <a runat="server" href='<%# "~/UserPages/OrderDetail.aspx?Id=" + Eval("Id") %>'>View</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ServiceDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="Service Date" SortExpression="ServiceDate" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="ExpertFullName" HeaderText="Expert" ReadOnly="True" SortExpression="ExpertFullName" />
                        <asp:BoundField DataField="ServiceName" HeaderText="Service" SortExpression="ServiceName" />
                        <asp:BoundField DataField="Price" DataFormatString="{0:N2}" HeaderText="Price" SortExpression="Price" ItemStyle-HorizontalAlign="Right" />
                        <asp:BoundField DataField="TimeslotCount" HeaderText="Hours" SortExpression="TimeslotCount" ItemStyle-HorizontalAlign="Right" />
                        <asp:BoundField DataField="CreatedDateTime" DataFormatString="{0: yyyy-MM-dd}" HeaderText="Order Date" SortExpression="CreatedDateTime" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderView] WHERE ([UserId] = @UserId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>

    </table>
</asp:Content>

