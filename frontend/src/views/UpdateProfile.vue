<template>
    <div>
        <navigation-bar />
        <h2 id="greeting"> {{username}}'s Current Profile</h2>
        <profile-questionnaire />
    </div>
</template>

<script>

import ProfileQuestionnaire from '@/components/ProfileQuestionnaire';
import NavigationBar from '@/components/NavigationBar.vue';

export default {

    components: {
        ProfileQuestionnaire,
        NavigationBar
    },
    
    computed: {
        username() {
            return this.$store.state.user.username[0].toUpperCase() + this.$store.state.user.username.slice(1);
        }
    }   
    
}
</script>

<style scoped>
    #greeting {
    text-align: center;
    /* position: absolute;
    margin: -25px 0 0 -25px;
    top: 30%;
    left: 33%; */
    }


</style>