package day5_18;

import java.util.*;

public class BackWards {

	public static void main(String[] args) {
/* 정수를 입력받아 입력받은 정수를 거꾸로 출력하는 코드를 작성하세요.
 * 예)
 * 정수를 입력하세요 : 12345
 * 결과 : 54321
 * 예)
 * 정수를 입력하세요 : 12340
 * 결과 : 04321
사용방법 
12345 % 10 => 5
1234 % 10 => 4
123 % 10 => 3
12 % 10 => 2
1 % 10 => 1
		 * 
		 */
		
		Scanner scan = new Scanner(System.in);
		System.out.print("정수를 입력하세요 : ");
		int n =scan.nextInt();
		System.out.print("입력한 정수를 거꾸로 출력 : "+back(n));
		
	}
/* 기능 : 입력받은 정수를 거꾸로 출력되도록 하는 코드
 * 매개변수 : 정수 => int n
 * 리턴타입 : void
 * 메소드명 : back */
	public static int back(int n) {
		int a=0;
		while(n > 0 ) {//n의 값이 0보다 작으면 종료
			a = a*10+n%10;
			/* n = 321
			 * 0*10/0+(321%10=)1 a = 1
			 * 1*10/10+(32%10=)2 a =12
			 * 12*10/120+(3%10=)3 a = 123 
			 */
			n = n / 10;//맨뒤의 수를 소수로 만들어서 제거
			}return a;
		}
}


