package lima.paula.bibliotecasJava;

public class Conta implements Comparable<Conta> {

	private Integer saldo;

	public Conta(Integer saldo) {
		this.setSaldo(saldo);
	}

	/**
	 * @return the saldo
	 */
	public Integer getSaldo() {
		return saldo;
	}

	/**
	 * @param saldo
	 *            the saldo to set
	 */
	public void setSaldo(Integer saldo) {
		this.saldo = saldo;
	}

	@Override
	public int compareTo(Conta conta) {
		return this.saldo.compareTo(conta.saldo);
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Conta [saldo=" + saldo + "]";
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + saldo;
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Conta))
			return false;
		Conta other = (Conta) obj;
		if (saldo != other.saldo)
			return false;
		return true;
	}
	
	

}
