import math

import jieba
from collections import Counter
import csv

import pymysql as pymysql
import tensorflow.compat.v1 as tf

tf.disable_v2_behavior()
# import tensorflow as tf
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import scale
from sklearn.preprocessing import Normalizer
from sklearn.preprocessing import MinMaxScaler

s = ''
user_idf = {}
result = []
test_data = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
jobid = []
score = []


def get_salary_number(self, salary):
    salary = str(salary)
    unit = salary[-5:-2]
    salary = salary[2:-5]
    if unit == "元/天":
        return float(salary) * 365, float(salary) * 365
    else:
        min_salary = float(salary.split("-")[0])
        max_salary = float(salary.split("-")[1])
        if unit == "千/月":
            return min_salary * 12000, max_salary * 12000
        elif unit == "万/月":
            return min_salary * 120000, max_salary * 120000
        elif unit == "万/年":
            return min_salary * 10000, max_salary * 10000
        else:
            return "", ""


def user_tfidf(row: str):
    data = []
    xx = jieba.cut(row)
    for j in xx:
        if j not in s:
            data.append(j)  # 追加写入data列表，得到的数据格式为：a=['我 爱 学习 我 喜欢 北京']
    result = dict(Counter(data))
    re = {}
    for r in result:
        if r in user_idf:
            re[r] = (float(result[r]) / len(result)) * float(user_idf[r])
    return re


def job_tfidf(row: str):
    re = {}
    words = row.split('/')
    for word in words:
        try:
            re[word.split(':')[0]] = float(word.split(':')[1])
        except:
            pass
    return re


def edu(education: str):
    if education == '中专':
        return 1
    elif education == '高中':
        return 2
    elif education == '大专':
        return 3
    elif education == '本科':
        return 4
    elif education == '硕士':
        return 5
    elif education == '博士':
        return 6
    else:
        return 0

def industryto(d : str):
    ans = []
    #print("def ans in")
    with open('E:\\Desktop\\recommend_project\\py\\pro2dus.csv', 'r', encoding='utf-8') as f:
        reader = csv.reader(f)

        for line in reader:
            if (d==line[0]):
                ans.append(line[1])
    #print("ans:",ans)
    return ans


