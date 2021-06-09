package com.xiaofei.jdParse;

import java.io.File;

/**
 * 简历解析工具。
 * 
 *
 *
 */
public interface ResumeParser {
  
  String getName();

  boolean canParse(File file);
  
  Resume parse(File file) throws Exception;
}
