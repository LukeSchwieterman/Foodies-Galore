<template>
    <div>
        <h2 id="greeting"> {{username}}'s Current Profile</h2>
        <profile-questionnaire />
    </div>
</template>

<script>

import ProfileQuestionnaire from '@/components/ProfileQuestionnaire';

export default {

    components: {
        ProfileQuestionnaire
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