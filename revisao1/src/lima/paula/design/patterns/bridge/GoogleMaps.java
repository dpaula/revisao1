package lima.paula.design.patterns.bridge;

import java.net.MalformedURLException;
import java.net.URL;

public class GoogleMaps implements Mapa{

	@Override
	public String retornaMapa(String rua) {
		
		String googleMaps = "http://maps.google.com/maps?g=rua+Regente+Feijo";
		try {
			URL url = new URL(googleMaps);
			
			return "mapa";
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	
	
}
