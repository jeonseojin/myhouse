package day5_18;

import java.util.*;

public class BackWards {

	public static void main(String[] args) {
/* ������ �Է¹޾� �Է¹��� ������ �Ųٷ� ����ϴ� �ڵ带 �ۼ��ϼ���.
 * ��)
 * ������ �Է��ϼ��� : 12345
 * ��� : 54321
 * ��)
 * ������ �Է��ϼ��� : 12340
 * ��� : 04321
����� 
12345 % 10 => 5
1234 % 10 => 4
123 % 10 => 3
12 % 10 => 2
1 % 10 => 1
		 * 
		 */
		
		Scanner scan = new Scanner(System.in);
		System.out.print("������ �Է��ϼ��� : ");
		int n =scan.nextInt();
		System.out.print("�Է��� ������ �Ųٷ� ��� : "+back(n));
		
	}
/* ��� : �Է¹��� ������ �Ųٷ� ��µǵ��� �ϴ� �ڵ�
 * �Ű����� : ���� => int n
 * ����Ÿ�� : void
 * �޼ҵ�� : back */
	public static int back(int n) {
		int a=0;
		while(n > 0 ) {//n�� ���� 0���� ������ ����
			a = a*10+n%10;
			/* n = 321
			 * 0*10/0+(321%10=)1 a = 1
			 * 1*10/10+(32%10=)2 a =12
			 * 12*10/120+(3%10=)3 a = 123 
			 */
			n = n / 10;//�ǵ��� ���� �Ҽ��� ���� ����
			}return a;
		}
}


