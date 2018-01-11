<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.master" AutoEventWireup="true" CodeFile="PaypalPostProcess.aspx.cs" Inherits="PaypalPostProcess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        p{
            color: red;
        }
    </style>
    <title>Redirecting...</title>
    <meta http-equiv="Refresh" content="3; url=http://localhost:39418/PaypalConfirmation.aspx" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>WELCOME BACK</h1>
    <h3>Please hang on while we process your order...</h3>
    <p> DO NOT LEAVE THIS PAGE.</p>
</asp:Content>

