package lima.paula.exercicios.enumeracoes;

public enum EnTipoOperacao {

	SOMA("+") {
		@Override
		public double geraOperacao(double x, double y) {
			return RealizaOperacaoMatematica.soma(x, y);
		}
	},
	SUBRACAO("-") {
		@Override
		public double geraOperacao(double x, double y) {
			return RealizaOperacaoMatematica.subtracao(x, y);
		}
	},
	MULTIPLICACAO("*") {
		@Override
		public double geraOperacao(double x, double y) {
			return RealizaOperacaoMatematica.multiplicacao(x, y);
		}
	},
	DIVISAO("/") {
		@Override
		public double geraOperacao(double x, double y) {
			return RealizaOperacaoMatematica.divisao(x, y);
		}
	};

	String operacao;
	
	private EnTipoOperacao(String operacao) {
		this.operacao = operacao;
	}
	
	public abstract double geraOperacao(double x, double y);

	@Override
	public String toString() {
		return "Tipo da operação: "+this.operacao;
	}
	
}
