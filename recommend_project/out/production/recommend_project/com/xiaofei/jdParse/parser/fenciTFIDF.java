package com.xiaofei.jdParse.parser;

import com.xiaofei.jdParse.dataparse.database;
import jeasy.analysis.MMAnalyzer;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class fenciTFIDF {
    private static ArrayList<String> stop =new ArrayList<>();

    public static HashMap<String, Double> getTFIDF(String str)
    {
        //先读取停用词
        try {
            stop= readStop("d:/stop.txt");
        } catch (IOException e) {
            e.printStackTrace();
        }
        MMAnalyzer analyzer = new MMAnalyzer();
        String[] cutWordResult = null;
        String tempCutWordResult = null;
        try {
            tempCutWordResult = analyzer.segment(str, " ");
        } catch (IOException e) {
            e.printStackTrace();
        }
        cutWordResult = tempCutWordResult.split(" ");
        ArrayList<String> l = new ArrayList<String>(Arrays.asList(cutWordResult));
        l.removeAll(stop);
        String [] cutWordResult2 = l.toArray(new String[0]);
        HashMap<String, Double> tfidf= TFIDF(cutWordResult2);
        return tfidf;

    }


    public static HashMap<String, Double> TFIDF(String[] cutWordResult) {
        HashMap<String, Double> tfidf= new HashMap<>();
        int wordNum = cutWordResult.length;
        int wordtf = 0;
        for (int i = 0; i < wordNum; i++) {
            wordtf = 0;
            if (cutWordResult[i] != " ") {
                for (int j = 0; j < wordNum; j++) {
                    if (i != j) {
                        if (cutWordResult[i].equals(cutWordResult[j])) {
                            cutWordResult[j] = " ";
                            wordtf++;
                        }
                    }
                }
                double idf= database.getIdf(cutWordResult[i]);
                tfidf.put(cutWordResult[i],  (double)  (++wordtf)*idf /wordNum  );
                cutWordResult[i] = " ";
            }
        }
        return tfidf;
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




}

