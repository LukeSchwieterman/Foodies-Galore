using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public interface IRestaurantDAO
    {
        Restaurant GetRestaurant(int restaurantId);

        List<Restaurant> GetRestaurantByType(string restaurantType);

        List<Restaurant> GetRestaurantByZip(int restaurantZip);

        List<Restaurant> GetAllRestaurants();
    }
}
