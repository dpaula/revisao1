package lima.paula.design.patterns.strategy;

public class Conta {

	private double saldo;

	/**
	 * @param saldo
	 */
	public Conta(double saldo) {
		this.saldo = saldo;
	}

	public double getSaldo() {
		return saldo;
	}

	public void setSaldo(double valor) {
		this.saldo = +valor;
	}

}
