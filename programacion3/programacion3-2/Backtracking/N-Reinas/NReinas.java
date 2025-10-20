import java.util.Scanner;

public class NReinas {
    static int N;

    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.print("Ingrese el número de reinas: ");
            N = sc.nextInt();
            int[] tablero = new int[N];
            resolver(tablero, 0);
        }
    }

    static void resolver(int[] tablero, int fila) {
        if (fila == N) {
            System.out.println("\nSolución encontrada:");
            mostrar(tablero);
            return;
        }
        for (int col = 0; col < N; col++) {
            if (esValido(tablero, fila, col)) {
                tablero[fila] = col;
                resolver(tablero, fila + 1);
            }
        }
    }

    static boolean esValido(int[] tablero, int fila, int col) {
        for (int i = 0; i < fila; i++) {
            if (tablero[i] == col || Math.abs(tablero[i] - col) == Math.abs(i - fila))
                return false;
        }
        return true;
    }

    static void mostrar(int[] tablero) {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                System.out.print(tablero[i] == j ? " Q " : " x ");
            }
            System.out.println();
        }
    }
}
