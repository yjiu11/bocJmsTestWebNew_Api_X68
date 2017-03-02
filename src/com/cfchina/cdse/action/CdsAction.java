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
     * 处理用户提交的请求，<code>preProcess</code>方法，<code>processs</code>
     * 方法和<code>postProcess</code> method被顺序地执行。
     *
     * @param mapping 用于选择这个实例的ActionMapping
     * @param form 为这个请求提供的ActionForm
     * @param request 正在处理的HTTP请求
     * @param response 正创建的HTTP
     *
     * @return 系统处理后的页面路径
     *
     * @throws IOException 如果出现IO错误出现
     * @throws ServletException 如果出现Servlet出现
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
     * 处理用户提交的请求，AutoloanAction的子类可以实现
     * 此方法。
     *
     * @param mapping 用于选择这个实例的ActionMapping
     * @param form 为这个请求提供的ActionForm
     * @param request 正在处理的HTTP请求
     * @param response 正创建的HTTP
     *
     * @return 系统处理后的页面路径
     *
     * @throws IOException 如果出现IO错误出现
     * @throws ServletException 如果出现Servlet出现
     */
    public ActionForward process(ActionMapping mapping, ActionForm form,
        HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
    {
        return (mapping.findForward("success"));
    }

}
