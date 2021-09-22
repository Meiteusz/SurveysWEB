using Models;

namespace Controllers.Settings
{
    public static class SurveySettings
    {
        public static Survey ActualSurvey { get; private set; }

        public static void SetActualSurvey(this Survey survey)
        {
            ActualSurvey = survey;
        }
    }
}
