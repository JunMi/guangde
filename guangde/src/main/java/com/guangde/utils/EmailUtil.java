package com.guangde.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

public class EmailUtil {

	private static Logger logger = Logger.getLogger(EmailUtil.class);

	public static boolean sendEmail(String to, String subject, String content) {
		Properties properties = new Properties();
		InputStream resourceAsStream = null;
		boolean flag = false;
		try {
			resourceAsStream = EmailUtil.class.getClassLoader().getResourceAsStream("email.properties");
			properties.load(resourceAsStream);

			// 提供登陆邮件服务器
			String username = properties.get("username").toString();
			String password = properties.get("password").toString();

			// 1、创建session
			Session session = Session.getInstance(properties);
			// 开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
			session.setDebug(true);
			// 2、通过session得到transport对象
			Transport ts = session.getTransport();
			// 3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
			ts.connect(username, password);
			// 4、创建邮件
			Message message = createSimpleMail(session, to, username, subject, content);
			// 5、发送邮件
			ts.sendMessage(message, message.getAllRecipients());
			// 6、关闭邮件连接
			ts.close();
			flag =true;
		} catch (IOException e) {
			logger.error("无法读取配置文件===>" + e);
		} catch (NoSuchProviderException e) {
			logger.error("邮件发送异常" + e);
		} catch (MessagingException e) {
			logger.error("邮件发送异常" + e);
		} finally {
			if (resourceAsStream != null) {
				try {
					resourceAsStream.close();
				} catch (IOException e) {
					logger.error("读取文件资源异常" + e);
				}
			}
		}
		return flag;
	}

	public static MimeMessage createSimpleMail(Session session, String to, String from, String subject,
			String content) {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		try {
			message.setFrom(new InternetAddress(from));
			// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// 邮件的标题
			message.setSubject(subject);
			// 邮件的文本内容
			message.setContent(content, "text/html;charset=UTF-8");
		} catch (AddressException e) {
			logger.error("邮件地址异常" + e);
		} catch (MessagingException e) {
			logger.error("邮件发送异常" + e);
		}
		// 返回创建好的邮件对象
		return message;
	}
}
