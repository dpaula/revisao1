package lima.paula.design.patterns.bridge;

public class Programa {

	public static void main(String[] args) {
		
		//cria uma ponte para um sistema externo, uma ponte.. escondendo a implementação do tipo do mapa.. 
		//
		
		Mapa mapa = new GoogleMaps();
		mapa.retornaMapa("Rua regente Feijo");

	}

}
