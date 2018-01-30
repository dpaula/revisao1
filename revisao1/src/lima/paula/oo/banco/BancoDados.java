/**
 * 
 */
package lima.paula.oo.banco;

/**
 * Acesso ao banco de dados
 * 
 * @author ferna
 *
 */
public interface BancoDados extends SqlDCL, SqlDDL, SqlDML {
	
	void abrirConexao();
	void fecharConexao();

}
