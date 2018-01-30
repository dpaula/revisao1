package lima.paula.design.patterns.command;

import java.util.Calendar;

public class Pedido {

	
	private String cliente;
	private double valor;
	private EnStatus status;
	private Calendar dataConclusao;
	/**
	 * @param cliente
	 * @param valor
	 */
	public Pedido(String cliente, double valor) {
		super();
		this.cliente = cliente;
		this.valor = valor;
		this.status = EnStatus.NOVO;
	}
	
	public void paga() {
		this.status = EnStatus.PAGO;
	}
	
	public void concluido() {
		this.dataConclusao = Calendar.getInstance(); 
		this.status = EnStatus.CONCLUIDO;
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
	 * @return the valor
	 */
	public double getValor() {
		return valor;
	}

	/**
	 * @param valor the valor to set
	 */
	public void setValor(double valor) {
		this.valor = valor;
	}

	/**
	 * @return the status
	 */
	public EnStatus getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(EnStatus status) {
		this.status = status;
	}

	/**
	 * @return the dataConclusao
	 */
	public Calendar getDataConclusao() {
		return dataConclusao;
	}

	/**
	 * @param dataConclusao the dataConclusao to set
	 */
	public void setDataConclusao(Calendar dataConclusao) {
		this.dataConclusao = dataConclusao;
	}
	
	
}
