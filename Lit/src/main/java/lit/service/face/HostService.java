package lit.service.face;

public interface HostService {

	
	//-----------단계별 정보등록
	//1단계숙소정보등록
	public void insertFirst();

	//2단계숙소정보등록
	public void insertSecond();

	//3단계숙소정보등록
	public void insertThird();

	
	//---------단계별 정보수정
	
	//1단계 정보수정
	public void hostElementFirstFix();

	
	//2단계 정보수정
	public void hostElementSecondFix();

	//3단계 정보수정
	public void hostElementThirdFix();

}
