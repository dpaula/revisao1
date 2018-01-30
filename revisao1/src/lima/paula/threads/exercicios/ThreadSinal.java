package lima.paula.threads.exercicios;

public class ThreadSinal implements Runnable {

	private final String VERMELHO = "VERMELHO";
	private final String AMARELO = "AMARELO";

	private final String VERDE = "VERDE";

	private EnCorSinal cor;
	private boolean corMudou;
	private boolean foiTerminada;

	public ThreadSinal() {
		this.cor = EnCorSinal.VERMELHO;
		new Thread(this, cor.name()).start();
	}

	@Override
	public void run() {

		while (!foiTerminada) {

			try {
				Thread.sleep(cor.getTempo());
				mudarCor();
				
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}
	}

	private synchronized void mudarCor() {
		
		switch (this.cor) {
		case VERMELHO:
			this.cor = EnCorSinal.VERDE;
			break;
		case AMARELO:
			this.cor = EnCorSinal.VERMELHO;
			break;
		case VERDE:
			this.cor = EnCorSinal.AMARELO;
			break;

		default:
			break;
		}
		
		resume();
		
	}

	synchronized void resume() {
		this.corMudou = true;
		notify();
	}

	public synchronized void esperaCorMudar() {
		while (!this.corMudou) {
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		this.corMudou = false;
	}

	public String getCor() {
		return this.cor.name();
	}

	public void stop() {
		this.foiTerminada = true;
		
	}

}
