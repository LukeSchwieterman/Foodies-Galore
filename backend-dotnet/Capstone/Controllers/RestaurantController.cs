using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Capstone.DAO;
using Capstone.Security.Models;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class RestaurantController : ControllerBase
    {
        private readonly IRestaurantDAO restaurantDAO;

        public RestaurantController(IRestaurantDAO _restaurantDAO)
        {
            restaurantDAO = _restaurantDAO;
        }

        [HttpGet("{id}")]
        public ActionResult<Restaurant> GetRestaurant(int id)
        {
            Restaurant restaurant = restaurantDAO.GetRestaurant(id);

            if (restaurant != null)
            {
                return Ok(restaurant);
            }
            else
            {
                return NotFound();
            }
        }
    }
}