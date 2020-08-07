<template>
    <div id="form-container" >
    <form id="form-view" v-on:submit.prevent>
        <h2>Create your profile</h2>

        <div id="zip" class="field">
            <label for="zip">Zip Code</label>
            <input type="text" name="zip" v-model="userProfile.zipCode" required autofocus/>
        </div>
        <div class="field">
            
            <b-form-group  name="restaurant-preferences">                
                <b-form-checkbox-group id="box" class="single-checkbox" 
                 v-model="userProfile.preferences" 
                 :options="availableOptions" 
                 switches stacked size="lg">                
                </b-form-checkbox-group>
            </b-form-group>
            
        </div>
            <div class="actions">
            <button type="submit" v-on:click="saveProfile"
            :disabled="userProfile.preferences.length < 1"
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
            userProfile: {
                userId: this.$store.state.user.userId,
                zipCode: '',
                preferences: []             
            }            
        }

    },
    created() {
            
            selectionService.getOptions()
            .then(response => {                
                response.data.forEach(element => {
                    this.availableOptions.push(element.type);
                });
            })
            .catch(error => {
                if (error.response) {
                    alert("Could not retrieve types.");
                }
            });

            // selectionService.getProfile()
            // .then(response => {
            //     this.userProfile = response.data; 
            //     if(response.data){
            //         this.isNewUser = false;
            //     }       
            // })            
    },
    
    methods: {
        saveProfile() {
            
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
  background-image: url("../views/images/burgerpizzapile.jpg");
  background-color: #fd0404;
  height: 500px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: flex-start;
}

form {
    margin: 1rem 0;
    padding: 1rem;
    width: 25%;
    background-color: rgb(109, 97, 97);
    opacity: 0.65;
    border: 2px solid maroon;
    border-radius: 25px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;    
    text-align: left;
   color: rgb(252, 248, 5);
    
}

#zip {
    display: flex;
    column-gap: 13px;    
}

#box {
    margin-left: 1rem;
    padding: 0 1rem;
    
}

#box-label{
    margin-left: 2rem;
    padding: 0 .1rem;
}

.actions {
    
    justify-content: space-evenly;
}

</style>