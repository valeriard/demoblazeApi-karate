package demoblaze;

import com.intuit.karate.junit5.Karate;

class DemoblazeRunnerTest {

    @Karate.Test
    Karate testDemoblaze() {
        return Karate.run("demoblaze").relativeTo(getClass());
    }
}