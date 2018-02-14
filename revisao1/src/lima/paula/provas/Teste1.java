package lima.paula.provas;

import java.util.HashMap;

public class Teste1 {

	public static void main(String[] args) {
		
		
		Object d = new Double(10);
		
		d = "10";
		
//		if(d.equals(10)) {
//			System.out.println(d);
//		}else {
//			System.out.println("não é 10");
//		}

		
		HashMap<Integer, String> h = new HashMap<Integer, String>();
		
		h.put(1, "Blumenau");
		h.put(2, "Pomerode");
		h.put(3, "Gaspar");
		
		System.out.println(h.get(0));
		
	}

}
