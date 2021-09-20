using System.Collections.Generic;

namespace Models.Daos.Interfaces
{
    public interface ISurveyDao
    {
        Response Insert(Survey p_survey);
        Response Update(Survey p_survey);
        Response Delete(Survey p_survey);
        ResponseData<Survey> GetById(int p_Id);
        ResponseData<IEnumerable<dynamic>> GetAll(int p_Id);
    }
}
