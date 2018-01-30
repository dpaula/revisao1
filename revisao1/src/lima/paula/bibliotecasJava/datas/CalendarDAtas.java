package lima.paula.bibliotecasJava.datas;

import java.util.Calendar;

public class CalendarDAtas {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Calendar hoje = Calendar.getInstance(); //singleton
		
		int ano = hoje.get(Calendar.YEAR);
		int mes = hoje.get(Calendar.MONTH);
		int dia = hoje.get(Calendar.DAY_OF_MONTH);
		int hora = hoje.get(Calendar.HOUR_OF_DAY);
		int minutos = hoje.get(Calendar.MINUTE);
		int segundos = hoje.get(Calendar.SECOND);
		int diaSemana = hoje.get(Calendar.DAY_OF_WEEK);
		
		System.out.printf("%02d/%02d/%d - %02d:%02d:%02d", dia, (mes+1), ano, hora, minutos, segundos);
		System.out.println();
		
		System.out.printf("%02d/%02d/%d - %02d", dia, (mes+1), ano, diaSemana);
		
		
		
		///alterando a data
		
//		hoje.add(Calendar.DAY_OF_MONTH, 1);
//		System.out.println(hoje);
//		
	}

}
