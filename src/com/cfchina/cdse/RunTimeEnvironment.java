package com.cfchina.cdse;

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
import java.util.*;

/**
 * <p>���������ļ���ȡ��ϵͳ��������������Ϣ���ṩgetXXX()������������ʹ�á�</p>
 *
 * <p>Copyright: ��Ȩ (c) 2002</p>
 * <p>Company: �׺�����������޹�˾</p>
 * @author: CDSE��Ŀ��
 * @version 1.0
 * @see   EnvironmentConfigureFileHandler
 *
 */
public class RunTimeEnvironment {

    /** �ྲ̬���� */
    private static RunTimeEnvironment runTimeEnvironment = null;
    /** ���ڽ��������ļ���ȡ��dom�� */
    private EnvironmentConfigureFileHandler enConHandle = null;
    /** Ӧ�÷������û��� */
    private String webUser = null;
    /** Ӧ�÷������û����� */
    private String webPassword = null;
    /** ������URL */
    private String jndiDes = null;
    /** ��·�� */
    private String domainDir = null;
    /** ��Ϣ���ӹ��� */
    private String queueConnectionFactory = null;
    /** ��URl��ȡ����Ϣ������ */
    private String recvQueueName = null;
    /** ��URl�ķ�����Ϣ�Ķ����� */
    private String sendQueueName = null;
    /** ȡ����Ϣ������ */
    private String recvQueueNameOnly = null;
    /** ������Ϣ������ */
    private String sendQueueNameOnly = null;
    /** ��Ϣ���������Ĺ��� */
    private String contextFactory = null;
    /** ��־�ļ�·�� */
    private String logDir = null;
	/** ���ٱ����ļ�·�� */
    private String reportDir = null;
    /** ��־�ļ���С */
    private String logSize = null;
    /** ��־�ļ���ǰ�� */
    private String currentPoint = null;
    /** java��ϢURL */
    private String jmsUrl = null;
    /** �������п��������� */
    public String[] cardType = null;
    /** �������п���log�ļ��� */
    public String[] logFile = null;
    /** ��Ԫ�� */
    private Element basic = null;
    /** RunTimeEnvironmentԪ�� */
    private Element environment = null;
    /** LogDefinitionԪ�� */
    private Element logDefinition = null;
	/** ReportԪ�� */
    private Element report = null;
    /** LogFileTypeԪ�� */
    private Element logFileType = null;
    /** �������� */
    private int errorCode = 0;
    /** ������Ϣ */
    private String errorString = null;
    /** ��־��Ϣ */
    private String logString = "";
    /** �����ļ���ȡ�����־ */
    private static boolean readSuccess = true;
    /** �����ļ�dom�� */
    private Document configureDoc = null;
    private ArrayList activeStrategyList = new ArrayList();
    /** ����ʱ���� */
    private long strategyListenerTime = 1000;

    /**
     * ���õ�ǰ��Ч����
     * @param activeStrategyList   ��ǰ��Ч����
     */
    public void setActiveStrategyList(ArrayList activeStrategyList) {
        this.activeStrategyList = activeStrategyList;
    }

    /**
     * ���ص�ǰ��Ч����.
     */
    public ArrayList getActiveStrategyList() {
        return this.activeStrategyList;
    }

    /**
     * ���ü���ʱ����
     * @param strategyListenerTime   ����ʱ����
     */
    public void setStrategyListenerTime(long strategyListenerTime) {
        this.strategyListenerTime = strategyListenerTime;
    }

    /**
     * ���ؼ���ʱ����.
     */
    public long getStrategyListenerTime() {
        return this.strategyListenerTime;
    }

    /**
     * ����java��ϢURL
     * @param jmsUrl   java��ϢURL
     */
    public void setJmsUrl(String jmsUrl) {
        this.jmsUrl = jmsUrl;
    }

    /**
     * ����java��ϢURL.
     */
    public String getJmsUrl() {
        return this.jmsUrl;
    }

    /**
     * ����Ӧ�÷������û���
     * @param webUser   Ӧ�÷������û���
     */
    public void setWebUser(String webUser) {
        this.webUser = webUser;
    }

    /**
     * ����Ӧ�÷������û���.
     */
    public String getWebUser() {
        return this.webUser;
    }

    /**
     * ����Ӧ�÷������û�����
     * @param webPassword   Ӧ�÷������û�����
     */
    public void setWebPassword(String webPassword) {
        this.webPassword = webPassword;
    }

    /**
     * ����Ӧ�÷������û�����.
     */
    public String getWebPassword() {
        return this.webPassword;
    }

