package com.batch;

import java.io.File;
import java.io.FileInputStream;

public class BatchDecisionRun {
//1����������ʱ388433,
	//���̣߳�413986
	//1000�����̣߳�55960��������ͬ�ģ�55546
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		File f = new File("src/input.xml");
		//��ȡ����
		String content = getContent(f);
		//����
		 
		 BatchThread bat = new BatchThread(content);
		 BatchThread bat2 = new BatchThread(content);
		 Thread t1 = new Thread(bat,"t1");
		 Thread t2 = new Thread(bat2,"t2");
		 t1.start();t2.start();
		//����3880������3818������3800
	}
	public static String getContent(File f) throws Exception{
		FileInputStream in = new FileInputStream(f);
		int temp = 0;                            //���ն�ȡ��ÿһ������
        byte b[] = new byte[(int) f.length()];//�ļ����������ݶ�ȡ����������
        int len =0;                                //�ļ��е����ݸ���
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
