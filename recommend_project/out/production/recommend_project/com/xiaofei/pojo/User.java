package com.xiaofei.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
public class User {
  @Id
  private String uid;
  private String name;
  private String sex;
  private String city;
  private String birth;
  private String college;
  private String eduLevel;
  private String phone;
  private String email;
  private String schoolExp;
  private String projectExp;
  private String major;
  private String skill;
  private String hobby;
  private long minSal;
  private long maxSal;
  private String hopecity1;
  private String hopecity2;
  private String adjust;
  private String password;


  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }


  public String getBirth() {
    return birth;
  }

  public void setBirth(String birth) {
    this.birth = birth;
  }


  public String getCollege() {
    return college;
  }

  public void setCollege(String college) {
    this.college = college;
  }


  public String getEduLevel() {
    return eduLevel;
  }

  public void setEduLevel(String eduLevel) {
    this.eduLevel = eduLevel;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }


  public String getSchoolExp() {
    return schoolExp;
  }

  public void setSchoolExp(String schoolExp) {
    this.schoolExp = schoolExp;
  }


  public String getProjectExp() {
    return projectExp;
  }

  public void setProjectExp(String projectExp) {
    this.projectExp = projectExp;
  }


  public String getMajor() {
    return major;
  }

  public void setMajor(String major) {
    this.major = major;
  }


  public String getSkill() {
    return skill;
  }

  public void setSkill(String skill) {
    this.skill = skill;
  }


  public String getHobby() {
    return hobby;
  }

  public void setHobby(String hobby) {
    this.hobby = hobby;
  }


  public long getMinSal() {
    return minSal;
  }

  public void setMinSal(long minSal) {
    this.minSal = minSal;
  }


  public long getMaxSal() {
    return maxSal;
  }

  public void setMaxSal(long maxSal) {
    this.maxSal = maxSal;
  }


  public String getHopecity1() {
    return hopecity1;
  }

  public void setHopecity1(String hopecity1) {
    this.hopecity1 = hopecity1;
  }


  public String getHopecity2() {
    return hopecity2;
  }

  public void setHopecity2(String hopecity2) {
    this.hopecity2 = hopecity2;
  }


  public String getAdjust() {
    return adjust;
  }

  public void setAdjust(String adjust) {
    this.adjust = adjust;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

}
