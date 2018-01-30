package lima.paula.exercicios.agenda;

import java.util.ArrayList;
import java.util.List;

public class Agenda {

	private List<Contato> contatos = new ArrayList<Contato>();

	/**
	 * @return the contatos
	 */
	public List<Contato> getContatos() {
		return contatos;
	}

	/**
	 * @param contatos
	 *            the contatos to set
	 */
	public void setContatos(List<Contato> contatos) {
		this.contatos = contatos;
	}

	public void addContato(String nome, String telefone) {
		contatos.add(new Contato(nome, telefone));
		System.out.println("Contato incluido com sucesso!");
	}

	public void deletaContato(String nome) {
		Contato contato = getContato(nome);
		if (contato instanceof Contato) {
			contatos.remove(contato);
			System.out.println("Contato: "+nome+" excluído com sucesso!!");
		}
	}

	public void alterarNomeContato(String nome, String novoNome) {
		Contato contato = getContato(nome);
		if (contato instanceof Contato) {
			contato.setNome(novoNome);
			System.out.println("Contato: "+nome+" alterado com sucesso!!");
		}
	}

	public void listaContatos() {
		for (Contato c : contatos) {
			System.out.println(c.toString());
		}
	}

	/**
	 * @param nome
	 */
	public Contato getContato(String nome) {

		Contato con = null;
		try {
			if (contatos.isEmpty()) {
				throw new ContatoNaoExisteException(nome);
			}

			for (Contato c : contatos) {
				if (c.getNome().equalsIgnoreCase(nome)) {
					con = c;
				}
			}
			if (con == null) {
				throw new ContatoNaoExisteException(nome);
			}

		} catch (ContatoNaoExisteException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return con;
	}

	public void consultaContato(String nome) {
		
		Contato contato = getContato(nome);
		if(contato instanceof Contato) {
			contato.toString();
		}
		
	}

}
