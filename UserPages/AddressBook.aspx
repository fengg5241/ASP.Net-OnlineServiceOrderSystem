
<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="AddressBook.aspx.cs" Inherits="AddressBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">       
     #tbl_Address td:hover
        {
            background-color:  #cccccc;
        }
    .Note{
        font-size: 12px;
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
        <div class = "List" id="AddressList" >
            <div class ="Note" id="AddressNote">
                <h1>Address Book</h1>
                <p>
                <strong>Please note</strong>
                <br /> Editing any address after an order has been placed will not change the delivery address for that order. 
                <br /> If you need to change an address on any order before it is dispatched, please <a runat="server" href="~/UserPages/ContactUs.aspx">contact us</a> and we will be happy to change it for you.
                </p>
                <h3>Your Stored Delivery Addresses</h3>
                <asp:ImageButton ID="btn_Add" runat="server" Width="175px" ImageUrl="~/Images/AddAddress.jpg" OnClick="btn_Add_Click" alt="Add New Address" />
            </div>
            
            <asp:ListView ID="lv_Address" runat="server" GroupItemCount="3" GroupPlaceholderID="groupPlaceholder" ItemPlaceholderID="itemPlaceholder" OnItemDeleting="lv_Address_ItemDeleting" 
                OnItemEditing="lv_Address_ItemEditing" OnItemCanceling="lv_Address_ItemCanceling" OnItemUpdating="lv_Address_ItemUpdating">
                <LayoutTemplate>
                <table id="tbl_Address">
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
                         <b><asp:Label ID="lbl_RefName" runat="server" style="font-size:1.5em;" Text ='<%# Eval("ReferenceName") %>'/></b><br />
                         <asp:Label ID="lbl_Name" runat="server" Text ='<%# Eval("FName","") + " " + Eval("LName","") %>' /><br />
                         <asp:Label ID="lbl_Address1" runat="server" Text ='<%# Eval("AddressLine1") %>'/><br />
                         <asp:Label ID="lbl_Address2" runat="server" Text ='<%# Eval("AddressLine2") %>'/><br />
                         <asp:Label ID="lbl_Zip" runat="server" Text ='<%# Eval("PostCode") %>'/><br />
                         <asp:Label ID="lbl_Phone" runat="server" Text ='<%# Eval("ContactNo") %>'/><br />
                         <div id="button">
                         <asp:LinkButton ID="btn_EditAddress" runat="server" style="text-decoration:none;" CommandName="Edit">Edit</asp:LinkButton> |
                         <asp:LinkButton ID="btn_DeleteAddress" runat="server" style="text-decoration:none;" CommandName="Delete">Delete</asp:LinkButton>
                        </div>
                        </td>               
                 </ItemTemplate>
                <EditItemTemplate>
                    <td width="200px" id="edit_details"> 
                    <asp:Label ID ="lbl_Id" runat="server" Text='<%# Eval("Id") %>' Visible="false" /> 
                    Reference Name:<asp:TextBox ID="tb_RefName" runat="server" Text='<%# Bind("ReferenceName") %>' placeholder="Reference Name"/><br />
                    First Name:<asp:TextBox ID="tb_FName" runat="server" Text='<%# Bind("FName") %>' placeholder="First Name" /><br />
                                <asp:RequiredFieldValidator ID="FNameValidator" runat="server" Text="*" ErrorMessage="First Name Required" ControlToValidate="tb_FName" ForeColor="Red" />
                    Last Name:<asp:TextBox ID="tb_LName" runat="server" Text='<%# Bind("LName") %>' placeholder="Last Name"/><br />
                                <asp:RequiredFieldValidator ID="LNameValidator" runat="server" ErrorMessage="Last Name Required" ControlToValidate="tb_LName" Text="*" ForeColor="Red" />
                    Address Line 1:<asp:TextBox ID="tb_Address1" runat="server" Text='<%# Bind("AddressLine1") %>' placeholder="Address Line 1"/><br />
                                <asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="Address Line 1 Required" ControlToValidate="tb_Address1" Text="*" ForeColor="Red" />
                    Address Line 2:<asp:TextBox ID="tb_Address2" runat="server" Text='<%# Bind("AddressLine2") %>' placeholder="Address Line 2"/><br />
                    Zip/PostCode:<asp:TextBox ID="tb_Zip" runat="server" Text='<%# Bind("PostCode") %>' placeholder="Zipcode / Postal Code"/><br />
                                <asp:RequiredFieldValidator ID="ZipValidator" runat="server" ErrorMessage="Postcode / Zip Required" ControlToValidate="tb_Zip" Text="*" ForeColor="Red" />
                    ContactNo:<asp:TextBox ID="tb_Phone" runat="server" Text='<%# Bind("ContactNo") %>' placeholder="Contact No."/><br />
                                <asp:RequiredFieldValidator ID="PhoneValidator" runat="server" ErrorMessage="Contact Number Required" ControlToValidate="tb_Phone" Text="*" ForeColor="Red" />
                    <div id="editbuttons">
                    <asp:LinkButton ID="btn_Update" runat="server" style="text-decoration:none;" CommandName="Update">Update</asp:LinkButton> |
                    <asp:LinkButton ID="btn_Cancel" runat="server" style="text-decoration:none;" CommandName="Cancel" CausesValidation="false" >Cancel</asp:LinkButton>
                    </div>
                    <asp:ValidationSummary ID="summary" runat="server" HeaderText="NOTE:" ForeColor="Red" />
                    <asp:Label ID="control" runat="server"></asp:Label>
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

