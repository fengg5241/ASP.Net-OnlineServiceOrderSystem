<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="PaymentMethods.aspx.cs" Inherits="PaymentMethods" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        #tbl_Card tr td:hover
        {
            background-color:  #cccccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="Sidebar"">
        <ul class="SidebarList">
            <li><a runat="server" href="~/UserPages/PaymentMethods.aspx">Payment Methods</a></li>
            <li><a runat="server" href="~/UserPages/AddressBook.aspx">Address Book</a></li>
            <li><a runat="server" href="~/UserPages/PastTransactions.aspx">Order History</a></li>
        </ul>
    </div>
    <div class ="body">
        <div class= "List" id="PaymentList" >
            <div class ="Note" id="CardNote">
                <h1>Payment Methods</h1>
                <p>
                Manage and Add Cards to Your Account.
                </p>
                <h3>Your Stored Payment Methods</h3>
                <asp:ImageButton ID="btn_Add" runat="server" Width="175px" ImageUrl="~/Images/AddCard.jpg" OnClick="btn_Add_Click" alt="Add New Card" />
            </div>
                <asp:ListView ID="lv_Card" runat="server" GroupItemCount="3" GroupPlaceholderID="groupPlaceholder" ItemPlaceholderID="itemPlaceholder" OnItemDeleting="lv_Card_ItemDeleting" 
                OnItemEditing="lv_Card_ItemEditing" OnItemCanceling="lv_Card_ItemCanceling" OnItemUpdating="lv_Card_ItemUpdating" OnItemDataBound="OnItemDataBound">
                <LayoutTemplate>
                <table id="tbl_Card">
                     <tr ID="groupPlaceholder" runat="server">
                     </tr>
                </table>
                </LayoutTemplate>
                <GroupTemplate>
                        <tr>
                            <td ID="itemPlaceholder" runat="server">
                            </td>
                        </tr>
                 </GroupTemplate>
                 <ItemTemplate>
                        <td width="200px" id="add_details"> 
                         <asp:Label ID ="lbl_Id" runat="server" Text='<%# Eval("Id") %>' Visible="false" />
                         <asp:Image ID="img_CardType" runat="server" Width="45px" ImageURL='<%# GetImage((string)Eval("CardType")) %>'/><br />          
                         <asp:Label ID="lbl_CardType" runat="server" style="font-size:1.5em;" Text ='<%# Eval("CardType") %>'/><br />
                         <b>Name on Card: </b><br /><asp:Label ID="lbl_CardName" runat="server" Text ='<%# Eval("Name") %>'/><br />
                         <b>Card No: </b><br /><asp:Label ID="lbl_CardNo" runat="server" Text ='<%# Eval("CardNo") %>'/><br />
                         <b>Expiry Date: </b><br /><asp:Label ID="lbl_CardExpiry" runat="server" Text ='<%# Eval("ExpiryMonth","") + "/" + Eval("ExpiryYear","") %>' /><br />
                         <div id="button">
                         <asp:LinkButton ID="btn_EditCard" runat="server" style="text-decoration:none;" CommandName="Edit">Edit</asp:LinkButton> |
                         <asp:LinkButton ID="btn_DeleteCard" runat="server" style="text-decoration:none;" CommandName="Delete">Delete</asp:LinkButton>
                        </div>
                        </td>               
                 </ItemTemplate>
                <EditItemTemplate>
                    <td width="200px" id="edit_details"> 
                    <asp:Label ID ="lbl_Id" runat="server" Text='<%# Eval("Id") %>' Visible="false" /> 
                    Card Type: <br /><asp:DropDownList ID="list_Type" runat="server" Height="31px"> </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="TypeValidator" runat="server" ControlToValidate="list_Type" InitialValue="0" Text="*" ErrorMessage="Card Type Required" ForeColor="Red" />
                    <asp:Image ID="img_Type" runat="server" Width ="45px" />
                    <asp:Label ID="lbl_Type" runat="server" Text='<%# Eval("CardType") %>' Visible="false"></asp:Label>
                    <br />
                    Card No:</br><asp:TextBox ID="tb_CardNo" runat="server" Text='<%# Bind("CardNo") %>' placeholder="CardNo"/>
                        <asp:RequiredFieldValidator ID="CardNoValidator" runat="server" Text="*" ErrorMessage="Card No Required" ControlToValidate="tb_CardNo" ForeColor="Red"/><br />
                    Name on Card: <br /><asp:TextBox ID="tb_Name" runat="server" Text='<%# Bind("Name") %>' placeholder="Name on Card"/>
                        <asp:RequiredFieldValidator ID="CardNameValidator" runat="server" Text="*" ErrorMessage="Name on Card Required" ControlToValidate="tb_Name" ForeColor="Red" /><br />
                    Expiry Month: </br><asp:TextBox ID="tb_Month" runat="server" Width="100px" MaxLength="2" placeholder="MM" Text='<%# Bind("ExpiryMonth") %>' onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="MonthValidator" runat="server" Text="*" ErrorMessage="Expiry Month Required" ControlToValidate="tb_Month" ForeColor="Red" /><br />
                    Expiry Year: </br><asp:TextBox ID="tb_Year" runat="server" Width="100px" MaxLength="4" placeholder="YYYY" Text='<%# Bind("ExpiryYear") %>' onkeydown = "return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="YearValidator" runat="server" Text="*" ErrorMessage="Expiry Year Required" ControlToValidate="tb_Year" ForeColor="Red" />
                    <div id="editbuttons">
                    <asp:LinkButton ID="btn_Update" runat="server" style="text-decoration:none;" CommandName="Update">Update</asp:LinkButton> |
                    <asp:LinkButton ID="btn_Cancel" runat="server" style="text-decoration:none;" CommandName="Cancel" CausesValidation="false" >Cancel</asp:LinkButton>
                    </div>
                        <asp:ValidationSummary ID="summary" runat="server" HeaderText="NOTE:" ForeColor="Red"/>
                    <br />
                    <asp:Label ID="control" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </EditItemTemplate>
                <GroupSeparatorTemplate>
                  <tr runat="server">
                    <td colspan="3"><hr /></td>
                  </tr>
                 </GroupSeparatorTemplate> 
                </asp:ListView>

    </div>
</div>
</asp:Content>

