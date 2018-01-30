package lima.paula.bibliotecasJava;

public class ExemploPrintf {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		String s = "Olá mundo!";
		
		System.out.printf("%s", s);
		System.out.println();
		System.out.printf("%S", s);
		System.out.println();
		System.out.printf("%20s", s);
		System.out.println();
		System.out.printf("%-20s", s);
		System.out.println();
		//pula linha
		System.out.printf("%n");
		
		char c = 'c';
		System.out.printf("%c", c);
		System.out.println();
		System.out.printf("%C", c);
		System.out.println();
		System.out.println();
		
		int i = 123456789;
		System.out.printf("%d", i);
		System.out.println();
		System.out.printf("%+d", i);
		System.out.println();
		System.out.printf("%,d", i);
		System.out.println();
		System.out.printf("%015d", i);
		System.out.println();
		System.out.println();
		
		double d = 1234.2588776;
		System.out.printf("%f", d);
		System.out.println();
		System.out.printf("%.2f", d);
		System.out.println();
		System.out.printf("R$%10.2f", d);
		System.out.println();
		System.out.println();
		
		testeCompleto();
	}
	
	private static void testeCompleto() {
		double[] precos = {10000, 123.54, 7843.567, 1, 4.56789};
		
		for(int i = 0; i<precos.length; i++) {
			System.out.printf("%s %02d: total de R$%,10.2f%n", "Item", i+1, precos[i]);
		}
	}
	


}
