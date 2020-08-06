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

                    SqlCommand cmd = new SqlCommand("SELECT user_id, user_zip, FROM user_account WHERE user_id = @user_id " +
                        "String_AGG(CONVERT(nvarchar(max),ISNULL(restaurant_type.type, 'N/A')), ', ') AS types FROM restaurants ", conn);
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
                        " VALUES (@user_id, @user_zip, @user_likes_first, @user_likes_second, @user_likes_third)", conn);
                    cmd.Parameters.AddWithValue("@user_id", account.UserId);
                    cmd.Parameters.AddWithValue("@user_zip", account.ZipCode);
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

                    SqlCommand sqlCommand = new SqlCommand("UPDATE user_account SET user_zip = @zip WHERE user_id = @account_id", sql);
                    sqlCommand.Parameters.AddWithValue("@account_id", accountToUpdate.UserId);
                    sqlCommand.Parameters.AddWithValue("@zip", accountToUpdate.ZipCode);
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
                ZipCode = Convert.ToInt32(reader["user_zip"]),
            };

            return a;
        }
    }
}
