package lima.paula.oo.exercicio1;

public class Triangulo extends Figura2D{

	private double altura;
	private double largura;
	
	public Triangulo(double altura, double largura) {
		setAltura(altura);
		setLargura(largura);
	}
	
	/**
	 * @return the altura
	 */
	public double getAltura() {
		return altura;
	}
	/**
	 * @param altura the altura to set
	 */
	public void setAltura(double altura) {
		this.altura = altura;
	}
	/**
	 * @return the largura
	 */
	public double getLargura() {
		return largura;
	}
	/**
	 * @param largura the largura to set
	 */
	public void setLargura(double largura) {
		this.largura = largura;
	}

	@Override
	public double calcularArea() {
		return (this.getAltura() * this.getLargura()) / 2;
	}

	@Override
	public String toString() {
		return "\nTriangulo \n\t Area: "+calcularArea();
	}

}
