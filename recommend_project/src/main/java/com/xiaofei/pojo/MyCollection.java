package com.xiaofei.pojo;



import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
public class MyCollection {

  private String uid;
  private String jid;


  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }


  public String getJid() {
    return jid;
  }

  public void setJid(String jid) {
    this.jid = jid;
  }

}
