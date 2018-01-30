/**
 * 
 */
package lima.paula.oo.banco;

/**
 * Responsável por dar acesso ao banco
 * 
 * @author ferna
 *
 */
public interface SqlDCL {
	
	void grant(String s);
	void revoke(String s);

}
