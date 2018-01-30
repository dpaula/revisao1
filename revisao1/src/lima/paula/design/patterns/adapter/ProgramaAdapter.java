package lima.paula.design.patterns.adapter;

import java.util.Calendar;

public class ProgramaAdapter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		//adapter, adapta sistemas.. adapta uma interface feia/antiga ao novo
		Relogio r = new RelogioSistema();
		
		Calendar hoje = r.hoje();
	}

}
