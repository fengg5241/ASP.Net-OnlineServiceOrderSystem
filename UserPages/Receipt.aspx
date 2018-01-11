<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Receipt.aspx.cs" Inherits="Receipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>Receipt</title>
     <script type="text/javascript">
  function printpage() {

   var getpanel = document.getElementById("<%= print.ClientID%>");
   var MainWindow = window.open('', '', 'height=500,width=800');
   MainWindow.document.write('<html><head><title></title>');
   MainWindow.document.write('</head><body>');
   MainWindow.document.write('<table><tr><td align="center">');
   MainWindow.document.write('<img src="../Images/Logo.png" align="middle" width="600px"/>');
   MainWindow.document.write('</td><tr><td align="center">');
   MainWindow.document.write('<h2>BYTM Service Receipt<h2>');
   MainWindow.document.write('</td></tr>');
   MainWindow.document.write('<tr><td>');
   MainWindow.document.write(getpanel.innerHTML);
   MainWindow.document.write('</td></tr>');
   MainWindow.document.write('<tr><td align="center"><h3>Thank you for your order.<h3>');
   MainWindow.document.write('</td></tr></table>');
   MainWindow.document.write('</body></html>');
   MainWindow.document.close();
   setTimeout(function () {
    MainWindow.print();
   }, 500);
   return false;

  }
     </script>
    <style type="text/css">
        .receipt{
            margin-left:27%;
        }
        .auto-style1 {
            width: 154px;
        }
        .auto-style2 {
            width: 158px;
        }
        .auto-style3 {
            width: 127px;
        }
        fieldset{
            border-radius:15px;
            background-color: #cccccc;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="receipt">
        <h2>Thank You for Your Order!</h2>
        &nbsp;
        <asp:Panel ID="print" runat="server">
        <h2>Your Order Details: </h2>
     <fieldset style="width:707px">
        <table>
            <tr>
                <td class="auto-style3">Order ID: </td>
                <td><asp:Label ID="lbl_OrderId" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style3">Name:</td>
                <td><asp:Label ID="lbl_OrderName" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style3">Service:</td>
                <td><asp:Label ID="lbl_Service" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style3">Price:</td>
                <td><asp:Label ID="lbl_Price" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style3">Duration:</td>
                <td><asp:Label ID="lbl_Duration" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style2">Points Earned: </td>
                <td><asp:Label ID="lbl_PointsEarned" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style2">Coupon Used: </td>
                <td><asp:Label ID="lbl_CouponUsed" runat="server" Text="NIL" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style2">Date/Time Ordered: </td>
                <td><asp:Label ID="lbl_Created" runat="server" ></asp:Label></td>
            </tr>
        </table>
        </fieldset>
        <h2>Your Payment: </h2>
        <fieldset style="width:707px">
            <table>
            <tr>
                <td class="auto-style2">Card Type: </td>
                <td><asp:Label ID="lbl_CardType" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style2">Card No: </td>
                <td><asp:Label ID="lbl_CardNo" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style2">Name on Card: </td>
                <td><asp:Label ID="lbl_CardName" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style2">Card Expiry: </td>
                <td><asp:Label ID="lbl_Expiry" runat="server" ></asp:Label></td>
            </tr>
            </table>
        </fieldset>
        <h2>Your Address: </h2>
        <fieldset style="width:707px">
            <table>
            <tr>
                <td class="auto-style1">Name: </td>
                <td><asp:Label ID="lbl_Name" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1">Address Line 1: </td>
                <td><asp:Label ID="lbl_AddressLine1" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1">Address Line 2: </td>
                <td><asp:Label ID="lbl_AddressLine2" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1">Zip: </td>
                <td><asp:Label ID="lbl_PostalCode" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1">Contact No.: </td>
                <td><asp:Label ID="lbl_ContactNo" runat="server" ></asp:Label></td>
            </tr>
            </table>
        </fieldset>
     </asp:Panel>
        <br />
        <asp:Button ID="btn_Print" runat="server" Text="Print Receipt" OnClientClick="return printpage();" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btn_Google" runat="server" Text="View Address in Google Maps" OnClick="btn_Google_Click" />
</div>
</asp:Content>

