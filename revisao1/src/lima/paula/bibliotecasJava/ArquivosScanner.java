package lima.paula.bibliotecasJava;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.Scanner;

public class ArquivosScanner {

	public static void main(String[] args) throws FileNotFoundException {

		// api mais auto nível para travalhar com arquivos..

		try (Scanner sc = new Scanner(new FileInputStream("leitura.txt"));) {
			try (PrintStream ps = new PrintStream("saida.txt");) {

				while (sc.hasNextLine()) {
					String linha = sc.nextLine();
					ps.println(linha);
				}
			}
		}

	}

}
