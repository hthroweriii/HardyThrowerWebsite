using HardyWebsite.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using System;
using System.Text.Encodings.Web;

namespace MvcMovie.Controllers
{
    public class DebugController : Controller
    {
        public string Index()
        {
            return HtmlEncoder.Default.Encode($"This the debug controller");
        }

    }
}