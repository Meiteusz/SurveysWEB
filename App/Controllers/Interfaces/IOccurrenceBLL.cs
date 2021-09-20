using Models;
using System.Collections.Generic;

namespace Controllers.Interfaces
{
    public interface IOccurrenceBLL
    {
        Response Insert(Occurrence p_occurrence);
        Response Update(Occurrence p_occurrence);
        Response Delete(Occurrence p_occurrence);
        ResponseData<Occurrence> GetById(int p_Id);
        ResponseData<IEnumerable<dynamic>> GetAll(int p_Id);
    }
}
