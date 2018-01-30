/**
 * 
 */
package lima.paula.oo.enumeracoes;

/**
 * @author ferna
 *
 */
public enum EnDiaSemana {

	SEGUNDA(1), TERCA(2), QUARTA(3), QUINTA(4), SEXTA(5), SABADO(6), DOMINGO(7);
	
	int valor;
	
	EnDiaSemana(int valor){
		this.valor = valor;
	}
	
	public int getValor() {
		return valor;
	}
}
