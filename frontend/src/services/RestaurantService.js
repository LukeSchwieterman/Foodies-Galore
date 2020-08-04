import axios from 'axios';
const http = axios.create({
    baseURL: "http://localhost:44315"
});

export default {

    getRestaurant() {
        return http.get('/restaurants');
    },

    getRestaurants() {
        return http.get('/restaurants/${restaurantID}')
    }
}