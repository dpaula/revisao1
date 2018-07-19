package lima.paula.design.patterns.strategy;

public class ISS implements Imposto {

	@Override
	public double calcular(Orcamento orcamento) {
		return orcamento.getValor() * 0.06;
	}

}
