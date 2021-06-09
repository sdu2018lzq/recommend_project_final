package com.xiaofei.pojo;

import lombok.Data;

@Data
public class Sc {

  private String uid;
  private long jid;
  private String posName;
  private String compName;
  private String city;
  private String type;
  private long hc;
  private String sal;


  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }


  public long getJid() {
    return jid;
  }

  public void setJid(long jid) {
    this.jid = jid;
  }


  public String getPosName() {
    return posName;
  }

  public void setPosName(String posName) {
    this.posName = posName;
  }


  public String getCompName() {
    return compName;
  }

  public void setCompName(String compName) {
    this.compName = compName;
  }


  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public long getHc() {
    return hc;
  }

  public void setHc(long hc) {
    this.hc = hc;
  }


  public String getSal() {
    return sal;
  }

  public void setSal(String sal) {
    this.sal = sal;
  }

}
