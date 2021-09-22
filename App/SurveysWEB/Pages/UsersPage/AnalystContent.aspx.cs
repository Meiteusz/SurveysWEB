using Controllers;
using Controllers.Interfaces;
using InjectionModules;
using System;

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

        private byte[] SaveLocaImage() => FileLocalImage.FileBytes; // --> Working on validations...
    }
}