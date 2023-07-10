package singleton1;
//싱글톤 패턴 (시험예제 (주석도 되나 위에걸로)
public class Single {
	private int i;
	private static Single INSTANCE = new Single();
	private Single() {}
	public static Single getInstance () {
		return INSTANCE;
	}
//	private static Single INSTANCE; //null 안넣어도 된다
//	public Single() {}
//	public static Single getInstance() { // Single형 객체를 생성한 적없으면 객체 생성
//		if(INSTANCE==null) {
//			INSTANCE = new Single();
//		}
//		return INSTANCE;
//	}
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
	
}