    /**
     * ����������URL
     * @param jndiDes   ������URL
     */
    public void setJndiDes(String jndiDes) {
        this.jndiDes = jndiDes;
    }

    /**
     * ����������URL.
     */
    public String getJndiDes() {
        return this.jndiDes;
    }

    /**
     * ������·��
     * @param domainDir   ��·��
     */
    public void setDomainDir(String domainDir) {
        this.domainDir = domainDir;
    }

    /**
     * ������·��.
     */
    public String getDomainDir() {
        return this.domainDir;
    }

    /**
     * ������Ϣ���ӹ���
     * @param queueConnectionFactory   ��Ϣ���ӹ���
     */
    public void setQueueConnectionFactory(String queueConnectionFactory) {
        this.queueConnectionFactory = queueConnectionFactory;
    }

    /**
     * ������Ϣ���ӹ���.
     */
    public String getQueueConnectionFactory() {
        return this.queueConnectionFactory;
    }

    /**
     * ���ô�URl��ȡ����Ϣ������
     * @param recvQueueName   ��URl��ȡ����Ϣ������
     */
    public void setRecvQueueName(String recvQueueName) {
        this.recvQueueName = recvQueueName;
    }

    /**
     * ���ش�URl��ȡ����Ϣ������.
     */
    public String getRecvQueueName() {
        return this.recvQueueName;
    }

    /**
     * ���ô�URl�ķ�����Ϣ�Ķ�����
     * @param sendQueueName   ��URl�ķ�����Ϣ�Ķ�����
     */
    public void setSendQueueName(String sendQueueName) {
        this.sendQueueName = sendQueueName;
    }

    /**
     * ���ش�URl�ķ�����Ϣ�Ķ�����.
     */
    public String getSendQueueName() {
        return this.sendQueueName;
    }

    /**
     * ������Ϣ���������Ĺ���
     * @param contextFactory   ��Ϣ���������Ĺ���
     */
    public void setContextFactory(String contextFactory) {
        this.contextFactory = contextFactory;
    }

    /**
     * ������Ϣ���������Ĺ���.
     */
    public String getContextFactory() {
        return this.contextFactory;
    }

	/**
	 * ������־�ļ�·��
	 * @param logDir   ��־�ļ�·��
	 */
	public void setReportDir(String reportDir) {
		this.reportDir = reportDir;
	}

	/**
	 * ������־�ļ�·��.
	 */
	public String getReportDir() {
		return this.reportDir;
	}

    /**
     * ������־�ļ�·��
     * @param logDir   ��־�ļ�·��
     */
    public void setLogDir(String logDir) {
        this.logDir = logDir;
    }

    /**
     * ������־�ļ�·��.
     */
    public String getLogDir() {
        return this.logDir;
    }

    /**
     * ������־�ļ���С
     * @param logSize   ��־�ļ���С
     */
    public void setLogSize(String logSize) {
        this.logSize = logSize;
    }

    /**
     * ��־�ļ���С.
     */
    public String getLogSize() {
        return this.logSize;
    }

    /**
     * ������־�ļ���ǰ��
     * @param currentPoint   ��־�ļ���ǰ��
     */
    public void setCurrentPoint(String currentPoint) {
        this.currentPoint = currentPoint;
    }

    /**
     * ������־�ļ���ǰ��.
     */
    public String getCurrentPoint() {
        return this.currentPoint;
    }

    /**
     * ���ð������п���������
     * @param cardType   �������п���������
     */
    public void setCardType(String[] cardType) {
        this.cardType = cardType;
    }

    /**
     * ���ذ������п���������.
     */
    public String[] getCardType() {
        return this.cardType;
    }

    /**
     * ���ð������п���log�ļ���
     * @param logFile   �������п���log�ļ���
     */
    public void setLogFile(String[] logFile) {
        this.logFile = logFile;
    }

    /**
     * ���ذ������п���log�ļ���.
     */
    public String[] getLogFile() {
        return this.logFile;
    }

    /**
     * ���ÿ�����
     * @param cardType   ������
     */
    public void setCardTypeBySuffix(String cardType, int suffix) {
        this.cardType[suffix] = cardType;
    }

    /**
     * ���ؿ�����.
     */
    public String getCardTypeBySuffix(int suffix) {
        return this.cardType[suffix];
    }

    /**
     * ����LogDefinitionԪ��
     * @param logDefinition   LogDefinitionԪ��
     */
    public void setLogDefinition(Element logDefinition) {
        this.logDefinition = logDefinition;
    }

