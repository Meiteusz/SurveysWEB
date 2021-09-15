<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewOccurrence.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.ViewOccurrence" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/ViewOccurrence.css" rel="stylesheet" />
    <div>
        <asp:Panel ID="pnlViewSurvey" runat="server" GroupingText="Occurrence">
            <asp:Label ID="Label2" runat="server" Text="Type"></asp:Label>
            <select id="cmbType">
                <option>Environmental</option>
                <option>Patrimonial</option>
            </select>

            <asp:Label ID="Label1" runat="server" Text="Id Survey"></asp:Label>
            <asp:TextBox ID="txtSurvey" runat="server"></asp:TextBox>

            <asp:Label ID="Label5" runat="server" Text="Date From"></asp:Label>
            <input id="txtDateFrom" type="datetime-local" />

            <asp:Label ID="Label6" runat="server" Text="Date To"></asp:Label>
            <input id="txtDateTo" type="datetime-local" />

            <asp:Label ID="Label3" runat="server" Text="Responsável"></asp:Label>
            <textarea id="txtResponsavel" cols="20" rows="2"></textarea>
        </asp:Panel>
        <div>
            <asp:Button ID="btnRegisterOccurrence" runat="server" Text="Register Occurrence" />
        </div>
        <div>
            <asp:GridView ID="gvOccurrence" runat="server" Width="344px"></asp:GridView>
        </div>
    </div>
</asp:Content>
