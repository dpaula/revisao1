package lima.paula.design.patterns.visitor;

import lima.paula.design.patterns.interpreter.Numero;
import lima.paula.design.patterns.interpreter.Soma;
import lima.paula.design.patterns.interpreter.Subtracao;

public class Impressora {
	
	public void visitaSoma(Soma soma) {
		System.out.print("(");
		
		//esquerda
		soma.getEsquerda().aceita(this);
		
		System.out.print("+");
		
		//direita
		soma.getDireita().aceita(this);
		
		System.out.print(")");
	}

	public void visitaSubtracao(Subtracao sub) {
		System.out.print("(");
		
		//esquerda
		sub.getEsquerda().aceita(this);
		
		System.out.print("-");
		
		//direita
		sub.getDireita().aceita(this);
		
		System.out.print(")");
	}

	public void visitaNumero(Numero numero) {
		System.out.print(numero.getNumero());
	}
}
