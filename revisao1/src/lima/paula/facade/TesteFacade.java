package lima.paula.facade;

public class TesteFacade {

	public static void main(String[] args) {
		
		
		CalculoSemana s = new CalculoSemanaBean();
		
		AtividadeSegunda atividadeSegunda = null;
		
		Segunda obterCalculosSegunda = s.obterCalculosSegunda(atividadeSegunda);
		
		Ganhos ganhos = null;
		Terca obterCalculosTerca = s.obterCalculosTerca(ganhos, 50, 150);
		
		
	}

}
