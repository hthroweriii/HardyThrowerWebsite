using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

namespace HardyWebsite.Models
{
    public class CountryDataModel
    {
        public class CountryDataCases
        {
            public int total_cases { get; set; }
            public int total_recovered { get; set; }
            public int total_unresolved { get; set; }
            public int total_deaths { get; set; }
            public int total_new_cases_today { get; set; }
            public int total_new_deaths_today { get; set; }
            public int total_active_cases { get; set; }
            public int total_serious_cases { get; set; }
            public int total_danger_rank { get; set; }
        }

        public List<CountryDataCases> countrydata { get; set; }
    }
}
