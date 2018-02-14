package lima.paula.bibliotecasJava;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class ColecoesHashSet {

	public static void main(String[] args) {
		
		//hashSet não inclui itens duplicados
		Set<String> nomes = new HashSet<String>();
		nomes.add("Fernando");
		nomes.add("Carla");
		nomes.add("Fernando");
		nomes.add("Luana");
		
		for(String nome : nomes) {
			System.out.println(nome);
		}
		
		Conta c1 = new Conta(500);
		Conta c2 = new Conta(400);
		Conta c3 = new Conta(500);
		
		Set<Conta> contas = new HashSet<Conta>();
		contas.add(c1);
		contas.add(c1);
		contas.add(c3);
		
		for(Conta conta : contas) {
			System.out.println(conta.toString());
		}

		Collection<Conta> contas2 = new HashSet<Conta>();
		contas2.add(c1);
		contas2.add(c1);
		contas2.add(c3);
		
		for(Conta conta : contas2) {
			System.out.println(conta.toString());
		}
		
		Map<String, Conta> m = new HashMap<String, Conta>();
		m.put("Fernando", c1);
		m.put("Carla", c2);
		m.put("Luana", c3);
		
		for (Conta conta : m.values()) {
			System.out.println(conta);
		}
		
		System.out.println(m.get("Carla").getSaldo());
		
	}

}
