using Models;
using System;
using System.Collections.Generic;

namespace Controllers.Interfaces
{
    public interface IOccurrenceBLL
    {
        Occurrence Create();
        Response Insert(Occurrence p_occurrence);
        Response Update(Occurrence p_occurrence);
        Response Delete(Occurrence p_occurrence);
        ResponseData<Occurrence> GetById(int p_Id);
        ResponseData<IEnumerable<dynamic>> GetAll();
        ResponseData<IEnumerable<dynamic>> GetByFilters(byte type, DateTime dateFrom, DateTime dateTo, string description, string surveyResponsible);
    }
}
