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

        [HttpGet("{user_id}")]
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

        [Authorize]
        [HttpPost]
        public ActionResult<Like> AddLike(Like addedLike)
        {
            Like like = likeDAO.AddLike(addedLike);

            if (like != null)
            {
                return Ok(like);
            }
            else
            {
                return NotFound();
            }
        }

        [Authorize]
        [HttpDelete("{restaurantId}")]
        public ActionResult<Like> DeleteLike(int restaurantId)
        {
            var userId = Convert.ToInt32(User.FindFirst("sub")?.Value);
            bool result = likeDAO.DeleteLike(restaurantId, userId);

            if (result)
            {
                return NoContent();
            }

            return StatusCode(500);
        }
    }
}
