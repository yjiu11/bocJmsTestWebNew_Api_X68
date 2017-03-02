package com.cfchina.cdse.action;

import java.io.*;
import java.util.*;
import javax.jms.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;

import org.apache.struts.action.*;
import org.w3c.dom.*;

import com.boc.cdse.CDSEResult;
import com.cfchina.cdse.*;
import com.cfchina.cdse.message.*;

public class GetDomQueueAction extends CdsAction {
        /**
         * �����û��ύ������<code>processs</code>
         * ��ִ�С�
         *
         * @param mapping ����ѡ�����ʵ����ActionMapping
         * @param form Ϊ��������ṩ��ActionForm
         * @param request ���ڴ����HTTP����
         * @param response ��������HTTP
         *
         * @return ϵͳ������ҳ��·��
         *
         * @throws IOException �������IO�������
         * @throws ServletException �������Servlet����
         */
        public ActionForward process(ActionMapping mapping, ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) throws
            IOException, ServletException {

            ActionForward af = null;
            //ȡ�õ�ǰaction
            String action = request.getParameter("action");
            if (action == null) {
                action = "getStrategy";
            }

            if (action.equals("getStrategy")) {
                CDSEResult result = null;
                //�����������Ϣ������
                MessageControl messageControl = MessageControl.getQueueHandle();
                try {
                    Message obj = messageControl.receiveSendObject();
                    System.out.println("########"+obj.toString());
                    if (obj instanceof ObjectMessage) {
                        java.io.Serializable cdseResult = ( (ObjectMessage) obj).
                            getObject();
                        if (cdseResult instanceof CDSEResult) {
                            result = (CDSEResult) ( ( (ObjectMessage) obj).
                                                   getObject());
                        } else if (cdseResult instanceof org.w3c.dom.Document) {
                        	System.out.println("########"+cdseResult.toString());
                            result = new CDSEResult( (org.w3c.dom.Document)
                                                    cdseResult);
                        } else if (cdseResult instanceof java.lang.String) {
                            result = new CDSEResult( (String) cdseResult);
                        }
                        outputFile(result);
                    } else if (obj instanceof TextMessage) {
                        org.w3c.dom.Document resultForm = null;
                        resultForm = getAppform(obj);
                        result = new CDSEResult(resultForm);
                        outputFile(result);
                    } else {
                        af = mapping.findForward("errors");
                        request.setAttribute("errorMessage", "û��ȡ����Ϣ��");
                        return af;
                    }
                    obj = messageControl.receiveSendObject();
                    messageControl.close();
                } catch (Exception e) {
                    System.out.println("receive object failed! ");
                    e.printStackTrace();
                    af = mapping.findForward("errors");
                    request.setAttribute("errorMessage", "ȡ����Ϣʧ�ܣ�");
                    return af;
                }

                request.setAttribute("result", result);

                //����cds�ӿ�
                af = mapping.findForward("showResult");
            }

            return af;
        }

        private org.w3c.dom.Document getAppform(Message msg) {
            if (msg == null) {
                return null;
            }
            org.w3c.dom.Document appForm = null;
            String msgStr = null;
            try {
                if (msg instanceof ObjectMessage) {
                    ObjectMessage objectMessage = (ObjectMessage) msg;
                    if ( (objectMessage.getObject() != null)) {
                        if (objectMessage.getObject() instanceof java.lang.String) {
                            msgStr = (String) objectMessage.getObject();
                            appForm = CDSEUtil.stringToXml( (String) objectMessage.
                                getObject());
                        } else if (objectMessage.getObject() instanceof org.w3c.dom.
                                   Document) {
                            msgStr = CDSEUtil.xmlToString( (org.w3c.dom.Document)
                                objectMessage.getObject());
                            appForm = (org.w3c.dom.Document) objectMessage.
                                getObject();
                        }
                    }
                } else {
                    if (msg instanceof TextMessage) {
                        TextMessage textMessage = (TextMessage) msg;
                        msgStr = (String) textMessage.getText();
                        appForm = CDSEUtil.stringToXml( (String) textMessage.
                            getText());
                    } else {
                        if (msg instanceof StreamMessage) {
                            StreamMessage streamMessage = (StreamMessage) msg;
                            String doc = new String();
                            streamMessage.writeString(doc);
                            msgStr = doc;
                            appForm = CDSEUtil.stringToXml( (String) doc);
                        }
                    }
                }
                //stringToFile("d:/FTP/CDS/result/" + CDSEUtil.getCurrentTime() + ".XML", msgStr);
                //System.out.println("receive a message:" + msgStr);
            } catch (Exception e) {
                //System.out.println("receive a message:" + msgStr);
                //stringToFile("d:/FTP/CDS/result/" + CDSEUtil.getCurrentTime() + ".XML", msgStr);
                e.printStackTrace();
            }
            return appForm;
        }

        private int outputFile(Document doc) {
            int success = 0;
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = null;
            try {
                transformer = tFactory.newTransformer();
                DOMSource source = null;
                source = new DOMSource(doc);
                StreamResult result = null;
                CDSEResult cdseResult = new CDSEResult(doc);
                result = new StreamResult(new File("D:/BOCCDSE/Configure_CDSE/" +
                                                   cdseResult.getApplicationId() +
                                                   "_cdseresult.xml"));
                transformer.transform(source, result);
            } catch (TransformerException ex1) {
                success = -1;
                //errorString = "���������ļ�����(Read Configure Step)";
            }
            return 0;
        }

        private int outputFile(CDSEResult cdseResult) {
            int success = 0;
            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = null;
            try {
                transformer = tFactory.newTransformer();
                DOMSource source = null;
                source = new DOMSource(cdseResult.toXML());
                StreamResult result = null;
                result = new StreamResult(new File(
                    "D:/BOCCDSURGENCY/SimpleAppl/DATA/" +
                    cdseResult.getApplicationId() +
                    ".xml"));

                transformer.transform(source, result);
            } catch (TransformerException ex1) {
                success = -1;
                //errorString = "���������ļ�����(Read Configure Step)";
            }
            return 0;
        }

    }
