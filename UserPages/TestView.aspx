<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="TestView.aspx.cs" Inherits="TestView" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    $(function () {
        $("[id*=btn_Delete]").removeAttr("onclick");
        $("#dialog").dialog({
            modal: true,
            autoOpen: false,
            title: "Confirmation",
            width: 350,
            height: 160,
            buttons: [
            {
                id: "Yes",
                text: "Yes",
                click: function () {
                    $("[id*=btn_Delete]").attr("rel", "delete");
                    $("[id*=btn_Delete]").click();
                }
            },
            {
                id: "No",
                text: "No",
                click: function () {
                    $(this).dialog('close');
                }
            }
            ]
        });
        $("[id*=btn_Delete]").click(function () {
            if ($(this).attr("rel") != "delete") {
                $('#dialog').dialog('open');
                return false;
            } else {
                __doPostBack(this.name, '');
            }
        });
    });
</script>
<div id="dialog" style="display: none" align="center">
     Do you want to delete your review?
</div>

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    Average Rating:
    <asp:Label ID="lbl_AverageRating" runat="server"></asp:Label>
    <br />
    <asp:GridView ID="gvReviews" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" OnSelectedIndexChanged="gvReviews_SelectedIndexChanged" OnRowDeleting="gvReviews_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvReviews_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="UserId" HeaderText="User" />
            <asp:BoundField DataField="Rating" HeaderText="Rating" />
            <asp:BoundField DataField="ReviewComments" HeaderText="Comments" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btn_Delete" runat="server" Text="Delete"
                    Visible ='<%# IsUserLoggedIn((String)Eval("UserId")) %>'
                    CommandName ="Delete" UseSubmitBehavior="false" />
                </ItemTemplate>
            </asp:TemplateField>
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
    <br />
    <asp:Button ID="tb_Write" runat="server" OnClick="tb_Write_Click" Text="Write a Review" />
</asp:Content>

