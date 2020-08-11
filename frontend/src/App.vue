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
body{
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
}

#nav{
  display: flex;
  justify-content: center;
}
#nav a {
  padding: 0 .5rem;
}
</style>