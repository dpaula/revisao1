package lima.paula.oo.exercicio1;

public class Cilindro extends Figura3D{

	private double altura;
	private double diametro;
	
	public Cilindro(double altura, double diametro) {
		setAltura(altura);
		setDiametro(diametro);
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
	public double calcularVolume() {
		return (Math.PI * (this.getRaio() * this.getRaio()) * this.getAltura());
	}

	private double getRaio() {
		return this.getDiametro() / 2;
	}

	@Override
	public double calcularArea() {
		return (2 * Math.PI * getRaio() * (getRaio() + this.getAltura()));
	}
	
	@Override
	public String toString() {
		return "Cilindro \n\t Volume: "+calcularVolume()+"\n\t Area: "+calcularArea();
	}

}
