package lima.paula.garbageCol;

import lima.paula.exercicios.agenda.Contato;

public class ColetorLixo {

	
	public static void obterMemoriaUsada() {
		
		
		//1 mb = 1048576 Bytes
		//1 kb = 1024 bytes
		final int MB = 1024 * 1024;
		
		Runtime runtime = Runtime.getRuntime();
		long memoriaUsada = (runtime.totalMemory() - runtime.freeMemory())/MB;
		
		System.out.println(memoriaUsada+" MB");
	}
	
	public static void main(String[] args) {
		
		
		System.out.println("Antes do programa");
		obterMemoriaUsada();
		
		Contato[] contatos = new Contato[5000000];
		
		Contato c = null;
		
		for(int i = 0; i<contatos.length; i++) {
			c = new Contato("Contato"+i, "4666-"+i);
			contatos[i] = c;
		}
		
		System.out.println("Contatos criados");
		obterMemoriaUsada();
		
		contatos = null;
		
		//pede para marcar os objetos a serem removidos
		Runtime.getRuntime().runFinalization();
		//força uma chamada ao garbage collector 
		Runtime.getRuntime().gc();

		System.out.println("Contatos removidos da memoria");
		obterMemoriaUsada();

	}

}
