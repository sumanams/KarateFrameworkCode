package features;
import com.intuit.karate.junit5.*;

public class karateRunner {
	 @Karate.Test
	    public Karate testt1() {
	        return Karate.run("t1").tags("@s1").relativeTo(getClass());
	    }
}
