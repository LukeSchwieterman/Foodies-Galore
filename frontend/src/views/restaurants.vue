<template>
    <!-- <header> I hope this page works *internal screaming* </header> -->
    <div class="restaurants">
        <div
            class="restaurant"
            v-for="restaurant in restaurants"
            v-bind:key="restaurant.id"
            >
            </div>
            </div>
</template>

<script>
import restaurantService from '../services/RestaurantService';

export default {
    data() {
        return {
            restaurant: []
        };
    },
    created() {
        restaurantService.getRestaurants().then(response => {
            this.restaurants = response.data;
        });
    }
    
}
</script>

<style scoped>
.restaurants {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.restaurant {
  background-color: #f7fafc;
  border-radius: 10px;
  padding: 40px;
  flex: 1;
  margin: 0 20px;
  text-align: center;
}
</style>