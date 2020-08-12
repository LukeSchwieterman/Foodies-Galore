<template>
<body>
  <div id="app">
    <div id="nav" v-if="$store.state.token != '' && $store.state.isNewUser == false">
      <router-link v-bind:to="{ name: 'home' }" v-if="$store.state.token != ''">Home</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'UpdateProfile' }" v-if="$store.state.token != ''">Questionnaire</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'favorites' }" v-if="$store.state.token != ''">Favorite Restaurants</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'swipe' }" v-if="$store.state.token != ''">Food Finder</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'details' }" v-if="$store.state.token != ''">Details</router-link> <!-- temp for dev only  -->
    </div>
    <router-view class = "body"/>
  </div>
  </body>
</template>

<style scoped>
*{
    font-family: "Impact", Charcoal, sans-serif;
    color: white;
    text-align: center;
    background-image:url('./assets/backgroundpicture.jpg');
    background-repeat: no-repeat;
    background-size: cover;
}

.body{
  height: 100vh;
}

#nav{
  display: flex;
  justify-content: center;
}
</style>