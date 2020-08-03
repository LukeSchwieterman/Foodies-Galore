using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Security.Models
{
    public class Restaurant
    {
        public int RestaurantId { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public int ZipCode { get; set; }
    }

    public class RestaurantDetails
    {
        public int RestaurantId { get; set; }
        public string RestaurantDescription { get; set; }
        public int RestaurantPhonenumber { get; set; }
        public string CovidMessage { get; set; }
    }
}
