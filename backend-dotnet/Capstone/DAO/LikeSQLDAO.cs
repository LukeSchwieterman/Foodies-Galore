using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class LikeSqlDAO : ILikeDAO
    {
        private readonly string connectionString;

        public LikeSqlDAO(string dbConnectionString)
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

        public bool DeleteLike(int restaurantId, int userId)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM user_favorites WHERE user_id = @userId AND restaurant_id = @restaurantId" , conn);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                    int numberOfRowsAffected = cmd.ExecuteNonQuery();
                    if (numberOfRowsAffected > 0)
                    {
                        return true;
                    }
                }
               
            }
            catch (SqlException)
            {
                throw;
            }

            return false;
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
