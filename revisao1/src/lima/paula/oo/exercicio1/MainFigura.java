package lima.paula.oo.exercicio1;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Stream;

public class MainFigura {

	
	public static void teste(List<FiguraGeometrica> lista, Predicate<FiguraGeometrica> condi) {
		
//		for(FiguraGeometrica f : lista) {
//			if(condi.test(f)) {
//				System.out.println(f.toString());
//			}
//		}
		
		lista.stream().filter((figura) -> condi.test(figura)).forEach(figura -> System.out.println(figura.toString()));
		
		lista.stream().filter(condi::test).forEach(System.out::println);
	}
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		
		
		Cilindro cilindro = new Cilindro(10, 5);
		Circulo circulo = new Circulo(10);
		Cubo cubo = new Cubo(10,10,10);
		Quadrado quadrado = new Quadrado(10, 15);
		Triangulo triangulo = new Triangulo(10, 15);
		
		
		List<? extends FiguraGeometrica> asList = Arrays.asList(cilindro, circulo, cubo, quadrado, triangulo);
		
//		asList.forEach(x -> System.out.println(x.toString()));
		
		teste((List<FiguraGeometrica>) asList, (x) -> (x instanceof Figura3D));
		
		
		
//		List<FiguraGeometrica> l = new ArrayList<FiguraGeometrica>();
//		for(int i = 0; i < 10; i++) {
//			Cubo cubo2 = new Cubo(i,i,i);
//			
//			if (cubo2 instanceof FiguraGeometrica) {
//				l.add(cubo2);
//				
//			}
//			
//		}
		
		
		
		
		
	}

}
