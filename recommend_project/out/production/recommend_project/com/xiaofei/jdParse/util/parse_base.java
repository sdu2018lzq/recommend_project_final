package com.xiaofei.jdParse.util;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.Consts;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

import java.io.File;

public class parse_base {

    public static void testResumeParser(String url, String fname, String client_id, String client_secret) throws Exception {
        byte[] bytes = org.apache.commons.io.FileUtils.readFileToByteArray(new File(fname));
        String data = new String(Base64.encodeBase64(bytes), Consts.UTF_8);

        HttpPost httpPost = new HttpPost(url);
        httpPost.setEntity(new StringEntity(data, Consts.UTF_8));

        // 设置头字段
        httpPost.setHeader("id", client_id);
        httpPost.setHeader("secret", client_secret);
        httpPost.addHeader("content-type", "application/json");

        // 设置内容信息
        JSONObject json = new JSONObject();
        json.put("file_name", fname);   // 文件名
        json.put("resume_base", data); // 经base64编码过的文件内容
        StringEntity params = new StringEntity(json.toString());
        httpPost.setEntity(params);

        // 发送请求
        HttpClient httpclient = new DefaultHttpClient();
        HttpResponse response = httpclient.execute(httpPost);

        // 处理返回结果
        String resCont = EntityUtils.toString(response.getEntity(), Consts.UTF_8);
        //System.out.println(resCont);

        JSONObject res = new JSONObject(resCont);
        System.out.println(res.toString(4));
    }
    public static void main(String[] args) throws Exception {
        //支持图片解析，提取简历头像，提取简历原文本，且使用快速解析模式
        String url = "http://api.xiaoxizn.com/v1/parser/parse_base?avatar=1&handle_image=1&rawtext=1&parse_mode=fast";

        String fname = "e:/desktop/简历_李兆瑞.pdf";  //替换为您的文件名
        String client_id = "your_client_id";    //替换为您的ID
        String client_secret = "your_client_secret";    //替换为您的密匙

        testResumeParser(url, fname, client_id, client_secret);
    }
}