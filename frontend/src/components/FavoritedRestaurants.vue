<template>
    <div class = "restaurants">
        <div>
            <h1>Favorite Restaurants!</h1>
          {{favoriteRestaurants.restaurantId}}
        </div>
    </div>    
</template>


<script>

import favoriteRestaurantsService from '@/services/FavoriteRestaurantsService'

export default {
    name: 'favorited-restaurants',
    data() {
        return {
          favoriteRestaurants: {
              restaurantId: '',
          }
            }            
        },
    created() {
        
        favoriteRestaurantsService.getFavoriteRestaurants()
        .then(response => {
            this.favoriteRestaurants = response.data;
                });
            }
    }
        </script>