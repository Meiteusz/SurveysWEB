using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Models.Daos
{
    public class OccurrenceDao : IOccurrenceDao
    {
        public Response Insert(Occurrence p_occurrence)
        {
            Response response = new Response();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Occurrences.Add(p_occurrence);
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "Occurrence registered succefully";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response Update(Occurrence p_occurrence)
        {
            Response response = new Response();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Entry(p_occurrence).State = EntityState.Modified;
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "Occurrence updated succefully";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response Delete(Occurrence p_occurrence)
        {
            Response response = new Response();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Occurrences.Remove(p_occurrence);
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "Occurrence deleted succefully";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public ResponseData<Occurrence> GetById(int p_Id)
        {
            ResponseData<Occurrence> response = new ResponseData<Occurrence>();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    var occurrence = context.Occurrences.FirstOrDefault(u => u.Id.Equals(p_Id));

                    response.Success = true;
                    response.Data = occurrence;
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public ResponseData<IEnumerable<dynamic>> GetAll()
        {
            ResponseData<IEnumerable<dynamic>> response = new ResponseData<IEnumerable<dynamic>>();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    var occurrencesList = (from o in context.Set<Occurrence>()
                                           join s in context.Set<Survey>()
                                           on o.SurveyId equals s.Id
                                           join u in context.Set<User>()
                                           on s.AnalistId equals u.Id
                                           select new
                                           {
                                               Id = o.Id,
                                               Date = o.Date,
                                               Type = o.Type,
                                               OccurrenceDescription = o.Description,
                                               Status = s.Status,
                                               SurveyDescription = s.Description,
                                               Adress = s.Adress,
                                               OpeningSurveyDate = s.OpeningDate,
                                               SurveyResponsible = u.Name
                                           }).ToList();

                    response.Success = true;
                    response.Data = occurrencesList;
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }
    }
}
