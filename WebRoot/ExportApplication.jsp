<%--
/**
 *<p>创建客户开户数据页面</p>
 *
 * <p>Copyright: 版权 (c) 2002</p>
 * <p>Company: 首航财务管理有限公司</p>
 * @author: GC系统项目组
 * @version 1.0

 */
--%>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.ArrayList,java.util.Iterator,com.boc.cdse.CDSEResult,com.boc.cdse.SupplResult,java.lang.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	CDSEResult result = null;
	ArrayList suppResultList = null;
    if (request.getAttribute("result") != null){
       result = (CDSEResult)request.getAttribute("result");
		suppResultList= result.getSupplResultList();
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>授信策略结果</title>
</head>
<link rel=stylesheet href="css/gc-css.css">
<script language="javascript">
<!--
	function IsAgreeAuto(flag)
	{
		if(flag=="0")
		{
			document.all.ManualResult.style.display="none";
			document.all.AutoResult.style.display="block";
			document.all.form1.AutoIsAgree[0].checked=true;
			document.all.form1.AutoIsAgree[1].checked=false;
			document.all.form1.MenualIsAgree[0].checked=true;
			document.all.form1.MenualIsAgree[1].checked=false;
			document.all.form1.acceptableDegree[0].checked=true;
		}
		else
		{
			document.all.AutoResult.style.display="none";
			document.all.ManualResult.style.display="block";
			document.all.form1.AutoIsAgree[0].checked=false;
			document.all.form1.AutoIsAgree[1].checked=true;
			document.all.form1.MenualIsAgree[0].checked=false;
			document.all.form1.MenualIsAgree[1].checked=true;
		}
	}
//-->
</script>
<body>
<center>
<table width="99%">
      <tr>
      <td width="50%" align="center">
        <span class="pt12" style = "font-size: 11pt;font-family= '黑体'" >授信策略结果</span>
      </td>
<!--
      <td width="50%" align="right">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <img onclick="javascript:document.form.submit();" src="img/button41.gif" width="120" height="26">
      </td>
-->
      <tr>
</table>

<% if (result != null ) {  %>
<form name="form1" method="post" action="CDS-0030.do?action=SaveResult"> <!--onSubmit="return CheckValid(this);"-->
  <div id="AutoResult" style="display:block">
    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong>授信策略信息</strong></td>
      </tr>
      <tr>
        <td width="32%" align="right" class="BACKGROUND_a">申请人的申请号</td>
        <td width="27%" class="BACKGROUND_c"><image width=2><%=result.getApplicationId()!=null?result.getApplicationId():"" %><input name="applicationId" type="hidden" id="applicationId" value="<%=result.getApplicationId()!=null?result.getApplicationId():"" %>"></td>
        <td width="20%" align="right" class="BACKGROUND_a">申请人随机数ID</td>
        <td width="21%" class="BACKGROUND_c"><image width=2><%=String.valueOf(result.getApplicantRandomDigitID()) %>
          <input name="applicantRandomDigitID" type="hidden" id="applicantRandomDigitID" value="<%=String.valueOf(result.getApplicantRandomDigitID()) %>"></td>
      </tr>
       <tr>
        <td colspan=4 align="center"><strong>评估信息</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">风险度评估值</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getRiskScore()==-1?"&nbsp;":String.valueOf(result.getRiskScore()) %>
          <input name="riskScore" type="hidden" id="riskScore" value="<%=result.getRiskScore()==-1?"":String.valueOf(result.getRiskScore()) %>">          </td>
        <td class="BACKGROUND_a" align="right">使用度评估值</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getUsageScore()==-1?"&nbsp;":String.valueOf(result.getUsageScore()) %>
          <input name="usageScore" type="hidden" id="usageScore" value="<%=result.getUsageScore()==-1?"":String.valueOf(result.getUsageScore()) %>"></td>
      </tr>

       <tr>
        <td class="BACKGROUND_a" align="right">风险度评估值分为(1-10)级</td>
       <td class="BACKGROUND_a"><image width=2>1级风险度最高,10级风险度最低</td>
        <td class="BACKGROUND_a" align="right" >使用度评估值分为(1-10级)</td>
        <td class="BACKGROUND_a"><image width=2>1级使用度最高,10级使用度最低</td>
      </tr>



      <tr>
        <td class="BACKGROUND_a" align="right">风险评分</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getRiskGrade()==-1?"&nbsp;":String.valueOf(result.getRiskGrade()) %>
          <input name="riskGrade" type="hidden" id="riskGrade" value="<%=result.getRiskGrade()==-1?"":String.valueOf(result.getRiskGrade()) %>">          </td>
        <td class="BACKGROUND_a" align="right">使用评分</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getUsageGrade()==-1?"&nbsp;":String.valueOf(result.getUsageGrade()) %>
          <input name="usageGrade" type="hidden" id="usageGrade" value="<%=result.getUsageGrade()==-1?"":String.valueOf(result.getUsageGrade()) %>">          </td>
      </tr>

      <tr>
        <td class="BACKGROUND_a" align="right">本行内部评分</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getCreditScore()==null?"&nbsp;":result.getCreditScore() %>
          <input name="creditScore" type="hidden" id="creditScore" value="<%=result.getCreditScore()==null?"":result.getCreditScore() %>"></td>
          <td height="21" align="right" class="BACKGROUND_a">评分卡编号</td>
        <td class="BACKGROUND_c" colspan=4><%=result.getScorecardID()==null?"&nbsp;":result.getScorecardID() %>          </td>
        </tr>
      <tr>
        
      </tr>
       <tr>
        <td class="BACKGROUND_a" align="right">可证明年收入额</td>
        <td class="BACKGROUND_c" colspan=4><image width=2><%=String.valueOf(result.getAprAnnIncome())%>
          <input name="aprAnnIncome" type="hidden" id=""aprAnnIncome"" value="<%=result.getAprAnnIncome()==null?"":result.getAprAnnIncome() %>"></td>
        </tr>
        <tr>
        <td class="BACKGROUND_a" align="right">投产版本号</td>
        <td class="BACKGROUND_c"><image width=2><%=String.valueOf(result.getIsChallenge())%>
          <input name="aprAnnIncome" type="hidden" id="isChallenge" value="<%=result.getIsChallenge()==null?"":result.getIsChallenge() %>"></td>
          <td class="BACKGROUND_a" align="right">一次、二次决策标识</td>
        <td class="BACKGROUND_c"><image width=2><%=String.valueOf(result.getDecisionPoint())%>
          <input name="aprAnnIncome" type="hidden" id="DecisionPoint" value="<%=result.getDecisionPoint()==null?"":result.getDecisionPoint() %>"></td>
        </tr>
        <tr>
       <td colspan=4 align="center"><strong>产品信息</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">升降级标志</td>
        <td class="BACKGROUND_c"><image width=2><%
		 String  resultId = null;
        switch(result.getHasDownSell()) {
            case 0://1 未经过降级
                resultId= "未经过降级";
                break;
            case 1://2  已经过降级
                 resultId= "已经过降级";
                 break;

            case 2:// 已经过升级
                 resultId= "已经过升级";
                 break;
           default:
                resultId= "";
                break;
        }
		%><%= resultId %>
          <input type="hidden" name="hasDownSell" value="<%= resultId %>"> </td>
                  <td class="BACKGROUND_a" align="right">最终产品的产品号</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getProductCode()==null?"&nbsp;":result.getProductCode()%>
          <input name="productCode" type="hidden" id="productCode" value="<%=result.getProductCode()==null?"":result.getProductCode()%>"></td>
    </tr>
    <tr>
        <td colspan=4 align="center"><strong>主卡授信及额度结果</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡授信结果代码</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getPrincipalResultID()==null?"&nbsp;":result.getPrincipalResultID()%>
          <input name="principalResultID" type="hidden" id="principalResultID" value="<%=result.getPrincipalResultID()==null?"":result.getPrincipalResultID()%>">          </td>
        <td class="BACKGROUND_a" align="right">授信结果描述</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getPrincipalResultDescription()==null?"&nbsp;":result.getPrincipalResultDescription()%>
          <input name="principalResultDescription" type="hidden" id="principalResultDescription" value="<%=result.getPrincipalResultDescription()==null?"":result.getPrincipalResultDescription()%>"></td>
     </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡初始额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getPrincipalInitialLineRMB()==-1?"&nbsp;":String.valueOf(result.getPrincipalInitialLineRMB())%>
          <input name="principalInitialLineRMB" type="hidden" id="principalInitialLineRMB" value="<%=result.getPrincipalInitialLineRMB()==-1?"":String.valueOf(result.getPrincipalInitialLineRMB())%>">          </td>
        <td class="BACKGROUND_a" align="right">主卡初始额度(外币)</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getPrincipalInitialLineFRC() ==-1?"&nbsp;":String.valueOf(result.getPrincipalInitialLineFRC())%>
          <input name="principalInitialLineFRC" type="hidden" id="principalInitialLineFRC" value="<%=result.getPrincipalInitialLineFRC() ==-1?"":String.valueOf(result.getPrincipalInitialLineFRC())%>"></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡取现额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getPrincipalCashAdvanceRMB()==-1?"&nbsp;":String.valueOf(result.getPrincipalCashAdvanceRMB())%>
          <input name="principalCashAdvanceRMB" type="hidden" id="principalCashAdvanceRMB" value="<%=result.getPrincipalCashAdvanceRMB()==-1?"":String.valueOf(result.getPrincipalCashAdvanceRMB())%>"></td>
        <td class="BACKGROUND_a" align="right">主卡取现额度(外币)</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getPrincipalCashAdvanceFRC() ==-1?"&nbsp;":String.valueOf(result.getPrincipalCashAdvanceFRC())%>
          <input name="principalCashAdvanceFRC" type="hidden" id="principalCashAdvanceFRC" value="<%=result.getPrincipalCashAdvanceFRC() ==-1?"":String.valueOf(result.getPrincipalCashAdvanceFRC())%>"></td>
      </tr>
<%
		if (suppResultList!=null){
			int count=0;
			for (Iterator i= suppResultList.iterator(); i.hasNext(); )  {
                            SupplResult supplResult = (SupplResult)i.next();
	%>
        <tr>
        <td colspan=4 align="center">
          <strong>
              附属卡<%=count+1%>授信及额度结果
              <input type="hidden" name="supplID<%=count+1%>" value="<%=supplResult.getSupplID()%>">
              <input type="hidden" name="supplUwReasonCode<%=count+1%>" value="<%=supplResult.getSupplUwReasonCode()%>">
              <input type="hidden" name="supplUwReasonDescription<%=count+1%>" value="<%=supplResult.getSupplUwReasonDescription() ==null?"":supplResult.getSupplUwReasonDescription()%>">
          </strong>        </td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡授信结果代码</td>
        <td class="BACKGROUND_c"><image width=2><%=String.valueOf(supplResult.getSupplResultID() )%>
          <input name="supplResultID<%=count+1%>" type="hidden" id="supplResultID<%=count+1%>" value="<%=String.valueOf(supplResult.getSupplResultID())%>"></td>
        <td class="BACKGROUND_a" align="right">附属卡授信结果描述</td>
        <td class="BACKGROUND_c"><image width=2><%=supplResult.getSupplResultDescription() ==null?"&nbsp;":supplResult.getSupplResultDescription()%>
          <input name="supplResultDescription<%=count+1%>" type="hidden" id="supplResultDescription<%=count+1%>" value="<%=supplResult.getSupplResultDescription() ==null?"":supplResult.getSupplResultDescription()%>"></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡初始额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2><%=supplResult.getSupplInitialLineRMB()==-1?"&nbsp;":String.valueOf(supplResult.getSupplInitialLineRMB())%>
          <input name="supplInitialLineRMB<%=count+1%>" type="hidden" id="supplInitialLineRMB<%=count+1%>" value="<%=supplResult.getSupplInitialLineRMB()==-1?"":String.valueOf(supplResult.getSupplInitialLineRMB())%>"></td>
        <td class="BACKGROUND_a" align="right">附属卡初始额(外币)</td>
        <td class="BACKGROUND_c"><image width=2><%=supplResult.getSupplInitialLineFRC()==-1?"&nbsp;":String.valueOf(supplResult.getSupplInitialLineFRC())%>
          <input name="supplInitialLineFRC<%=count+1%>" type="hidden" id="supplInitialLineFRC<%=count+1%>" value="<%=supplResult.getSupplInitialLineFRC()==-1?"":String.valueOf(supplResult.getSupplInitialLineFRC())%>"></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡取现额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2><%=supplResult.getSupplCashAdvanceRMB()==-1?"&nbsp;":String.valueOf(supplResult.getSupplCashAdvanceRMB())%>
          <input name="supplCashAdvanceRMB<%=count+1%>" type="hidden" id="supplCashAdvanceRMB<%=count+1%>" value="<%=supplResult.getSupplCashAdvanceRMB()==-1?"":String.valueOf(supplResult.getSupplCashAdvanceRMB())%>"></td>
        <td class="BACKGROUND_a" align="right">附属卡取现额(外币)</td>
        <td class="BACKGROUND_c"><image width=2><%=supplResult.getSupplCashAdvanceFRC()==-1?"&nbsp;":String.valueOf(supplResult.getSupplCashAdvanceFRC())%>
          <input name="supplCashAdvanceFRC<%=count+1%>" type="hidden" id="supplCashAdvanceFRC<%=count+1%>" value="<%=supplResult.getSupplCashAdvanceFRC()==-1?"":String.valueOf(supplResult.getSupplCashAdvanceFRC())%>"></td>
      </tr>


<%count++;}
%>
	<input type="hidden" name="supplCount" value="<%=count%>">
<%
}
%>
       <tr>
        <td colspan=4 align="center"><strong>授信及额度决策原因</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">该授信决策的原因代码</td>
        <td class="BACKGROUND_c"><image width=2><%=String.valueOf(result.getUnderwritingReasonCode())%>
          <input name="underwritingReasonCode" type="hidden" id="underwritingReasonCode" value="<%=String.valueOf(result.getUnderwritingReasonCode())%>"></td>
        <td class="BACKGROUND_a" align="right">该授信决策的原因描述</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getUnderwritingReasonDescription()==null?"&nbsp;":result.getUnderwritingReasonDescription()%>
          <input name="underwritingReasonDescription" type="hidden" id="underwritingReasonDescription" value="<%=result.getUnderwritingReasonDescription()==null?"":result.getUnderwritingReasonDescription()%>"></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">该初始额度决策的原因代码</td>
        <td class="BACKGROUND_c"><image width=2><%=String.valueOf(result.getInitLineReasonCode())%>
          <input name="initLineReasonCode" type="hidden" id="initLineReasonCode" value="<%=String.valueOf(result.getInitLineReasonCode())%>"></td>
        <td class="BACKGROUND_a" align="right">决策始额度决策的原因描述</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getInitLineReasonDescription()==null?"&nbsp;":result.getInitLineReasonDescription()%>
          <input name="initLineReasonDescription" type="hidden" id="initLineReasonDescription" value="<%=result.getInitLineReasonDescription()==null?"":result.getInitLineReasonDescription()%>"></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">决策过程记录ID</td>
        <td class="BACKGROUND_c" colspan="3"><image width=2><%-- <%=result.getStrategiesLogID()==null?"&nbsp;":result.getStrategiesLogID()%> --%>
         <!--  <input name="strategiesLogID" type="text" id="strategiesLogID" > -->
          <textarea cols="120" rows="5" style="font-size: 13"><%=result.getStrategiesLogID()==null?"":result.getStrategiesLogID()%></textarea>
       </td>
          
      </tr>

       <tr>
        <td colspan=4 align="center"><strong>签发授信策略</strong></td>
      </tr>



       <tr>
         <td class="BACKGROUND_a" align="right">策略编号</td>
         <td class="BACKGROUND_c"><%=result.getStrategyID()!=null?result.getStrategyID():""%>       </TD>
         <td class="BACKGROUND_a" align="right">授信策略编号</td>
         <td class="BACKGROUND_c"><%=result.getAcquStrategyID()!=null?result.getAcquStrategyID():""%>      </TD> </tr>
       <tr>
         <td class="BACKGROUND_a" align="right">额度策略编号</td>
         <td class="BACKGROUND_c"><%=result.getAmouStrategyID()!=null?result.getAmouStrategyID():""%></td>
         <td class="BACKGROUND_a" align="right">校验规则</td>
         <td class="BACKGROUND_c"><input name="reservedField5" type="text" id="reservedField5" value="<%=result.getReservedField5()!=null?result.getReservedField5():""%>">
         </TD>
       </tr>
       <!--
       <tr>
        <td class="BACKGROUND_a" align="right">主卡策略编号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy0")!=null?request.getAttribute("strategy0"):""%></td>
        <td class="BACKGROUND_a" align="right">主卡策略版本号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy1")!=null?request.getAttribute("strategy1"):""%>      </td></tr>
       <tr>
        <td class="BACKGROUND_a" align="right">主卡升降级后策略编号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy2")!=null?request.getAttribute("strategy2"):""%></td>
        <td class="BACKGROUND_a" align="right">主卡升降级后策略版本号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy3")!=null?request.getAttribute("strategy3"):""%>     </td></tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡额度策略编号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy4")!=null?request.getAttribute("strategy4"):""%></td>
        <td class="BACKGROUND_a" align="right">主卡额度策略版本号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy5")!=null?request.getAttribute("strategy5"):""%>      </td></tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡策略编号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy6")!=null?request.getAttribute("strategy6"):""%></td>
        <td class="BACKGROUND_a" align="right">附属卡策略版本号</td>
        <td class="BACKGROUND_c"><image width=2><%=request.getAttribute("strategy7")!=null?request.getAttribute("strategy7"):""%>      </td></tr>
      //-->
      <tr>
        <td colspan=4 align="center"><strong>其它信息</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">外币汇率</td>
        <td class="BACKGROUND_c" colspan="3"><image width=2><%=result.getExchangeRate()==-1?"&nbsp;":String.valueOf(result.getExchangeRate())%>
          <input name="exchangeRate" type="hidden" id="exchangeRate" value="<%=result.getExchangeRate()==-1?"":String.valueOf(result.getExchangeRate())%>"></td>
      </tr>
      
     
      <tr>
        <td colspan="4"><div align="center"><strong>是否同意<span class="BACKGROUND_a">自动策略结果</span></strong></div></td>
      </tr>
      <tr>
        <td align="right" class="BACKGROUND_a">是否同意自动策略结果</td>
        <td colspan="3" align="right" class="BACKGROUND_a"><div align="left">
          <input name="AutoIsAgree" type="radio" value="0" checked onClick="javascript:IsAgreeAuto('0');">
          是
          <input type="radio" name="AutoIsAgree" value="1" onClick="javascript:IsAgreeAuto('1');">
          否
        </div></td>
        </tr>
    </table>
    <p>
      <img onClick="javascript:document.all.form1.submit();" src="img/button13.gif" width="54" height="26"> </p>
  </div>
  <div id="ManualResult" style="display:none">
    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong>授信策略信息</strong></td>
      </tr>
      <tr>
        <td width="32%" align="right" class="BACKGROUND_a">申请人的申请号</td>
        <td width="27%" class="BACKGROUND_c"><image width=2>
          <%=result.getApplicationId()!=null?result.getApplicationId():"" %></td>
        <td width="20%" align="right" class="BACKGROUND_a">申请人随机数ID</td>
        <td width="21%" class="BACKGROUND_c"><image width=2>
          <%=String.valueOf(result.getApplicantRandomDigitID()) %></td>
      </tr>

       <tr>
        <td colspan=4 align="center"><strong>评估信息</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">风险度评估值</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getRiskScore()==-1?"":String.valueOf(result.getRiskScore()) %></td>
        <td class="BACKGROUND_a" align="right">使用度评估值</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getUsageScore()==-1?"&nbsp;":String.valueOf(result.getUsageScore()) %></td>
      </tr>
       <tr>
        <td class="BACKGROUND_a" align="right">风险度评估值分为(1-10)级</td>
       <td class="BACKGROUND_a"><image width=2>1级风险度最高,10级风险度最低</td>
        <td class="BACKGROUND_a" align="right" >使用度评估值分为(1-10级)</td>
        <td class="BACKGROUND_a"><image width=2>1级使用度最高,10级使用度最低</td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">风险评分</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getRiskGrade()==-1?"&nbsp;":String.valueOf(result.getRiskGrade()) %>
          <input name="riskGrade" type="hidden" id="riskGrade" value="<%=result.getRiskGrade()==-1?"":String.valueOf(result.getRiskGrade()) %>">
          </td>
        <td class="BACKGROUND_a" align="right">使用评分</td>
        <td class="BACKGROUND_c"><image width=2><%=result.getUsageGrade()==-1?"&nbsp;":String.valueOf(result.getUsageGrade()) %>
          <input name="usageGrade" type="hidden" id="usageGrade" value="<%=result.getUsageGrade()==-1?"":String.valueOf(result.getUsageGrade()) %>">
          </td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">信用评分</td>
        <td class="BACKGROUND_c" colspan=4>
          <input name="MenualCreditScore" type="text" id="MenualCreditScore" value="<%=result.getCreditScore()==null?"&nbsp;":result.getCreditScore() %>"></td>
        </tr>
        <tr>
       <td colspan=4 align="center"><strong>产品信息</strong></td>

      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">是否经过降级</td>
        <td class="BACKGROUND_c"><image width=2>
          <%= resultId %></td>
                  <td class="BACKGROUND_a" align="right">最终产品的产品号</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getProductCode()==null?"&nbsp;":result.getProductCode()%></td>

    </tr>
    <tr>
        <td colspan=4 align="center"><strong>主卡授信及额度结果</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡授信结果代码</td>
        <td class="BACKGROUND_c"><input name="MenualPrincipalResultID" type="text" id="MenualPrincipalResultID" value="<%=result.getPrincipalResultID()==null?"":result.getPrincipalResultID()%>"></td>
        <td class="BACKGROUND_a" align="right">授信结果描述</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getPrincipalResultDescription()==null?"&nbsp;":result.getPrincipalResultDescription()%></td>

     </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡初始额度(人民币)</td>
        <td class="BACKGROUND_c"><input name="MenualPrincipalInitialLineRMB" type="text" id="MenualPrincipalInitialLineRMB" value="<%=result.getPrincipalInitialLineRMB()==-1?"":String.valueOf(result.getPrincipalInitialLineRMB())%>"></td>
        <td class="BACKGROUND_a" align="right">主卡初始额度(外币)</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getPrincipalInitialLineFRC() ==-1?"&nbsp;":String.valueOf(result.getPrincipalInitialLineFRC())%></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡取现额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getPrincipalCashAdvanceRMB()==-1?"&nbsp;":String.valueOf(result.getPrincipalCashAdvanceRMB())%></td>
        <td class="BACKGROUND_a" align="right">主卡取现额度(外币)</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getPrincipalCashAdvanceFRC() ==-1?"&nbsp;":String.valueOf(result.getPrincipalCashAdvanceFRC())%></td>
      </tr>
