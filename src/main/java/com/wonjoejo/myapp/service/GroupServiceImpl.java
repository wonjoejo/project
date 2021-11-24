package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.BoxPermissionMemberVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.MemberVO;
import com.wonjoejo.myapp.mapper.GroupMapper;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@NoArgsConstructor

@Service
public class GroupServiceImpl implements GroupService{

	@Setter(onMethod_= {@Autowired})
	private GroupMapper mapper;

	// 그룹 멤버 리스트 조회
	@Override
	public List<MemberVO> selectGroupMemberList(Integer box_no) {
		log.debug("selectGroupMemberList() invoked.");
		
		List<MemberVO> list = this.mapper.selectGroupMemberList(box_no);
		
		list.forEach(log::info);
		
		return list;
	}//selectGroupMemberList
	

	//그룹원 권한 조회
	@Override
	public List<BoxPermissionMemberVO> selectGroupPermissionList(Integer box_no) {
		
		List<BoxPermissionMemberVO> list = this.mapper.selectGroupPermissionList(box_no);
		
		list.forEach(log::info);
		
		return list;
	}//selectGroupPermissionList

	//그룹원 초대
	@Override
	public boolean joinGroup(BoxPermissionVO boxPermission) {
		log.debug("joinGroup({}) invoked", boxPermission);
		
		int affectedRows = this.mapper.insertMember(boxPermission);
		
		return affectedRows == 1;
	}// joinGroup
	
	//그룹원의 권한 설정
	@Override
	public boolean permissionGroup(BoxPermissionVO boxPermission) {
		log.debug("permissionGroup({}) invoked", boxPermission);
		
		int affectedRows = this.mapper.updateMember(boxPermission);
		
		return affectedRows == 1;
	} //permissionGroup
	

	// 마스터 권한 체크 
	@Override
	public boolean checkMaster(String member_id, Integer box_no) {

		log.debug("checkMaster({},{}) invoked", member_id, box_no);

		BoxPermissionVO vo = this.mapper.checkMaster(member_id, box_no);

		return vo.getMaster_per() == 0;

		// true면, master / false면, master 아님
	}

	// 그룹 멤버 찾기
	@Override
	public String findMember(String keyword) {

		log.debug("findMember({}) invoked.", keyword);

		String member_id = this.mapper.findMember(keyword);
		assert member_id != null;


		return member_id;
	}

	//그룹 마스터 권한 양도
	@Override
	public boolean updateMaster(String member_id, Integer box_no, Integer master_per) {

		log.debug("updateMaster({},{}) invoked.", member_id, box_no);

		int affectedRows = this.mapper.updateMaster(member_id, box_no, master_per);

		return affectedRows == 1;
	}

	// 그룹 멤버 삭제(추방, 삭제 같이 사용)
	@Override
	public boolean deleteMember(String member_id, Integer box_no, Integer member_stat) {
		
		log.debug("deleteMember({},{}) invoked.", member_id, box_no);
		
		int affectedRows = this.mapper.deleteMember(member_id, box_no, member_stat);
		
		return affectedRows ==1;
	}

} // end class
