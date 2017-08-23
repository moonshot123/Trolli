package member.model;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging6;
import utility.Paging7;

@Component("MyMemberDao")
public class MemberDao {
	
	private final String namespace = "member.model.Member"; //bean
	private final String namespace1 = "member.model.MemberCommonAndHost";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public MemberDao(){}


	public int Insertmember(Member member) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".Insertmember", member);
		return cnt;
	}

	public Member getId(String memberid) {
		Member bean = new Member();
		bean = sqlSessionTemplate.selectOne(namespace + ".getId",memberid);
		return bean;
	}

	public Member findID(Member member) {
		Member bean = new Member();
		bean = sqlSessionTemplate.selectOne(namespace + ".findID", member);
		return bean;
	}

	public Member findPW(Member member) {
		Member bean = new Member();
		bean = sqlSessionTemplate.selectOne(namespace + ".findPW", member);
		return bean;
	}



	public void changehost(int membernum) {
		sqlSessionTemplate.update(namespace+".changehost", membernum);

	}

	public Member getbynum(int membernum) {
		Member bean = new Member();
		bean = sqlSessionTemplate.selectOne(namespace + ".getnum",membernum);
		return bean;
	}


	public Member GetAlldata(int membernum) {
		Member memberlist = sqlSessionTemplate.selectOne(namespace+".Getmemberdata",membernum);
		return memberlist;
	}


	public Member updatemember(Member member) {
		sqlSessionTemplate.update(namespace+".updatemember", member);
		Member memberupdate=sqlSessionTemplate.selectOne(namespace+".selectmember", member);
		return memberupdate;
	}




	public Member getloginchek(int membernum) {
		Member member = sqlSessionTemplate.selectOne(namespace+".selectmember", membernum);
		return member;
	}


	public int GetmemberTotalCount(Map<String, String> map) {

		int cnt  = sqlSessionTemplate.selectOne(namespace+".GetmemberTotalCount", map);
		return cnt;
	}


	public List<Member> getAllMemberList(Paging6 pageInfo, Map<String, String> map) {
		List<Member> list= new ArrayList<Member>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		list=sqlSessionTemplate.selectList(namespace+".getAllMemberList", map, rowBounds);
		return list;
	}

	public List<Member> getAllMemberList2(Map<String, String> map) {
		List<Member> list= new ArrayList<Member>();
		list=sqlSessionTemplate.selectList(namespace+".getAllMemberList", map);
		return list;
	}


	public int GetBuyTotalCount(Map<String, String> map){
		int cnt  = sqlSessionTemplate.selectOne(namespace1+".GetBuyTotalCount", map);
		return cnt;
	}


	public List<MemberCommonAndHost> MyBuyList(Paging6 pageInfo, Map<String, String> map) {
		List<MemberCommonAndHost> list= new ArrayList<MemberCommonAndHost>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		list=sqlSessionTemplate.selectList(namespace1+".MyBuyList", map, rowBounds);
		return list;
	}


	public List<MemberCommonAndHost> MySellList(Paging7 pageInfo, Map<String, String> map) {
		List<MemberCommonAndHost> list= new ArrayList<MemberCommonAndHost>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		list=sqlSessionTemplate.selectList(namespace1+".MySellList", map, rowBounds);
		return list;
	}


	public int GetSellTotalCount(Map<String, String> map) {
		int cnt  = sqlSessionTemplate.selectOne(namespace1+".GetSellTotalCount", map);
		return cnt;
	}

	//후기에서 사용
	public Member getId2(Member member) {
		Member bean = new Member();
		System.out.println("=====geti=d==========");
		System.out.println(member);
		bean = sqlSessionTemplate.selectOne(namespace + ".getId2",member);
		return bean;
	}//후기에서 사용
	
	
	//아이디 가입 중복체크
	public int SearchId(String memberid){
		int cnt = 0;
		System.out.println("dao에서"+cnt);
		cnt = sqlSessionTemplate.selectOne(namespace + ".SearchId",memberid);
		System.out.println("dao에서2"+cnt);
		return cnt;
		
	}
	
	
	//결제 포인트
	public int getpoint(String memberid) {
		
		int point = sqlSessionTemplate.selectOne(namespace+".getpoint", memberid);
		
		return point;
	}
	
	
	public int getmembernum(String id) {
		
		int membernum = sqlSessionTemplate.selectOne(namespace+".getmembernum", id);
		
		return membernum;
	}

	

	
	
}
