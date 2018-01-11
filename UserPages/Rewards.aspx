<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="Rewards.aspx.cs" Inherits="Rewards" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 268px;
        }
        #content{
            margin-left:30%;
        }
        .couponList{
            margin-left: 25%;
        }
        #tbl_Rewards
        {
            background-color :#DEE0DF ;
            border-radius: 15px;
            border: 1px solid #51AAC3  ;
        }
       #tbl_Rewards td:hover
        {
            background-color:  #cccccc;
        }
       .image:hover {
          width: 268px;
          animation: shake 0.82s cubic-bezier(.36,.07,.19,.97) both;
          transform: translate3d(0, 0, 0);
          backface-visibility: hidden;
          perspective: 1000px;
        }
       @keyframes shake {
          10%, 90% {
            transform: translate3d(-1px, 0, 0);
          }
  
          20%, 80% {
            transform: translate3d(2px, 0, 0);
          }

          30%, 50%, 70% {
            transform: translate3d(-4px, 0, 0);
          }

          40%, 60% {
            transform: translate3d(4px, 0, 0);
          }
        </style>
    <script type="text/javascript">
        function UserConfirmation() {
            return confirm("Are you sure?");
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class ="body">
        <div id= "content">
            <h1>BTYM Rewards</h1>
            <p>Redeem your reward points for coupons here! You will earn 1 point with every dollar spent.</p>
            <p><b>Your Points: </b><asp:Label ID="lbl_balance" runat="server"></asp:Label></p>
            <asp:ImageButton ID="btn_Coupon" runat="server" Width="175px" ImageUrl="~/Images/ViewCoupon.jpg" alt="View My Coupons" OnClick="btn_Coupon_Click" />
             </div><div class ="couponList">
            <asp:Panel ID="CouponList" runat="server">
            <table id="tbl_Rewards">
                 <tr>
                    <td align="center" class="auto-style1"><asp:Label ID="title_500" runat="server" Text="$5 Coupon Code" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
                    <td align="center" class="auto-style1"><asp:Label ID="title_1000" runat="server" Text="$10 Coupon Code" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
                    <td align="center" class="auto-style1"><asp:Label ID="title_1500" runat="server" Text="$15 Coupon Code" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
                </tr>
                <tr>
                    <td align="center" class="image"><asp:Image ID="img_500" runat="server" ImageUrl="~/Images/bronze.png" Width="250px" /></td>
                    <td align="center" class="image"><asp:Image ID="img_1000" runat="server" ImageUrl="~/Images/silver.png" Width="250px"/></td>
                    <td align="center" class="image"><asp:Image ID="img_1500" runat="server" ImageUrl="~/Images/gold.png" Width="250px"/></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:Label ID="price_500" runat="server" Text="50 Points" Font-Bold="true" /></td>
                    <td align="center" class="auto-style1"><asp:Label ID="price_1000" runat="server" Text="100 Points" Font-Bold="true" /></td>
                    <td align="center" class="auto-style1"><asp:Label ID="price_1500" runat="server" Text="150 Points" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:Button ID="btn_500" runat="server" Text="Redeem" OnClick="btn_500_Click" Width="83px" OnClientClick="if (! UserConfirmation()) return false ;"/></td>
                    <td align="center" class="auto-style1"><asp:Button ID="btn_1000" runat="server" Text="Redeem" OnClick="btn_1000_Click" Width="83px" OnClientClick="if (! UserConfirmation()) return false ;" /></td>
                    <td align="center" class="auto-style1"><asp:Button ID="btn_1500" runat="server" Text="Redeem" Width="83px" OnClick ="btn_1500_Click" OnClientClick="if (! UserConfirmation()) return false ;" /></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:Label ID="label" runat="server" Text="Coupon Code:"></asp:Label></td>
                    <td align="center" class="auto-style1"><asp:Label ID="label1" runat="server" Text="Coupon Code:"></asp:Label></td>
                    <td align="center" class="auto-style1"><asp:Label ID="label2" runat="server" Text="Coupon Code:"></asp:Label></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:TextBox ID="tb_500" runat="server" ReadOnly="true"></asp:TextBox></td>
                    <td align="center" class="auto-style1"><asp:TextBox ID="tb_1000" runat="server" ReadOnly="true"></asp:TextBox></td>
                    <td align="center" class="auto-style1"><asp:TextBox ID="tb_1500" runat="server" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                     <td align="center" class="auto-style1"><asp:Label ID="lbl_500" runat="server"></asp:Label></td>
                     <td align="center" class="auto-style1"><asp:Label ID="lbl_1000" runat="server"></asp:Label></td>
                     <td align="center" class="auto-style1"><asp:Label ID="lbl_1500" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:Label ID="title_2000" runat="server" Text="$20 Coupon Code" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
                </tr>
                <tr>
                    <td align="center" class="image"><asp:Image ID="img_2000" runat="server" ImageUrl="~/Images/diamond.png" Width="250px" /></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:Label ID="price_2000" runat="server" Text="200 Points" Font-Bold="true" /></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:Button ID="btn_2000" runat="server" Text="Redeem" Width="83px" OnClick="btn_2000_Click" OnClientClick="if (! UserConfirmation()) return false ;"></asp:Button></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:Label ID="label3" runat="server" Text="Coupon Code:"></asp:Label></td>
                </tr>
                <tr>
                    <td align="center" class="auto-style1"><asp:TextBox ID="tb_2000" runat="server" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                     <td align="center" class="auto-style1"><asp:Label ID="lbl_2000" runat="server"></asp:Label></td>
                </tr>
            </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

