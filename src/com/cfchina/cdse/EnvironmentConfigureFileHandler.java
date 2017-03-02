package com.cfchina.cdse;

import java.io.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.DOMException;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.parsers.ParserConfigurationException;
import java.util.*;

/**
 * <p>���������ļ�,ȡ��dom��;���������ļ���</p>
 *
 * <p>Copyright: ��Ȩ (c) 2002</p>
 * <p>Company: �׺�����������޹�˾</p>
 * @author: CDSE��Ŀ��
 * @version 1.0
 *
 */
public class EnvironmentConfigureFileHandler {
    /** �ྲ̬���� */
    private static EnvironmentConfigureFileHandler configureFileHandle_Instance = null;
    /** dom�� */
    private Document configureDoc = null;
    /** �����ļ����·�� */
    private String xmlName = "com/cfchina/cdse/configfiles/ConfigureFile.xml";
    /** �����ļ� */
    private File fileName = new File(getClass().getClassLoader().getResource(
        xmlName).toString().substring(6));
    /** ����� */
    private int errorCode = 0;
    /** ������Ϣ */
    private String errorString = null;
    /** ��־��Ϣ */
    private String logString = "";

    /**
     * ����dom��
     */
    public Document getConfigureDoc() {
        return this.configureDoc;
    }

    /**
     * ����dom��
     * @param configureDoc   dom��
     */
    public void setConfigureDoc(Document configureDoc) {
        this.configureDoc = configureDoc;
    }

    /**
     * ���ش����
     */
    public int getErrorCode() {
        return this.errorCode;
    }

    /**
     * ���ô����
     * @param errorCode   The new �����
     */
    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * ���ش�����Ϣ
     */
    public String getErrorString() {
        return this.errorString;
    }

    /**
     * ���ô�����Ϣ
     * @param errorString   ������Ϣ
     */
    public void setErrorString(String errorString) {
        this.errorString = errorString;
    }

    /**
     * ������־��Ϣ
     */
    public String getLogString() {
        return this.logString;
    }

    /**
     * ������־��Ϣ
     * @param logString   ��־��Ϣ
     */
    public void setLogString(String logString) {
        this.logString = logString;
    }

    /**
     * ���캯��������openConfigureFile()���������ļ�ȡ��dom����
     *
     * @throws CDSEException ���������ļ��쳣ʱ�׳�
     */
    private EnvironmentConfigureFileHandler() throws CDSEException{

        logString = CDSEUtil.getCurrentTime();
        logString = logString +
            "\nStarting to open the environment configure file:\n" +
            xmlName + "\n";

        //���������ļ�ȡ��dom��
        int openResult = openConfigureFile();

        //������������׳��쳣
        if (openResult != 1) {
            logString = logString + CDSEUtil.getCurrentTime() + errorString +
                "\n";
            System.out.println(logString);
            throw new CDSEException(openResult);
        }
        else {
            logString = logString + CDSEUtil.getCurrentTime() +
                "\nThe configure file is opened" +
                "\n";
        }
       // System.out.println(logString);
    }

    /**
     * ȡ����ʵ����
     *
     * @throws CDSEException ���������ļ��쳣ʱ�׳�
     */
    public static EnvironmentConfigureFileHandler getInstance() throws CDSEException{
        if (configureFileHandle_Instance == null) {
            configureFileHandle_Instance = new EnvironmentConfigureFileHandler();
        }
        return configureFileHandle_Instance;
    }

    /**
     * ���������ļ�ȡ��dom����
     *
     * @return �������
     */
    private int openConfigureFile() {
        errorCode = 1;
        if (configureDoc != null) {
            System.out.println(configureDoc != null);
            return errorCode;
        }
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = null;
        try {
            db = dbf.newDocumentBuilder();
        }
        catch (ParserConfigurationException ex) {
            errorCode = 110;
            errorString = "��������DocumentBuilder����(Read Configure Step)";
            ex.printStackTrace();
            return errorCode;
        }

        try {
            configureDoc = db.parse(getClass().getClassLoader().
                                    getResourceAsStream(xmlName));
        }
        catch (org.xml.sax.SAXException e) {
            errorCode = 101;
            errorString = "�����ļ�Parse����SAXException��(Read Configure Step)";
            e.printStackTrace();
            return errorCode;
        }
        catch (DOMException e) {
            errorCode = 102;
            errorString = "�����ļ�Parse����DOMException(Read Configure Step)";
            e.printStackTrace();
            return errorCode;

        }
        catch (IOException e) {
            errorCode = 103;
            errorString = "�����ļ�Parse����IOException(Read Configure Step)";
            e.printStackTrace();
            return errorCode;
        }
        return errorCode;
    }

    /**
     * ���������ļ���
     *
     * @return ���½�� 0:����
     *                  -1:�쳣
     */
    public int refreshConfigureFile() {
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer transformer = null;
        try {
            transformer = tFactory.newTransformer();
            DOMSource source = null;
            source = new DOMSource(configureDoc);
            StreamResult result = null;
            result = new StreamResult(fileName);
            transformer.transform(source, result);
        }
        catch (TransformerException ex1) {
            errorCode = -1;
            errorString = "���������ļ�����(Read Configure Step)";
        }
        return 0;
    }

    /**
     * ����dom��Ϊ�ա�
     *
     */
    public void closeFileHandle() {
        configureDoc = null;
    }

}
