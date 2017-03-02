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
		//读取内容
		String content = getContent(f);
		//决策
		 long begin = System.currentTimeMillis();
         String resultString=CDSEMessage.getInstance().process(content);
         System.out.println("resultString:"+resultString);
         CDSEResult result = new CDSEResult(CDSEUtil.stringToXml(resultString));
         long end = System.currentTimeMillis();
         System.out.println("共用时："+(end-begin));
		
	}
	public static String getContent(File f) throws Exception{
		FileInputStream in = new FileInputStream(f);
		int temp = 0;                            //接收读取的每一个内容
        byte b[] = new byte[(int) f.length()];//文件中所有内容读取到此数组中
        int len =0;                                //文件中的数据个数
        while((temp = in.read())!=-1){
            //每次读取内容给temp变量，temp!=-1，则表示文件没读完
            b[len] = (byte)temp;
            len++;
        }
        in.close();
        String result = new String(b,0,len);
       // System.out.println(result);
        return result;
	}
}
