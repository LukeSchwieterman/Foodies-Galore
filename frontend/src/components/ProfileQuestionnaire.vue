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
                 v-model="preferences"  
                 :disabled="preferences.length ==3  && preferences.indexOf(option) === -1"/>
                <label id="box-label" for="checkbox"> {{ option }}</label>
            </div>
            
        </div>
            <div class="actions">
            <button type="submit" v-on:click="saveProfile"
            :disabled="preferences.length < 3"
            >Save Profile</button>
        </div>

    </form>
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
            // .catch(error => {
            //     if (error.response) {
            //         alert("Could not retrieve your profile.");
            //     }
            // });
        

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
        
        temp(){
            this.userProfile.likedTypeOne = this.preferences[0];
            this.userProfile.likedTypeTwo = this.preferences[1];
            this.userProfile.likedTypeThree = this.preferences[2];
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
        }
        
    },
    
}
</script>

<style scoped>
#box{
    margin-left: 1rem;
    padding: 0 1rem;
}

#box-label{
    margin-left: 1rem;
    padding: 0 .5rem;
}

</style>