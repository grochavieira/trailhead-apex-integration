public class AnimalLocator {   
    public static String getAnimalNameById(Integer animalId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + String.valueOf(animalId));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        HerokuAnimalResponse animalResponse = (HerokuAnimalResponse) JSON.deserialize(response.getBody(), HerokuAnimalResponse.class);
        return animalResponse.animal.name;
    }
}