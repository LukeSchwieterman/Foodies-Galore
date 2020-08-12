<template>
<body>
  <div id="app">
    <div id="nav" v-if="$store.state.token != '' && $store.state.isNewUser == false">
      <router-link v-bind:to="{ name: 'home' }" v-if="$store.state.token != ''">Home</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'UpdateProfile' }" v-if="$store.state.token != ''">Questionnaire</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'favorites' }" v-if="$store.state.token != ''">Favorite Restaurants</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'swipe' }" v-if="$store.state.token != ''">Food Finder</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view class = "body"/>
  </div>
  </body>
</template>

<style scoped>
*{
<<<<<<< HEAD
    font-family: "Impact", Charcoal, sans-serif;
    color: maroon;
    background-color: #aa8b003d;
    background-image:url('./assets/backgroundpicture.jpg');
    height: 100vh;
    background-repeat: no-repeat;
    
=======
    /* height: 100vh; */
    font-family: "Impact", Charcoal, sans-serif;
    color: maroon;
    background-color: #fbda47;
}

.body{
  background-image:url('./assets/food_background.jpg');
  height: 100vh;
  background-repeat: no-repeat;
  background-size: cover;
>>>>>>> 9643772e2deef98e3ff51c681e48cd1b4c31709b
}

#nav{
  display: flex;
  justify-content: center;
  position: absolute;
}
#nav a {
  padding: 0 .5rem;
}
</style>