package com.cfchina.cdse.action;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;

import org.apache.struts.action.*;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import com.boc.cdse.CDSEMessage;
import com.boc.cdse.CDSEResult;
import com.cfchina.cdse.*;

public class CreateDomAction extends CdsAction {
    private long currentTime = 0;
    int i = 0;    
    /**
     * 处理用户提交的请求，<code>process</code>方法，<code>createDocument</code>
     * 被顺序地执行。
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
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws
        IOException, ServletException {
    	//System.out.println(request.getParameter("AT20002"));
        ActionForward af = null;
        
        //取得当前action
        String action = request.getParameter("action");
        if (action == null) {
            action = "input";
        }
        System.out.println("====action=============="+action);
        
        if (action.equals("input")) {
            //****************************测试文件压缩***********************************
             System.out.println(
                 "=====================================================");
            try {
                //解压缩
                /*
                                 File file=new File("E:/ZipOutOfPath.log");
                                 FileInputStream fis=new FileInputStream(file);
                 ZipInputStream inputStream=new ZipInputStream(fis);
                                 byte data[] = new byte[1024];
                                 int count;
                                 while(true)
                                 {
                    System.out.println("==================================");
                    ZipEntry  zipentry  =  inputStream.getNextEntry();
                    if  (zipentry  ==  null)
                        break;
                    while ((count = inputStream.read(data, 0, 1024)) >=0) {
                        //System.out.println("data:" + data.toString());
                        System.out.println(new String(data, "GBK"));
                    }
                    inputStream.closeEntry();
                                 }
                                 inputStream.close();
                                 fis.close();
                                 file=null;
                 */
                /*压缩
                                 File file1=new File("E:/ZipOutOfPath.log");
                 FileOutputStream fos=new FileOutputStream(file1);
                 BufferedOutputStream bout=new BufferedOutputStream(fos);
                                 PrintStream pout=new PrintStream(bout);
                                 byte data[] = new byte[1024];
                                 int count;
                                 while((count=fis.read(data,0,1024))!=-1)
                                 {
                    pout.print(data);
                                 }
                                 fis.close();
                                 pout.close();
                                 bout.close();
                                 fis.close();
                                 long aa=file.length();
                 */
                //file=null;
                //file1=null;
                /*
                 ZipFile zf = new ZipFile("E:/ZipOutOfPath.zip");
                                 ZipEntry ze=zf.getEntry("ZipOutOfPath.log");
                 byte[] buffer = "\ntest中华绿卡第四纪富克拉三大件富克拉四大皆空立法思路科技大分局考虑".getBytes("GBK");
                                 ze.setExtra(buffer);
                                 long aa = ze.getSize();
                                 zf.close();
                                 //file=null;
                                 zf=null;
                 */
                /*
                                 byte[] buffer = new byte[1024];
                 */
                /*
                 FileOutputStream fileOut = new FileOutputStream(
                     "E:/ZipOutOfPath.zip");
                 ZipOutputStream outputStream = new ZipOutputStream(fileOut);
                 //outputStream.putNextEntry(zf.getEntry(zf.getName()));
                 outputStream.setMethod(ZipOutputStream.DEFLATED);
                 outputStream.putNextEntry(new ZipEntry("ZipOutOfPath.log"));

                 byte[] buffer = "AppId=dongchg20060723|AppType=2|SupplApplOnly=N|SuppNum=|ProductCd=1002|PriCardCurr=1|CCardTypeDownGrade=Y|PriGender=1|PriCardBirthday=19791103|PriIDType=1|PriIDNo=132237197911030419|PriNationality=CHN|PriJCBType=4|PriMaritalSta=2|PriEducationLvl=1|PriHomePtCd=100026|HomeResidingYear=15|HomeOwshType=|HouseHireAmt=|HousePayAmt=|HomePhonePro=010|HomePhoneNo=89439857|HomePhoneExt=|DependentCnt=|ComAddrPtCd=100055|CompTelPhonePro=010|CompTelPhone=83648723|CompTelPhoneExt=|CompBizField=03|CompBizOwShType=|PriPos=406|CompPosSeniority=5|AmmSalary=120000|OtherBankCardSta=|OthCardCnt=|BOCSaveActFlg=|OthBankSaveActNum=|CarOwShCondition=|PriStatAddrSel=|AutoPayMethod=|AutoPayAmtSel=|AutoPayActSel=|BKCC=|BKUA=|BKVIP=|BKSTF=|BKFW=|BH=|IfBHDA=|AprSpeGrpType=09|AprWrkSeniority=5|AprPosLevl=1|IncomeProof=Y|AprAnnIncome=120000|AprAssetType1=|AprAssetValue1=|AprAssetType2=|AprAssetValue2=|AprAssetType3=|AprAssetValue3=|IfHiRiskBiz=0|BOCCardHolder=|BOCCardLimit=|BOCCardAmnt=|IfSSInfo=0|IfPBOCInfo=0|IfCBRCInfo=0|IfMPSInfo=0|CurrSSMonthPay=|LstSSPayDate=|MPSBirthDate=|NumCCardAct=|NumCCardOrg=|TotlCCardCLmt=|TotlCCardOLmt=|CCardFrtOpnDate=|CCardLstOpnDate=|CCardHiLimit=|ReservedField1=|CCardM1In3M=|CCardM2In3M=|CCardM1In6M=|CCardM2In12M=|CurrLoanBalance=|CurrLoanMthlyPay=|LoanM1In3M=|LoanM2In3M=|NumOpnActin6M=|LoanM1In6M=|LoanM2In12M=|CLM1In3M=|CCardAccntLife=|CCardM3In24M=|TotlCCardOTme=|CurrCCardOLmt=|NumNonnormCCardCloAct=|CCardActiActIn6M=|CCardActiActIn12M=|NumLoan=|NumLoanOrg=|CurrLoanOLmt=|TotlLoanOTme=|MaxOMBetCCardNLoan=|NumNormClosAct=|NormLoadPaymet=|CurrLoanMPaymet=|NumNonnormLoanCloAct=|NumReqCheTimIn3M=|ReservedField2=|ReservedField3=|ReservedField4=|ReservedField5=|ReservedField6=|ReservedField7=|ReservedField8=|ReservedField9=|ReservedField10=|ReservedField11=|ReservedField12=|ReservedField13=|ReservedField14=|ReservedField15=|ReservedField16=|ReservedField17=|ReservedField18=|ReservedField19=|ReservedField20=|supplID1=|PrimaryCardNo1=|SuppTitle1=|SuppBirthday1=19791103|SuppIDType1=|SuppIDNo1=|SuppRelation1=2|SuppJCBType1=|SuppLimitFlag1=1|SuppLimitPercent1=|AT0040=1|AT0045=2|AT0041=2|AT0020=0|AT0010=2|AT0060=1|AT0065=1|AT0070=1|AT0130=1|AT0140=19791103|AT0141=26|AT0150=1|AT0160=1|AT0170=CHN|AT0171=1|AT0190=4|AT0180=3|AT0200=5|AT0280=15.416667|AT0290=2|AT0300=0|AT0310=0|AT0340=010|AT0342=10|AT0330=89439857|AT0440=2|AT0540=100055|AT0560=010|AT0570=83648723|AT0550=0|AT0620=03|AT0630=08|AT0660=406|AT0680=5|AT0700=10000.0|AT0710=120000.0|AT0780=0|AT0790=0|AT1100=0|AT1140=0|AT1150=0|AT0030=1|AT1235=19791103|AT1236=26|AT1240=2|AT1420=1|AT1430=100|AT1440=2|AT1630=2|AT1680=0|AT1690=0|AT2310=-9|AT2320=-9|AT2340=-9|AT2400=0|AT2410=0|AT2420=1|AT2430=0|AT2500=1|AT3000=0|AT3010=-9|AT3011=0|AT3020=0|AT3030=0|AT3040=0|AT3050=0|AT3060=0|AT3070=0|AT3075=298|AT3090=|AT3100=0|AT3110=0|AT3160=0|AT3170=0|AT3200=0|AT3210=0|AT3220=0|AT3230=0|AT3240=0|AT3250=0|AT3260=0|AT3270=0|AT3280=0|AT3290=0|AT3300=0|AT3310=0|AT3320=0|AT3330=0|AT3340=0|AT3350=0|AT3360=0|AT3370=0|AT3380=0|AT3390=0|AT2440=1|AT3400=0|AT3410=0|AT3420=0|AT3430=0|AT3440=0|AT3450=0|AT3860=0|AT3870=0.0|AT3880=0|AT3890=0.0|AT3900=0|AT3910=0.0|AT3920=0|AT3930=0.0|AT3940=0|AT3950=0.0|AT3960=0|AT3970=0.0|AT3460=0|AT3470=0|AT3480=0|AT3490=0|AT3500=0|AT3525=0|AT3510=0|AT3520=120000|AT3530=09|AT3540=1|AT3550=5|AT3560=0|AT3570=0|AT3580=0|AT3590=0|AT3600=0|AT3610=0|AT3620=-9|AT3630=0|AT3640=-9|AT3645=1|AT3650=0|AT3660=0|AT3670=0|AT3680=0|AT3690=-9|AT3695=0|AT3700=-9|AT3705=0|AT3710=0|AT3720=0|AT3730=0|AT3740=0|AT3750=0|AT3760=0|AT3770=0|AT3780=0|AT3790=0|AT3800=0|AT3810=0|AT3820=0|AT3830=0|AT3840=0|AT3850=0|AM0016=0.0|AM0017=0.0|AM0018=0.0|AM0019=0.0|AM0031=0.0|AM0036=0.0|AM0041=1.0|AM0045=0.0|AM0080=21.0|AM0090=10.583333|AM0100=1.0|AM0105=5.0|AM0110=0.0|AM0115=120000.0|AM0120=40000.0|AM0130=0.0|AM0134=0.0|AM0135=0.0|AM0140=0.0|AM0143=0.0|AM0145=0.0|AM0200=0.0|AM0210=27.0|AT0172=1.0|AT0175=0.0|AT0185=0.0|AT0195=0.0|AT0196=0.0|AT0216=0.0|AT0226=1.0|AT0236=0.0|AT0246=0.0|AT0285=0.0|AT0321=0.0|AT0322=0.0|AT0323=0.0|AT0324=0.0|AT0325=0.0|AT0326=0.0|AT0331=0.0|AT0335=0.0|AT0338=0.0|AT0345=2.0|AT0346=1.0|AT0351=0.0|AT0353=0.0|AT0355=0.0|AT0357=0.0|AT0359=0.0|AT0361=0.0|AT0365=0.0|AT0369=0.0|AT0373=0.0|AT0377=0.0|AT0381=0.0|AT0389=18000.0|AT0685=0.0|AT0692=0.0|AT0715=0.0|AT0716=120000.0|AT0719=0.0|AT0809=120000.0|AT1721=2.0|AT1801=0.0|AT1806=0.0|AT3175=0.0|AT4000=3.0|AT4010=7.0|AT4023=77000.0|AT4030=1.0|AT4040=1.0|AT4050=0.0|AT4060=1.0|AT4065=0.0|AT4070=0.0|AT4075=0.0|AT4200=0.0|AT4205=0.0|AT4206=1.0|AT4210=1.0|AT4215=1.0|BS0010=1.0|BS0020=2.0|CF0010=120.0|CF0020=0.0|CF0030=164.0|CF0040=0.0|CF0050=0.0|CF0060=230.0|CF0070=200.0|CF0080=49.0|CF0090=180.0|CF0100=260.0|CF0110=0.0|CF0120=0.0|CF0130=0.0|CF0140=45.0|CF0150=150.0|CF0160=50.0|CF0210=175.0|CF0220=0.0|CF0230=200.0|CF0240=168.0|CF0250=0.0|CF0260=89.0|CF0270=0.0|CF0280=80.0|CF0290=40.0|CF0300=100.0|CF0310=270.0|CF0320=75.0|CF0330=95.0|CF0340=80.0|CF2010=80.0|CF2020=80.0|CF2030=100.0|CF2040=40.0|CF2050=80.0|CF2060=70.0|CF2070=110.0|CF2080=80.0|CF2090=120.0|CF2100=70.0|CG0010=1448.0|CG0015=5.0|CG0017=3.0|CG0019=2.0|CG0110=1372.0|CG0115=2.0|CG0117=1.0|CG0119=1.0|CG2000=830.0|DM0010=100.0|DM0120=8.0|DM0130=12.0|DM0210=0.3|DM0220=0.3|DM0230=0.3|DM0240=0.3|DM0250=0.4|DM0260=0.4|DM0270=0.4|DM0280=0.4|EE0010=50000.0|EE0020=10000.0|EE0030=39996.0|EE0031=29996.0|EE0032=10004.0|EE0035=39996.0|EE0040=39996.0|EE0041=29996.0|EE0042=10004.0|EE0045=39996.0|EE0050=0.0|EE0060=39996.0|portfolioId_1=POD0020|policyId_1=PLY0020|strategyId_1=STG0020|strategyVersion_1=1|resultId_1=A|initialLine_1=0|reasonCode_1=050|path_1={AT4065: 0.0 = 0 }{AT4075: 0.0 = 0 }{AT4070: 0.0 = 0 }{AT3175: 0.0 <= 1 }{AT4205: 0.0 <= 0 }{AT3560: 0 <= 0 }{AM0045: 0.0 = 0 }{BS0010: 1.0 = 1 }{CF0100: 260.0 > 100 }{AT0200: 5 > 3 }{AM0200: 0.0 = 0 }|portfolioId_2=POD0020|policyId_2=PLY0120|strategyId_2=STG0120|strategyVersion_2=1|resultId_2=D-EE0045|initialLine_2=39996.0|reasonCode_2=085|path_2={AT3175: 0.0 <= 1 }{EE0050: 0.0 <= 0 }|portfolioId_3=POD0000|policyId_3=PLY0030|strategyId_3=STG0030|strategyVersion_3=1|resultId_3=A|initialLine_3=0|reasonCode_3=050|path_3={AT4060: 1.0 > 0 }|applicantRandomDigitID=298|applicationId=dongchg20060723|exchangeRate=8.0|hasDownSell=0|initLineReasonCode=85|initLineReasonDescription=基于专家规则进行矩阵调整的额度|principalCashAdvanceFRC=2000|principalCashAdvanceRMB=16000|principalInitialLineFRC=5000|principalInitialLineRMB=40000|principalResultDescription=批准授信|principalResultID=A|productCode=1002|riskScore=5|strategiesLogID=dongchg200607232006072508:57:29|underwritingReasonCode=50|underwritingReasonDescription=属于目标客户范畴|usageScore=2|creditScore=830.0|riskGrade=1448|usageGrade=1372|supplResultID1=A|supplResultDescription1=批准授信|supplUwReasonCode1=50|supplInitialLineRMB1=40000|supplInitialLineFRC1=5000|supplCashAdvanceRMB1=16000|supplCashAdvanceFRC1=2000|".getBytes("GBK");
                 /*
                  while (zf.getInputStream(zf.getEntry(zf.getName())).read(buffer) !=
                                   -1) {
                                outputStream.write(buffer);
                            }
                  */
                 //buffer = "\ntest中华绿卡第四纪富克拉三大件富克拉四大皆空立法思路科技大分局考虑".getBytes("GBK");
                 /*
                                  outputStream.write(buffer,0,buffer.length);
                                  //zf.close();
                                  outputStream.closeEntry();
                                  outputStream.close();
                  */

