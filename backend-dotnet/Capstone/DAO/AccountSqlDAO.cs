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

        public AccountWithTypes GetAccount(int user_id)
        {
            AccountWithTypes returnAccount = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_account.user_id, user_zip," +
                        "String_AGG(CONVERT(nvarchar(max), ISNULL(restaurant_type.type, 'N/A')), ', ') AS types FROM user_account " +
                        "JOIN user_favorites ON user_favorites.user_id = user_account.user_id " +
                        "JOIN user_favorited_types ON user_favorited_types.user_id = user_account.user_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = user_favorited_types.type_id WHERE user_account.user_id = @user_id " +
                        "GROUP BY user_account.user_id, user_zip ", conn);
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

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_account (user_id, user_zip)" +
                        " VALUES (@user_id, @user_zip)", conn);
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

        public bool DeleteTypeFromAccount(int userId, int typeId)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(connectionString))
                {
                    sql.Open();

                    SqlCommand sqlCommand = new SqlCommand("DELETE FROM user_favorited_types WHERE user_id = @userId AND type_id = @typeId", sql);
                    sqlCommand.Parameters.AddWithValue("@userId", userId);
                    sqlCommand.Parameters.AddWithValue("@typeId", typeId);
                    int numberOfRowsAffected = sqlCommand.ExecuteNonQuery();

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

        public TypeAccount AddAccountType(TypeAccount account)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_favorited_types (user_id, type_id)" +
                        " VALUES (@userId, @typeId)", conn);
                    cmd.Parameters.AddWithValue("@userId", account.UserId);
                    cmd.Parameters.AddWithValue("@typeId", account.TypeId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return account;
        }

        private AccountWithTypes GetAccountFromReader(SqlDataReader reader)
        {
            string typesString = Convert.ToString(reader["types"]);
            AccountWithTypes a = new AccountWithTypes()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                ZipCode = Convert.ToInt32(reader["user_zip"]),
                LikedTypes = typesString.Split(',')
            };

            return a;
        }
    }
}
