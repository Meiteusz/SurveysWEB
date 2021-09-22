<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperatorContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" Inherits="SurveysWEB.Pages.OccurrenceContent" EnableEventValidation="false" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/OperatorContent.css" rel="stylesheet" runat="server" />
    <div class="container">
        <h1>Operator Logged</h1>
        <div>
            <asp:Button ID="btnRegisterOccurrence" runat="server" Text="Register Occurence" />
        </div>

        <asp:Panel ID="pnlSurveys" runat="server" CssClass="modalPopup">
            <div>
                <asp:GridView ID="dgvSurvey" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" OnRowDataBound="dgvSurvey_RowDataBound"
                    OnSelectedIndexChanged="dgvSurvey_SelectedIndexChanged" RowStyle-Height="35px" CssClass="dgvSurveys" Width="890px">
                </asp:GridView>
            </div>
            <div>
                <asp:Button ID="btnCloseSurveys" runat="server" Text="Close" />
            </div>
            <div>
                <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlRegisterOccurrence" runat="server" CssClass="modalPopup">
            <div class="container-registerOccurrence">
                <asp:Label ID="Label2" runat="server" Text="Data"></asp:Label>
                <asp:TextBox ID="dtpDate" runat="server" TextMode="Date"></asp:TextBox>

                <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
                <select id="cmbType" runat="server">
                    <option>Environmental</option>
                    <option>Patrimonial</option>
                </select>

                <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                <textarea id="txtDescription" runat="server"></textarea>
            </div>

            <div>
                <asp:Button ID="btnCloseRegisterOccurrence" runat="server" Text="Close" />
            </div>
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="mpeViewSurveys" runat="server" CancelControlID="btnRegister" BackgroundCssClass="modalBackround" PopupControlID="pnlSurveys" TargetControlID="btnRegisterOccurrence" BehaviorID="mpeViewSurveys">
        </ajaxToolkit:ModalPopupExtender>
        <ajaxToolkit:ModalPopupExtender ID="mpeRegisterOccurence" runat="server" CancelControlID="btnCloseRegisterOccurrence" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterOccurrence" TargetControlID="btnRegister" BehaviorID="mpeRegisterOccurence">
        </ajaxToolkit:ModalPopupExtender>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
