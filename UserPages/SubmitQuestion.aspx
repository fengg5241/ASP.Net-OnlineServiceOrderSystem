<%@ Page Title="" Language="C#" MasterPageFile ="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="SubmitQuestion.aspx.cs" Inherits="SubmitQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 524px;
        }
        .auto-style3 {
            margin-left: 30px;
        }
    </style>

       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function ShowPopup(message) {
        $(function () {
            $("#dialog").html(message);
            $("#dialog").dialog({
                title: "Warning",
                buttons: {
                    Ok: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
        });
    };

</script>
<div id="dialog" style="display: none">
</div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td colspan="2">
                <h2>Ask a Question</h2>
            </td>
        </tr>
        <tr>
            <td colspan="2">Have a question not found in FAQ? Ask it here!</td>
        </tr>
        <tr>
            <td colspan="2">Question:</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="tb_Question" runat="server" Height="83px" TextMode="MultiLine" Width="397px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
                <asp:Button ID="btn_Reset" runat="server" CssClass="auto-style3" OnClick="btn_Reset_Click" Text="Reset" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

