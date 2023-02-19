package com.yummyclimbing.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class VOGenerator {
	public static void main(String[] args) throws IOException {
		Path path = Paths.get("");
		String absolutePath = path.toAbsolutePath().toString() + "\\src\\main\\java\\com\\yummyclimbing\\vo\\";
		log.info("path=>{}",absolutePath);
		FileOutputStream fos = new FileOutputStream(absolutePath + "TestVO.java");
		String fileText = "package com.yummyclimbing.vo.user;\r\n"
				+ "\r\n"
				+ "import lombok.Data;\r\n"
				+ "\r\n"
				+ "@Data\r\n"
				+ "public class TestVO {\r\n"
				+ "}";
		byte[] fileTextBytes = fileText.getBytes();
		fos.write(fileTextBytes);
		fos.close();
	}
}
