import com.intuit.karate.junit5.Karate;

public class karateRunner {

    @Karate.Test
    Karate testSample() {
        //return Karate.run("classpath:apiRest/karateTest.feature").tags("CasoAutomatizacionPOST");
        //return Karate.run("classpath:apiSOAP/testSoap.feature").tags("CasoAutomatizacionPOST");
        return Karate.run("classpath:apiGraphQL/testGraphQL.feature").tags("CasoAutomatizacionPOST");
    }

    @Karate.Test
    Karate testREST() {
        return Karate.run("classpath:apiRest/karateTest.feature").tags("CasoAutomatizacionPOST");
    }

    @Karate.Test
    Karate testSOAP() {
        return Karate.run("classpath:apiSOAP/testSoap.feature").tags("CasoAutomatizacionPOST");
    }

    @Karate.Test
    Karate GraphQL() {
        return Karate.run("classpath:apiGraphQL/testGraphQL.feature");
    }
    @Karate.Test
    Karate testCSV() {
        return Karate.run("classpath:apiRest/csv&json.feature");
    }
}
