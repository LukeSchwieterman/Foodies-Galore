using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{ 
    public class RestaurantSqlDAO : IRestaurantDAO
    {
        private readonly string connectionString;

        public RestaurantSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<Restaurant> GetAllRestaurants()
        {
            List<Restaurant> returnRestaurants = new List<Restaurant>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_id, restaurant_name, restaurant_type, location_zip FROM restaurants", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnRestaurants.Add(GetRestaurantFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurants;
        }

        public Restaurant GetRestaurant(int restaurantId)
        {
            Restaurant returnRestaurant = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_id, restaurant_name, restaurant_type, location_zip FROM restaurants WHERE restaurant_id = @restaurantId", conn);
                    cmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows && reader.Read())
                    {
                        returnRestaurant = GetRestaurantFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurant;
        }

        public List<Restaurant> GetRestaurantByType(string restaurantType)
        {
            List<Restaurant> returnRestaurants = new List<Restaurant>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_id, restaurant_name, restaurant_type, location_zip FROM restaurants WHERE restaurant_type = @restaurantType", conn);
                    cmd.Parameters.AddWithValue("@restaurantType", restaurantType);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnRestaurants.Add(GetRestaurantFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurants;
        }

        public List<Restaurant> GetRestaurantByZip(int restaurantZip)
        {
            List<Restaurant> returnRestaurants = new List<Restaurant>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_id, restaurant_name, restaurant_type, location_zip FROM restaurants WHERE location_zip = @restaurantZip", conn);
                    cmd.Parameters.AddWithValue("@restaurantZip", restaurantZip);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnRestaurants.Add(GetRestaurantFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurants;
        }

        public List<string> GetRestaurantTypes()
        {
            List<string> returnRestaurantTypes = new List<string>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_type FROM restaurants GROUP BY restaurant_type", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnRestaurantTypes.Add(GetRestaurantTypeFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurantTypes;
        }

        public RestaurantDetails GetRestaurantDetails(int restaurantId)
        {
            RestaurantDetails returnRestaurantDetails = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_id, restaurant_description, restaurant_phonenumber, covid_message FROM restaurant_details WHERE restaurant_id = @restaurantId", conn);
                    cmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows && reader.Read())
                    {
                        returnRestaurantDetails = GetRestaurantDetailsFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurantDetails;
        }

        private RestaurantDetails GetRestaurantDetailsFromReader(SqlDataReader reader)
        {
            RestaurantDetails rd = new RestaurantDetails()
            {
                RestaurantId = Convert.ToInt32(reader["restaurant_id"]),
                RestaurantDescription = Convert.ToString(reader["restaurant_description"]),
                RestaurantPhonenumber = Convert.ToString(reader["restaurant_phonenumber"]),
                CovidMessage = Convert.ToString(reader["covid_message"])
            };

            return rd;
        }

        private Restaurant GetRestaurantFromReader(SqlDataReader reader)
        {
            Restaurant r = new Restaurant()
            {
                RestaurantId = Convert.ToInt32(reader["restaurant_id"]),
                Name = Convert.ToString(reader["restaurant_name"]),
                Type = Convert.ToString(reader["restaurant_type"]),
                ZipCode = Convert.ToInt32(reader["location_zip"]),
            };

            return r;
        }

        private string GetRestaurantTypeFromReader(SqlDataReader reader)
        {
            string type = Convert.ToString(reader["restaurant_type"]);

            return type;
        }
    }
}
