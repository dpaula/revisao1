package lima.paula.design.patterns.interpreter;

public class Programa {
	
	public static void main(String[] args) {
		
//		(10 + 5) + (20 - 5)
		
		Expressao esquerda = new Soma(new Numero(10), new Numero(5));
		Expressao direita = new Subtracao(new Numero(20), new Numero(5));
		
		Expressao resultado = new Soma(esquerda, direita);
		
		System.out.println(resultado.avalia());
		
		
	}

}
