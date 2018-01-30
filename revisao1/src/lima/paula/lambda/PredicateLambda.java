package lima.paula.lambda;

import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

public class PredicateLambda {

	
	/**
	 * Neste caso � poss�vel passar no parametro predicate, um bloco de instru��o na condi��o.
	 * 
	 * @param lista
	 * @param condicao
	 */
	public static void filtro(List<String> lista, Predicate<String> condicao) {
		
		System.out.println();
		System.out.println();
		//itera��o externa
		System.out.println("Itera��o externa: ");
		for(String s: lista) {
			if(condicao.test(s)) {
				System.out.println(s);
			}
		}
		System.out.println();
		System.out.println();
		System.out.println("Itera��o interna: ");
		lista.stream().filter((str) -> condicao.test(str)).forEach((str) -> System.out.println(str));
		lista.stream().filter(condicao::test).forEach(System.out::println);
		
	}
	
	public static void main(String[] args) {
		
		List<String> lista = Arrays.asList("S�o Paulo", "Santa Catarina", "Rio de Janeiro", "Paran�");
		
		System.out.println("Imprime somente estados que come�am com letra S");
		filtro(lista, (s) -> s.startsWith("S"));
		System.out.println();
		System.out.println();

		
		System.out.println("Imprime todos");
		filtro(lista, (String s) -> true);
	}
	
}
