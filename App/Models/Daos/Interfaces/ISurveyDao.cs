using System;
using System.Collections.Generic;

namespace Models.Daos.Interfaces
{
    public interface ISurveyDao
    {
        Response Insert(Survey p_survey);
        Response Update(Survey p_survey);
        Response Delete(Survey p_survey);
        ResponseData<Survey> GetById(int p_Id);
        ResponseData<IEnumerable<dynamic>> GetAll();
        ResponseData<IEnumerable<dynamic>> GetByFilters(int p_status, DateTime p_dateFrom, DateTime p_dateTo, string p_adress, string p_responsible);
    }
}
