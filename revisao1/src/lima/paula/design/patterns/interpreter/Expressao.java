package lima.paula.design.patterns.interpreter;

import lima.paula.design.patterns.visitor.Impressora;

public interface Expressao {
	
	int avalia();
	void aceita(Impressora impressora);

}
