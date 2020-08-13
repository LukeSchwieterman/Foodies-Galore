<template>
  <div class = "restaurants">
    <h1 class = "header">Favorite Restaurants!</h1>
    <div class="d-flex">
    <div v-for="restaurant in favoriteRestaurants" v-bind:key="restaurant.restaurantid">
      <b-button class="show-btn" v-bind:id="restaurant.restaurantId" @click="showModal($event)">{{restaurant.restaurantName}}</b-button>
      <b-modal v-bind:id="restaurant.restaurantId.toString()" hide-footer>
        <template v-slot:modal-title>
          <h3>{{restaurant.restaurantName}}</h3>
          <p>Phone Number: ({{restaurant.restaurantPhonenumber}})</p>
        </template>
        <div class="d-block">
          <li>{{restaurant.restaurantDescription}}</li>
          <li>{{restaurant.covidMessage}}</li>
          <div class ="text-center">
            <iframe  v-bind:src="restaurant.mapUrl" width="400" height="250" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
        </div>
          <b-button class="mt-3" v-bind:id="restaurant.restaurantId" block @click="hideModal($event)">Close Me</b-button>
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
      showModal(event) {
        this.$bvModal.show(event.currentTarget.id);
      },
      hideModal(event) {
        this.$bvModal.hide(event.currentTarget.id);
      },
  }
}
    
    </script>
 
 <style>
 
.header {
    height: 10vh;
}

.show-btn {
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
