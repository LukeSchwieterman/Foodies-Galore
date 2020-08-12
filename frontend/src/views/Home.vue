<template>
  <div class="home">
    <h1>Foodies Galore Welcomes {{username}}!</h1>
    <h2 class="description">This application helps foodies looking for a good bite to eat decide where to go!</h2>
    <p>Click <a href ="update-profile"> here</a> to take your Foodies questionnaire!</p>
  </div>
</template>

<script>

export default {
  name: 'home',
  
  computed: {
        username() {
            return this.$store.state.user.username[0].toUpperCase() + this.$store.state.user.username.slice(1);
        }
    }   
};
</script>


<style scoped>
h1{
  text-align: center;
  font-weight: bold;
  font-size: 50px;
  color: rgb(177, 71, 0);
}
h2{
  text-align: center;
  font-weight: bold;
  font-size: 30px;
  margin-top: 50px;
  color: rgb(128, 0, 0);
}
p{
  text-align: center;
  font-weight: bold;
  font-size: 22px;
  margin-top: 25px;
  color: orangered;
}

</style>
