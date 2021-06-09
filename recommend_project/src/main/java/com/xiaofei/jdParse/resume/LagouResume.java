package com.xiaofei.jdParse.resume;

import com.xiaofei.jdParse.AbstractResume;
import com.xiaofei.jdParse.Resume;

import java.util.HashMap;

/**
 * 简历。
 * 
 *
 *
 */
public class LagouResume extends AbstractResume implements Resume {

  private static final long serialVersionUID = 2093235400790350336L;

  protected String name;

  protected String job;

  protected String company;

  protected String sex = "男";

  protected String education;

  protected String workDuration;

  protected String city;

  protected String phone;

  protected String mail;
  
  protected String school;
  
  protected String age;

  protected String xingge;

  protected String jineng;


  protected HashMap<String, Double> XgTFIDF;

  protected HashMap<String, Double> JnTFIDF;


  @Override
  public HashMap<String, Double> getXgTFIDF() {
    return XgTFIDF;
  }

  public void setXgTFIDF(HashMap<String, Double> xgTFIDF) {
    XgTFIDF = xgTFIDF;
  }

  @Override
  public HashMap<String, Double> getJnTFIDF() {
    return JnTFIDF;
  }

  public void setJnTFIDF(HashMap<String, Double> jnTFIDF) {
    JnTFIDF = jnTFIDF;
  }

  @Override
  public String getSource() {
    return "拉勾";
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getJob() {
    return job;
  }

  public void setJob(String job) {
    this.job = job;
  }

  public String getCompany() {
    return company;
  }

  public void setCompany(String company) {
    this.company = company;
  }

  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }

  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }

  public String getWorkDuration() {
    return workDuration;
  }

  public void setWorkDuration(String workDuration) {
    this.workDuration = workDuration;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  @Override
  public String getMail() {
    return mail;
  }

  public void setMail(String mail) {
    this.mail = mail;
  }

  public String getSchool() {
    return school;
  }

  public void setSchool(String school) {
    this.school = school;
  }

  public String getAge() {
    return age;
  }

  public void setAge(String age) {
    this.age = age;
  }

  @Override
  public String getxingge() {
    return xingge;
  }

  public void setxingge(String xingge) {
    this.xingge = xingge;
  }

  @Override
  public String getjineng() {
    return jineng;
  }

  public void setjineng(String jineng) {
    this.jineng = jineng;
  }


}
