package lima.paula.design.patterns.command;

public class ConcluirPedido implements Comando {

	Pedido pedido;
	
	public ConcluirPedido(Pedido pedido) {
		this.pedido = pedido;
	}
	
	
	@Override
	public void executa() {
		System.out.println("Concluindo Pedido "+pedido.getCliente());
		this.pedido.concluido();

	}

}
