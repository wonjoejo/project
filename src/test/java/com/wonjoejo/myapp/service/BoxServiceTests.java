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

        BoxVO box = new BoxVO(
                null,
                "MEMBERid3",
                2,
                "box_name_new",
                "box_memo_new",
                "photo_name",
                "photo_path",
                null
        );

        boolean isSuccess = this.service.createBox(box);

        log.info("Box created successfully: {}",isSuccess);

        //		BaseCategory insert
        BaseCategoryVO basecategoryVO = null;

        switch (box.getBox_mode()){
            case 1:
                basecategoryVO = new BaseCategoryVO(null, "종류","유통기한","보관방법",null,null,box.getBox_no());
                this.service.insertCategory(basecategoryVO);
                break;
            case 2:
                basecategoryVO = new BaseCategoryVO(null, "종류", "유통기한", "색상", null, null, box.getBox_no());
                this.service.insertCategory(basecategoryVO);
                break;
            case 3:
                basecategoryVO = new BaseCategoryVO(null, "구매자", "구매일자", "종류", null, null, box.getBox_no());
                this.service.insertCategory(basecategoryVO);
                break;
            case 4:
                basecategoryVO = new BaseCategoryVO(null, "구매자", "종류", "색상", null, null, box.getBox_no());
                this.service.insertCategory(basecategoryVO);
                break;
            case 5:
                basecategoryVO = new BaseCategoryVO(null, "종류", "구매일자", "멤버명", null, null, box.getBox_no());
                this.service.insertCategory(basecategoryVO);
                break;
            default:
                basecategoryVO = new BaseCategoryVO(null, null, null, null, null, null, box.getBox_no());
                this.service.insertCategory(basecategoryVO);
                break;
        }

        //		Master 권한 부여

        BoxPermissionVO vo = new BoxPermissionVO(
                null,
                box.getBox_no(),
                box.getMember_id(),
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
                null
                );

        boolean isSuccess = this.service.editBox(box);

        log.info("Box edited successfully: {}",isSuccess);
    } // testEditBox

    @Test(timeout=1000)
    public void testDeleteBox() {

        log.debug("testDeleteBox() invoked.");

        int box_no = 1099;
        boolean isSuccess = this.service.deleteBox(box_no);

        log.info("Box deleted successfully: {}",isSuccess);
    }

} // end class
