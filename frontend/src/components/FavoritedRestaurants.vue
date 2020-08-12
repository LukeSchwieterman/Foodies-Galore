<template>
  <div class = "restaurants">
    <h1 class = "header">Favorite Restaurants!</h1>
    <container class="d-flex">
    <div v-for="restaurant in favoriteRestaurants" v-bind:key="restaurant.restaurantid">
      <b-button id="show-btn" @click="$bvModal.show('info')">{{restaurant.restaurantName}}</b-button>
      <b-modal id="info" hide-footer>
        <template v-slot:modal-title>
          <h3>{{restaurant.restaurantName}}</h3>
        </template>
        <div class="d-block text-center">
          <h3>{{restaurant.restaurantDescription}}</h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3086.3823991360287!2d-84.4316842485506!3d39.32492087940628!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x884050251a956b9f%3A0xfb73f91d4aff6fea!2sYummy%20Bowl!5e0!3m2!1sen!2sus!4v1597247399512!5m2!1sen!2sus" width="400" height="250" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
          <b-button class="mt-3" block @click="$bvModal.hide('info')">Close Me</b-button>
      </b-modal>
    </div>
    </container>
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
    margin-left: 10vh;
}

.d-flex {
  flex-direction: row;
  justify-content: flex-start;
  flex-wrap: wrap;
}

.d-flex>div {
  width: 20%;
}

 </style>
