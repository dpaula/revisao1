package lima.paula.exercicios.agenda;

public class Contato {

	private int id;
	private String nome;
	private String telefone;
	
	
	
	/**
	 * @param id
	 * @param nome
	 * @param telefone
	 */
	public Contato(String nome, String telefone) {
		super();
		setId();
		this.nome = nome;
		this.telefone = telefone;
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId() {
		this.id++;
	}
	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}
	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}
	/**
	 * @return the telefone
	 */
	public String getTelefone() {
		return telefone;
	}
	/**
	 * @param telefone the telefone to set
	 */
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	@Override
	public String toString() {
		return "Contato \n\t ID: "+this.getId()+"\n\tNome: "+this.getNome()+"\n\tTelefone: "+this.getTelefone();
	}
	
}
