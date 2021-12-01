package com.wonjoejo.myapp.service;


import com.wonjoejo.myapp.domain.AllCategoryVO;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseCategoryService {

    public abstract BaseCategoryVO getBaseCategoryList(Integer box_no);

    public abstract Boolean editBaseCategory(BaseCategoryVO baseCategory);

    public abstract List<AllCategoryVO> getCategoryList(Integer box_no);

    public abstract Boolean deleteCategory(@Param("category_no") Integer category_no, @Param("rowName") String rowName);


} // end interface


