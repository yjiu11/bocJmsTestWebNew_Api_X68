<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>CreateData.jsp</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel=stylesheet href="css/gc-css.css">
<SCRIPT language="JavaScript" src="js/checkForm.js"></SCRIPT><center>

<SCRIPT LANGUAGE=javascript>
function openwindow(){
 	test=window.open("CDS-0020.do?action=getStrategy");
}
</SCRIPT>

<SCRIPT LANGUAGE="JavaScript">
	var tt=new Date();
	var number = tt.getSeconds()%43;
	rnd.today=new Date();
	rnd.seed=rnd.today.getTime();
function submitinfo(type){

	document.form1.action="CDS-0010.do?action="+type;
	/* document.form1.aprvalue1.value=document.form1.CredAssetValue1.value;
	document.form1.aprvalue2.value=document.form1.CredAssetValue2.value;
	document.form1.aprvalue3.value=document.form1.CredAssetValue3.value;
	document.form1.aprvalue4.value=document.form1.CredAssetValue4.value;
	document.form1.aprvalue5.value=document.form1.CredAssetValue5.value;
	document.form1.aprvalue6.value=document.form1.CredAssetValue6.value; */
        /*
if(!(checkForm(form1))){
return false;
}
*/
	document.form1.submit();
        /*
if(checkForm1(form1)){

	document.form1.submit();
}else{
	return false;
}
*/

}


function selectsupp1(){
	if (document.all.supp1.checked==true){
		document.all.supp1Check.value="1";
	}else{
		document.all.supp1Check.value="0";
	}
}

function selectsupp2(){
	if (document.all.supp2.checked==true){
		document.all.supp2Check.value="1";
	}else{
		document.all.supp2Check.value="0";
	}
}
function selectsupp3(){
	if (document.all.supp3.checked==true){
		document.all.supp3Check.value="1";
	}else{
		document.all.supp3Check.value="0";
	}
}
function changeSupplyOnly(value){
	if (value=="1" || value=="2"){
		  document.all.SupplApplOnly.options[2].selected = true;
	}else if(value=="3"){
		  document.all.SupplApplOnly.options[1].selected = true;
	}
}

function changebytype(){
	if (document.all.AppType.options[3].selected==true){
		document.all.SupplApplOnly.options[1].selected = true;
	}else{
	document.all.SupplApplOnly.options[2].selected = true;
	}
}

function rnd() {
	rnd.seed = (rnd.seed*9301+49297) % 233280;
	return rnd.seed/(233280.0);
}
function rand(number) {
	return Math.ceil(rnd()*number);
}
function changeValue(){
changeOtherBankCardSta(document.form1.OtherBankCardSta.value)
if (document.form1.aprvalue1 !=null && document.form1.aprvalue1.value!=null){
changeValue1(document.all.form1.CredAssetType1.value,document.form1.aprvalue1.value);
}else{

changeValue1(document.all.form1.CredAssetType1.value,'');
}
if (document.form1.aprvalue2 !=null &&document.form1.aprvalue2.value!=null){
changeValue2(document.all.form1.CredAssetType2.value,document.form1.aprvalue2.value);
}else{
changeValue2(document.all.form1.CredAssetType2.value,'');
}
if (document.form1.aprvalue3 !=null &&document.form1.aprvalue3.value!=null){
changeValue3(document.all.form1.CredAssetType3.value,document.form1.aprvalue3.value);
}else{
changeValue3(document.all.form1.CredAssetType3.value,'');
}
if (document.form1.aprvalue4 !=null &&document.form1.aprvalue4.value!=null){
changeValue4(document.all.form1.CredAssetType4.value,document.form1.aprvalue4.value);
}else{
changeValue4(document.all.form1.CredAssetType4.value,'');
}
if (document.form1.aprvalue5 !=null &&document.form1.aprvalue5.value!=null){
changeValue5(document.all.form1.CredAssetType5.value,document.form1.aprvalue5.value);
}else{
changeValue5(document.all.form1.CredAssetType5.value,'');
}
if (document.form1.aprvalue6 !=null &&document.form1.aprvalue6.value!=null){
changeValue6(document.all.form1.CredAssetType6.value,document.form1.aprvalue6.value);
}else{
changeValue6(document.all.form1.CredAssetType6.value,'');
}
document.all.form1.IfPBOCInfo.options[1].selected = true;

changeIfPBOCInfoValue(document.all.form1.IfPBOCInfo.value);
}

function changeValue1(type,value){



	if (type==0){
		document.all("value1").innerHTML="<input type=\"hidden\" name=\"CredAssetValue1\" value=\""+value+"\">"
	}else if(type==21){
		document.all("value1").innerHTML="<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
	}else if(type==22){
		document.all("value1").innerHTML="<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（现值/元）"
	}else if(type==23){
				document.all("value1").innerHTML="<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（购买金额/元）"
	}else if(type==24){
				document.all("value1").innerHTML="<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==25){
				document.all("value1").innerHTML="<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==26){
				document.all("value1").innerHTML="<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（每年保费/元）"
	}
}
function changeValue2(type,value){


	if (type==0){
		document.all("value2").innerHTML="<input type=\"hidden\" name=\"CredAssetValue2\" value=\""+value+"\">"
	}else if(type==21){
		document.all("value2").innerHTML="<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
	}else if(type==22){
		document.all("value2").innerHTML="<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（现值/元）"
	}else if(type==23){
				document.all("value2").innerHTML="<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（购买金额/元）"
	}else if(type==24){
				document.all("value2").innerHTML="<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==25){
				document.all("value2").innerHTML="<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==26){
				document.all("value2").innerHTML="<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（每年保费/元）"
	}
}
function changeValue3(type,value){


	if (type==0){
		document.all("value3").innerHTML="<input type=\"hidden\" name=\"CredAssetValue3\" value=\""+value+"\">"
	}else if(type==21){
		document.all("value3").innerHTML="<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
	}else if(type==22){
		document.all("value3").innerHTML="<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（现值/元）"
	}else if(type==23){
				document.all("value3").innerHTML="<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（购买金额/元）"
	}else if(type==24){
				document.all("value3").innerHTML="<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==25){
				document.all("value3").innerHTML="<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==26){
				document.all("value3").innerHTML="<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（每年保费/元）"
	}
}
function changeValue4(type,value){


	if (type==0){
		document.all("value4").innerHTML="<input type=\"hidden\" name=\"CredAssetValue4\" value=\""+value+"\">"
	}else if(type==21){
		document.all("value4").innerHTML="<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
	}else if(type==22){
		document.all("value4").innerHTML="<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（现值/元）"
	}else if(type==23){
				document.all("value4").innerHTML="<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（购买金额/元）"
	}else if(type==24){
				document.all("value4").innerHTML="<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==25){
				document.all("value4").innerHTML="<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==26){
				document.all("value4").innerHTML="<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（每年保费/元）"
	}
}

function changeValue5(type,value){


	if (type==0){
		document.all("value5").innerHTML="<input type=\"hidden\" name=\"CredAssetValue5\" value=\""+value+"\">"
	}else if(type==21){
		document.all("value5").innerHTML="<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
	}else if(type==22){
		document.all("value5").innerHTML="<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（现值/元）"
	}else if(type==23){
				document.all("value5").innerHTML="<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（购买金额/元）"
	}else if(type==24){
				document.all("value5").innerHTML="<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==25){
				document.all("value5").innerHTML="<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==26){
				document.all("value5").innerHTML="<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（每年保费/元）"
	}
}

function changeValue6(type,value){


	if (type==0){
		document.all("value6").innerHTML="<input type=\"hidden\" name=\"CredAssetValue6\" value=\""+value+"\">"
	}else if(type==21){
		document.all("value6").innerHTML="<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
	}else if(type==22){
		document.all("value6").innerHTML="<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（现值/元）"
	}else if(type==23){
				document.all("value6").innerHTML="<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（购买金额/元）"
	}else if(type==24){
				document.all("value6").innerHTML="<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==25){
				document.all("value6").innerHTML="<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（金额/元）"
	}else if(type==26){
				document.all("value6").innerHTML="<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（每年保费/元）"
	}
}


function changeIncomeProofValue(type,value){
	if (type=='N'){
		document.all.form1.AprAnnIncome.value = '';
		document.getElementById("AprAnnIncomeID").readOnly=true;
	}else if(type=='Y'){
		document.getElementById("AprAnnIncomeId").readOnly=false;
		document.all.form1.AprAnnIncome.value = document.all.form1.AmmSalary.value;
	}
}
function changeAprSpeGrpType(value){
	if(value == "01" || value == "02" || value == "03" || value == "04" || value == "05" || value == "06" || value == "07" || value == "08" || value == "09" || value == "10" || value == "11" || value == "12" || value == "13" || value == "14" || value == "15" || value == "23" || value == "24"){
		document.form1.AprWrkSeniority.value = document.form1.CompPosSeniority.value;
		document.form1.AprPosLevl.options[2].selected = true;

	}else{
		document.form1.AprWrkSeniority.value = "";
	}


}



