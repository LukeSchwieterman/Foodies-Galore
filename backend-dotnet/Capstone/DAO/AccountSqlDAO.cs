using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class AccountSqlDAO : IAccountDAO
    {
        private readonly string connectionString;

        public AccountSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public Account GetAccount(int user_id)
        {
            Account returnAccount = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_id, user_zip, user_likes_first, user_likes_second, user_likes_third FROM user_account WHERE user_id = @user_id", conn);
                    cmd.Parameters.AddWithValue("@user_id", user_id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows && reader.Read())
                    {
                        returnAccount = GetAccountFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            
            return returnAccount;
        }

        public Account AddAccount(Account account)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_account (user_id, user_zip, user_likes_first, user_likes_second, user_likes_third)" +
                        " VALUES (@user_zip, @user_likes_first, @user_likes_second, @user_likes_third)", conn);
                    cmd.Parameters.AddWithValue("@user_id", account.UserId);
                    cmd.Parameters.AddWithValue("@user_zip", account.ZipCode);
                    cmd.Parameters.AddWithValue("@user_likes_first", account.LikedTypeOne);
                    cmd.Parameters.AddWithValue("@user_likes_second", account.LikedTypeTwo);
                    cmd.Parameters.AddWithValue("@user_likes_third", account.LikedTypeThree);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return account;
        }

        public Account UpdateAccount(Account accountToUpdate)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(connectionString))
                {
                    sql.Open();

                    SqlCommand sqlCommand = new SqlCommand("UPDATE user_account SET user_likes_first = @first, user_likes_second = @second, user_likes_third = @third WHERE user_id = @account_id", sql);
                    sqlCommand.Parameters.AddWithValue("@first", accountToUpdate.LikedTypeOne);
                    sqlCommand.Parameters.AddWithValue("@second", accountToUpdate.LikedTypeTwo);
                    sqlCommand.Parameters.AddWithValue("@third", accountToUpdate.LikedTypeThree);
                    sqlCommand.Parameters.AddWithValue("@account_id", accountToUpdate.UserId);
                    int numberOfRowsAffected = sqlCommand.ExecuteNonQuery();

                    if (numberOfRowsAffected > 0)
                    {
                        return accountToUpdate;
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return null;
        }

        private Account GetAccountFromReader(SqlDataReader reader)
        {
            Account a = new Account()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                LikedTypeOne = Convert.ToString(reader["user_likes_first"]),
                LikedTypeTwo = Convert.ToString(reader["user_likes_second"]),
                LikedTypeThree = Convert.ToString(reader["user_likes_third"]),
                ZipCode = Convert.ToInt32(reader["user_zip"]),
            };

            return a;
        }
    }
}
