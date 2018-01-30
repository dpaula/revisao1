package lima.paula.oo.enumeracoes;

public class PessoaD {

	private String numeroDocumento;
	private EnTipoDocumento tipoDocumento;
	
	
	/**
	 * 
	 */
	public PessoaD() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param numeroDocumento
	 * @param tipoDocumento
	 */
	public PessoaD(String numeroDocumento, EnTipoDocumento tipoDocumento) {
		super();
		this.numeroDocumento = numeroDocumento;
		this.tipoDocumento = tipoDocumento;
	}
	/**
	 * @return the numeroDocumento
	 */
	public String getNumeroDocumento() {
		return numeroDocumento;
	}
	/**
	 * @param numeroDocumento the numeroDocumento to set
	 */
	public void setNumeroDocumento(String numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}
	/**
	 * @return the tipoDocumento
	 */
	public EnTipoDocumento getTipoDocumento() {
		return tipoDocumento;
	}
	/**
	 * @param tipoDocumento the tipoDocumento to set
	 */
	public void setTipoDocumento(EnTipoDocumento tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PessoaD [numeroDocumento=" + numeroDocumento + ", tipoDocumento=" + tipoDocumento + "]";
	}
	
	
	
}
