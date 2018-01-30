package lima.paula.oo;

public class Externa {
	
	private String texto = "Classe texto externa";
	
	public class Interna{
		
		private String texto = "Classe texto interna";
		
		public void imprimeTexto() {
			System.out.println(texto);
			
			//consegue ver mebros da classe externa
			System.out.println(Externa.this.texto);
		}
	}
	
	public static class Interna2{
		private String texto = "Classe texto interna2";
		
		public void imprimeTexto() {
			System.out.println(texto);
			
			//não consegue ver mebros da classe externa
//			System.out.println(Externa.this.texto);
			System.out.println(new Externa().texto);
		}
		
	}
	
	public static void main(String[] args) {
		Externa externa = new Externa();
		Interna interna = externa.new Interna();
		
		interna.imprimeTexto();
		
		Interna2 interna2 = new Interna2();
		interna2.imprimeTexto();
		
	}
	

}
