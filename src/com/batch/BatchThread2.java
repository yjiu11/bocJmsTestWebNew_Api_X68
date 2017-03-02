package com.batch;

import java.io.FileNotFoundException;
import java.io.PrintStream;

import com.boc.cdse.CDSEMessage;
import com.boc.cdse.CDSEResult;
import com.cfchina.cdse.CDSEUtil;

public class BatchThread2 implements Runnable {
	private String content;
	PrintStream ps;
	long begin = System.currentTimeMillis();
	private int i=0;
	public BatchThread2(String c){
		this.content = c;
	}
	@Override
	public void run() {
		
		 try {
			ps=new PrintStream("D:\\log.log");
			System.setOut(ps);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		// TODO Auto-generated method stub
		 while(true){
			 synchronized(this){
				 if(i<=1000){
					 System.out.println("当前是第"+i+"条");
					 String resultString=CDSEMessage.getInstance().process(content);
			         //System.out.println("resultString:"+resultString);
			         CDSEResult result = new CDSEResult(CDSEUtil.stringToXml(resultString));
			         System.out.println(Thread.currentThread().getName()+"------------------------------");
				 }else{
					 long end = System.currentTimeMillis();
			         System.out.println("共用时："+(end-begin));
			         break;
				 }
				i++;
			 }
		 }
	}

}
