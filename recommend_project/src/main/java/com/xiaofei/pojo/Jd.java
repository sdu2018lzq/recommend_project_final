package com.xiaofei.pojo;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
public class Jd {
  @Id
  private long positionId;
  private String companyName;
  private String address;
  private String companyInfo;
  private String positionName;
  private String jobDescription;
  private String salary;
  private long minSalary;
  private long maxSalary;
  private long headCount;
  private String educational;
  private long workYear;
  private String createTime;
  private String url;
  private String jobType;
  private String tfidf;


  public long getPositionId() {
    return positionId;
  }

  public void setPositionId(long positionId) {
    this.positionId = positionId;
  }


  public String getCompanyName() {
    return companyName;
  }

  public void setCompanyName(String companyName) {
    this.companyName = companyName;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public String getCompanyInfo() {
    return companyInfo;
  }

  public void setCompanyInfo(String companyInfo) {
    this.companyInfo = companyInfo;
  }


  public String getPositionName() {
    return positionName;
  }

  public void setPositionName(String positionName) {
    this.positionName = positionName;
  }


  public String getJobDescription() {
    return jobDescription;
  }

  public void setJobDescription(String jobDescription) {
    this.jobDescription = jobDescription;
  }


  public String getSalary() {
    return salary;
  }

  public void setSalary(String salary) {
    this.salary = salary;
  }


  public long getMinSalary() {
    return minSalary;
  }

  public void setMinSalary(long minSalary) {
    this.minSalary = minSalary;
  }


  public long getMaxSalary() {
    return maxSalary;
  }

  public void setMaxSalary(long maxSalary) {
    this.maxSalary = maxSalary;
  }


  public long getHeadCount() {
    return headCount;
  }

  public void setHeadCount(long headCount) {
    this.headCount = headCount;
  }


  public String getEducational() {
    return educational;
  }

  public void setEducational(String educational) {
    this.educational = educational;
  }


  public long getWorkYear() {
    return workYear;
  }

  public void setWorkYear(long workYear) {
    this.workYear = workYear;
  }


  public String getCreateTime() {
    return createTime;
  }

  public void setCreateTime(String createTime) {
    this.createTime = createTime;
  }


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }


  public String getJobType() {
    return jobType;
  }

  public void setJobType(String jobType) {
    this.jobType = jobType;
  }


  public String getTfidf() {
    return tfidf;
  }

  public void setTfidf(String tfidf) {
    this.tfidf = tfidf;
  }

}
