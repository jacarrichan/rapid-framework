package com.company.project.tools;

import java.net.URL;
import java.net.URLClassLoader;
import java.util.Scanner;

import cn.org.rapid_framework.generator.GeneratorFacade;
import cn.org.rapid_framework.generator.GeneratorProperties;

public class TableGeneratorMainT {
	/**
	 * 请直接修改以下代码调用不同的方法以执行相关生成任务.
	 */
	public static void main(String[] args) throws Exception {
		GeneratorFacade g = new GeneratorFacade();
		g.getGenerator()
				.setTemplateRootDirs(
						"src/main/generator/template/share/custom",
						"classpath:generator/template/rapid/table/dao_hibernate",
						"classpath:generator/template/rapid/table/dao_share_query_object",
						"classpath:generator/template/rapid/table/dao_test",
						"classpath:generator/template/rapid/table/service_complex",
						"classpath:generator/template/rapid/table/web_springmvc_rest");

		g.deleteOutRootDir(); // 删除生成器的输出目录
		g.generateByTable("user_info"); // 自动搜索数据库中的所有表并生成文件,template为模板的根目录
		Runtime.getRuntime().exec(
				"cmd.exe /c start "
						+ GeneratorProperties.getRequiredProperty("outRoot")); // 打开文件夹
		// g.deleteByTable("table_name", "template"); //删除生成的文件

	}
}
