package lima.paula.bibliotecasJava.datas;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class GregorianCalendarDatas {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		GregorianCalendar hoje = new GregorianCalendar();
		
		imprimirDatas(hoje);
		
		//ano bisexto, so tem na classe FILHA GregorianCalendar
		System.out.println(hoje.isLeapYear(2018));
		
		GregorianCalendar dia2 = new GregorianCalendar(2018, 5, 25);
		imprimirDatas(dia2);
		
		GregorianCalendar dia3 = new GregorianCalendar(2018, 5, 25, 16, 25, 15);
		imprimirDatas(dia3);
		
	}

	private static void imprimirDatas(Calendar hoje) {
		int ano = hoje.get(Calendar.YEAR);
		int mes = hoje.get(Calendar.MONTH);
		int dia = hoje.get(Calendar.DAY_OF_MONTH);
		int hora = hoje.get(Calendar.HOUR_OF_DAY);
		int minutos = hoje.get(Calendar.MINUTE);
		int segundos = hoje.get(Calendar.SECOND);
		
		System.out.printf("%02d/%02d/%d - %02d:%02d:%02d", dia, (mes+1), ano, hora, minutos, segundos);
		System.out.println();
		
	}

}
