package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.AllCategoryVO;
import com.wonjoejo.myapp.domain.DeleteCategoryVO;
import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.CategoryVO;
import com.wonjoejo.myapp.mapper.BaseCategoryMapper;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Log4j2
@NoArgsConstructor

@Service
public class BaseCategoryServiceImpl implements BaseCategoryService, InitializingBean, DisposableBean {

    @Setter(onMethod_= {@Autowired})
    private BaseCategoryMapper mapper;

    @Override
    public BaseCategoryVO getBaseCategoryList(Integer box_no) {
        log.debug("getBaseCategoryList({}) invoked.", box_no);

        BaseCategoryVO baseCategory = this.mapper.selectBaseCategoryList(box_no);

        log.info("\t+ baseCategory: {}" , baseCategory);
        return baseCategory;
    } // getBaseCategoryList

    @Override
    public Boolean editBaseCategory(BaseCategoryVO baseCategory) {
        log.debug("editBaseCategory({}) invoked.", baseCategory);

        int affectedLines = this.mapper.updateBaseCategory(baseCategory);

        return affectedLines == 1;
    } // editBaseCategory

    @Override
    public List<AllCategoryVO> getCategoryList(Integer box_no) {
        log.debug("editBaseCategory({}) invoked.", box_no);

        List<AllCategoryVO> list = this.mapper.selectCategory(box_no);
        list.forEach(log::info);

        return list;
    } //getCategoryList

    @Override
    public Boolean deleteCategory(DeleteCategoryVO category) {
        log.debug("deleteCategory({}) invoked.", category);

        int affectedLines = this.mapper.deleteCategory(category);

        return affectedLines == 1;
    }


    @Override
    public void destroy() throws Exception {

    } // destroy

    @Override
    public void afterPropertiesSet() throws Exception {

    } // afterPropertiesSet

} // end class
