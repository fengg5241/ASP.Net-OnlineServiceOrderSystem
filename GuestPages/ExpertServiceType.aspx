<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ExpertServiceType.aspx.cs" Inherits="ExpertServiceType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 112px;
        }
        .auto-style6 {
            width: 230px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     <h2>Choose Services:</h2>
    <p>Select services that you are experienced in.</p>
       <table class="auto-style4">
           <tr>
               <td class="auto-style5">Cleaning:</td>
               <td class="auto-style6">
                   <asp:CheckBoxList ID="cblCleaning" runat="server">
                       <asp:ListItem>Window Cleaning</asp:ListItem>
                       <asp:ListItem>Part-Time Maid</asp:ListItem>
                       <asp:ListItem>Laundry</asp:ListItem>
                       <asp:ListItem>Ironing Services</asp:ListItem>
                       <asp:ListItem>Others</asp:ListItem>
                   </asp:CheckBoxList>
               </td>
               <td>&nbsp;</td>
           </tr>
           <tr>
               <td class="auto-style5">Repair:</td>
               <td class="auto-style6">
                   <asp:CheckBoxList ID="cblRepair" runat="server">
                       <asp:ListItem Value="Lightbulb Repair">Lightbulb Repair</asp:ListItem>
                       <asp:ListItem>Door Repair</asp:ListItem>
                       <asp:ListItem>Plumber</asp:ListItem>
                       <asp:ListItem>All types of Repair</asp:ListItem>
                       <asp:ListItem>Others</asp:ListItem>
                   </asp:CheckBoxList>
               </td>
               <td>&nbsp;</td>
           </tr>
       </table>
       <asp:Button ID="btnFinish" runat="server" Text="Finish" OnClick="btnFinish_Click" />
    <br />
</asp:Content>

