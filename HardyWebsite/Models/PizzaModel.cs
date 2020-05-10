using Microsoft.AspNetCore.Mvc;

namespace HardyWebsite.Models
{
    [BindProperties(SupportsGet = true)]
    public class PizzaModel
    {
        public string type { get; set; }
        public int amount { get; set; }
        public PizzaModel()
        {
        }
    }
}
