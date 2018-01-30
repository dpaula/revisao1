package lima.paula.design.patterns.flyweitht;

import java.util.List;

import org.jfugue.Player;

public class Piano {

	public void toca(List<Nota> musica) {
		
		Player player = new Player();
		
		String s = "C D E F F F";
		
		StringBuilder notasPiano = new StringBuilder();
		
		for (Nota nota : musica) {
			notasPiano.append(nota.simbolo());
			notasPiano.append(" ");
		}
		
		
		player.play(notasPiano.toString());
		
	}
}
