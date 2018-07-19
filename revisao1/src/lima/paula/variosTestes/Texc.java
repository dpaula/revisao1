package lima.paula.variosTestes;

public class Texc extends Thread {

	public void run() {
	}

	public static void main(String[] args) {
		Texc te = new Texc();
		te.start();
		te.start();
	}
}
