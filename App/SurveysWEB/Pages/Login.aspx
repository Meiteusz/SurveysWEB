<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.Login" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/Login.css" rel="stylesheet" />
        <div class="container">
            <h2>Sign-up</h2>
            <div>
                <input id="txtLogin" type="text" runat="server" placeholder="Enter Login" />
            </div>
            <div>
                <input id="txtPassword" type="text" runat="server" placeholder="Enter Password" />
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" />
            </div>
        </div>
</asp:Content>
