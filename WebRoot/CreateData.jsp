<%@ page language="java" pageEncoding="GB2312"%>

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
<SCRIPT language="JavaScript" src="js/checkForm.js"></SCRIPT>
<script src="js/jquery-1.7.2.min.js"></script>  
<script type="text/javascript">  
var $j = jQuery.noConflict(); //������$�Ŀ���Ȩ�öɸ�prototype.js
// ���������Ƿ�ɹ�  
$j(document).ready(function() { 
	$j("#re").click(function(){
		$j("input:text", document.forms[1]).each(function() {
			if(this.name!="PriCardBirthday" &&
					this.name!="MPSBirthDate" && 
					this.name!="CCardFrtOpnDate"&&
					this.name!="A05008"&&this.name!="A06009"&&
					this.name!="A05002"&&this.name!="A08004"&&
					this.name!="A10004"&&this.name!="AT4460"&&
					this.name!="AT4451"&&this.name!="AT20010"&&
					this.name!="BOCCardBeginDate"&&
					this.name!="CCardLstOpnDate"&&this.name!="AT20031"){
				this.value = "";
			}
					
		});
		$j("select", document.forms[1]).each(function() {
			if(this.name!="ZeroLimitFlag"&&
			   this.name!="AT20001" &&
			   this.name!="EomChkResult"&&
			   this.name!="AT20011"&&
			   this.name!="BH"&&
			   this.name!="AT20009"){
			$j(this).val("");				
			}
		});
	});
});
</script>  
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
	function ctlSubmit(event, type) {
		if (event.ctrlKey && event.keyCode == 13) {
			document.form1.action = "CDS-0010.do?action=" + type;
			document.form1.aprvalue1.value = document.form1.CredAssetValue1.value;
			document.form1.aprvalue2.value = document.form1.CredAssetValue2.value;
			document.form1.aprvalue3.value = document.form1.CredAssetValue3.value;
			document.form1.aprvalue4.value = document.form1.CredAssetValue4.value;
			document.form1.aprvalue5.value = document.form1.CredAssetValue5.value;
			document.form1.aprvalue6.value = document.form1.CredAssetValue6.value;
			//document.form1.AT20002.value = encodeURI(encodeURI(document.form1.AT20002.value));
			document.form1.submit();
		}
	}
	function submitinfo(type) {
		document.form1.action = "CDS-0010.do?action=" + type;
		document.form1.aprvalue1.value = document.form1.CredAssetValue1.value;
		document.form1.aprvalue2.value = document.form1.CredAssetValue2.value;
		document.form1.aprvalue3.value = document.form1.CredAssetValue3.value;
		document.form1.aprvalue4.value = document.form1.CredAssetValue4.value;
		document.form1.aprvalue5.value = document.form1.CredAssetValue5.value;
		document.form1.aprvalue6.value = document.form1.CredAssetValue6.value;
		//alert(document.form1.AT20002.value);
		//alert(encodeURI(encodeURI(document.form1.AT20002.value)));
		//document.form1.AT20002.value=encodeURI(encodeURI(document.form1.AT20002.value));
		//document.form1.AT20002.value = encodeURI(encodeURI(document.form1.AT20002.value));
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

	function selectsupp1() {
		if (document.all.supp1.checked == true) {
			document.all.supp1Check.value = "1";
		} else {
			document.all.supp1Check.value = "0";
		}
	}

	function selectsupp2() {
		if (document.all.supp2.checked == true) {
			document.all.supp2Check.value = "1";
		} else {
			document.all.supp2Check.value = "0";
		}
	}
	function selectsupp3() {
		if (document.all.supp3.checked == true) {
			document.all.supp3Check.value = "1";
		} else {
			document.all.supp3Check.value = "0";
		}
	}
	function changeSupplyOnly(value) {
		if (value == "1" || value == "2") {
			document.all.SupplApplOnly.options[2].selected = true;
		} else if (value == "3") {
			document.all.SupplApplOnly.options[1].selected = true;
		}
	}

	function changebytype() {
		if (document.all.AppType.options[3].selected == true) {
			document.all.SupplApplOnly.options[1].selected = true;
		} else {
			document.all.SupplApplOnly.options[2].selected = true;
		}
	}

	function rnd() {
		rnd.seed = (rnd.seed * 9301 + 49297) % 233280;
		return rnd.seed / (233280.0);
	}
	function rand(number) {
		return Math.ceil(rnd() * number);
	}
	function changeValue() {
		changeOtherBankCardSta(document.form1.OtherBankCardSta.value)
		if (document.form1.aprvalue1 != null
				&& document.form1.aprvalue1.value != null) {
			changeValue1(document.all.form1.CredAssetType1.value,
					document.form1.aprvalue1.value);
		} else {

			changeValue1(document.all.form1.CredAssetType1.value, '');
		}
		if (document.form1.aprvalue2 != null
				&& document.form1.aprvalue2.value != null) {
			changeValue2(document.all.form1.CredAssetType2.value,
					document.form1.aprvalue2.value);
		} else {
			changeValue2(document.all.form1.CredAssetType2.value, '');
		}
		if (document.form1.aprvalue3 != null
				&& document.form1.aprvalue3.value != null) {
			changeValue3(document.all.form1.CredAssetType3.value,
					document.form1.aprvalue3.value);
		} else {
			changeValue3(document.all.form1.CredAssetType3.value, '');
		}
		if (document.form1.aprvalue4 != null
				&& document.form1.aprvalue4.value != null) {
			changeValue4(document.all.form1.CredAssetType4.value,
					document.form1.aprvalue4.value);
		} else {
			changeValue4(document.all.form1.CredAssetType4.value, '');
		}
		if (document.form1.aprvalue5 != null
				&& document.form1.aprvalue5.value != null) {
			changeValue5(document.all.form1.CredAssetType5.value,
					document.form1.aprvalue5.value);
		} else {
			changeValue5(document.all.form1.CredAssetType5.value, '');
		}
		if (document.form1.aprvalue6 != null
				&& document.form1.aprvalue6.value != null) {
			changeValue6(document.all.form1.CredAssetType6.value,
					document.form1.aprvalue6.value);
		} else {
			changeValue6(document.all.form1.CredAssetType6.value, '');
		}
		document.all.form1.IfPBOCInfo.options[1].selected = true;

		changeIfPBOCInfoValue(document.all.form1.IfPBOCInfo.value);
	}

	function changeValue1(type, value) {

		if (type == 0) {
			document.all("value1").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue1\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">���������/ƽ�ף�"
		} else if (type == 22) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">����ֵ/Ԫ��"
		} else if (type == 23) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">��������/Ԫ��"
		} else if (type == 24) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 25) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 26) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">��ÿ�걣��/Ԫ��"
		}
	}
	function changeValue2(type, value) {

		if (type == 0) {
			document.all("value2").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue2\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">���������/ƽ�ף�"
		} else if (type == 22) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">����ֵ/Ԫ��"
		} else if (type == 23) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">��������/Ԫ��"
		} else if (type == 24) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 25) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 26) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">��ÿ�걣��/Ԫ��"
		}
	}
	function changeValue3(type, value) {

		if (type == 0) {
			document.all("value3").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue3\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">���������/ƽ�ף�"
		} else if (type == 22) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">����ֵ/Ԫ��"
		} else if (type == 23) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">��������/Ԫ��"
		} else if (type == 24) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 25) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 26) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">��ÿ�걣��/Ԫ��"
		}
	}
	function changeValue4(type, value) {

		if (type == 0) {
			document.all("value4").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue4\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">���������/ƽ�ף�"
		} else if (type == 22) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">����ֵ/Ԫ��"
		} else if (type == 23) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">��������/Ԫ��"
		} else if (type == 24) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 25) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 26) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">��ÿ�걣��/Ԫ��"
		}
	}

	function changeValue5(type, value) {

		if (type == 0) {
			document.all("value5").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue5\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">���������/ƽ�ף�"
		} else if (type == 22) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">����ֵ/Ԫ��"
		} else if (type == 23) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">��������/Ԫ��"
		} else if (type == 24) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 25) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 26) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">��ÿ�걣��/Ԫ��"
		}
	}

	function changeValue6(type, value) {

		if (type == 0) {
			document.all("value6").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue6\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">���������/ƽ�ף�"
		} else if (type == 22) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">����ֵ/Ԫ��"
		} else if (type == 23) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">��������/Ԫ��"
		} else if (type == 24) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 25) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">�����/Ԫ��"
		} else if (type == 26) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">��ÿ�걣��/Ԫ��"
		}
	}

	function changeIncomeProofValue(type, value) {
		if (type == 'N') {
			document.all.form1.AprAnnIncome.value = '';
			document.getElementById("AprAnnIncomeID").readOnly = true;
		} else if (type == 'Y') {
			document.getElementById("AprAnnIncomeId").readOnly = false;
			document.all.form1.AprAnnIncome.value = document.all.form1.AmmSalary.value;
		}
	}
	function changeAprSpeGrpType(value) {
		if (value == "01" || value == "02" || value == "03" || value == "04"
				|| value == "05" || value == "06" || value == "07"
				|| value == "08" || value == "09" || value == "10"
				|| value == "11" || value == "12" || value == "13"
				|| value == "14" || value == "15" || value == "23"
				|| value == "24") {
			document.form1.AprWrkSeniority.value = document.form1.CompPosSeniority.value;
			document.form1.AprPosLevl.options[2].selected = true;

		} else {
			document.form1.AprWrkSeniority.value = "";
		}

	}

	function changeOtherBankCardSta(value) {
		if (value == "" || value == "0") {
			document.form1.OthCardCnt.disabled = true;

			document.form1.OthCardCnt.value = "";

		} else {
			document.form1.OthCardCnt.disabled = false;
		}
	}
	function changeIfPBOCInfoValue(type, value) {
		if (type == 0 || type == 2) {
			document.all.form1.NumCCardAct.value = '';
			document.getElementById("NumCCardActID").readOnly = true;

			document.all.form1.CredCcardQcctNum.value = '';
			document.getElementById("CredCcardQcctNumID").readOnly = true;

			document.all.form1.TotlCCardCLmt.value = '';
			document.getElementById("TotlCCardCLmtID").readOnly = true;

			document.all.form1.TotlCCardOLmt.value = '';
			document.getElementById("TotlCCardOLmtID").readOnly = true;

			document.all.form1.CCardFrtOpnDate.value = '';
			document.getElementById("CCardFrtOpnDateID").readOnly = true;

			document.all.form1.CCardLstOpnDate.value = '';
			document.getElementById("CCardLstOpnDateID").readOnly = true;

			document.all.form1.CCardHiLimit.value = '';
			document.getElementById("CCardHiLimitID").readOnly = true;

			document.all.form1.CredCcardL6M3Num.value = '';
			document.getElementById("CredCcardL6M3NumID").readOnly = true;

			document.all.form1.CCardM0In3M.value = '';
			document.getElementById("CCardM0In3MID").readOnly = true;

			document.all.form1.CCardM1In3M.value = '';
			document.getElementById("CCardM1In3MID").readOnly = true;

			document.all.form1.CCardM2In3M.value = '';
			document.getElementById("CCardM2In3MID").readOnly = true;

			document.all.form1.CCardM1In6M.value = '';
			document.getElementById("CCardM1In6MID").readOnly = true;

			document.all.form1.CCardM2In12M.value = '';
			document.getElementById("CCardM2In12MID").readOnly = true;

			document.all.form1.CCardM2In12M.value = '';
			document.getElementById("CCardM2In12MID").readOnly = true;

			document.all.form1.CurrLoanBalance.value = '';
			document.getElementById("CurrLoanBalanceID").readOnly = true;

			document.all.form1.CredLoanContractOlmt.value = '';
			document.getElementById("CredLoanContractOlmtID").readOnly = true;

			document.all.form1.CurrLoanMthlyPay.value = '';
			document.getElementById("CurrLoanMthlyPayID").readOnly = true;

			document.all.form1.CredQcardL6M3Num.value = '';
			document.getElementById("CredQcardL6M3NumID").readOnly = true;

			document.all.form1.CredQcardL3M3Num.value = '';
			document.getElementById("CredQcardL3M3NumID").readOnly = true;

			document.all.form1.CredCcardL6M2Num.value = '';
			document.getElementById("CredCcardL6M2NumID").readOnly = true;

			document.all.form1.LoanM0In3M.value = '';
			document.getElementById("LoanM0In3MID").readOnly = true;

			document.all.form1.LoanM1In3M.value = '';
			document.getElementById("LoanM1In3MID").readOnly = true;

			document.all.form1.LoanM2In3M.value = '';
			document.getElementById("LoanM2In3MID").readOnly = true;

			document.all.form1.LoanM1In6M.value = '';
			document.getElementById("LoanM1In6MID").readOnly = true;

			document.all.form1.LoanM2In12M.value = '';
			document.getElementById("LoanM2In12MID").readOnly = true;

			document.all.form1.CredLoanL6M2Num.value = '';
			document.getElementById("CredLoanL6M2NumID").readOnly = true;

			document.all.form1.CredYearIncome.value = '';
			document.getElementById("CredYearIncomeID").readOnly = true;

			document.all.form1.ProvFundFirstLimit.value = '';
			document.getElementById("ProvFundFirstLimitID").readOnly = true;

			document.all.form1.CLM1In3M.value = '';
			document.getElementById("CLM1In3M").readOnly = true;
		} else if (type == 1) {
			document.getElementById("NumCCardActID").readOnly = false;
			document.getElementById("CredCcardQcctNumID").readOnly = false;
			document.getElementById("TotlCCardCLmtID").readOnly = false;
			document.getElementById("TotlCCardOLmtID").readOnly = false;
			document.getElementById("CCardFrtOpnDateID").readOnly = false;
			document.getElementById("CCardLstOpnDateID").readOnly = false;
			document.getElementById("CCardHiLimitID").readOnly = false;
			document.getElementById("CredCcardL6M3NumID").readOnly = false;

			document.getElementById("CCardM0In3MID").readOnly = false;
			document.getElementById("CCardM1In3MID").readOnly = false;
			document.getElementById("CCardM2In3MID").readOnly = false;
			document.getElementById("CCardM1In6MID").readOnly = false;
			document.getElementById("CCardM2In12MID").readOnly = false;
			document.getElementById("CCardM2In12MID").readOnly = false;
			document.getElementById("CurrLoanBalanceID").readOnly = false;
			document.getElementById("CredLoanContractOlmtID").readOnly = false;
			document.getElementById("CurrLoanMthlyPayID").readOnly = false;
			document.getElementById("CredQcardL6M3NumID").readOnly = false;
			document.getElementById("CredQcardL3M3NumID").readOnly = false;
			document.getElementById("CredCcardL6M2NumID").readOnly = false;
			document.getElementById("LoanM0In3MID").readOnly = false;
			document.getElementById("LoanM1In3MID").readOnly = false;
			document.getElementById("LoanM2In3MID").readOnly = false;
			document.getElementById("LoanM1In6MID").readOnly = false;
			document.getElementById("LoanM2In12MID").readOnly = false;
			document.getElementById("CredLoanL6M2NumID").readOnly = false;
			document.getElementById("CLM1In3M").readOnly = false;
			document.getElementById("CredYearIncomeID").readOnly = false;
			document.getElementById("ProvFundFirstLimitID").readOnly = false;

		}
	}

	function changeAssetProofValue(type, value) {
		if (type == 'N') {
			changeValue1('0', '');
			changeValue2('0', '');
			changeValue3('0', '');
			changeValue4('0', '');
			changeValue5('0', '');
			changeValue6('0', '');
		} else if (type == 'Y') {

		}
	}

	function getChoose() {
		var campaignCd = new Array("DDDD00001", "DDDD00001", "DDDD00001",
				"DDDD00001", "DDDD00001", "DDDD00001", "DDDD00001",
				"DDDD00001", "DDDD00001", "DDDD00001", "DDDD00001",
				"DDDD00001", "DDDD00001", "DDDD00001", "DDDD00001",
				"DDDD00001", "DDDD00001", "DDDD00001", "DDDD00001",
				"DDDD00001", "DDDD00001", "DDDD00001", "DDDD00001",
				"DDDD00001", "DDDD00001", "DDDD00001", "DDDD00001",
				"DDDD00001", "DDDD00001", "DDDD00001");
		var productCd = new Array("", "M001", "M001", "M001", "M001", "V001",
				"V001", "V001", "V001", "M001", "M001", "", "V001", "V002",
				"M001", "V001", "M001", "V001", "V001", "", "M001", "M001",
				"V001", "V001", "M001", "V001", "", "V001", "M001", "");

		var priBirthDate = new Array("", "", "", "", "", "", "", "", "", "",
				"19600213", "19490211", "19641211", "19750706", "19450829",
				"19601212", "19481013", "19620622", "19700525", "19720514",
				"19571021", "19760618", "19660609", "19531006", "19440601",
				"19480304", "19590422", "19600710", "19701028", "19660523");
		var priNationality = new Array("CHN", "CHN", "CHN", "CHN", "CHN",
				"CHN", "CHN", "CHN", "CHN", "CHN", "CHN", "CHN", "CHN", "CHN",
				"CHN", "CHN", "CHN", "CHN", "CHN", "CHN", "CHN", "CHN", "CHN",
				"CHN", "CHN", "CHN", "CHN", "CHN", "CHN", "CHN");
		var homeAddrPtCd = new Array("200245", "200245", "200245", "200245",
				"200245", "200245", "200245", "200245", "200245", "200245",
				"200030", "200030", "200000", "200092", "200030", "200031",
				"200000", "200434", "200235", "200040", "200120", "200051",
				"200126", "201300", "200052", "201102", "200237", "200232",
				"200080", "200245");
		var homeResidingDurYear = new Array("1", "2", "3", "4", "5", "6", "7",
				"8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18",
				"19", "20", "21", "22", "23", "24", "25", "26", "27", "28",
				"29", "30");
		var homeResidingDurMonth = new Array("1", "2", "3", "4", "5", "6", "7",
				"8", "9", "10", "11", "12");
		var homeMthlyRent = new Array("1000", "1500", "2000");//��Ϊ���ã�ÿ�����
		var homeMthlyLonPayt = new Array("2000", "3000", "4000");//��Ϊ���ҹ���ÿ�¹���
		var priHomePhACd = new Array("", "", "", "", "", "", "", "", "", "",
				"64662", "47364", "", "65542", "27918", "43397", "69625",
				"55391", "32850", "62565", "32254", "24141", "50872", "58018",
				"62838", "32322", "64760", "64569", "65085", "64302");
		var priHomePhNum = new Array("", "", "", "", "", "", "", "", "", "",
				"64662116", "4736487", "", "65542814", "2791888", "4339779",
				"6962509", "55391760", "3285033", "62565900", "3225445224",
				"2414104", "50872507", "58018364", "62838256", "3232239",
				"64760925", "64569839", "65085553", "64302912");
		var dependentCnt = new Array("", "", "", "", "", "", "", "", "", "",
				"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0",
				"0", "0", "0", "0", "0", "0", "0", "0");
		var compAddrPtCd = new Array("200030", "200030", "200030", "200030",
				"200030", "200030", "200030", "200030", "200030", "200030",
				"200030", "200437", "200000", "200002", "200120", "200120",
				"200003", "200003", "200020", "200040", "200003", "200335",
				"200021", "201309", "200232", "200003", "200000", "200041",
				"200052", "200240");
		var compPhCtryCd = new Array("", "", "");
		var compPhACd = new Array("", "", "", "", "", "", "", "", "", "", "",
				"", "", "63236", "38824", "50494", "69625", "34240", "",
				"24759", "32254", "", "64337", "80713", "64708", "32322",
				"59857", "25618", "62811", "64300");
		var compPhNum = new Array("", "", "", "", "", "", "", "", "", "", "",
				"", "", "63236205", "38824588", "50494950", "6962509",
				"34240850", "", "2475938", "3225445224", "", "64337700",
				"8071395", "64708090", "3232239", "59857049", "256184023",
				"62811797", "64300480");
		var priPosExpl = new Array("��������������ְλ1", "��������������ְλ2", "��������������ְλ3");
		var compPosSeniority = new Array("", "", "");
		var mthlySalary = new Array("", "", "", "", "", "", "", "", "", "",
				"2000", "1000", "1000", "2000", "1000", "5000", "1000", "1500",
				"1400", "1000", "1400", "1000", "1000", "1000", "1000", "2000",
				"5000", "1500", "2000", "1000");
		var annSalary = new Array("80000", "40000", "30000");

		var cCardCnt = new Array("3", "3", "3", "3", "3", "3", "3", "3", "3",
				"3", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0",
				"0", "0", "0", "0", "0", "0", "0", "0", "0");
		var assetValue = new Array("8193000", "3910000", "7129000", "3313000",
				"", "6201000", "", "", "", "", "6473000", "", "", "120000", "",
				"", "38000", "", "", "", "", "", "", "", "", "", "1266000", "",
				"", "");
		var supplBirthDate = new Array("", "", "", "", "", "", "", "", "", "",
				"19520503", "19410906", "19611223", "19720727", "19271017",
				"19480503", "19520126", "19580822", "19690217", "19700120",
				"19390308", "19750619", "19630806", "19510804", "19390613",
				"19290507", "19670629", "19551107", "19700124", "19620108");
		var priCardNum = new Array("1", "2", "3", "4", "", "5", "6", "", "7",
				"", "", "", "", "", "", "", "", "", "", "6477", "", "", "", "",
				"", "", "6693", "", "", "6915");

		var supplLtdRatio = new Array("30", "40", "80");
		var priStatAddrPtCd = new Array("200031", "200031", "200031", "200031",
				"200031", "200031", "200031", "200031", "200031", "200031",
				"200031", "200041", "200011", "200065", "200093", "200000",
				"200030", "200031", "200031", "200031", "200031", "200031",
				"200031", "200031", "200031", "200031", "200031", "200031",
				"200031", "200031");

		var entryChannel = new Array("DM", "IB", "EXNNNNN");
		var promotionChannel = new Array("HQ003", "DM", "DM", "IB", "BH�㶫",
				"TO", "TM", "BH�㶫", "P000006", "BH�㶫", "HQ003", "P000006",
				"TM", "P000006", "TO", "BH�Ϻ�", "TO", "HQ003", "EX00008", "TM",
				"P000006", "IN0000007", "P000006", "BH�Ϻ�", "DM", "TO",
				"EX00008", "HQ003", "P000006", "IB");
		var applNum = new Array("9150", "9154", "9193", "9251", "9268", "9295",
				"9384", "9880", "10446", "10447", "43870", "44225", "44504",
				"44671", "45894", "46597", "46887", "57479", "57558", "57869",
				"58010", "58064", "58107", "58190", "58404", "58465", "58593",
				"58929", "59008", "59140");

		var bOCCardBeginDate = new Array("", "", "", "", "", "", "", "", "",
				"", "", "", "", "", "", "", "", "", "", "19890517", "", "", "",
				"", "", "", "19780501", "", "", "19840728");
		var bOCCardLimit = new Array("48848", "45072", "21324", "13904", "",
				"19548", "4731", "", "48216", "", "", "", "", "", "", "", "",
				"", "", "47952", "", "", "", "", "", "", "41952", "", "",
				"7988");
		var bOCCardNum = new Array("3", "6", "1", "5", "", "7", "2", "", "2",
				"", "", "", "", "", "", "", "", "", "", "1", "", "", "", "",
				"", "", "2", "", "", "2");
		var appRanNum = new Array("2872256", "4332044", "1479664", "2672200",
				"3773174", "2034657", "2964190", "4032476", "1527375",
				"7547984", "5552492", "6924312", "2435848", "2122572",
				"716459", "1646967", "5051100", "9572104", "3296854", "862585",
				"2396616", "1361315", "3431942", "3415288", "9935304",
				"975073", "9163112", "4020994", "6855368", "1085443");
		var firstApprvdStrategyID = new Array("47", "47", "47", "47", "", "47",
				"47", "", "47", "", "", "", "", "", "", "", "", "", "", "47",
				"", "", "", "", "", "", "47", "", "", "47");
		var appCnt = new Array("4", "1", "4", "2", "4", "1", "2", "8", "5",
				"4", "3", "0", "1", "7", "0", "3", "2", "3", "3", "6", "7",
				"6", "1", "2", "7", "1", "6", "8", "2", "5");

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

		document.all.form1.ComAddrPtCd.value = campaignCd[num29 - 1];
		//document.all.form1.ProductCd.value = productCd[num29-1];

		document.all.SupplApplOnly.options[2].selected = true;
		document.all.CCardTypeDownGrade.options[num1].selected = true;
		document.all.PriGender.options[num1].selected = true;
		document.all.form1.PriCardBirthday.value = priBirthDate[num29 - 1];
		document.all.PriIDType.options[num4].selected = true;//20040209 ֤������
		document.all.form1.PriNationality.value = priNationality[num29 - 1];
		document.all.PriMaritalSta.options[num3].selected = true;//20040209 ����״��
		document.all.PriEducationLvl.options[num4].selected = true;
		document.all.form1.PriHomePtCd.value = homeAddrPtCd[num29 - 1];
		document.all.form1.HomeResidingYear.value = homeResidingDurYear[num29 - 1];
		document.all.form1.HomeResidingMonth.value = homeResidingDurMonth[num11 - 1];
		document.all.HomeOwshType.options[num5].selected = true;
		if (document.all.HomeOwshType.options[num5].value == 5) {
			document.all.form1.HouseHireAmt.value = homeMthlyRent[num2 - 1];//��Ϊ���ã�ÿ�����
		}
		if (document.all.HomeOwshType.options[num5].value == 4) {
			document.all.form1.HousePayAmt.value = homeMthlyLonPayt[num2 - 1];//��Ϊ���ҹ���ÿ�¹���
		}
		document.all.form1.HomePhonePro.value = priHomePhACd[num29 - 1];
		document.all.form1.HomePhoneNo.value = priHomePhNum[num29 - 1];
		document.all.form1.DependentCnt.value = dependentCnt[num29 - 1];
		document.all.form1.ComAddrPtCd.value = compAddrPtCd[num29 - 1];
		document.all.form1.CompTelPhonePro.value = compPhACd[num29 - 1];
		document.all.form1.CompTelPhone.value = compPhNum[num29 - 1];
		document.all.CompBizField.options[num19].selected = true;
		document.all.CompBizOwShType.options[num8].selected = true;
		document.all.PriPos.options[num19].selected = true;//20040209

		document.all.form1.CompPosSeniority.value = compPosSeniority[num2 - 1];
		document.all.form1.MthlySalary.value = mthlySalary[num29 - 1];
		document.all.form1.AmmSalary.value = annSalary[num2 - 1];
		document.all.OtherBankCardSta.options[num1].selected = true;
		document.all.form1.OthCardCnt.value = cCardCnt[num29 - 1];
		//  document.all.OtherLon.options[num1].selected = true;

		document.all.BOCSaveActFlg.options[num1].selected = true;
		document.all.form1.AssetValue.value = assetValue[num29 - 1];
		document.all.CarOwShCondition.options[num1].selected = true;
		document.all.SuppBirthday1.value = supplBirthDate[num29 - 1];//0210
		document.all.SuppRelation1.options[num4].selected = true;
		document.all.SuppLimitFlag1.options[num1].selected = true;
		document.all.form1.SuppLimitPercent1.value = supplLtdRatio[num2 - 1];
		document.all.form1.PrimaryCardNo1.value = priCardNum[num29 - 1];

		document.all.SuppBirthday2.value = supplBirthDate[num29 - 1];//0210
		document.all.SuppRelation2.options[num4].selected = true;
		document.all.SuppLimitFlag2.options[num1].selected = true;
		document.all.form1.SuppLimitPercent2.value = supplLtdRatio[num2 - 1];
		document.all.form1.PrimaryCardNo2.value = priCardNum[num29 - 1];

		document.all.SuppBirthday3.value = supplBirthDate[num29 - 1];//0210
		document.all.SuppRelation3.options[num4].selected = true;
		document.all.SuppLimitFlag3.options[num1].selected = true;
		document.all.form1.SuppLimitPercent3.value = supplLtdRatio[num2 - 1];
		document.all.form1.PrimaryCardNo3.value = priCardNum[num29 - 1];

		document.all.SuppBirthday4.value = supplBirthDate[num29 - 1];//0210
		document.all.SuppRelation4.options[num4].selected = true;
		document.all.SuppLimitFlag4.options[num1].selected = true;
		document.all.form1.SuppLimitPercent4.value = supplLtdRatio[num2 - 1];
		document.all.form1.PrimaryCardNo4.value = priCardNum[num29 - 1];
		// document.all.SupplCardCurr.options[num1].selected = true;

		document.all.PriStatAddrSel.options[num1].selected = true;
		//    document.all.form1.PriStatAddrPtCd.value = priStatAddrPtCd[num29-1];

		document.all.AutoPayMethod.options[num1].selected = true;
		document.all.AutoPayAmtSel.options[num1].selected = true;
		document.all.AutoPayActSel.options[num1].selected = true;

		document.all.form1.BKCC.value = entryChannel[num2 - 1];
		document.all.form1.BKBH.value = promotionChannel[num29 - 1];
		document.all.form1.AppId.value = applNum[num29 - 1];
		document.all.BKVIP.options[num1].selected = true;
		document.all.IDProof.options[num1].selected = true;
		document.all.JobProof.options[num1].selected = true;
		document.all.IncomeProof.options[num1].selected = true;
		document.all.AssetProof.options[num1].selected = true;

		document.all.BOCCardHolder.options[num1].selected = true;
		document.all.form1.BOCCardBeginDate.value = bOCCardBeginDate[num29 - 1];
		document.all.form1.BOCCardLimit.value = bOCCardLimit[num29 - 1];
		document.all.form1.BOCCardNum.value = bOCCardNum[num29 - 1];

		document.all.DPD30P24Mon.options[num1].selected = true;
		document.all.DPD60P24Mon.options[num1].selected = true;
		document.all.DPD90P24Mon.options[num1].selected = true;
		document.all.form1.AppRanNum.value = appRanNum[num29 - 1];
		document.all.form1.FirstApprvdStrategyID.value = firstApprvdStrategyID[num29 - 1];
		document.all.form1.AppCnt.value = appCnt[num29 - 1];

	}
	function checkForm1() {

		var CLmt = document.form1.TotlCCardCLmt.value;
		var OLmt = document.form1.TotlCCardOLmt.value;
		if (document.form1.IncomeProof.value == 'Y') {
			if (document.form1.AprAnnIncome.value <= 0) {
				alert('��֤�������������Ч���벹��');
				document.getElementById("AprAnnIncomeID").focus();
				return false;

			}

		}

		if (document.form1.PriNationality.value == "CHN"
				|| document.form1.PriNationality.value == "") {
			var number = document.form1.PriIDNo.value;
			switch (number.length) {

			case 15:
				if (document.form1.PriIDType.value == 1) {
					if (document.form1.PriGender.value == 1) {

						if (!(number.charAt(number.length - 1) % 2)) {
							alert('���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.PriGender.value == 2) {

						if (number.charAt(number.length - 1) % 2) {
							alert('���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.PriIDType.value == 1) {
					if (document.form1.PriGender.value == 1) {

						if (!(number.charAt(number.length - 2) % 2)) {
							alert('���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.PriGender.value == 2) {

						if (number.charAt(number.length - 2) % 2) {
							alert('���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			default:
				if (document.form1.PriIDType.value == 1) {
					alert('���֤λ��������Ҫ��');
					return false;
					break;
				}
			}
		}
		if (document.all.supp1Check.value == 1) {
			var number1 = document.form1.SuppIDNo1.value;
			switch (number1.length) {

			case 15:
				if (document.form1.SuppIDType1.value == 1) {
					if (document.form1.SuppSex1.value == 1) {

						if (!(number1.charAt(number1.length - 1) % 2)) {
							alert('������1���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.SuppSex1.value == 2) {

						if (number1.charAt(number1.length - 1) % 2) {
							alert('������1���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.SuppIDType1.value == 1) {
					if (document.form1.SuppSex1.value == 1) {

						if (!(number1.charAt(number1.length - 2) % 2)) {
							alert('������1���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.SuppSex1.value == 2) {

						if (number1.charAt(number1.length - 2) % 2) {
							alert('������1���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			}
		}
		if (document.all.supp2Check.value == 1) {
			var number2 = document.form1.SuppIDNo2.value;
			switch (number2.length) {

			case 15:
				if (document.form1.SuppIDType2.value == 1) {
					if (document.form1.SuppSex2.value == 1) {

						if (!(number2.charAt(number2.length - 1) % 2)) {
							alert('������2���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.SuppSex2.value == 2) {

						if (number2.charAt(number2.length - 1) % 2) {
							alert('������2���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.SuppIDType2.value == 1) {
					if (document.form1.SuppSex2.value == 1) {

						if (!(number2.charAt(number2.length - 2) % 2)) {
							alert('������2���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.SuppSex2.value == 2) {

						if (number2.charAt(number2.length - 2) % 2) {
							alert('������2���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			}
		}

		if (document.all.supp3Check.value == 1) {
			var number3 = document.form1.SuppIDNo3.value;
			switch (number3.length) {

			case 15:
				if (document.form1.SuppIDType3.value == 1) {
					if (document.form1.SuppSex3.value == 1) {

						if (!(number3.charAt(number3.length - 1) % 2)) {
							alert('������3���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.SuppSex3.value == 2) {

						if (number3.charAt(number3.length - 1) % 2) {
							alert('������3���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.SuppIDType3.value == 1) {
					if (document.form1.SuppSex3.value == 1) {

						if (!(number3.charAt(number3.length - 2) % 2)) {
							alert('������3���֤�������Ա𲻷�');
							return false;
						}
					}
					if (document.form1.SuppSex3.value == 2) {

						if (number3.charAt(number3.length - 2) % 2) {
							alert('������3���֤�������Ա𲻷�');
							return false;
						}
					}
					break;
				}
			}
		}
		if (document.form1.HomeOwshType.value == 4) {
			if (document.form1.HousePayAmt.value <= 0) {
				alert('ÿ�¹�����Ч���벹��');
				return false;
			}

		}

		if (document.all.supp1Check.value == 1) {
			if (document.form1.SuppLimitFlag1.value == 2) {
				if (document.form1.SuppLimitPercent1.value > 100) {

					document.form1.SuppLimitPercent1.value = 100;
				}
				if (document.form1.SuppLimitPercent1.value < 0) {
					alert('������1��Ȱٷֱ���Ч��������');
					return false;
				}

			}
		}
		if (document.all.supp2Check.value == 1) {
			if (document.form1.SuppLimitFlag2.value == 2) {
				if (document.form1.SuppLimitPercent2.value > 100) {

					document.form1.SuppLimitPercent2.value = 100;
				}
				if (document.form1.SuppLimitPercent2.value < 0) {
					alert('������2��Ȱٷֱ���Ч��������');
					return false;
				}

			}
		}
		if (document.all.supp3Check.value == 1) {
			if (document.form1.SuppLimitFlag3.value == 2) {
				if (document.form1.SuppLimitPercent3.value > 100) {

					document.form1.SuppLimitPercent3.value = 100;
				}
				if (document.form1.SuppLimitPercent3.value < 0) {
					alert('������3��Ȱٷֱ���Ч��������');
					return false;
				}

			}
		}
		if (document.form1.PriNationality.value == "CHN"
				|| document.form1.PriNationality.value == "") {
			var idcard = document.form1.PriIDNo.value;

			switch (idcard.length) {

			case 15:

				var cardbirth = idcard.substr(6, 6);
				if (document.form1.PriIDType.value == 1) {
					if (document.form1.PriCardBirthday.value.substr(2, 6) != cardbirth) {
						alert('���֤��������ڲ���');
						return false;
					}
					break;
				}
			case 18:
				var cardbirth = idcard.substr(6, 8);
				if (document.form1.PriIDType.value == 1) {
					if (document.form1.PriCardBirthday.value != cardbirth) {
						alert('���֤��������ڲ���');
						return false;
					}
					break;
				}
			default:
				if (document.form1.PriIDType.value == 1) {
					alert('���֤λ��������Ҫ��');
					return false;
					break;
				}
			}
		}
		if (document.all.supp1Check.value == 1) {
			if (document.form1.SuppIDType1.value == 1) {
				var idcard1 = document.form1.SuppIDNo1.value;

				switch (idcard1.length) {

				case 15:

					var cardbirth1 = idcard1.substr(6, 6);

					if (document.form1.SuppBirthday1.value.substr(2, 6) != cardbirth1) {
						alert('������1���֤��������ڲ���');
						return false;
					}
					break;

				case 18:
					var cardbirth1 = idcard1.substr(6, 8);

					if (document.form1.SuppBirthday1.value != cardbirth1) {
						alert('������1���֤��������ڲ���');
						return false;
					}
					break;

				default:

					alert('������1���֤λ��������Ҫ��');
					return false;
					break;

				}
			}

		}
		if (document.all.supp2Check.value == 1) {
			if (document.form1.SuppIDType2.value == 1) {
				var idcard2 = document.form1.SuppIDNo2.value;

				switch (idcard2.length) {

				case 15:

					var cardbirth2 = idcard2.substr(6, 6);

					if (document.form1.SuppBirthday2.value.substr(2, 6) != cardbirth2) {
						alert('������2���֤��������ڲ���');
						return false;
					}
					break;

				case 18:
					var cardbirth2 = idcard2.substr(6, 8);

					if (document.form1.SuppBirthday2.value != cardbirth2) {
						alert('������2���֤��������ڲ���');
						return false;
					}
					break;

				default:

					alert('������2���֤λ��������Ҫ��');
					return false;
					break;

				}

			}
		}
		if (document.all.supp3Check.value == 1) {
			if (document.form1.SuppIDType3.value == 1) {
				var idcard3 = document.form1.SuppIDNo3.value;

				switch (idcard3.length) {

				case 15:

					var cardbirth3 = idcard3.substr(6, 6);

					if (document.form1.SuppBirthday3.value.substr(2, 6) != cardbirth3) {
						alert('������3���֤��������ڲ���');
						return false;
					}
					break;

				case 18:
					var cardbirth3 = idcard3.substr(6, 8);

					if (document.form1.SuppBirthday3.value != cardbirth3) {
						alert('������3���֤��������ڲ���');
						return false;
					}
					break;

				default:

					alert('������3���֤λ��������Ҫ��');
					return false;
					break;
				}

			}

		}
		if (document.form1.CredAssetType1.value != 0) {
			if (document.form1.CredAssetValue1.value < 1) {
				alert('��֤�����ʲ���ֵ1��Ч���벹��');
				return false;
			}
		}

		if (document.form1.CredAssetType2.value != 0) {
			if (document.form1.CredAssetValue2.value < 1) {
				alert('��֤�����ʲ���ֵ2��Ч���벹��');
				return false;
			}
		}

		if (document.form1.CredAssetType3.value != 0) {
			if (document.form1.CredAssetValue3.value < 1) {
				alert('��֤�����ʲ���ֵ3��Ч���벹��');
				return false;
			}
		}
		if (document.form1.CredAssetType4.value != 0) {
			if (document.form1.CredAssetValue4.value < 1) {
				alert('��֤�����ʲ���ֵ4��Ч���벹��');
				return false;
			}
		}
		if (document.form1.AppType.value == 2
				|| document.form1.AppType.value == 3) {
			if (document.all.supp1.checked == false
					&& document.all.supp2.checked == false
					&& document.all.supp3.checked == false) {
				alert('��Ҫ��ѡ��������ǩ');
				return false;
			}
		}
		return true;
	}

	function changeBKSTF(value) {

		if (document.form1.BKSTF.value == 'Y') {

			document.form1.AprPosLevl.options[2].selected = true;
		}

	}
	function changeRecheckResult(value) {

		if (document.form1.recheckResult.value == '1') {

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
var maxh=560;
function dmove(){
h+=50; //��չ���ٶ�
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
h-=50;//�������ٶ�
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
sb.innerHTML='��������Ϣ����';
}else{
$D2();
sb.innerHTML='��������Ϣչ��';
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
		h+=50; //��չ���ٶ�
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
		h-=50;//�������ٶ�
		if(h<=0){
		d.style.display='none';
		clearInterval(iIntervalId);
		}else{
		d.style.height=h+'px';
		}
	}
	iIntervalId=setInterval(dmove,2);
}
/* function $use1(){
	var d=$('class1content1');
	var sb=$('stateBut1');
	if(d.style.display=='none'){
	$D3();
	sb.innerHTML='������Ϣ����';
	}else{
	$D4();
	sb.innerHTML='������Ϣչ��';
	}
} */
</script>
  </head>
  
<body onLoad="changeValue()" onkeydown="ctlSubmit(event,'create')">
<center>
<form name="form" method="post">
    <table width="78%">
           <tr>
        <td width="50%" align = "center"> <span class="pt12" style = "font-size: 11pt;font-family= '����'" ><strong>���ÿ����ž���ϵͳ(CDSE)</strong></span>        </td>
      <tr>
	  <tr>
        <td width="50%" align = "center"> <span class="pt12" style = "font-size: 11pt;font-family= '����'" ><strong>���������������</strong></span>        </td>
	 </tr>
	<tr>
       <td width= "50%"align = "right">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img onClick="javascript:openwindow();" src="img/button41.gif" width="120" height="26">
      </td>
	 </tr>
      </table>
</form>
  <form name="form1" id="form1" method="post" action="">    <!--onSubmit="return CheckValid(this);"-->
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
        <td colspan=4 align="center"><strong class="color">���뵥��Ϣ�������</strong></td>
    </tr>
    <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AppId���뵥���</td>
        <td width="25%" class="BACKGROUND_c">
            <input name="AppId" value="2011072000001" size=20 maxlength=16 isNeed="Y" fieldName="���뵥���">
        </td>

	<td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AppType��������</td>
        <td width="25%" class="BACKGROUND_c">
            <select name="AppType"  onchange="javascript:changeSupplyOnly(this.value);">
            <option value="">��ѡ��</option>
            <option value="1" selected >����������</option>
            <option value="2">����+����������</option>
            <option value="3">������������</option>
			</select>
        </td>
    </tr>
 
        <tr>
       <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>recheckResultFlag ���ź˲���</td>
        <td width="25%" class="BACKGROUND_c" colspan=3> <select name="recheckResultFlag" onChange="javascript:changeRecheckResult(this.value);">
            <option value="">��ѡ��</option>
            <option value="1" selected >1</option>
            <option value="2" >2</option>
            <option value="3" >3</option>
            <option value="4" >4</option>
          </select></td>
      </tr>

  </table>

    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong class="color">��Ʒ��Ϣ�������</strong></td>
      </tr>
      <tr>
        <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>ProductCd �����Ʒ���</td>


        <td width="25%" class="BACKGROUND_c"><select name="ProductCd">
            <option value="">��ѡ��</option>
             <option value="aaaa">���Դ���</option>
	    <option value="cccc">���Թ���</option>
	    <option value="YD02">�����״�Ǯ���ÿ�</option>
	    <option value="1P02" selected="selected">�������´ﾫӢ�׽�</option>
	    <option value="2TB1">�����Ա�У԰��</option>
	    <option value="2ZF1">�����Ա��������ÿ�</option>
	    <option value="2P01">������ʿ����׽�</option>
	    <option value="HQT1">���ǻ���ͨ����������</option>
            <option value="VM01">���ǹ��ʿ�VISA��Ԫ��</option>
            <option value="VY01">���ǹ��ʿ�VISAӢ����</option>
            <option value="MM01">���ǹ��ʿ�Master card��Ԫ�ѽ�</option>
            <option value="MY01">���ǹ��ʿ�Master cardӢ���ѽ�</option>
            <option value="1001">���´�����տ�</option>
            <option value="1002">���´���˽�</option>
            <option value="1004">���´�Ա���տ�</option>
            <option value="1005" >���´�Ա����</option>
            <option value="1009">���´�����տ����գ�</option>
            <option value="1010" >���´���˽𿨣��գ�</option>
            <option value="1012">���´�Ա���տ����գ�</option>
            <option value="1013" >���´�Ա���𿨣��գ�</option>
            <option value="2001">VISA�����տ�</option>
            <option value="2002">VISA���˽�</option>
            <option value="2004">VISAԱ���տ�</option>
            <option value="2005">VISAԱ����</option>
            <option value="2009">VISA�����տ����գ�</option>
            <option value="2010">VISA���˽𿨣��գ�</option>
            <option value="2012">VISAԱ���տ����գ�</option>
            <option value="2013">VISAԱ���𿨣��գ�</option>
            <option value="2O01">����ȫ�������ÿ�˫�ҿ����</option>
            <option value="2O02">����ȫ�������ÿ�˫�ҿ����</option>
            <option value="2O03">����ȫ�������ÿ�˫�ҿ�����</option>
            <option value="2O04">����ȫ�������ÿ�˫�ҿ�����</option>
            <option value="2O05">����ȫ�������ÿ�˫�ҿ����</option>
            <option value="2L01">�����������˫�ҿ�</option>
            <option value="3002">JCB�����տ�</option>
            <option value="3001">JCB���˽�</option>
            <option value="VZ01">���˹���</option>
            <option value="4C01">����������</option>
            <option value="4C02">������������</option>
            <option value="4J01">������ͬ��</option>
            <option value="4001">���п�(��)</option>
            <option value="4002">���п�(�ҿ�)</option>
            <option value="2JY1">��ӥ������</option>
            <option value="3003">�ù�JCB��������</option>
            <option value="3004">�ù�JCB����������</option>
            <option value="4PK1">������Ϣ��</option>
            <option value="1CG1">ׯʤ��ⱱ�����ÿ�</option>
            <option value="3DZ1">���н�</option>
            <option value="3DZ2">�����տ�</option>
            <option value="2002">��������</option>
            <option value="2CZ1">�人����</option>
            <option value="BCZG">��������</option>
            <option value="1003">1003</option>
            <option value="1011">1011</option>
            <option value="1006">1006</option>
            <option value="1015">1015</option>
            <option value="4005">4005</option>
            <option value="4007">4007</option>
            <option value="4006">4006</option>
            <option value="4008">4008</option>
            <option value="4CA1">4CA1����֪�����˸��˿�(����һ)</option>
            <option value="4CA2">4CA2����֪�����˸��˿�(�����)</option>
            <option value="4CA3">4CA3����֪�����˸��˿�(������)</option>
            <option value="4CA4">4CA4����֪�����˸��˿�(������)</option>
            <option value="4CA5">4CA5����֪�����˸��˿�(������)</option>
            <option value="4CA6">4CA6����֪������Ա����(����һ)</option>
            <option value="4CA7">4CA7����֪������Ա����(�����)</option>
            <option value="4CA8">4CA8����֪������Ա����(������)</option>
            <option value="4CA9">4CA9����֪������Ա����(������)</option>
            <option value="4CA0">4CA0����֪������Ա����(������)</option>
            <option value="4U01">4U01VISA��У��</option>
            <option value="1R01">1R01���´�ٻ���</option>
            <option value="1CT2">1CT2Я�����ÿ�����</option>
            <option value="1CT1">1CT1Я�����ÿ���</option>
			<option value="1R02">�������´�ٻ���</option>
			<option value="1R03">�������´�ٻ���</option>
			<option value="1R04">�������´�ٻ���</option>
			<option value="1R05">�����������Ž�</option>
			<option value="1R06">����������������</option>
			<option value="1R19">������������׿չ��</option>
			<option value="1R20">������������׿չ��</option>
			<option value="1WY1">����ȫ������ίԱ��</option>
			<option value="3R01">����JCB�ٻ���</option>
			<option value="3R02">������������</option>
			<option value="3R03">��������ɽ������̩��</option>
			<option value="3R04">����JCB�ٻ���</option>
			<option value="3R05">����JCB�ٻ���</option>
			<option value="3R06">����JCB�ٻ���</option>
			<option value="4AW1">������������</option>
			<option value="4AW2">����������</option>
			<option value="4AW3">������������</option>
			<option value="4CM1">�ƶ��������˿�</option>
			<option value="4L01">����VISA������</option>
			<option value="4L02">����VISA������</option>
			<option value="4L03">����������֮��</option>
			<option value="4L04">��������������Ǩ</option>
			<option value="4L05">����VISA������</option>
			<option value="4L06">����VISA������</option>
			<option value="4L07">����VISA������</option>
			<option value="4L08">����VISA������</option>
			<option value="4L09">����VISA������</option>
			<option value="4L10">����VISA������</option>
			<option value="4L11">����VISA������</option>
			<option value="4L12">����VISA������</option>
			<option value="4L13">����VISA������</option>
			<option value="4L14">����VISA������</option>
			<option value="4L15">����VISA������</option>
			<option value="4L16">����VISA������</option>
			<option value="4L17">����VISA������</option>
			<option value="4L18">����VISA������</option>
			<option value="4L19">����VISA������</option>
			<option value="4L20">����VISA������</option>
			<option value="4OV1">����־Ը�߿�</option>
			<option value="4R01">������������</option>
			<option value="4R02">������������˹</option>
			<option value="4R03">����������¡</option>
			<option value="4R04">����VISA�ٻ���</option>
			<option value="4R05">������������</option>
			<option value="4R06">����VISA�ٻ���</option>
			<option value="4U02">��������������ѧ</option>
			<option value="4U03">����VISA��У��(�°�)</option>
			<option value="4U04">����VISA��У��(�°�)</option>
			<option value="4U05">����VISA��У��(�°�)</option>
			<option value="4U06">����VISA��У��(�°�)</option>
			<option value="4U07">����VISA��У��(�°�)</option>
			<option value="4U08">����VISA��У��(�°�)</option>
			<option value="4U09">����VISA��У��(�°�)</option>
			<option value="4U10">����VISA��У��(�°�)</option>
			<option value="4U11">����VISA��У��(�°�)</option>
			<option value="4U12">����VISA��У��(�°�)</option>
			<option value="4U13">����VISA��У��(�°�)</option>
			<option value="4U14">����VISA��У��(�°�)</option>
			<option value="4U15">����VISA��У��(�°�)</option>
			<option value="4U16">����VISA��У��(�°�)</option>
			<option value="4U17">����VISA��У��(�°�)</option>
			<option value="4U18">����VISA��У��(�°�)</option>
			<option value="4U19">����VISA��У��(�°�)</option>
			<option value="4U20">����VISA��У��(�°�)</option>
			<option value="2007">VISA�����</option>
			<option value="2008">VISA����׽�</option>
			<option value="1007">���´﹫���</option>
			<option value="1008">���´﹫��׽�</option>
			<option value="2P03">���������ʿ�׽�</option>
			<option value="1P03">�������´���ư׽�</option>
			<option value="1P02">�������´ﾫӢ�׽�</option>
			<option value="1P01">���´�׽𿨿���</option>
			<option value="2P02">������ʿ��Ӣ�׽�</option>
			<option value="2P01">������ʿ�׽�</option>
			<option value="4HN1">�����Ұ��������ÿ�</option>
			<option value ="4CM1">��������ȫ��ͨ������</option>
			<option value ="4CM2">��������ȫ��ͨ�����տ�</option>
			<option value ="4101">��׼����Ԥ�㵥λ����</option>
			<option value ="4102">�����������02</option>
			<option value ="4103">�����������03</option>
			<option value ="4104">�����������04</option>
			<option value ="4105">�����������05</option>
			<option value ="4106">�����������06</option>
			<option value ="4107">�����������07</option>
			<option value ="4108">�����������08</option>
			<option value ="4109">�����������09</option>
			<option value ="4110">�����������10</option>
			<option value ="4111">�����������11</option>
			<option value ="4112">�����������12</option>
			<option value ="4113">�����������13</option>
			<option value ="4114">�����������14</option>
			<option value ="4115">�����������15</option>
			<option value ="4116">�����������16</option>
			<option value ="4117">�����������17</option>
			<option value ="4118">�����������18</option>
			<option value ="4119">�����������19</option>
			<option value ="4120">�����������20</option>
			<option value ="4121">�����������21</option>
			<option value ="4122">�����������22</option>
			<option value ="4123">�����������23</option>
			<option value ="4124">�����������24</option>
			<option value ="4125">�����������25</option>
			<option value ="4126">�����������26</option>
			<option value ="4127">�����������27</option>
			<option value ="4128">�����������28</option>
			<option value ="4129">�����������29</option>
			<option value ="4130">�����������30</option>
			<option value ="4131">�����������31</option>
			<option value ="4132">�����������32</option>
			<option value ="4133">�����������33</option>
			<option value ="4134">�����������34</option>
			<option value ="4135">�����������35</option>
			<option value ="4136">�����������36</option>
			<option value ="4137">�����������37</option>
			<option value ="4138">�����������38</option>
			<option value ="4139">�����������39</option>
			<option value ="4140">�����������40</option>
			<option value ="4201">��׼�ط�Ԥ�㵥λ����</option>
			<option value ="4202">����ʡ���˹���</option>
			<option value ="4203">����ʡҬ������</option>
			<option value ="4204">�ຣʡ����</option>
			<option value ="4205">����ʡԤ�㵥λ����</option>
			<option value ="4206">�ط���������06</option>
			<option value ="4207">�ط���������07</option>
			<option value ="4208">�ط���������08</option>
			<option value ="4209">�ط���������09</option>
			<option value ="4210">�ط���������10</option>
			<option value ="4211">�ط���������11</option>
			<option value ="4212">�ط���������12</option>
			<option value ="4213">�ط���������13</option>
			<option value ="4214">�ط���������14</option>
			<option value ="4215">�ط���������15</option>
			<option value ="4216">�ط���������16</option>
			<option value ="4217">�ط���������17</option>
			<option value ="4218">�ط���������18</option>
			<option value ="4219">�ط���������19</option>
			<option value ="4220">�ط���������20</option>
			<option value ="4221">�ط���������21</option>
			<option value ="4222">�ط���������22</option>
			<option value ="4223">�ط���������23</option>
			<option value ="4224">�ط���������24</option>
			<option value ="4225">�ط���������25</option>
			<option value ="4226">�ط���������26</option>
			<option value ="4227">�ط���������27</option>
			<option value ="4228">�ط���������28</option>
			<option value ="4229">�ط���������29</option>
			<option value ="4230">�ط���������30</option>
			<option value ="4231">�ط���������31</option>
			<option value ="4232">�ط���������32</option>
			<option value ="4233">�ط���������33</option>
			<option value ="4234">�ط���������34</option>
			<option value ="4235">�ط���������35</option>
			<option value ="4236">�ط���������36</option>
			<option value ="4237">�ط���������37</option>
			<option value ="4238">�ط���������38</option>
			<option value ="4239">�ط���������39</option>
			<option value ="4240">�ط���������40</option>
			<option value ="2ZF1">����֧�����������ÿ�</option>
			<option value ="2LY1">������ӥ������������</option>
			<option value ="2R01">���������ٻ���01</option>
			<option value ="2R02">����������������</option>
			<option value ="2R03">���������ٻ���03</option>
			<option value ="2R04">�������������㳡</option>
			<option value ="2R05">���������ټѻ�</option>
			<option value ="2R06">��������ŷ��</option>
			<option value ="2R07">���������ٻ���07</option>
			<option value ="2R08">������������ïҵ��</option>
			<option value ="2R09">������������ïҵ�տ�</option>
			<option value ="2R10">�����������Ҵ��Ժ</option>
			<option value ="2R11">���������ٻ���11</option>
			<option value ="2R12">���������ٻ���12</option>
			<option value ="2R13">���������ķ�</option>
			<option value ="2R14">�����������հ˰۰�</option>
			<option value ="2R15">�����������ջ���</option>
			<option value ="2R16">����������������</option>
			<option value ="2R17">���������ٻ���17</option>
			<option value ="2R18">���������ٻ���18</option>
			<option value ="2R19">��������������</option>
			<option value ="2R20">���������ٻ���20</option>
			<option value ="2R21">���������ٻ���21</option>
			<option value ="2R22">������������Ӱ��</option>
			<option value ="2R23">���������ٻ���23</option>
			<option value ="2R24">�����������̽�</option>
			<option value ="2R25">�������������տ�</option>
			<option value ="2R26">���������ٻ���26</option>
			<option value ="2R27">���������ٻ���27</option>
			<option value ="2R28">���������ٻ���28</option>
			<option value ="2R29">���������ٻ���29</option>
			<option value ="2R30">���������ٻ���30</option>
			<option value ="1CZ1">�����Ϻ��������ÿ���</option>
			<option value ="1CZ2">�����Ϻ��������ÿ��տ�</option>
			<option value ="4HN1">�������»��������ÿ���</option>
			<option value ="4HN2">�������»��������ÿ��տ�</option>
			<option value ="1SZ1">���������Ϻ������</option>
			<option value ="1SZ2">���������Ϻ������տ�</option>
			<option value ="4MN1">������ţ�������ÿ���</option>
			<option value ="4MN2">������ţ�������ÿ��տ�</option>
			<option value ="4050">������������</option>

			<option value ="CCR1">�����й������ÿ�</option>
			<option value ="2GS2">����������ÿ��տ�</option>
			<option value ="2GS1">����������ÿ���</option>
			<option value ="4AW4">���������׽����ÿ�</option>
			<option value ="1PL1">�����氮��1</option>
			<option value ="1PL2">�����氮��2</option>
			<option value ="1PL3">�����氮��3</option>
			
			<option value ="2C01">����������ʳ��</option>
			<option value ="2C02">���������㶫�������⿨</option>
			<option value ="2C03">�������������б�������</option>
			<option value ="2C04">��������һ·������������</option>
			<option value ="2C05">��������һ·�����������տ�</option>
			<option value ="2C06">�����������ϴ�ѧ</option>
			<option value ="2C07">��������������07</option>
			<option value ="2C08">��������������08</option>
			<option value ="2C09">��������������09</option>
            <option value ="2C10">��������������10</option>
<option value ="2C11">��������������11</option>
<option value ="2C12">��������������12</option>
<option value ="2C13">��������������13</option>
<option value ="2C14">��������������14</option>
<option value ="2C15">��������������15</option>
<option value ="2C16">��������������16</option>
<option value ="2C17">��������������17</option>
<option value ="2C18">��������������18</option>
<option value ="2C19">��������������19</option>
<option value ="2C20">��������������20</option>
<option value ="2C21">��������������21</option>
<option value ="2C22">��������������22</option>
<option value ="2C23">��������������23</option>
<option value ="2C24">��������������24</option>
<option value ="2C25">��������������25</option>
<option value ="2C26">��������������26</option>
<option value ="2C27">��������������27</option>
<option value ="2C28">��������������28</option>
<option value ="2C29">��������������29</option>
<option value ="2C30">��������������30</option>
<option value ="2C31">��������������31</option>
<option value ="2C32">��������������32</option>
<option value ="2C33">��������������33</option>
<option value ="2C34">��������������34</option>
<option value ="2C35">��������������35</option>
<option value ="2C36">��������������36</option>
<option value ="2C37">��������������37</option>
<option value ="2C38">��������������38</option>
<option value ="2C39">��������������39</option>
<option value ="2C40">��������������40</option>
<option value ="2C41">��������������41</option>
<option value ="2C42">��������������42</option>
<option value ="2C43">��������������43</option>
<option value ="2C44">��������������44</option>
<option value ="2C45">��������������45</option>
<option value ="2C46">��������������46</option>
<option value ="2C47">��������������47</option>
<option value ="2C48">��������������48</option>
<option value ="2C49">��������������49</option>
<option value ="2C50">��������������50</option>
<option value ="2C51">��������������51</option>
<option value ="2C52">��������������52</option>
<option value ="2C53">��������������53</option>
<option value ="2C54">��������������54</option>
<option value ="2C55">��������������55</option>
<option value ="2C56">��������������56</option>
<option value ="2C57">��������������57</option>
<option value ="2C58">��������������58</option>
<option value ="2C59">��������������59</option>
<option value ="2C60">��������������60</option>
<option value ="2C61">��������������61</option>
<option value ="2C62">��������������62</option>
<option value ="2C63">��������������63</option>
<option value ="2C64">��������������64</option>
<option value ="2C65">��������������65</option>
<option value ="2C66">��������������66</option>
<option value ="2C67">��������������67</option>
<option value ="2C68">��������������68</option>
<option value ="2C69">��������������69</option>
<option value ="2C70">��������������70</option>
<option value ="2C71">��������������71</option>
<option value ="2C72">��������������72</option>
<option value ="2C73">��������������73</option>
<option value ="2C74">��������������74</option>
<option value ="2C75">��������������75</option>
<option value ="2C76">��������������76</option>
<option value ="2C77">��������������77</option>
<option value ="2C78">��������������78</option>
<option value ="2C79">��������������79</option>
<option value ="2C80">��������������80</option>
<option value ="2C81">��������������81</option>
<option value ="2C82">��������������82</option>
<option value ="2C83">��������������83</option>
<option value ="2C84">��������������84</option>
<option value ="2C85">��������������85</option>
<option value ="2C86">��������������86</option>
<option value ="2C87">��������������87</option>
<option value ="2C88">��������������88</option>
<option value ="2C89">��������������89</option>
<option value ="2C90">��������������90</option>
<option value ="2C91">��������������91</option>
<option value ="2C92">��������������92</option>
<option value ="2C93">��������������93</option>
<option value ="2C94">��������������94</option>
<option value ="2C95">��������������95</option>
<option value ="2C96">��������������96</option>
<option value ="2C97">��������������97</option>
<option value ="2C98">��������������98</option>
<option value ="2C99">��������������99</option>
<option value ="4BW1">���Ǳ�������������������</option>
<option value ="4BW2">���Ǳ�������������������</option>
<option value ="4BW3">���Ǳ����������������´��</option>
<option value ="4BW4">���Ǳ����������������´���</option>
<option value ="4LC1">���������������</option>		
<option value ="1R11">��������������</option>
<option value ="1R12">�������������տ�</option>				
<option value ="4SG1">����ȫ�������ÿ����ҿ�����</option>
<option value ="4SG2">����ȫ�������ÿ����ҿ����</option>
<option value ="4SG3">����ȫ�������ÿ����ҿ����</option>
<option value ="4SG4">����ȫ�������ÿ����ҿ����</option>
<option value ="4SG5">����ȫ�������ÿ����ҿ�����</option>
<option value ="3005">J��������CB�в�è��</option>
<option value ="3006">��������JCB�в�è�տ�</option>
<option value ="1PL4">�����������ݴ������ÿ�</option>	
<option value ="4R08">������������</option>	
<option value ="4R09">�����������տ�</option>	
<option value ="4F01">���Ƿ���ͨ���ÿ��ڿ�</option>	
<option value ="4F02">���Ƿ���ͨ���ÿ��쿨</option>	
<option value ="4S01">���Ǽ����籣���ÿ�</option>	
<option value ="4X01">���Ǽ��ִ�ѧ���ÿ�</option>
<option value ="4XE1">�����ҵ�e�����ÿ�</option>	
<option value ="4XA1">�����°�׿Խ���ÿ���</option>	
<option value ="4XA2">�����°�׿Խ���ÿ��տ�</option>				
          </select></td>

        <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>PriCardCurr ���뿨Ƭ��������</td>
        <td width="25%" class="BACKGROUND_c"> <select name="PriCardCurr">
            <option value="">��ѡ��</option>
            <option value="1" >˫��</option>
            <option value="2" selected>����</option>
          </select> </td>
      </tr>
      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SupplApplOnly ���⸽����</td>
        <td width="25%" class="BACKGROUND_c"> <select name="SupplApplOnly" onChange="javascript:changebytype()">
            <option value="">��ѡ��</option>
            <option value="Y" >��</option>
            <option value="N" selected>��</option>
          </select> </td>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CCardTypeDownGrade �类�ܾ��Ƿ���ܵ�һ�����ÿ�</td>
        <td width="25%" class="BACKGROUND_c"> <select name="CCardTypeDownGrade">
            <option value="">��ѡ��</option>
            <option value="Y" selected >��</option>
            <option value="N">��</option>
          </select> </td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align = "left">ZeroLimitFlag QCC �������Ƿ�����</td>
        <td class="BACKGROUND_c"><select name="ZeroLimitFlag" id="ZeroLimitFlag" onChange="javascript:changebytype()">
          <option value=""></option>
          <option value="Y">��</option>
          <option value="N" selected >��</option>
                                </select></td>
        <td class="BACKGROUND_a" align = "left">ReservedField3 �����峥��ʽ</td>
        <td class="BACKGROUND_c"><select name="ReservedField3" id="ReservedField3">
          <option value="" selected>��ѡ��</option>
          <option value="1">�����峥</option>
          <option value="2">��˾�������˹��峥</option>
          <option value="3" selected>��˾�峥</option>
                        </select></td>
      </tr>
    </table>
    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong class="color">������Ϣ�������</strong></td>
    </tr>
    <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriJCBType �������������</td>
        <td width="25%" class="BACKGROUND_c" colspan="3">
            <select name="PriJCBType">
            <option value="">��ѡ��</option>
            <option value="1" >������ҵ������Ա</option>
			<option value="2">����������ʿ</option>
			<option value="3">������ѧ��</option>
			<option value="4" selected>����</option>
              </select>
        ��ѡ��JCB�����û���ѡ����</td>
	</tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriGender �Ա�</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="PriGender">
          <option value="">��ѡ��</option>
          <option value="1" selected>1��</option>
          <option value="2" >2Ů</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriCardBirthday ��������</td>
      <td width="25%" class="BACKGROUND_c"><input name="PriCardBirthday" value="19791103" size=8 maxlength=8>
      (YYYYMMDD)</td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriIDType ֤������</td>
      <td width="25%" class="BACKGROUND_c" >
        <select name="PriIDType">
          <option value="">��ѡ��</option>
          <option value="1" selected >���֤</option>
          <option value="2">����</option>
          <option value="3">����֤</option>
          <option value="4">����֤</option>
          <option value="5">̨��֤</option>
        </select>
      </td>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriIDNo ֤������</td>
      <td width="25%" class="BACKGROUND_c"><input name="PriIDNo" value="132237197911030419" size=20 maxlength=18></td>

    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriNationality ����</td>
      <td width="25%" class="BACKGROUND_c"><select name="PriNationality">
          <option value="">��ѡ��</option>
          <option value="CHN" selected >�й�</option>
          <option value="USA">����</option>
          <option value="JPN">�ձ�</option>
      </select></td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriMaritalSta ����״��</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="PriMaritalSta">

          <option value="">��ѡ��</option>
          <option value="1">δ��</option>
          <option value="2" selected >�ѻ�</option>
          <option value="3">����</option>
          <option value="4">����</option>
        </select>
      </td>
    </tr>
<tr>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriEducationLvl �����̶�</td>
      <td width="75%" class="BACKGROUND_c" colspan=3>
        <select name="PriEducationLvl">
          <option value="">��ѡ��</option>
          <option value="1" selected>1�о���������</option>
          <option value="2" >2��ѧ����</option>
          <option value="3">3��ѧר��/��ְѧԺ</option>
          <option value="4">4����/ְ��</option>
          <option value="-9">-9����</option>
        </select>
      </td>
    </tr>

    <tr>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriHomePtCd �־�ס���ʱ�</td>
      <td width="25%" class="BACKGROUND_c" ><input name="PriHomePtCd" value="100055" size=20 maxlength=6></td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomeResidingYear �־�ס�ؾ�ס���</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomeResidingYear" value="20" size=10 maxlength=2>
      ��</td>

    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomeResidingMonth ��ס���·�</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomeResidingMonth" value="4" size=10 maxlength=2>
      ��</td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomeOwshType �־�ס������</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="HomeOwshType">
          <option value="">��ѡ��</option>
          <option value="1">1������ͬס</option>
          <option value="2">2��λ����</option>
          <option value="3" selected >3�ް�������</option>
          <option value="4">4��������</option>
          <option value="5">5����</option>
          <option value="6">6����</option>
        </select>
      </td>
    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left">HouseHireAmt ��Ϊ���ã�ÿ�����</td>
      <td width="25%" class="BACKGROUND_c"><input name="HouseHireAmt" value="" size=10 maxlength=10>Ԫ</td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HousePayAmt ��Ϊ���ҹ���ÿ�¹���</td>
      <td width="25%" class="BACKGROUND_c"><input name="HousePayAmt" value="" size=10 maxlength=10>Ԫ</td>
    </tr>

    <tr>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomePhonePro ��ͥ�绰����</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomePhonePro" value="010" size=10 maxlength=5></td>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomePhoneNo ��ͥ�绰����</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomePhoneNo" value="72672367" size=10 maxlength=8></td>

    </tr>

    <tr>

      <td width="25%" class="BACKGROUND_a" align = "left">DependentCnt ��������</td>
      <td width="75%" class="BACKGROUND_c" colspan=3><input name="DependentCnt" value="" size=10 maxlength=2></td>
    </tr>

  </table>
    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong class="color">ְҵ��Ϣ�������</strong></td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>ComAddrPtCd ��˾�ʱ�</td>
        <td class="BACKGROUND_c"> <input name="ComAddrPtCd" value="100055" size=10 maxlength=6>
        </td>
         <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AT6120 ְҵ��Ϣ</td>
        <td class="BACKGROUND_c" colspan=3> <input name="AT6120" value="" size=10 maxlength=6>
        </td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompTelPhonePro ��˾�绰����</td>
        <td width="25%" class="BACKGROUND_c"><input name="CompTelPhonePro" value="010" size=10 maxlength=5></td>
  <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompTelPhone ��˾�绰����</td>
        <td width="25%" class="BACKGROUND_c" ><input name="CompTelPhone" value="8348934" size=10 maxlength=8></td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompBizField ��ҵ����</td>
        <td class="BACKGROUND_c"><select name="CompBizField">
            <option value="">��ѡ��</option>
            <option value="01" >����ҵ</option>
            <option value="02">������ó��</option>
            <option value="03">����/����/����</option>
            <option value="04" selected>����ҵ</option>
            <option value="05">��Դ</option>
            <option value="06">����/��Ϣ����/��������</option>
            <option value="07">���ż���������ҵ</option>
            <option value="08">�Ƶ�/����</option>
            <option value="09">ˮ���������͹�����ʩ����ҵ</option>
            <option value="10">���ز�</option>
            <option value="11">����</option>
            <option value="12">��������</option>
            <option value="13">�Ļ�/����/��ѵ</option>
            <option value="14">��ͨ����/�ִ�/����</option>
            <option value="15">����/���</option>
            <option value="16">��ҵ��ѯ/���ʷ���</option>
            <option value="17">����/��ᱣ��/����ҵ</option>
            <option value="18">�Ļ�/����/����ҵ</option>
            <option value="19">ý��/����/����ҵ</option>
            <option value="20">����</option>
        </select></td>
         <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AT6130�Ƿ��±�</td>
        <td class="BACKGROUND_c">
        	<select name="AT6130">
        		<option value="">��ѡ��</option>
        		<option value="1" >�±�</option>
        		<option value="2" selected="selected">�ɱ�</option>
        	</select>
        </td>
      </tr>
      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompBizOwShType ��������</td>
        <td width="25%" class="BACKGROUND_c" > <select name="CompBizOwShType">
            <option value="">��ѡ��</option>
            <option value="11" selected>11��������/��ҵ��λ</option>
            <option value="12" >12��Ӫ��ҵ</option>
            <option value="03">03������ҵ</option>
            <option value="13">13���徭Ӫ/����ְҵ</option>
            <option value="14">14��Ӫ��ҵ</option>
            <option value="15">15�ɷ��ƹ�˾</option>
            <option value="16">16����Ͷ��/����</option>
            <option value="08">08�۰�̨Ͷ��/����</option>
            <option value="17">17����</option>
            <option value="18">18����</option>
			<option value="11">11��ְ</option>
        </select> </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriPos ����������ְλ</td>
        <td width="25%" class="BACKGROUND_c" > <select name="PriPos">
            <option value="">��ѡ��</option>
		        <option value="501"> 	501(��)��/�ּ����� </option>
		        <option value="601">	601�ܾ���/�ܲ�     </option>
		        <option value="604">	604һ��Ա��        </option>
		        <option value="701">	701�߼�ְ�Ƽ�����  </option>
		        <option value="801">	801��/�ּ�����/��ҵ������  </option>
		        <option value="802" selected>	802�ش���/�ܾ���  </option>
		        <option value="803">	803�Ƽ�/���ž���  </option>
		        <option value="804">	804��Ա��/ְ��  </option>
		        <option value="805">	805����  </option>
                        <option value="101" >101(��)��/�ּ������Ϲ���Ա</option>
                        <option value="401">401�ܾ���/�ܲ�</option>
                        <option value="406">406һ��Ա��</option>
                        <option value="407">407����</option>
        </select> </td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompPosSeniority ��ְ����</td>
        <td width="25%" class="BACKGROUND_c"><input name="CompPosSeniority" value="5" size=10 maxlength=2>
        ��</td>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>MthlySalary ��ǰ������������</td>
        <td width="25%" class="BACKGROUND_c"><input name="MthlySalary" value="10000" size=10 maxlength=10>
        Ԫ</td>
      </tr>
      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AmmSalary ��н�ܶ�</td>
        <td class="BACKGROUND_c" colspan="3"><input name="AmmSalary" value="120000" size=10 maxlength=10>
        Ԫ</td>
        <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AT0710 �����������</td>
        <td class="BACKGROUND_c" colspan="3"><input name="AT0710" value="110000" size=10 maxlength=10>
        Ԫ</td>
      </tr>
    </table>
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong>�����������ʲ���Ϣ</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>OtherBankCardSta �������������������ÿ�</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="OtherBankCardSta" onChange="javascript:changeOtherBankCardSta(this.value)">
          <option value="">��ѡ��</option>
          <option value="0" >��δ��������ÿ�</option>
          <option value="1" selected>��������</option>
          <option value="2">��������</option>
        </select>
      </td>
      <td width="25%" align = "left" class="BACKGROUND_a">OthCardCnt �������ÿ�����</td>
      <td width="25%" class="BACKGROUND_c"><input name="OthCardCnt" value="" size=10 maxlength=2>��</td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>BOCSaveActFlg �Ƿ����ڽ������п��������˻�</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="BOCSaveActFlg" >
          <option value="" selected>��ѡ��</option>
          <option value="Y" >��</option>
          <option value="N" selected>��</option>
        </select>
      </td>
      <td width="25%" align = "left" class="BACKGROUND_a"> OthBankSaveActNum ��������ҵ�����ʻ���</td>
      <td width="25%" class="BACKGROUND_c"><input name="OthBankSaveActNum" value="" size=10 maxlength=2></td>
    </tr>

  </table>
  <b><span id="stateBut" onclick="$use()">��������Ϣ</span></b>
  <div id="class1content" style="display: none">
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
  
    <tr>
        <td colspan=4 align="center"><strong><input type="checkbox" name="supp1" onClick="javascript:selectsupp1()">������1��Ϣ</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppRelation1 �����������˵Ĺ�ϵ</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppRelation1">
          <option value="" selected>��ѡ��</option>
          <option value="1">��ĸ</option>
          <option value="2">��ż</option>
          <option value="3">��Ů</option>
          <option value="4" >����</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">PrimaryCardNo1 ��������</td>
      <td width="25%" class="BACKGROUND_c"><input name="PrimaryCardNo1" value="" size=16 maxlength=16></td>
<!--0209
      <td class="BACKGROUND_a" align = "left">�����������˵Ĺ�ϵ����˵��</td>
      <td class="BACKGROUND_c"><input name="SupplRelationExpl" value="" size=20 maxlength=30></td>
-->
    </tr>
    <tr>
    <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppSex1 �Ա�</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppSex1">
          <option value="" selected>��ѡ��</option>
          <option value="1" >��</option>
          <option value="2">Ů</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppBirthday1 ��������������</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppBirthday1" value="" size=8 maxlength=12>(YYYYMMDD)</td>
    </tr>
   <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDType1 ֤������</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppIDType1">
          <option value="" selected>��ѡ��</option>
          <option value="1" >���֤</option>
          <option value="2">����</option>
          <option value="3">����֤</option>
          <option value="4">̨��֤</option>
          <option value="5">����֤</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDNo1 ֤������</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppIDNo1" value="" size=20 maxlength=20></td>
    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppLimitFlag1 ���������ö���趨</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppLimitFlag1">
          <option value="">��ѡ��</option>
          <option value="1" >��������ͬʹ��</option>
          <option value="2" selected>�趨���ͻ���д�ٷֱ�</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppLimitPercent1 ��Ϊ�������趨���ö�ȣ��ٷֱ�</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppLimitPercent1" value="" size=10 maxlength=5>%</td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppTitle1 </td>
      <td width="25%" class="BACKGROUND_c">
       <input type="text" name="SuppTitle1" id="SuppTitle1" value="1"/>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SupplID1</td>
      <td width="25%" class="BACKGROUND_c"><input type="text" name="SupplID1" id="SupplID1" value="1"/>%</td>
    </tr>
  <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppJCBType1 </td>
      <td width="25%" class="BACKGROUND_c">
       <input type="text" name="SuppJCBType1" id="SuppJCBType1" value="1"/>
      </td>
    </tr>
  
  
  </table>
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong><input type="checkbox" name="supp2"  onclick="javascript:selectsupp2()">������2��Ϣ</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppRelation2 �����������˵Ĺ�ϵ</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppRelation2">
          <option value="" selected>��ѡ��</option>
          <option value="1" >��ĸ</option>
          <option value="2">��ż</option>
          <option value="3">��Ů</option>
          <option value="4" >����</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">PrimaryCardNo2 ��������</td>
      <td width="25%" class="BACKGROUND_c"><input name="PrimaryCardNo2" value="" size=16 maxlength=16></td>
<!--0209
      <td class="BACKGROUND_a" align = "left">�����������˵Ĺ�ϵ����˵��</td>
      <td class="BACKGROUND_c"><input name="SupplRelationExpl" value="" size=20 maxlength=30></td>
-->
    </tr>
    <tr>
    <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppSex2 �Ա�</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppSex2">
          <option value="" selected>��ѡ��</option>
          <option value="1" >��</option>
          <option value="2">Ů</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppBirthday2 ��������������</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppBirthday2" value="" size=8 maxlength=8>(YYYYMMDD)</td>
    </tr>
   <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDType2 ֤������</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppIDType2">
          <option value="" selected>��ѡ��</option>
          <option value="1" >���֤</option>
          <option value="2">����</option>
          <option value="3">����֤</option>
          <option value="4">̨��֤</option>
          <option value="5">����֤</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDNo2 ֤������</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppIDNo2" value="" size=20 maxlength=20></td>
    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppLimitFlag2 ���������ö���趨</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppLimitFlag2">
          <option value="" selected>��ѡ��</option>
          <option value="1" >��������ͬʹ��</option>
          <option value="2">�趨���ͻ���д�ٷֱ�</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppLimitPercent2��Ϊ�������趨���ö�ȣ��ٷֱ�</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppLimitPercent2" value="" size=10 maxlength=5>%</td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppTitle2 </td>
      <td width="25%" class="BACKGROUND_c">
       <input type="text" name="SuppTitle2" id="SuppTitle2" value="1"/>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SupplID2</td>
      <td width="25%" class="BACKGROUND_c"><input type="text" name="SupplID2" id="SupplID2" value="1"/>%</td>
    </tr>
  <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppJCBType2 </td>
      <td width="25%" class="BACKGROUND_c">
       <input type="text" name="SuppJCBType2" id="SuppJCBType2" value="1"/>
      </td>
    </tr>
  </table>
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong><input type="checkbox" name="supp3"  onclick="javascript:selectsupp3()">������3��Ϣ</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppRelation3 �����������˵Ĺ�ϵ</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppRelation3">
          <option value="" selected>��ѡ��</option>
          <option value="1" >��ĸ</option>
          <option value="2">��ż</option>
          <option value="3">��Ů</option>
          <option value="4">����</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">PrimaryCardNo3 ��������</td>
      <td width="25%" class="BACKGROUND_c"><input name="PrimaryCardNo3" value="" size=16 maxlength=16></td>
<!--0209
      <td class="BACKGROUND_a" align = "left">�����������˵Ĺ�ϵ����˵��</td>
      <td class="BACKGROUND_c"><input name="SupplRelationExpl" value="" size=20 maxlength=30></td>
-->
    </tr>
    <tr>
    <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppSex3 �Ա�</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppSex3">
          <option value="" selected>��ѡ��</option>
          <option value="1" >��</option>
          <option value="2">Ů</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppBirthday3 ��������������</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppBirthday3" value="" size=8 maxlength=8>(YYYYMMDD)</td>
    </tr>
   <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDType3 ֤������</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppIDType3">
          <option value="" selected>��ѡ��</option>
          <option value="1" >���֤</option>
          <option value="2">����</option>
          <option value="3">����֤</option>
          <option value="4">̨��֤</option>
          <option value="5">����֤</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDNo3 ֤������</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppIDNo3" value="" size=20 maxlength=20></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppLimitFlag3 ���������ö���趨</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppLimitFlag3">
          <option value="" selected>��ѡ��</option>
          <option value="1" >��������ͬʹ��</option>
          <option value="2">�趨���ͻ���д�ٷֱ�</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppLimitPercent3 ��Ϊ�������趨���ö�ȣ��ٷֱ�</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppLimitPercent3" value="" size=10 maxlength=5>%</td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppTitle3 </td>
      <td width="25%" class="BACKGROUND_c">
       <input type="text" name="SuppTitle3" id="SuppTitle3" value="1"/>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SupplID3</td>
      <td width="25%" class="BACKGROUND_c"><input type="text" name="SupplID3" id="SupplID3" value="1"/>%</td>
    </tr>
  <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppJCBType3 </td>
      <td width="25%" class="BACKGROUND_c">
       <input type="text" name="SuppJCBType3" id="SuppJCBType3" value="1"/>
      </td>
    </tr>
  </table>
</div>
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong>�½ᵥѡ��</strong></td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>PriStatAddrSel �������˵��ʼĵ�ַ</td>
      <td width="75%" class="BACKGROUND_c" >
        <select name="PriStatAddrSel">
          <option value="">��ѡ��</option>
          <option value="1" selected >��˾��ַ</option>
          <option value="2" >��ͥסַ</option>
        </select>
      </td>

    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppStatAddrPtCd ��Ϊ������ַ���������ʵ��ʼ��ʱ�</td>
      <td width="75%" class="BACKGROUND_c" colspan=3><input name="SuppStatAddrPtCd" value="" size=10 maxlength=10></td>
    </tr>

  </table>
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong class="color">������Ϣ�������</strong></td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AutoPayMethod ���ʽ</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="AutoPayMethod">
          <option value="">��ѡ��</option>
          <option value="2" >2�Զ�����</option>
          <option value="1" selected >1��������</option>
        </select>
      </td>
	<td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AutoPayAmtSel ������趨������ң�</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="AutoPayAmtSel">
          <option value="">��ѡ��</option>
          <option value="1" selected >ȫ���</option>
          <option value="2">��ͻ���</option>
        </select>
      </td>

    </tr>


    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AutoPayActSel �����˻�ѡ��</td>
      <td class="BACKGROUND_c" colspan=3>
        <select name="AutoPayActSel">
          <option value="">��ѡ��</option>
          <option value="1" >���������ҷֱ𻹿�</option>
          <option value="2" selected>���н�Ƿ��������һ���</option>
        </select>
      </td>
    </tr>
  </table>

    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong >������д��Ϣ</strong></td>
      </tr>
    <tr>
        <td width="25%" class="BACKGROUND_a" align = "left">BKCC Ӫ�������</td>
        <td width="25%" class="BACKGROUND_c">
            <input name="BKCC" size=10 maxlength=9 value="" >        </td>
        <td width="25%" align = "left" class="BACKGROUND_a">BKBH �����������</td>
        <td width="25%" class="BACKGROUND_c"><input name="BKBH" value="" size=20 maxlength=12></td>
	</tr>

      <tr>
        <td width="25%" align = "left" class="BACKGROUND_a">BKPCC ������ʽ</td>
        <td width="25%" valign="middle" class="BACKGROUND_c"><input name="BKPCC" value="" size=10 maxlength=18></td>
        <td width="25%" class="BACKGROUND_a" align = "left">BKVIP �Ƿ�VIP</td>
        <td width="25%" class="BACKGROUND_c"> <select name="BKVIP">
            <option value="">��ѡ��</option>
            <option value="Y" >��</option>
            <option value="N" selected >��</option>
          </select> </td>
      </tr>
      <tr>
        
        <td class="BACKGROUND_a" align = "left">IfBHDA�Ƿ��������</td>
        <td class="BACKGROUND_c"><select name="IfBHDA" id="IfBHDA">
          <option value="">��ѡ��</option>
          <option value="Y">Y</option>
          <option value="N" selected>N</option>
                </select></td>
      </tr>

        <tr>
        <td colspan=4 align="center"><strong class="color">APSϵͳ�ṩ������Ϣ����*��Ϊ�����</strong></td>
      </tr>

      <tr>
        <!--<td width="25%" class="BACKGROUND_a" align = "left">������</td>
        <td width="25%" class="BACKGROUND_c"><input name="ApplNum" value="" size=20 maxlength=16></td>-->

       <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>BKSTF �Ƿ�ΪԱ����</td>
        <td width="25%" class="BACKGROUND_c" colspan=3> <select name="BKSTF" onChange="javascript:changeBKSTF(this.value);">
            <option value="">��ѡ��</option>
            <option value="Y" >��</option>
            <option value="N" selected >��</option>
          </select></td>
      </tr>



    <!--input type="hidden" name="BOCCardHoder" value="">
    <input type="hidden" name="BOCCardBeginDate" value="">
    <input type="hidden" name="BOCCardLimit" value="">
    <input type="hidden" name="BOCCardNum" value="">
    <input type="hidden" name="DPD30P24Mon" value="">
    <input type="hidden" name="DPD60P24Mon" value="">
    <input type="hidden" name="DPD90P24Mon" value="">
    <input type="hidden" name="AppRanNum" value="">
    <input type="hidden" name="FirstApprvdStrategyID" value="">
    <input type="hidden" name="AppCnt" value="">
    <input type="hidden" name="IfVIP" value=""-->
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">BOCCardHolder �Ƿ������ÿ����гֿ���</td>
      <td class="BACKGROUND_c" width="25%"> <select name="BOCCardHolder">
            <option value="">��ѡ��</option>
            <option value="Y">��</option>
            <option value="N" selected>��</option>
          </select> </td>
      <td width="25%" align = "left" class="BACKGROUND_a">BOCCardBeginDate ���б������ÿ������翪ʼ����</td>
      <td width="25%" class="BACKGROUND_c"><input name="BOCCardBeginDate" value="" size=8 maxlength=8></td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>BOCCardLimit �����������ڱ��е������ö��(�����)</td>
      <td class="BACKGROUND_c" width="25%">
	<input name="BOCCardLimit" value="" size=20 maxlength=20>Ԫ</td>
      <td width="25%" align = "left" class="BACKGROUND_a">BOCCardAmnt ���������ö��(�����)</td>
      <td width="25%" class="BACKGROUND_c"><input name="BOCCardAmnt" id="BOCCardAmnt" value="" size=20 maxlength=20>
        Ԫ</td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">BOCCardNum ���б������ÿ�����������</td>
      <td class="BACKGROUND_c"><input name="BOCCardNum" value="" size=8 maxlength=8>
        ��</td>
      <td align = "left" class="BACKGROUND_a">DPD30P24Mon �Ƿ���Ƿ30��</td>
      <td class="BACKGROUND_c"><select name="DPD30P24Mon">
          <option value="">��ѡ��</option>
          <option value="Y">��</option>
          <option value="N" selected>��</option>
        </select>      </td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">DPD60P24Mon �Ƿ���Ƿ60��</td>
      <td class="BACKGROUND_c"><select name="DPD60P24Mon">
          <option value="">��ѡ��</option>
          <option value="Y">��</option>
          <option value="N" selected>��</option>
        </select>      </td>
      <td align = "left" class="BACKGROUND_a">DPD90P24Mon �Ƿ���Ƿ90��</td>
      <td class="BACKGROUND_c"><select name="DPD90P24Mon">
          <option value="">��ѡ��</option>
          <option value="Y">��</option>
          <option value="N" selected>��</option>
        </select>      </td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">AppRanNum �ͻ������ID</td>
      <td class="BACKGROUND_c"><input name="AppRanNum" value="" size=3 maxlength=3></td>
      <td align = "left" class="BACKGROUND_a">FirstApprvdStrategyID ����׼ʱ�Ĳ��Ա�ID��S��</td>
      <td class="BACKGROUND_c"><input name="FirstApprvdStrategyID" value="" size=20 maxlength=20></td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">AppCnt ��ȥ������Ĵ���</td>
      <td class="BACKGROUND_c" ><input name="AppCnt" value="" size=8 maxlength=8></td>

      <td width="25%" align = "left" class="BACKGROUND_a">&nbsp;</td>
      <td width="25%" class="BACKGROUND_c" >&nbsp;</td>
    </tr>
    </table>

    <table id="AssetTableId" width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong class="color">�����Ϣ�������</strong></td>
    </tr>
    
 
    <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType1Id ��֤�����ʲ�����1</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType1Id" name="CredAssetType1" onChange="javascript:changeValue1(this.value,'');">
            <option value="" selected>��ѡ��</option>
            <option value="0" >��</option>
            <option value="21">���з���</option>
            <option value="22">��������</option>
            <option value="23">���ڴ��</option>
            <option value="24">���ڴ��</option>
            <option value="25">����ծȯ</option>
            <option value="26">���ٱ���</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>��֤�����ʲ���ֵ1</td>
      <td class="BACKGROUND_c" width="25%"><span id="value1"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
        <tr>
       <td width="25%" align = "left" class="BACKGROUND_a">CredAssetType2Id ��֤�����ʲ�����2</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType2Id" name="CredAssetType2" onChange="javascript:changeValue2(this.value,'');">
            <option value="" selected>��ѡ��</option>
           <option value="0" >��</option>
            <option value="21">���з���</option>
            <option value="22">��������</option>
            <option value="23">���ڴ��</option>
            <option value="24">���ڴ��</option>
            <option value="25">����ծȯ</option>
            <option value="26">���ٱ���</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a">��֤�����ʲ���ֵ2</td>
      <td class="BACKGROUND_c" width="25%"><span id="value2"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
    <tr>
       <td width="25%" align = "left" class="BACKGROUND_a">CredAssetType3Id ��֤�����ʲ�����3</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType3Id" name="CredAssetType3" onChange="javascript:changeValue3(this.value,'');">
            <option value="" selected>��ѡ��</option>
           <option value="0" >��</option>
            <option value="21">���з���</option>
            <option value="22">��������</option>
            <option value="23">���ڴ��</option>
            <option value="24">���ڴ��</option>
            <option value="25">����ծȯ</option>
            <option value="26">���ٱ���</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a">��֤�����ʲ���ֵ3</td>
      <td class="BACKGROUND_c" width="25%"><span id="value3"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
    
   <!--   �¼� -->
      <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType4Id ��֤�����ʲ�����4</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType4Id" name="CredAssetType4" onChange="javascript:changeValue4(this.value,'');">
            <option value="" selected>��ѡ��</option>
            <option value="0" >��</option>
            <option value="21">���з���</option>
            <option value="22">��������</option>
            <option value="23">���ڴ��</option>
            <option value="24">���ڴ��</option>
            <option value="25">����ծȯ</option>
            <option value="26">���ٱ���</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>��֤�����ʲ���ֵ4</td>
      <td class="BACKGROUND_c" width="25%"><span id="value4"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
	<tr>
	
	      <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType5Id ��֤�����ʲ�����5</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType5Id" name="CredAssetType5" onChange="javascript:changeValue5(this.value,'');">
            <option value="" selected>��ѡ��</option>
           <option value="0" >��</option>
            <option value="21">���з���</option>
            <option value="22">��������</option>
            <option value="23">���ڴ��</option>
            <option value="24">���ڴ��</option>
            <option value="25">����ծȯ</option>
            <option value="26">���ٱ���</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>��֤�����ʲ���ֵ5</td>
      <td class="BACKGROUND_c" width="25%"><span id="value5"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P25Mon" value="" size=2 maxlength=1></td-->
    </tr>
	<tr>
	
	      <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType6Id ��֤�����ʲ�����6</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType6Id" name="CredAssetType6" onChange="javascript:changeValue6(this.value,'');">
            <option value="" selected>��ѡ��</option>
           <option value="0" >��</option>
            <option value="21">���з���</option>
            <option value="22">��������</option>
            <option value="23">���ڴ��</option>
            <option value="24">���ڴ��</option>
            <option value="25">����ծȯ</option>
            <option value="26">���ٱ���</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>��֤�����ʲ���ֵ6</td>
      <td class="BACKGROUND_c" width="25%"><span id="value6"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P26Mon" value="" size=2 maxlength=1></td-->
    </tr>
    <!-- �¼ӿ�֤���������� -->
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome1 ��֤������������1</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredIncome1" name="CredIncome1" onChange="javascript:changeValue6(this.value,'');">
            <option value="" >��ѡ��</option>
            <option value="11">11���д������ʵĴ���/�ʵ�</option>
            <option value="12">12��������˰��˰֤��</option>
            <option value="13">13������۽�ƾ֤</option>
            <option value="14">14��ᱣ�տ۽�ƾ֤</option>
            <option value="15">15֪����ҵ���ߵĹ��ʵ�</option>
            <option value="16">16���м������������ػ���ҵ��λ���²��ſ��ߵ�����֤��</option>
            <option value="17">17����ƽ������</option>
            <option value="18">18��������֤��</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome1Value ��֤������������ֵ1</td>
      
      <td width="25%" class="BACKGROUND_c"><input id = "CredIncome1Value" name="CredIncome1Value" value="1300" size=20 maxlength=20></td>
    </tr>
    
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome2 ��֤������������2</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredIncome2" name="CredIncome2" onChange="javascript:changeValue6(this.value,'');">
            <option value="">��ѡ��</option>
            <option value="11" >11���д������ʵĴ���/�ʵ�</option>
            <option value="12">12��������˰��˰֤��</option>
            <option value="13">13������۽�ƾ֤</option>
            <option value="14">14��ᱣ�տ۽�ƾ֤</option>
            <option value="15">15֪����ҵ���ߵĹ��ʵ�</option>
            <option value="16">16���м������������ػ���ҵ��λ���²��ſ��ߵ�����֤��</option>
            <option value="17">17����ƽ������</option>
            <option value="18">18��������֤��</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome2Value ��֤������������ֵ2</td>
      
      <td width="25%" class="BACKGROUND_c"><input id = "CredIncome2Value" name="CredIncome2Value" value="" size=20 maxlength=20></td>
    </tr>
    	<tr>

        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AppiMcContactRelship ����������ϵ�˹�ϵ</td>
        <td width="25%" class="BACKGROUND_c"> <select name="AppiMcContactRelship"  >
            <option value="">��ѡ��</option>
            <option value="11" selected>11��ĸ</option>
            <option value="12" >12��ż</option>
            <option value="13" >13����</option>
            <option value="14" >14����</option>
          </select> </td>
     
    </tr>
    
	<tr>

        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>IncomeProof �Ƿ��ṩ����֤���ļ�</td>
        <td width="25%" class="BACKGROUND_c"> <select name="IncomeProof" onChange="javascript:changeIncomeProofValue(this.value,'');" >
            <option value="">��ѡ��</option>
            <option value="Y" selected>��</option>
            <option value="N" >��</option>
          </select> </td>
     
    </tr>
	<tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AprSpeGrpProof �ͻ�����</td>
      <td class="BACKGROUND_c" colspan=3><select name="AprSpeGrpProof" onChange="javascript:changeAprSpeGrpType(this.value);">
            <option value="">��ѡ��</option>
            <option value="0" selected >��ͨ�ͻ�</option>
            <option value="8100">8100�ص���ҵ�ͻ�</option>
            <option value="8200">8200�ص�ͻ�</option>
            <option value="8410">8410�߷��տͻ����������쿨�ࣩ</option>
            <option value="8420">8420�߷��տͻ����ܾ��ࣩ</option>
						<option value="8500">8500ѧ���ͻ�</option>
						<option value="8600">8600���м���Ա���ͻ�</option>
						<option value="8700">8700�Ƽ��ͻ�</option>
						<option value="8810">8810���ڽ������ۿͻ�(���˽��ڿͻ�)</option>
						<option value="8820">8820���ڽ������ۿͻ�</option>
						<option value="8900">8900��������������ͻ�</option>
          </select></td>
	</tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AprPosLevl ��֤����ְ�񼶱�</td>
      <td width="25%" class="BACKGROUND_c"><select name="AprPosLevl">
            <option value="">��ѡ��</option>
            <option value="0" >ȱʧ</option>
            <option value="1" selected>һ����Ա</option>
            <option value="2" >���Ź�����Ƽ���</option>
            <option value="3">�߼������򴦼���</option>
            <option value="4">�߲���������ּ������ϣ�</option>
		</select>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AprWrkSeniority ��֤���Ĵ�ҵ����</td>
      <td width="25%" class="BACKGROUND_c"><input name="AprWrkSeniority" value="5" size=20 maxlength=5></td>
    </tr>
    <tr>
     <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>IfHiRiskBiz �Ƿ���¸߷�����ҵ</td>
      <td width="25%" class="BACKGROUND_c" colspan=3><select name="IfHiRiskBiz">
            <option value="">��ѡ��</option>
            <option value="0" selected >��/ȱʧ</option>
            <option value="1" >�����������쿨��</option>
            <option value="2">���ھܾ���</option>
		</select>		</td>
	  </tr>
	  
	  2014-1-12 2013-01-24 yyyyMMdd
	 <tr>
      <td align = "left" class="BACKGROUND_a">AppiMcHouseProperty ���Ƿ�ӵ�з���</td>
      <td class="BACKGROUND_c"><select name="AppiMcHouseProperty">
          <option value=""  >��ѡ��</option>
          <option value="1">��</option>
          <option value="2" selected>��</option>
        </select>      </td>
      <td align = "left" class="BACKGROUND_a">AppiMcCarInd ���Ƿ�ӵ�л�����</td>
      <td class="BACKGROUND_c"><select name="AppiMcCarInd">
          <option value=""  >��ѡ��</option>
          <option value="1">��</option>
          <option value="2" selected>��</option>
        </select>      </td>
    </tr>
	  
    <tr>
        <td colspan=4 align="center"><strong>APSϵͳ�ṩ�ⲿ����</strong></td>
      </tr>
	   <tr>
       <td width="25%" align = "left" class="BACKGROUND_a">IfPBOCInfo �Ƿ��ȡ������Ϣ</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfPBOCInfo" onChange="javascript:changeIfPBOCInfoValue(this.value,'');">
             <option value="" >��ѡ��</option>
            <option value="0" selected>ȱʧ</option>
            <option value="1">ƥ��ɹ�</option>
            <option value="2">ƥ��ʧ��</option>
		</select>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">IfSSInfo �Ƿ��ȡ�籣��Ϣ</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfSSInfo">
            <option value="" >��ѡ��</option>
            <option value="0" selected>ȱʧ</option>
            <option value="1" >ƥ��ɹ�</option>
            <option value="2">ƥ��ʧ��</option>
		</select></td>
    </tr>
	   <tr>
     <td width="25%" align = "left" class="BACKGROUND_a">IfMPSInfo �Ƿ��ȡ������Ϣ</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfMPSInfo">
             <option value="">��ѡ��</option>
            <option value="0" selected>ȱʧ</option>
            <option value="1" >ƥ��ɹ�</option>
            <option value="2">ƥ��ʧ��</option>
		</select>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">IfCBRCInfo �Ƿ��ȡ������Ϣ</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfCBRCInfo">
            <option value="">��ѡ��</option>
            <option value="0" selected>ȱʧ</option>
            <option value="1" >ƥ��ɹ�</option>
            <option value="2">ƥ��ʧ��</option>
		</select></td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">LstSSPayDate ����ɷ�����</td>
      <td width="25%" class="BACKGROUND_c"><input name="LstSSPayDate" value="" size=6 maxlength=6>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CurrSSMonthPay ��ǰ�籣�½ɿ��</td>
      <td width="25%" class="BACKGROUND_c"><input name="CurrSSMonthPay" value="" size=20 maxlength=20></td>
    </tr>
	   <tr>
     <td width="25%" align = "left" class="BACKGROUND_a">MPSBirthDate �����ṩ�ĳ�������</td>
      <td width="25%" class="BACKGROUND_c"><input name="MPSBirthDate" value="" size=8 maxlength=8>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">PayMonth �����ɷѵ�����</td>
      <td width="25%" class="BACKGROUND_c"><input name="PayMonth" value="" size=20 maxlength=20></td>
    </tr>

	   <tr>
	     <td colspan="4" align = "left" class="BACKGROUND_a"><div align="center"><strong>���Ŵ��ǿ�����</strong></div></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">NumCCardAct ���ǿ��ʻ�����</td>
	     <td class="BACKGROUND_c"><input id="NumCCardActId" name="NumCCardAct" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">&nbsp;</td>
	     <td class="BACKGROUND_c">&nbsp;</td>
      </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CredCcardQcctNum ׼���ǿ��ʻ���</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredCcardQcctNumId" name="CredCcardQcctNum" value="" size=8 maxlength=8>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">TotlCCardCLmt ���ǿ����������ö��</td>
      <td width="25%" class="BACKGROUND_c"><input id="TotlCCardCLmtId" name="TotlCCardCLmt" value="" size=20 maxlength=20>Ԫ</td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">TotlCCardOLmt ���ǿ�������͸֧���</td>
      <td width="25%" class="BACKGROUND_c"><input id="TotlCCardOLmtId" name="TotlCCardOLmt" value="" size=20 maxlength=20>Ԫ		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardFrtOpnDate ���ǿ����翪������</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardFrtOpnDateId" name="CCardFrtOpnDate" value="" size=8 maxlength=8>(YYYYMMDD)</td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardLstOpnDate ���ǿ�����������</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardLstOpnDateId" name="CCardLstOpnDate" value="" size=8 maxlength=8>(YYYYMMDD)		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardHiLimit ���ǿ�������߶�ȣ�����ң�</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardHiLimitId" name="CCardHiLimit" value="" size=20 maxlength=20>Ԫ</td>
    </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CredCcardL6M3Num ���ǿ���6����M3+�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="CredCcardL6M3NumId" name="CredCcardL6M3Num" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">׼���ǿ���3����M3,M3+�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="CredQcardL3M3NumId" name="CredQcardL3M3Num" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CCardM0In3M ���ǿ���3����M0�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="CCardM0In3MId" name="CCardM0In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">CCardM1In3M ���ǿ���3����M1�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="CCardM1In3MId" name="CCardM1In3M" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CCardM2In3M ���ǿ���3����M2+�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="CCardM2In3MId" name="CCardM2In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">&nbsp;</td>
	     <td class="BACKGROUND_c">&nbsp;</td>
      </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardM1In6M ���ǿ����6����M1�Ĵ���</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardM1In6MId" name="CCardM1In6M" value="" size=8 maxlength=8>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardM2In12M ���ǿ����12����M2��M2+�Ĵ���</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardM2In12MId" name="CCardM2In12M" value="" size=20 maxlength=20></td>
    </tr>
	   <tr>
	     <td colspan="4" align = "left" class="BACKGROUND_a"><div align="center"><strong>���Ŵ�������</strong></div></td>
      </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CurrLoanBalance ���ǰ�����</td>
      <td width="25%" class="BACKGROUND_c"><input id="CurrLoanBalanceId" name="CurrLoanBalance" value="" size=20 maxlength=20>Ԫ		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CredLoanContractOlmt �����ͬ���</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredLoanContractOlmtId" name="CredLoanContractOlmt" value="" size=20 maxlength=20>Ԫ</td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CredQcardL6M3Num ׼���ǿ���6����M3,M3+�Ĵ���</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredQcardL6M3NumId" name="CredQcardL6M3Num" value="" size=20 maxlength=20>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CredCcardL6M2Num ���ǿ���6����M2�Ĵ���</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredCcardL6M2NumId" name="CredCcardL6M2Num" value="" size=20 maxlength=20>		</td>
    </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">LoanM0In3M �����3����M0�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="LoanM0In3MId" name="LoanM0In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">LoanM1In3M �����3����M1�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="LoanM1In3MId" name="LoanM1In3M" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">LoanM2In3M �����3����M2+�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="LoanM2In3MId" name="LoanM2In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">LoanM1In6M �������6����M1�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="LoanM1In6MId" name="LoanM1In6M" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">LoanM2In12M �������12����M2��M2+�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="LoanM2In12MId" name="LoanM2In12M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">CredLoanL6M2Num �����6����M2,M2+�Ĵ���</td>
	     <td class="BACKGROUND_c"><input id="CredLoanL6M2NumId" name="CredLoanL6M2Num" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CLM1In3M ��6����ͬʱ�������ǿ��������Ŵ����ڵĴ���</td>
	     <td class="BACKGROUND_c"><input name="CLM1In3M" id="CLM1In3M" value="" size="20" maxlength="20"></td>
	     <td align = "left" class="BACKGROUND_a">CredYearIncome ����������</td>
	     <td class="BACKGROUND_c"><input name="CredYearIncome" id="CredYearIncome" value="" size="20" maxlength="20"></td>
      </tr>
      <tr>
	     <td align = "left" class="BACKGROUND_a">ProvFundFirstLimit ����ס���������½ɴ��</td>
	     <td class="BACKGROUND_c"><input id="ProvFundFirstLimitId" name="ProvFundFirstLimit" value="" size=20 maxlength=20></td>
         <td align = "left" class="BACKGROUND_a">CurrLoanMthlyPay ����»����ܶ�</td>
	     <td class="BACKGROUND_c"><input id="CurrLoanMthlyPayId" name="CurrLoanMthlyPay" value="" size="20" maxlength="20"></td>
      </tr>
	   <tr>
	     <td colspan="4" align = "left" class="BACKGROUND_a"><div align="center"><strong>�����˲���Ϣ</strong></div></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">ReservedField2 �˹���Ԥ</td>
	     <td class="BACKGROUND_c"><select name="ReservedField2" id="ReservedField2">
           <option value="">��ѡ��</option>
           <option value="0" selected>��</option>
           <option value="1">�߱������������߼�����</option>
           <option value="2">�绰��ʵ���߼�����</option>
           <option value="3">��������</option>
                                    </select></td>
	     <td align = "left" class="BACKGROUND_a">BlkChkResult �����������</td>
	     <td class="BACKGROUND_c"><select name="BlkChkResult" id="BlkChkResult">
           <option value="">��ѡ��</option>
           <option value="0">��ͨ��</option>
           <option value="1" selected>ͨ��</option>
                  </select></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">EomChkResult EOM�����</td>
	     <td class="BACKGROUND_c"><select name="EomChkResult" id="EomChkResult">
           <option value="">��ѡ��</option>
           <option value="0">��ͨ��</option>
           <option value="1" selected>ͨ��</option>
           <option value="9">�����</option>
                  </select></td>
	     <td align = "left" class="BACKGROUND_a">DupChkResult �ظ�����������</td>
	     <td class="BACKGROUND_c"><select name="DupChkResult" id="DupChkResult">
           <option value="">��ѡ��</option>
           <option value="0">��ͨ��</option>
           <option value="1" selected>ͨ��</option>
         </select></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CgryChkResult ��˾�����������</td>
	     <td class="BACKGROUND_c"><select name="CgryChkResult" id="CgryChkResult">
           <option value="">��ѡ��</option>
           <option value="0">��ͨ��</option>
           <option value="1" selected>ͨ��</option>
         </select></td>
	     <td align = "left" class="BACKGROUND_a">PgryChkResult ���˻����������</td>
	     <td class="BACKGROUND_c"><select name="PgryChkResult" id="PgryChkResult">
           <option value="">��ѡ��</option>
           <option value="0">��ͨ��</option>
           <option value="1" selected>ͨ��</option>
         </select></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">A2rChkResult ����֪ͨ��׼ת�ܾ������</td>
	     <td class="BACKGROUND_c"><select name="A2rChkResult" id="A2rChkResult">
           <option value="">��ѡ��</option>
           <option value="0">��ͨ��</option>
           <option value="1" selected>ͨ��</option>
         </select></td>

	     <td align = "left" class="BACKGROUND_a">AT4300 vip�ȼ�</td>
			<td>                                        
			<select name="AT4300" id="AT4300">
	          <option value="">��ѡ��</option>
			  <option value="1">1����</option>
	          <option value="2">2����</option>
	          <option value="5">5����</option>
	          <option value="6" selected>6��Ӣ</option>
	          <option value="C" >C VIP</option>
			  <option value="0" >0 ��VIP</option>
			  </select>
			</td>
      </tr>
<tr>
<td align = "left" class="BACKGROUND_a">BH �������</td>
        <td class="BACKGROUND_c"><select name="BH" id="BH">
          <option value="">��ѡ��</option>
          <option value="4120264012">4120264012new new </option>
	  <option value="4324445000">4324445000����</option>
          <option value="4335143000">4335143000����</option>
          <option value="4900004000">4900004000����</option>
          <option value="4110142000" selected>4110142000����</option>
          <option value="4373810000" >4373810000ɽ��</option>
          <option value="4355481000">4355481000����</option>
          <option value="4447504001">4447504001�㶫</option>
          <option value="4310303999">4310303999�Ϻ�</option>
          <option value="4508642000">4508642000����</option>
          <option value="4335129000">4335129000�㽭</option>
          <option value="4487669000">4487669000����</option>
          <option value="4416243111">4416243111����</option>
          <option value="4141041000">4141041000ɽ��</option>
          <option value="4222208000">4222208000����</option>
          <option value="4324433001">4324433001����</option>
          <option value="4120202000">4120202000���</option>
          <option value="4540600000">4540600000����</option>
          <option value="4130740999">4130740999�ӱ�</option>
          <option value="4151405000">4151405000���ɹ�</option>
          <option value="4211785000">4211785000����</option>
          <option value="4232465000">4232465000������</option>
          <option value="4613016070">4613016070����</option>
          <option value="4623251001">4623251001����</option>
          <option value="4643347000">4643347000����</option>
          <option value="4518631001">4518631001�Ĵ�</option>
          <option value="4633469000">4633469000�ຣ</option>
          <option value="4653600000">4653600000�½�</option>
          <option value="4344899000">4344899000����</option>
          <option value="4426405000">4426405000����</option>
          <option value="4436955000">4436955000����</option>
          <option value="4367370001">4367370001����</option>
          <option value="4467806000">4467806000����</option>
          <option value="4458051210">4458051210����</option>
          <option value="4528882039">4528882039����</option>
          <option value="4539146000">4539146000����</option>
			</select></td>
			<td class="BACKGROUND_a" align = "left">AT4320����������(һ������)</td><td><select name="AT4320" id="AT4320">
          <option value="">��ѡ��</option>
	  <option value="4324433001">����</option>
          <option value="4335143000">����</option>
          <option value="4900004000">����</option>
          <option value="4110142000" selected>����</option>
          <option value="4373810000" >ɽ��</option>
          <option value="4355481000">����</option>
          <option value="4447504001">�㶫</option>
          <option value="4310303999">�Ϻ�</option>
          <option value="4508642000">����</option>
          <option value="4335129000">�㽭</option>
          <option value="4487669000">����</option>
          <option value="4416243111">����</option>
          <option value="4141041000">ɽ��</option>
          <option value="4222208000">����</option>
          <option value="4324433001">����</option>
          <option value="4120202000">���</option>
          <option value="4540600000">����</option>
          <option value="4130740999">�ӱ�</option>
          <option value="4151405000">���ɹ�</option>
          <option value="4211785000">����</option>
          <option value="4232465000">������</option>
          <option value="4613016070">����</option>
          <option value="4623251001">����</option>
          <option value="4643347000">����</option>
          <option value="4518631001">�Ĵ�</option>
          <option value="4633469000">�ຣ</option>
          <option value="4653600000">�½�</option>
          <option value="4344899000">����</option>
          <option value="4426405000">����</option>
          <option value="4436955000">����</option>
          <option value="4367370001">����</option>
          <option value="4467806000">����</option>
          <option value="4458051210">����</option>
          <option value="4528882039">����</option>
          <option value="4539146000">����</option>
	  	  <option value="999">��ս����</option>
                                </select>
	</td> 
			</tr>
			</table>
			<b><span id="stateBut1" onclick="$use1()">������Ϣչ��</span></b>
			<div  id="class1content1" style="">
			<table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
			
 <tr><td class="BACKGROUND_a" >A01001�Ƿ��ȡ�����ű��棺(Y/N)                               <input type='text' id='A01001' name='A01001' value='y'></td> 
    <td class="BACKGROUND_a" >A01002���ű������Ƿ����������Ϣ��(Y/N)                           <input type='text' id='A01002' name='A01002' value='y'></td>
    <td class="BACKGROUND_a" >A02001�Ƿ��������ÿ��ͻ���(Y/N)                               <input type='text' id='A02001' name='A02001' value='n'></td> 
    <td class="BACKGROUND_a" >A02002���пͻ����ö�ȣ�                                     <input type='text' id='A02002' name='A02002' value='0'></td></tr>  
<tr><td class="BACKGROUND_a" >A04002���ڸ��˽����ʲ���ͻ��ȼ���                           
		<select name="A04002" id="A04002">
          <option value="">��ѡ��</option>
			<option value="00" selected>��ͨ�ͻ�</option>
          <option value="04">������ƿͻ�</option>
          <option value="05">������ƿͻ�</option>
          <option value="06" >�Ƹ�����ͻ�</option>
          <option value="08" >˽�����пͻ�</option>

		  </select>
</td> 
	
    <td class="BACKGROUND_a" >A04003���ڸ��˽����ʲ���ͻ������������վ��ʲ���         <input type='text' id='A04003' name='A04003' value='0'></td> 
    <td class="BACKGROUND_a" >A05001���ϱ��ս�α���                                       <input type='text' id='A05001' name='A05001' value='0'></td> 
    <td class="BACKGROUND_a" >A05002���ϱ��ս�α�����                                     <input type='text' id='A05002' name='A05002' value='20140608'></td></tr> 
<tr><td class="BACKGROUND_a" >A05003���ϱ��ս��ۼƽɷ�����                                 <input type='text' id='A05003' name='A05003' value='8'></td> 
    <td class="BACKGROUND_a" >A05004���ϱ��ս�μӹ����·�                                 <input type='text' id='A05004' name='A05004' value='20130602'></td> 
    <td class="BACKGROUND_a" >A05005���ϱ��ս�ɷ�״̬                                     <input type='text' id='A05005' name='A05005' value='1'></td> 
    <td class="BACKGROUND_a" >A05006���ϱ��ս���˽ɷѻ���                                 <input type='text' id='A05006' name='A05006' value='1200'></td></tr> 
<tr><td class="BACKGROUND_a" >A05007���ϱ��ս��½ɷѽ��                                 <input type='text' id='A05007' name='A05007' value='800'></td> 
    <td class="BACKGROUND_a" >A05008���ϱ��ս���Ϣ��������                                 <input type='text' id='A05008' name='A05008' value='20140203'></td> 
    <td class="BACKGROUND_a" >A05009���ϱ��ս�ɷѵ�λ                                     <input type='text' id='A05009' name='A05009' value='aaa'></td> 
    <td class="BACKGROUND_a" >A05010���ϱ��ս��жϻ���ֹ�ɷ�ԭ��                           <input type='text' id='A05010' name='A05010' value='aaa'></td></tr> 
<tr><td class="BACKGROUND_a" >A06001ס��������νɵأ�                                     <input type='text' id='A06001' name='A06001' value='����'></td>      
    <td class="BACKGROUND_a" >A06002ס������������·ݣ�                                   <input type='text' id='A06002' name='A06002' value='06'></td>      
    <td class="BACKGROUND_a" >A06003ס������������·ݣ�                                   <input type='text' id='A06003' name='A06003' value='201601'></td>      
    <td class="BACKGROUND_a" >A06004ס��������ɷ�״̬��                                   <input type='text' id='A06004' name='A06004' value=1'></td></tr> 
<tr><td class="BACKGROUND_a" >A06005ס���������½ɴ�                                   <input type='text' id='A06005' name='A06005' value='800'></td>      
    <td class="BACKGROUND_a" >A06006ס����������˽ɴ������                               <input type='text' id='A06006' name='A06006' value='0.2'></td>      
    <td class="BACKGROUND_a" >A06007ס��������λ�ɴ������                               <input type='text' id='A06007' name='A06007' value='0.8'></td>      
    <td class="BACKGROUND_a" >A06008ס��������ɷѵ�λ                                     <input type='text' id='A06008' name='A06008' value='�����׺�'></td></tr> 
<tr><td class="BACKGROUND_a" >A06009ס����������Ϣ��������                                 <input type='text' id='A06009' name='A06009' value='20141011'></td>      
    <td class="BACKGROUND_a" >A07001��3����ͬʱ�������ÿ��ʹ������ڵĴ�����                <input type='text' id='A07001' name='A07001' value='0' ></td>      
    <td class="BACKGROUND_a" >A07002��6����ͬʱ�������ÿ��ʹ������ڵĴ�����                <input type='text' id='A07002' name='A07002' value='0' ></td>      
    <td class="BACKGROUND_a" >A07003��12����ͬʱ�������ÿ��ʹ������ڵĴ�����               <input type='text' id='A07003' name='A07003' value='0' ></td></tr> 
<tr><td class="BACKGROUND_a" >A07004��24����ͬʱ�������ÿ��ʹ������ڵĴ�����               <input type='text' id='A07004' name='A07004' value='0' ></td>      
    <td class="BACKGROUND_a" >A08001���ǿ�������������                                     <input type='text' id='A08001' name='A08001' value='0'></td>      
    <td class="BACKGROUND_a" >A08002���ǿ��˻�����                                         <input type='text' id='A08002' name='A08002' value='0'></td>      
    <td class="BACKGROUND_a" >A08003���ǿ��������˻�����                                   <input type='text' id='A08003' name='A08003' value='0'></td></tr> 
<tr><td class="BACKGROUND_a" >A08004���ǿ����翪�����ڣ�                                   <input type='text' id='A08004' name='A08004' value='0'></td>      
    <td class="BACKGROUND_a" >A08005���ǿ������ܶ                                       <input type='text' id='A08005' name='A08005' value='0'></td>      
    <td class="BACKGROUND_a" >A08006���ǿ������ö�ȣ�                                     <input type='text' id='A08006' name='A08006' value='0'></td>      
    <td class="BACKGROUND_a" >A08007���ǿ����6����ƽ��ʹ�ö�ȣ�                          <input type='text' id='A08007' name='A08007' value='0'></td></tr> 
<tr><td class="BACKGROUND_a" >A08008���ǿ���������߶��(�����)��                         <input type='text' id='A08008' name='A08008' value='0'></td>      
    <td class="BACKGROUND_a" >A08009���ǿ�������������Ŷ�(�����)��                       <input type='text' id='A08009' name='A08009' value='0'></td>      
    <td class="BACKGROUND_a" >A08010���ǿ�����6����������߶��(�����)��                  <input type='text' id='A08010' name='A08010' value='0'></td>      
    <td class="BACKGROUND_a" >A08011���ǿ�������߶��(�����)��                           <input type='text' id='A08011' name='A08011' value='0'></td></tr> 
<tr><td class="BACKGROUND_a" >A08012���ǿ�����10�����µ�һ�߶��(�����)��               <input type='text' id='A08012' name='A08012' value='0' ></td>      
    <td class="BACKGROUND_a" >A08013���ǿ�����10�����µڶ��߶��(�����)��               <input type='text' id='A08013' name='A08013' value='0' ></td>      
    <td class="BACKGROUND_a" >A08014���ǿ���ǰ�����ܶ                                   <input type='text' id='A08014' name='A08014' value='0'></td>      
    </tr> 
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��3����M1</td>
    	 <td class="BACKGROUND_a" >A09001���ǿ���3����M1�Ĵ�����                                <input type='text' id='A09001' name='A09001' value='0'></td>
    	 <td class="BACKGROUND_a">A11001׼���ǿ���3����M1�Ĵ�����                              <input type='text' id='A11001' name='A11001' value='0'></td>
    	 <td class="BACKGROUND_a">A13001�����3����M1�Ĵ�����                                  <input type='text' id='A13001' name='A13001' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��3����M2</td>
    	<td class="BACKGROUND_a" >A09002���ǿ���3����M2�Ĵ�����                                <input type='text' id='A09002' name='A09002' value='0'></td>
    	<td class="BACKGROUND_a">A11002׼���ǿ���3����M2�Ĵ�����                              <input type='text' id='A11002' name='A11002' value='0'></td>
    	<td class="BACKGROUND_a">A13002�����3����M2�Ĵ�����                                  <input type='text' id='A13002' name='A13002' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��3����M3</td>
    	<td class="BACKGROUND_a" >A09003���ǿ���3����M3�Ĵ�����                                <input type='text' id='A09003' name='A09003' value='0'></td>
    	<td class="BACKGROUND_a">A11003׼���ǿ���3����M3�Ĵ�����                              <input type='text' id='A11003' name='A11003' value='0'></td>
    	<td class="BACKGROUND_a">A13003�����3����M3�Ĵ�����                                  <input type='text' id='A13003' name='A13003' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��3����M4</td>
    	<td class="BACKGROUND_a" >A09004���ǿ���3����M4�Ĵ�����                                <input type='text' id='A09004' name='A09004' value='0'></td>
    	<td class="BACKGROUND_a">A11004׼���ǿ���3����M4�Ĵ�����                              <input type='text' id='A11004' name='A11004' value='0'></td>
    	<td class="BACKGROUND_a">A13004�����3����M4�Ĵ�����                                  <input type='text' id='A13004' name='A13004' value='0'></td> 
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��3����M5</td>
    	 <td class="BACKGROUND_a" >A09005���ǿ���3����M5�Ĵ�����                                <input type='text' id='A09005' name='A09005' value='0'></td>
    	<td class="BACKGROUND_a">A11005׼���ǿ���3����M5�Ĵ�����                              <input type='text' id='A11005' name='A11005' value='0'></td>
    	<td class="BACKGROUND_a">A13005�����3����M5�Ĵ�����                                  <input type='text' id='A13005' name='A13005' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��3����M6</td>
    	 <td class="BACKGROUND_a" >A09006���ǿ���3����M6�Ĵ�����                                <input type='text' id='A09006' name='A09006' value='0'></td>
    	 <td class="BACKGROUND_a">A11006׼���ǿ���3����M6�Ĵ�����                              <input type='text' id='A11006' name='A11006' value='0'></td>
    	 <td class="BACKGROUND_a">A13006�����3����M6�Ĵ�����                                  <input type='text' id='A13006' name='A13006' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��3����M7</td>
    	<td class="BACKGROUND_a" >A09007���ǿ���3����M7�Ĵ�����                                <input type='text' id='A09007' name='A09007' value='0'></td> 
    	<td class="BACKGROUND_a">A11007׼���ǿ���3����M7�Ĵ�����                              <input type='text' id='A11007' name='A11007' value='0'></td>   
    	<td class="BACKGROUND_a">A13007�����3����M7�Ĵ�����                                  <input type='text' id='A13007' name='A13007' value='0'></td>   
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��6����M1</td>
    	<td class="BACKGROUND_a">A09008���ǿ���6����M1�Ĵ�����                                <input type='text' id='A09008' name='A09008' value='0'></td>
    	<td class="BACKGROUND_a">A11008׼���ǿ���6����M1�Ĵ�����                              <input type='text' id='A11008' name='A11008' value='0'></td>
    	<td class="BACKGROUND_a">A13008�����6����M1�Ĵ�����                                  <input type='text' id='A13008' name='A13008' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��6����M2</td>
    	<td class="BACKGROUND_a" >A09009���ǿ���6����M2�Ĵ�����                                <input type='text' id='A09009' name='A09009' value='0'></td>
    	<td class="BACKGROUND_a">A11009׼���ǿ���6����M2�Ĵ�����                              <input type='text' id='A11009' name='A11009' value='0'></td>
    	<td class="BACKGROUND_a">A13009�����6����M2�Ĵ�����                                  <input type='text' id='A13009' name='A13009' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��6����M3</td>
    	<td class="BACKGROUND_a">A09010���ǿ���6����M3�Ĵ�����                                <input type='text' id='A09010' name='A09010' value='0'></td>
    	<td class="BACKGROUND_a">A11010׼���ǿ���6����M3�Ĵ�����                              <input type='text' id='A11010' name='A11010' value='0'></td>
    	<td class="BACKGROUND_a">A13010�����6����M3�Ĵ�����                                  <input type='text' id='A13010' name='A13010' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��6����M4</td>
    	<td class="BACKGROUND_a">A09011���ǿ���6����M4�Ĵ�����                                <input type='text' id='A09011' name='A09011' value='0'></td>
    	<td class="BACKGROUND_a">A11011׼���ǿ���6����M4�Ĵ�����                              <input type='text' id='A11011' name='A11011' value='0'></td>
    	<td class="BACKGROUND_a">A13011�����6����M4�Ĵ�����                                  <input type='text' id='A13011' name='A13011' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��6����M5</td>
    	<td class="BACKGROUND_a">A09012���ǿ���6����M5�Ĵ�����                                <input type='text' id='A09012' name='A09012' value='0'></td> 
    	<td class="BACKGROUND_a">A11012׼���ǿ���6����M5�Ĵ�����                              <input type='text' id='A11012' name='A11012' value='0'></td>
    	<td class="BACKGROUND_a">A13012�����6����M5�Ĵ�����                                  <input type='text' id='A13012' name='A13012' value='0'></td>
    </tr>
     <tr>
    	<td class="BACKGROUND_a" style="color: red">��6����M6</td>
    	<td class="BACKGROUND_a">A09013���ǿ���6����M6�Ĵ�����                                <input type='text' id='A09013' name='A09013' value='0'></td>
    	<td class="BACKGROUND_a">A11013׼���ǿ���6����M6�Ĵ�����                              <input type='text' id='A11013' name='A11013' value='0'></td>
    	<td class="BACKGROUND_a">A13013�����6����M6�Ĵ�����                                  <input type='text' id='A13013' name='A13013' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��6����M7</td>
    	<td class="BACKGROUND_a">A09014���ǿ���6����M7�Ĵ�����                                <input type='text' id='A09014' name='A09014' value='0'></td>
    	<td class="BACKGROUND_a">A11014׼���ǿ���6����M7�Ĵ�����                              <input type='text' id='A11014' name='A11014' value='0'></td>
    	<td class="BACKGROUND_a">A13014�����6����M7�Ĵ�����                                  <input type='text' id='A13014' name='A13014' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��12����M1</td>
    	 <td class="BACKGROUND_a">A09015���ǿ���12����M1�Ĵ�����                               <input type='text' id='A09015' name='A09015' value='0'></td>
    	 <td class="BACKGROUND_a">A11015׼���ǿ���12����M1�Ĵ�����                             <input type='text' id='A11015' name='A11015' value='0'></td>
   		 <td class="BACKGROUND_a">A13015�����12����M1�Ĵ�����                                 <input type='text' id='A13015' name='A13015' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��12����M2</td>
    	<td class="BACKGROUND_a">A09016���ǿ���12����M2�Ĵ�����                               <input type='text' id='A09016' name='A09016' value='0'></td>     
   		 <td class="BACKGROUND_a">A11016׼���ǿ���12����M2�Ĵ�����                             <input type='text' id='A11016' name='A11016' value='0'></td>
   		 <td class="BACKGROUND_a">A13016�����12����M2�Ĵ�����                                 <input type='text' id='A13016' name='A13016' value='0'></td>
    </tr>
 	<tr>
    	<td class="BACKGROUND_a" style="color: red">��12����M3</td>
    	<td class="BACKGROUND_a">A09017���ǿ���12����M3�Ĵ�����                               <input type='text' id='A09017' name='A09017' value='0'></td>     
    	<td class="BACKGROUND_a">A11017׼���ǿ���12����M3�Ĵ�����                             <input type='text' id='A11017' name='A11017' value='0'></td>       
   		<td class="BACKGROUND_a">A13017�����12����M3�Ĵ�����                                 <input type='text' id='A13017' name='A13017' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��12����M4</td>
    	<td class="BACKGROUND_a">A09018���ǿ���12����M4�Ĵ�����                               <input type='text' id='A09018' name='A09018' value='0'></td>
		<td class="BACKGROUND_a">A11018׼���ǿ���12����M4�Ĵ�����                             <input type='text' id='A11018' name='A11018' value='0'></td>
		<td class="BACKGROUND_a">A13018�����12����M4�Ĵ�����                                 <input type='text' id='A13018' name='A13018' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��12����M5</td>
    	<td class="BACKGROUND_a">A09019���ǿ���12����M5�Ĵ�����                               <input type='text' id='A09019' name='A09019' value='0'></td>      
   		<td class="BACKGROUND_a">A11019׼���ǿ���12����M5�Ĵ�����                             <input type='text' id='A11019' name='A11019' value='0'></td>       
   	    <td class="BACKGROUND_a">A13019�����12����M5�Ĵ�����                                 <input type='text' id='A13019' name='A13019' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��12����M6</td>
    	<td class="BACKGROUND_a">A09020���ǿ���12����M6�Ĵ�����                               <input type='text' id='A09020' name='A09020' value='0'></td>      
   		<td class="BACKGROUND_a">A11020׼���ǿ���12����M6�Ĵ�����                             <input type='text' id='A11020' name='A11020' value='0'></td>       
   		<td class="BACKGROUND_a">A13020�����12����M6�Ĵ�����                                 <input type='text' id='A13020' name='A13020' value='0'></td> 
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��12����M7</td>
    	<td class="BACKGROUND_a">A09021���ǿ���12����M7�Ĵ�����                               <input type='text' id='A09021' name='A09021' value='0'></td>      
  		<td class="BACKGROUND_a">A11021׼���ǿ���12����M7�Ĵ�����                             <input type='text' id='A11021' name='A11021' value='0'></td>      
   	   <td class="BACKGROUND_a">A13021�����12����M7�Ĵ�����                                 <input type='text' id='A13021' name='A13021' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��24����M1</td>
    	<td class="BACKGROUND_a">A09022���ǿ���24����M1�Ĵ�����                               <input type='text' id='A09022' name='A09022' value='0'></td>
		<td class="BACKGROUND_a">A11022׼���ǿ���24����M1�Ĵ�����                             <input type='text' id='A11022' name='A11022' value='0'></td> 
		<td class="BACKGROUND_a">A13022�����24����M1�Ĵ�����                                 <input type='text' id='A13022' name='A13022' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��24����M2</td>
    	<td class="BACKGROUND_a">A09023���ǿ���24����M2�Ĵ�����                               <input type='text' id='A09023' name='A09023' value='0'></td>     
   		<td class="BACKGROUND_a">A11023׼���ǿ���24����M2�Ĵ�����                             <input type='text' id='A11023' name='A11023' value='0'></td>       
   		<td class="BACKGROUND_a">A13023�����24����M2�Ĵ�����                                 <input type='text' id='A13023' name='A13023' value='0'></td>
    </tr>
     <tr>
    	<td class="BACKGROUND_a" style="color: red">��24����M3</td>
    	<td class="BACKGROUND_a">A09024���ǿ���24����M3�Ĵ�����                               <input type='text' id='A09024' name='A09024' value='0'></td>      
    	<td class="BACKGROUND_a">A11024׼���ǿ���24����M3�Ĵ�����                             <input type='text' id='A11024' name='A11024' value='0'></td>       
 	   <td class="BACKGROUND_a">A13024�����24����M3�Ĵ�����                                 <input type='text' id='A13024' name='A13024' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��24����M4</td>
    	<td class="BACKGROUND_a">A09025���ǿ���24����M4�Ĵ�����                               <input type='text' id='A09025' name='A09025' value='0'></td>      
   	    <td class="BACKGROUND_a">A11025׼���ǿ���24����M4�Ĵ�����                             <input type='text' id='A11025' name='A11025' value='0'></td>       
    	<td class="BACKGROUND_a">A13025�����24����M4�Ĵ�����                                 <input type='text' id='A13025' name='A13025' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��24����M5</td>
    	<td class="BACKGROUND_a">A09026���ǿ���24����M5�Ĵ�����                               <input type='text' id='A09026' name='A09026' value='0'></td>
		<td class="BACKGROUND_a">A11026׼���ǿ���24����M5�Ĵ�����                             <input type='text' id='A11026' name='A11026' value='0'></td>
		<td class="BACKGROUND_a">A13026�����24����M5�Ĵ�����                                 <input type='text' id='A13026' name='A13026' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��24����M6</td>
    	<td class="BACKGROUND_a">A09027���ǿ���24����M6�Ĵ�����                               <input type='text' id='A09027' name='A09027' value='0'></td>    
   		 <td class="BACKGROUND_a">A11027׼���ǿ���24����M6�Ĵ�����                             <input type='text' id='A11027' name='A11027' value='0'></td>    
   		 <td class="BACKGROUND_a">A13027�����24����M6�Ĵ�����                                 <input type='text' id='A13027' name='A13027' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��24����M7</td>
    	 <td class="BACKGROUND_a">A09028���ǿ���24����M7�Ĵ�����                               <input type='text' id='A09028' name='A09028' value='0'></td> 
    	 <td class="BACKGROUND_a">A11028׼���ǿ���24����M7�Ĵ�����                             <input type='text' id='A11028' name='A11028' value='0'></td>
    	  <td class="BACKGROUND_a">A13028�����24����M7�Ĵ�����                                 <input type='text' id='A13028' name='A13028' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">��5��ǰ36����������߳�������</td>
    	<td class="BACKGROUND_a">A09029���ǿ���5��ǰ36����������߳���������                  <input type='text' id='A09029' name='A09029' value='0'></td>      
   		<td class="BACKGROUND_a">A11029׼���ǿ���5��ǰ36����������߳���������                <input type='text' id='A11029' name='A11029' value='0'></td>      
  		<td class="BACKGROUND_a">A13029�����5��ǰ36����������߳���������                    <input type='text' id='A13029' name='A13029' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">����������ڼ���</td>
    	<td class="BACKGROUND_a">A09030���ǿ�����������ڼ���                               <input type='text' id='A09030' name='A09030' value='0'></td>
		<td class="BACKGROUND_a">A11030׼���ǿ�����������ڼ���                             <input type='text' id='A11030' name='A11030' value='0'></td>
		<td class="BACKGROUND_a">A13030�����������ڼ���                                 <input type='text' id='A13030' name='A13030' value='0'></td>
    </tr>
<tr>      
    <td class="BACKGROUND_a">A10001׼���ǿ�������������                                   <input type='text' id='A10001' name='A10001' value='0'></td>      
    <td class="BACKGROUND_a">A10002׼���ǿ��˻�����                                       <input type='text' id='A10002' name='A10002' value='0'></td>      
    <td class="BACKGROUND_a">A10003׼���ǿ��������˻�����                                 <input type='text' id='A10003' name='A10003' value='0'></td>
    <td class="BACKGROUND_a">�����˻���<input type='text' id='A15033' name='A15033' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A10004׼���ǿ����翪�����ڣ�                                 <input type='text' id='A10004' name='A10004' value='20050305'></td>      
    <td class="BACKGROUND_a">A10005׼���ǿ������ܶ                                     <input type='text' id='A10005' name='A10005' value='0'></td>      
    <td class="BACKGROUND_a">A10006׼���ǿ���͸֧��                                   <input type='text' id='A10006' name='A10006' value='0'></td>      
    <td class="BACKGROUND_a">A10007׼���ǿ����6����ƽ��͸֧��                        <input type='text' id='A10007' name='A10007' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A10008׼���ǿ���������߶��(�����)��                       <input type='text' id='A10008' name='A10008' value='0'></td>      
    <td class="BACKGROUND_a">A10009׼���ǿ�������������Ŷ�(�����)��                     <input type='text' id='A10009' name='A10009' value='0'></td>      
    <td class="BACKGROUND_a">A10010׼���ǿ�����6����������߶��(�����)��                <input type='text' id='A10010' name='A10010' value='0'></td>      
    <td class="BACKGROUND_a">A10011���ǿ�������߶��(�����)��                           <input type='text' id='A10011' name='A10011' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A10012���ǿ�����10�����µ�һ�߶��(�����)��               <input type='text' id='A10012' name='A10012' value='0'></td>      
    <td class="BACKGROUND_a">A10013���ǿ�����10�����µڶ��߶��(�����)��               <input type='text' id='A10013' name='A10013' value='0'></td>      
    <td class="BACKGROUND_a">A10014׼���ǿ���ǰ�����ܶ                                 <input type='text' id='A10014' name='A10014' value='0'></td>    
   </tr> 
<tr> 
    <td class="BACKGROUND_a">A08017:���ǿ�����10�����µ����߶��(�����)��<input type='text' id='A08017' name='A08017' value='0'></td>       
    <td class="BACKGROUND_a">A08018:���ǿ�����10������ƽ�����(�����) <input type='text' id='A08018' name='A08018' value='0'></td>
    <td class="BACKGROUND_a">A10017:׼���ǿ�����10�����µ����߶��(�����)�� <input type='text' id='A10017' name='A10017' value='0'></td> 
    <td class="BACKGROUND_a">A10018:׼���ǿ�����10������ƽ�����(�����)��<input type='text' id='A10018' name='A10018' value='0'></td>       
</tr> 
<tr>      
    <td class="BACKGROUND_a">A12001�����������                                           <input type='text' id='A12001' name='A12001' value='0'></td>      
    <td class="BACKGROUND_a">A12002�����ܱ�����                                           <input type='text' id='A12002' name='A12002' value='0'></td>      
    <td class="BACKGROUND_a">A12003����������˻�����                                     <input type='text' id='A12003' name='A12003' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A12004�����ͬ�ܶ                                         <input type='text' id='A12004' name='A12004' value='0'></td>      
    <td class="BACKGROUND_a">A12005��������                                           <input type='text' id='A12005' name='A12005' value='0'></td>      
    <td class="BACKGROUND_a">A12006�������6����ƽ��Ӧ���                              <input type='text' id='A12006' name='A12006' value='0'></td>      
    <td class="BACKGROUND_a">A12007�����Ӧ�����ܶ                                   <input type='text' id='A12007' name='A12007' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A12008�����������������������>=3�ı���Ӧ�����ܶ          <input type='text' id='A12008' name='A12008' value='0'></td>      
    <td class="BACKGROUND_a">A12009���ǰ�����ܶ�                                       <input type='text' id='A12009' name='A12009' value='0'></td>      
    <td class="BACKGROUND_a">A12010���31-������ѧ����ı�����                        <input type='text' id='A12010' name='A12010' value='0'></td> 
    <td class="BACKGROUND_a">A15002���1�����ڵĲ�ѯ������-���ÿ�������                   <input type='text' id='A15002' name='A15002' value='0'></td>     
    </tr> 
<tr>       
    <td class="BACKGROUND_a">A14001���������弶����Ϊ��������������                       <input type='text' id='A14001' name='A14001' value='0'></td>       
    <td class="BACKGROUND_a">A14002���������弶����Ϊ���������ۼƱ�����               <input type='text' id='A14002' name='A14002' value='0'></td>       
    <td class="BACKGROUND_a">A15001���1�����ڵĲ�ѯ������-����������                     <input type='text' id='A15001' name='A15001' value='0'></td>
    <td class="BACKGROUND_a">A15003���1�����ڵĲ�ѯ����-����������                       <input type='text' id='A15003' name='A15003' value='0'></td></tr>  
<tr>       
    <td class="BACKGROUND_a">A15004���1�����ڵĲ�ѯ����-���ÿ�������                     <input type='text' id='A15004' name='A15004' value='0'></td>       
    <td class="BACKGROUND_a">A15005���2���ڵĲ�ѯ����-�������                         <input type='text' id='A15005' name='A15005' value='0'></td>
    <td class="BACKGROUND_a">A15013�˵�������                                             <input type='text' id='A15013' name='A15013' value='0'></td>        
    <td class="BACKGROUND_a">AT4310�Ƿ�Ϊ��������4����Ա(Y:BL01 ���ӡ�BL02��ʷ���ӡ�BL11��BL12)<input type='text' id='AT4310' name='AT4310' value=''></td>
    </tr>  
<tr><td class="BACKGROUND_a">A15006 ���2���ڵĲ�ѯ����-�����ʸ���飺                     <input type='text' id='A15006' name='A15006' value='0'></td>       
    <td class="BACKGROUND_a">A15007 ���2���ڵĲ�ѯ����-��Լ�̻�ʵ����飺                 <input type='text' id='A15007' name='A15007' value='0'></td> 
    <td class="BACKGROUND_a">AT4330 Ҫ�ͷ���
	<select name="AT4330" id="AT4330">
          <option value="" selected>δ֪</option>
			<option value="A" >A:һ������Ҫ��</option>
          <option value="B">B:��������Ҫ��</option>
          <option value="C">C:��������Ҫ��</option>
          <option value="D">D:�����쵼Ҫ�ͣ�����ר�ã�</option>
		  </select>
	</td>      
    </tr> 
<!-- 
A08017:���ǿ�����10�����µ����߶��(�����)��
A08018:���ǿ�����10������ƽ�����(�����)��
A10017:׼���ǿ�����10�����µ����߶��(�����)��
A10018:׼���ǿ�����10������ƽ�����(�����)��
A12013:����(�ѽ���)��Ӧ�����ܶԭ
A12014:����(δ����)�����ͬ���
A12015:����(�ѽ���)�����ͬ���
A16001:�������ַ���
A16002:�����������λ��
A16003:������������

 -->
 <tr><td class="BACKGROUND_a" style="color:red">A03001�Ƿ��������ÿ��ͻ���(Y/N)                                   <input type='text' id='A03001' name='A03001' value='n'></td> 
    <td class="BACKGROUND_a" >A03002�������ÿ�������߶��(�����)��                       <input type='text' id='A03002' name='A03002' value='0'></td> 
    <td class="BACKGROUND_a" >A03003�������ÿ�����6�������ϵĵ�����߶��(�����)��        <input type='text' id='A03003' name='A03003' value='0'></td> 
    <td class="BACKGROUND_a" >A03004:�ͻ������ <input type='text' id='A03004' name='A03004' value='7'></td> 
</tr> 
<tr>
    <td class="BACKGROUND_a" >A03005:�ͻ����½�6����ƽ�����ʹ�����쳣��Ƭ���� <input type='text' id='A03005' name='A03005' value='0'></td> 
    <td class="BACKGROUND_a" >A03006:�ͻ����ǿ���С���Ƭ����<input type='text' id='A03006' name='A03006' value='0'></td> 
    <td class="BACKGROUND_a" >A03007:�ͻ������¼С��6���£����������Ѵ�������<input type='text' id='A03007' name='A03007' value='0'></td>
    <td class="BACKGROUND_a" >A03008:�ͻ����ײ���Ծ���������� <input type='text' id='A03008' name='A03008' value='0'></td>
</tr> 
<!-- 
A03008:�ͻ����ײ���Ծ����������
A03009:�ͻ����п�10�����µ�һ�߶��(�����)
A03010:�ͻ����п�10�����µڶ��߶��(�����)
A03011:�ͻ����п�10�����µ����߶��(�����)
A03012:�ͻ����п�10������ƽ�����(�����)
 -->
<tr> 
    <td class="BACKGROUND_a" >A03009:�ͻ����п�10�����µ�һ�߶��(�����) <input type='text' id='A03009' name='A03009' value='30000'></td> 
    <td class="BACKGROUND_a" >A03010:�ͻ����п�10�����µڶ��߶��(�����)<input type='text' id='A03010' name='A03010' value='20000'></td> 
    <td class="BACKGROUND_a" >A03011:�ͻ����п�10�����µ����߶��(�����)<input type='text' id='A03011' name='A03011' value='9000'></td>
    <td class="BACKGROUND_a">A03012:�ͻ����п�10������ƽ�����(�����)<input type='text' id='A03012' name='A03012' value='10000'></td> 
</tr> 
<tr>  
    <td class="BACKGROUND_a">A12011:������ֵ<input type='text' id='A12011' name='A12011' value='0'></td>
    <td class="BACKGROUND_a">A12013:����(�ѽ���)��Ӧ�����ܶԭ<input type='text' id='A12013' name='A12013' value='0'></td>       
    <td class="BACKGROUND_a">A12014:����(δ����)�����ͬ���<input type='text' id='A12014' name='A12014' value='0'></td>
    <td class="BACKGROUND_a">A12015:����(�ѽ���)�����ͬ��� <input type='text' id='A12015' name='A12015' value='0'></td>  
</tr>  
<tr>  
    <td class="BACKGROUND_a">A16001:�������ַ���<input type='text' id='A16001' name='A16001' value='0'></td>
    <td class="BACKGROUND_a">A16002:�����������λ��<input type='text' id='A16002' name='A16002' value='0'></td>       
    <td class="BACKGROUND_a">A16003:������������<input type='text' id='A16003' name='A16003' value='0'></td>
    <td class="BACKGROUND_a" style="color:red">A04001�Ƿ����ڸ��˽����ʲ���ͻ���  (Y/N)<input type='text' id='A04001' name='A04001' value='n'></td>
</tr>  
	</table>
	</div>
	<table  width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
</table>
<br>
<b><span>����������</span></b>
<table  width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
<tr>
<td class="BACKGROUND_a" align="center" colspan="4">��Ʒ��</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5620��Ʒ����</td><td>
<select name="AT5620" id="AT5620">
<option value="">δ֪</option>
<option value="1"selected>���˿�</option>
<option value="2">�߶˿�</option>
<option value="3">����</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4721ȫ����Ʒ���˻��˻�״̬</td><td>
<input type="text" name="AT4721" id="AT4721" value="1"/>
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4410������Ʒ�Ƿ�ר�ÿ�:</td>
<td>
<select name="AT4410" id="AT4410">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select></td>

<td class="BACKGROUND_a" align="left">
AT4420�峥��ʽ:</td><td>
<select name="AT4420" id="AT4420">
<option value="">δ֪</option>
<option value="1" selected>��˾</option>
<option value="2">����</option>
</select>
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">
AT4421��˾��֯����������Ƿ������֧��������˾������:</td><td>
<select name="AT4421" id="AT4421">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">
AT4422��˾��֯����������Ƿ������֧�ֳ�����˾�����У�</td><td>
<select name="AT4422" id="AT4422">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4430�Ƿ�Ϊ˯���ʻ�</td><td>
<select name="AT4430" id="AT4430">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>


</tr>
<tr>
	<td class="BACKGROUND_a" align="center" colspan="4">�ͻ���Ϣ</td><td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4450�ͻ�֤������: </td><td>
<select name="AT4450" id="AT4450">
<option value="">δ֪</option>
<option value="1" selected>���֤</option>
<option value="2">����</option>
<option value="3">�������֤</option>
<option value="4">��۾��������ڵ�ͨ��֤</option>
<option value="5">̨�����������½ͨ��֤</option>
<option value="I">��װ�������֤</option>
<option value="J">���ž��������ڵ�ͨ��֤</option>
<option value="8">����</option>
</select>

</td>										
 <td class="BACKGROUND_a" align="left">AT4451�ͻ����֤����</td><td> 
<input type="text" name="AT4451" id="AT4451" value="220402199306063361"/>
</td>
</tr>
<tr>									
<td class="BACKGROUND_a" align="left">AT4460�ͻ��������� </td><td>
<input type="text" name="AT4460" id="AT4460" value="19910313"/>
</td>                              
<td class="BACKGROUND_a" align="left">AT4730���ֹ��򴥷����</td><td>
<input type="text" name="AT4730" id="AT4730" value=""/>
<!-- <select name="AT4730" id="AT4730">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select> -->
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4490ȫ����Ʒ���˻���������</td><td>
<input type="text" name="AT4490" id="AT4490" value="20140505"/>             
</td> 
<td class="BACKGROUND_a" align="left">AT4550ȫ����Ʒ���˻����齻�׽��</td><td>
<input type="text" name="AT4550" id="AT4550" value="0"/> 
</td>
</tr> 
<tr>                                     
<td class="BACKGROUND_a" align="left">AT4600�ͻ��Ƿ�����ڷ��б������������</td><td>
<select name="AT4600" id="AT4600">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4610�ͻ��Ƿ�����ڷ��б������������</td><td>
<select name="AT4610" id="AT4610">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>
</tr> 
<tr>             
<td class="BACKGROUND_a" align="left">AT4530�������ڿͻ�������ʱ�����������</td><td>
<input type="text" name="AT4530" id="AT4530" value="0" />  
</td>
<td class="BACKGROUND_a" align="left">AT4470�������ڿͻ��������ö����������</td><td>   
<input type="text" name="AT4470" id="AT4470" value="0" />
</td>  
</tr>
<tr>
	<td class="BACKGROUND_a" align="center" colspan="4">������ʷ</td>
</tr>

<tr>			

</tr>
<tr>		
<td class="BACKGROUND_a" align="left">AT4630��6�����ڣ�����δȫ������</td><td>
<input type="text" name="AT4630" id="AT4630" value="0"/> 
</td>
<td class="BACKGROUND_a" align="left">AT4640��6�����ڣ��ۼ�δȫ������</td><td>
<input type="text" name="AT4640" id="AT4640" value="0"/> 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4650��6�����ڣ����һ���˵��Ƿ�ȫ���</td><td>
<select name="AT4650" id="AT4650">
<option value="">δ֪</option>
<option value="1" selected>��</option>
<option value="2">��</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4660��6�����ڣ�M1����</td><td>	
<input type="text" name="AT4660" id="AT4660" value="0"/> 	</td>
</tr>
<tr>									
<td class="BACKGROUND_a" align="left">AT4670����</td><td>
<input type="text" name="AT4670" id="AT4670" value="5"/> 
</td>
<td class="BACKGROUND_a" align="left">AT4680��12�����ڣ�����δȫ������</td><td>
<input type="text" name="AT4680" id="AT4680" value="0" > 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4690��12�����ڣ��ۼ�δȫ������</td><td>
<input type="text" name="AT4690" id="AT4690" value="0" /> 
</td>
<td class="BACKGROUND_a" align="left">AT4700��12�����ڣ�M1����	</td><td>	
<input type="text" name="AT4700" id="AT4700" value="0"/> 
</td>		</tr>
<tr>							
<td class="BACKGROUND_a" align="left">AT4710��12�����ڣ�M2����</td><td>
<input type="text" name="AT4710" id="AT4710" value="0"/> 
</td>
<td class="BACKGROUND_a" align="left">AT4720��24�����ڣ�M3��M3+����</td><td>
<input type="text" name="AT4720" id="AT4720" value="0"/> 
</td>
</tr>
<tr>

<!-- <td class="BACKGROUND_a" align="left">AT4722�����ų�״̬	</td><td>
<select name="AT4722" id="AT4722">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2">��</option>
</select>
	</td>
	</tr>
<tr>-->

	</tr>

<tr>

<td class="BACKGROUND_a" align="left">AT4740ȫ����Ʒ�˻���6����ƽ�����ʹ����</td><td>	
<input type="text" name="AT4740" id="AT4740" value="0"/> 
</td>	
<td class="BACKGROUND_a" align="left">AT4590ȫ����Ʒ���˻���ȥ12����������M1�����ϴ���</td><td>
<input type="text" name="AT4590" id="AT4590" value="0"/> 
</td>	
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4724�Ƿ��������</td><td>
<select name="AT4724" id="AT4724">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4723�ͻ��Ƿ�Ҫ�����</td><td>
<select name="AT4723" id="AT4723">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td> 
</tr>
<tr>
<td class="BACKGROUND_a" align="center" colspan="4">���</td>
</tr>
<tr>					
<td class="BACKGROUND_a" align="left">AT4750���뿨����</td><td>
<select name="AT4750" id="AT4750">
<option value="">δ֪</option>
<option value="156" selected="selected">�����</option>
<option value="840">��Ԫ</option>
<option value="392">��Ԫ</option>
<option value="344">��Ԫ</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4760���뿨����</td><td>
<input type="text" name="AT4760" id="AT4760" value="1"/> 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5600���ֵȼ�</td><td>
<select name="AT5600" id="AT5600">
<option value="">δ֪</option>
<option value="1" selected>1XA</option>
<option value="2">2XB</option>
<option value="3">3ZA/ZB/ZC</option>
<option value="4">4A</option>
<option value="5">5B</option>
<option value="6">6C</option>
<option value="7">7D</option>
<option value="8"> 8E</option>
<option value="9">9XC</option>
<option value="10">10Y</option>
</select>
</td>
<td style="color: red" class="BACKGROUND_a" align="left">AT5601Ԥ����</td><td>
<input type="text" name="AT5601" id="AT5601" value="50000"/> 
</td>	
</tr>
<tr>												
<td class="BACKGROUND_a" align="left">AT5602����ϵͳ��ʶ</td><td>
<select name="AT5602" id="AT5602">
<option value="">δ֪</option>
<option value="01" selected>����NUW</option>
<option value="02">����CSR</option>
<option value="03">����CRM</option>
<option value="04">��������ն�</option>
<option value="05">����</option>
<option value="06">΢�� </option>
<option value="07">�Ƹ�OCRM</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT6040�Ƿ�羳���׿ͻ�</td><td>
<select name="AT6040" id="AT6040">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>
</tr>


<td></td>	
<td></td>
<tr>
<td class="BACKGROUND_a" align="left">AT5605�������ͱ�ʶ </td><td>
<select name="AT5605" id="AT5605">
<option value="">δ֪</option>
<option value="01">��������</option>
<option value="02" selected="selected">����</option>
<option value="03">����</option>
<option value="04">�¼�ʽ����</option>
<option value="05">��������</option>
<option value="06">����Ԥ��</option>
</select>
</td>									
<td class="BACKGROUND_a" align="left">AT5607����������������</td><td>
<input type="text" name="AT5607" id="AT5607" value="50000"/> 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5608�������г�������</td><td>
<input type="text" name="AT5608" id="AT5608" value="50000"/> 
</td>
<td class="BACKGROUND_a" align="left">AT6050Ԥ���ȸ�������</td><td>
<input type="text" name="AT6050" id="AT6050" value="1"/> 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5609��˾��֯���������</td><td>
<input type="text" name="AT5609" id="AT5609" value="0"/> 
</td>
<td class="BACKGROUND_a" align="left">AT5610������������</td><td>
<input type="text" name="AT5610" id="AT5610" value="0"/> 
</td>		
</tr>
<tr>									
<td class="BACKGROUND_a" align="left">AT5611���񿨳������� </td><td>
<input type="text" name="AT5611" id="AT5611" value="0"/> 
</td>
<td class="BACKGROUND_a" align="left">AT5640�Ƿ���ܵ����������</td><td>
<select name="AT5640" id="AT5640">
<option value="">δ֪</option>
<option value="1" selected>��</option>
<option value="2">��</option>
</select>
</td>		
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT5630������ȣ� </td><td>
<input type="text" name="AT5630" id="AT5630" value="60000"/> 
</td>
<td class="BACKGROUND_a" align="left">AT4440������Ʒ�ĵ�ǰ���ö�ȣ���Ʒ�㣩</td><td>
<input name="AT4440" id="AT4440" type="text" value="5000" />
</td>							
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT6020�ͻ�����������Ч����������ö�� </td><td>
 <input type="text" name="AT6020" id="AT6020" value="30000" /> 
</td>
<td class="BACKGROUND_a" align="left">AT6030������Ƭ�Ӽ�CC01��ǰ���ö��</td><td>
<input type="text" name="AT6030" id="AT6030" value="10000"/> 
</td>
</tr>
<tr><td class="BACKGROUND_a" align="left">AT5612�ͻ��������������ʲ����</td>
<td><input type="text" name="AT5612" id="AT5612" value="0"/></td>
</tr>
</table>
<b><span>������������</span></b>
<table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>	
<tr><td class="BACKGROUND_a" align="left">AT20001������ʶ</td><td>
<select name="AT20001" id="AT20001">
<option value="">δ֪ </option>
<option value="0">0 ����¼��</option>
<option value="1" selected="selected">1 ����</option>
<option value="2">2 �ƶ��ն���ҳ��</option>
<option value="3">3 ��̨�Ͽͻ�</option>
<option value="4">4 �ֻ���΢�ţ�</option>
<option value="5">5 ������ư�</option>
<option value="6">6 �ͷ�����</option>
<option value="7">7 ����ƽ̨��OCRM��</option>
<option value="8">8 �ͷ�</option>
<option value="9">9 �����ն�</option>
<option value="A">A �ƶ��ն�(APP��)</option>
<option value="F">F ȫ������������</option>
<option value="N">N ����Ԥ�ƿ����ɣ�</option>
<option value="O">O ��aps����</option>
<option value="P">P ������Ԥ�ƿ�</option>
<option value="Q">Q ����Ԥ�ƿ����£�</option>
<option value="X">-777 ��������</option>
<option value="Y">Y ����˾¼��</option>
<option value="Z">Z �ۺϿ���</option>
<option value="10">10 �����쿨</option>
<option value="error">error</option>
</select>
<!-- <select name="AT20001" id="AT20001">
<option value="">δ֪ </option>
<option value="0100">0100����NUW</option>
<option value="0101">0101����NUW������¼�룩</option>
<option value="0102">0102����NUW������˾¼�룩</option>
<option value="0103">0103����NUW����������¼�룩</option>
<option value="0101">0101����NUW-�Ͽͻ������루����¼�룩</option>
<option value="0102">0102����NUW-�Ͽͻ������루����˾¼�룩</option>
<option value="0103">0103����NUW-�Ͽͻ������루��������¼�룩</option>
<option value="0104">0104����Ԥ�ƿ����ɣ�</option>
<option value="0105">0105����Ԥ�ƿ����£�</option>
<option value="0106">0106������Ԥ�ƿ�</option>
<option value="0107">0107BANCS(�ۺϿ���)</option>
<option value="0108">0108������ϵͳ��APS��</option>
<option value="0200">0200����CSR��ԭ���ͷ�</option>
<option value="0300">0300����CRM</option>
<option value="0400">0400��������ն�</option>
<option value="0500">0500����</option>
<option value="0600" selected="selected">0600��վ</option>
<option value="0700">0700�Ƹ�OCRM��ԭ������ƽ̨��OCRM��</option>
<option value="0800">0800΢�ţ�ԭ���ֻ�</option>
<option value="0900">0900�ƶ��ն�</option>
<option value="1000">1000�ͷ�����</option>
</select> -->
</td>
<td class="BACKGROUND_a" align="left">AT20004�����빤�������Ƿ�һ��</td><td>
<select name="AT20004" id="AT20004">
<option value="">δ֪</option>
<option value="1">��</option>
<option value="2" selected>��</option>
</select>
</td>
</tr>
<tr>
    <td class="BACKGROUND_a" align="left">AT20002 ѧ��</td><td>
	<select name="AT20002" id="AT20002">
						<option value="">δ֪</option>
						<option value="-999">-999</option>
						<option value="-888">-888</option>
						<option value="ר��">1ר��</option>
						<option value="ר��(��ְ)">2ר��(��ְ)</option>
						<option value="ר����">3ר����</option>
						<option value="����" selected>4����</option>
						<option value="�ڶ�ѧʿѧλ">5�ڶ�ѧʿѧλ</option>
						<option value="˶ʿ�о���">6˶ʿ�о���</option>
						<option value="��ʿ�о���">7��ʿ�о���</option>
						<option value="�ڶ�����">8�ڶ�����</option>
						<option value="�ڶ�ר��">9�ڶ�ר��</option>
						<option value="�о�����">10�о�����</option>
						<option value="ҹ���󺯴���ͨ��">11ҹ���󺯴���ͨ��</option>
				</select>
				</td>
	<td class="BACKGROUND_a" align="left">AT20018 ȫ��ְҵ�ʸ�֤����Ϣ��֤��ȼ�</td><td>
	<select name="AT20018" id="AT20018">
	<option value="">δ֪</option>
	<option value="-999">-999</option>
	<option value="-888">-888</option>
	<option value="����������ְҵ�ʸ�5����" selected>����������ְҵ�ʸ�5����</option>
	<option value="�м�������ְҵ�ʸ�4����">�м�������ְҵ�ʸ�4����</option>
	<option value="�߼�������ְҵ�ʸ�3����">�߼�������ְҵ�ʸ�3����</option>
	<option value="��ʦ������ְҵ�ʸ�2����">��ʦ������ְҵ�ʸ�2����</option>
	<option value="�߼���ʦ������ְҵ�ʸ�1����">�߼���ʦ������ְҵ�ʸ�1����</option>
	</select>
	</td>
</tr>	
<tr>
<td class="BACKGROUND_a" align="left">AT20005�Ƿ�Ϊ���ÿ��Ͽͻ�</td><td>
<select name="AT20005" id="AT20005">
<option value="">δ֪</option>
<option value="1" selected>��</option>
<option value="2">��</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT20006���ÿ��Ͽͻ����</td><td><input type="text" name="AT20006" id="AT20006" value="0"/> </td>
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">A04009 �Ƿ������</td><td>
	<input type="text" name="A04009" id="A04009" value=""/>
	<!-- <select name="A04009" id="A04009">
	<option value="">δ֪</option>
	<option value="1">��</option>
	<option value="2" selected>��</option>
	</select> -->
	</td>
	<td class="BACKGROUND_a" align="left">
		A04010 ���������</td><td><input type="text" name="A04010" id="A04010" value="0"/>
    </td>
    </tr>
<tr>
    <td class="BACKGROUND_a" align="left">AT20009��������թ����</td><td>
	<select name="AT20009" id="AT20009">
	<option value="">δ֪</option>
	<option value="A" selected>A</option>
	<option value="A+">A+</option>
	<option value="D+">D+</option>
	<option value="D">D</option>
	<option value="D-">D-</option>
	<option value="E">E</option>
	<option value="F">F</option>
	<option value="G">G</option>
	<option value="0">0</option>
	</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20031  ��������թ����</td><td>
		<input type="text" id="AT20031" name="AT20031" value="50"/>
	</td>
</tr>		
<tr>
	<td class="BACKGROUND_a" align="left">AT20011����״̬</td><td>
		<select name="AT20011" id="AT20011">
		<option value="">δ֪</option>
		<option value="1" selected>һ�ξ���</option>
		<option value="2">���ξ���</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20010�����Ƿ񷵻�</td><td>
	 <input type="text" name="AT20010" id="AT20010" value="1" />
	<!--  <select name="AT20010" id="AT20010">
	<option value="">δ֪</option>
	<option value="1" selected="selected">��</option>
	<option value="2">��</option>
	<option value="-888">-888</option>
	</select> -->
	</td>
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">A04006 �Ƿ����ڷ����ͻ�</td><td>
	<input type="text" name="A04006" id="A04006"/>
	<!-- <select name="A04006" id="A04006">
	<option value="">δ֪</option>
	<option value="1">��</option>
	<option value="2" selected="selected">��</option>
	</select> -->
	</td>
	<td class="BACKGROUND_a" align="left">A04007  ������������ڳ��ȣ��죩</td><td>
		<input type="text" id="A04007" name="A04007" value="300"/>
	</td>
</tr>	
<tr>
	<td class="BACKGROUND_a" align="left">A04008 �����ۼ�Ӧ����Ԫ��</td><td>
		<input type="text" id="A04008" name="A04008" value="2000"/>
	</td>
	<td class="BACKGROUND_a" align="left">AT20020  �Ƿ���ѧ��</td><td>
		<select name="AT20020" id="AT20020">
			<option value="">��ѡ��</option>
			<option value="-888">-888</option>
			<option value="-999">-999</option>
			<option value="3">3�ӿ�֮��</option>
			<option value="1"selected="selected">��</option>
			<option value="2">��</option>	
		</select>
	</td>
</tr>		
<tr>
	<td class="BACKGROUND_a" align="left">AT20021 ����ʧ�ű�ִ����</td><td>
		<select name="AT20021" id="AT20021">
			<option value="" selected="selected">��ѡ��</option>
			<option value="-999">-999</option>
			<option value="-888">-888</option>
			<option value="-777">-777�ӿ�֮��</option>
			<option value="1">��</option>
			<option value="2">��</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20027  ��ҵԺУ����(schoolType desc)</td><td>
	<select name="AT20027" id="AT20027">
		<option value="">δ֪</option>
		<option value="1">1-985ԺУ</option>
		<option value="2" selected="selected">2-211ԺУ</option>
		<option value="3">3��985ԺУ��211ԺУ</option>
	</select>
	</td>
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">AT20022��ѧ���(enrolDate desc)</td>
	<td><input type="text" id="AT20022" name="AT20022" value="2015"/></td>
	<td class="BACKGROUND_a" align="left">AT20023��ҵʱ��(graduateTime desc)</td>
	<td><input type="text" id="AT20023" name="AT20023" value="2015"/></td>
</tr>

<tr>
	<td class="BACKGROUND_a" align="left">AT20024��ҵ����(bynx desc)</td>
	<td><input type="text" id="AT20024" name="AT20024" value="6"/></td>
	<td class="BACKGROUND_a" align="left">AT20025��ҵ����(studyResult desc)</td>
	<td>
		<select name="AT20025" id="AT20025">
			<option value="">��ѡ��</option>
			<option value="��ҵ"selected="selected">1��ҵ</option>
			<option value="��ҵ">2��ҵ</option>
			<option value="��ҵ">3��ҵ</option>
		</select>
	</td>
</tr>

<tr>
	<td class="BACKGROUND_a" align="left">AT20026ѧ������D��dxllx desc��</td>
	<td>
		<select name="AT20026" id="AT20026">
			<option value="">��ѡ��</option>
			<option value="��ͨ"selected="selected">1��ͨ</option>
			<option value="�о���">2�о���</option>
			<option value="����">3����</option>
			<option value="�Կ�">4�Կ�</option>
			<option value="�������">5�������</option>
			<option value="���Ž���">6���Ž���</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20028ѧУ����(���졢����)(schoolTrade desc)</td>
	<td>
		<select name="AT20028" id="AT20028">
			<option value="">��ѡ��</option>
			<option value="����" selected="selected">1����</option>
			<option value="���">2���</option>
		</select>
	</td>
	
</tr>

<tr>
	<td class="BACKGROUND_a" align="left">AT20029ѧϰ��ʽD��dstudyStyle desc��</td>
	<td>
		<select name="AT20029" id="AT20029">
			<option value="">��ѡ��</option>
			<option value="��ͨȫ����">��ͨȫ����</option>
			<option value="ȫ����">2ȫ����</option>
			<option value="��ȫ����">3��ȫ����</option>
			<option value="�Ѳ�">4�Ѳ�</option>	
			<option value="ҵ��">5ҵ��</option>
			<option value="��ְ">6��ְ</option>
			<option value="ҹ��ѧ">7ҹ��ѧ</option>
			<option value="�������">8�������</option>
			<option value="����">9����</option>
			<option value="���Ž���">10���Ž���</option>
			<option value="Զ�̽���">11Զ�̽���</option>
			<option value="���ӽ���">12���ӽ���</option>
			<option value="����">13����</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20030֤��-��֤����</td>
	<td>
		<input type="text" id="AT20030" name="AT20030" value="20150808" onkeydown="ctlSubmit(event,'create')"/>
	</td>
	
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">PFTEST ����ר�� ��������</td>
	<td>
		<input type="text" id="PFTEST" name="PFTEST" value=""/>
	</td>
</tr>

<!-- �ӿ�ʼ������  -->	
 	
    </table>
  <p>
    <img onClick="javascript:submitinfo('saveXml');" src="img/button8.gif" width="54" height="26">
    <img onClick="javascript:submitinfo('create');" src="img/����.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('network');" src="img/����.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('temporary');" src="img/�ٵ�.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('permanent');" src="img/����.jpg" width="54" height="26">
    <input type="button" value="���" id="re">
  </p>
  <input   type="hidden"  name="textfield" onclick="ctlSubmit(event,'create')"/>
</form>
<table width="100%" cellspacing="0" cellpadding="0" >
    <tr>
    	<td with= 75% align=center height="32"><span><font size="1">Copyright &copy; 2005 �����׺�����������޹�˾ ��Ȩ����</font></span>
    </tr>
</table></center>
</body>
</html>
   