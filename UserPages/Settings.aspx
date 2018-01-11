<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="Note" id="SettingsNote" style="float: none;">
        <h1>My Settings</h1>
    </div>
    <div class="SettingsTable">     
        <table>
            <tr>
                <td>
                    <div class="Col" id="PaymentCol">
                       <a runat="server" href="~/UserPages/PaymentMethods.aspx">
                        <div class="Icon" style= "display: inline-block">
                            <img alt="Payment Methods" src="../Images/CCLogo.png" />
                        </div>
                        <div class="Text" style="display: inline-block">
                           <p>
                             <strong>My Payment Methods</strong>
                             <br />Edit or Add Payment Methods
                           </p>
                        </div>
                      </a>
                    </div>
                 </td>
                <td>
                     <div class="Col" id="AddressCol">
                       <a runat="server" href="~/UserPages/AddressBook.aspx">
                        <div class="Icon" style= "display: inline-block">
                            <img alt="Payment Methods" src="../Images/addressLogo.png" />
                        </div>
                        <div class="Text" style="display: inline-block">
                           <p>
                             <strong>My Address Book</strong>
                             <br />Edit / Add Addresses for Orders
                           </p>
                        </div>
                      </a>
                    </div>
                </td>
                <td>
                    <div class="Col" id="AddressCol">
                       <a runat="server" href="~/UserPages/PastTransactions.aspx">
                        <div class="Icon" style= "display: inline-block">
                            <img alt="Payment Methods" src="../Images/orderIcon.png" />
                        </div>
                        <div class="Text" style="display: inline-block">
                           <p>
                             <strong>My Past Transactions</strong>
                             <br />View your Past Orders
                           </p>
                        </div>
                      </a>
                    </div>
                </td>
            </tr>
        </table>
       </div>
</asp:Content>

