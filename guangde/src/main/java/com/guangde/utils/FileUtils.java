package com.guangde.utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.guangde.vo.Attachment;

public class FileUtils {

	/**
	 * 
	 * @param file
	 *            上传的文件
	 * @param direct
	 *            上传文件相对于服务器的目录
	 * @param request
	 * @return Attachment
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	public static Attachment uploadFile(MultipartFile file, File direct, HttpServletRequest request)
			throws IllegalStateException, IOException {
		Attachment attachment = new Attachment();
		if (file != null) {// 判断上传的文件是否为空
			String path = null;// 文件路径
			String type = null;// 文件类型
			String fileName = file.getOriginalFilename();// 文件原名称
			System.out.println("上传的文件原名称:" + fileName);
			// 判断文件类型
			type = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length())
					: null;
			if (type != null) {// 判断文件类型是否为空
				if ("GIF".equals(type.toUpperCase()) || "PNG".equals(type.toUpperCase())
						|| "JPG".equals(type.toUpperCase())) {
					// 项目在容器中实际发布运行的根路径
					String realPath = request.getSession().getServletContext().getRealPath("/");
					// 自定义的文件名称
					String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
					//相对路径
					String relativePath = direct+File.separator+trueFileName;
					// 设置存放图片文件的路径
					File dir = new File(realPath + direct);
					if (!dir.exists()) {
						dir.mkdir();
					}
					path = realPath + relativePath;
					System.out.println("存放图片文件的路径:" + path);
					// 转存文件到指定的路径
					file.transferTo(new File(path));
					System.out.println("文件成功上传到指定目录下");

					attachment.setFileName(trueFileName);
					attachment.setFileType(type);
					attachment.setPath(relativePath);
					return attachment;
				} else {
					System.out.println("不是我们想要的文件类型,请按要求重新上传");
					return null;
				}
			} else {
				System.out.println("文件类型为空");
				return null;
			}
		} else {
			System.out.println("没有找到相对应的文件");
			return null;
		}
	}
}
