<template>
  <div id="app">
    <div id="nav" v-if="$store.state.token != ''">
      <router-link v-bind:to="{ name: 'home' }" v-if="$store.state.token != ''">Home</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'ProfileQuestionnaire' }" v-if="$store.state.token != ''">Questionnaire</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'favorites' }" v-if="$store.state.token != ''">Favorite Restaurants</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'swipe' }" v-if="$store.state.token != ''">Food Finder</router-link>&nbsp;| &nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>

    </div>
    <router-view />
  </div>
</template>

