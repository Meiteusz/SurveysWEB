using Models.Entities.Interfaces;
using System;

namespace Models
{
    public class Occurrence : IOccurrence
    {
        #region Properties
        public int Id { get; set; }
        public byte Type { get; set; }
        public DateTime Date { get; set; }
        public string Description { get; set; }
        public int SurveyId { get; set; }
        public Survey Survey { get; set; }
        #endregion
    }
}
