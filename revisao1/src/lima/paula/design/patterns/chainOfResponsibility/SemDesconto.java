package lima.paula.design.patterns.chainOfResponsibility;

public class SemDesconto implements Desconto {

	@Override
	public void setProximo(Desconto d2) {
		// não tem por ser sem desconto e não continua a fila..

	}

	@Override
	public double desconta(Orcamento orcamento) {
		return 0;
	}

}
