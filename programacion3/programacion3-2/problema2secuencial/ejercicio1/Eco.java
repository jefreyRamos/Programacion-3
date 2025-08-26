import java.io.*;

public class Eco {
    public static void main(String[] args) throws Exception {
        ProcessBuilder pb = new ProcessBuilder("elixir", "Eco.exs", "Hola mundo");
        pb.redirectErrorStream(true);
        Process process = pb.start();

        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line = reader.readLine();
        System.out.println("Elixir devolvió: " + line);
    }
}