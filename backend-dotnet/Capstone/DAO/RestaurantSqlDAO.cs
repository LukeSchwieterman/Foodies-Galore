using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class RestaurantSqlDAO
    {
        private readonly string connectionString;

        public RestaurantSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public Restaurant GetRestaurant(int restaurantId)
        {
            Restaurant returnRestaurant = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restraunt_id, restaurant_name, restaurant_type, location_zip FROM users WHERE username = @restaurantId", conn);
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

        private Restaurant GetRestaurantFromReader(SqlDataReader reader)
        {
            Restaurant r = new Restaurant()
            {
                RestaurantId = Convert.ToInt32(reader["restraunt_id"]),
                Name = Convert.ToString(reader["restaurant_name"]),
                Type = Convert.ToString(reader["restaurant_type"]),
                ZipCode = Convert.ToInt32(reader["location_zip"]),
            };

            return r;
        }
    }
}
