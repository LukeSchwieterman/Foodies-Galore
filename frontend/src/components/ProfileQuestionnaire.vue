<template>
    <form v-on:submit.prevent>
        <h2>Create your profile</h2>

        <div class="field">
            <label for="zip">Zip Code</label>
            <input type="text" name="zip"  />
        </div>
        <div class="field">
            <label for="preferences">Choose your top three:</label>
            <select id="preferences" name="preferences" size="3" multiple>
                <option value="Please">Select 3 Preferneces</option>
                
            </select>
        </div>
            <div class="actions">
            <button type="submit" v-on:click="saveProfile()">Save Profile</button>
        </div>

    </form>
</template>

<script>

import selectionService from '@/services/SelectionService';

export default {
    data() {
        return {
            availableOptions: [],            
            userProfile: {
                zipCode: '',
                preferences: []
            }
        }

    },
    created: {
        getAvailableOptions(){
            selectionService.getOptions()
            .then(response => {
            this.$store.commit("SET_AVAILABLE_OPTIONS", response.data);
            this.availableOptions = response.data;        
            })
            .catch(error => {
                if (error.response) {
                alert("Could not update profile.");
                }
            });
        } 

    },
    computed: {

    },
    methods: {
        
    }
}
</script>