<%
		if (suppResultList!=null){
			int count=0;
			for (Iterator i= suppResultList.iterator(); i.hasNext(); )  {
		       SupplResult supplResult = (SupplResult)i.next();
	%>
        <tr>
        <td colspan=4 align="center"><strong>附属卡<%=count+1%>授信及额度结果</strong></td>
      </tr>

      <tr>
        <td class="BACKGROUND_a" align="right">附属卡授信结果代码</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=String.valueOf(supplResult.getSupplResultID() )%></td>
        <td class="BACKGROUND_a" align="right">附属卡授信结果描述</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=supplResult.getSupplResultDescription() ==null?"&nbsp;":supplResult.getSupplResultDescription()%></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡初始额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=supplResult.getSupplInitialLineRMB()==-1?"&nbsp;":String.valueOf(supplResult.getSupplInitialLineRMB())%></td>
        <td class="BACKGROUND_a" align="right">附属卡初始额(外币)</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=supplResult.getSupplInitialLineFRC()==-1?"&nbsp;":String.valueOf(supplResult.getSupplInitialLineFRC())%></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡取现额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=supplResult.getSupplCashAdvanceRMB()==-1?"&nbsp;":String.valueOf(supplResult.getSupplCashAdvanceRMB())%></td>
        <td class="BACKGROUND_a" align="right">附属卡取现额(外币)</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=supplResult.getSupplCashAdvanceFRC()==-1?"&nbsp;":String.valueOf(supplResult.getSupplCashAdvanceFRC())%></td>
      </tr>
<%count++;}
}%>
       <tr>
        <td colspan=4 align="center"><strong>授信及额度决策原因</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">该授信决策的原因代码</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=String.valueOf(result.getUnderwritingReasonCode())%></td>
        <td class="BACKGROUND_a" align="right">该授信决策的原因描述</td>
        <td class="BACKGROUND_c"><textarea name="MenualUnderwritingReasonDesc" id="MenualUnderwritingReasonDesc"><%=result.getUnderwritingReasonDescription()==null?"":result.getUnderwritingReasonDescription()%></textarea></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">该初始额度决策的原因代码</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=String.valueOf(result.getInitLineReasonCode())%></td>
        <td class="BACKGROUND_a" align="right">决策始额度决策的原因描述</td>
        <td class="BACKGROUND_c"><textarea name="MenualInitLineReasonDesc" id="MenualInitLineReasonDesc"><%=result.getInitLineReasonDescription()==null?"":result.getInitLineReasonDescription()%></textarea></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">决策过程记录ID</td>
        <td class="BACKGROUND_c"><image width=2>
          <%=result.getStrategiesLogID()==null?"&nbsp;":result.getStrategiesLogID()%></td>
        <td class="BACKGROUND_c"><div align="right">偏差是否可接受</div></td>
        <td class="BACKGROUND_c"><input name="acceptableDegree" type="radio" value="0" checked>
          可接受
            <input type="radio" name="acceptableDegree" value="1">
          不可接受</td>
      </tr>

      <tr>
        <td colspan=4 align="center"><strong>其它信息</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">外币汇率</td>
        <td class="BACKGROUND_c" colspan="3"><image width=2>
          <%=result.getExchangeRate()==-1?"&nbsp;":String.valueOf(result.getExchangeRate())%></td>
      </tr>
      <tr>
        <td colspan="4"><div align="center"><strong>是否同意<span class="BACKGROUND_a">自动策略结果</span></strong></div></td>
        </tr>
      <tr>
        <td align="right" class="BACKGROUND_a">是否同意自动策略结果</td>
        <td colspan="3" align="right" class="BACKGROUND_a"><div align="left">
            <input name="MenualIsAgree" type="radio" value="0" checked onClick="javascript:IsAgreeAuto('0');">
    是
    <input type="radio" name="MenualIsAgree" value="1" onClick="javascript:IsAgreeAuto('1');">
    否 </div></td>
        </tr>
    </table>
    <p>
    <img onClick="javascript:document.all.form1.submit();" src="img/button13.gif" width="54" height="26">
  </p>
  </div>
