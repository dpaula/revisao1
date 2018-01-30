package lima.paula.strings;

import java.util.Arrays;

public class StringsRevisao {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		char[] chars = {'J', 'A', 'V','A'};
		System.out.println(chars);
		String s = new String(chars);
		System.out.println(s);
		System.out.println();
		
		char[] c = {'a', 'a', 'b', 'b', 'b', 'c', 'c'};
		//int char[inicio], int quantos caracteres
		String s2 = new String(c, 2, 3);
		System.out.println(s2);
		System.out.println("\n\n");
		
		charAt();
		System.out.println("\n\n");

		getChars();
		System.out.println("\n\n");

		getBytes();
		System.out.println("\n\n");

		toCharArray();
		System.out.println("\n\n");
		
		regionMatches();
		System.out.println("\n\n");
		
		indexOf();
		System.out.println("\n\n");

		lastIndexOf();
		System.out.println("\n\n");
		
		conteins();
		System.out.println("\n\n");
		
		substring();
		System.out.println("\n\n");
		
		replace();
		System.out.println("\n\n");
		
		trim();
		System.out.println("\n\n");
		
		join();
		System.out.println("\n\n");
		
		split();
	}

	private static void split() {
		String s = String.join(", ", "A", "B", "C", "D");

		//retorna um array de string quebrando conforme o delimitador, neste caso colocamos ", " (virgula + espaço) para retornar somente as letras sem espaço
		String[] split = s.split(", ");
		
		for(String s2 : split) {
			System.out.println(s2);
		}
		
	}

	private static void join() {
		
		
		String s = String.join(", ", "A", "B", "C", "D");
		
		System.out.println(s); //A, B, C, D
		
		
		
	}

	private static void trim() {
		String s = "    meu nome é    ";
		
		System.out.println(s);
		System.out.println(s.trim());
	}

	private static void replace() {
		
		String s = "i s p a ç o";
		
		s = s.replace("i", "e");
		System.out.println(s);
		System.out.println(s.replaceAll(" ", ""));
		
	}

	private static void substring() {
		
		String s = "0123456789";
		
		//paga um pedaço da string iniciando pelo indice informado
		System.out.println(s.substring(5)); //56789
		
		//paga um pedaço da string iniciando pelo indice informado, ate o indice final
		System.out.println(s.substring(5, 8)); //567
		
		
	}

	private static void conteins() {
		String aabbccdd = "aabbccddaa";
		String a = "aa";
		String b = "bb";
		
		System.out.println(aabbccdd.contains(a));
		System.out.println(aabbccdd.contains("x"));
	}

	private static void lastIndexOf() {
		String aabbccdd = "aabbccddaa";
		String a = "aa";
		String b = "bb";

		//retorna -1 quando não encontra a letra
		System.out.println(aabbccdd.lastIndexOf("z")); //-1

		//mostra o indice da ultima letra da ultima palavra encontrada na string
		System.out.println(aabbccdd.lastIndexOf(a)); // 0
		
	}

	private static void indexOf() {
		
		String aabbccdd = "aabbccdd";
		String a = "aa";
		String b = "bb";
		
		//retorna -1 quando não encontra a letra
		System.out.println(aabbccdd.indexOf("x")); //-1
		
		//mostra o indice da primeira vez encontrada a letra
		System.out.println(aabbccdd.indexOf(a)); // 0
		System.out.println(aabbccdd.indexOf("ccdd"));// 4
		
		
		String fer = "O fernandO é o melhor da noite.";
		System.out.println(fer.regionMatches(true, fer.toUpperCase().indexOf("FERNANDO"), "fernando", 0, "fernando".length()-1));
		
		
		
	}

	private static void regionMatches() {
		
		String aabbccdd = "aabbccdd";
		String a = "aa";
		String b = "bb";
		
		//(indice do inicio da string, a string q qr comparar, indice de inicio da string qr comparar, indice de fim q qr comparar), 
		System.out.println(aabbccdd.regionMatches(0, a, 0, 2));
		
		String fer = "O fernando é o melhor da noite.";
		System.out.println(fer.regionMatches(2, "fernando", 0, "fernando".length()-1));
		
	}

	private static void toCharArray() {
		String java = "Java";

		char[] charArray = java.toCharArray();
		System.out.println(charArray);
	}

	private static void getBytes() {
		String java = "Java";

		byte[] j = new byte[3];
		
		java.getBytes(0, 3, j, 0);
		System.out.println(Arrays.toString(j));
	}

	private static void getChars() {

		String java = "Java";
		
		char[] j = new char[3];
		
		java.getChars(0, 3, j, 0);
		System.out.println(j);
		
	}

	private static void charAt() {
		
		String java = "Java";
		
		for (int i = 0; i < java.length(); i++) {
			System.out.println(java.charAt(i));
		}
		
	}

}
