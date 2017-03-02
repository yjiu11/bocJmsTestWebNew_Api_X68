package com.batch;

import java.io.File;
import java.io.FileInputStream;

public class BatchDecisionRun {
//1万条：共用时388433,
	//多线程：413986
	//1000条多线程：55960，两个不同的，55546
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		File f = new File("src/input.xml");
		//读取内容
		String content = getContent(f);
		//决策
		 
		 BatchThread bat = new BatchThread(content);
		 BatchThread bat2 = new BatchThread(content);
		 Thread t1 = new Thread(bat,"t1");
		 Thread t2 = new Thread(bat2,"t2");
		 t1.start();t2.start();
		//两个3880，三个3818，六个3800
	}
	public static String getContent(File f) throws Exception{
		FileInputStream in = new FileInputStream(f);
		int temp = 0;                            //接收读取的每一个内容
        byte b[] = new byte[(int) f.length()];//文件中所有内容读取到此数组中
        int len =0;                                //文件中的数据个数
        while((temp = in.read())!=-1){
            b[len] = (byte)temp;
            len++;
        }
        in.close();
        String result = new String(b,0,len);
       // System.out.println(result);
        return result;
	}
}
