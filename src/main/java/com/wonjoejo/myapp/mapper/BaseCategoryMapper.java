package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BaseCategoryVO;

import java.util.List;

public interface BaseCategoryMapper {

    public abstract List<BaseCategoryVO> selectBaseCategoryList(Integer product_no);

    public abstract Integer insertBaseCategory(BaseCategoryVO baseCategory);


} // end interface
