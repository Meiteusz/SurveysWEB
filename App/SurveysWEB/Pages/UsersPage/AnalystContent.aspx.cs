using Controllers;
using Controllers.Interfaces;
using Controllers.Settings;
using InjectionModules;
using System;
using System.Web.UI.WebControls;

namespace SurveysWEB.Pages.UsersPage
{
    public partial class AnalystContent : System.Web.UI.Page
    {
        private readonly ISurveyBLL _surveyBLL;

        public AnalystContent()
        {
            _surveyBLL = new SurveyBLL(SurveyModule.ConfiguratingModule());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Helper.ShowData(dgvSurveys, _surveyBLL.GetAll().Data); //grid not updating where a new survey is registered - working...
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var survey = _surveyBLL.Create();
            survey.OpeningDate = DateTime.Parse(dtpOpeningDate.Text);
            survey.Local = SaveLocaImage();
            survey.Description = txtDescription.Value;
            survey.Adress = txtAdress.Text;

            var response = _surveyBLL.Insert(survey);
            Response.Write(Helper.DisplayAlert(response.Message));
        }

        protected void dgvSurveys_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType.Equals(DataControlRowType.DataRow))
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvSurveys, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click on this Survey to view details";
            }
        }

        protected void dgvSurveys_SelectedIndexChanged(object sender, EventArgs e) // Improving...
        {
            var survey = _surveyBLL.GetById(Int32.Parse(dgvSurveys.SelectedRow.Cells[0].Text));

            if (survey.Data.Equals(null))
                Response.Write(Helper.DisplayAlert("Error with this Survey"));
            else
            {
                SurveySettings.SetActualSurvey(survey.Data);  //improving if Data == null...

                cmbStatus.SelectedIndex = SurveySettings.ActualSurvey.Status;
                txtOpeningDateDetail.Text = SurveySettings.ActualSurvey.OpeningDate.ToString("yyyy-MM-dd");
                LocalImage.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(SurveySettings.ActualSurvey.Local); // Improving...to
                txtDescriptionDetail.Value = SurveySettings.ActualSurvey.Description;
                txtAdressDetail.Text = SurveySettings.ActualSurvey.Adress;
                txtResponsibleDetail.Text = SurveySettings.ActualSurvey.AnalistId.ToString(); //change

                mpeDetailsSurveys.Show();
            }
        }

        protected void btnBackDetailsSurvey_Click(object sender, EventArgs e)
        {
            mpeViewSurveys.Show();
            mpeDetailsSurveys.Hide();
        }

        private byte[] SaveLocaImage() => FileLocalImage.FileBytes; // --> Working on validations...
    }
}