package lima.paula.bibliotecasJava;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

public class Arquivos {

	public static void main(String[] args) throws IOException {

		// Leitura de arquivo

		// fluxo -Stream
		// Entrada - Input
		// Arquivos - File
		InputStream leBytes = new FileInputStream("leitura.txt"); // InputStream le bytes
		InputStreamReader leCaracteres = new InputStreamReader(leBytes); // transforma bytes em caracteres
		try (BufferedReader linhaBuffer = new BufferedReader(leCaracteres);) { // cria um buffer com uma linha dos caracteres

			
			// Escrita de arquivos
			OutputStream escreveBytes = new FileOutputStream("saida.txt"); // OutputStream escreve Bytes, transformando caracteres em bytes
			OutputStreamWriter escreveCaracteres = new OutputStreamWriter(escreveBytes); // escreve caracteres
			BufferedWriter linhaBufferEscrita = new BufferedWriter(escreveCaracteres); //cria um buffer com uma linha dos caracteres escritos
			
			String linha = linhaBuffer.readLine(); // retorna a linha de texto posicionada

			while (linha != null) {
				System.out.println(linha);
				linha = linhaBuffer.readLine();
			}

		}
	}

}
