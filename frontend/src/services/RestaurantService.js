import axios from 'axios';
const http = axios.create({
    baseURL: "http://localhost:44315"
});

export default {

    getRestaurant() {
        return http.get('/restaurant');
    },

    getRestaurants() {
        return http.get('/restaurant/${restaurantId}')
    }
}