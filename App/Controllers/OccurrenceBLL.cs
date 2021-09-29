using Controllers.Interfaces;
using Controllers.Settings;
using Models;
using Models.Daos;
using System;
using System.Collections.Generic;

namespace Controllers
{
    public class OccurrenceBLL : IOccurrenceBLL
    {
        private readonly IOccurrenceDao _occurrenceDao;

        public OccurrenceBLL(IOccurrenceDao occurrenceDao)
        {
            _occurrenceDao = occurrenceDao;
        }

        public Occurrence Create() => new Occurrence();

        public Response Insert(Occurrence p_occurrence)
        {
            p_occurrence.SurveyId = SurveySettings.ActualSurvey.Id;

            return _occurrenceDao.Insert(p_occurrence);
        }

        public Response Update(Occurrence p_occurrence)
        {
            return _occurrenceDao.Update(p_occurrence);
        }

        public Response Delete(Occurrence p_occurrence)
        {
            return _occurrenceDao.Delete(p_occurrence);
        }

        public ResponseData<Occurrence> GetById(int p_Id)
        {
            return _occurrenceDao.GetById(p_Id);
        }

        public ResponseData<IEnumerable<dynamic>> GetAll()
        {
            return _occurrenceDao.GetAll();
        }

        public ResponseData<IEnumerable<dynamic>> GetByFilters(byte type, DateTime dateFrom, DateTime dateTo, string description, string surveyResponsible)
        {
            return _occurrenceDao.GetByFilters(type, dateFrom, dateTo, description, surveyResponsible);
        }
    }
}
