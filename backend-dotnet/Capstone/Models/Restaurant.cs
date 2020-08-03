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
}
