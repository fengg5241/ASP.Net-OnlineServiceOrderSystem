<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertMasterPage.master" AutoEventWireup="true" CodeFile="ServiceAddEdit.aspx.cs" Inherits="ExpertPages_ServiceAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td colspan="2">
                <h1>Service</h1>
            </td>
        </tr>
        <tr>
            <td width="256px">
                <asp:Image runat="server" ID="imgPhoto" ImageUrl="~/Images/DefaultPhoto.png" Height="256px" />
            </td>
            <td>
                <asp:DetailsView ID="dvService" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="sdsService" Width="500px" OnDataBound="dvService_DataBound" OnItemInserting="dvService_ItemInserting" OnItemUpdating="dvService_ItemUpdating" OnItemInserted="dvService_ItemInserted">
                    <FieldHeaderStyle Width="150px" />
                    <Fields>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:TemplateField HeaderText="Type" SortExpression="Type">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlServiceType" runat="server" DataSourceID="sdsServiceType" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                                <asp:Label ID="lblServiceType" runat="server" Text='<%# Bind("Type") %>' Visible="false"></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlServiceType" runat="server" DataSourceID="sdsServiceType" DataTextField="Name" DataValueField="Id" AutoPostBack="true"></asp:DropDownList>
                                <asp:Label ID="lblServiceType" runat="server" Text='<%# Bind("Type") %>' Visible="false"></asp:Label>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblServiceType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Urgent Days" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUrgentDays" runat="server" Text='<%# Bind("UrgentDays") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtUrgentDays" runat="server" Text='<%# Bind("UrgentDays") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblUrgentDays" runat="server" Text='<%# Bind("UrgentDays") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Urgent Charge" SortExpression="Description">
                            <EditItemTemplate>
                                <asp:TextBox Width="80%" ID="txtUrgentCharge" runat="server" Text='<%# Bind("UrgentChargePct") %>'></asp:TextBox>%
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox Width="80%" ID="txtUrgentCharge" runat="server" Text='<%# Bind("UrgentChargePct") %>'></asp:TextBox>%
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblUrgentChargePct" runat="server" Text='<%# Eval("UrgentChargePct", "{0:N2}") + "%" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Enabled" SortExpression="Enabled">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkEnabled" runat="server" Checked='<%# Bind("Enabled") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:CheckBox ID="chkEnabled" runat="server" Checked='<%# Bind("Enabled") %>' />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkEnabled" runat="server" Checked='<%# Bind("Enabled") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price" SortExpression="Price">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                <asp:DetailsView runat="server" DataSourceID="sdsServicePriceStatistics" AutoGenerateRows="false" BorderStyle="None">
                                    <Fields>
                                        <asp:TemplateField ShowHeader="false" ItemStyle-BorderStyle="None" ItemStyle-ForeColor="DarkRed">
                                            <ItemTemplate>
                                                Minimum Price: $<asp:Label ID="lblMinPrice" runat="server" Text='<%# Bind("MinPrice", "{0:N2}") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                                                Maximum Price: $<asp:Label ID="lblMaxPrice" runat="server" Text='<%# Bind("MaxPrice", "{0:N2}") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                                                Average Price: $<asp:Label ID="lblAvgPrice" runat="server" Text='<%# Bind("AvgPrice", "{0:N2}") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Fields>
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="sdsServicePriceStatistics" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetServicePriceStatistic" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlServiceType" Name="typeId" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowInsertButton="true" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="sdsService" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    DeleteCommand="DELETE FROM [Service] WHERE [Id] = @Id"
                    InsertCommand="INSERT INTO [Service] ([Type], [Description], [Price], [ExpertId], [Enabled], [UrgentDays], [UrgentChargePct]) VALUES (@Type, @Description, @Price, @ExpertId, @Enabled, @UrgentDays, @UrgentChargePct)"
                    SelectCommand="SELECT * FROM [Service] WHERE ([Id] = @Id)"
                    UpdateCommand="UPDATE [Service] SET [Type] = @Type, [Description] = @Description, [Price] = @Price, [ExpertId] = @ExpertId, [Enabled] = @Enabled, [UrgentDays] = @UrgentDays, [UrgentChargePct] = @UrgentChargePct WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="ExpertId" Type="Int32" />
                        <asp:Parameter Name="Enabled" Type="Boolean" />
                        <asp:Parameter Name="UrgentDays" Type="Int32" />
                        <asp:Parameter Name="UrgentChargePct" Type="Decimal" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Type" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="ExpertId" Type="Int32" />
                        <asp:Parameter Name="Enabled" Type="Boolean" />
                        <asp:Parameter Name="UrgentDays" Type="Int32" />
                        <asp:Parameter Name="UrgentChargePct" Type="Decimal" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsServiceType" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ServiceType]"></asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
    <table id="tbTimeSlot" runat="server">
        <tr>
            <td>
                <h1>Time Slot</h1>
                <asp:DropDownList ID="ddlDayOfWeek" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="1" Selected="True">Sunday</asp:ListItem>
                    <asp:ListItem Value="2">Monday</asp:ListItem>
                    <asp:ListItem Value="3">Tuesday</asp:ListItem>
                    <asp:ListItem Value="4">Wednesday</asp:ListItem>
                    <asp:ListItem Value="5">Thursday</asp:ListItem>
                    <asp:ListItem Value="6">Friday</asp:ListItem>
                    <asp:ListItem Value="7">Saturday</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="lvTimeslot" runat="server" DataSourceID="sdsTimeslot" GroupItemCount="8" DataKeyNames="ServiceId, Timeslot, DayOfWeek" OnItemUpdated="lvTimeslot_ItemUpdated">
                    <LayoutTemplate>
                        <table runat="server" id="tbTimeslot" cellspacing="10">
                            <tr runat="server" id="groupPlaceholder">
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click" />
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr runat="server" id="trTimeslotGroup">
                            <td runat="server" id="itemPlaceholder" />
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <%# GetWeekDayHeader((int)Eval("DayOfWeek")) %>
                        <td runat="server" id="tdTimeslot" style="background-color: #CCCCCC">
                            <%-- Data-bound content. --%>
                            <asp:CheckBox ID="chkTimeslot" runat="server" Text='<%# Eval("Timeslot") %>' Checked='<%# Bind("Enabled") %>' />
                        </td>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="sdsTimeslot" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [ServiceTimeslot] WHERE ([ServiceId] = @ServiceId) AND ([DayOfWeek] = @DayOfWeek)"
                    DeleteCommand="DELETE FROM [ServiceTimeslot] WHERE [ServiceId] = @ServiceId AND [Timeslot] = @Timeslot AND [DayOfWeek] = @DayOfWeek"
                    InsertCommand="INSERT INTO [ServiceTimeslot] ([ServiceId], [Timeslot], [DayOfWeek], [Enabled]) VALUES (@ServiceId, @Timeslot, @DayOfWeek, @Enabled)"
                    UpdateCommand="UPDATE [ServiceTimeslot] SET [Enabled] = @Enabled WHERE [ServiceId] = @ServiceId AND [Timeslot] = @Timeslot AND [DayOfWeek] = @DayOfWeek">
                    <DeleteParameters>
                        <asp:Parameter Name="ServiceId" Type="Int32" />
                        <asp:Parameter DbType="Time" Name="Timeslot" />
                        <asp:Parameter Name="DayOfWeek" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ServiceId" Type="Int32" />
                        <asp:Parameter DbType="Time" Name="Timeslot" />
                        <asp:Parameter Name="DayOfWeek" Type="Int32" />
                        <asp:Parameter Name="Enabled" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ServiceId" QueryStringField="Id" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlDayOfWeek" Name="DayOfWeek" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Enabled" Type="Boolean" />
                        <asp:Parameter Name="ServiceId" Type="Int32" />
                        <asp:Parameter DbType="Time" Name="Timeslot" />
                        <asp:Parameter Name="DayOfWeek" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

