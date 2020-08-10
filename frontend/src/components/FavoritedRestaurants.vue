<template>
    <div class = "restaurants">
        <div>
            <h1>Favorite Restaurants!</h1>
            <div>
          {{favoriteRestaurants.restaurantId}}
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
          favoriteRestaurants: {
            userId: this.$store.state.user.userId,
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
 