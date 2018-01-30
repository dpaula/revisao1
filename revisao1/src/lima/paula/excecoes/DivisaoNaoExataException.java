package lima.paula.excecoes;

public class DivisaoNaoExataException extends Exception {

	private int numerador;
	private int denominador;
	
	public DivisaoNaoExataException(int numerador, int denominador) {
		super();
		this.numerador = numerador;
		this.denominador = denominador;
	}
	
	
	@Override
	public String toString() {
		return "Resultado de "+this.numerador+"/"+this.denominador+" não é um inteiro!";
		
	}
	
}
