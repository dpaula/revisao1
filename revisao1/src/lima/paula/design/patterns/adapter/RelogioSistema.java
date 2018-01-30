package lima.paula.design.patterns.adapter;

import java.util.Calendar;

public class RelogioSistema implements Relogio{
	
	public Calendar hoje() {
		return Calendar.getInstance();
	}

}
