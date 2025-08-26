import java.io.*;
import javax.swing.*;

public class Salario {
    public static void main(String[] args) throws Exception {
        String nombre = JOptionPane.showInputDialog("Ingrese el nombre del empleado:");
        String horas = JOptionPane.showInputDialog("Ingrese horas trabajadas:");
        String valor = JOptionPane.showInputDialog("Ingrese valor por hora:");

        ProcessBuilder pb = new ProcessBuilder("elixir", "Salario.exs", nombre, horas, valor);
        pb.redirectErrorStream(true);
        Process process = pb.start();

        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line = reader.readLine();

        JOptionPane.showMessageDialog(null, line);
    }
}