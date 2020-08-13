<template>
    <div>
        <h2 id="greeting">Welcome, {{username}}! Let's Create Your Profile</h2>
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
    margin-top: 17vh;
    color:blanchedalmond;
    }

</style>