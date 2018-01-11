<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="AddCard.aspx.cs" Inherits="_Default" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 77px;
        }
        .auto-style2 {
            height: 54px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="Sidebar">
        <ul class="SidebarList">
            <li><a runat="server" href="~/UserPages/PaymentMethods.aspx">Payment Methods</a></li>
            <li> <a runat="server" href="~/UserPages/AddressBook.aspx">Address Book</a></li>
            <li><a runat="server" href="~/UserPages/PastTransactions.aspx">Order History</a></li>
        </ul>
    </div>
    <div class="body">
        <div class="AddCardForm">
            <h1>Add New Credit/Debit Card</h1>
            <form>
                <fieldset style="width: 707px">
                    <legend>Card Details</legend>
                    <table>
                        <tr>
                            <td class="auto-style1"><b>Card Type</b></td>
                            <td class="auto-style1"><asp:DropDownList ID="list_Type" runat="server" Height="31px" OnSelectedIndexChanged="list_Type_SelectedIndexChanged" AutoPostBack="true" >
                                <asp:ListItem>Please Select</asp:ListItem>
                                <asp:ListItem>AMEX</asp:ListItem>
                                <asp:ListItem>Mastercard</asp:ListItem>
                                <asp:ListItem>Visa</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td colspan="3">  
                              <asp:Image ID="img_Type" runat="server" Width="45px">
                                </asp:Image>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"><b>Credit Card Number: </b></td>
                            <td class="auto-style2"><asp:TextBox ID="tb_CCNo1" runat="server" Width="100px" MaxLength="4" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox> - </td>
                            <td class="auto-style2"><asp:TextBox ID="tb_CCNo2" runat="server" Width="100px" MaxLength="4" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox> - </td>
                            <td class="auto-style2"><asp:TextBox ID="tb_CCNo3" runat="server" Width="100px" MaxLength="4" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox> - </td>
                            <td class="auto-style2"><asp:TextBox ID="tb_CCNo4" runat="server" Width="100px" MaxLength="4" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style2"><b>Name on Card: </b></td>
                            <td colspan="4" class="auto-style2">
                                <asp:textbox ID="tb_Name" runat="server" Width="451px" style="text-transform:uppercase"></asp:textbox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"><b>Expiry Date: </b></td>
                            <td class="auto-style2">
                                <asp:dropdownlist runat="server" Width="100px" ID="list_Month">
                                    <asp:ListItem>MM</asp:ListItem>
                                    <asp:ListItem Value="01">01</asp:ListItem>
                                    <asp:ListItem Value="02">02</asp:ListItem>
                                    <asp:ListItem Value="03">03</asp:ListItem>
                                    <asp:ListItem Value="04">04</asp:ListItem>
                                    <asp:ListItem Value="05">05</asp:ListItem>
                                    <asp:ListItem Value="06">06</asp:ListItem>
                                    <asp:ListItem Value="07">07</asp:ListItem>
                                    <asp:ListItem Value="08">08</asp:ListItem>
                                    <asp:ListItem Value="09">09</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="11">11</asp:ListItem>
                                    <asp:ListItem Value="12">12</asp:ListItem>
                                </asp:dropdownlist> - 
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="tb_Year" runat="server" Width="100px" MaxLength="4" placeholder="YYYY" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" class="auto-style2"> <asp:CustomValidator ID="CardValidator" runat="server" ErrorMessage="Please ensure that ALL fields are filled" ForeColor="Red" OnServerValidate="Validation"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                             <td colspan="5"><asp:Label ID="control" runat="server" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="auto-style2" colspan="5">
                                <asp:Button ID="btn_Save" runat="server" Text="Save" Width="137px" OnClick="btn_Save_Click" />
                                <asp:Button ID="btn_Back" runat="server" Text="Back" Width="137px" OnClick="btn_Back_Click" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</asp:Content>

