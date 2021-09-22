using Models;

namespace Controllers.Settings
{
    public static class OccurreceSettings
    {
        public static Occurrence ActualOccurrece { get; private set; }

        public static void SetActualOccurrece(this Occurrence occurrence)
        {
            ActualOccurrece = occurrence;
        }
    }
}