                 //测试LZW压缩算法
                 //压缩

//                 File file1 = new File("E:/lzw.log"); //byte[] buffer = "AppId=dongchg20060723|AppType=2|SupplApplOnly=N|SuppNum=|ProductCd=1002|PriCardCurr=1|CCardTypeDownGrade=Y|PriGender=1|PriCardBirthday=19791103|PriIDType=1|PriIDNo=132237197911030419|PriNationality=CHN|PriJCBType=4|PriMaritalSta=2|PriEducationLvl=1|PriHomePtCd=100026|HomeResidingYear=15|HomeOwshType=|HouseHireAmt=|HousePayAmt=|HomePhonePro=010|HomePhoneNo=89439857|HomePhoneExt=|DependentCnt=|ComAddrPtCd=100055|CompTelPhonePro=010|CompTelPhone=83648723|CompTelPhoneExt=|CompBizField=03|CompBizOwShType=|PriPos=406|CompPosSeniority=5|AmmSalary=120000|OtherBankCardSta=|OthCardCnt=|BOCSaveActFlg=|OthBankSaveActNum=|CarOwShCondition=|PriStatAddrSel=|AutoPayMethod=|AutoPayAmtSel=|AutoPayActSel=|BKCC=|BKUA=|BKVIP=|BKSTF=|BKFW=|BH=|IfBHDA=|AprSpeGrpType=09|AprWrkSeniority=5|AprPosLevl=1|IncomeProof=Y|AprAnnIncome=120000|AprAssetType1=|AprAssetValue1=|AprAssetType2=|AprAssetValue2=|AprAssetType3=|AprAssetValue3=|IfHiRiskBiz=0|BOCCardHolder=|BOCCardLimit=|BOCCardAmnt=|IfSSInfo=0|IfPBOCInfo=0|IfCBRCInfo=0|IfMPSInfo=0|CurrSSMonthPay=|LstSSPayDate=|MPSBirthDate=|NumCCardAct=|NumCCardOrg=|TotlCCardCLmt=|TotlCCardOLmt=|CCardFrtOpnDate=|CCardLstOpnDate=|CCardHiLimit=|ReservedField1=|CCardM1In3M=|CCardM2In3M=|CCardM1In6M=|CCardM2In12M=|CurrLoanBalance=|CurrLoanMthlyPay=|LoanM1In3M=|LoanM2In3M=|NumOpnActin6M=|LoanM1In6M=|LoanM2In12M=|CLM1In3M=|CCardAccntLife=|CCardM3In24M=|TotlCCardOTme=|CurrCCardOLmt=|NumNonnormCCardCloAct=|CCardActiActIn6M=|CCardActiActIn12M=|NumLoan=|NumLoanOrg=|CurrLoanOLmt=|TotlLoanOTme=|MaxOMBetCCardNLoan=|NumNormClosAct=|NormLoadPaymet=|CurrLoanMPaymet=|NumNonnormLoanCloAct=|NumReqCheTimIn3M=|ReservedField2=|ReservedField3=|ReservedField4=|ReservedField5=|ReservedField6=|ReservedField7=|ReservedField8=|ReservedField9=|ReservedField10=|ReservedField11=|ReservedField12=|ReservedField13=|ReservedField14=|ReservedField15=|ReservedField16=|ReservedField17=|ReservedField18=|ReservedField19=|ReservedField20=|supplID1=|PrimaryCardNo1=|SuppTitle1=|SuppBirthday1=19791103|SuppIDType1=|SuppIDNo1=|SuppRelation1=2|SuppJCBType1=|SuppLimitFlag1=1|SuppLimitPercent1=|AT0040=1|AT0045=2|AT0041=2|AT0020=0|AT0010=2|AT0060=1|AT0065=1|AT0070=1|AT0130=1|AT0140=19791103|AT0141=26|AT0150=1|AT0160=1|AT0170=CHN|AT0171=1|AT0190=4|AT0180=3|AT0200=5|AT0280=15.416667|AT0290=2|AT0300=0|AT0310=0|AT0340=010|AT0342=10|AT0330=89439857|AT0440=2|AT0540=100055|AT0560=010|AT0570=83648723|AT0550=0|AT0620=03|AT0630=08|AT0660=406|AT0680=5|AT0700=10000.0|AT0710=120000.0|AT0780=0|AT0790=0|AT1100=0|AT1140=0|AT1150=0|AT0030=1|AT1235=19791103|AT1236=26|AT1240=2|AT1420=1|AT1430=100|AT1440=2|AT1630=2|AT1680=0|AT1690=0|AT2310=-9|AT2320=-9|AT2340=-9|AT2400=0|AT2410=0|AT2420=1|AT2430=0|AT2500=1|AT3000=0|AT3010=-9|AT3011=0|AT3020=0|AT3030=0|AT3040=0|AT3050=0|AT3060=0|AT3070=0|AT3075=298|AT3090=|AT3100=0|AT3110=0|AT3160=0|AT3170=0|AT3200=0|AT3210=0|AT3220=0|AT3230=0|AT3240=0|AT3250=0|AT3260=0|AT3270=0|AT3280=0|AT3290=0|AT3300=0|AT3310=0|AT3320=0|AT3330=0|AT3340=0|AT3350=0|AT3360=0|AT3370=0|AT3380=0|AT3390=0|AT2440=1|AT3400=0|AT3410=0|AT3420=0|AT3430=0|AT3440=0|AT3450=0|AT3860=0|AT3870=0.0|AT3880=0|AT3890=0.0|AT3900=0|AT3910=0.0|AT3920=0|AT3930=0.0|AT3940=0|AT3950=0.0|AT3960=0|AT3970=0.0|AT3460=0|AT3470=0|AT3480=0|AT3490=0|AT3500=0|AT3525=0|AT3510=0|AT3520=120000|AT3530=09|AT3540=1|AT3550=5|AT3560=0|AT3570=0|AT3580=0|AT3590=0|AT3600=0|AT3610=0|AT3620=-9|AT3630=0|AT3640=-9|AT3645=1|AT3650=0|AT3660=0|AT3670=0|AT3680=0|AT3690=-9|AT3695=0|AT3700=-9|AT3705=0|AT3710=0|AT3720=0|AT3730=0|AT3740=0|AT3750=0|AT3760=0|AT3770=0|AT3780=0|AT3790=0|AT3800=0|AT3810=0|AT3820=0|AT3830=0|AT3840=0|AT3850=0|AM0016=0.0|AM0017=0.0|AM0018=0.0|AM0019=0.0|AM0031=0.0|AM0036=0.0|AM0041=1.0|AM0045=0.0|AM0080=21.0|AM0090=10.583333|AM0100=1.0|AM0105=5.0|AM0110=0.0|AM0115=120000.0|AM0120=40000.0|AM0130=0.0|AM0134=0.0|AM0135=0.0|AM0140=0.0|AM0143=0.0|AM0145=0.0|AM0200=0.0|AM0210=27.0|AT0172=1.0|AT0175=0.0|AT0185=0.0|AT0195=0.0|AT0196=0.0|AT0216=0.0|AT0226=1.0|AT0236=0.0|AT0246=0.0|AT0285=0.0|AT0321=0.0|AT0322=0.0|AT0323=0.0|AT0324=0.0|AT0325=0.0|AT0326=0.0|AT0331=0.0|AT0335=0.0|AT0338=0.0|AT0345=2.0|AT0346=1.0|AT0351=0.0|AT0353=0.0|AT0355=0.0|AT0357=0.0|AT0359=0.0|AT0361=0.0|AT0365=0.0|AT0369=0.0|AT0373=0.0|AT0377=0.0|AT0381=0.0|AT0389=18000.0|AT0685=0.0|AT0692=0.0|AT0715=0.0|AT0716=120000.0|AT0719=0.0|AT0809=120000.0|AT1721=2.0|AT1801=0.0|AT1806=0.0|AT3175=0.0|AT4000=3.0|AT4010=7.0|AT4023=77000.0|AT4030=1.0|AT4040=1.0|AT4050=0.0|AT4060=1.0|AT4065=0.0|AT4070=0.0|AT4075=0.0|AT4200=0.0|AT4205=0.0|AT4206=1.0|AT4210=1.0|AT4215=1.0|BS0010=1.0|BS0020=2.0|CF0010=120.0|CF0020=0.0|CF0030=164.0|CF0040=0.0|CF0050=0.0|CF0060=230.0|CF0070=200.0|CF0080=49.0|CF0090=180.0|CF0100=260.0|CF0110=0.0|CF0120=0.0|CF0130=0.0|CF0140=45.0|CF0150=150.0|CF0160=50.0|CF0210=175.0|CF0220=0.0|CF0230=200.0|CF0240=168.0|CF0250=0.0|CF0260=89.0|CF0270=0.0|CF0280=80.0|CF0290=40.0|CF0300=100.0|CF0310=270.0|CF0320=75.0|CF0330=95.0|CF0340=80.0|CF2010=80.0|CF2020=80.0|CF2030=100.0|CF2040=40.0|CF2050=80.0|CF2060=70.0|CF2070=110.0|CF2080=80.0|CF2090=120.0|CF2100=70.0|CG0010=1448.0|CG0015=5.0|CG0017=3.0|CG0019=2.0|CG0110=1372.0|CG0115=2.0|CG0117=1.0|CG0119=1.0|CG2000=830.0|DM0010=100.0|DM0120=8.0|DM0130=12.0|DM0210=0.3|DM0220=0.3|DM0230=0.3|DM0240=0.3|DM0250=0.4|DM0260=0.4|DM0270=0.4|DM0280=0.4|EE0010=50000.0|EE0020=10000.0|EE0030=39996.0|EE0031=29996.0|EE0032=10004.0|EE0035=39996.0|EE0040=39996.0|EE0041=29996.0|EE0042=10004.0|EE0045=39996.0|EE0050=0.0|EE0060=39996.0|portfolioId_1=POD0020|policyId_1=PLY0020|strategyId_1=STG0020|strategyVersion_1=1|resultId_1=A|initialLine_1=0|reasonCode_1=050|path_1={AT4065: 0.0 = 0 }{AT4075: 0.0 = 0 }{AT4070: 0.0 = 0 }{AT3175: 0.0 <= 1 }{AT4205: 0.0 <= 0 }{AT3560: 0 <= 0 }{AM0045: 0.0 = 0 }{BS0010: 1.0 = 1 }{CF0100: 260.0 > 100 }{AT0200: 5 > 3 }{AM0200: 0.0 = 0 }|portfolioId_2=POD0020|policyId_2=PLY0120|strategyId_2=STG0120|strategyVersion_2=1|resultId_2=D-EE0045|initialLine_2=39996.0|reasonCode_2=085|path_2={AT3175: 0.0 <= 1 }{EE0050: 0.0 <= 0 }|portfolioId_3=POD0000|policyId_3=PLY0030|strategyId_3=STG0030|strategyVersion_3=1|resultId_3=A|initialLine_3=0|reasonCode_3=050|path_3={AT4060: 1.0 > 0 }|applicantRandomDigitID=298|applicationId=dongchg20060723|exchangeRate=8.0|hasDownSell=0|initLineReasonCode=85|initLineReasonDescription=基于专家规则进行矩阵调整的额度|principalCashAdvanceFRC=2000|principalCashAdvanceRMB=16000|principalInitialLineFRC=5000|principalInitialLineRMB=40000|principalResultDescription=批准授信|principalResultID=A|productCode=1002|riskScore=5|strategiesLogID=dongchg200607232006072508:57:29|underwritingReasonCode=50|underwritingReasonDescription=属于目标客户范畴|usageScore=2|creditScore=830.0|riskGrade=1448|usageGrade=1372|supplResultID1=A|supplResultDescription1=批准授信|supplUwReasonCode1=50|supplInitialLineRMB1=40000|supplInitialLineFRC1=5000|supplCashAdvanceRMB1=16000|supplCashAdvanceFRC1=2000|".getBytes("GBK");
//                FileOutputStream fos = new FileOutputStream(file1);
//                FileInputStream fin = new java.io.FileInputStream(
//                    "E:/PersonalCard_2006年7月24日.log");
//                //BufferedOutputStream bout=new BufferedOutputStream(fos);
//                //PrintStream pout=new PrintStream(bout);
//                //ByteArrayInputStream bais=new java.io.ByteArrayInputStream(buffer);
//                LZW lzw = new LZW();
//                lzw.compress(fin, fos);
//                //bais=null;
//                fos.close();
//                fos = null;
//                lzw = null;

