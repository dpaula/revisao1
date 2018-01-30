package lima.paula.design.patterns.command;

import java.util.ArrayList;
import java.util.List;

public class FilaDeTrabalho {

	private List<Comando> comando;
	
	public FilaDeTrabalho() {
		comando = new ArrayList<Comando>();
	}

	public void addComando(Comando c) {
		comando.add(c);
	}
	
	public void processa() {
		for (Comando c : comando) {
			c.executa();
		}
	}
	
	
}
