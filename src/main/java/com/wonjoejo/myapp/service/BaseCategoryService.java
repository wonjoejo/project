package com.wonjoejo.myapp.service;


import com.wonjoejo.myapp.domain.AllCategoryVO;
import com.wonjoejo.myapp.domain.DeleteCategoryVO;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.CategoryVO;

import java.util.List;

public interface BaseCategoryService {

    public abstract BaseCategoryVO getBaseCategoryList(Integer box_no);

    public abstract Boolean editBaseCategory(BaseCategoryVO baseCategory);

    public abstract List<AllCategoryVO> getCategoryList(Integer box_no);

    public abstract Boolean deleteCategory(DeleteCategoryVO category);


} // end interface


