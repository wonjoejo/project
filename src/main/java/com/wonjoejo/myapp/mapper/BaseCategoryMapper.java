package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.CategoryVO;

import java.util.List;

public interface BaseCategoryMapper {

    public abstract BaseCategoryVO selectBaseCategoryList(Integer box_no);

    // 박스 생성될 때 카테고리도 같이 생성..
    public abstract Integer insertCategory(BaseCategoryVO baseCategory);

    public abstract Integer updateBaseCategory(BaseCategoryVO baseCategory);

    // Category 상세보기(edit을 위해...test만 .. )
    public abstract List<CategoryVO> selectCategory(Integer category_no);

    //------ BaseCategory 삭제 (업데이트로...) ------//
    // BaseCategory 삭제 (edit)
//    public abstract Integer deleteBaseCategory(BaseCategoryVO baseCategory);

    // Category 삭제 (edit)
    public abstract Integer deleteCategory();

    //------ BaseCategory 삭제 (업데이트로...) ------//





} // end interface
