package com.xiaofei.jdParse.dataparse;

import jeasy.analysis.MMAnalyzer;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;
import java.util.regex.Pattern;

public class management {
    private static ArrayList<String> stop = new ArrayList<>();

    static {
        try {
            stop = readStop("D:\\stop.txt");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<String> readStop(String file) throws IOException {
        InputStreamReader is = new InputStreamReader(new FileInputStream(file), "utf-8");
        BufferedReader br = new BufferedReader(is);
        String line = br.readLine();
        while (line != null) {
            stop.add(line);
            line = br.readLine();
        }
        br.close();
        return stop;
    }

    public static HashSet<String> Split(String str) {
        HashSet<String> result = new HashSet<>();
        //先读取停用词

        MMAnalyzer analyzer = new MMAnalyzer();
        String[] cutWordResult = null;
        String tempCutWordResult = null;
        try {
            tempCutWordResult = analyzer.segment(str, " ");
            //tempCutWordResult.replaceAll("\\d+","");
        } catch (IOException e) {
            e.printStackTrace();
        }
        cutWordResult = tempCutWordResult.split(" ");
        ArrayList<String> l = new ArrayList<String>(Arrays.asList(cutWordResult));
        l.removeAll(stop);
        l.removeIf(s -> Pattern.compile("\\d+").matcher(s).find());

        for (String s : l) {
            result.add(s);
        }
        return result;
    }

    public static HashMap<String, Double> Split_TF(String str) {
        HashMap<String, Double> result = new HashMap<>();
        //先读取停用词

        MMAnalyzer analyzer = new MMAnalyzer();
        int lenth = 0;
        String[] cutWordResult = null;
        String tempCutWordResult = null;
        try {
            tempCutWordResult = analyzer.segment(str, " ");
            //tempCutWordResult.replaceAll("\\d+","");
        } catch (IOException e) {
            e.printStackTrace();
        }
        cutWordResult = tempCutWordResult.split(" ");
        ArrayList<String> l = new ArrayList<String>(Arrays.asList(cutWordResult));
        l.removeAll(stop);
        l.removeIf(s -> Pattern.compile("\\d+").matcher(s).find());
        lenth = l.size();
        for (String s : l) {
            if (result.containsKey(s)) {
                result.put(s, ((result.get(s) * lenth) + 1.0) / lenth);
                //System.out.println(s+result.get(s));
            } else {
                result.put(s, 1.0 / lenth);
            }
        }

        return result;
    }

/*
*得到匹配的 词，utf, jtf,
 */
    public static HashMap<String, double[]> match(String user, String job) {
        HashMap<String, Double> s_user = Split_TF(user);
        HashMap<String, Double> s_job = Split_TF(job);
        HashMap<String, double[]> match = new HashMap<>();

        Set< Map.Entry<String, Double> > job_k = s_job.entrySet();
//        String temp="";

        for (Map.Entry<String, Double> k : job_k) {
            if (s_user.containsKey(k.getKey())) {
                double a[] = new double[2];
                a[1] = k.getValue();
                a[0] = s_user.get(k.getKey());
                //System.out.println(k.getKey()+a[0]+a[1]);
                match.put(k.getKey(), a);
            }
        }
        return match;
    }

    public static int score(String s) {
        if (s.equals("中专")) {
            return 1;
        } else if (s .equals("高中") ) {
            return 2;
        } else if (s .equals("大专") ) {
            return 3;
        } else if (s.equals("本科") ) {
            return 4;
        } else if (s .equals("硕士") ) {
            return 5;
        } else if (s .equals("博士") ) {
            return 6;
        } else {
            return 0;
        }

    }

    public static int salary(String s) {
        if (s.equals("0000000000")) {
            return 1;
        } else if (s.equals("0000001000")) {
            return 1;
        } else if (s.equals("0100002000")) {
            return 1;
        } else if (s.equals("0200104000")) {
            return 2;
        } else if (s.equals("0400106000")) {
            return 3;
        } else if (s.equals("0600108000")) {
            return 4;
        } else if (s.equals("0800110000")) {
            return 5;
        } else if (s.equals("1000115000")) {
            return 6;
        } else if (s.equals("1500125000")) {
            return 7;
        } else {
            return 8;
        }
    }

    public static int salary(int n) {
        if (n<4000) {
            return 1;
        }else if (n<8000) {
            return 2;
        } else if (n<12000) {
            return 3;
        } else if (n<16000) {
            return 4;
        } else if (n<20000) {
            return 5;
        } else if (n<30000) {
            return 6;
        } else if (n<50000) {
            return 7;
        } else{
            return 8;
        }

    }


}
