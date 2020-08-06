<template>
    <!-- <header> I hope this page works *internal screaming* </header> -->
    <div class="restaurants">
        <h2>{{ title }}</h2>
        <div class="restaurantDisplays">
            <div
            class="restaurantDisplay"
            v-for="restaurant in restaurants"
            v-bind:key="restaurant.id"
            v-on:click="viewRestaurantDetails(restaurant.id)"
            >
            <div class ="header">
                <h3>{{ restaurant.restaurant_name}} </h3>
                    </div>
            </div>
            </div>
            </div>

</template>

<script>

import RestaurantService from '../services/RestaurantService'

export default {
name: 'restaurants',
data() {
        return {
            restaurantArray: []
            }                           
        },   
  created(){
      RestaurantService.getRestaurants().then(r =>{
      this.restaurantArray = r.data
      })
  },
  methods: {
    viewRestaurantDetails() {
      this.$router.push(`/restaurants/${this.restaurantId}`);
    }
    }
  };
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