<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="UserContactStart.aspx.cs" Inherits="UserContactStart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <div class="Note" id="SettingsNote" style="float: none;">
        <h1>Contact Us</h1>
    </div>
    <div class="SettingsTable">     
        <table>
            <tr>
                <td>
                    <div class="Col" id="PaymentCol">
                       <a runat="server" href="~/UserPages/MyTickets.aspx">
                        <div class="Icon" style= "display: inline-block">
                            <img alt="Payment Methods" src="../Images/ticketLogo.png" />
                        </div>
                        <div class="Text" style="display: inline-block">
                           <p>
                             <strong>Contact Expert Anonymously</strong>
                             <br />Internal Anonymous Support
                           </p>
                        </div>
                      </a>
                    </div>
                 </td>
                <td>
                     <div class="Col" id="AddressCol">
                       <a runat="server" href="~/UserPages/ContactUs.aspx">
                        <div class="Icon" style= "display: inline-block">
                            <img alt="Payment Methods" src="../Images/contactLogo.png" />
                        </div>
                        <div class="Text" style="display: inline-block">
                           <p>
                             <strong>Email to Administrator</strong>
                             <br />Contact the site admins for general enquiries or issues.
                           </p>
                        </div>
                      </a>
                    </div>
                </td>
            </tr>
        </table>
       </div>
</asp:Content>

