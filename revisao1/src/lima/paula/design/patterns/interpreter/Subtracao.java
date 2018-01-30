package lima.paula.design.patterns.interpreter;

import lima.paula.design.patterns.visitor.Impressora;

public class Subtracao implements Expressao {
	
	private Expressao esquerda;
	private Expressao direita;

	public Subtracao(Expressao esquerda, Expressao direita) {
		this.esquerda = esquerda;
		this.direita = direita;
		
	}

	@Override
	public int avalia() {
		return esquerda.avalia() - direita.avalia();
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

	@Override
	public void aceita(Impressora impressora) {
		impressora.visitaSubtracao(this);
		
	}
	
	

}
