package lima.paula;

public class BlocoInstrucao {
	
	public static void main(String[] args) {
		
		int a,b;
		
		a = b = 3;
		
		blocoIf:
			if(a==b) {
				for (int i = 0; i < 6; i++) {
					if(i==a) {
						break blocoIf;
					}
					System.out.println("passo.. "+i);
				}
				System.out.println("não passou por aqui..");
			}
		
	}

}