    /**
     * ����LogDefinitionԪ��.
     */
    public Element getLogDefinition() {
        return this.logDefinition;
    }

	/**
	 * ����ReportԪ��
	 * @param Report   ReportԪ��
	 */
	public void setReport(Element Report) {
		this.report = Report;
	}

	/**
	 * ����LogDefinitionԪ��.
	 */
	public Element getReport() {
		return this.report;
	}

    /**
     * ���ø�Ԫ��
     * @param basic   ��Ԫ��
     */
    public void setBasic(Element basic) {
        this.basic = basic;
    }

    /**
     * ���ظ�Ԫ��.
     */
    public Element getBasic() {
        return this.basic;
    }

    /**
     * ����RunTimeEnvironmentԪ��
     * @param basic   RunTimeEnvironmentԪ��
     */
    public void setEnvironment(Element environment) {
        this.environment = environment;
    }

    /**
     * ����RunTimeEnvironmentԪ��.
     */
    public Element getEnvironment() {
        return this.environment;
    }

    /**
     * ����LogFileTypeԪ��
     * @param basic   LogFileTypeԪ��
     */
    public void setLogFileType(Element logFileType) {
        this.logFileType = logFileType;
    }

    /**
     * ����LogFileTypeԪ��.
     */
    public Element getLogFileType() {
        return this.logFileType;
    }
    /**
     * ���ô������
     * @param errorCode   �������
     */
    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * ���ش������.
     */
    public int getErrorCode() {
        return this.errorCode;
    }

    /**
     * ���ô�����Ϣ
     * @param errorString   ������Ϣ
     */
    public void setErrorString(String errorString) {
        this.errorString = errorString;
    }

    /**
     * ���ش�����Ϣ.
     */
    public String getErrorString() {
        return this.errorString;
    }

    /**
     * ������־��Ϣ
     * @param logString   ��־��Ϣ
     */
    public void setLogString(String logString) {
        this.logString = logString;
    }

    /**
     * ������־��Ϣ.
     */
    public String getLogString() {
        return this.logString;
    }

    /**
     * ���������ļ�ȡ��dom������dom����ȡ�ø�������Ϣ��ֵ����Ӧ���ԡ�
     *
     * @throws CDSEException ���������ļ����domȡ��������Ϣ�쳣ʱ�׳�
     */
    private RunTimeEnvironment() throws CDSEException {
        try {
            if (enConHandle == null) {
                enConHandle = EnvironmentConfigureFileHandler.getInstance();
                logString = enConHandle.getLogString();
                enConHandle.setLogString("");
            }
            logString = CDSEUtil.getCurrentTime() +
                "\nStarting to get the Element from configure file \n";

            //ȡ��dom����ȡ�ø�Ԫ��
            basic = enConHandle.getConfigureDoc().getDocumentElement();
        }catch(Exception e){
            errorCode = 100;
            readSuccess = false;
            System.out.println("Get the Element from configure file error!");
            throw new CDSEException(errorCode);
        }
        //��dom��ȡ��������Ϣֵ
        if (loadConfigureFile() < 0) {
            logString = logString +
                "Create the runtime environment Error! \n" +
                errorString;
            errorCode = 101;
            readSuccess = false;
            System.out.println(errorString);
            throw new CDSEException(errorCode);
        }
        errorString = null;
        readSuccess = true;
    }

    /**
     * ȡ��RunTimeEnvironmentʵ����
     *
     * @return RunTimeEnvironmentʵ�� �쳣ʱ����null
     */
    public static RunTimeEnvironment getInstance() {
        if (runTimeEnvironment == null && readSuccess) {
            try {
                runTimeEnvironment = new RunTimeEnvironment();
            }
            catch (Exception e) {
                return null;
            }
        }
        return runTimeEnvironment;
    }

