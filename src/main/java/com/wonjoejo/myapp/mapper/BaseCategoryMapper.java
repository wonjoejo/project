package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BaseCategoryVO;

import java.util.List;

public interface BaseCategoryMapper {

    public abstract BaseCategoryVO selectBaseCategoryList(Integer box_no);

    // 박스 생성될 때 카테고리도 같이 생성..
    public abstract Integer insertCategory(BaseCategoryVO baseCategory);

    public abstract Integer updateBaseCategory(BaseCategoryVO baseCategory);

    public abstract Integer deleteBaseCategory(Integer category_no);


} // end interface
