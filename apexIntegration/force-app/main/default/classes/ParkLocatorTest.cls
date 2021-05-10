@isTest
public class ParkLocatorTest {
	@isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String countryName = 'Japan';
        List<String> result = ParkLocator.country(countryName);
        System.debug(result);
        // Verify that a fake result is returned
        List<String> expectedResult = new List<String>{
            'Shiretoko National Park', 
            'Oze National Park',
            'Hakusan National Park'
        };
        System.assertEquals(expectedResult, result); 
    }
}