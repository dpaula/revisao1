package lima.paula.design.patterns.strategy;

public class RealizadorDeInvestimentos {

	public void realiza(Conta conta, Investimento invest) {

		double resultado = invest.calcula(conta);

		conta.setSaldo(resultado * .75);

		System.out.println("Saldo atual da conta: " + conta.getSaldo());

	}

}
