package com.wonjoejo.myapp.mapper;

import com.wonjoejo.myapp.domain.BaseCategoryVO;
import com.wonjoejo.myapp.domain.BoxPermissionVO;
import com.wonjoejo.myapp.domain.BoxVO;
import com.wonjoejo.myapp.domain.Criteria;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoxMapperTests {

    @Setter(onMethod_ = {@Autowired})
    private BoxMapper mapper;

    @Before
    public void setup() {

        log.debug("setup() invoked.");

        assert this.mapper != null;
        log.info("\t+ mapper: {}", this.mapper);
        log.info("\t+ type: {}", this.mapper.getClass().getName());

    } // setup

    @Test
    public void testGetBoxList() {

        log.debug("testGetBoxList() invoked.");

        String member_id = "MEMBERid32";
        Criteria cri = new Criteria();
        cri.setCurrPage(1);
        cri.setAmount(10);
        cri.setMember_id(member_id);

        List<BoxVO> list = this.mapper.selectBoxList(cri);
        log.info(list.get(0).getBox_mode());
        list.forEach(log::info);


    } // testGetPersonalList

    @Test
    public void testInsertBox() {
        log.debug("testInsertBox() invoked.");

        Integer box_mode = 5;
        BoxVO box = new BoxVO(
                null,
                "MEMBERid4",
                box_mode,
                "boxname2",
                "mappertest",
                "mapperimg",
                "mapperpath",
                null,
                null);

        this.mapper.insertBox(box);
        log.info("\t+ box:{}", box);

//		BaseCategory insert
        BaseCategoryVO basecategoryVO = null;

        switch (box_mode) {
            case 1:
                basecategoryVO = new BaseCategoryVO(null, "??????", "????????????", "????????????", null, null, box.getBox_no());
                this.mapper.insertCategory(basecategoryVO);
                break;
            case 2:
                basecategoryVO = new BaseCategoryVO(null, "??????", "????????????", "??????", null, null, box.getBox_no());
                this.mapper.insertCategory(basecategoryVO);
                break;
            case 3:
                basecategoryVO = new BaseCategoryVO(null, "?????????", "????????????", "??????", null, null, box.getBox_no());
                this.mapper.insertCategory(basecategoryVO);
                break;
            case 4:
                basecategoryVO = new BaseCategoryVO(null, "?????????", "??????", "??????", null, null, box.getBox_no());
                this.mapper.insertCategory(basecategoryVO);
                break;
            case 5:
                basecategoryVO = new BaseCategoryVO(null, "??????", "????????????", "?????????", null, null, box.getBox_no());
                this.mapper.insertCategory(basecategoryVO);
                break;
            default:
                basecategoryVO = new BaseCategoryVO(null, null, null, null, null, null, box.getBox_no());
                this.mapper.insertCategory(basecategoryVO);
                break;
        }

//		Master ?????? ??????

        BoxPermissionVO vo = new BoxPermissionVO(
                null,
                box.getMember_id(),
                box.getBox_no(),
                0,
                0,
                0,
                0,
                0,
                0
        );

        this.mapper.insertMasterPermission(vo);


    } // testInsertBox

    @Test
    public void testUpdateBox() {
        log.debug("testUpdateBox() invoked.");

        BoxVO box = new BoxVO(
                1093,
                null,
                null,
                "box-edit",
                "box-path-edit",
                "photoname",
                "photopath",
                null,
                null);
        this.mapper.updateBox(box);
        log.info("\t+ box:{}", box);
    }

    @Test
    public void testDeleteBox() {
        log.debug("testDeleteBox() invoked.");

        int box_no = 1185;

        this.mapper.deleteBox(box_no);

        log.info("\t+ box:{}", box_no);
    }

    @Test
    public void testGetBox() {
        log.debug("testGetBox() invoked.");

        int box_no = 1330;

        BoxVO box = this.mapper.selectBox(box_no);
        log.info("\t+ box:{}", box);

//        List<ProductVO> productList = this.mapper.getProductList(box_no);
//        log.info("\t+ productList: {}", productList);
    }

    @Test
    public void testInsertGroup() {
        log.debug("testInsertGroup() invoked.");

        int box_no = 1182;
        String member_id = "MEMBERid32";

        int affectedLines = this.mapper.insertGroup(member_id, box_no);
        log.info("\t+ affectedLines: {}", affectedLines);

    }

}
