package lima.paula.design.patterns.flyweitht;

import java.util.Arrays;
import java.util.List;

public class Programa {

	public static void main(String[] args) {

		NotasMusicais nM = new NotasMusicais();

		// List<Nota> musica = Arrays.asList(new Do(), new Re(), new Mi(), new Fa(), new
		// Fa(), new Fa());
		List<Nota> musica = Arrays.asList(nM.pega("do"), nM.pega("re"), nM.pega("mi"), nM.pega("fa"), nM.pega("fa"),
				nM.pega("fa"));
		
		
		new Piano().toca(musica);
	}
}