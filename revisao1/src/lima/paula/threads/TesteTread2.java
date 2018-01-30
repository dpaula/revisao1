package lima.paula.threads;

import java.util.concurrent.SynchronousQueue;

public class TesteTread2 {

	public static void main(String[] args) {
		// 
		
		MinhaThread2 t1 = new MinhaThread2("Thread ##1");
		MinhaThread2 t2 = new MinhaThread2("Thread ##2");

		t1.suspend();
		
		try {
			Thread.sleep(600);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		t2.suspend();
		
		t1.resume();
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
//		
		t2.resume();
		t2.stop();
		
	}

}
