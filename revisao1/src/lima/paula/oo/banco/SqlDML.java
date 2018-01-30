package lima.paula.oo.banco;

/**
 * Operações de querys nas tabelas..
 * Insert;
 * Update;
 * Delete;
 * Select;
 * 
 * @author ferna
 *
 */
public interface SqlDML {
	
	void insert(String s);
	void update(String s);
	void delete(String s);
	String select(String s);
}
