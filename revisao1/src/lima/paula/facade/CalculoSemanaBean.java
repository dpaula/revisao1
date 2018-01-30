package lima.paula.facade;

public class CalculoSemanaBean implements CalculoSemana{

	public Segunda obterCalculosSegunda(AtividadeSegunda atividadeSegunda) {
		SegundaDAO s = new SegundaDAO();
		return s.obterCalculosSegunda(atividadeSegunda);
	}

	public Terca obterCalculosTerca(Ganhos ganhos, double valorBruto, double valorLiquido) {
		TercaDAO t = new TercaDAO();
		return t.obterCalculosTerca(ganhos, valorBruto, valorLiquido);
	}

}
