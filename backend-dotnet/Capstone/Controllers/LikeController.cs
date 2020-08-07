using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.DAO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Capstone.Security.Models;
using Capstone.Models;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class LikeController : ControllerBase
    {
        private readonly ILikeDAO likeDAO;

        public LikeController(ILikeDAO _likeDAO)
        {
            likeDAO = _likeDAO;
        }

        [HttpGet("user/{user_id}")]
        public ActionResult<List<Like>> GetLikeByUser(int user_id)
        {
            List<Like> likes = likeDAO.GetAllLikesPerUser(user_id);

            if (likes != null)
            {
                return Ok(likes);
            }
            else
            {
                return NotFound();
            }
        }

        //[HttpPut]
        //public ActionResult<Like> GetLikeAdded(Like newLike)
        //{
        //    var userId = Convert.ToInt32(User.FindFirst("sub")?.Value);
        //    Like newLike = likeDAO.GetLikeAdded(userId);

        //    Account result = accountDAO.UpdateAccount(updatedAccount);
        //    return Ok(result);
        //}
    }
}