    /**
     * �������ž��ߺ�����ݣ������µ������ļ�
     *
     * @return �ļ����ɽ�� true:���ɳɹ�
     *                      false:ʧ��
     */
    public boolean saveConfigureFile() {

        boolean success = true;

        //Ϊ����XML��׼��������DocumentBuilderFactoryʵ��,ָ��DocumentBuilder
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = null;
        try {
            db = dbf.newDocumentBuilder();
        }
        catch (ParserConfigurationException pce) {
            pce.printStackTrace();
            success = false;
            return success;
        }

        Document doc = null;
        doc = db.newDocument();

        //�����ǽ���XML�ĵ����ݵĹ��̣��Ƚ�����Ԫ��"Basic"
        Element basic = doc.createElement("Basic");
        //��Ԫ��������ĵ�
        doc.appendChild(basic);

        //����RunTimeEnvironmentԪ�أ���ӵ�data
        Element runTimeEnvironment = doc.createElement("RunTimeEnvironment");
        runTimeEnvironment.setAttribute("DomainDir", this.domainDir);
        runTimeEnvironment.setAttribute("JNDIDES", this.jndiDes);
        runTimeEnvironment.setAttribute("QueueConnectionFactory",
                                        this.queueConnectionFactory);
        runTimeEnvironment.setAttribute("RecvQueueName", this.recvQueueNameOnly);
        runTimeEnvironment.setAttribute("SendQueueName", this.sendQueueNameOnly);
        runTimeEnvironment.setAttribute("WebPassword", this.webPassword);
        runTimeEnvironment.setAttribute("WebServerContextFactory",
                                        this.contextFactory);
        runTimeEnvironment.setAttribute("WebUser", this.webUser);
        runTimeEnvironment.setAttribute("JmsContextUrl", this.jmsUrl);
        runTimeEnvironment.setAttribute("StrategyListenerTime", String.valueOf(this.strategyListenerTime));

        basic.appendChild(runTimeEnvironment);

        //����LogDefinitionԪ�أ���ӵ�runTimeEnvironment
        Element logDefinition = doc.createElement("LogDefinition");
        logDefinition.setAttribute("CurrentPoint", this.currentPoint);
        logDefinition.setAttribute("LogDir", this.logDir);
		logDefinition.setAttribute("ReportDir", this.reportDir);
        logDefinition.setAttribute("Size", this.logSize);
		runTimeEnvironment.appendChild(logDefinition);
		//
		Element report = doc.createElement("Report");
        report.setAttribute("Dir", this.reportDir );
		runTimeEnvironment.appendChild(report);


        //����LogFileTypeԪ�أ���ӵ�LogDefinition
        Element logFileType = doc.createElement("LogFileType");
        logDefinition.appendChild(logFileType);

        try {
            //����typeԪ�أ���ӵ�CreditCardTypeԪ��
           // System.out.println("cardType.length  ==========" + cardType.length);
            for (int i = 0; i < this.cardType.length; i++) {
                Element type = doc.createElement("type");
                type.setAttribute("Name", cardType[i]);
                type.setAttribute("fileName", logFile[i]);
                logFileType.appendChild(type);
            }
        }
        catch (Exception e) {
            success = false;
            return success;
        }
        enConHandle.setConfigureDoc(doc);
        int refresh = enConHandle.refreshConfigureFile();
        if (refresh < 0) {
            success = false;
        }

        return success;
    }

