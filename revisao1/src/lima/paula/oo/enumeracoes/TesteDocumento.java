package lima.paula.oo.enumeracoes;

public class TesteDocumento {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		for(EnTipoDocumento d : EnTipoDocumento.values()) {
//			System.out.println(d +" - "+ d.geraNumeroTeste());
//		}
		
		
		PessoaD p = new PessoaD();
		p.setTipoDocumento(Enum.valueOf(EnTipoDocumento.class, "CPF"));
		p.setNumeroDocumento(p.getTipoDocumento().geraNumeroTeste());
		
		System.out.println(p.toString());
		System.out.println();
		
		PessoaD pf = new PessoaD();
		pf.setTipoDocumento(EnTipoDocumento.valueOf("CNPJ"));
		pf.setNumeroDocumento(pf.getTipoDocumento().geraNumeroTeste());
		
		System.out.println(pf.toString());
		
	}

}
