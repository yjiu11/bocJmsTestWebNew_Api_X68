package com.cfchina.cdse;

import java.util.*;
import java.io.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.DOMException;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

/**
 * <p>CDSEUtil���ṩCDSEͨ�õķ�����</p>
 *
 * <p>Copyright: ��Ȩ (c) 2002</p>
 * <p>Company: �׺�����������޹�˾</p>
 * @author: CDSE��Ŀ��
 * @version 1.0
 * @see   PersonalCreditCardHandler
 */

public class CDSEUtil {
    public final static String FILETYPE = "xml";
    public CDSEUtil() {
    }

    /**
     * getCurrentTime()������ȡ��õ�ǰϵͳʱ�䣨��ʽΪyyyy��mm��dd��hhʱmm��ss��)
     *
     * @return  String ��ǰ��ϵͳʱ��
     */
    public static String getCurrentTime() {
        Calendar c = new GregorianCalendar();

        String dateANDTime = c.get(GregorianCalendar.YEAR) + "��" +
            (c.get(GregorianCalendar.MONTH) + 1) + "��" +
            c.get(GregorianCalendar.DAY_OF_MONTH) +
            "��" + c.get(GregorianCalendar.HOUR_OF_DAY) + "ʱ" +
            c.get(GregorianCalendar.MINUTE) + "��" +
            c.get(GregorianCalendar.SECOND) +
            "��";
        return dateANDTime;
    }

    /**
     * getCurrentTime()������ȡ��õ�ǰϵͳʱ�䣨��ʽΪyyyy��mm��dd��hhʱmm��ss��)
     *
     * @return  String ��ǰ��ϵͳʱ��
     */
    public static String getTime() {
        Calendar c = new GregorianCalendar();

        String dateANDTime = c.get(GregorianCalendar.YEAR) +
            toAppointedLen(Integer.toString(c.get(GregorianCalendar.MONTH) + 1),
                           2) +
            toAppointedLen(Integer.toString(c.get(GregorianCalendar.
                                                  DAY_OF_MONTH)), 2) +
            toAppointedLen(Integer.toString(c.get(GregorianCalendar.HOUR_OF_DAY)),
                           2) + ":" +
            toAppointedLen(Integer.toString(c.get(GregorianCalendar.MINUTE)), 2) +
            ":" +
            toAppointedLen(Integer.toString(c.get(GregorianCalendar.SECOND)), 2);
        return dateANDTime;
    }

    /**
     * getCurrentDate()������ȡ��õ�ǰ���ڣ���ʽΪyyyy��mm��dd��)
     *
     * @return  String ��ǰ������
     */
    public static String getCurrentDate() {
        Calendar c = new GregorianCalendar();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH) + 1;
        int date = c.get(Calendar.DAY_OF_MONTH);

