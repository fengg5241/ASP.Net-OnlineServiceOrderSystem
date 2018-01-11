<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        h2{
            text-align: center;
        }
        h4{
            text-align: center;
        }
        p{
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>LOGOUT</h2>
    <h4>You are now logged out of this website.</h4>
    <p>
        You are required to log in again before you can make any changes to your account details.</p>
</asp:Content>

