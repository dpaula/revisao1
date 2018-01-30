package lima.paula.threads.exercicios;

public enum EnCorSinal {
	
	VERMELHO(1, 3000),AMARELO(2, 1000),VERDE(3, 2000);
	
	private int valor;
	private int tempo;

	private EnCorSinal(int valor, int tempo) {
		this.valor = valor;
		this.tempo = tempo;
	}

	public int getValor() {
		return this.valor;
	}
	
	public int getTempo() {
		return this.tempo;
	}
}
