package lima.paula.threads;

public class MinhaThread2 implements Runnable {

	private String nome;
	private boolean estaSuspensa;
	private boolean foiTerminada;

	public MinhaThread2(String nome) {
		this.estaSuspensa = false;
		this.foiTerminada = false;
		this.nome = nome;
		new Thread(this, nome).start();
	}

	@Override
	public void run() {

		System.out.println("Executando " + this.nome);

		try {
			for (int i = 0; i < 10; i++) {

				System.out.println(nome + " " + i);

				Thread.sleep(300);
				
				//classe sincronizada
				synchronized (this) {
					while(estaSuspensa) {
						//espera
						wait();
					}
					if(this.foiTerminada) {
						break;
					}
				}
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(this.nome + " FINALIZADA!!");

	}
	
	void suspend() {
		this.estaSuspensa = true;
	}

	//notifica a thread que está suspensa para voltar a funcionar
	synchronized void resume() {
		this.estaSuspensa = false;
		notify();
	}
	
	//para stopar, tem q notificar antes pois a classe pode estar em espera
	synchronized void stop() {
		this.foiTerminada = true;
		notify();
	}
}
