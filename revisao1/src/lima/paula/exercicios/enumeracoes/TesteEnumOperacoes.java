package lima.paula.exercicios.enumeracoes;

public class TesteEnumOperacoes {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		for(EnTipoOperacao o : EnTipoOperacao.values()) {
			System.out.println(o);
			System.out.println(o.geraOperacao(10, 10));
		}
	}

}
