package lima.paula.design.patterns.interpreter;

import lima.paula.design.patterns.visitor.Impressora;

public class Numero implements Expressao {

	private int numero;
	
	public Numero(int numero) {
		this.numero = numero;
	}

	@Override
	public int avalia() {
		return this.numero;
	}

	public int getNumero() {
		return this.numero;
	}

	@Override
	public void aceita(Impressora impressora) {
		impressora.visitaNumero(this);
	}
	
	
}
