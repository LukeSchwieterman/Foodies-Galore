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

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_id, restaurant_name, location_zip FROM restaurants", conn);
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

                    SqlCommand cmd = new SqlCommand("SELECT restaurants.restaurant_id, restaurant_name, location_zip, " +
                        "String_AGG(CONVERT(nvarchar(max),ISNULL(type, 'N/A')), ', ') AS types FROM restaurants " +
                        "JOIN restaurant_connector_table ON restaurant_connector_table.restaurant_id = restaurants.restaurant_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = restaurant_connector_table.type_id " +
                        "WHERE restaurant_id = @restaurantId" +
                        "GROUP BY restaurants.restaurant_id, restaurant_name, location_zip", conn);
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

                    SqlCommand cmd = new SqlCommand("SELECT restaurants.restaurant_id, restaurant_name, location_zip, " +
                        "String_AGG(CONVERT(nvarchar(max),ISNULL(type, 'N/A')), ', ') AS types FROM restaurants " +
                        "JOIN restaurant_connector_table ON restaurant_connector_table.restaurant_id = restaurants.restaurant_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = restaurant_connector_table.type_id WHERE types IN " +
                        "GROUP BY restaurants.restaurant_id, restaurant_name, location_zip", conn);
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

                    SqlCommand cmd = new SqlCommand("SELECT restaurants.restaurant_id, restaurant_name, location_zip, " +
                        "String_AGG(CONVERT(nvarchar(max),ISNULL(type, 'N/A')), ', ') AS types FROM restaurants " +
                        "JOIN restaurant_connector_table ON restaurant_connector_table.restaurant_id = restaurants.restaurant_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = restaurant_connector_table.type_id WHERE location_zip = @restaurantZip " +
                        "GROUP BY restaurants.restaurant_id, restaurant_name, location_zip", conn);
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

        public List<RestaurantTypes> GetRestaurantTypes()
        {
            List<RestaurantTypes> returnRestaurantTypes = new List<RestaurantTypes>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT type FROM restaurant_type", conn);
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
            string typesString = Convert.ToString(reader["types"]);
            Restaurant r = new Restaurant()
            {
                RestaurantId = Convert.ToInt32(reader["restaurant_id"]),
                Name = Convert.ToString(reader["restaurant_name"]),
                Types = typesString.Split(','),
                ZipCode = Convert.ToInt32(reader["location_zip"]),
            };

            return r;
        }

        private RestaurantTypes GetRestaurantTypeFromReader(SqlDataReader reader)
        {
            RestaurantTypes r = new RestaurantTypes()
            {
                Type = Convert.ToString(reader["restaurant_type"])
            };

            return r;
        }
    }
}
