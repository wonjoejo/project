package com.wonjoejo.myapp.service;

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
@ContextConfiguration(
        {
                "file:src/main/webapp/WEB-INF/spring/root-context.xml",
                "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
        }
)
public class BoxServiceTests {

    @Setter(onMethod_= { @Autowired})
    private BoxService service;

    @Before
    public void setUp() {

        log.debug("setup() invoked.");

        assert this.service != null;
        log.info("\t+ service: {}",this.service);

    } // setup

    @Test(timeout=1000)
    public void testGetBoxList() {

        log.debug("getBoxList() invoked.");

        String member_id = "MEMBERid2";
        Criteria cri = new Criteria();
        cri.setCurrPage(1);
        cri.setAmount(6);
        cri.setMember_id(member_id);
        List<BoxVO> list = this.service.getBoxList(cri);

        assert list != null;
        list.forEach(log::info);

    } // getBoxList

    @Test(timeout=1000)
    public void testGetBox() {

        log.debug("getBox() invoked.");

        int box_no = 1099;
        BoxVO box = this.service.getBox(box_no);

        assert box != null;
        log.info("\t+ box: {}",box);

    } // testGetBox

    @Test(timeout=1000)
    public void testCreateBox() {
        log.debug("createBox() invoked.");

        Integer box_mode = 2;
        BoxVO box = new BoxVO(
                null,
                "MEMBERid5",
                box_mode,
                "box_name_new",
                "box_memo_new",
                "photo_name",
                "photo_path",
                null,
                null);

        boolean isSuccess = this.service.createBox(box);
        log.info("Box created successfully: {}",isSuccess);

        boolean isSuccess2 = false;
        // BaseCategory
        BaseCategoryVO baseCategory = null;

        switch (box_mode){
            case 1:
                baseCategory = new BaseCategoryVO(null, "??????","????????????","????????????",null,null,box.getBox_no());
                isSuccess2 = this.service.insertCategory(baseCategory);
                log.info("BaseCategory successfully : {}" , isSuccess2);
                break;
            case 2:
                baseCategory = new BaseCategoryVO(null, "??????", "????????????", "??????", null, null, box.getBox_no());
                isSuccess2 = this.service.insertCategory(baseCategory);
                log.info("BaseCategory successfully : {}" , isSuccess2);
                break;
            case 3:
                baseCategory = new BaseCategoryVO(null, "?????????", "????????????", "??????", null, null, box.getBox_no());
                isSuccess2 = this.service.insertCategory(baseCategory);
                log.info("BaseCategory successfully : {}" , isSuccess2);
                break;
            case 4:
                baseCategory = new BaseCategoryVO(null, "?????????", "??????", "??????", null, null, box.getBox_no());
                isSuccess2 = this.service.insertCategory(baseCategory);
                log.info("BaseCategory successfully : {}" , isSuccess2);
                break;
            case 5:
                baseCategory = new BaseCategoryVO(null, "??????", "????????????", "?????????", null, null, box.getBox_no());
                isSuccess2 = this.service.insertCategory(baseCategory);
                log.info("BaseCategory successfully : {}" , isSuccess2);
                break;
            default:
                baseCategory = new BaseCategoryVO(null, null, null, null, null, null, box.getBox_no());
                isSuccess2 = this.service.insertCategory(baseCategory);
                log.info("BaseCategory successfully : {}" , isSuccess2);
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

        this.service.grantMasterPermission(vo);

    } // testCreateBox

    @Test(timeout=1000)
    public void testEditBox() {

        log.debug("testEditBox() invoked");

        BoxVO box = new BoxVO(
                1098,
                null,
                null,
                "boxname",
                "boxmemo",
                "photoname",
                "photopath",
                null,
                null);

        boolean isSuccess = this.service.editBox(box);

        log.info("Box edited successfully: {}",isSuccess);
    } // testEditBox

    @Test(timeout=1000)
    public void testDeleteBox() {

        log.debug("testDeleteBox() invoked.");

        int box_no = 1099;
        boolean isSuccess = this.service.deleteBox(box_no);

        log.info("Box deleted successfully: {}",isSuccess);
    } // testDeleteBox

    @Test(timeout=1000)
    public void testCreateBaseCategory() {
        log.debug("testCreateBaseCategory() invoked.");

        BoxVO box = new BoxVO(
                null,
                "userid3",
                2,
                "box_name_new",
                "box_memo_new",
                "photo_name",
                "photo_path",
                null,
                null);

        boolean isSuccess = this.service.createBox(box);

        log.info("Box created successfully: {}",isSuccess);

    } // testCreateBaseCategory

} // end class