        String dateANDTime = year + "��" + month + "��" + date + "��";
        return dateANDTime;
    }

    /**
     * initFiles()������ȡָ��Ŀ¼���ƶ���׺���������ļ�
     *
     * @param dir   ָ��Ŀ¼
     * @return      �ļ������鼯
     */
    public static String[] initFiles(String dir) {
        String initFiles[] = null;
        File dirFile = null;
        try {
            dirFile = new File(dir);
        }
        catch (Exception ex) {
            System.out.println("Error in getFile dirFile" + ex.getMessage());
        }
        if (dirFile.isDirectory()) {
            Filter filter = new Filter(FILETYPE);
            initFiles = dirFile.list(filter);
        }
        return initFiles;
    }

    /**
     * getChineseStr()�������ַ����������ʾ
     *
     * @param Str   ��ʼ�ַ���
     * @return      ����
     */
    public static String getChineseStr(String Str) {
        String chineseStr = null;
        try {
            chineseStr = new String(Str.getBytes("8859_1"), "gb2312");
        }
        catch (UnsupportedEncodingException ex) {
            System.out.println(ex.toString());
        }
        return chineseStr;
    }

    public static String toAppointedLen(String str, int length) {
        String result = "";
        if (str == null) {
            return "";
        }
        result = str;
        for (int i = str.length() + 1; i <= length; i++) {
            result = "0" + result;
        }
        return result;
    }

    public static Document stringToXml(String xmlString) {
        if (xmlString == null) {
            return null;
        }
        Document doc = null;
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = null;
        try {
            db = dbf.newDocumentBuilder();
            doc = db.parse(new InputSource(new StringReader(xmlString)));
        }
        catch (Exception pce) {
            pce.printStackTrace();

        }
        return doc;
    }

    public static String xmlToString(Document doc) {
        if (doc == null) {
            return null;
        }
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer transformer = null;
        try {
            transformer = tFactory.newTransformer();
        }
        catch (TransformerConfigurationException ex) {
            ex.printStackTrace();
        }
        if (transformer != null) {
            try {
                StringWriter sw = new StringWriter();
                transformer.transform(new DOMSource(doc), new StreamResult(sw));
                return sw.toString();
            }
            catch (TransformerException te) {
                te.printStackTrace();
            }
        }
        return null;
    }

    public static String xmlToString(Node node) {
        if (node == null) {
            return null;
        }
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer transformer = null;
        try {
            transformer = tFactory.newTransformer();
        }
        catch (TransformerConfigurationException ex) {
            ex.printStackTrace();
        }
        if (transformer != null) {
            try {
                StringWriter sw = new StringWriter();

                transformer.transform(new DOMSource(node), new StreamResult(sw));
                return sw.toString();
            }
            catch (TransformerException te) {
                te.printStackTrace();
            }
        }
        return null;
    }

    public static int outputFile(Document doc,String  fileFullName) {
        int success = 0;
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer transformer = null;
        try {
            transformer = tFactory.newTransformer();
            DOMSource source = null;
            source = new DOMSource(doc);
            StreamResult result = null;
            result = new StreamResult(new File(fileFullName));
            transformer.transform(source, result);
        }
        catch (TransformerException ex1) {
            success = -1;
            //errorString = "���������ļ�����(Read Configure Step)";
        }
        return 0;
    }


    static public String GetAttrValue(String sAttrValue) {
      int nLen=0;
      // Check whether attribute value contain ",',>,<,&
      String[] sAttrValueArr1 = ExtractSubString(sAttrValue,"&");
      nLen = sAttrValueArr1.length;

      if (nLen > 1) {
           sAttrValue="";
        for (int i=0; i < nLen; i++) {
          if (i < nLen-1) {
            sAttrValue = sAttrValue + sAttrValueArr1[i] + "&amp;";
          }else {
           sAttrValue = sAttrValue + sAttrValueArr1[i];
          }
        }

      }

      String[] sAttrValueArr2 = ExtractSubString(sAttrValue,"\"");
      nLen = sAttrValueArr2.length;

      if (nLen > 1) {
            sAttrValue="";
        for (int i=0; i < nLen; i++) {
          if (i < nLen-1) {
            sAttrValue = sAttrValue + sAttrValueArr2[i] + "&quot;";
          }else {
           sAttrValue = sAttrValue + sAttrValueArr2[i];
          }
        }

      }

      String[] sAttrValueArr3= ExtractSubString(sAttrValue,"'");
      nLen = sAttrValueArr3.length;

      if (nLen > 1) {
        sAttrValue="";
        for (int i=0; i < nLen; i++) {
          if (i < nLen-1) {
            sAttrValue = sAttrValue + sAttrValueArr3[i] + "&apos;";
          }else{
           sAttrValue = sAttrValue + sAttrValueArr3[i];
          }
        }

      }

      String[] sAttrValueArr4= ExtractSubString(sAttrValue,">");
      nLen = sAttrValueArr4.length;

      if (nLen > 1) {
            sAttrValue="";
        for (int i=0; i < nLen; i++) {
          if (i < nLen-1) {
            sAttrValue = sAttrValue + sAttrValueArr4[i] + "&gt;";
          }else {
           sAttrValue = sAttrValue + sAttrValueArr4[i];
          }
        }

      }

      String[] sAttrValueArr5= ExtractSubString(sAttrValue,"<");
      nLen = sAttrValueArr5.length;

      if (nLen > 1) {
        sAttrValue ="";
        for (int i=0; i < nLen; i++) {
          if (i < nLen-1) {
            sAttrValue = sAttrValue +sAttrValueArr5[i] + "&lt;";
          }else {
           sAttrValue = sAttrValue +sAttrValueArr5[i];
          }
        }

      }
      return sAttrValue;
    }


    static public String[] ExtractSubString(String sText, String sDelimiter) {
      int nCount = 0;
      int nIndex = 0;

      do{
        ++nCount;
        ++nIndex;
        nIndex = sText.indexOf(sDelimiter, nIndex);
      } while (nIndex != -1);

      String[] sSubStr = new String[nCount];
      nIndex = 0;
      int nEndIndex =0;
      for (int i = 0; i <nCount; i++) {
        nEndIndex = sText.indexOf(sDelimiter, nIndex);
        if (nEndIndex == -1)
          sSubStr[i] = sText.substring(nIndex);
        else
          sSubStr[i] = sText.substring(nIndex, nEndIndex);
        nIndex = nEndIndex + 1;

      }

      return sSubStr;
    }

}
