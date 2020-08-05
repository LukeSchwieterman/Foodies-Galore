<template>
    <div>
        <h2>Update Profile View</h2>
        <profile-questionnaire />
    </div>
</template>

<script>

import ProfileQuestionnaire from '@/components/ProfileQuestionnaire'
import selectionService from '@/services/SelectionService';

export default {

    components: {
        ProfileQuestionnaire,
    },

    methods: {
        saveProfile() {
            // would prefer to send preferences as an array and let the back end handle - this isn't very flexible.
            this.userProfile.likedTypeOne = this.preferences[0];
            this.userProfile.likedTypeTwo = this.preferences[1];
            this.userProfile.likedTypeThree = this.preferences[2];
            //this.$store.commit("SET_USER_PROFILE", this.userProfile); // is this needed ??

            selectionService.updateProfile(this.userProfile)
                .then(response => {
                    if (response.status === 200) {
                        this.$router.push(`/`);
                    }
                })
                .catch(error => {
                    if (error.response) {
                        alert("Could not update profile.");            
                    }
                });
        },       
        
    },
    
}
</script>