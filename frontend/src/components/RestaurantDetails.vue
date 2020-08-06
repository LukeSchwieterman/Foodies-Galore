<template>
    <div class = "details">
        <div>
          {{restaurantDetails.restaurantDescription}}
        </div>
    </div>    
</template>

<script>
import restaurantDetailsService from "../services/RestaurantDetailsService";

export default {
    name: 'restaurant-details',
    data() {
      return {
        restaurantDetails: {
          restaurantId: '',
          restaurantDescription: '',
          restaurantPhonenumber: '',
          covidMessage: ''
        },
          temp: 10,
      }
    },
    created() {

      restaurantDetailsService.getRestaurantDetails(this.temp)
      .then(response => {
        this.restaurantDetails = response.data;
        this.restaurantDetails.restaurantDescription = response.data.restaurantDescription
      })
    }
}
</script>

<style>

</style>