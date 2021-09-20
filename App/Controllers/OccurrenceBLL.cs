using Controllers.Interfaces;
using Models;
using System.Collections.Generic;

namespace Controllers
{
    public class OccurrenceBLL : IOccurrenceBLL
    {
        private readonly IOccurrenceBLL _occurrenceBLL;

        public OccurrenceBLL(IOccurrenceBLL occurrenceBLL)
        {
            _occurrenceBLL = occurrenceBLL;
        }

        public Response Insert(Occurrence p_occurrence)
        {
            return _occurrenceBLL.Insert(p_occurrence);
        }

        public Response Update(Occurrence p_occurrence)
        {
            return _occurrenceBLL.Update(p_occurrence);
        }

        public Response Delete(Occurrence p_occurrence)
        {
            return _occurrenceBLL.Delete(p_occurrence);
        }

        public ResponseData<IEnumerable<dynamic>> GetAll(int p_Id)
        {
            return _occurrenceBLL.GetAll(p_Id);
        }

        public ResponseData<Occurrence> GetById(int p_Id)
        {
            return _occurrenceBLL.GetById(p_Id);
        }
    }
}
