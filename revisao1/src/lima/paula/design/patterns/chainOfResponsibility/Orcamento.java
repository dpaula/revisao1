package lima.paula.design.patterns.chainOfResponsibility;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Orcamento {

	private List<Item> itens;
	private double valor;

	/**
	 * @param itens
	 * @param valor
	 */
	public Orcamento(double valor) {
		this.itens = new ArrayList<Item>();
		this.valor = valor;
	}

	public List<Item> getItens() {
		// retorna a lista como read only
		return Collections.unmodifiableList(this.itens);
	}

	public void addItem(Item item) {
		this.itens.add(item);
	}

	public double getValor() {
		return this.valor;
	}

}
