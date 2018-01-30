package lima.paula.design.patterns.visitor;

import lima.paula.design.patterns.interpreter.Expressao;
import lima.paula.design.patterns.interpreter.Numero;
import lima.paula.design.patterns.interpreter.Soma;
import lima.paula.design.patterns.interpreter.Subtracao;

public class Programa {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
//		(10 + 5) + (20 - 5)
		
		Expressao esquerda = new Soma(new Numero(10), new Numero(5));
		Expressao direita = new Subtracao(new Numero(20), new Numero(5));
		
		Expressao resultado = new Soma(esquerda, direita);
		
		System.out.println(resultado.avalia());
		
		Impressora impressora = new Impressora();
		
		resultado.aceita(impressora);
	}

}