                //解压缩
                /*
                                 File file1=new File("E:/lzw.log");
                 FileInputStream fis=new FileInputStream(file1);
                 FileOutputStream fos=new FileOutputStream("E:/lzws.log");
                                 //java.io.ByteArrayOutputStream baos=new ByteArrayOutputStream();
                                 LZW lzw = new LZW();
                                 lzw.decompress(fis,fos);
                                 //byte[] buffer=baos.toByteArray();
                                 //System.out.println("解压缩内容："+new String(buffer,"GBK"));
                                 fis.close();
                                 //baos.close();
                                 fos.close();
                                 lzw=null;*/
            } catch (Exception ioe) {
                ioe.printStackTrace();
            }
            System.out.println(
                "=====================================================");
            //****************************测试文件压缩***********************************

             //取得分配给当前用户催收分配单列表
             af = mapping.findForward("input");

        } else if (action.equals("create")) {
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            System.out.println(doc);
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            System.out.println("==========================3");
            //将对象放入消息队列
//            MessageControl messageControl = MessageControl.getQueueHandle();
//
//            try {
//                messageControl.resultSendObject( (Serializable) doc, 1);
//                messageControl.close();
//            } catch (Exception e) {
//                System.out.println("send object failed! ");
//                e.printStackTrace();
//                af = mapping.findForward("errors");
//                request.setAttribute("errorMessage", "发送消息失败！");
//                return af;
//            }
        

            //调用cds接口
            	
            if(i==1){
            	CDSEMessage.getInstance().card_refresh();
            	System.out.println("这是刷新方法："+i);
            }
            System.out.println("这不是刷新方法："+i);
            i++;
            long begin = System.currentTimeMillis();
            String xml = CDSEUtil.xmlToString(doc);
            System.out.println("XML"+xml);
            //xml = java.net.URLDecoder.decode(xml,"GB2312");
            String content=CDSEMessage.getInstance().process(xml);
            
            Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH)+1;
            int date = c.get(Calendar.DATE);
            int hour = c.get(Calendar.HOUR_OF_DAY);
            int minute = c.get(Calendar.MINUTE);
            int second = c.get(Calendar.SECOND);
            System.out.println("时间："+year + "/" + month + "/" + date + " " +hour + ":" +minute + ":" + second); 
            
            
            //System.out.println("cdseutil:"+CDSEUtil.xmlToString(doc));
            //System.out.println("content:"+content);
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            request.setAttribute("result", result);
            long end = System.currentTimeMillis();
            System.out.println("共用时："+(end-begin));
            af = mapping.findForward("showResult");

            /*
                         CDSEBean cdseBean = new CDSEBean();
                         CDSEResult cdseResult = new CDSEResult();
                         Log log = new Log();
                         cdseResult = cdseBean.process(doc, log);
                         //修改部分  拆分授信策略StrategyID
             StringTokenizer st = new StringTokenizer(cdseResult.getStrategyID(),
                "|");
                         ArrayList list = new ArrayList();
                         while (st.hasMoreTokens()) {
                String j = st.nextToken();

                if (j.equalsIgnoreCase(" ")) {
                    j = j + "_ ";

                }
                StringTokenizer s = new StringTokenizer(j, "_");
                while (s.hasMoreTokens()) {

                    list.add(s.nextToken());
                }

                         }
                         for (int i = 0; i < list.size(); i++) {
                String str = (String) list.get(i);
                request.setAttribute("strategy" + i, str);
                //System.out.println("##%%strategy"+i+"^"+str);
                         }
                         //System.out.println("##"+cdseResult.getStrategyID());
                         //////////
                         LogManager logManager = LogManager.getInstance();
                         if (logManager != null) {
                logManager.toLog(log);
                         }

                         log = null;
                         request.setAttribute("result", cdseResult);

                         //调用cds接口
                         af = mapping.findForward("showResult");
                         appId = request.getParameter("AppId");
                         this.saveToXMLFile(doc, appId);
                         outputFile(cdseResult);*/
        }else if(action.equals("createxml")){
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            String content=request.getParameter("appContent");
            System.out.println("==========================3");
            //System.out.println("content:"+content.toString());   
            long begin = System.currentTimeMillis();
            content=CDSEMessage.getInstance().process(content);
            //System.out.println("content:"+content);
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            long end = System.currentTimeMillis();
            System.out.println("共用时："+(end-begin));
            request.setAttribute("result", result);
            af = mapping.findForward("showResult");

        }
        else if (action.equals("network")) {
        	Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            int date = c.get(Calendar.DATE);
            int hour = c.get(Calendar.HOUR_OF_DAY);
            int minute = c.get(Calendar.MINUTE);
            int second = c.get(Calendar.SECOND);
            int MI = c.get(Calendar.MILLISECOND);
            System.out.println("时间："+year + "/" + month + "/" + date + " " +hour + ":" +minute + ":" + second+"mi:"+MI);
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            System.out.println("==========================3");
            if(i==1){
            	CDSEMessage.getInstance().card_refresh();
            	System.out.println("这是刷新方法："+i);
            }
            System.out.println("这不是刷新方法："+i);
            i++;
            String content=CDSEMessage.getInstance().networkprocess(CDSEUtil.xmlToString(doc));
            
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            System.out.println("content"+content);
            System.out.println("result"+result);
            System.out.println("doc:"+CDSEUtil.xmlToString(doc));
            Calendar c1 = Calendar.getInstance();//可以对每个时间域单独修改
            int year1 = c1.get(Calendar.YEAR);
            int month1 = c1.get(Calendar.MONTH);
            int date1 = c1.get(Calendar.DATE);
            int hour1 = c1.get(Calendar.HOUR_OF_DAY);
            int minute1 = c1.get(Calendar.MINUTE);
            int second1 = c1.get(Calendar.SECOND);
            int MI1 = c1.get(Calendar.MILLISECOND);
            System.out.println("时间："+year1 + "/" + month1 + "/" + date1 + " " +hour1 + ":" +minute1 + ":" + second1+"mi1:"+MI1); 
           
            request.setAttribute("result", result);
            af = mapping.findForward("showResult");
        }else if(action.equals("networkxml")){
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            String content=request.getParameter("appContent");
            System.out.println("==========================3");
            content=CDSEMessage.getInstance().networkprocess(content);
            System.out.println("content:"+content.toString());   
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            System.out.println("result:"+result);
            
            request.setAttribute("result", result);
            af = mapping.findForward("showResult");

        }else if (action.equals("temporary")) {
        	Calendar c = Calendar.getInstance();//可以对每个时间域单独修改
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            int date = c.get(Calendar.DATE);
            int hour = c.get(Calendar.HOUR_OF_DAY);
            int minute = c.get(Calendar.MINUTE);
            int second = c.get(Calendar.SECOND);
            int MI = c.get(Calendar.MILLISECOND);
            System.out.println("时间："+year + "/" + month + "/" + date + " " +hour + ":" +minute + ":" + second+"mi:"+MI);
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            System.out.println("==========================3");
            if(i==1){
            	CDSEMessage.getInstance().card_refresh();
            	System.out.println("这是刷新方法："+i);
            }
            System.out.println("这不是刷新方法："+i);
            i++;
            String content=CDSEMessage.getInstance().temporaryprocess(CDSEUtil.xmlToString(doc));
            System.out.println("content:"+CDSEUtil.xmlToString(doc));
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            System.out.println("CDSEUtil:"+content);
            request.setAttribute("result", result);
            Calendar c1 = Calendar.getInstance();//可以对每个时间域单独修改
            int year1 = c1.get(Calendar.YEAR);
            int month1 = c1.get(Calendar.MONTH);
            int date1 = c1.get(Calendar.DATE);
            int hour1 = c1.get(Calendar.HOUR_OF_DAY);
            int minute1 = c1.get(Calendar.MINUTE);
            int second1 = c1.get(Calendar.SECOND);
            int MI1 = c1.get(Calendar.MILLISECOND);
            System.out.println("时间："+year1 + "/" + month1 + "/" + date1 + " " +hour1 + ":" +minute1 + ":" + second1+"mi1:"+MI1); 
           
            af = mapping.findForward("showResult");
        }else if(action.equals("temporaryxml")){
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            String content=request.getParameter("appContent");
            System.out.println("==========================3");
            System.out.println("content:"+content.toString());   
            content=CDSEMessage.getInstance().temporaryprocess(content);
            System.out.println("content:"+content);
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            request.setAttribute("result", result);
            af = mapping.findForward("showResult");

        }else if (action.equals("permanent")) {
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            System.out.println("==========================3");
            if(i==1){
            	CDSEMessage.getInstance().card_refresh();
            	System.out.println("这是刷新方法："+i);
            }
            System.out.println("这不是刷新方法："+i);
            i++;
            String content=CDSEMessage.getInstance().permanentprocess(CDSEUtil.xmlToString(doc));
            System.out.println("content"+content);
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            request.setAttribute("result", result);
            af = mapping.findForward("showResult");
        }
        else if (action.equals("channel")) {
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            System.out.println("==========================3");
            if(i==1){
            	CDSEMessage.getInstance().card_refresh();
            	System.out.println("这是刷新方法："+i);
            }
            System.out.println("这不是刷新方法："+i);
            i++;
            String content=CDSEMessage.getInstance().channelprocess(CDSEUtil.xmlToString(doc));
            System.out.println("content"+content);
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            request.setAttribute("result", result);
            af = mapping.findForward("showResult");
        }
        else if(action.equals("permanentxml")){
        	System.out.println("==========================1");
            Document doc = createDocument(request,action);
            CDSEResult result = new CDSEResult();
            System.out.println("==========================2");
            if (doc == null) {
            	System.out.println("doc null");
            	
                af = mapping.findForward("errors");
                request.setAttribute("errorMessage", "Dom树创建失败！");
                return af;
            }
            String content=request.getParameter("appContent");
            System.out.println("==========================3");
            System.out.println("content:"+content.toString());   
            content=CDSEMessage.getInstance().permanentprocess(content);
            System.out.println("content:"+content);
            result = new CDSEResult(CDSEUtil.stringToXml(content));
            request.setAttribute("result", result);
            af = mapping.findForward("showResult");

        }
        else if (action.equals("saveXml")) {
            Document doc = createDocument(request,action);
            String appId = request.getParameter("AppId");
            this.saveToXMLFile(doc, appId);
            af = mapping.findForward("input");
        }
        if (action.equals("saveXml1")) {
            Document doc = createDocument(request,action);
            String appId = request.getParameter("AppId");
            this.saveToXMLFile1(doc, appId);
            af = mapping.findForward("query");

        }

        System.out.println("===="+af);
        
        return af;
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
            //errorString = "更新配置文件错误！(Read Configure Step)";
        }
        return 0;
    }

    //把XML文档输出到指定的文件  -lsf 2005.11.02
    private boolean saveToXMLFile(Document doc, String appId) {
        String outFile = "D:/BOCCDSURGENCY/input/" + appId + ".xml";
        TransformerFactory tFactory = TransformerFactory.
            newInstance();
        Transformer transformer = null;
        try {
            transformer = tFactory.newTransformer();

            DOMSource source = null;
            source = new DOMSource(doc);
            StreamResult streamResult = null;
            streamResult = new StreamResult(outFile);
            transformer.transform(source, streamResult);
            source = null;
            streamResult = null;
            transformer = null;
        } catch (TransformerException ex1) {
            ex1.printStackTrace();
            return false;
        }
        return true;

    }

    private boolean saveToXMLFile1(Document doc, String appId) {
        String outFile = "D:/wangyu/input/" + appId + ".xml";
        TransformerFactory tFactory = TransformerFactory.
            newInstance();
        Transformer transformer = null;
        try {

            transformer = tFactory.newTransformer();

            DOMSource source = null;
            source = new DOMSource(doc);
            StreamResult streamResult = null;
            streamResult = new StreamResult(outFile);
            transformer.transform(source, streamResult);
            source = null;
            streamResult = null;
            transformer = null;
        } catch (TransformerException ex1) {
            ex1.printStackTrace();
            return false;
        }
        return true;

    }

    /**
     * 根据表单提交数据，创建Dom树
     *
     * @param request 正在处理的HTTP请求
     *
     * @return Dom树
     */
    private Document createDocument(HttpServletRequest request,String type) {
        Document doc = null;
        //为解析XML作准备，创建DocumentBuilderFactory实例,指定DocumentBuilder
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = null;
        try {
            db = dbf.newDocumentBuilder();
        } catch (ParserConfigurationException pce) {
            System.err.println(pce);
            return doc;
        }
        if("createXml".equals(type)){
        	String content=request.getParameter("appContent");
        	try {
        		InputStream   sbi   =(InputStream)   (new   ByteArrayInputStream(content.getBytes()));
				doc=db.parse(sbi);
				
			} catch (SAXException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return doc;
        }
        doc = db.newDocument();
        ProcessingInstruction pi = doc.createProcessingInstruction(
            "xml-stylesheet",
            "href=\"AppInfoStruct.xsl\" type=\"text/xsl\"");
        doc.appendChild(pi);

        //下面是建立XML文档内容的过程，先建立根元素"xml"
        Element xml = doc.createElement("xml");
        doc.appendChild(xml);
        //下面是建立XML文档内容的过程，先建立二级元素"data"
        Element data = doc.createElement("data");
        //根元素添加上文档

        xml.appendChild(data);

        //建立row元素，添加到data
        Element row = doc.createElement("row");
        currentTime = System.currentTimeMillis();
        //row.setAttribute("AppID", Long.toString(currentTime));
        //取得所有表单数据，并添加到row
        Enumeration allAttr = request.getParameterNames();

        Element SupplData1 = doc.createElement("SupplData");
        Element SupplData2 = doc.createElement("SupplData");
        Element SupplData3 = doc.createElement("SupplData");

        //申请类型
        boolean suppl = false;
        while (allAttr.hasMoreElements()) {
            String attrName = (String) allAttr.nextElement();
            String value = request.getParameter(attrName);
            /*if(attrName.equals("AT20002")){
            	try {
					System.out.println("AT20002--:"+java.net.URLDecoder.decode(request.getParameter(attrName),"UTF-8"));
					value = java.net.URLDecoder.decode(request.getParameter(attrName),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }*/
            if (!attrName.equals("action")) {
                if ("PriTitle".equalsIgnoreCase(attrName)) {
                    row.setAttribute(attrName, CDSEUtil.getChineseStr(value));
                } else if ( (attrName.indexOf("Supp") < 0 ||
                             attrName.indexOf("supp") < 0) &&
                           attrName.indexOf("PrimaryCardNo") < 0) {
                    row.setAttribute(attrName, value);
                } else {
                    if ("SupplApplOnly".equalsIgnoreCase(attrName)) {
                        row.setAttribute(attrName, value);
                    }
                }
                if (attrName.equalsIgnoreCase("AppType")) {
                    if (!value.equals("1")) {
                        suppl = true;
                    }
                }
            }
        }
        if (suppl == true) {
            if (request.getParameter("supp1Check") != null &&
                request.getParameter("supp1Check").equals("1")) {
                SupplData1.setAttribute("SupplID",
                                        "1");
                SupplData1.setAttribute("PrimaryCardNo",
                                        request.getParameter("PrimaryCardNo1"));
                SupplData1.setAttribute("SuppBirthday",
                                        request.getParameter("SuppBirthday1"));
                SupplData1.setAttribute("SuppRelation",
                                        request.getParameter("SuppRelation1"));
                SupplData1.setAttribute("SuppLimitFlag",
                                        request.getParameter("SuppLimitFlag1"));
                SupplData1.setAttribute("SuppLimitPercent",request.getParameter("SuppLimitPercent1"));
                /**X64之后，修改附属卡*/
                SupplData1.setAttribute("SuppTitle",request.getParameter("SuppTitle1"));
                SupplData1.setAttribute("SuppIDType",request.getParameter("SuppIDType1"));
                SupplData1.setAttribute("SuppIDNo",request.getParameter("SuppIDNo1"));
                SupplData1.setAttribute("SuppJCBType",request.getParameter("SuppJCBType1"));
                
                row.appendChild(SupplData1);
            }

            if (request.getParameter("supp2Check") != null &&
                request.getParameter("supp2Check").equals("1")) {
                SupplData2.setAttribute("PrimaryCardNo",
                                        request.getParameter("PrimaryCardNo2"));
                SupplData2.setAttribute("SupplID",
                                        "2");
                SupplData2.setAttribute("SuppBirthday",
                                        request.getParameter("SuppBirthday2"));
                SupplData2.setAttribute("SuppRelation",
                                        request.getParameter("SuppRelation2"));
                SupplData2.setAttribute("SuppLimitFlag",
                                        request.getParameter("SuppLimitFlag2"));
                SupplData2.setAttribute("SuppLimitPercent",
                                        request.
                                        getParameter("SuppLimitPercent2"));
                /**X64之后，修改附属卡*/
                SupplData2.setAttribute("SuppTitle",request.getParameter("SuppTitle2"));
                SupplData2.setAttribute("SuppIDType",request.getParameter("SuppIDType2"));
                SupplData2.setAttribute("SuppIDNo",request.getParameter("SuppIDNo2"));
                SupplData2.setAttribute("SuppJCBType",request.getParameter("SuppJCBType2"));
                row.appendChild(SupplData2);
            }

            if (request.getParameter("supp3Check") != null &&
                request.getParameter("supp3Check").equals("1")) {

                SupplData3.setAttribute("PrimaryCardNo",
                                        request.getParameter("PrimaryCardNo3"));
                SupplData3.setAttribute("SupplID",
                                        "3");
                SupplData3.setAttribute("SuppBirthday",
                                        request.getParameter("SuppBirthday3"));
                SupplData3.setAttribute("SuppRelation",
                                        request.getParameter("SuppRelation3"));
                SupplData3.setAttribute("SuppLimitFlag",
                                        request.getParameter("SuppLimitFlag3"));
                SupplData3.setAttribute("SuppLimitPercent",
                                        request.
                                        getParameter("SuppLimitPercent3"));
                /**X64之后，修改附属卡*/
                SupplData3.setAttribute("SuppTitle",request.getParameter("SuppTitle3"));
                SupplData3.setAttribute("SuppIDType",request.getParameter("SuppIDType3"));
                SupplData3.setAttribute("SuppIDNo",request.getParameter("SuppIDNo3"));
                SupplData3.setAttribute("SuppJCBType",request.getParameter("SuppJCBType3"));
                row.appendChild(SupplData3);
            }

        }

        data.appendChild(row);
//        outputFile(doc, request);
        return doc;
    }

    private int outputFile(Document doc, HttpServletRequest request) {
        int success = 0;
        TransformerFactory tFactory = TransformerFactory.newInstance();
        Transformer transformer = null;
        try {
            transformer = tFactory.newTransformer();
            DOMSource source = null;
            source = new DOMSource(doc);
            StreamResult result = null;
            result = new StreamResult(new File("D:/BOCCDSE/Configure_CDSE/" +
                                               request.getParameter("AppId") +
                                               "_application.xml"));
            transformer.transform(source, result);
        } catch (TransformerException ex1) {
            success = -1;
            //errorString = "更新配置文件错误！(Read Configure Step)";
        }
        return 0;
    }
}
