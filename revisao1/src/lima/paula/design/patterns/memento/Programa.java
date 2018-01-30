package lima.paula.design.patterns.memento;

import java.util.Calendar;

public class Programa {

	
	
	public static void main(String[] args) {
		
		Contrato c1 = new Contrato(Calendar.getInstance(), "Fernando", TipoContrato.NOVO);
		Historico historico = new Historico();
		
		System.out.println(c1.getTipo()); // estado 0
		historico.addEstado(c1.salvaEstado());//salvando o estado zero
		
		System.out.println(c1.avanca()); //avança estado em andamento

		System.out.println(c1.getTipo()); //mostra q estaá em andamento
		historico.addEstado(c1.salvaEstado()); // salvando estado 1 em andamento
		
		System.out.println(c1.avanca()); //avança para estado acertado
		System.out.println(c1.getTipo());

		
		System.out.println("estado anterior "+historico.getEstado(1).getEstado().getTipo());
		
	}
}
