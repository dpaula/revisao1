package lima.paula.oo.exercicio1;

public class Circulo extends Figura2D{

	private double diametro;
	
	public Circulo(double diametro) {
		setDiametro(diametro);
	}
	
	
	/**
	 * @return the raio
	 */
	public double getDiametro() {
		return diametro;
	}



	/**
	 * @param raio the raio to set
	 */
	public void setDiametro(double raio) {
		this.diametro = raio;
	}



	@Override
	public double calcularArea() {
		return (Math.PI * this.getRaio() * 2);
	}


	private double getRaio() {
		return getDiametro() / 2;
	}

	@Override
	public String toString() {
		return "\nCirculo \n\t Area: "+calcularArea();
	}
}
