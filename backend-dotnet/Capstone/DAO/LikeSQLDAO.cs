using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class LikeSQLDAO : ILikeDAO
    {
        private readonly string connectionString;

        public LikeSQLDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Like> GetAllLikesPerUser(int user_id)
        {
            List<Like> returnLikes = new List<Like>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_id, restaurant_id FROM user_favorites WHERE user_id = @user_id", conn);
                    cmd.Parameters.AddWithValue("@user_id", user_id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnLikes.Add(GetLikesFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnLikes;
        }

        public Like AddLike(Like like)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_favorites (user_id, restaurant_id)" +
                        " VALUES (@user_id, @restaurant_id)", conn);
                    cmd.Parameters.AddWithValue("@user_id", like.UserId);
                    cmd.Parameters.AddWithValue("@restaurant_id", like.RestaurantId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return like;
        }

        private Like GetLikesFromReader(SqlDataReader reader)
        {
            Like k = new Like()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                RestaurantId = Convert.ToInt32(reader["restaurant_id"])
            };

            return k;
        }
    }
}
