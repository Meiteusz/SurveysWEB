<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OperatorContent.aspx.cs" MasterPageFile="~/Pages/MasterPage.Master" EnableEventValidation="false" Inherits="SurveysWEB.Pages.UsersPage.OperatorContent" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
    <link href="/Css/OperatorContent.css" rel="stylesheet" runat="server" />
    <div class="container">
        <h1>Operator Logged</h1>
        <div>
        </div>
        <div>
            <asp:Button ID="btnRegisterOccurrence" runat="server" Text="Register Occurence" />
            <div>
                <asp:Button ID="btnViewOccurences" runat="server" Text="View Occurences" />
            </div>
        </div>

        <asp:Panel ID="pnlSurveys" runat="server" CssClass="modalPopup">
            <div>
                <asp:GridView ID="dgvSurvey" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-Height="35px" CssClass="dgvSurveys" Style="margin-left: 53px;" Width="1074px" OnRowDataBound="dgvSurvey_RowDataBound" OnSelectedIndexChanged="dgvSurvey_SelectedIndexChanged">
                </asp:GridView>
            </div>
            <div>
                <asp:Button ID="btnOccurrenceRegister" runat="server" Text="Register Occurrence" CssClass="buttons-default" Style="margin-left: 53px;" OnClick="btnOccurrenceRegister_Click" />
                <asp:Button ID="btnCloseSurveys" runat="server" Text="Close" CssClass="buttons-default" Style="margin-left: 670px;" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlRegisterOccurrence" runat="server" CssClass="modalPopup">
            <div class="container-registerOccurrence">

                <asp:Panel ID="pnlSurveysDetails" runat="server" GroupingText="Survey">
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Survey Adress"></asp:Label>
                        <asp:TextBox ID="txtSurveyAdress" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label4" runat="server" Text="Survey Responsible"></asp:Label>
                        <asp:TextBox ID="txtSurveyResponsible" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="Survey OpeningDate"></asp:Label>
                        <asp:TextBox ID="dtpSurveyOpeningDate" TextMode="Date" runat="server"></asp:TextBox>
                    </div>
                </asp:Panel>

                <div>
                    <asp:Label ID="Label2" runat="server" Text="Date"></asp:Label>
                    <asp:TextBox ID="dtpDate" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div>
                    <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
                    <select id="cmbType" runat="server">
                        <option>Environmental</option>
                        <option>Patrimonial</option>
                    </select>
                </div>
                <div>
                    <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>
                    <textarea id="txtDescription" runat="server"></textarea>
                </div>
            </div>

            <div>
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnCloseRegisterOccurrence_Click" CssClass="buttons-default" Style="margin-left: 53px;" />
                <asp:Button ID="btnRegisterOcc" runat="server" Text="Register Occurrence" CssClass="buttons-default" Style="margin-left: 250px;" OnClick="btnRegisterOcc_Click" />
                <asp:Button ID="btnCloseRegisterOccurrence" runat="server" Text="Close" CssClass="buttons-default" Style="margin-left: 215px;" OnClick="btnCloseRegisterOccurrence_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlViewOccurrences" runat="server" CssClass="modalPopup">
            <asp:Panel ID="pnlFilters" runat="server">
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label>
                    <select id="Select1" runat="server">
                        <option>Opened</option>
                        <option>Closed</option>
                    </select>
                </div>
                <div>
                    <asp:Label ID="Label8" runat="server" Text="Date From"></asp:Label>
                    <asp:TextBox ID="txtDateFrom" runat="server" TextMode="Date"></asp:TextBox>
                    <asp:Label ID="Label9" runat="server" Text="Date To"></asp:Label>
                    <asp:TextBox ID="txtDateTo" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label11" runat="server" Text="Adress"></asp:Label>
                    <asp:TextBox ID="txtAdressFilter" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label10" runat="server" Text="Responsible"></asp:Label>
                    <asp:TextBox ID="txtResponsibleFilter" runat="server"></asp:TextBox>
                </div>
            </asp:Panel>
            <div>
                <asp:GridView ID="dgvOccurrences" runat="server" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" RowStyle-Height="35px" CssClass="dgvSurveys" Style="margin-left: 53px;" Width="1074px" OnRowDataBound="dgvOccurrences_RowDataBound" OnSelectedIndexChanged="dgvOccurrences_SelectedIndexChanged"></asp:GridView>
            </div>
            <div>
                <asp:Button ID="btnCloseViewOccurrences" runat="server" Text="Close" CssClass="buttons-default" Style="margin-left: 53px;" />
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlDetailsOccurrence" CssClass="modalPopupDetail">
            <asp:Button ID="btnTeste" runat="server" Text="Button" /><!-- Clear -->
            <div>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="buttons-controls" Style="margin-left: 438px;" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="buttons-controls" Style="background-color: darkred; color: white" OnClick="btnDelete_Click" />
            </div>
            <asp:Panel ID="Panel1" runat="server" GroupingText="Survey">
                <div>
                    <asp:Label ID="Label15" runat="server" Text="Survey Adress"></asp:Label>
                    <asp:TextBox ID="txtSurveyAdressDetail" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label16" runat="server" Text="Survey Responsible"></asp:Label>
                    <asp:TextBox ID="txtSurveyResponsibleDetail" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label17" runat="server" Text="Survey Opening Date"></asp:Label>
                    <asp:TextBox ID="txtSurveyOpeningDateDetail" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            </asp:Panel>
            <div>
                <div>
                    <asp:Label ID="Label12" runat="server" Text="Type"></asp:Label>
                    <select id="cmbTybeDetail" runat="server">
                        <option>Environmental</option>
                        <option>Patrimonial</option>
                    </select>
                </div>
                <div>
                    <asp:Label ID="Label13" runat="server" Text="Date"></asp:Label>
                    <asp:TextBox ID="txtDateDetail" runat="server" TextMode="Date"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label14" runat="server" Text="Description"></asp:Label>
                    <textarea id="txtDescriptionDetail" cols="20" rows="2" runat="server"></textarea>
                </div>
            </div>
            <div>
                <asp:Button ID="btnDetailBack" runat="server" Text="Back" CssClass="buttons-default" Style="margin-left: 53px; margin-block: 40%;" OnClick="btnDetailBack_Click" />
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CssClass="buttons-default" Style="margin-left: 50px;" />
                <asp:Button ID="btnCloseDetailsOccurrences" runat="server" Text="Close" CssClass="buttons-default" Style="margin-left: 50px; margin-block: 40%;" />
            </div>
        </asp:Panel>

        <ajaxToolkit:ModalPopupExtender ID="mpeViewSurveys" runat="server" CancelControlID="btnOccurrenceRegister" BackgroundCssClass="modalBackround" PopupControlID="pnlSurveys" TargetControlID="btnRegisterOccurrence" BehaviorID="mpeViewSurveys">
        </ajaxToolkit:ModalPopupExtender>
        <ajaxToolkit:ModalPopupExtender ID="mpeRegisterOccurence" runat="server" CancelControlID="btnCloseRegisterOccurrence" BackgroundCssClass="modalBackround" PopupControlID="pnlRegisterOccurrence" TargetControlID="btnOccurrenceRegister" BehaviorID="mpeRegisterOccurence">
        </ajaxToolkit:ModalPopupExtender>
        <ajaxToolkit:ModalPopupExtender ID="mpeViewOccurrences" runat="server" CancelControlID="btnCloseViewOccurrences" BackgroundCssClass="modalBackround" PopupControlID="pnlViewOccurrences" TargetControlID="btnViewOccurences">
        </ajaxToolkit:ModalPopupExtender>
        <ajaxToolkit:ModalPopupExtender ID="mpeDetailOccurrence" runat="server" CancelControlID="btnCloseDetailsOccurrences" BackgroundCssClass="modalBackround" PopupControlID="pnlDetailsOccurrence" TargetControlID="btnTeste">
        </ajaxToolkit:ModalPopupExtender>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
