package lima.paula.design.patterns.chainOfResponsibility;

public class TestaDescontos {

	/*
	 * O padrão Chain of Responsibility cai como uma luva quando temos uma lista de
	 * comandos a serem executados de acordo com algum cenário em específico, e
	 * sabemos também qual o próximo cenário que deve ser validado, caso o anterior
	 * não satisfaça a condição.
	 * 
	 * Nesses casos, o Chain of Responsibility nos possibilita a separação de
	 * responsabilidades em classes pequenas e enxutas, e ainda provê uma maneira
	 * flexível e desacoplada de juntar esses comportamentos novamente.
	 */
	public static void main(String[] args) {

		CalculadorDeDescontos calculadorDeDescontos = new CalculadorDeDescontos();

		Orcamento orcamento = new Orcamento(500);
		orcamento.addItem(new Item("cama", 200));
		orcamento.addItem(new Item("mesa", 200));
		orcamento.addItem(new Item("ropeiro", 200));
		orcamento.addItem(new Item("comoda", 200));
		orcamento.addItem(new Item("comoda", 200));
		orcamento.addItem(new Item("comoda", 200));

		// inicia o cálculo de descontos
		System.out.println(calculadorDeDescontos.calcula(orcamento));
	}

}
