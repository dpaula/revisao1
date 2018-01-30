package lima.paula.design.patterns.memento;

import java.util.Calendar;

public class Contrato {
	
	private Calendar data;
	private String cliente;
	private TipoContrato tipo;
	
	
	
	/**
	 * @param data
	 * @param cliente
	 * @param tipo
	 */
	public Contrato(Calendar data, String cliente, TipoContrato tipo) {
		this.data = data;
		this.cliente = cliente;
		this.tipo = tipo;
	}
	/**
	 * @return the data
	 */
	public Calendar getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(Calendar data) {
		this.data = data;
	}
	/**
	 * @return the cliente
	 */
	public String getCliente() {
		return cliente;
	}
	/**
	 * @param cliente the cliente to set
	 */
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	/**
	 * @return the tipo
	 */
	public TipoContrato getTipo() {
		return tipo;
	}
	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(TipoContrato tipo) {
		this.tipo = tipo;
	}
	
	public String avanca() {
		
		switch(tipo) {
		case NOVO:
			this.tipo = TipoContrato.EM_ANDAMENTO;
			return tipo.name();
		case EM_ANDAMENTO:
			this.tipo = TipoContrato.ACERTADO;
			return tipo.name();
		case ACERTADO:
			this.tipo = TipoContrato.CONCLUIDO;
			return tipo.name();
		default:
			return null;
		}
		
	}
	
	public Estado salvaEstado() {
		return new Estado(new Contrato(this.data, this.cliente, this.tipo));
	}
	
	

}
