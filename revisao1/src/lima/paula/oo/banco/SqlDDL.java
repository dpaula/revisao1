/**
 * 
 */
package lima.paula.oo.banco;

/**
 * Operações de criação, exclusão e alteração de tabelas do banco
 * 
 * @author ferna
 *
 */
public interface SqlDDL {
	
	void create(String s);
	void drop(String s);
	void alter(String s);

}
