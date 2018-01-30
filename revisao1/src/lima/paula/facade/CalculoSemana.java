/**
 * 
 */
package lima.paula.facade;

/**
 * @author ferna
 *
 */
public interface CalculoSemana {

	public Segunda obterCalculosSegunda(AtividadeSegunda atividadeSegunda);
	
	public Terca obterCalculosTerca(Ganhos ganhos, double valorBruto, double valorLiquido);
}
