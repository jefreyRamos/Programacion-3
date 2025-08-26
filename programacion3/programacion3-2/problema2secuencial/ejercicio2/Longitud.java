import java.io.*;
import java.util.Scanner;

public class Longitud {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        System.out.print("Digite una palabra: ");
        String palabra = sc.nextLine();

        ProcessBuilder pb = new ProcessBuilder("elixir", "Longitud.exs", palabra);
        pb.redirectErrorStream(true);
        Process process = pb.start();

        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line = reader.readLine();
        System.out.println("Cantidad de letras: " + line);
    }
}