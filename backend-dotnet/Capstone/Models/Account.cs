using Capstone.Security.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Account
    {
        public int UserId { get; set; }
        public int ZipCode { get; set; }
        public string LikedTypeOne { get; set; }
        public string LikedTypeTwo { get; set; }
        public string LikedTypeThree { get; set; }
    }

    public class UserFavorited
    {
        public int UserId { get; set; }
        public Restaurant Restaurant { get; set; }
    }
}
