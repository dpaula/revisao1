package lima.paula.bibliotecasJava.datas;

import java.util.Date;

public class DatasDate {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
			Date hoje = new Date();
			
			System.out.println(hoje);
		
			System.out.println("Milisegundos desde 1 Jan 1970 = "+hoje.getTime());
			
			System.out.println(hoje.getDate());
	}

}
