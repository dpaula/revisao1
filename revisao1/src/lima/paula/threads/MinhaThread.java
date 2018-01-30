package lima.paula.threads;

public class MinhaThread extends Thread {

	private String nome;
	private int tempo;

	public MinhaThread(String nome, double tempo) {
		this.nome = nome;
		this.tempo = (int) (tempo * 1000);
		start();
	}

	@Override
	public void run() {

		try {
			for (int i = 0; i < 6; i++) {
				System.out.println(nome + " " + i);
				sleep(tempo);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		System.out.println("finalizou a " + nome);
	}
}
