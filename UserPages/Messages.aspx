<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Messsages"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .user:not(:empty) {
            width: 267px;
            background-color: #91BBEC;
            font-family: 'Century Gothic';
            font-size: 15px;
            font-weight:500;
        }
        .expert:not(:empty) {
            width: 267px;
            background-color: #cccccc;
            font-family: 'Century Gothic';
            font-size: 15px;
            font-weight:500;
        }
        .space {
            width: 133px;
            font-size: 10px;
        }
         .space2 {
            width: 133px;
            text-align: right;
            font-size: 10px;
        }
        .expert:empty, .user:empty, .gap {
            background-color: none;
             width: 267px;
        }
        th{
            background-color: #787878;
            border-top-left-radius:10px;  
            border-top-right-radius:10px;
        }
        .body {
            margin-left: 25%;
        }
        table {
            border-collapse: separate;
            border-spacing: 0 5px;
        }
    </style>
     <script type="text/javascript">
        function UserConfirmation() {
            return confirm("Are you sure?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="body">
        <asp:Button ID="btn_Solved" runat="server" Text="Set Solved" OnClientClick="if (! UserConfirmation()) return false ;" OnClick="btn_Solved_Click" />
         <table cellspacing="0">           
           <tr>
             <th style="width:800px; height:40px;" colspan="3">SUPPORT TICKET</th>
           </tr> 
        </table>
    <div id="ChatTable" style="position:relative; width:800px; height:400px; overflow: scroll; overflow-x: hidden;">
    <asp:Repeater ID ="rpt_Table" runat ="server">
        <HeaderTemplate>
        <table>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Label ID ="lbl_Id" runat="server" Visible="false" />
            <tr>
                <td style ="font-weight:bold;"><asp:Label ID="Label1" runat="server" Text='<%#Eval("FirstName","") + " " + Eval("LastName","") %>' Visible='<%#Eval("Type").ToString().Equals("Expert") %>' /></td>
                <td class ="gap"></td>
                <td style="text-align:right; font-weight:bold;"><asp:Label ID="Label2" runat="server" Text="You" Visible='<%#Eval("Type").ToString().Equals("User") %>' /></td>
            </tr> 
            <tr>
                <td class="user"><asp:Label ID="lbl_expert" runat="server" Text='<%#Eval("Message")%>' Visible='<%#Eval("Type").ToString().Equals("Expert") %>' /></td>
                <td class ="gap"></td>
                <td class="expert"><asp:Label ID="lbl_user" runat="server" Text=' <%#Eval("Message")%>' Visible='<%#Eval("Type").ToString().Equals("User") %>' /></td>
            </tr>
            <tr>
                <td class="space"><asp:Label ID="lbl_expertdatetime" runat="server" Text='<%#Eval("DateTime") + ", " + Eval("Seen","")%>' Visible='<%#Eval("Type").ToString().Equals("Expert") %>' /> </td>
                <td class ="gap"></td>
                <td class="space2"><asp:Label ID="lbl_userdatetime" runat="server" Text='<%#Eval("DateTime") + ", " + Eval("Seen","")%>' Visible='<%#Eval("Type").ToString().Equals("User") %>'  /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate> 
        </table>
        </FooterTemplate>
    </asp:Repeater>
</div>


        <div class="Input">
         <table width ="800px">
            <tr>
                <td style="background-color:#91BBEC; border-radius:5px; width:800px; height:25px;"><b>REPLY:</b></td>
            </tr>
        </table>
            <asp:Panel ID="panel_input" runat="server">
                <asp:TextBox ID="tb_Reply" runat="server" Width="700px" MaxLength="500"></asp:TextBox>
                <asp:Button ID="btn_Reply" runat="server" Text="Send" Width="100px" OnClick="btn_Reply_Click"/>
            </asp:Panel>
        </div>
   </div>
</asp:Content>

