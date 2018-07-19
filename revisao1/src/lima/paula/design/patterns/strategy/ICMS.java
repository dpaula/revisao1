package lima.paula.design.patterns.strategy;

public class ICMS implements Imposto {

	@Override
	public double calcular(Orcamento orcamento) {
		return orcamento.getValor() * 0.05 + 50;
	}

}
