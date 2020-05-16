using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;
using HardyWebsite.Models;
using Microsoft.AspNetCore.Mvc;
using static HardyWebsite.Models.CountryDataModel;

namespace HardyWebsite.Controllers
{
    public class CovidStatsController : Controller
    {
        IHttpClientFactory clientFactory;
        public CovidStatsController(IHttpClientFactory clientFactory)
        {
            this.clientFactory = clientFactory;
        }

        public async Task<CountryDataModel> Index()
        {
            var request = new HttpRequestMessage(HttpMethod.Get, "free-api?countryTotal=US");
            var client = clientFactory.CreateClient("thevirustracker");
            var response = await client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                using var responseStream = await response.Content.ReadAsStreamAsync();
                return await JsonSerializer.DeserializeAsync
                        <CountryDataModel>(responseStream);
            }
            return new CountryDataModel();
        }
    }
}
