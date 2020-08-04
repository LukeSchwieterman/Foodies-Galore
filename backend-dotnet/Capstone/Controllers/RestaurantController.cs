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

        [HttpGet]
        public ActionResult<List<Restaurant>> GetAllRestaurants()
        {
            List<Restaurant> restaurants = restaurantDAO.GetAllRestaurants();

            if (restaurants != null)
            {
                return Ok(restaurants);
            }
            else
            {
                return NotFound();
            }
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

        [HttpGet("type/{type}")]
        public ActionResult<List<Restaurant>> GetRestaurantByType(string type)
        {
            List<Restaurant> restaurants = restaurantDAO.GetRestaurantByType(type);

            if (restaurants != null)
            {
                return Ok(restaurants);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet("type")]
        public ActionResult<List<string>> GetRestaurantTypes()
        {
            List<string> restaurants = restaurantDAO.GetRestaurantTypes();

            if (restaurants != null)
            {
                return Ok(restaurants);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet("zipcode/{zip}")]
        public ActionResult<List<Restaurant>> GetRestaurantByZip(int zip)
        {
            List<Restaurant> restaurants = restaurantDAO.GetRestaurantByZip(zip);

            if (restaurants != null)
            {
                return Ok(restaurants);
            }
            else
            {
                return NotFound();
            }
        }
    }
}