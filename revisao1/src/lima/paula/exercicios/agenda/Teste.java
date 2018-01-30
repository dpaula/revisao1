package lima.paula.exercicios.agenda;

import java.util.Scanner;

public class Teste {

	@SuppressWarnings("resource")
	public static void main(String[] args) {

		Agenda agenda = new Agenda();
		String nome = "";
		String telefone = "";

		programa: while (true) {
			Scanner in = new Scanner(System.in);
			System.out.println();
			System.out.println();
			System.out.println();
			System.out.println("Informe (1) para consultar agenda;");
			System.out.println("Informe (2) para adicionar um contato ;");
			System.out.println("Informe (3) para deletar um contato ;");
			System.out.println("Informe (4) para alterar um contato ;");
			System.out.println("Informe (5) para listar todos os contatos;");
			System.out.println("Informe (6) para sair ;");
			int op = in.nextInt();
			
			
			
			
			switch (op) {
			case 1:
				System.out.print("Informe nome do contato: ");
				nome = in.next();
				agenda.consultaContato(nome);
				break;
			case 2:
				System.out.print("Nome: ");
				nome = in.next();
				System.out.print("Telefone: ");
				telefone = in.next();
				agenda.addContato(nome, telefone);
				break;
			case 3:
				System.out.print("Informe nome do contato que deseja excluir: ");
				nome = in.next();
				agenda.deletaContato(nome);
				break;
			case 4:
				System.out.print("Informe nome do contato que deseja alterar: ");
				nome = in.next();
				System.out.print("Informe novo nome do contato que deseja alterar: ");
				String novoNome = in.next();
				agenda.alterarNomeContato(nome, novoNome);
				break;
			case 5:
				agenda.listaContatos();
				break;
			case 6:
				break programa;
			}
		}
	}
}
