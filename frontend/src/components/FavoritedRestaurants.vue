<template>
    <div class = "restaurants">
            <h1 class = "header">Favorite Restaurants!</h1>
            <p>(Click one to find out more!)</p>
            <div v-for="restaurant in favoriteRestaurants" v-bind:key="restaurant.restaurantid">
          <div>
  <b-button id="show-btn" @click="$bvModal.show('bv-modal-example')">{{restaurant.restaurantName}}</b-button>

  <b-modal id="bv-modal-example" hide-footer>
    <template v-slot:modal-title>
        <h3>{{restaurant.restaurantName}}</h3>
    </template>
    <div class="d-block text-center">
      <h3>{{restaurant.restaurantDescription}}</h3>
    </div>
    <b-button class="mt-3" block @click="$bvModal.hide('bv-modal-example')">Close Me</b-button>
  </b-modal>
</div>
          </div>
        </div>   
</template>


<script>

import favoriteRestaurantsService from '@/services/FavoriteRestaurantsService'

export default {

    name: 'favorited-restaurants',
    data() {
        return {
          favoriteRestaurants: [],
          showDetails: null,
        }          
        },
    created() {
        
        favoriteRestaurantsService.getFavoriteRestaurants()
        .then(response => {
            this.favoriteRestaurants = response.data;
        });
    },
    methods: {
  }
}
    
    </script>
 
 <style>
 
.header {
    height: 10vh
}

#show-btn {
    margin-top: 5vh;

}

 </style>