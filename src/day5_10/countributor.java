package day5_10;

import java.util.*;

public class countributor {

	public static void main(String[] args) {
		/* 1~50 ������ ������ ���� ��ǻ�Ͱ� �����ϰ�, ����ڰ� �ش���� ���ߴ� ����
		 * �� ) ��ǻ�Ͱ� �������� ������ ���� 34
		 * �Է� : 50 > down
		 * �Է� : 20 > up
		 * �Է� : 35 > down
		 * �Է� : 30 > up
		 * �Է� : 34 > ����
		 * 
		 * 1. 1~50 ������ ������ ����
		 * 2. ����ڰ� ���� �Է�
		 * 3. ����ڰ� �Է��� ���� ���� �� ũ�� ��
		 * 
		 */
		Scanner scan = new Scanner(System.in);
		int n;
		int r = (int)(Math.random()*50)+1;/*1~50������ ������*/
		System.out.println("1~50������ ���� �� ���߱�");
		while(true) {
			System.out.print("���� �Է��ϼ��� : ");
			n=scan.nextInt();
			if(n>0&&n<=50) {
			
				if(n>r) {
					System.out.println("�Է��� ������ �����ϴ�.");}
				else if(n<r) {
					System.out.println("�Է��� ������ �����ϴ�.");
					}
				else {
					System.out.println("�Է��Ͻ� "+r+"��(��) �����Դϴ�."); break;
					}
			}
		}
		
		
	}
}