function changeOtherBankCardSta(value){
	if(value=="" || value=="0"){
		document.form1.OthCardCnt.disabled=true;

		document.form1.OthCardCnt.value="";

	}else{
	document.form1.OthCardCnt.disabled=false;
	}
}
function changeIfPBOCInfoValue(type,value){
	if (type==0 || type==2){
		document.all.form1.NumCCardAct.value = '';
		document.getElementById("NumCCardActID").readOnly=true;

		document.all.form1.CredCcardQcctNum.value = '';
		document.getElementById("CredCcardQcctNumID").readOnly=true;

		document.all.form1.TotlCCardCLmt.value = '';
		document.getElementById("TotlCCardCLmtID").readOnly=true;

		document.all.form1.TotlCCardOLmt.value = '';
		document.getElementById("TotlCCardOLmtID").readOnly=true;

		document.all.form1.CCardFrtOpnDate.value = '';
		document.getElementById("CCardFrtOpnDateID").readOnly=true;

		document.all.form1.CCardLstOpnDate.value = '';
		document.getElementById("CCardLstOpnDateID").readOnly=true;

		document.all.form1.CCardHiLimit.value = '';
		document.getElementById("CCardHiLimitID").readOnly=true;

		document.all.form1.CredCcardL6M3Num.value = '';
		document.getElementById("CredCcardL6M3NumID").readOnly=true;
		
	

		document.all.form1.CCardM0In3M.value = '';
		document.getElementById("CCardM0In3MID").readOnly=true;

		document.all.form1.CCardM1In3M.value = '';
		document.getElementById("CCardM1In3MID").readOnly=true;

		document.all.form1.CCardM2In3M.value = '';
		document.getElementById("CCardM2In3MID").readOnly=true;

		document.all.form1.CCardM1In6M.value = '';
		document.getElementById("CCardM1In6MID").readOnly=true;

		document.all.form1.CCardM2In12M.value = '';
		document.getElementById("CCardM2In12MID").readOnly=true;

		document.all.form1.CCardM2In12M.value = '';
		document.getElementById("CCardM2In12MID").readOnly=true;

		document.all.form1.CurrLoanBalance.value = '';
		document.getElementById("CurrLoanBalanceID").readOnly=true;
		
		document.all.form1.CredLoanContractOlmt.value = '';
		document.getElementById("CredLoanContractOlmtID").readOnly=true;

		document.all.form1.CurrLoanMthlyPay.value = '';
		document.getElementById("CurrLoanMthlyPayID").readOnly=true;

		document.all.form1.CredQcardL6M3Num.value = '';
		document.getElementById("CredQcardL6M3NumID").readOnly=true;
		
		document.all.form1.CredQcardL3M3Num.value = '';
		document.getElementById("CredQcardL3M3NumID").readOnly=true;
		
		document.all.form1.CredCcardL6M2Num.value = '';
		document.getElementById("CredCcardL6M2NumID").readOnly=true;


		document.all.form1.LoanM0In3M.value = '';
		document.getElementById("LoanM0In3MID").readOnly=true;

		document.all.form1.LoanM1In3M.value = '';
		document.getElementById("LoanM1In3MID").readOnly=true;

		document.all.form1.LoanM2In3M.value = '';
		document.getElementById("LoanM2In3MID").readOnly=true;

		document.all.form1.LoanM1In6M.value = '';
		document.getElementById("LoanM1In6MID").readOnly=true;

		document.all.form1.LoanM2In12M.value = '';
		document.getElementById("LoanM2In12MID").readOnly=true;
		
		document.all.form1.CredLoanL6M2Num.value = '';
		document.getElementById("CredLoanL6M2NumID").readOnly=true;
		
		document.all.form1.CredYearIncome.value = '';
		document.getElementById("CredYearIncomeID").readOnly=true;
		
		document.all.form1.ProvFundFirstLimit.value = '';
		document.getElementById("ProvFundFirstLimitID").readOnly=true;
		


		document.all.form1.CLM1In3M.value = '';
		document.getElementById("CLM1In3M").readOnly=true;
	}else if(type==1){
		document.getElementById("NumCCardActID").readOnly=false;
		document.getElementById("CredCcardQcctNumID").readOnly=false;
		document.getElementById("TotlCCardCLmtID").readOnly=false;
		document.getElementById("TotlCCardOLmtID").readOnly=false;
		document.getElementById("CCardFrtOpnDateID").readOnly=false;
		document.getElementById("CCardLstOpnDateID").readOnly=false;
		document.getElementById("CCardHiLimitID").readOnly=false;
		document.getElementById("CredCcardL6M3NumID").readOnly=false;

		document.getElementById("CCardM0In3MID").readOnly=false;
		document.getElementById("CCardM1In3MID").readOnly=false;
		document.getElementById("CCardM2In3MID").readOnly=false;
		document.getElementById("CCardM1In6MID").readOnly=false;
		document.getElementById("CCardM2In12MID").readOnly=false;
		document.getElementById("CCardM2In12MID").readOnly=false;
		document.getElementById("CurrLoanBalanceID").readOnly=false;
		document.getElementById("CredLoanContractOlmtID").readOnly=false;
		document.getElementById("CurrLoanMthlyPayID").readOnly=false;
		document.getElementById("CredQcardL6M3NumID").readOnly=false;
		document.getElementById("CredQcardL3M3NumID").readOnly=false;
		document.getElementById("CredCcardL6M2NumID").readOnly=false;
		document.getElementById("LoanM0In3MID").readOnly=false;
		document.getElementById("LoanM1In3MID").readOnly=false;
		document.getElementById("LoanM2In3MID").readOnly=false;
		document.getElementById("LoanM1In6MID").readOnly=false;
		document.getElementById("LoanM2In12MID").readOnly=false;
		document.getElementById("CredLoanL6M2NumID").readOnly=false;
		document.getElementById("CLM1In3M").readOnly=false;
		document.getElementById("CredYearIncomeID").readOnly=false;
		document.getElementById("ProvFundFirstLimitID").readOnly=false;

		
	}
}

function changeAssetProofValue(type,value){
	if (type=='N'){
		changeValue1('0','');
		changeValue2('0','');
		changeValue3('0','');
		changeValue4('0','');
		changeValue5('0','');
		changeValue6('0','');
	}else if(type=='Y'){

	}
}




