/**
 * 
 */
package lima.paula.oo.banco;

/**
 * Respons�vel por dar acesso ao banco
 * 
 * @author ferna
 *
 */
public interface SqlDCL {
	
	void grant(String s);
	void revoke(String s);

}
