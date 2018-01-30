package lima.paula.design.patterns.interpreter;

import lima.paula.design.patterns.visitor.Impressora;

public class Soma implements Expressao {
	
	private Expressao direita;
	private Expressao esquerda;

	public Soma(Expressao esquerda, Expressao direita) {
		this.esquerda = esquerda;
		this.direita = direita;
	}

	@Override
	public int avalia() {
		return esquerda.avalia() + direita.avalia();
	}

	/**
	 * @return the direita
	 */
	public Expressao getDireita() {
		return direita;
	}

	/**
	 * @param direita the direita to set
	 */
	public void setDireita(Expressao direita) {
		this.direita = direita;
	}

	/**
	 * @return the esquerda
	 */
	public Expressao getEsquerda() {
		return esquerda;
	}

	/**
	 * @param esquerda the esquerda to set
	 */
	public void setEsquerda(Expressao esquerda) {
		this.esquerda = esquerda;
	}

	@Override
	public void aceita(Impressora impressora) {
		impressora.visitaSoma(this);
		
	}
	
	

}
