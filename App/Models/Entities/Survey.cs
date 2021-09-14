using Models.Entities.Interfaces;
using System;

namespace Models
{
    public class Survey : ISurvey
    {
        #region Properties
        public int Id { get; set; }
        public int Status { get; set; }
        public DateTime OpeningDate { get; set; }
        public byte[] Local { get; set; }
        public string Description { get; set; }
        public string Adress { get; set; }
        public int AnalistId { get; set; }
        public User Analist { get; set; }
        #endregion
    }
}
