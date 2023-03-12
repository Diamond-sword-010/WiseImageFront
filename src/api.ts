import axios from "axios";

axios.defaults.baseURL = "http://localhost:3000";

export default {
    sensors() {
        return {
            getAllSensors: () => axios.get(`/sensor`),
            getSensorById: (sensorId : number) => axios.get(`/sensor/${sensorId}`),
            getWorkingAndNotWorkingAmounts: async  () => {
                const {data: amounts} = (await axios.get('/sensor/amounts'));
                return amounts;
            },
            getSensorObservationArea: (sensorId : number) => axios.get(`/sensor/observationArea/${sensorId}`),
        }
    },

    troops() {
        return {
            getAllTroops: () => axios.get(`/troops`),
            getTroopById: (troopId: number) => axios.get(`/troops/${troopId}`),
            getTypesAmounts: async () => {
                const { data: types } = await axios.get('troops/types/amounts');
                return types;
            }
        }
    },
    recommend() {
        return {
            getAllRecommends: () => axios.get(`/recommends`),
            getRecommendationsToMoveSolidersBetweenHtmrs: () => 
            axios.get('/recommends/MoveSolidersBetweenHtmrs'),
            getHotAreacommends: () => axios.get(`/recommends/hot`),
        }
    },

    events() {
        return {
            getHtmrSecurityLevelAmounts: async () => {
                const {data: securityLevelsAmounts} = await axios.get("htmr/securityLevelAmounts");
                return securityLevelsAmounts;
            },
            getAllEvents: () => axios.get(`/events`),
    }
},
htmrs() {
    return {
        getHtmrs: () => axios.get(`/htmr`),
        getHtmrSecurityLevelAmounts: async () => {
            const {data: securityLevelsAmounts} = await axios.get("htmr/securityLevelAmounts");
            return securityLevelsAmounts;
        },
        getEventsAmountInHtmrs: async () => {
            const {data: eventsAmountInHtmr} = await axios.get("htmr/eventsAmount");
            return eventsAmountInHtmr;
        },
        getSolidersPerHtmr: () => axios.get(`htmr/solidersAmount`),
    }
},
    weather() {
        return {
            getCurrTemp: async () => {
               const beerShaveCoordinates: String = "31.2530, 34.7915";
               const apiKey: String = "9f78ba8554994e1b93e151520230503";
               const currTemp = await axios.get
               (`http://api.weatherapi.com/v1/current.json?key=${apiKey}&q=${beerShaveCoordinates}`);
               return currTemp.data.current.temp_c;
           }
       }
    }
};