if __name__ == '__main__':
    a = 0
    # min_desire_salary
    # max_desire_salary
    # desire city
    # live city
    user = [120000, 180000, '北京', '北京', '大专',
            '1、 负责法大大电子合同平台SaaS服务的推广、销售工作，负责区域或者行业的销售任务完成，对业绩目标达成负责；'
            '2、 通过行业、协会、论坛等场合，对法大大产品进行现场演示、推介、交流需求合作；'
            '3、 负责对市场不同阶段的市场规划以及重点项目、重点市场的推进以及做好客情维护；'
            '4、 负责客户汇报方案的组织编写及汇报工作，完成项目标书的编写及投标工作，后期也能协调公司内部跟踪产品对接上线及后期运营情况。'
            '5、负责监测、搜集、整理和分析各种市场信息，及时了解和总结市场反馈，对产品迭代给出建议，为公司提供决策建议。任职要求：'
            '1、 大专以上学历，通信工程、计算机、电子类、市场营销等专业优先，对软件、服务、网络等IT领域有基本了解优先；'
            '2、至少2年以上2B的销售经验，任职期间业绩TOP者优先；有法律、技术背景优先考虑，对移动互联网和SAAS市场有一定的理解优先；'
            '3、有在企业级客户及KA方向有工作经验的优先考虑、有一定行业经验/人脉资源，熟悉金融或医疗行业优先；'
            '4、 为人诚实正直、学习能力强、善于整合资源、工作勤奋、有韧性、富有工作热情、具备良好的职业道德、有强烈的目标意识与进取精神', '软件工程']
    f = open("stop.txt", "r")  # 设置文件对象

    s = f.read()
    f.close()  # 关闭文件
    with open('ourproject_job_idf.csv', 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        # print(type(reader))
        # salary = get_salary_number('2-3千/月)

        for word in reader:
            user_idf[word[0]] = word[1]

    file_csv = []
    file1 = []
    user_label = user_tfidf(user[5])
    industylist=industryto(user[6])

    industyname=["计算机", "互联网", "通信", "电子", "销售", "客服", "会计", "金融", "银行", "保险", "生产", "机械",
                   "汽车", "运营", "采购", "物流", "服装", "建筑", "房地产", "设计", "市场", "媒体", "广告", "人事",
                   "行政", "教育", "培训", "生物", "制药", "化工", "医疗", "顾问", "法律", "餐饮", "交通", "翻译"]
    tmpurl=""
    for trueindusty in industylist:
        tmpurl = 'E:\\Desktop\\recommend_project\\py\\everyPosition\\position' + trueindusty + '.csv'
        with open(tmpurl, 'r', encoding='utf-8') as f:
            reader = csv.reader(f)

            for line in reader:
                try:
                    # user_id null
                    # job_no 0
                    # min_desire_salary 16
                    line.append(str(user[0]))
                    # max_desire_salary 17
                    line.append(str(-user[1]))
                    # min_com_salary 7
                    line[7] = '-' + line[7]
                    # max_com_salary 8
                    # gt_max 18
                    if int(line[8]) + int(line[17]) > 0:
                        line.append('1')
                    else:
                        line.append('0')
                    # lt_min 19
                    if int(line[7]) + int(line[16]) > 0:
                        line.append('1')
                    else:
                        line.append('0')
                    # require 9
                    if line[9] == '-1':
                        line[9] = '999'
                    # same com desire 20
                    if user[2] == line[2]:
                        line.append('1')
                    else:
                        line.append('0')

                    # same com live 21
                    if user[3] == line[2]:
                        line.append('1')
                    else:
                        line.append('0')
                    # user edu 22
                    user_edu = edu(user[4])
                    line.append(str(user_edu))
                    # job edu 23
                    job_edu = -edu(line[10])
                    line.append(str(job_edu))
                    # gt edu 24
                    if job_edu <= user_edu:
                        line.append('1')
                    else:
                        line.append('0')
                    # 处理标签
                    job_label = job_tfidf(line[15])

                    OR = {}
                    AND = []
                    l = 0
                    for user_word in user_label:
                        l += 1
                        if user_word in job_label:
                            AND.append(user_word)
                        OR[user_word] = '0'
                    for job_word in job_label:
                        OR[job_word] = '0'
                    # user_len 25
                    line.append(str(len(user_label)))
                    # and 26
                    line.append(str(len(AND)))
                    # r and user 27
                    line.append(str(len(AND) / len(user_label)))
                    # r and job 28
                    line.append(str(len(AND) / len(job_label)))
                    # r user or 29
                    line.append(str(len(user_label) / len(OR)))
                    # r job or 30
                    line.append(str(len(job_label) / len(OR)))
                    # r and or 31
                    line.append(str(len(AND) / len(OR)))

                    # cos 32
                    numerator = 0
                    denominator_user = 0
                    denominator_job = 0

                    for word in OR:

                        if word in AND:
                            numerator += user_label[word] * job_label[word]
                        if word in user_label:
                            denominator_user += user_label[word] * user_label[word]
                        if word in job_label:
                            denominator_job += job_label[word] * job_label[word]
                    denominator = math.sqrt(denominator_user * denominator_job)
                    if denominator == 0:
                        line.append('0')
                    else:
                        line.append(str(numerator / denominator))

                    # type 33
                    if user[6] == line[14]:
                        line.append('1')

                    else:
                        line.append('0')

                    # print("line")
                    # print(line)
                    OR.clear()
                    AND.clear()

                    job_label.clear()
                    jobid.append(line[0])
                    file_csv.append(
                        [float(line[16]), float(line[17]), float(line[7]), float(line[8]), float(line[18]),
                         float(line[19]),
                         float(line[9])
                            , float(line[20]), float(line[21]), float(line[22]), float(line[23]), float(line[24]),
                         float(line[25]),
                         float(line[26]), float(line[27]), float(line[28]), float(line[29]), float(line[30]),
                         float(line[31]),
                         float(line[32]), float(line[33])])
                    file1.append(line)


                except Exception as e:
                    # print(e)
                    print(line[0])
                    a += 1
                    print(a)
                    # print(line[15])

    # with open('ourproject_all_positions3.csv', 'r', encoding='utf-8') as f:
    #     reader = csv.reader(f)
    #
    #     for line in reader:
    #         try:
    #             # user_id null
    #             # job_no 0
    #             # min_desire_salary 16
    #             line.append(str(user[0]))
    #             # max_desire_salary 17
    #             line.append(str(-user[1]))
    #             # min_com_salary 7
    #             line[7] = '-' + line[7]
    #             # max_com_salary 8
    #             # gt_max 18
    #             if int(line[8]) + int(line[17]) > 0:
    #                 line.append('1')
    #             else:
    #                 line.append('0')
    #             # lt_min 19
    #             if int(line[7]) + int(line[16]) > 0:
    #                 line.append('1')
    #             else:
    #                 line.append('0')
    #             # require 9
    #             if line[9] == '-1':
    #                 line[9] = '999'
    #             # same com desire 20
    #             if user[2] == line[2]:
    #                 line.append('1')
    #             else:
    #                 line.append('0')
    #
    #             # same com live 21
    #             if user[3] == line[2]:
    #                 line.append('1')
    #             else:
    #                 line.append('0')
    #             # user edu 22
    #             user_edu = edu(user[4])
    #             line.append(str(user_edu))
    #             # job edu 23
    #             job_edu = -edu(line[10])
    #             line.append(str(job_edu))
    #             # gt edu 24
    #             if job_edu <= user_edu:
    #                 line.append('1')
    #             else:
    #                 line.append('0')
    #             # 处理标签
    #             job_label = job_tfidf(line[15])
    #
    #             OR = {}
    #             AND = []
    #             l = 0
    #             for user_word in user_label:
    #                 l += 1
    #                 if user_word in job_label:
    #                     AND.append(user_word)
    #                 OR[user_word] = '0'
    #             for job_word in job_label:
    #                 OR[job_word] = '0'
    #             # user_len 25
    #             line.append(str(len(user_label)))
    #             # and 26
    #             line.append(str(len(AND)))
    #             # r and user 27
    #             line.append(str(len(AND) / len(user_label)))
    #             # r and job 28
    #             line.append(str(len(AND) / len(job_label)))
    #             # r user or 29
    #             line.append(str(len(user_label) / len(OR)))
    #             # r job or 30
    #             line.append(str(len(job_label) / len(OR)))
    #             # r and or 31
    #             line.append(str(len(AND) / len(OR)))
    #
    #             # cos 32
    #             numerator = 0
    #             denominator_user = 0
    #             denominator_job = 0
    #
    #             for word in OR:
    #
    #                 if word in AND:
    #                     numerator += user_label[word] * job_label[word]
    #                 if word in user_label:
    #                     denominator_user += user_label[word] * user_label[word]
    #                 if word in job_label:
    #                     denominator_job += job_label[word] * job_label[word]
    #             denominator = math.sqrt(denominator_user * denominator_job)
    #             if denominator == 0:
    #                 line.append('0')
    #             else:
    #                 line.append(str(numerator / denominator))
    #
    #             # type 33
    #             if user[6] == line[14]:
    #                 line.append('1')
    #
    #             else:
    #                 line.append('0')
    #
    #             # print("line")
    #             # print(line)
    #             OR.clear()
    #             AND.clear()
    #
    #             job_label.clear()
    #             jobid.append(line[0])
    #             file_csv.append(
    #                 [float(line[16]), float(line[17]), float(line[7]), float(line[8]), float(line[18]), float(line[19]),
    #                  float(line[9])
    #                     , float(line[20]), float(line[21]), float(line[22]), float(line[23]), float(line[24]),
    #                  float(line[25]),
    #                  float(line[26]), float(line[27]), float(line[28]), float(line[29]), float(line[30]),
    #                  float(line[31]),
    #                  float(line[32]), float(line[33])])
    #             file1.append(line)
    #
    #
    #         except Exception as e:
    #             # print(e)
    #             print(line[0])
    #             a += 1
    #             print(a)
    #             # print(line[15])

    print("-------------------")
    # print(file_csv)

    # test_data[0] = float(line[16])
    # print(type(test_data[0]))
    # print(line[17])
    # test_data[1] = float(line[17])
    # test_data[2] = float(line[7])
    # test_data[3] = float(line[8])
    # test_data[4] = float(line[18])
    # test_data[5] = float(line[19])
    # test_data[6] = float(line[9])
    # test_data[7] = float(line[20])
    # test_data[8] = float(line[21])
    # test_data[9] = float(line[22])
    # test_data[10] = float(line[23])
    # test_data[11] = float(line[24])
    # test_data[12] = float(line[25])
    # test_data[13] = float(line[26])
    # test_data[14] = float(line[27])
    # test_data[15] = float(line[28])
    # test_data[16] = float(line[29])
    # test_data[17] = float(line[30])
    # test_data[18] = float(line[31])
    # test_data[19] = float(line[32])
    # test_data[20] = float(line[33])
    X_test = file_csv
    X_test_Mn = StandardScaler().fit_transform(X_test)
    bi = MinMaxScaler()
    X_test_cen = bi.fit_transform(X_test)
    x = tf.compat.v1.placeholder(tf.float32, shape=(None, 21), name="X_train")
    y = tf.compat.v1.placeholder(tf.float32, shape=(None, 1), name="Y_train")
    # 定义模型参数

    # 隐藏层为2层
    w = tf.Variable(tf.random_normal([21, 30], stddev=1, seed=1))
    b = tf.Variable(tf.random_normal([30], stddev=1.0, seed=1))

    l1 = tf.nn.sigmoid(tf.matmul(x, w) + b)

    w2 = tf.Variable(tf.random_normal([30, 25], stddev=1.0, seed=1))
    b2 = tf.Variable(tf.random_normal([25], stddev=1.0, seed=1))

    l2 = tf.nn.sigmoid(tf.matmul(l1, w2) + b2)

    w3 = tf.Variable(tf.random_normal([25, 1], stddev=1.0, seed=1))
    b3 = tf.Variable(tf.random_normal([1], stddev=1.0, seed=1))

    # l3 = tf.nn.sigmoid(tf.matmul(l2, w3) + b3)

    # l1=tf.matmul(x,w)+b

    # 定义神经网络的前向传播过程
    # Model = tf.nn.sigmoid(tf.matmul(x,w) + b)
    # Model = tf.nn.tanh(tf.matmul(x, w) + b)

    # Model = tf.nn.sigmoid(tf.matmul(l1, w2) + b2)
    Model = tf.nn.sigmoid(tf.matmul(l2, w3) + b3)

    saver = tf.train.Saver()
    with tf.Session() as sess:
        saver.restore(sess, "./Modeltest3/model.ckpt")
        pred_Y_test = sess.run(Model, feed_dict={x: X_test_cen})
        print(("pred:"))
        for pred in pred_Y_test:
            print("each pred:   ", pred)
            score.append(pred)
    print(len(jobid))
    print(len(score))
    # file_csv.append(line[0], pred_Y_test)
    # print(file_csv)

    # 注意newline
    print('------------------------------')
    i = 0
    ans = []
    target = 0
    while i < 20:
        max = -1
        tmp = 0
        j = 0
        tot = 0
        while j < len(jobid):
            if score[j] == 0.99750495:
                tot += 1
            if file1[j][0] == '99874':
                target = j
            if score[j] >= max:
                max = score[j]
                tmp = j
            j += 1
        ans.append(jobid[tmp])
        print(file1[tmp])
        print("score____________________", score[tmp])
        score[tmp] = 0
        tmp = 0
        i += 1
        print(tot)

    print(file1[target])
    print(score[target])

    with open("gg.csv", "w", newline="") as datacsv:
        # dialect为打开csv文件的方式，默认是excel，delimiter="\t"参数指写入的时候的分隔符
        csvwriter = csv.writer(datacsv, dialect=("excel"))
        # csv文件插入一行数据，把下面列表中的每一项放入一个单元格（可以用循环插入多行）
        csvwriter.writerow([jobid, score])
