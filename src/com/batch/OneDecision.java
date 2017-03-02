package com.batch;

import java.io.File;
import java.io.FileInputStream;

import com.boc.cdse.CDSEMessage;
import com.boc.cdse.CDSEResult;
import com.cfchina.cdse.CDSEUtil;

public class OneDecision {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		File f = new File("src/input.xml");
		//��ȡ����
		String content = getContent(f);
		//����
		 long begin = System.currentTimeMillis();
         String resultString=CDSEMessage.getInstance().process(content);
         System.out.println("resultString:"+resultString);
         CDSEResult result = new CDSEResult(CDSEUtil.stringToXml(resultString));
         long end = System.currentTimeMillis();
         System.out.println("����ʱ��"+(end-begin));
		
	}
	public static String getContent(File f) throws Exception{
		FileInputStream in = new FileInputStream(f);
		int temp = 0;                            //���ն�ȡ��ÿһ������
        byte b[] = new byte[(int) f.length()];//�ļ����������ݶ�ȡ����������
        int len =0;                                //�ļ��е����ݸ���
        while((temp = in.read())!=-1){
            //ÿ�ζ�ȡ���ݸ�temp������temp!=-1�����ʾ�ļ�û����
            b[len] = (byte)temp;
            len++;
        }
        in.close();
        String result = new String(b,0,len);
       // System.out.println(result);
        return result;
	}
}
