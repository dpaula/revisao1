package lima.paula.oo;

public class Anonima {

	public void imprimeTextoAnonima() {
		System.out.println("TExto da classe..");
	}
	
	public static void main(String[] args) {

		Anonima anonima = new Anonima() {
			public void imprimeTextoAnonima() {
				System.out.println("Imprime texto sobreescrito..");
			}
		};
		
		anonima.imprimeTextoAnonima();
		
//		Anonima a = () -> System.out.println("çlajkfd");
		
		
//		ITexto iTexto = new ITexto() {
//			
//			@Override
//			public void imprimeTexto() {
//				System.out.println("IMprime texto da interface............");
//				
//			}
//		};
//		
//		iTexto.imprimeTexto();
		
		
		ITexto it = () -> System.out.println("çlajkfd"); 
		it.imprimeTexto();
		
	}

}
