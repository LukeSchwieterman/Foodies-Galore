import axios from 'axios';

export default {

    addFavoriteRestaurant(restaurant){
        return axios.post('/like/{user_id}', restaurant)
    },

    getFavoriteRestaurants(user_id){
        return axios.get(`/like/${user_id}`)
    }

}
