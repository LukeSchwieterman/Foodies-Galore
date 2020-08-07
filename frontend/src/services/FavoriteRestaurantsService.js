import axios from 'axios';

export default {

    addFavoriteRestaurant(restaurant){
        return axios.post('/favorites', restaurant)
    },

    getFavoriteRestaurants(){
        return axios.get('/favorites/${restaurantId}')
    }

}
