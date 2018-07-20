package lima.paula.design.patterns.chainOfResponsibility;

/**
 * precisamos de uma classe que monte essa corrente na ordem certa, com todos os
 * descontos necessários. Por isso que optamos pela classe
 * CalculadorDeDescontos. Ela poderia ter qualquer outro nome como
 * CorrenteDeDescontos, e assim por diante, mas fato é que em algum lugar do seu
 * código você precisará montar essa corrente.
 */
public class CalculadorDeDescontos {

	public double calcula(Orcamento orcamento) {

		// cria os descontos conforme seus tipos
		Desconto d1 = new DescontoPorMaisDeCincoItens();
		Desconto d2 = new DescontoPorMaisDeQuinhentosReais();
		Desconto d3 = new SemDesconto();

		// configura a corrente de responsabilidades
		d1.setProximo(d2);
		d2.setProximo(d3);

		// inicia a corrente
		return d1.desconta(orcamento);
	}
}
