using HardyWebsite.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Distributed;
using System;
using System.Text.Encodings.Web;

namespace MvcMovie.Controllers
{
    public class HelloWorldController : Controller
    {
        private IDistributedCache distributedCache;

        // GET: /HelloWorld/
        public HelloWorldController(IDistributedCache distributedCache)
        {
            this.distributedCache = distributedCache;
        }

        public string Index()
        {
            return "This is my default action...";
        }

        // GET: /HelloWorld/Welcome/ 
        // Requires using System.Text.Encodings.Web;
        public string SetPizza(PizzaModel pizzaModel)
        {
            distributedCache.Set(pizzaModel.type,BitConverter.GetBytes(pizzaModel.amount));
            return pizzaModel.type;
        }

        public string GetPizza(string type)
        {
            byte[] amt;
            if (type == null)
                throw new ArgumentNullException();
            else
            {
                amt = distributedCache.Get(type);
                if (amt == null)
                    return "Not Found";
            }
            return HtmlEncoder.Default.Encode($"Hello {type}, NumTimes is: {BitConverter.ToInt16(amt)}");
        }   

        public string Clear(string type)
        {
            if(type != null)
                distributedCache.Remove(type);
            return "Cleared Cache";
        }
    }
}