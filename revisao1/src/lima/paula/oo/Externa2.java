package lima.paula.oo;

public class Externa2 {

	
	private String texto = "texto Externa";
	
	public void metodoQualquer() {
		
		class ClasseLocal{
			
			private String texto = "texto interno metodo";
			
			public void imprimeTexto() {
				System.out.println(texto);
				
				System.out.println(Externa2.this.texto);
			}
		}
		
		ClasseLocal classeLocal = new ClasseLocal();
		classeLocal.imprimeTexto();
		
		
	}
	
	public static void main(String[] args) {
		
		Externa2 externa2 = new Externa2();
		externa2.metodoQualquer();
	}
}
