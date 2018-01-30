package lima.paula.bibliotecasJava.datas;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

public class DateFormatLocale {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Date hoje = new Date();
		
		System.out.println(Locale.getDefault());
		
		String hojeF = DateFormat.getInstance().format(hoje);
		System.out.println(hojeF);
		
		Locale.setDefault(new Locale("en", "EUA"));
		
		hojeF = DateFormat.getInstance().format(hoje);
		System.out.println(hojeF);
		
	}

}
