import axios from 'axios';

export default {

    getOptions() {
    return axios.get('/restaurant/type')
  }, 

}
