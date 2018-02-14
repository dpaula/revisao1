package lima.paula.bibliotecasJava;

public class Conta implements Comparable<Conta> {

	private int saldo;

	public Conta(int saldo) {
		this.setSaldo(saldo);
	}

	/**
	 * @return the saldo
	 */
	public int getSaldo() {
		return saldo;
	}

	/**
	 * @param saldo
	 *            the saldo to set
	 */
	public void setSaldo(int saldo) {
		this.saldo = saldo;
	}

	@Override
	public int compareTo(Conta conta) {
		if (this.saldo < conta.getSaldo()) {
			return -1;
		} else if (this.saldo > conta.getSaldo()) {
			return 1;
		}

		return 0;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Conta [saldo=" + saldo + "]";
	}
	
	

}
