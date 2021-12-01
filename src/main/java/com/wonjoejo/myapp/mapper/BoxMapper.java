package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.Criteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BoxMapper {

	public abstract List<BoxVO> selectBoxList(Criteria cri);

	public abstract BoxVO selectBox(Integer box_no);

	public abstract int insertBox(BoxVO box);

	public abstract int updateBox(BoxVO box);

	public abstract int deleteBox(Integer box_no);

	// BaseCategory insert (박스 생성 시)
	public abstract int insertCategory(BaseCategoryVO baseCategory);

	// Master Permission insert  (박스 생성 시)
	public abstract int insertMasterPermission(BoxPermissionVO boxPermission);

	public abstract Integer getTotalCount(String member_id);

	public abstract int insertGroup(@Param("member_id") String member_id, @Param("box_no") Integer box_no);

	// box 삭제시 



} // end interface
