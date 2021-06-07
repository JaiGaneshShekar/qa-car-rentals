function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    baseUri : "https://refyne-car-rental.herokuapp.com/api/",
    auth : "auth/login",
    getAllPath: "car/all",
    searchCarsPath: "car/search-cars/2021-05-23/2021-05-24",
    calculatePricePath: "car/calculate-price/6098bafd1ff5990015be8e20/2021-05-23/2021-05-24",
    bookCar: "car/book",
    env: env,
	myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}