    /**
     * ���ݶ�ȡ�����ļ���Dom����ʼ����������
     *
     * @return ��ʼ����� 1:�ɹ�
     *                    -1:ʧ��
     */
    private int loadConfigureFile(){
//System.out.println("step 1 ============");
        int loadResult = 1;
        try {
            environment = (Element) basic.getElementsByTagName(
                "RunTimeEnvironment").item(0);
            logDefinition = (Element) environment.getElementsByTagName(
                "LogDefinition").item(0);
			report = (Element) environment.getElementsByTagName(
                "Report").item(0);
            logDir = logDefinition.getAttribute("LogDir");
			reportDir=report.getAttribute("Dir");
            logSize = logDefinition.getAttribute("Size");
            currentPoint = logDefinition.getAttribute("CurrentPoint");
            logFileType = (Element) logDefinition.getElementsByTagName(
                "LogFileType").item(0);
//System.out.println("step 2 ============");
        }
        catch (Exception e) {
            errorCode = 9001;
            errorString =
                "Read the RunTimeEnvironment and logDefinition Element from configure error!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        }
        //Get the Environment Information
        //webServer = environment.getAttribute("WebServer");
        try{
            strategyListenerTime = Long.parseLong(environment.getAttribute(
                "StrategyListenerTime"));
            if (strategyListenerTime < 1000){
                errorCode = 9002;
                errorString = "StrategyListenerTimeС��1000!";
                System.out.println(errorString);
                loadResult = -1;
                return loadResult;
            }
        }catch(NumberFormatException e){
            errorCode = 9003;
            errorString = "Read StrategyListenerTime error!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        }

        jmsUrl = environment.getAttribute("JmsContextUrl");
        webUser = environment.getAttribute("WebUser");
        webPassword = environment.getAttribute("WebPassword");
        jndiDes = environment.getAttribute("JNDIDES");
        domainDir = environment.getAttribute("DomainDir");
        recvQueueNameOnly = environment.getAttribute(
            "RecvQueueName");
        sendQueueNameOnly = environment.getAttribute("SendQueueName");
        queueConnectionFactory
            = environment.getAttribute("QueueConnectionFactory");
        contextFactory = environment.getAttribute("WebServerContextFactory");

        //��������ֵ�Ƿ�Ϊ�գ�Ϊ�����׳�����
        if (jmsUrl.length() == 0){
            errorCode = 9004;
            errorString = "JmsContextUrl element value is empty!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        // Huang Shaicheng 2004-2-14
        /*}else if(jndiDes.length() == 0){
            errorCode = 9005;
            errorString = "JNDIDES element value is empty!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult; */
        }else if(domainDir.length() == 0){
            errorCode = 9006;
            errorString = "DomainDir element value is empty!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        }else if(recvQueueNameOnly.length() == 0){
            errorCode = 9007;
            errorString = "RecvQueueName element value is empty!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        }else if(sendQueueNameOnly.length() == 0){
            errorCode = 9008;
            errorString = "SendQueueName element value is empty!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        }else if(queueConnectionFactory.length() == 0){
            errorCode = 9009;
            errorString = "QueueConnectionFactory element value is empty!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        }else if(contextFactory.length() == 0) {
            errorCode = 9010;
            errorString = "WebServerContextFactory element value is empty!";
            System.out.println(errorString);
            loadResult = -1;
            return loadResult;
        }
        //recvQueueName = jndiDes + "Queue/" + recvQueueNameOnly;
        recvQueueName =recvQueueNameOnly;
        //sendQueueName = jndiDes + "Queue/" + sendQueueNameOnly;
        sendQueueName = sendQueueNameOnly;
//System.out.println("step 3 ============");
        logString = logString +
            "The Configure Information read from file is :\n";
        logString = logString + "WebUser = " + webUser + "\n";
        logString = logString + "WebPassword = " + webPassword + "\n";
        logString = logString + "JndiDes = " + jndiDes + "\n";
        logString = logString + "DomainDir = " + domainDir + "\n";
        logString = logString + "QueueConnectionFactory = " +
            queueConnectionFactory + "\n";
        logString = logString + "RecvQueueName = " + recvQueueName + "\n";
        logString = logString + "SendQueueName = " + sendQueueName + "\n";
        logString = logString + "WebServerContextFactory = " + contextFactory +
            "\n";

        try {
            NodeList cardTypes = logFileType.getElementsByTagName("type");
            Element typeTag = null;
            cardType = new String[cardTypes.getLength()];
            logFile = new String[cardTypes.getLength()];
            //��ʼ������Ϣ
            for (int i = 0; i < cardTypes.getLength(); i++) {
                typeTag = (Element) cardTypes.item(i);
                String cardName = typeTag.getAttribute("Name");
                logFile[i] = typeTag.getAttribute("fileName");
                cardType[i] = cardName;
//System.out.println("step 6 ============");
            }
        }
        catch (Exception e) {
            errorCode = 9011;
            errorString = "Read the type element from configure Error!";
            loadResult = -1;
            return loadResult;
        }
        enConHandle.closeFileHandle();

        /*
           System.out.println("webServer = " +webServer );
           System.out.println("webUser = " +webUser );
           System.out.println("webPassword = " +webPassword );
           System.out.println("jndiDes = " +jndiDes );
            System.out.println("domainDir = " +domainDir );
             System.out.println("queueConnectionFactory = " +queueConnectionFactory );
            System.out.println("recvQueueName = " +recvQueueName );
            System.out.println("sendQueueName = " +sendQueueName );
            System.out.println("logQueueName = " +logQueueName );
            System.out.println("contextFactory = " +contextFactory );
            System.out.println("serverPort = " +serverPort );
            System.out.println("subJndiDir = " +subJndiDir );
            System.out.println("subPhyDir = " +subPhyDir );
            System.out.println("logDir = " +logDir );
            System.out.println("logSize = " +logSize );
            System.out.println("currentPoint = " +currentPoint );
            System.out.println("strategyQueueName = " +strategyQueueName );
            System.out.println("personalCardLogFile = " +personalCardLogFile );
            System.out.println("companyCardLogFile = " +companyCardLogFile );
         */
        return loadResult;
    }

    /*
     public static void main(String args[])throws CDSEException{
           RunTimeEnvironment handler = RunTimeEnvironment.getInstance();
           handler.saveConfigureFile();
     }
     */
}
