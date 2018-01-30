package lima.paula.oo;

public class Janela {

	
	private int largura;
	private int altura;
	
	public Janela(int largura, int altura) {
		this.largura = largura;
		this.altura = altura;
	}
	
	@Override
	public String toString() {
		return String.format("Altura da janela é %4s e a largura é %4s", this.altura, this.largura);
	}
	
	public static void main(String[] args) {
		
//		Janela janela = new Janela(10, 15);
//		System.out.println(janela.toString());
		
		System.out.println(new Janela(25, 50).toString());
		
	}
}
