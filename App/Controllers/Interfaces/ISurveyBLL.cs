using Models;
using System.Collections.Generic;

namespace Controllers.Interfaces
{
    public interface ISurveyBLL
    {
        Survey Create();
        Response Insert(Survey p_survey);
        Response Update(Survey p_survey);
        Response Delete(Survey p_survey);
        ResponseData<Survey> GetById(int p_Id);
        ResponseData<IEnumerable<dynamic>> GetAll();
    }
}
