package lima.paula.bibliotecasJava;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Colecoes {

	public static void main(String[] args) {
		
		testaArrayLists();

	}

	private static void testaArrayLists() {
		
		ArrayList<String> nomes = new ArrayList<String>();
		nomes.add("Luana");
		nomes.add("Fernando");
		nomes.add("Carla");
		nomes.add("Cassio");
		
//		System.out.println(nomes.get(0));
//		System.out.println(nomes.contains("Luana"));
//		System.out.println(nomes.contains("Carla"));
		
//		for(int i = 0; i < nomes.size(); i++) {
//			System.out.println(nomes.get(i));
//		}

		Collections.sort(nomes);
		
		for(String nome : nomes) {
			System.out.println(nome);
		}
		
		Conta c1 = new Conta(500);
		Conta c2 = new Conta(400);
		Conta c3 = new Conta(1000);
		
		List<Conta> contas = new ArrayList<Conta>();
		contas.add(c1);
		contas.add(c2);
		contas.add(c3);
		
		System.out.println();
		System.out.println("contas ordenadas");
		Collections.sort(contas);
		
		for (Conta conta : contas) {
			System.out.println(conta);
		}
		
		System.out.println("lambda");
		contas.forEach(conta -> System.out.println(conta.toString()));
		
	}

}
