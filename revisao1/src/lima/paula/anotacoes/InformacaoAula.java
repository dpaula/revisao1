package lima.paula.anotacoes;

public @interface InformacaoAula {

	String autor();
	
	int aulaNumero();
	
	String site() default "http://fernando.dpaula.com";
	
}
