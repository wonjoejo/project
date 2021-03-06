package com.wonjoejo.myapp.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {

    @Autowired
    protected JavaMailSender mailSender;

    public void SendEmail(Email email) throws Exception {

        MimeMessage msg = mailSender.createMimeMessage();

        System.out.println("****메일센더 ??");

        try {
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        } // try-catch

        try {
            mailSender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        } // try-catch
    } // SendEmail

} // end class
