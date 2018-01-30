package lima.paula.lambda;

public class Lambda2 {
	
	interface Matematica{
		double getOperacao();
	}
	
	interface Matematica2{
		boolean is(int i);
	}
	
	interface Matematica3{
		int retorna(int x, int y);
	}

	
	
	public static void main(String[] args) {
		
		Matematica m = () -> 5555.5;
		
		System.out.println(m.getOperacao());
		System.out.println();
		
		Matematica2 isPar = (i) -> (i%2==0);
		Matematica2 m10 = (int i) -> (i>10);
		Matematica2 semparenteses = i -> (i>10);
		
		System.out.println(isPar.is(55));
		System.out.println(isPar.is(56));
		
		System.out.println(m10.is(11));
		
		Matematica3 com2parametros = (x,y) -> {
			return x+y;
		};
		
	}

}
