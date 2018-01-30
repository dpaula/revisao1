package lima.paula.lambda;

import java.util.Arrays;
import java.util.List;

public class StreamLambda {

	public static void main(String[] args) {

		List<String> lista = Arrays.asList("Santa Catarina", "Paraná", "São Paula", "Rio de Janeiro");
		
		for(String uf : lista) {
			System.out.println(uf);
		}
		System.out.println();
		System.out.println();
		
		lista.forEach(x -> System.out.println(x));
		System.out.println();
		System.out.println();
		
		lista.forEach(System.out::println);
		

	}

}
