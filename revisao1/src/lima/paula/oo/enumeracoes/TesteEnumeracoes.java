package lima.paula.oo.enumeracoes;

public class TesteEnumeracoes {

	
	public static void main(String[] args) {
		
		EnDiaSemana[] dias = EnDiaSemana.values();
		
		for(EnDiaSemana d : dias) {
			System.out.println(d);
		}
		
		EnDiaSemana dia = EnDiaSemana.valueOf("SEGUNDA");
		System.out.println(dia);
	}
}
