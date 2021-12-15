package com.wonjoejo.myapp.util;

import lombok.extern.log4j.Log4j2;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

@Log4j2
public class UploadFileUtils {

    public static String uploadFile(String uploadPath, String originalName, byte[] byteData) throws Exception {

        S3Utils s3 = new S3Utils();
        String bucketName = "intobox";

        //랜덤의 uid 를 만들어준다.
        UUID uid = UUID.randomUUID();

        //savedName : 570d570a-7af1-4afe-8ed5-391d660084b7_g.JPG 같은 형식으로 만들어준다.
        String savedName = "/" + uid.toString() + "_" + originalName;
        log.info("저장된 이름 : "+ savedName);

        log.info("업로드 경로 : "+ uploadPath);

        String savedPath = calcPath(uploadPath);

        String uploadedFileName = null;

        uploadedFileName = (savedPath + savedName).replace(File.separatorChar, '/');
        // 2021/12/14/uuid_filename.jpg
        //S3Util 의 fileUpload 메서드로 파일을 업로드한다.
        s3.fileUpload(bucketName, uploadPath + uploadedFileName, byteData);


        log.info(uploadedFileName);
// s3.fileUpload(bucketName, new File(fileName))

        return uploadedFileName;

    }

    private static String calcPath(String uploadPath) {

        Calendar cal = Calendar.getInstance();

        String yearPath = File.separator + cal.get(Calendar.YEAR);

        //01 02
        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);

        String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

        makeDir(uploadPath, yearPath, monthPath, datePath);

        log.info(datePath);

        return datePath;
    }


    private static void makeDir(String uploadPath, String... paths) {

        if (new File(paths[paths.length - 1]).exists()) {
            return;
        }

        for (String path : paths) {

            File dirPath = new File(uploadPath + path);

            if (!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }
}
