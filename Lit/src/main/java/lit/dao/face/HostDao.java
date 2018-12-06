package lit.dao.face;

public interface HostDao {
	
	//-------------단계별 정보등록

	//1단계 숙소등록
	public void insertOne();

	//2단계 숙소등록
	public void insertTwo();
	
	//3단계 숙소등록
	public void insertThree();
	
	
	//---------------단계별 정보수정

	//1단계 정보수정
	public void updateElementOne();
	
	//2단계 정보수정
	public void updateElementTwo();

	//3단계 정보수정
	public void updateElementThree();

}
