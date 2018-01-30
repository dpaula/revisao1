package lima.paula.lambda;

import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

public class PredicateLambda {

	
	/**
	 * Neste caso é possível passar no parametro predicate, um bloco de instrução na condição.
	 * 
	 * @param lista
	 * @param condicao
	 */
	public static void filtro(List<String> lista, Predicate<String> condicao) {
		
		System.out.println();
		System.out.println();
		//iteração externa
		System.out.println("Iteração externa: ");
		for(String s: lista) {
			if(condicao.test(s)) {
				System.out.println(s);
			}
		}
		System.out.println();
		System.out.println();
		System.out.println("Iteração interna: ");
		lista.stream().filter((str) -> condicao.test(str)).forEach((str) -> System.out.println(str));
		lista.stream().filter(condicao::test).forEach(System.out::println);
		
	}
	
	public static void main(String[] args) {
		
		List<String> lista = Arrays.asList("São Paulo", "Santa Catarina", "Rio de Janeiro", "Paraná");
		
		System.out.println("Imprime somente estados que começam com letra S");
		filtro(lista, (s) -> s.startsWith("S"));
		System.out.println();
		System.out.println();

		
		System.out.println("Imprime todos");
		filtro(lista, (String s) -> true);
	}
	
}
