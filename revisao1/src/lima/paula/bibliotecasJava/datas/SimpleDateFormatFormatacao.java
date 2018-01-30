package lima.paula.bibliotecasJava.datas;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class SimpleDateFormatFormatacao {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		//"Z" traz o timezone, -0300 normal e -0200 horário de verão brasil
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss Z");
		SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MMM/yyyy HH:mm:ss z");
		
		Calendar c = new GregorianCalendar(2018, 5, 25, 15, 5, 35);
		
		System.out.println(sdf.format(c.getTime()));
		System.out.println(sdf2.format(c.getTime()));
		System.out.println(sdf.format(new Date()));
		
		SimpleDateFormat sdfP = new SimpleDateFormat("dd/MM/yyyy");
		String datas = "01/10/2018";
		
		try {
			Date dataD = sdfP.parse(datas);
			System.out.println(sdf2.format(dataD));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
	}

}
