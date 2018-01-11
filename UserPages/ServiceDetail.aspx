<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="ServiceDetail.aspx.cs" Inherits="UserPages_ServiceDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td>
                <asp:FormView ID="fvService" runat="server" DataKeyNames="Id" DataSourceID="sdsService" OnDataBound="fvService_DataBound">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td rowspan="6">
                                    <asp:Image ID="imgPhoto" runat="server" Height="200px" Width="200px" BackColor="LightYellow" ImageUrl="~/Images/DefaultPhoto.png" />
                                </td>
                                <td>
                                    <asp:Label ID="ExpertFullNameLabel" runat="server" Text='<%# Eval("ExpertFullName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>$<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price", "{0:N2}") %>' /> / Hour <br />
                                    Surcharge $<asp:Label ID="lblSurcharge" runat="server" Text='<%# Eval("Surcharge", "{0:N2}") %>' /> / Hour within 
                                    <asp:Label ID="lblUrgentDays" runat="server" Text='<%# Eval("UrgentDays") %>' /> Day(s)
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ServiceNameLabel" runat="server" Text='<%# Eval("ServiceName") %>' />
                                    <br />
                                    <br />
                                    <asp:Label ID="ServiceDescriptionLabel" runat="server" Text='<%# Eval("ServiceDescription") %>' />
                                </td>
                            </tr>

                            <tr>
                                <td width="70%">Rating :
                                        <asp:Label ID="lblRating" runat="server" Text='<%# Bind("Rating", "{0:N2}") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td width="30%">
                                    <asp:Label ID="lblOrderCount" runat="server" Text='<%# Bind("OrderCount") %>' />
                                    previous orders
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="sdsService" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ServiceView] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Id" QueryStringField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <h2>Timeslots</h2>
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
                                    <asp:QueryStringParameter Name="ServiceId" QueryStringField="Id" Type="Int32" />
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
                <asp:Button ID="btnSubmit" runat="server" Text="Book Now" OnClick="btnSubmit_Click" CausesValidation="true" ValidationGroup="vgSubmit" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvSubmit" runat="server" ValidationGroup="vgSubmit" ErrorMessage="" OnServerValidate="cvSubmit_ServerValidate" Font-Bold="true" ForeColor="DarkRed"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <h2>Review
                            </h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gvReview" runat="server" AutoGenerateColumns="False" DataSourceID="sdsReview" Width="100%" AllowPaging="True" OnRowDataBound="gvReview_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="CreatedDateTime" HeaderText="Date" SortExpression="CreatedDateTime" DataFormatString="{0: dd-MMM-yyyy}" ItemStyle-Width="10%">
                                        <ItemStyle Width="10%"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="User" SortExpression="UserName">
                                        <ItemTemplate>
                                            <asp:Image ID="imgPhoto" runat="server" ImageUrl="~/Images/DefaultPhoto.png" Width="100px" />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Reviews" HeaderText="Reviews" SortExpression="Reviews" ItemStyle-Wrap="true" ItemStyle-VerticalAlign="Top" FooterStyle-HorizontalAlign="Left">
                                        <FooterStyle HorizontalAlign="Left"></FooterStyle>
                                        <ItemStyle VerticalAlign="Top" Wrap="True"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Rating" SortExpression="Rating">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRating" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%"></ItemStyle>
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sdsReview" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderReview.OrderId, OrderReview.Rating, OrderReview.CreatedDateTime, OrderReview.Reviews, [Order].UserId, [Order].ServiceId, [User].UserName, [User].Id AS UserId 
FROM [Order] INNER JOIN OrderReview ON [Order].Id = OrderReview.OrderId INNER JOIN Service ON [Order].ServiceId = Service.Id INNER JOIN [User] ON [Order].UserId = [User].Id
WHERE ([Service].Id = @ServiceId)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="ServiceId" QueryStringField="Id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

