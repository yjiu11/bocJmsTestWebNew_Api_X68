package com.cfchina.cdse.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.util.MessageResources;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */



public class CdsAction extends Action {
    /**
     * �����û��ύ������<code>preProcess</code>������<code>processs</code>
     * ������<code>postProcess</code> method��˳���ִ�С�
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
    public ActionForward perform(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
    {
        System.out.println("Begin to process " + mapping.getPath());

        ActionForward af    = null;

        af = process(mapping, form, request, response);
        System.out.println("End processing " + mapping.getPath());
        return af;
    }
    /**
     * �����û��ύ������AutoloanAction���������ʵ��
     * �˷�����
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
        HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
    {
        return (mapping.findForward("success"));
    }

}
