package lima.paula.design.patterns.chainOfResponsibility;

public class DescontoPorMaisDeCincoItens implements Desconto {

	private Desconto proximoDesconto;

	// cadastra o próximo desconto que será chamado caso o desconto atual não for o
	// ideal
	@Override
	public void setProximo(Desconto desconto) {
		this.proximoDesconto = desconto;

	}

	@Override
	public double desconta(Orcamento orcamento) {

		// se o desconto couber nesta regra, então retorna o desconto, senão vai para o
		// proximo desconto
		if (orcamento.getItens().size() > 5) {
			return orcamento.getValor() * .1;
		}

		// vai para o proximo desconto da fila
		return proximoDesconto.desconta(orcamento);

	}

}
