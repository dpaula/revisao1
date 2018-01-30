/**
 * 
 */
package lima.paula.exercicios.agenda;

/**
 * System.out.println("Informe (1) para consultar agenda;");
			System.out.println("Informe (2) para adicionar um contato ;");
			System.out.println("Informe (3) para deletar um contato ;");
			System.out.println("Informe (4) para alterar um contato ;");
			System.out.println("Informe (5) para listar todos os contatos;");
			System.out.println("Informe (6) para sair ;");
 * 
 * @author ferna
 *
 */
public enum EnOpcoesAgenda {

	CONSULTAR(1), ADICIONAR(2), DELETAR(3), ALTERAR(4), LISTAR_TODOS(5), SAIR(6);
	
	private int valor;
	
	private EnOpcoesAgenda(int valor) {
		this.valor = valor;
	}
	
	public int getValor() {
		return valor;
	}
	
}
