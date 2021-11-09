package com.wonjoejo.myapp.service;


import com.wonjoejo.myapp.domain.BaseCategoryVO;

import java.util.List;

public interface BaseCategoryService {

    public abstract BaseCategoryVO getBaseCategoryList(Integer box_no);

    public abstract Boolean editBaseCategory(BaseCategoryVO baseCategory);



} // end interface


