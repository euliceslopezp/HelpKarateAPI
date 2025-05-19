import com.intuit.karate.junit5.Karate;



public class RunnerTest {

    @Karate.Test
    Karate testPrueba() {
        return Karate.run("classpath:resources")
                .karateEnv("dev")
                .tags("@regresion");
    }

}
