package day5_10;

import java.util.*;

public class countributor {

	public static void main(String[] args) {
		/* 1~50 사이의 랜덤한 수를 컴퓨터가 생성하고, 사용자가 해당수를 맞추는 게임
		 * 예 ) 컴퓨터가 랜덤으로 생성된 수가 34
		 * 입력 : 50 > down
		 * 입력 : 20 > up
		 * 입력 : 35 > down
		 * 입력 : 30 > up
		 * 입력 : 34 > 정답
		 * 
		 * 1. 1~50 사이의 랜덤수 생성
		 * 2. 사용자가 수를 입력
		 * 3. 사용자가 입력한 수와 랜덤 수 크기 비교
		 * 
		 */
		Scanner scan = new Scanner(System.in);
		int n;
		int r = (int)(Math.random()*50)+1;/*1~50사이의 랜덤수*/
		System.out.println("1~50사이의 랜덤 수 맞추기");
		while(true) {
			System.out.print("수를 입력하세요 : ");
			n=scan.nextInt();
			if(n>0&&n<=50) {
			
				if(n>r) {
					System.out.println("입력한 수보다 낮습니다.");}
				else if(n<r) {
					System.out.println("입력한 수보다 높습니다.");
					}
				else {
					System.out.println("입력하신 "+r+"은(는) 정답입니다."); break;
					}
			}
		}
		
		
	}
}