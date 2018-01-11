<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="ExpertChooseServiceType.aspx.cs" Inherits="ExpertChooseServiceType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .Description{
            font-size: 25px;
        }
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
               <td class="auto-style5">Service Type:</td>
               <td class="auto-style6">
                   <asp:CheckBoxList ID="cblServices" runat="server">
                       <asp:ListItem Value="CL">Cleaning</asp:ListItem>
                       <asp:ListItem Value="RP">Repair</asp:ListItem>
                   </asp:CheckBoxList>
               </td>
               <td>
                  <div class="Description"> Service Description:</div>
                   <asp:TextBox ID="tbServiceDesc" runat="server" Height="150px" Width="416px" placeholder="E.g. Part-Time Maid, Laundry, Door Repair... etc..."></asp:TextBox>
                   <br />
                   <br />
               </td>
           </tr>
           </table>
       <asp:Button ID="btnFinish" runat="server" Text="Finish" OnClick="btnFinish_Click" BackColor="#FF6699" Width="140px" />
    <br />
  
</asp:Content>

