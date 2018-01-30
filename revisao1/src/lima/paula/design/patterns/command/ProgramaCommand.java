package lima.paula.design.patterns.command;

public class ProgramaCommand {

	
	//padrão command, encapsula comandos para executar num futuro.
	//vai encapsulando processos e comandos, e um certo momento processa todos
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Pedido p1 = new Pedido("Fernando", 1000);
		Pedido p2 = new Pedido("Carla", 200);
		Pedido p3 = new Pedido("Cassio", 200);
		
		FilaDeTrabalho f = new FilaDeTrabalho();
		
		
		f.addComando(new PagaPedido(p1));
		f.addComando(new PagaPedido(p2));
		f.addComando(new ConcluirPedido(p3));
		
		f.processa();
		
	}

}
