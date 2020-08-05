<template>
    <div id="form-container" >
    <form id="form-view" v-on:submit.prevent>
        <h2>Create your profile</h2>

        <div class="field">
            <label for="zip">Zip Code</label>
            <input type="text" name="zip" v-model="userProfile.zipCode" required/>
        </div>
        <div class="field">
            
            <div v-for="option in availableOptions" v-bind:key="option" >
                
                <input id="box" class="single-checkbox" type="checkbox" v-bind:value="option" 
                 v-model="preferences"  
                 :disabled="preferences.length ==3  && preferences.indexOf(option) === -1"/>
                <label id="box-label" for="checkbox"> {{ option }}</label>
            </div>
            <b-form-group  name="restaurant-preferences">                
                <b-form-checkbox-group id="box" class="single-checkbox" 
                 v-model="preferences" 
                 :options="availableOptions" 
                 :disabled="preferences.length == 3 && preferences.indexOf(availableOptions) === -1" 
                 switches stacked size="lg">                
                </b-form-checkbox-group>
            </b-form-group>
            
        </div>
            <div class="actions">
            <button type="submit" v-on:click="saveProfile"
            :disabled="preferences.length < 3"
            >Save Profile</button>
        </div>

    </form>
    </div>
</template>

<script>



import selectionService from '@/services/SelectionService';

export default {
    name: 'profile-questionnaire',
    data() {
        return {
            isNewUser: true,
            availableOptions: [],            
            preferences: [],            
            userProfile: {
                userId: this.$store.state.user.userId,
                zipCode: '',
                likedTypeOne: '',
                likedTypeTwo: '',
                likedTypeThree: ''                
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

            selectionService.getProfile()
            .then(response => {
                this.userProfile = response.data; 
                if(response.data){
                    this.isNewUser = false;
                }       
            })            
    },
    
    methods: {
        saveProfile() {
            
            this.userProfile.likedTypeOne = this.preferences[0];
            this.userProfile.likedTypeTwo = this.preferences[1];
            this.userProfile.likedTypeThree = this.preferences[2];
            

            if(this.isNewUser){
                selectionService.addProfile(this.userProfile)
                .then(response => {
                    if (response.status === 200) {
                        this.$router.push(`/swipe`);
                    }
                })
                .catch(error => {
                    if (error.response) {
                        alert("Could not create profile.");            
                    }
                });
            }
            else
            {
                selectionService.updateProfile(this.userProfile)
                .then(response => {
                    if (response.status === 200) {
                        this.$router.push(`/swipe`);
                    }
                })
                .catch(error => {
                    if (error.response) {
                        alert("Could not update profile.");            
                    }
                });
            }
            
            
        },  
    },
    
}
</script>

<style scoped>

#form-container {
    display: block;
    text-align: center;
}
form {
    display: inline-block;
    margin: 0 auto;
    text-align: left;
    background-image: url("../views/images/burgerpizzapile.jpg");
}

#box{
    margin-left: 3rem;
    padding: 0 1rem;
    
}

#box-label{
    margin-left: 1rem;
    padding: 0 .5rem;
}

</style>