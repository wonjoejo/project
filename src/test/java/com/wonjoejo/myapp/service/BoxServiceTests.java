package com.wonjoejo.myapp.service;

import com.wonjoejo.myapp.domain.BoxVO;
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

        String user_id = "userid2";
        List<BoxVO> list = this.service.getBoxList(user_id);

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
                "userid3",
                2,
                "box_name_new",
                "box_memo_new",
                "photo_name",
                "photo_path",
                null
        );

        boolean isSuccess = this.service.createBox(box);

        log.info("Box created successfully: {}",isSuccess);

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
