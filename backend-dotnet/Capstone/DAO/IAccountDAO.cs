using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IAccountDAO
    {
        Account GetAccount(int user_id);

        Account AddAccount(Account account);

        Account UpdateAccount(Account accountToUpdate);
    }
}
