package lima.paula.design.patterns.chainOfResponsibility;

public interface Desconto {

	void setProximo(Desconto d2);

	double desconta(Orcamento orcamento);

}
