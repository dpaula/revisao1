package lima.paula.design.patterns.strategy;

public class CalculadorDeImpostos {

	/**
	 * 
	 */
	public CalculadorDeImpostos(Orcamento orcamento, Imposto imposto) {
		System.out.println(imposto.calcular(orcamento));
	}

}
