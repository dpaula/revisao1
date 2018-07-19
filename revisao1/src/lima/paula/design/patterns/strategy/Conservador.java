package lima.paula.design.patterns.strategy;

public class Conservador implements Investimento {

	@Override
	public double calcula(Conta conta) {
		return conta.getSaldo() * .08;
	}

}
