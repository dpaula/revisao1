package lima.paula.oo.exercicio1;

public class Cubo extends Figura3D{

	private double altura;
	private double largura;
	private double profundidade;
	
	public Cubo(double altura, double largura, double profundidade) {
		setAltura(altura);
		setLargura(largura);
		setProfundidade(profundidade);
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
	/**
	 * @return the profundidade
	 */
	public double getProfundidade() {
		return profundidade;
	}
	/**
	 * @param profundidade the profundidade to set
	 */
	public void setProfundidade(double profundidade) {
		this.profundidade = profundidade;
	}
	
	@Override
	public double calcularVolume() {
		return (this.getAltura() * this.getLargura() * this.getProfundidade());
	}

	@Override
	public double calcularArea() {
		return this.getAltura() * this.getLargura();
	}

	@Override
	public String toString() {
		return "\nCubo \n\t Volume: "+calcularVolume()+" \n\t Area: "+calcularArea();
	}
}
