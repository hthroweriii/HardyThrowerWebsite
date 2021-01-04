using System.Net.Http;
using System.Threading.Tasks;
using HardyWebsite.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HardyWebsite.Controllers
{
    public class CovidStatsController : Controller
    {
        IHttpClientFactory clientFactory;
        public CovidStatsController(IHttpClientFactory clientFactory)
        {
            this.clientFactory = clientFactory;
        }

        [Authorize(Roles = "TestRole")]
        public async Task<ActionResult> Index()
        {
            var request = new HttpRequestMessage(HttpMethod.Get, "free-api?countryTotal=US");
            var client = clientFactory.CreateClient("thevirustracker");
            var response = await client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                //using var responseStream = await response.Content.ReadAsStreamAsync();
                //var modek = await JsonSerializer.DeserializeAsync
                //        <CountryDataModel>(responseStream);
            }
            ViewBag.Message = new CovidCasesModel() { Number = 1 };
            return View();
        }
    }
}
