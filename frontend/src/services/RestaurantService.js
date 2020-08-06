import axios from 'axios';


export default {

    getRestaurants() {
        return axios.get('/restaurants');
    },

    getRestaurant() {
        return axios.get('/restaurant/${restaurantId}')
    }
}