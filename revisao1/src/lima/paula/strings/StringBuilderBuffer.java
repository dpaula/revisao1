package lima.paula.strings;

public class StringBuilderBuffer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		Runtime r = Runtime.getRuntime();
		System.out.println("Memoria antes do programa = "+memoriaAtual(r)+" Mb");

		System.out.println("iniciando programa!!");
		
		String join = String.join(", ", "A", "B", "C", "D", "E", "F");
		
		String s = null;
		
//		s = concatenando(join, s);
		s = concatenando2(join, s);
		
		
		
		
		
		
		System.out.println("Memoria depois do programa = "+memoriaAtual(r)+" Mb");
		
		s = null;
		
		
		r.runFinalization();
		r.gc();
		
		System.out.println("Depois do GC = "+memoriaAtual(r)+" Mb");
		
		
	}

	/**
	 * @param join
	 * @param s
	 * @return
	 */
	private static String concatenando(String join, String s) {
		for (int i = 0; i < 50000; i++) {
			s += join+i; 
			if(i % 100 == 0) {
				System.out.print(".");
			}
			if(i % 10000 == 0) {
				System.out.print("\n");
			}
		}
		return s;
	}

	/**
	 * @param join
	 * @param s
	 * @return
	 */
	private static String concatenando2(String join, String s) {
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < 50000; i++) {
			sb.append(join+i); 
			if(i % 100 == 0) {
				System.out.print(".");
			}
			if(i % 10000 == 0) {
				System.out.print("\n");
			}
		}
		return sb.toString();
	}

	/**
	 * @param r
	 * @return
	 */
	private static long memoriaAtual(Runtime r) {
		return ((r.totalMemory() - r.freeMemory())/(1024*1024));
	}

}
