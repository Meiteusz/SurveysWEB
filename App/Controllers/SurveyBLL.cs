using Controllers.Interfaces;
using Controllers.Settings;
using Models;
using Models.Daos.Interfaces;
using System.Collections.Generic;

namespace Controllers
{
    public class SurveyBLL : ISurveyBLL
    {
        private readonly ISurveyDao _surveyDao;

        public SurveyBLL(ISurveyDao surveyDao)
        {
            _surveyDao = surveyDao;
        }

        public Survey Create() => new Survey();

        public Response Insert(Survey p_survey)
        {
            p_survey.AnalistId = UserSettings.UserLogged.Id;
            p_survey.Status = 0; //change
            return _surveyDao.Insert(p_survey);
        }

        public Response Update(Survey p_survey)
        {
            return _surveyDao.Update(p_survey);
        }

        public Response Delete(Survey p_survey)
        {
            return _surveyDao.Delete(p_survey);
        }

        public ResponseData<Survey> GetById(int p_Id)
        {
            return _surveyDao.GetById(p_Id);
        }

        public ResponseData<IEnumerable<dynamic>> GetAll()
        {
            return _surveyDao.GetAll();
        }
    }
}
