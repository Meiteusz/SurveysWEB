<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnalystContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.UsersPage.AnalystContent" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/AnalystContent.css" rel="stylesheet" runat="server" />

    <div class="container">
        <h1>Analyst Logged</h1>

        <div>
            <asp:Button ID="btnRegisterSurvey" runat="server" Text="Register Survey" />
        </div>
        <div>
            <asp:Button ID="btnViewSurveys" runat="server" Text="View Surveys" />
        </div>

        <asp:ScriptManager runat="server"></asp:ScriptManager>

        <asp:Panel runat="server" ID="pnlRegisterSurvey" CssClass="modalPopup">

            <div class="container-registerSurvey">
                <asp:Label ID="Label2" runat="server" Text="Data"></asp:Label>
                <input id="dtpOpeningDate" type="datetime-local" />

                <asp:Label ID="Label4" runat="server" Text="Responsible"></asp:Label>
                <asp:TextBox ID="txtResponsible" runat="server"></asp:TextBox>

                <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                <textarea id="txtDescription" cols="20" rows="2"></textarea>

                <asp:Label ID="Label6" runat="server" Text="Adress"></asp:Label>
                <asp:TextBox ID="txtAdress" runat="server"></asp:TextBox>

                <asp:Label ID="Label7" runat="server" Text="Local Image"></asp:Label>
                <asp:FileUpload ID="FileLocalImage" runat="server" />

                <div>
                    <asp:Button ID="btnRegister" runat="server" Text="Register"></asp:Button>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update"></asp:Button>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete"></asp:Button>
                </div>
            </div>

            <div>
                <asp:Button ID="btnClose" runat="server" Text="Close" />
            </div>
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender runat="server" CancelControlID="btnClose" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterSurvey" TargetControlID="btnRegisterSurvey">
        </ajaxToolkit:ModalPopupExtender>
    </div>
</asp:Content>
