<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertMasterPage.master" AutoEventWireup="true" CodeFile="OrderView2.aspx.cs" Inherits="OrderView2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .auto-style3 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <h1>My Orders</h1>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvExpOrder" runat="server" AutoGenerateColumns="False" Height="410px" Width="811px" CssClass="auto-style3" DataKeyNames="Id" DataSourceID="sdsOrderView" AllowPaging="True" AllowSorting="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:TemplateField HeaderText="Detail" SortExpression="Id">
                            <ItemTemplate>
                                <a runat="server" href='<%# "~/ExpertPages/OrderDetails2.aspx?OrderId=" + Eval("Id") %>' >
                                    View
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Date" DataField="ServiceDate" SortExpression="ServiceDate" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="ServiceDescription" HeaderText="Service" SortExpression="ServiceDescription" />
                        <asp:BoundField DataField="ServiceName" HeaderText="Type" SortExpression="ServiceName" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="${0:N2}" />
                        <asp:BoundField HeaderText="Address" DataField="Address" SortExpression="Address" />
                        <asp:BoundField HeaderText="Customer" DataField="UserFullName" SortExpression="UserFullName" />
                        <asp:BoundField DataField="TimeslotCount" HeaderText="Hours" SortExpression="TimeslotCount" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="sdsOrderView" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderView] 
WHERE ([ExpertId] = @ExpertId)
AND ([Status] NOT IN ('PENDING', 'CANCELLED'))">
        <SelectParameters>
            <asp:SessionParameter Name="ExpertId" SessionField="ExpertId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <p>
        &nbsp;
    </p>
</asp:Content>

