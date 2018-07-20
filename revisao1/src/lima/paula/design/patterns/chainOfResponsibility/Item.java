package lima.paula.design.patterns.chainOfResponsibility;

public class Item {

	private String nome;
	private double valor;

	/**
	 * @param nome
	 * @param valor
	 */
	public Item(String nome, double valor) {
		this.nome = nome;
		this.valor = valor;
	}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @return the valor
	 */
	public double getValor() {
		return valor;
	}

}