</form>

<% } else {%>
<form name="form1" method="post" action="CDS-0020.do?action=getStrategy"> <!--onSubmit="return CheckValid(this);"-->

    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong>授信策略信息</strong></td>
      </tr>
      <tr>
        <td width="32%" align="right" class="BACKGROUND_a">申请人的申请号</td>
        <td width="27%" class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td width="20%" align="right" class="BACKGROUND_a">申请人随机数ID</td>
        <td width="21%" class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
       <tr>
        <td colspan=4 align="center"><strong>评估信息</strong></td>

      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">风险度评估值</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">使用度评估值</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
       <tr>
        <td class="BACKGROUND_a" align="right">风险度评估值分为(1-10)级</td>
       <td class="BACKGROUND_a"><image width=2>1级风险度最高,10级风险度最低</td>
        <td class="BACKGROUND_a" align="right" >使用度评估值分为(1-10级)</td>
        <td class="BACKGROUND_a"><image width=2>1级使用度最高,10级使用度最低</td>
      </tr>

        <tr>
       <td colspan=4 align="center"><strong>产品信息</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">是否经过降级</td>
        <td class="BACKGROUND_c"><image width=2>
          &nbsp; </td>
                  <td class="BACKGROUND_a" align="right">最终产品的产品号</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
    </tr>
    <tr>
        <td colspan=4 align="center"><strong>主卡授信及额度结果</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡授信结果代码</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">授信结果描述</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>

     </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡初始额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">主卡初始额度(外币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">主卡取现额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">主卡取现额度(外币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
        <tr>
        <td colspan=4 align="center"><strong>附属卡授信及额度结果</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡授信结果代码</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">附属卡授信结果描述</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡初始额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">附属卡初始额(外币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">附属卡取现额度(人民币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">附属卡取现额(外币)</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>

       <tr>
        <td colspan=4 align="center"><strong>授信及额度决策原因</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">该授信决策的原因代码</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">该授信决策的原因描述</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">该初始额度决策的原因代码</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
        <td class="BACKGROUND_a" align="right">决策始额度决策的原因描述</td>
        <td class="BACKGROUND_c"><image width=2>&nbsp;</td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">决策过程记录ID</td>
        <td class="BACKGROUND_c" colspan="3"><image width=2>&nbsp;</td>
      </tr>

      <tr>
        <td colspan=4 align="center"><strong>其它信息</strong></td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align="right">外币汇率</td>
        <td class="BACKGROUND_c" colspan="3"><image width=2>&nbsp;</td>
      </tr>
    </table>
  <p>

    <img onClick="javascript:history.back();" src="img/button13.gif" width="54" height="26">
  </p>
</form>
<% }%>
<table width="100%" cellspacing="0" cellpadding="0" >
    <tr>
    	<td with= 75% align=center height="32"><span><font size="1">Copyright &copy; 2005 北京首航财务管理有限公司 版权所有</font></span>
    </tr>
</table>
</center>
</body>
</html>
