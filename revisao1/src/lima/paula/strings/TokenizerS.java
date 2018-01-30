package lima.paula.strings;

import java.util.StringTokenizer;

public class TokenizerS {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String s = "1;Fernando;34;";
		
		StringTokenizer st = new StringTokenizer(s, ";");
		
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}
		
	}

}
