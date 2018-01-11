<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="OrderPayment.aspx.cs" Inherits="UserPages_OrderPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:FormView ID="fvOrder" runat="server" DataKeyNames="Id" DataSourceID="sdsOrder">
                    <EditItemTemplate>
                        Id:
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        UserId:
                        <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                        <br />
                        ServiceId:
                        <asp:TextBox ID="ServiceIdTextBox" runat="server" Text='<%# Bind("ServiceId") %>' />
                        <br />
                        Price:
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        Address:
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        ServiceDate:
                        <asp:TextBox ID="ServiceDateTextBox" runat="server" Text='<%# Bind("ServiceDate") %>' />
                        <br />
                        Enabled:
                        <asp:CheckBox ID="EnabledCheckBox" runat="server" Checked='<%# Bind("Enabled") %>' />
                        <br />
                        CreatedDateTime:
                        <asp:TextBox ID="CreatedDateTimeTextBox" runat="server" Text='<%# Bind("CreatedDateTime") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        UserId:
                        <asp:TextBox ID="UserIdTextBox" runat="server" Text='<%# Bind("UserId") %>' />
                        <br />
                        ServiceId:
                        <asp:TextBox ID="ServiceIdTextBox" runat="server" Text='<%# Bind("ServiceId") %>' />
                        <br />
                        Price:
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        Address:
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        ServiceDate:
                        <asp:TextBox ID="ServiceDateTextBox" runat="server" Text='<%# Bind("ServiceDate") %>' />
                        <br />
                        Enabled:
                        <asp:CheckBox ID="EnabledCheckBox" runat="server" Checked='<%# Bind("Enabled") %>' />
                        <br />
                        CreatedDateTime:
                        <asp:TextBox ID="CreatedDateTimeTextBox" runat="server" Text='<%# Bind("CreatedDateTime") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        UserId:
                        <asp:Label ID="UserIdLabel" runat="server" Text='<%# Bind("UserId") %>' />
                        <br />
                        ServiceId:
                        <asp:Label ID="ServiceIdLabel" runat="server" Text='<%# Bind("ServiceId") %>' />
                        <br />
                        Price:
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                        <br />
                        Address:
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        ServiceDate:
                        <asp:Label ID="ServiceDateLabel" runat="server" Text='<%# Bind("ServiceDate") %>' />
                        <br />
                        Enabled:
                        <asp:CheckBox ID="EnabledCheckBox" runat="server" Checked='<%# Bind("Enabled") %>' Enabled="false" />
                        <br />
                        CreatedDateTime:
                        <asp:Label ID="CreatedDateTimeLabel" runat="server" Text='<%# Bind("CreatedDateTime") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Order] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Time Slots
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvTimeslot" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID,ServiceId,Timeslot" DataSourceID="sdsTimeslot">
                    <Columns>
                        <asp:BoundField DataField="Timeslot" DataFormatString="{0: dd-MMM-yyyy HH:mm}" HeaderText="Timeslot" ReadOnly="True" SortExpression="Timeslot" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sdsTimeslot" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderTimeslot] WHERE ([OrderID] = @OrderID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OrderID" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