function getChoose(){
  var campaignCd = new Array("DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001","DDDD00001");
  var productCd = new Array("","M001","M001","M001","M001","V001","V001","V001","V001","M001","M001","","V001","V002","M001","V001","M001","V001","V001","","M001","M001","V001","V001","M001","V001","","V001","M001","");

  var priBirthDate = new Array("","","","","","","","","","","19600213","19490211","19641211","19750706","19450829","19601212","19481013","19620622","19700525","19720514","19571021","19760618","19660609","19531006","19440601","19480304","19590422","19600710","19701028","19660523");
  var priNationality = new Array("CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN","CHN");
  var homeAddrPtCd = new Array("200245","200245","200245","200245","200245","200245","200245","200245","200245","200245","200030","200030","200000","200092","200030","200031","200000","200434","200235","200040","200120","200051","200126","201300","200052","201102","200237","200232","200080","200245");
  var homeResidingDurYear = new Array("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30");
  var homeResidingDurMonth = new Array("1","2","3","4","5","6","7","8","9","10","11","12");
  var homeMthlyRent = new Array("1000","1500","2000");//若为租用，每月租金
  var homeMthlyLonPayt = new Array("2000","3000","4000");//若为按揭购买，每月供款
  var priHomePhACd = new Array("","","","","","","","","","","64662","47364","","65542","27918","43397","69625","55391","32850","62565","32254","24141","50872","58018","62838","32322","64760","64569","65085","64302");
  var priHomePhNum = new Array("","","","","","","","","","","64662116","4736487","","65542814","2791888","4339779","6962509","55391760","3285033","62565900","3225445224","2414104","50872507","58018364","62838256","3232239","64760925","64569839","65085553","64302912");
  var dependentCnt = new Array("","","","","","","","","","","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
  var compAddrPtCd = new Array("200030","200030","200030","200030","200030","200030","200030","200030","200030","200030","200030","200437","200000","200002","200120","200120","200003","200003","200020","200040","200003","200335","200021","201309","200232","200003","200000","200041","200052","200240");
  var compPhCtryCd = new Array("","","");
  var compPhACd = new Array("","","","","","","","","","","","","","63236","38824","50494","69625","34240","","24759","32254","","64337","80713","64708","32322","59857","25618","62811","64300");
  var compPhNum = new Array("","","","","","","","","","","","","","63236205","38824588","50494950","6962509","34240850","","2475938","3225445224","","64337700","8071395","64708090","3232239","59857049","256184023","62811797","64300480");
  var priPosExpl = new Array("主卡申请人其他职位1","主卡申请人其他职位2","主卡申请人其他职位3");
  var compPosSeniority = new Array("","","");
  var mthlySalary = new Array("","","","","","","","","","","2000","1000","1000","2000","1000","5000","1000","1500","1400","1000","1400","1000","1000","1000","1000","2000","5000","1500","2000","1000");
  var annSalary = new Array("80000","40000","30000");

  var cCardCnt = new Array("3","3","3","3","3","3","3","3","3","3","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0");
  var assetValue = new Array("8193000","3910000","7129000","3313000","","6201000","","","","","6473000","","","120000","","","38000","","","","","","","","","","1266000","","","");
  var supplBirthDate = new Array("","","","","","","","","","","19520503","19410906","19611223","19720727","19271017","19480503","19520126","19580822","19690217","19700120","19390308","19750619","19630806","19510804","19390613","19290507","19670629","19551107","19700124","19620108");
  var priCardNum = new Array("1","2","3","4","","5","6","","7","","","","","","","","","","","6477","","","","","","","6693","","","6915");

  var supplLtdRatio = new Array("30","40","80");
  var priStatAddrPtCd = new Array("200031","200031","200031","200031","200031","200031","200031","200031","200031","200031","200031","200041","200011","200065","200093","200000","200030","200031","200031","200031","200031","200031","200031","200031","200031","200031","200031","200031","200031","200031");

  var entryChannel = new Array("DM","IB","EXNNNNN");
  var promotionChannel = new Array("HQ003","DM","DM","IB","BH广东","TO","TM","BH广东","P000006","BH广东","HQ003","P000006","TM","P000006","TO","BH上海","TO","HQ003","EX00008","TM","P000006","IN0000007","P000006","BH上海","DM","TO","EX00008","HQ003","P000006","IB");
  var applNum = new Array("9150","9154","9193","9251","9268","9295","9384","9880","10446","10447","43870","44225","44504","44671","45894","46597","46887","57479","57558","57869","58010","58064","58107","58190","58404","58465","58593","58929","59008","59140");

  var bOCCardBeginDate = new Array("","","","","","","","","","","","","","","","","","","","19890517","","","","","","","19780501","","","19840728");
  var bOCCardLimit = new Array("48848","45072","21324","13904","","19548","4731","","48216","","","","","","","","","","","47952","","","","","","","41952","","","7988");
  var bOCCardNum = new Array("3","6","1","5","","7","2","","2","","","","","","","","","","","1","","","","","","","2","","","2");
  var appRanNum = new Array("2872256","4332044","1479664","2672200","3773174","2034657","2964190","4032476","1527375","7547984","5552492","6924312","2435848","2122572","716459","1646967","5051100","9572104","3296854","862585","2396616","1361315","3431942","3415288","9935304","975073","9163112","4020994","6855368","1085443");
  var firstApprvdStrategyID = new Array("47","47","47","47","","47","47","","47","","","","","","","","","","","47","","","","","","","47","","","47");
  var appCnt = new Array("4","1","4","2","4","1","2","8","5","4","3","0","1","7","0","3","2","3","3","6","7","6","1","2","7","1","6","8","2","5");

  num1 = rand(2);
  num2 = rand(3);
  num3 = rand(4);
  num4 = rand(4);
  num5 = rand(6);
  num6 = rand(7);
  num7 = rand(8);
  num8 = rand(9);
  num11 = rand(12);
  num19 = rand(20);
  num29 = rand(30);

  document.all.form1.ComAddrPtCd.value = campaignCd[num29-1];
  //document.all.form1.ProductCd.value = productCd[num29-1];

  document.all.SupplApplOnly.options[2].selected = true;
  document.all.CCardTypeDownGrade.options[num1].selected = true;
  document.all.PriGender.options[num1].selected = true;
  document.all.form1.PriCardBirthday.value = priBirthDate[num29-1];
  document.all.PriIDType.options[num4].selected = true;//20040209 证件名称
  document.all.form1.PriNationality.value = priNationality[num29-1];
  document.all.PriMaritalSta.options[num3].selected = true;//20040209 婚姻状况
  document.all.PriEducationLvl.options[num4].selected = true;
  document.all.form1.PriHomePtCd.value = homeAddrPtCd[num29-1];
  document.all.form1.HomeResidingYear.value = homeResidingDurYear[num29-1];
  document.all.form1.HomeResidingMonth.value = homeResidingDurMonth[num11-1];
  document.all.HomeOwshType.options[num5].selected = true;
  if(document.all.HomeOwshType.options[num5].value==5){
    document.all.form1.HouseHireAmt.value = homeMthlyRent[num2-1];//若为租用，每月租金
  }
  if(document.all.HomeOwshType.options[num5].value==4){
    document.all.form1.HousePayAmt.value = homeMthlyLonPayt[num2-1];//若为按揭购买，每月供款
  }
  document.all.form1.HomePhonePro.value = priHomePhACd[num29-1];
  document.all.form1.HomePhoneNo.value = priHomePhNum[num29-1];
  document.all.form1.DependentCnt.value = dependentCnt[num29-1];
  document.all.form1.ComAddrPtCd.value = compAddrPtCd[num29-1];
  document.all.form1.CompTelPhonePro.value = compPhACd[num29-1];
  document.all.form1.CompTelPhone.value = compPhNum[num29-1];
  document.all.CompBizField.options[num19].selected = true;
  document.all.CompBizOwShType.options[num8].selected = true;
  document.all.PriPos.options[num19].selected = true;//20040209

  document.all.form1.CompPosSeniority.value = compPosSeniority[num2-1];
  document.all.form1.MthlySalary.value = mthlySalary[num29-1];
  document.all.form1.AmmSalary.value = annSalary[num2-1];
  document.all.OtherBankCardSta.options[num1].selected = true;
  document.all.form1.OthCardCnt.value = cCardCnt[num29-1];
//  document.all.OtherLon.options[num1].selected = true;

  document.all.BOCSaveActFlg.options[num1].selected = true;
  document.all.form1.AssetValue.value = assetValue[num29-1];
  document.all.CarOwShCondition.options[num1].selected = true;
  document.all.SuppBirthday1.value = supplBirthDate[num29-1];//0210
  document.all.SuppRelation1.options[num4].selected = true;
 document.all.SuppLimitFlag1.options[num1].selected = true;
  document.all.form1.SuppLimitPercent1.value = supplLtdRatio[num2-1];
  document.all.form1.PrimaryCardNo1.value = priCardNum[num29-1];

  document.all.SuppBirthday2.value = supplBirthDate[num29-1];//0210
  document.all.SuppRelation2.options[num4].selected = true;
 document.all.SuppLimitFlag2.options[num1].selected = true;
  document.all.form1.SuppLimitPercent2.value = supplLtdRatio[num2-1];
  document.all.form1.PrimaryCardNo2.value = priCardNum[num29-1];

  document.all.SuppBirthday3.value = supplBirthDate[num29-1];//0210
  document.all.SuppRelation3.options[num4].selected = true;
 document.all.SuppLimitFlag3.options[num1].selected = true;
  document.all.form1.SuppLimitPercent3.value = supplLtdRatio[num2-1];
  document.all.form1.PrimaryCardNo3.value = priCardNum[num29-1];

  document.all.SuppBirthday4.value = supplBirthDate[num29-1];//0210
  document.all.SuppRelation4.options[num4].selected = true;
 document.all.SuppLimitFlag4.options[num1].selected = true;
  document.all.form1.SuppLimitPercent4.value = supplLtdRatio[num2-1];
  document.all.form1.PrimaryCardNo4.value = priCardNum[num29-1];
 // document.all.SupplCardCurr.options[num1].selected = true;


  document.all.PriStatAddrSel.options[num1].selected = true;
//    document.all.form1.PriStatAddrPtCd.value = priStatAddrPtCd[num29-1];

  document.all.AutoPayMethod.options[num1].selected = true;
  document.all.AutoPayAmtSel.options[num1].selected = true;
  document.all.AutoPayActSel.options[num1].selected = true;


  document.all.form1.BKCC.value = entryChannel[num2-1];
  document.all.form1.BKBH.value = promotionChannel[num29-1];
  document.all.form1.AppId.value = applNum[num29-1];
  document.all.BKVIP.options[num1].selected = true;
  document.all.IDProof.options[num1].selected = true;
  document.all.JobProof.options[num1].selected = true;
  document.all.IncomeProof.options[num1].selected = true;
  document.all.AssetProof.options[num1].selected = true;

  document.all.BOCCardHolder.options[num1].selected = true;
  document.all.form1.BOCCardBeginDate.value = bOCCardBeginDate[num29-1];
  document.all.form1.BOCCardLimit.value = bOCCardLimit[num29-1];
  document.all.form1.BOCCardNum.value = bOCCardNum[num29-1];

  document.all.DPD30P24Mon.options[num1].selected = true;
  document.all.DPD60P24Mon.options[num1].selected = true;
  document.all.DPD90P24Mon.options[num1].selected = true;
  document.all.form1.AppRanNum.value = appRanNum[num29-1];
  document.all.form1.FirstApprvdStrategyID.value = firstApprvdStrategyID[num29-1];
  document.all.form1.AppCnt.value = appCnt[num29-1];

}
function checkForm1(){

  var CLmt=document.form1.TotlCCardCLmt.value;
  var OLmt=document.form1.TotlCCardOLmt.value;
  if(document.form1.IncomeProof.value == 'Y'){
if(document.form1.AprAnnIncome.value <= 0){
  		 alert('可证明的年收入额无效，请补充');
  		 document.getElementById("AprAnnIncomeID").focus();
  		 return false;

  	}

}






if(document.form1.PriNationality.value == "CHN" || document.form1.PriNationality.value == ""){
var number = document.form1.PriIDNo.value;
switch(number.length){

case 15:
 if(document.form1.PriIDType.value == 1){
 	if(document.form1.PriGender.value == 1){

 	   if(!(number.charAt(number.length-1)%2)){
 	   	alert('身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.PriGender.value == 2){

 	   if(number.charAt(number.length-1)%2){
 	   	alert('身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
case 18:
if(document.form1.PriIDType.value == 1){
 	if(document.form1.PriGender.value == 1){

 	   if(!(number.charAt(number.length-2)%2)){
 	   	alert('身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.PriGender.value == 2){

 	   if(number.charAt(number.length-2)%2){
 	   	alert('身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
default:
if(document.form1.PriIDType.value == 1){
alert('身份证位数不符合要求');
 return false;
break;
}
}
}
if(document.all.supp1Check.value==1){
var number1 = document.form1.SuppIDNo1.value;
switch(number1.length){

case 15:
 if(document.form1.SuppIDType1.value == 1){
 	if(document.form1.SuppSex1.value == 1){

 	   if(!(number1.charAt(number1.length-1)%2)){
 	   	alert('附属卡1身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.SuppSex1.value == 2){

 	   if(number1.charAt(number1.length-1)%2){
 	   	alert('附属卡1身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
case 18:
if(document.form1.SuppIDType1.value == 1){
 	if(document.form1.SuppSex1.value == 1){

 	   if(!(number1.charAt(number1.length-2)%2)){
 	   	alert('附属卡1身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.SuppSex1.value == 2){

 	   if(number1.charAt(number1.length-2)%2){
 	   	alert('附属卡1身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
}
}
if(document.all.supp2Check.value==1){
var number2 = document.form1.SuppIDNo2.value;
switch(number2.length){

case 15:
 if(document.form1.SuppIDType2.value == 1){
 	if(document.form1.SuppSex2.value == 1){

 	   if(!(number2.charAt(number2.length-1)%2)){
 	   	alert('附属卡2身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.SuppSex2.value == 2){

 	   if(number2.charAt(number2.length-1)%2){
 	   	alert('附属卡2身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
case 18:
if(document.form1.SuppIDType2.value == 1){
 	if(document.form1.SuppSex2.value == 1){

 	   if(!(number2.charAt(number2.length-2)%2)){
 	   	alert('附属卡2身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.SuppSex2.value == 2){

 	   if(number2.charAt(number2.length-2)%2){
 	   	alert('附属卡2身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
}
}

if(document.all.supp3Check.value==1){
var number3 = document.form1.SuppIDNo3.value;
switch(number3.length){

case 15:
 if(document.form1.SuppIDType3.value == 1){
 	if(document.form1.SuppSex3.value == 1){

 	   if(!(number3.charAt(number3.length-1)%2)){
 	   	alert('附属卡3身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.SuppSex3.value == 2){

 	   if(number3.charAt(number3.length-1)%2){
 	   	alert('附属卡3身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
case 18:
if(document.form1.SuppIDType3.value == 1){
 	if(document.form1.SuppSex3.value == 1){

 	   if(!(number3.charAt(number3.length-2)%2)){
 	   	alert('附属卡3身份证号码与性别不符');
 	   	return false;
 	   }
 	}
	if(document.form1.SuppSex3.value == 2){

 	   if(number3.charAt(number3.length-2)%2){
 	   	alert('附属卡3身份证号码与性别不符');
 	   	return false;
 	   }
 	}
break;
}
}
}
if(document.form1.HomeOwshType.value == 4){
	if(document.form1.HousePayAmt.value <= 0 ){
		alert('每月供款无效，请补充');
 	   	return false;
	}

}




if(document.all.supp1Check.value==1){
if(document.form1.SuppLimitFlag1.value == 2){
	if(document.form1.SuppLimitPercent1.value>100){

		document.form1.SuppLimitPercent1.value=100;
	}
	if(document.form1.SuppLimitPercent1.value < 0){
	                alert('附属卡1额度百分比无效，请重填');
			return false;
	}

}
}
if(document.all.supp2Check.value==1){
if(document.form1.SuppLimitFlag2.value == 2){
	if(document.form1.SuppLimitPercent2.value>100){

		document.form1.SuppLimitPercent2.value=100;
	}
	if(document.form1.SuppLimitPercent2.value < 0){
	                alert('附属卡2额度百分比无效，请重填');
			return false;
	}

}
}
if(document.all.supp3Check.value==1){
if(document.form1.SuppLimitFlag3.value == 2){
	if(document.form1.SuppLimitPercent3.value>100){

		document.form1.SuppLimitPercent3.value=100;
	}
	if(document.form1.SuppLimitPercent3.value < 0){
	                alert('附属卡3额度百分比无效，请重填');
			return false;
	}

}
}
if(document.form1.PriNationality.value == "CHN" || document.form1.PriNationality.value == ""){
var idcard = document.form1.PriIDNo.value;

switch(idcard.length){

case 15:

var cardbirth = idcard.substr(6,6);
if(document.form1.PriIDType.value == 1){
 if(document.form1.PriCardBirthday.value.substr(2,6)!=cardbirth){
 alert('身份证与出生日期不符');
 return false;
 }
 break;
 }
case 18:
var cardbirth = idcard.substr(6,8);
if(document.form1.PriIDType.value == 1){
  if(document.form1.PriCardBirthday.value!=cardbirth){
 alert('身份证与出生日期不符');
  return false;
 }
break;
}
default:
if(document.form1.PriIDType.value == 1){
alert('身份证位数不符合要求');
 return false;
break;
}
}
}
if(document.all.supp1Check.value==1){
if(document.form1.SuppIDType1.value == 1){
var idcard1 = document.form1.SuppIDNo1.value;

switch(idcard1.length){

case 15:

var cardbirth1 = idcard1.substr(6,6);

 if(document.form1.SuppBirthday1.value.substr(2,6)!=cardbirth1){
 alert('附属卡1身份证与出生日期不符');
 return false;
 }
 break;

case 18:
var cardbirth1 = idcard1.substr(6,8);

  if(document.form1.SuppBirthday1.value!=cardbirth1){
 alert('附属卡1身份证与出生日期不符');
  return false;
 }
break;

default:

alert('附属卡1身份证位数不符合要求');
 return false;
break;

}
}

}
if(document.all.supp2Check.value==1){
if(document.form1.SuppIDType2.value == 1){
var idcard2 = document.form1.SuppIDNo2.value;

switch(idcard2.length){

case 15:

var cardbirth2 = idcard2.substr(6,6);

 if(document.form1.SuppBirthday2.value.substr(2,6)!=cardbirth2){
 alert('附属卡2身份证与出生日期不符');
 return false;
 }
 break;

case 18:
var cardbirth2 = idcard2.substr(6,8);

  if(document.form1.SuppBirthday2.value!=cardbirth2){
 alert('附属卡2身份证与出生日期不符');
  return false;
 }
break;

default:

alert('附属卡2身份证位数不符合要求');
 return false;
break;


}

}
}
if(document.all.supp3Check.value==1){
if(document.form1.SuppIDType3.value == 1){
var idcard3 = document.form1.SuppIDNo3.value;

switch(idcard3.length){

case 15:

var cardbirth3 = idcard3.substr(6,6);

 if(document.form1.SuppBirthday3.value.substr(2,6)!=cardbirth3){
 alert('附属卡3身份证与出生日期不符');
 return false;
 }
 break;

case 18:
var cardbirth3 = idcard3.substr(6,8);

  if(document.form1.SuppBirthday3.value!=cardbirth3){
 alert('附属卡3身份证与出生日期不符');
  return false;
 }
break;

default:

alert('附属卡3身份证位数不符合要求');
 return false;
break;
}

}

}
if(document.form1.CredAssetType1.value != 0){
	if(document.form1.CredAssetValue1.value <1){
	alert('可证明的资产价值1无效，请补充');
 return false;
	}
}

if(document.form1.CredAssetType2.value != 0){
	if(document.form1.CredAssetValue2.value <1){
	alert('可证明的资产价值2无效，请补充');
 return false;
	}
}

if(document.form1.CredAssetType3.value != 0){
	if(document.form1.CredAssetValue3.value <1){
	alert('可证明的资产价值3无效，请补充');
 return false;
	}
}
if(document.form1.CredAssetType4.value != 0){
	if(document.form1.CredAssetValue4.value <1){
	alert('可证明的资产价值4无效，请补充');
 return false;
	}
}
if(document.form1.AppType.value == 2 || document.form1.AppType.value == 3){
	if(document.all.supp1.checked==false && document.all.supp2.checked==false && document.all.supp3.checked==false){
	alert('需要勾选附属卡标签');
	return false;
	}
}
return true;
}


function changeBKSTF(value){

	if(document.form1.BKSTF.value == 'Y'){

		document.form1.AprPosLevl.options[2].selected = true;
	}

}
function changeRecheckResult(value){

	if(document.form1.recheckResult.value == '1'){

		document.form1.AprPosLevl.options[2].selected = true;
	}

}
-->
</script>
<script>
function $(element){
return element = document.getElementById(element);
}
function $D(){
var d=$('class1content');
var h=d.offsetHeight + 30;
var maxh=350;
function dmove(){
h+=50; //层展开速度
if(h>=maxh){
d.style.height='auto;';
clearInterval(iIntervalId);
}else{
d.style.display='block';
d.style.height=h+'px';
}
}
iIntervalId=setInterval(dmove,2);
}
function $D2(){
var d=$('class1content');
var h=d.offsetHeight;
var maxh=350;
function dmove(){
h-=50;//层收缩速度
if(h<=0){
d.style.display='none';
clearInterval(iIntervalId);
}else{
d.style.height=h+'px';
}
}
iIntervalId=setInterval(dmove,2);
}
function $use(){
var d=$('class1content');
var sb=$('stateBut');
if(d.style.display=='none'){
$D();
sb.innerHTML='附属卡信息收缩';
}else{
$D2();
sb.innerHTML='附属卡信息展开';
}
}
</script>
<script>
function $(element){
	return element = document.getElementById(element);
}
function $D3(){
	var d=$('class1content1');
	var h=d.offsetHeight + 300;
	var maxh=1650;
	function dmove(){
		h+=50; //层展开速度
		if(h>=maxh){
		d.style.height='auto;';
		clearInterval(iIntervalId);
		}else{
		d.style.display='block';
		d.style.height=h+'px';
		}
	}
	iIntervalId=setInterval(dmove,2);
}
function $D4(){
	var d=$('class1content1');
	var h=d.offsetHeight;
	var maxh=1650;
	function dmove(){
		h-=50;//层收缩速度
		if(h<=0){
		d.style.display='none';
		clearInterval(iIntervalId);
		}else{
		d.style.height=h+'px';
		}
	}
	iIntervalId=setInterval(dmove,2);
}
function $use1(){
	var d=$('class1content1');
	var sb=$('stateBut1');
	if(d.style.display=='none'){
	$D3();
	sb.innerHTML='人行信息收缩';
	}else{
	$D4();
	sb.innerHTML='人行信息展开';
	}
}
</script>
  </head>
  
<body onLoad="changeValue()">

<form name="form" method="post">

    <table width="78%">
           <tr>
        <td width="50%" align = "center"> <span class="pt12" style = "font-size: 11pt;font-family= '黑体'" ><strong>信用卡授信决策系统(CDSE)</strong></span>        </td>
      <tr>
	  <tr>
        <td width="50%" align = "center"> <span class="pt12" style = "font-size: 11pt;font-family= '黑体'" ><strong>申请数据输入界面</strong></span>        </td>
	 </tr>
	<tr>
       <td width= "50%"align="right">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img onClick="javascript:openwindow();" src="img/button41.gif" width="120" height="26">
      </td>
	 </tr>
      </table>
</form>
  <form name="form1" method="post" action="">    <!--onSubmit="return CheckValid(this);"-->
  <input type="hidden" name="aprvalue1" value="">
  <input type="hidden" name="aprvalue2" value="">
  <input type="hidden" name="aprvalue3" value="">
   <input type="hidden" name="aprvalue4" value="">
     <input type="hidden" name="aprvalue5" value="">
   <input type="hidden" name="aprvalue6" value="">

  <input type="hidden" name="supp1Check" value="0">
  <input type="hidden" name="supp2Check" value="0">
  <input type="hidden" name="supp3Check" value="0">

  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong class="color">申请单信息（必填项）</strong></td>
    </tr>
    <tr>
        <td width="25%" class="BACKGROUND_a" align="right"><font color="red">*</font>申请单编号</td>
        <td width="25%" class="BACKGROUND_c">
            <input name="AppId" value="2011072000001" size=20 maxlength=16 isNeed="Y" fieldName="申请单编号">
        </td>
    </tr>
  </table>

    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong class="color">产品信息（必填项）</strong></td>
      </tr>
      <tr>
        <td width="25%" align="right" class="BACKGROUND_a"><font color="red">*</font> 申请产品编号</td>


        <td width="25%" class="BACKGROUND_c"><select name="ProductCd">
            <option value="">请选择</option>
	    <option value="cccc">错误卡</option>
	    <option value="1P02">长城万事达精英白金卡</option>
	    <option value="2TB1">中银淘宝校园卡</option>
	    <option value="2ZF1">中银淘宝联名信用卡</option>
	    <option value="2P01">中银威士至尊白金卡</option>
	    <option value="HQT1">长城环球通个人银联金卡</option>
            <option value="VM01">长城国际卡VISA美元金卡</option>
            <option value="VY01">长城国际卡VISA英镑金卡</option>
            <option value="MM01">长城国际卡Master card美元钛金卡</option>
            <option value="MY01">长城国际卡Master card英镑钛金卡</option>
            <option value="1001">万事达个人普卡</option>
            <option value="1002" selected>万事达个人金卡</option>
            <option value="1004">万事达员工普卡</option>
            <option value="1005" >万事达员工金卡</option>
            <option value="1009">万事达个人普卡（照）</option>
            <option value="1010" >万事达个人金卡（照）</option>
            <option value="1012">万事达员工普卡（照）</option>
            <option value="1013" >万事达员工金卡（照）</option>
            <option value="2001">VISA个人普卡</option>
            <option value="2002">VISA个人金卡</option>
            <option value="2004">VISA员工普卡</option>
            <option value="2005">VISA员工金卡</option>
            <option value="2009">VISA个人普卡（照）</option>
            <option value="2010">VISA个人金卡（照）</option>
            <option value="2012">VISA员工普卡（照）</option>
            <option value="2013">VISA员工金卡（照）</option>
            <option value="2O01">中银全民健身信用卡双币卡面红</option>
            <option value="2O02">中银全民健身信用卡双币卡面橙</option>
            <option value="2O03">中银全民健身信用卡双币卡面蓝</option>
            <option value="2O04">中银全民健身信用卡双币卡面绿</option>
            <option value="2O05">中银全民健身信用卡双币卡面黑</option>
            <option value="2L01">联想奥运联名双币卡</option>
            <option value="3002">JCB个人普卡</option>
            <option value="3001">JCB个人金卡</option>
            <option value="VZ01">中兴公务卡</option>
            <option value="4C01">川大联名金卡</option>
            <option value="4C02">川大联名银卡</option>
            <option value="4J01">交大认同卡</option>
            <option value="4001">都市卡(左卡)</option>
            <option value="4002">都市卡(右卡)</option>
            <option value="2JY1">金鹰联名卡</option>
            <option value="3003">久光JCB联名卡金卡</option>
            <option value="3004">久光JCB联名卡银卡</option>
            <option value="4PK1">北大信息卡</option>
            <option value="1CG1">庄胜崇光北大信用卡</option>
            <option value="3DZ1">大中金卡</option>
            <option value="3DZ2">大中普卡</option>
            <option value="2002">财政公务卡</option>
            <option value="2CZ1">武汉财务卡</option>
            <option value="BCZG">财政公务卡</option>
            <option value="1003">1003</option>
            <option value="1011">1011</option>
            <option value="1006">1006</option>
            <option value="1015">1015</option>
            <option value="4005">4005</option>
            <option value="4007">4007</option>
            <option value="4006">4006</option>
            <option value="4008">4008</option>
            <option value="4CA1">4CA1国航知音奥运个人卡(卡面一)</option>
            <option value="4CA2">4CA2国航知音奥运个人卡(卡面二)</option>
            <option value="4CA3">4CA3国航知音奥运个人卡(卡面三)</option>
            <option value="4CA4">4CA4国航知音奥运个人卡(卡面四)</option>
            <option value="4CA5">4CA5国航知音奥运个人卡(卡面五)</option>
            <option value="4CA6">4CA6国航知音奥运员工卡(卡面一)</option>
            <option value="4CA7">4CA7国航知音奥运员工卡(卡面二)</option>
            <option value="4CA8">4CA8国航知音奥运员工卡(卡面三)</option>
            <option value="4CA9">4CA9国航知音奥运员工卡(卡面四)</option>
            <option value="4CA0">4CA0国航知音奥运员工卡(卡面五)</option>
            <option value="4U01">4U01VISA高校卡</option>
            <option value="1R01">1R01万事达百货卡</option>
            <option value="1CT2">1CT2携程信用卡银卡</option>
            <option value="1CT1">1CT1携程信用卡金卡</option>
			<option value="1R02">中银万事达百货卡</option>
			<option value="1R03">中银万事达百货卡</option>
			<option value="1R04">中银万事达百货卡</option>
			<option value="1R05">中银银联海信金卡</option>
			<option value="1R06">中银银联海信银卡</option>
			<option value="1R19">中银银联吉林卓展金</option>
			<option value="1R20">中银银联吉林卓展普</option>
			<option value="1WY1">中银全国青联委员卡</option>
			<option value="3R01">中银JCB百货卡</option>
			<option value="3R02">中银银联晨曦</option>
			<option value="3R03">中银银联山东世纪泰华</option>
			<option value="3R04">中银JCB百货卡</option>
			<option value="3R05">中银JCB百货卡</option>
			<option value="3R06">中银JCB百货卡</option>
			<option value="4AW1">中银安利至尊卡</option>
			<option value="4AW2">中银安利金卡</option>
			<option value="4AW3">中银安利银卡</option>
			<option value="4CM1">移动中银奥运卡</option>
			<option value="4L01">中银VISA联名卡</option>
			<option value="4L02">中银VISA联名卡</option>
			<option value="4L03">中银银联广之旅</option>
			<option value="4L04">中银银联江苏宿迁</option>
			<option value="4L05">中银VISA联名卡</option>
			<option value="4L06">中银VISA联名卡</option>
			<option value="4L07">中银VISA联名卡</option>
			<option value="4L08">中银VISA联名卡</option>
			<option value="4L09">中银VISA联名卡</option>
			<option value="4L10">中银VISA联名卡</option>
			<option value="4L11">中银VISA联名卡</option>
			<option value="4L12">中银VISA联名卡</option>
			<option value="4L13">中银VISA联名卡</option>
			<option value="4L14">中银VISA联名卡</option>
			<option value="4L15">中银VISA联名卡</option>
			<option value="4L16">中银VISA联名卡</option>
			<option value="4L17">中银VISA联名卡</option>
			<option value="4L18">中银VISA联名卡</option>
			<option value="4L19">中银VISA联名卡</option>
			<option value="4L20">中银VISA联名卡</option>
			<option value="4OV1">奥运志愿者卡</option>
			<option value="4R01">中银银联莱雅</option>
			<option value="4R02">中银银联丹尼斯</option>
			<option value="4R03">中银银联兴隆</option>
			<option value="4R04">中银VISA百货卡</option>
			<option value="4R05">中银银联东购</option>
			<option value="4R06">中银VISA百货卡</option>
			<option value="4U02">中银银联东华大学</option>
			<option value="4U03">中银VISA高校卡(新版)</option>
			<option value="4U04">中银VISA高校卡(新版)</option>
			<option value="4U05">中银VISA高校卡(新版)</option>
			<option value="4U06">中银VISA高校卡(新版)</option>
			<option value="4U07">中银VISA高校卡(新版)</option>
			<option value="4U08">中银VISA高校卡(新版)</option>
			<option value="4U09">中银VISA高校卡(新版)</option>
			<option value="4U10">中银VISA高校卡(新版)</option>
			<option value="4U11">中银VISA高校卡(新版)</option>
			<option value="4U12">中银VISA高校卡(新版)</option>
			<option value="4U13">中银VISA高校卡(新版)</option>
			<option value="4U14">中银VISA高校卡(新版)</option>
			<option value="4U15">中银VISA高校卡(新版)</option>
			<option value="4U16">中银VISA高校卡(新版)</option>
			<option value="4U17">中银VISA高校卡(新版)</option>
			<option value="4U18">中银VISA高校卡(新版)</option>
			<option value="4U19">中银VISA高校卡(新版)</option>
			<option value="4U20">中银VISA高校卡(新版)</option>
			<option value="2007">VISA公务金卡</option>
			<option value="2008">VISA公务白金卡</option>
			<option value="1007">万事达公务金卡</option>
			<option value="1008">万事达公务白金卡</option>
			<option value="2P03">长城理财威士白金卡</option>
			<option value="1P03">长城万事达理财白金卡</option>
			<option value="1P02">长城万事达精英白金卡</option>
			<option value="1P01">万事达白金卡卡面</option>
			<option value="2P02">中银威士精英白金卡</option>
			<option value="2P01">长城威士白金卡</option>
			<option value="4HN1">中银我爱海南信用卡</option>
			<option value ="4CM1">中银银联全球通联名金卡</option>
			<option value ="4CM2">中银银联全球通联名普卡</option>
			<option value ="4101">标准中央预算单位公务卡</option>
			<option value ="4102">中央财政公务卡02</option>
			<option value ="4103">中央财政公务卡03</option>
			<option value ="4104">中央财政公务卡04</option>
			<option value ="4105">中央财政公务卡05</option>
			<option value ="4106">中央财政公务卡06</option>
			<option value ="4107">中央财政公务卡07</option>
			<option value ="4108">中央财政公务卡08</option>
			<option value ="4109">中央财政公务卡09</option>
			<option value ="4110">中央财政公务卡10</option>
			<option value ="4111">中央财政公务卡11</option>
			<option value ="4112">中央财政公务卡12</option>
			<option value ="4113">中央财政公务卡13</option>
			<option value ="4114">中央财政公务卡14</option>
			<option value ="4115">中央财政公务卡15</option>
			<option value ="4116">中央财政公务卡16</option>
			<option value ="4117">中央财政公务卡17</option>
			<option value ="4118">中央财政公务卡18</option>
			<option value ="4119">中央财政公务卡19</option>
			<option value ="4120">中央财政公务卡20</option>
			<option value ="4121">中央财政公务卡21</option>
			<option value ="4122">中央财政公务卡22</option>
			<option value ="4123">中央财政公务卡23</option>
			<option value ="4124">中央财政公务卡24</option>
			<option value ="4125">中央财政公务卡25</option>
			<option value ="4126">中央财政公务卡26</option>
			<option value ="4127">中央财政公务卡27</option>
			<option value ="4128">中央财政公务卡28</option>
			<option value ="4129">中央财政公务卡29</option>
			<option value ="4130">中央财政公务卡30</option>
			<option value ="4131">中央财政公务卡31</option>
			<option value ="4132">中央财政公务卡32</option>
			<option value ="4133">中央财政公务卡33</option>
			<option value ="4134">中央财政公务卡34</option>
			<option value ="4135">中央财政公务卡35</option>
			<option value ="4136">中央财政公务卡36</option>
			<option value ="4137">中央财政公务卡37</option>
			<option value ="4138">中央财政公务卡38</option>
			<option value ="4139">中央财政公务卡39</option>
			<option value ="4140">中央财政公务卡40</option>
			<option value ="4201">标准地方预算单位公务卡</option>
			<option value ="4202">辽宁省启运公务卡</option>
			<option value ="4203">海南省椰岛公务卡</option>
			<option value ="4204">青海省公务卡</option>
			<option value ="4205">陕西省预算单位公务卡</option>
			<option value ="4206">地方财政公务卡06</option>
			<option value ="4207">地方财政公务卡07</option>
			<option value ="4208">地方财政公务卡08</option>
			<option value ="4209">地方财政公务卡09</option>
			<option value ="4210">地方财政公务卡10</option>
			<option value ="4211">地方财政公务卡11</option>
			<option value ="4212">地方财政公务卡12</option>
			<option value ="4213">地方财政公务卡13</option>
			<option value ="4214">地方财政公务卡14</option>
			<option value ="4215">地方财政公务卡15</option>
			<option value ="4216">地方财政公务卡16</option>
			<option value ="4217">地方财政公务卡17</option>
			<option value ="4218">地方财政公务卡18</option>
			<option value ="4219">地方财政公务卡19</option>
			<option value ="4220">地方财政公务卡20</option>
			<option value ="4221">地方财政公务卡21</option>
			<option value ="4222">地方财政公务卡22</option>
			<option value ="4223">地方财政公务卡23</option>
			<option value ="4224">地方财政公务卡24</option>
			<option value ="4225">地方财政公务卡25</option>
			<option value ="4226">地方财政公务卡26</option>
			<option value ="4227">地方财政公务卡27</option>
			<option value ="4228">地方财政公务卡28</option>
			<option value ="4229">地方财政公务卡29</option>
			<option value ="4230">地方财政公务卡30</option>
			<option value ="4231">地方财政公务卡31</option>
			<option value ="4232">地方财政公务卡32</option>
			<option value ="4233">地方财政公务卡33</option>
			<option value ="4234">地方财政公务卡34</option>
			<option value ="4235">地方财政公务卡35</option>
			<option value ="4236">地方财政公务卡36</option>
			<option value ="4237">地方财政公务卡37</option>
			<option value ="4238">地方财政公务卡38</option>
			<option value ="4239">地方财政公务卡39</option>
			<option value ="4240">地方财政公务卡40</option>
			<option value ="2ZF1">中银支付宝联名信用卡</option>
			<option value ="2LY1">中银金鹰联名卡礼遇卡</option>
			<option value ="2R01">中银银联百货卡01</option>
			<option value ="2R02">中银银联丹东汇侨</option>
			<option value ="2R03">中银银联百货卡03</option>
			<option value ="2R04">中银银联富力广场</option>
			<option value ="2R05">中银银联百佳华</option>
			<option value ="2R06">中银银联欧尚</option>
			<option value ="2R07">中银银联百货卡07</option>
			<option value ="2R08">中银银联重庆茂业金卡</option>
			<option value ="2R09">中银银联重庆茂业普卡</option>
			<option value ="2R10">中银银联国家大剧院</option>
			<option value ="2R11">中银银联百货卡11</option>
			<option value ="2R12">中银银联百货卡12</option>
			<option value ="2R13">中银银联文峰</option>
			<option value ="2R14">中银银联江苏八佰伴</option>
			<option value ="2R15">中银银联江苏华地</option>
			<option value ="2R16">中银银联城市青年</option>
			<option value ="2R17">中银银联百货卡17</option>
			<option value ="2R18">中银银联百货卡18</option>
			<option value ="2R19">中银银联新世界</option>
			<option value ="2R20">中银银联百货卡20</option>
			<option value ="2R21">中银银联百货卡21</option>
			<option value ="2R22">中银银联快乐影响</option>
			<option value ="2R23">中银银联百货卡23</option>
			<option value ="2R24">中银银联大商金卡</option>
			<option value ="2R25">中银银联大商普卡</option>
			<option value ="2R26">中银银联百货卡26</option>
			<option value ="2R27">中银银联百货卡27</option>
			<option value ="2R28">中银银联百货卡28</option>
			<option value ="2R29">中银银联百货卡29</option>
			<option value ="2R30">中银银联百货卡30</option>
			<option value ="1CZ1">中银南航明珠信用卡金卡</option>
			<option value ="1CZ2">中银南航明珠信用卡普卡</option>
			<option value ="4HN1">中银大新华金鹏信用卡金卡</option>
			<option value ="4HN2">中银大新华金鹏信用卡普卡</option>
			<option value ="1SZ1">中银银联南航明珠金卡</option>
			<option value ="1SZ2">中银银联南航明珠普卡</option>
			<option value ="4MN1">中银蒙牛爱心信用卡金卡</option>
			<option value ="4MN2">中银蒙牛爱心信用卡普卡</option>
			<option value ="4050">长城银联公务卡</option>

			<option value ="CCR1">中银中国红信用卡</option>
			<option value ="2GS2">中银金盾信用卡普卡</option>
			<option value ="2GS1">中银金盾信用卡金卡</option>
			<option value ="4AW4">中银安利白金信用卡</option>
			<option value ="1PL1">中银真爱卡1</option>
			<option value ="1PL2">中银真爱卡2</option>
			<option value ="1PL3">中银真爱卡3</option>
			
			<option value ="2C01">中银银联美食卡</option>
			<option value ="2C02">中银银联广东环保主题卡</option>
			<option value ="2C03">中银银联福建中保汽车卡</option>
			<option value ="2C04">中银银联一路无忧汽车卡金卡</option>
			<option value ="2C05">中银银联一路无忧汽车卡普卡</option>
			<option value ="2C06">中银银联中南大学</option>
			<option value ="2C07">中银银联联名卡07</option>
			<option value ="2C08">中银银联联名卡08</option>
			<option value ="2C09">中银银联联名卡09</option>
            <option value ="2C10">中银银联联名卡10</option>
<option value ="2C11">中银银联联名卡11</option>
<option value ="2C12">中银银联联名卡12</option>
<option value ="2C13">中银银联联名卡13</option>
<option value ="2C14">中银银联联名卡14</option>
<option value ="2C15">中银银联联名卡15</option>
<option value ="2C16">中银银联联名卡16</option>
<option value ="2C17">中银银联联名卡17</option>
<option value ="2C18">中银银联联名卡18</option>
<option value ="2C19">中银银联联名卡19</option>
<option value ="2C20">中银银联联名卡20</option>
<option value ="2C21">中银银联联名卡21</option>
<option value ="2C22">中银银联联名卡22</option>
<option value ="2C23">中银银联联名卡23</option>
<option value ="2C24">中银银联联名卡24</option>
<option value ="2C25">中银银联联名卡25</option>
<option value ="2C26">中银银联联名卡26</option>
<option value ="2C27">中银银联联名卡27</option>
<option value ="2C28">中银银联联名卡28</option>
<option value ="2C29">中银银联联名卡29</option>
<option value ="2C30">中银银联联名卡30</option>
<option value ="2C31">中银银联联名卡31</option>
<option value ="2C32">中银银联联名卡32</option>
<option value ="2C33">中银银联联名卡33</option>
<option value ="2C34">中银银联联名卡34</option>
<option value ="2C35">中银银联联名卡35</option>
<option value ="2C36">中银银联联名卡36</option>
<option value ="2C37">中银银联联名卡37</option>
<option value ="2C38">中银银联联名卡38</option>
<option value ="2C39">中银银联联名卡39</option>
<option value ="2C40">中银银联联名卡40</option>
<option value ="2C41">中银银联联名卡41</option>
<option value ="2C42">中银银联联名卡42</option>
<option value ="2C43">中银银联联名卡43</option>
<option value ="2C44">中银银联联名卡44</option>
<option value ="2C45">中银银联联名卡45</option>
<option value ="2C46">中银银联联名卡46</option>
<option value ="2C47">中银银联联名卡47</option>
<option value ="2C48">中银银联联名卡48</option>
<option value ="2C49">中银银联联名卡49</option>
<option value ="2C50">中银银联联名卡50</option>
<option value ="2C51">中银银联联名卡51</option>
<option value ="2C52">中银银联联名卡52</option>
<option value ="2C53">中银银联联名卡53</option>
<option value ="2C54">中银银联联名卡54</option>
<option value ="2C55">中银银联联名卡55</option>
<option value ="2C56">中银银联联名卡56</option>
<option value ="2C57">中银银联联名卡57</option>
<option value ="2C58">中银银联联名卡58</option>
<option value ="2C59">中银银联联名卡59</option>
<option value ="2C60">中银银联联名卡60</option>
<option value ="2C61">中银银联联名卡61</option>
<option value ="2C62">中银银联联名卡62</option>
<option value ="2C63">中银银联联名卡63</option>
<option value ="2C64">中银银联联名卡64</option>
<option value ="2C65">中银银联联名卡65</option>
<option value ="2C66">中银银联联名卡66</option>
<option value ="2C67">中银银联联名卡67</option>
<option value ="2C68">中银银联联名卡68</option>
<option value ="2C69">中银银联联名卡69</option>
<option value ="2C70">中银银联联名卡70</option>
<option value ="2C71">中银银联联名卡71</option>
<option value ="2C72">中银银联联名卡72</option>
<option value ="2C73">中银银联联名卡73</option>
<option value ="2C74">中银银联联名卡74</option>
<option value ="2C75">中银银联联名卡75</option>
<option value ="2C76">中银银联联名卡76</option>
<option value ="2C77">中银银联联名卡77</option>
<option value ="2C78">中银银联联名卡78</option>
<option value ="2C79">中银银联联名卡79</option>
<option value ="2C80">中银银联联名卡80</option>
<option value ="2C81">中银银联联名卡81</option>
<option value ="2C82">中银银联联名卡82</option>
<option value ="2C83">中银银联联名卡83</option>
<option value ="2C84">中银银联联名卡84</option>
<option value ="2C85">中银银联联名卡85</option>
<option value ="2C86">中银银联联名卡86</option>
<option value ="2C87">中银银联联名卡87</option>
<option value ="2C88">中银银联联名卡88</option>
<option value ="2C89">中银银联联名卡89</option>
<option value ="2C90">中银银联联名卡90</option>
<option value ="2C91">中银银联联名卡91</option>
<option value ="2C92">中银银联联名卡92</option>
<option value ="2C93">中银银联联名卡93</option>
<option value ="2C94">中银银联联名卡94</option>
<option value ="2C95">中银银联联名卡95</option>
<option value ="2C96">中银银联联名卡96</option>
<option value ="2C97">中银银联联名卡97</option>
<option value ="2C98">中银银联联名卡98</option>
<option value ="2C99">中银银联联名卡99</option>
<option value ="4BW1">长城北京外企联名卡银联金</option>
<option value ="4BW2">长城北京外企联名卡银联普</option>
<option value ="4BW3">长城北京外企联名卡万事达金</option>
<option value ="4BW4">长城北京外企联名卡万事达普</option>
<option value ="4LC1">中银银联中银理财</option>		
<option value ="1R11">中银银联明都金卡</option>
<option value ="1R12">中银银联明都普卡</option>				
<option value ="4SG1">中银全民健身信用卡单币卡面蓝</option>
<option value ="4SG2">中银全民健身信用卡单币卡面黑</option>
<option value ="4SG3">中银全民健身信用卡单币卡面红</option>
<option value ="4SG4">中银全民健身信用卡单币卡面橙</option>
<option value ="4SG5">中银全民健身信用卡单币卡面绿</option>
<option value ="3005">J中银银联CB招财猫金卡</option>
<option value ="3006">中银银联JCB招财猫普卡</option>
<option value ="1PL4">中银银联杭州大厦信用卡</option>	
<option value ="4R08">广州王府井金卡</option>	
<option value ="4R09">广州王府井普卡</option>	
<option value ="4F01">长城房贷通信用卡黑卡</option>	
<option value ="4F02">长城房贷通信用卡红卡</option>	
<option value ="4S01">长城吉林社保信用卡</option>	
<option value ="4X01">长城吉林大学信用卡</option>
<option value ="4XE1">长城我的e家信用卡</option>	
<option value ="4XA1">长城新奥卓越信用卡金卡</option>	
<option value ="4XA2">长城新奥卓越信用卡普卡</option>				
          </select></td>
      </tr>
    </table>
  
<b><span>临增、长增</span></b>
<table  width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
<tr>
<td class="BACKGROUND_a" align="center" colspan="4">产品层</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5620产品大类</td><td>
<select name="AT5620" id="AT5620">
<option value="">未知</option>
<option value="1"selected>个人卡</option>
<option value="2">高端卡</option>
<option value="3">公务卡</option>
</select>
</td>
</tr>
<tr>
	<td class="BACKGROUND_a" align="center" colspan="4">客户信息</td><td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4660近6个月内，M1次数</td><td>	
<input type="text" name="AT4660" id="AT4660" value="0"/> 	</td>
</tr>
<tr>									
<td class="BACKGROUND_a" align="left">AT4670卡龄</td><td>
<input type="text" name="AT4670" id="AT4670" value="5"/> 
</td>
</tr>
<tr>

<!-- <td class="BACKGROUND_a" align="left">AT4722其他排除状态	</td><td>
<select name="AT4722" id="AT4722">
<option value="">未知</option>
<option value="1">是</option>
<option value="2">否</option>
</select>
	</td>
	</tr>
<tr>-->

	</tr>

<tr>
<td class="BACKGROUND_a" align="left">AT4723客户是否要最大额度</td><td>
<select name="AT4723" id="AT4723">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td> 
</tr>
<tr>
<td class="BACKGROUND_a" align="center" colspan="4">额度</td>
</tr>
<tr>					
<td class="BACKGROUND_a" align="left">AT4750申请卡币种</td><td>
<select name="AT4750" id="AT4750">
<option value="">未知</option>
<option value="156" selected="selected">人民币</option>
<option value="840">美元</option>
<option value="392">日元</option>
<option value="344">港元</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4760申请卡汇率</td><td>
<input type="text" name="AT4760" id="AT4760" value="1"/> 
</td>
</tr>
<tr>
<td style="color: red" class="BACKGROUND_a" align="left">AT5601预设额度</td><td>
<input type="text" name="AT5601" id="AT5601" value="50000"/> 
</td>	
</tr>
<tr>												
<td class="BACKGROUND_a" align="left">AT5602渠道系统标识</td><td>
<select name="AT5602" id="AT5602">
<option value="">未知</option>
<option value="01" selected>总行NUW</option>
<option value="02">总行CSR</option>
<option value="03">总行CRM</option>
<option value="04">分行落地终端</option>
<option value="05">网银</option>
<option value="06">微信 </option>
<option value="07">财富OCRM</option>
</select>
</td>
</tr>


<td></td>	
<td></td>
<tr>
<td class="BACKGROUND_a" align="left">AT5605任务类型标识 </td><td>
<select name="AT5605" id="AT5605">
<option value="">未知</option>
<option value="01">申请评分</option>
<option value="02" selected="selected">临增</option>
<option value="03">长增</option>
<option value="04">事件式增额</option>
<option value="05">批量增额</option>
<option value="06">风险预警</option>
</select>
</td>									
<td class="BACKGROUND_a" align="left">AT5607所属分行临增上限</td><td>
<input type="text" name="AT5607" id="AT5607" value="50000"/> 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5608所属分行长增上限</td><td>
<input type="text" name="AT5608" id="AT5608" value="50000"/> 
</td>
<td class="BACKGROUND_a" align="left">AT6050预设额度更新渠道</td><td>
<input type="text" name="AT6050" id="AT6050" value="1"/> 
</td>
</tr>
<!-- <tr>
<td class="BACKGROUND_a" align="left">AT5609公司组织机构代码号</td><td>
<input type="text" name="AT5609" id="AT5609" value="0"/> 
</td>
</tr> -->
<tr>									
<!-- <td class="BACKGROUND_a" align="left">AT5611公务卡长增上限 </td><td>
<input type="text" name="AT5611" id="AT5611" value="0"/> 
</td> -->
<td class="BACKGROUND_a" align="left">AT5640是否接受低于期望额度</td><td>
<select name="AT5640" id="AT5640">
<option value="">未知</option>
<option value="1" selected>是</option>
<option value="2">否</option>
</select>
</td>		
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5630期望额度： </td><td>
<input type="text" name="AT5630" id="AT5630" value="60000"/> 
</td>
<!-- <td class="BACKGROUND_a" align="left">AT4440工单产品的当前永久额度（产品层）</td><td>
<input name="AT4440" id="AT4440" type="text" value="5000" />
</td>	 -->						
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT6020客户所有名下有效卡的最高永久额度 </td><td>
 <input type="text" name="AT6020" id="AT6020" value="30000" /> 
</td>
<!-- <td class="BACKGROUND_a" align="left">AT6030工单卡片子级CC01当前永久额度</td><td>
<input type="text" name="AT6030" id="AT6030" value="10000"/> 
</td> -->
</tr>
<tr><td class="BACKGROUND_a" align="left">AT5612客户近三个月行内资产余额</td>
<td><input type="text" name="AT5612" id="AT5612" value="0"/></td>
</tr>
</table>
  <p>
    <img onClick="javascript:submitinfo('saveXml');" src="img/button8.gif" width="54" height="26">
    <img onClick="javascript:submitinfo('create');" src="img/审批.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('network');" src="img/网申.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('temporary');" src="img/临调.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('permanent');" src="img/永调.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('channel');" src="img/临调.jpg" width="54" height="26">
  </p>
</form>
<table width="100%" cellspacing="0" cellpadding="0" >
    <tr>
    	<td with= 75% align=center height="32"><span><font size="1">Copyright &copy; 2005 北京首航财务管理有限公司 版权所有</font></span>
    </tr>
</table>
</body></center>
</html>
   