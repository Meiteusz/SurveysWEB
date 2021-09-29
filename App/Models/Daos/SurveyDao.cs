using Models.Daos.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace Models.Daos
{
    public class SurveyDao : ISurveyDao
    {
        public Response Insert(Survey p_survey)
        {
            Response response = new Response();
            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Surveys.Add(p_survey);
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "Survey registered succeffully";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response Update(Survey p_survey)
        {
            Response response = new Response();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Entry(p_survey).State = EntityState.Modified;
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "Survey updated succefully";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public Response Delete(Survey p_survey)
        {
            Response response = new Response();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    context.Surveys.Remove(p_survey);
                    context.SaveChanges();

                    response.Success = true;
                    response.Message = "Survey Deleted Succefully";
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public ResponseData<Survey> GetById(int p_Id)
        {
            ResponseData<Survey> response = new ResponseData<Survey>();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    var survey = context.Surveys.FirstOrDefault(u => u.Id.Equals(p_Id));

                    response.Success = true;
                    response.Data = survey;
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
                    var surveysList = (from s in context.Set<Survey>()
                                       join u in context.Set<User>()
                                       on s.AnalistId equals u.Id
                                       select new
                                       {
                                           Id = s.Id,
                                           Status = s.Status,
                                           OpeningDate = s.OpeningDate,
                                           Description = s.Description,
                                           Adress = s.Adress,
                                           ResponsibleName = u.Name
                                       }).ToList();

                    response.Success = true;
                    response.Data = surveysList;
                }
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }

            return response;
        }

        public ResponseData<IEnumerable<dynamic>> GetByFilters(int p_status, DateTime p_dateFrom, DateTime p_dateTo, string p_adress, string p_responsible)
        {
            ResponseData<IEnumerable<dynamic>> response = new ResponseData<IEnumerable<dynamic>>();

            try
            {
                using (var context = new SurveysWebContext())
                {
                    var surveysList = (from s in context.Set<Survey>()
                                       join u in context.Set<User>()
                                       on s.AnalistId equals u.Id
                                       select new
                                       {
                                           Id = s.Id,
                                           Status = s.Status,
                                           OpeningDate = s.OpeningDate,
                                           Description = s.Description,
                                           Adress = s.Adress,
                                           ResponsibleName = u.Name
                                       }).Where(s => s.Status.Equals(p_status) && s.OpeningDate >= p_dateFrom && s.OpeningDate <= p_dateTo && s.Adress.Contains(p_adress)
                                        ).Where(u => u.ResponsibleName.Contains(p_responsible)).ToList();

                    response.Success = true;
                    response.Data = surveysList;
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
