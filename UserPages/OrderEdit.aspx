<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="OrderEdit.aspx.cs" Inherits="UserPages_OrderEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%" align="left">
        <tr>
            <td width="100%" align="left">
                <asp:FormView ID="fvOrder" runat="server" DataKeyNames="Id" DataSourceID="sdsOrder" Width="100%" OnDataBound="fvOrder_DataBound">
                    <ItemTemplate>
                        <table width="50%" cellspacing="2">
                            <tr>
                                <td rowspan="9" width="30%">
                                    <asp:Image ID="imgPhoto" runat="server" Width="128px" ImageUrl="~/Images/DefaultPhoto.png" />
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
                                    <asp:Label ID="lblServiceDate" runat="server" Text='<%# Bind("ServiceDate") %>' /></td>
                            </tr>
                            <tr>
                                <td valign="top">Timeslot</td>
                                <td>Total
                                    <asp:Label ID="lblTimeslotCount" runat="server" Text='<%# Bind("TimeslotCount") %>' />
                                    Hours
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
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="sdsOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [OrderView] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <h2>Please choose new timeslots.</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvSubmit" runat="server" ValidationGroup="vgSubmit" ErrorMessage="" OnServerValidate="cvSubmit_ServerValidate" Font-Bold="true" ForeColor="DarkRed"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Calendar ID="calTimeslot" runat="server"></asp:Calendar>
                        </td>
                        <td>
                            <asp:Label ID="lblServiceId" runat="server" Visible="false"></asp:Label>
                            <asp:ListView ID="lvTimeslot" runat="server" DataSourceID="sdsTimeslot" GroupItemCount="4" DataKeyNames="ServiceId,Timeslot,DayOfWeek">
                                <LayoutTemplate>
                                    <table runat="server" id="tbTimeslot" cellspacing="10">
                                        <tr runat="server" id="groupPlaceholder">
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <GroupTemplate>
                                    <tr runat="server" id="trTimeslotGroup">
                                        <td runat="server" id="itemPlaceholder" />
                                    </tr>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <td runat="server" id="tdTimeslot" style='<%# (bool)Eval("Enabled") ? "background-color: #FFFFFF": "background-color: #CCCCCC" %>'>
                                        <%-- Data-bound content. --%>
                                        <asp:CheckBox ID="chkTimeslot" runat="server" Text='<%# Eval("Timeslot", "{0:HH:mm}") %>' Enabled='<%# Eval("Enabled") %>' />
                                    </td>
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="sdsTimeslot" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetServiceTimeslot" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblServiceId" DbType="Int32" Name="ServiceId" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="calTimeslot" DbType="DateTime2" Name="Date" PropertyName="SelectedDate" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="100px" ValidationGroup="vgSubmit" CausesValidation="true" />
            </td>
        </tr>
    </table>
</asp:Content>

