package com.cfchina.cdse.message;

import java.io.Serializable;
import java.util.Properties;

import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueReceiver;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.naming.Context;
import javax.naming.InitialContext;

import com.cfchina.cdse.RunTimeEnvironment;




public class MessageControl {
    private static MessageControl messageControl_Instance = null;

    private Context context = null;
    private QueueConnectionFactory queueConnectionFactory = null;
  //  private JMSConnectionFactory jmsConnectionFactory = null;
    private boolean transacted = false;
    private int acknowledgementMode = Session.AUTO_ACKNOWLEDGE;
    private RunTimeEnvironment en = null;
    private QueueConnection resultQueueConnection = null;
    private QueueSession resultQueueSession = null;
    private Queue resultQueue = null;
    private QueueSender resultQueueSender = null;
  
    private String queueConnectionFactoryName ="javax/jms/JmsConnectionFactory";
    private String sendQueueName = "CDSReqQ";
    private MessageControl() {
        en = RunTimeEnvironment.getInstance();
    }

    public static MessageControl getQueueHandle() {
        if (messageControl_Instance == null) {
            messageControl_Instance = new MessageControl();
        }
        return messageControl_Instance;
    }
   
    //得到上下文对象
    private Context getContext() throws Exception {
        Properties properties = null;
        String url = en.getJmsUrl();
        try {
            properties = new Properties();
            properties.put(Context.INITIAL_CONTEXT_FACTORY,en.getContextFactory());
            properties.put(Context.PROVIDER_URL, url);
            context = (Context)new InitialContext(properties);
            return context;
        }catch (Exception e) {
            throw e;
        }
    }
    //得到消息队列连接工厂
 
    private QueueConnectionFactory getQueueConnectionFactory() throws Exception {
        if (queueConnectionFactory == null) {
            Context context = getContext();
            Object obj = context.lookup(queueConnectionFactoryName);
            queueConnectionFactory = (QueueConnectionFactory) obj;
        }
        return queueConnectionFactory;
    }
    
   //得到结果队列连接
    private QueueConnection getResultQueueConnection() throws Exception {
        if (resultQueueConnection == null) {
            resultQueueConnection = getQueueConnectionFactory().createQueueConnection();
            resultQueueConnection.start();
        }
        return resultQueueConnection;
    }
  
    //得到结果队列session
    private QueueSession getResultQueueSession() throws Exception {
        if (resultQueueSession == null) {
            resultQueueSession = getResultQueueConnection().createQueueSession(
                transacted,
                acknowledgementMode);
        }
        return resultQueueSession;
    }

    //得到结果发送队列
    private Queue getResultSendQueue() throws Exception {
        if (resultQueue == null) {
            Object obj = getContext().lookup(sendQueueName);
            resultQueue = (Queue) obj;
        }
        return resultQueue;
    }

    private QueueSender getResultQueueSender() throws Exception {
        if (resultQueueSender == null) {
            resultQueueSender = getResultQueueSession().createSender(getResultSendQueue());
        }
        return resultQueueSender;
    }
    
   // 结果队列发送实例
    public void resultSendObject(Serializable message,int flag) throws Exception {

        Context context = null;
        QueueConnectionFactory queueConnectionFactory = null;
        boolean transacted = false;
        int acknowledgementMode = Session.AUTO_ACKNOWLEDGE;

        QueueConnection resultQueueConnection = null;
        QueueSession resultQueueSession = null;
        Queue resultQueue = null;
        QueueSender resultQueueSender = null;
        Object obj1= null;

        context = getContext();
        Object obj = context.lookup(en.getQueueConnectionFactory());
        queueConnectionFactory = (QueueConnectionFactory) obj;

        resultQueueConnection = queueConnectionFactory.createQueueConnection();
        resultQueueSession = resultQueueConnection.createQueueSession(transacted,acknowledgementMode);
        if (flag == 0){
            //System.out.println("send doc");
            obj1 = getContext().lookup(en.getRecvQueueName());
        }else{
           //System.out.println("send result");
            obj1 = getContext().lookup(en.getSendQueueName());
        }
        resultQueue = (Queue) obj1;
        
        resultQueueSender = resultQueueSession.createSender(resultQueue);

        ObjectMessage objectMessage = resultQueueSession.createObjectMessage();
        objectMessage.clearBody();
        objectMessage.setObject(message);
 
        resultQueueSender.send(objectMessage); 
  
        if (transacted) {
            resultQueueSession.commit();
        }
    }
    //接收发布的实例
    public Message receiveSendObject() throws Exception {
        Context context = null;

        Queue queue = null;
        context = getContext();
        //queue = (Queue) context.lookup(en.getSendQueueName());
        queue = (Queue) context.lookup(en.getRecvQueueName());
        QueueConnectionFactory queueconnectionfactory = null;
        queueconnectionfactory =										
            (QueueConnectionFactory) getContext().lookup(en.getQueueConnectionFactory());

        QueueConnection queueconnection = null;
        queueconnection = queueconnectionfactory.createQueueConnection();

        QueueSession queuesession = null;
        queuesession =queueconnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
        // 创建 QueueReceiver.
        QueueReceiver queuereceiver = null;
        queuereceiver = queuesession.createReceiver(queue);

        queueconnection.start();

        Message message = null;

        message = queuereceiver.receive(1);
        //if (message instanceof ObjectMessage){
        //   objectmessage = (ObjectMessage)message;
        //}
        System.out.println("receiveSendObject() end "+message);
        return message;

    }

     public void close() throws Exception {
       if (resultQueueSender != null) {
         resultQueueSender.close();
       }
       if (resultQueueSession != null) {
         resultQueueSession.close();
       }
       if (resultQueueConnection != null) {
         resultQueueConnection.close();
       }
     }
    
}
