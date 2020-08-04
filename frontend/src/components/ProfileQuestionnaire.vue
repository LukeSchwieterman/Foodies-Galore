<template>
    <form v-on:submit.prevent>
        <h2>Create your profile</h2>

        <div class="field">
            <label for="zip">Zip Code</label>
            <input type="text" name="zip" v-model="userProfile.zipCode" required/>
        </div>
        <div class="field">
            
            <div v-for="option in availableOptions" v-bind:key="option" >
                
                <input id="box" class="single-checkbox" type="checkbox" v-bind:value="option" 
                v-model="userProfile.preferences"  
                :disabled="userProfile.preferences.length > 2 && userProfile.preferences.indexOf(option) === -1"/>
                <label id="box-label" for="checkbox"> {{ option }}</label>
            </div>
            
        </div>
            <div class="actions">
            <button type="submit" v-on:click="saveProfile">Save Profile</button>
        </div>

    </form>
</template>

<script>



import selectionService from '@/services/SelectionService';

export default {
    data() {
        return {
            selectionLimit: 3,
            availableOptions: [],            
            userProfile: {
                zipCode: '',
                preferences: []
            }            
        }

    },
    created() {
            
            selectionService.getOptions()
            .then(response => {
                this.availableOptions = response.data;        
            })
            .catch(error => {
                if (error.response) {
                    alert("Could not retrieve types.");
                }
            });
        

    },
    
    methods: {
        saveProfile() {
            this.$store.commit("SET_USER_PROFILE", this.userProfile) //this mutation is not setup yet in $store
        },       
        
    },
    
}
</script>

<style scoped>


</style>