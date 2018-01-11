<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="CustomerFAQ.aspx.cs" Inherits="CustomerFAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table class="auto-style1">
        <tr>
            <td>
                <h2>Frequently Asked Questions</h2>
            </td>
        </tr>
        <tr>
            <td>Don&#39;t see a question here? <a runat="server" href="~/UserPages/SubmitQuestion.aspx">Add one.</a></td>
        </tr>
        <tr>
            <td>Search:<asp:TextBox ID="tb_FAQSearch" runat="server" Width="220px" placeholder="Search for a question..."></asp:TextBox>
                <asp:Button ID="btn_FAQSearch" runat="server" OnClick="btn_FAQSearch_Click" Text="Search" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gvCustomerFAQ" runat="server" CellPadding="4" DataKeyNames="FAQID" ForeColor="#333333" GridLines="None" Width="777px" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Question" HeaderText="Question" />
                        <asp:BoundField DataField="Answer" HeaderText="Answer" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>Have further enquiries? <a runat="server" href="~/UserPages/UserContactStart.aspx">Contact us!</a></td>
        </tr>
    </table>
</asp:Content>

