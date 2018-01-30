package lima.paula.bibliotecasJava;

import java.text.NumberFormat;
import java.util.Locale;

public class NumberFormatterPreco {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		Locale brasil = new Locale("pt", "br");
		
		NumberFormat formatter = NumberFormat.getCurrencyInstance(brasil);
		String formatado = formatter.format(1000.0);
		System.out.println(formatado);
	}

}
