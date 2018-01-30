package lima.paula.design.patterns.command;

public class PagaPedido implements Comando {

	Pedido pedido;
	
	
	
	/**
	 * @param pedido
	 */
	public PagaPedido(Pedido pedido) {
		this.pedido = pedido;
	}



	@Override
	public void executa() {
		System.out.println("Pagando o pedido do cliente: "+pedido.getCliente());
		this.pedido.paga();

	}

}
