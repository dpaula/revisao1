package lima.paula;

public class TiposPrimitivos {

	public static void main(String[] args) {

		// TIPOS PRIMITIVOS

		// ocupa 1 byte - 16 bits
		// por padrão sempre será false
		boolean b = true;
//		System.out.println(b);

		// ocupa 2 bytes(8 bits a cada byte) de memória
		// default = vazio
		char c = 'a';
		// System.out.println(c);
		
		
		//ocupa 1 byte na memória - 8 bits
		//default = 0
		byte by = 100; //-128 e +127
//		System.out.println(by);
		
		//ocupa 2 bytes
		//default = 0
		short camisa = 32000; // -32768 e +32767
//		System.out.println(camisa);
		
		//ocupa 4 bytes
		//default = 0
		int i = 2140000000; // -2,147,483,648 e +2,147,483,647
//		System.out.println(i);
		
		
		//ocupa 8 bytes
		//default = 0
		long l = 9223000000000000000l;
//		System.out.println(l);
		
		//ocupa 4 bytes
		//default = 0.0
		float f = (float) 2140000000.0000000000000000;
		
		
		//ocupa 8 bytes
		//default = 0.0
		double d = 9223000000000000000.0;
	}
}
