package lima.paula.oo;

/*
 * Sobrecarga
 */
public class Overloading {

	
	public void soma(int num1, int num2) {
		System.out.println("soma1 "+(num1+num2));
	}
	public void soma(int num1, int num2, int num3) {
		System.out.println("soma2 "+(num1+num2+num3));
	}
	public void soma(double num1, double num2) {
		System.out.println("soma3 "+(num1+num2));
	}
	
	public static void main(String[] args) {
		Overloading o = new Overloading();
		o.soma(1, 1);
		new Overloading().soma(1.0, 1.0);
		o.soma(1, 1, 1);
	}
}
