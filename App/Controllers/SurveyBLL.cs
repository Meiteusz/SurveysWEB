using Controllers.Interfaces;
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

        public ResponseData<IEnumerable<dynamic>> GetAll(int p_Id)
        {
            return _surveyDao.GetAll(p_Id);
        }

        public ResponseData<Survey> GetById(int p_Id)
        {
            return _surveyDao.GetById(p_Id);
        }
    }
}
