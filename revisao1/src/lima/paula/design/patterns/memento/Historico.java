package lima.paula.design.patterns.memento;

import java.util.ArrayList;
import java.util.List;

public class Historico {

	
	private List<Estado> estadoSalvos = new ArrayList<Estado>();
	
	
	public void addEstado(Estado estado) {
		estadoSalvos.add(estado);
	}
	
	public Estado getEstado(int index) {
		return estadoSalvos.get(index);
	}
}
