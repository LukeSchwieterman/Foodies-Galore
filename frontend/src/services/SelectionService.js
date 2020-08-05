import axios from 'axios';

export default {

  getOptions() {
    return axios.get('/restaurant/types');
  }, 

  updateProfile(profile) {
    return axios.put('/account', profile);
  },

  addProfile(profile) {
    return axios.post('/account', profile);
  },

  getProfile() {
    return axios.get('/account');
  }
}
