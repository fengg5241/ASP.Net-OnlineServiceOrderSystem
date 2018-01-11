<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="AddAddress.aspx.cs" Inherits="AddAddress" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="Sidebar">
        <ul class="SidebarList">
            <li><a runat="server" href="~/UserPages/PaymentMethods.aspx">Payment Methods</a></li>
            <li><a runat="server" href="~/UserPages/AddressBook.aspx">Address Book</a></li>
            <li><a runat="server" href="~/UserPages/PastTransactions.aspx">Order History</a></li>
        </ul>
    </div>
    <div class="body">
        <div class="AddressForm">
            <h1>Add New Address</h1>
            <form>
                <fieldset style="width: 707px">
                    <table>
                        <tr>
                            <td><b>Reference Name: </b></td>
                            <td>
                                <asp:TextBox ID="tb_RefName" runat="server" placeholder="eg: Home, Work, etc." Width="400px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><b>First Name: </b></td>
                            <td>
                                <asp:TextBox ID="tb_FName" runat="server" Width="400px"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="FNameValidator" runat="server" Text="*" ErrorMessage="First Name Required" ControlToValidate="tb_FName" ForeColor="Red"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><b>Last Name: </b></td>
                            <td>
                                <asp:TextBox ID="tb_LName" runat="server" Width="400px"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="LNameValidator" runat="server" ErrorMessage="Last Name Required" ControlToValidate="tb_LName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><b>Address Line 1: </b></td>
                            <td>
                                <asp:TextBox ID="tb_Address1" runat="server" placeholder="Street Address, P.O Box, Company Name, c/o" Width="400px"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="Address Line 1 Required" ControlToValidate="tb_Address1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><b>Address Line 2: </b></td>
                            <td>
                                <asp:TextBox ID="tb_Address2" runat="server" placeholder="Apartment, Suite, unit, building, floor, etc." Width="400px"></asp:TextBox></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><b>Postcode / Zip</b></td>
                            <td>
                                <asp:TextBox ID="tb_Zip" runat="server" Width="400px" MaxLength="6" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="ZipValidator" runat="server" ErrorMessage="Postcode / Zip Required" ControlToValidate="tb_Zip" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td><b>Contact Number</b></td>
                            <td>
                                <asp:TextBox ID="tb_Phone" runat="server" Width="400px" MaxLength="8" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ErrorMessage="Contact Number Required" ControlToValidate="tb_Phone" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:ValidationSummary ID="summary" runat="server" HeaderText="NOTE:" ForeColor="Red" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="control" runat="server" Font-Bold="true"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="btnSave" runat="server" Text="Save" Width="137px" OnClick="btnSave_Click" />
                                <asp:Button ID="btnBack" runat="server" Text="Back" Width="137px" OnClick="btnBack_Click" CausesValidation="false" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</asp:Content>

