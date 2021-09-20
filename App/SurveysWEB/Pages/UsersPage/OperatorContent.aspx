<% @ Page Language="C#" AutoEventWireup="true" CodeBehind="OperatorContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.OccurrenceContent" %>

<asp:Content ContentPlaceHolderID="Content" runat="server" >
    <link href="/Css/OperatorContent.css" rel="stylesheet" runat="server" />

    <div class="container">
        <h1>Operator Logged</h1>

        <div>
            <asp:Button ID="btnRegisterOccurrence" runat="server" Text="Register Occurence"  />
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:Panel ID="pnlRegisterOccurrence" runat="server" CssClass="modalPopup">

            <div class="container-registerOccurrence">
                <asp:Label ID="Label1" runat="server" Text="Id Survey"></asp:Label>
                <asp:TextBox ID="txtSurvey" runat="server"></asp:TextBox>

                <asp:Label ID="Label2" runat="server" Text="Data"></asp:Label>
                <input id="txtData" type="datetime-local" />

                <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
                <select id="cmbType">
                    <option>Environmental</option>
                    <option>Patrimonial</option>
                </select>

                <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                <textarea id="txtDescription" cols="20" rows="2"></textarea>

                <div>
                    <asp:Button ID="btnRegister" runat="server" Text="Register"/>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"/>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"/>
                </div>
            </div>

            <div>
                <asp:Button ID="btnClose" runat="server" Text="Close" />
            </div>
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btnClose" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterOccurrence" TargetControlID="btnRegisterOccurrence">
        </ajaxToolkit:ModalPopupExtender>
    </div>
</asp:Content>
