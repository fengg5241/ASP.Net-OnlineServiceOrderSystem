<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="OrderForm.aspx.cs" Inherits="OrderForm" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
        .auto-style3 {
            height: 12px;
        }
        .auto-style4 {
            height: 72px;
        }
        fieldset
        {
            background-color : #cccccc ;
            border-radius: 15px;
            border-color: #51AAC3;
        }
        fieldset:hover{
            background-color: darkgray ;
        }
        .button
        {
            border-radius:5px;
            border-color: #51AAC3;
            background-color: lightgray;
            color: #51AAC3;
            font-family: 'Century Gothic';
            font-weight: bold;
        }
        .button:hover
        {
            background-color: #787878;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="body">
        <div class="UserDetails">
            <h3>Order Summary:</h3>
            <fieldset style ="width:707px">
                <table>
                <tr>
                    <td>Expert: <asp:Label ID="lbl_Name" runat="server" /></td>
                </tr>
                <tr>
                    <td>Service: <asp:Label ID="lbl_Service" runat="server" /></td>
                </tr>
                <tr>
                    <td>Duration: <asp:Label ID="lbl_Duration" runat="server" /></td>
                </tr>
                <tr>
                    <td>Total Price: $<asp:Label ID="lbl_Price" runat="server" /></td>
                </tr>
            </table>
</fieldset>
            <asp:Panel ID="panel_Discount" runat="server">
            <h3>Got a <a runat="server" href="~/UserPages/Rewards.aspx">Coupon Code</a>? Redeem it here!</h3>
                <fieldset style="width: 350px;">
                  <table>
                     <tr>
                        <td><b>Enter Your Coupon Code:</b></td>
                     </tr>
                      <tr>
                          <td colspan="2"><asp:TextBox ID="tb_Coupon" runat="server"></asp:TextBox>
                          <asp:Button ID="btn_Coupon" runat="server" Text="Redeem" CausesValidation="False" OnClick="btn_Coupon_Click" CssClass="button"/></td>
                      </tr>
                      <tr>
                          <td colspan="2"><asp:Label ID="lbl_Coupon" runat="server" Text="<b>NOTE:</b> Please Redeem before Checkout!" ForeColor="Red"></asp:Label></td>
                      </tr>
                      <tr>
                          <td colspan="2">You have <asp:Label ID="lbl_Count" runat="server" Font-Bold="true" Font-Underline="true"></asp:Label> unredeemed coupon(s). <asp:LinkButton ID="btn_ViewCoupons" runat="server" CausesValidation="false" Font-Size="Small" OnClick="btn_ViewCoupons_Click">View</asp:LinkButton><asp:LinkButton ID="btn_HideCoupons" runat="server" CausesValidation="false" Font-Size="Small" Visible="false" OnClick="btn_HideCoupons_Click">Hide</asp:LinkButton></td>
                      </tr>
                      </table>
                    </fieldset>
            </asp:Panel>

            <asp:Panel ID="Panel_Rewards" runat="server" Visible="false">
                <fieldset style="width: 350px;">
                <asp:GridView ID="gv_Rewards" runat="server" AutoGenerateColumns="False" OnRowDataBound ="OnRowDataBound" Width="696px">
                <Columns>
                    <asp:BoundField DataField="CouponCode" ItemStyle-Font-Bold="true" HeaderText="Coupon Code" />
                    <asp:BoundField DataField="CouponType" HeaderText="Coupon Value($)" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
            </fieldset>
            </asp:Panel>
            <asp:Panel ID="panel_Payment" runat="server" >
             <h3>Payment Method</h3>
              <form>
                    <fieldset style="width: 707px">
                        <table>
                            <tr>
                                <td style="font-size:1.1em;" colspan="3"><b>Select A Payment Method</b></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="auto-style1">
                                    <asp:DropDownList ID="ddl_SelectCard" runat="server" Width="335px" AutoPostBack = "true" OnSelectedIndexChanged ="ddl_SelectCard_SelectedIndexChanged" />
                                    <asp:RequiredFieldValidator ID="SelectCardValidator" runat="server" ErrorMessage="No Card Selected" ControlToValidate="ddl_SelectCard" InitialValue="0" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:ImageButton ID="btn_Paypal" runat="server" Text="Next Step" OnClick="btn_Paypal_Click" Visible="false" ImageUrl="~/Images/logoPaypal.png" Width="200px" CausesValidation="false" /></td>
                            </tr>
                            <tr>
                                <td class="auto-style4"><b><asp:Label ID="lbl_CardType" runat="server" Text="Card Type: " Visible="false"></asp:Label></b></td>
                                <td class="auto-style4"><asp:DropDownList ID="ddl_CardType" runat="server" Width="200px" Enabled="false" Visible="false" OnSelectedIndexChanged="ddl_CardType_SelectedIndexChanged" AutoPostBack="true" >
                                    <asp:ListItem>Please Select</asp:ListItem>
                                    <asp:ListItem>AMEX</asp:ListItem>
                                    <asp:ListItem>Mastercard</asp:ListItem>
                                    <asp:ListItem>Visa</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Image ID="img_Type" runat="server" Width="45px"></asp:Image>
                                    <asp:RequiredFieldValidator ID="CardTypeValidator" runat="server" ErrorMessage="No Card Type Selected" ControlToValidate="ddl_CardType" InitialValue="Please Select" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><b><asp:Label ID="lbl_CardNo" runat="server" Text="Card Number: " Visible="false"></asp:Label></b></td>
                                <td><asp:TextBox ID="tb_CardNo" runat="server" Width="400px" Enabled="false" Visible="false" MaxLength="16" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox></td>
                                <td><asp:RequiredFieldValidator ID="CardNoValidator" runat="server" ErrorMessage="Card No Required" ControlToValidate="tb_CardNo" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td><b><asp:Label ID="lbl_CardName" runat="server" Text="Name on Card: " Visible="false"></asp:Label></b></td>
                                <td><asp:TextBox ID="tb_CName" runat="server" Width="400px" Enabled="false" Visible="false"></asp:TextBox></td>
                                <td><asp:RequiredFieldValidator ID="CNameValidator" runat="server" ErrorMessage="Name on Card Required" ControlToValidate="tb_CName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td class="auto-style3"><b><asp:Label ID="lbl_Expiry" runat="server" Text="Expiry Date: " Visible="false"></asp:Label></b></td>
                                <td class="auto-style3"><asp:DropDownList ID="ddl_Month" runat="server" Width="75px" Enabled="false" Visible="false">
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
                                    </asp:DropDownList>

                                    <asp:TextBox ID="tb_Year" runat="server" Width="100px" MaxLength="4" placeholder="YYYY" Enabled="false" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);" Visible="false"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="YearValidator" runat="server" ErrorMessage="Expiry Year Required" ControlToValidate="tb_Year" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                                <asp:RequiredFieldValidator ID="MonthValidator" runat="server" ErrorMessage="No Expiry Month Selected" ControlToValidate="ddl_Month" InitialValue="MM" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </tr>
                            <tr>
                                <td colspan="3"><asp:Label ID="lbl_EnterCVV" runat="server" Text="Please Enter CVV: " Visible="false" CssClass="EnterCVV"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="cvv"><b><asp:Label ID="lbl_CVV" runat="server" Text="CVV2: " Visible="false"></asp:Label><b></td>
                                <td class="cvv"><asp:TextBox ID="tb_CVV" runat="server" Width="100px" MaxLength="3" TextMode="Password" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);" Visible="false"></asp:TextBox></td>
                                <td><asp:RequiredFieldValidator ID="CVVValidator" runat="server" ErrorMessage="CVV2 Required" ControlToValidate="tb_CVV" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="3"><asp:Label ID="cardcontrol" runat="server" Font-Bold="True" Visible="false" /></td>
                            </tr>
                        </table>
                    </fieldset>
                  </asp:Panel>

        <asp:Panel ID="panel_Address" runat="server" >
            <h3>Address</h3>
                <fieldset style="width: 707px">
                  <table>
                     <tr>
                        <td style="font-size:1.1em;" colspan="3"><b>Select An Address</b></td>
                     </tr>
                     <tr>
                         <td colspan ="3" class="auto-style1">
                             <asp:DropDownList ID="ddl_SelectAddress" runat="server" Width="335px" OnSelectedIndexChanged="ddl_SelectAddress_SelectedIndexChanged" AutoPostBack = "true" ViewStateMode="Enabled" EnableViewState="true"></asp:DropDownList></td>
                         <td><asp:RequiredFieldValidator ID="SelectAddressValidator" runat="server" ErrorMessage="No Address Selected" ControlToValidate="ddl_SelectAddress" InitialValue="0" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                     </tr>
                     <tr>
                        <td><b>Reference Name: </b></td>
                        <td><asp:TextBox ID="tb_RefName" runat="server" placeholder="eg: Home, Work, etc." Width="400px" Enabled="false"></asp:TextBox></td>
                     </tr>
                     <tr>
                                    <td><b>First Name: </b></td>
                                    <td><asp:TextBox ID="tb_FName" runat="server" Width="400px" Enabled="false"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="FNameValidator" runat="server" Text="*" ErrorMessage="First Name Required" ControlToValidate="tb_FName" ForeColor="Red"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td><b>Last Name: </b></td>
                                    <td ><asp:TextBox ID="tb_LName" runat="server" Width="400px" Enabled="false"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="LNameValidator" runat="server" ErrorMessage="Last Name Required" ControlToValidate="tb_LName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td><b>Address Line 1: </b></td>
                                    <td><asp:TextBox ID="tb_Address1" runat="server" placeholder="Street Address, P.O Box, Company Name, c/o" Width="400px" Enabled="false"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="Address Line 1 Required" ControlToValidate="tb_Address1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td><b>Address Line 2: </b></td>
                                    <td><asp:TextBox ID="tb_Address2" runat="server" placeholder="Apartment, Suite, unit, building, floor, etc." Width="400px" Enabled="false"></asp:TextBox></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><b>Postcode / Zip: </b></td>
                                    <td><asp:TextBox ID="tb_Zip" runat="server" Width="400px" MaxLength="6" Enabled="false" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="ZipValidator" runat="server" ErrorMessage="Postcode / Zip Required" ControlToValidate="tb_Zip" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td><b>Contact Number: </b></td>
                                    <td><asp:TextBox ID="tb_Phone" runat="server" Width="400px" MaxLength="8" Enabled="false" onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox></td>
                                    <td><asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ErrorMessage="Contact Number Required" ControlToValidate="tb_Phone" Text="*" ForeColor="Red"></asp:RequiredFieldValidator></td>
                                </tr>
                      </table>
                </fieldset>
                   </asp:Panel>
                  <br />
                        <asp:Label ID="control" runat="server"></asp:Label>
                   <br />
                   <asp:ValidationSummary ID="summary" runat="server" HeaderText="NOTE:" ForeColor="Red"/>
                    <br />
                    <div class ="buttons">
                        &nbsp;<asp:ImageButton ID="btn_Checkout" runat="server" Text="Checkout" OnClick="btn_Checkout_Click" ImageAlign="Middle" ImageUrl="~/Images/Checkout1.jpg" Width="120px" style="border-radius: 5px; border: 1.5px solid #51AAC3 ;" />
                    </form>
                </div>
        </div>
</asp:Content>

