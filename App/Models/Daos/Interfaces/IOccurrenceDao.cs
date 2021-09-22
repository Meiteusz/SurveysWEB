using System.Collections.Generic;

namespace Models.Daos
{
    public interface IOccurrenceDao
    {
        Response Insert(Occurrence p_occurrence);
        Response Update(Occurrence p_occurrence);
        Response Delete(Occurrence p_occurrence);
        ResponseData<Occurrence> GetById(int p_Id);
        ResponseData<IEnumerable<dynamic>> GetAll();
    }
}