<%@ Page Title="" Language="C#" MasterPageFile="~/ExpertMasterPage.master" AutoEventWireup="true" CodeFile="ExpertProfile.aspx.cs" Inherits="ExpertProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type="text/css">

         th{
             font-weight: bold;
             font-family: 'Trebuchet MS';
             text-decoration: underline;
             font-size: 35px;
         }

          .Welcome{
             font-family: 'Trebuchet MS';
             font-style:italic;
             font-size: 25px;
             color:  #3399FF;
             }
         
         
          .auto-style1 {
          

        }
        .auto-style2 {
            width: 391px;
             border: 2px solid black;
            border-radius: 5px;
        }
        .auto-style4 {
            height: 37px;
             border: 2px solid black;
            border-radius: 5px;
        }
        .auto-style6 {
            height: 34px;
            border: 2px solid black;
        }
        .auto-style7 {
            height: 34px;
            width: 155px;
            border: 2px solid black;
        }
   
        .auto-style8 {
            height: 34px;
        }
   
   
           
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style1">
          <tr>
            <td colspan="3" class="auto-style8">
                    <div class="Welcome"><asp:Label ID="lblWelcome" runat="server"></asp:Label></div> </td>
            </tr>
        <tr>
            <th colspan="3" class="auto-style4">
                    My Profile
                </th>
            </tr>
        <tr>
            <td class="auto-style2" rowspan="4">
                <asp:LinkButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" OnDataBinding="Page_Load">Edit</asp:LinkButton>
                <br />
                Username:
                &nbsp;<asp:Label ID="lblExpUserName" runat="server"></asp:Label>
                <br />
                First Name:
                <asp:Label ID="lblExpFName" runat="server"></asp:Label>
                <br />
                Last Name:
                <asp:Label ID="lblExpLName" runat="server"></asp:Label>
                <br />
                Gender:
                &nbsp;<asp:Label ID="lblExpGender" runat="server"></asp:Label>
                <br />
                Date of Birth:
                &nbsp;<asp:Label ID="lblExpBirthdate" runat="server"></asp:Label>
                <br />
                Email:
                &nbsp;<asp:Label ID="lblExpEmail" runat="server"></asp:Label>
                <br />
                Address:
                &nbsp;<asp:Label ID="lblExpAddr" runat="server"></asp:Label>
                <br />
                Phone:
                &nbsp;<asp:Label ID="lblExpPhone" runat="server"></asp:Label>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblUserNewPwd" runat="server" Text="New Password:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="tbUserNewPwd" runat="server" TextMode="Password" Width="239px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="lblUserCfmPwd" runat="server" Text="Confirm Password:"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="tbUserCfmPwd" runat="server" TextMode="Password" Width="239px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2">
                <asp:Button ID="saveBtn" runat="server" Text="Save" OnClick="saveBtn_Click" />
            &nbsp;<asp:Label ID="lblCheck" runat="server" />
            </td>
        </tr>
    </table>
    <br />

</asp:Content>

