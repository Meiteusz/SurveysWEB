<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.ViewSurvey" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/ViewSurvey.css" rel="stylesheet" />
    <div>
        <asp:Panel ID="pnlViewSurvey" runat="server" GroupingText="Pesquisar">
            <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label>
            <select id="cmbStatus">
                <option>Opened</option>
                <option>Closed</option>
            </select>

            <asp:Label ID="Label1" runat="server" Text="Adress"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <asp:Label ID="Label3" runat="server" Text="Responsável"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

            <asp:Label ID="Label5" runat="server" Text="Date From"></asp:Label>
            <input id="txtDateFrom" type="datetime-local" />

            <asp:Label ID="Label6" runat="server" Text="Date To"></asp:Label>
            <input id="txtDateTo" type="datetime-local" />
        </asp:Panel>
        <div>
            <asp:Button ID="btnRegisterSurvey" runat="server" Text="Register Survey" />
        </div>
        <div>
            <asp:GridView ID="gvSurveys" runat="server" Width="290px"></asp:GridView>
        </div>
    </div>
</asp:Content>
