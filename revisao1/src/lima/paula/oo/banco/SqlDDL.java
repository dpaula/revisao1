/**
 * 
 */
package lima.paula.oo.banco;

/**
 * Opera��es de cria��o, exclus�o e altera��o de tabelas do banco
 * 
 * @author ferna
 *
 */
public interface SqlDDL {
	
	void create(String s);
	void drop(String s);
	void alter(String s);

}
