package Features;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class JavaFunctions {

    public void callJavaFunction(){
        System.out.println("Bu method karate tarafından çağrılmıştır.");
    }

    public String callWithArgument(String arg){
        System.out.println("Method çağrıldı.");
        return "Hoşgeldin : " + arg;
    }

    public void writeData(String arg) throws FileNotFoundException, UnsupportedEncodingException {
        PrintWriter writer = new PrintWriter("Data.txt","UTF-8");
        writer.println(arg);
        writer.close();
    }
}
