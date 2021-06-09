package com.xiaofei.jdParse.dataparse;

public class vector {
    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getJd_no() {
        return jd_no;
    }

    public void setJd_no(String jd_no) {
        this.jd_no = jd_no;
    }

    private String user_id;
    private String jd_no;
    private int degree;
    private int salary;
    private int city=0;
    private double tf_multi_idf=0;
    private double tf_plus_idf=0;
    private double tf_a_idf=0;
    private double tf_b_idf=0;
    private int satisfied;

    public vector() {
    }

    public int getSatisfied() {
        return satisfied;
    }

    public void setSatisfied(int satisfied) {
        this.satisfied = satisfied;
    }

    public double getTf_plus_idf() {
        return tf_plus_idf;
    }

    public void setTf_plus_idf(double tf_plus_idf) {
        this.tf_plus_idf += tf_plus_idf;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public double getTf_multi_idf() {
        return tf_multi_idf;
    }

    public void setTf_multi_idf(double tf_multi_idf) {
        this.tf_multi_idf += tf_multi_idf;
    }

    public int getCity() {
        return city;
    }

    public void setCity(int city) {
        this.city = city;
    }

    public int getDegree() {
        return degree;
    }

    public void setDegree(int degree) {
        this.degree = degree;
    }

    public double getTf_a_idf() {
        return tf_a_idf;
    }

    public void setTf_a_idf(double tf_a_idf) {
        this.tf_a_idf += tf_a_idf;
    }
    public double getTf_b_idf() {
        return tf_b_idf;
    }

    public void setTf_b_idf(double tf_b_idf) {
        this.tf_b_idf += tf_b_idf;
    }
}
