package lima.paula;

public class Arrays2 {

	public static void main(String[] args) {

		float[] f = { 1, 3, 4, 5, 5, 89, 22, 12 };

		for (float f2 : f) {
			System.out.println(f2);
		}

		double[][] plan = { { 434, 45, 912, 42, 54, 0 }, { 23.8, 973.3, 254.8, 744.2, 3.74, 0 },
				{ 23.8, 973.3, 254.1, 744.2, 3.74, 0 }, { 53.52, 67, 873, 245.9, 54.12, 0 },
				{ 234.25, 54.2, 82.0, 745.2, 82, 0 },

		};

		// for(double[] d : plan) {
		// for(double d2 : d) {
		// plan[0][5] +=d2;
		// }
		// plan[5][5] +=
		// }

		System.out.println(plan.length);

		double total = 0;

		for (int linha = 0; linha < plan.length; linha++) {
			for (int coluna = 0; coluna < plan.length; coluna++) {
				plan[linha][5] += plan[linha][coluna];
			}
			total += plan[linha][5];
		}

		int i = 0;
		for (double[] soma : plan) {
			System.out.println("Soma linha "+(++i)+": " + soma[5]);
		}
		System.out.println("Total: " + total);
	}

}
