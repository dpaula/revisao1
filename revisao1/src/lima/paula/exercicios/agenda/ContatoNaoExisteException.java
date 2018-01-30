package lima.paula.exercicios.agenda;

public class ContatoNaoExisteException extends Exception {

	private String nome;
	
	public ContatoNaoExisteException(String nome) {
		super();
		this.nome = nome;
	}
	
	@Override
	public String toString() {
		return "Contato "+this.nome+" não existe na agenda!"; 
	}
}
