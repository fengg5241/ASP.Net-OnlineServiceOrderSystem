<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="WriteReview.aspx.cs" Inherits="WriteReview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 148px;
        }

        .auto-style4 {
            width: 98%;
        }

        .auto-style5 {
            margin-right: 0px;
        }

        .auto-style7 {
            margin-left: 155px;
        }

        .starRating {
            width: 30px;
            height: 50px;
            cursor: pointer;
            background-repeat: no-repeat;
            display: block;
        }

        .FilledStars {
            background-image: url(" ../Images/StarFilled.png");
        }

        .WaitingStars {
            background-image: url("../Images/StarWaiting.png");
        }

        .EmptyStars {
            background-image: url("../Images/StarEmpty.png");
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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table class="auto-style4">
        <tr>
            <td colspan="2">Write a review for&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_Worker" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Rating:</td>
            <td>&nbsp; 
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <ajaxToolkit:Rating ID="Rating1" runat="server"
                            StarCssClass="starRating"
                            FilledStarCssClass="FilledStars"
                            EmptyStarCssClass="EmptyStars"
                            WaitingStarCssClass="WaitingStars"
                            CurrentRating="0"
                            MaxRating="5">
                        </ajaxToolkit:Rating>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Comments:</td>
            <td>
                <asp:TextBox ID="tb_Comments" runat="server" CssClass="auto-style5" Height="209px" Width="443px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CustomValidator ID="cvSubmit" runat="server" ValidationGroup="vgSubmit" ForeColor="DarkRed" OnServerValidate="cvSubmit_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" CssClass="auto-style7" ValidationGroup="vgSubmit" CausesValidation="true" />
                <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" />
            </td>

        </tr>
    </table>
</asp:Content>

