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
var $j = jQuery.noConflict(); //将变量$的控制权让渡给prototype.js
// 测试引用是否成功  
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
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
		} else if (type == 22) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（现值/元）"
		} else if (type == 23) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（购买金额/元）"
		} else if (type == 24) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 25) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 26) {
			document.all("value1").innerHTML = "<input type=\"text\" name=\"CredAssetValue1\" size=\"20\" value=\""+value+"\">（每年保费/元）"
		}
	}
	function changeValue2(type, value) {

		if (type == 0) {
			document.all("value2").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue2\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
		} else if (type == 22) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（现值/元）"
		} else if (type == 23) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（购买金额/元）"
		} else if (type == 24) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 25) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 26) {
			document.all("value2").innerHTML = "<input type=\"text\" name=\"CredAssetValue2\" size=\"20\" value=\""+value+"\">（每年保费/元）"
		}
	}
	function changeValue3(type, value) {

		if (type == 0) {
			document.all("value3").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue3\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
		} else if (type == 22) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（现值/元）"
		} else if (type == 23) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（购买金额/元）"
		} else if (type == 24) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 25) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 26) {
			document.all("value3").innerHTML = "<input type=\"text\" name=\"CredAssetValue3\" size=\"20\" value=\""+value+"\">（每年保费/元）"
		}
	}
	function changeValue4(type, value) {

		if (type == 0) {
			document.all("value4").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue4\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
		} else if (type == 22) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（现值/元）"
		} else if (type == 23) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（购买金额/元）"
		} else if (type == 24) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 25) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 26) {
			document.all("value4").innerHTML = "<input type=\"text\" name=\"CredAssetValue4\" size=\"20\" value=\""+value+"\">（每年保费/元）"
		}
	}

	function changeValue5(type, value) {

		if (type == 0) {
			document.all("value5").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue5\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
		} else if (type == 22) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（现值/元）"
		} else if (type == 23) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（购买金额/元）"
		} else if (type == 24) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 25) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 26) {
			document.all("value5").innerHTML = "<input type=\"text\" name=\"CredAssetValue5\" size=\"20\" value=\""+value+"\">（每年保费/元）"
		}
	}

	function changeValue6(type, value) {

		if (type == 0) {
			document.all("value6").innerHTML = "<input type=\"hidden\" name=\"CredAssetValue6\" value=\""+value+"\">"
		} else if (type == 21) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（建筑面积/平米）"
		} else if (type == 22) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（现值/元）"
		} else if (type == 23) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（购买金额/元）"
		} else if (type == 24) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 25) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（金额/元）"
		} else if (type == 26) {
			document.all("value6").innerHTML = "<input type=\"text\" name=\"CredAssetValue6\" size=\"20\" value=\""+value+"\">（每年保费/元）"
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
		var homeMthlyRent = new Array("1000", "1500", "2000");//若为租用，每月租金
		var homeMthlyLonPayt = new Array("2000", "3000", "4000");//若为按揭购买，每月供款
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
		var priPosExpl = new Array("主卡申请人其他职位1", "主卡申请人其他职位2", "主卡申请人其他职位3");
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
		var promotionChannel = new Array("HQ003", "DM", "DM", "IB", "BH广东",
				"TO", "TM", "BH广东", "P000006", "BH广东", "HQ003", "P000006",
				"TM", "P000006", "TO", "BH上海", "TO", "HQ003", "EX00008", "TM",
				"P000006", "IN0000007", "P000006", "BH上海", "DM", "TO",
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
		document.all.PriIDType.options[num4].selected = true;//20040209 证件名称
		document.all.form1.PriNationality.value = priNationality[num29 - 1];
		document.all.PriMaritalSta.options[num3].selected = true;//20040209 婚姻状况
		document.all.PriEducationLvl.options[num4].selected = true;
		document.all.form1.PriHomePtCd.value = homeAddrPtCd[num29 - 1];
		document.all.form1.HomeResidingYear.value = homeResidingDurYear[num29 - 1];
		document.all.form1.HomeResidingMonth.value = homeResidingDurMonth[num11 - 1];
		document.all.HomeOwshType.options[num5].selected = true;
		if (document.all.HomeOwshType.options[num5].value == 5) {
			document.all.form1.HouseHireAmt.value = homeMthlyRent[num2 - 1];//若为租用，每月租金
		}
		if (document.all.HomeOwshType.options[num5].value == 4) {
			document.all.form1.HousePayAmt.value = homeMthlyLonPayt[num2 - 1];//若为按揭购买，每月供款
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
				alert('可证明的年收入额无效，请补充');
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
							alert('身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.PriGender.value == 2) {

						if (number.charAt(number.length - 1) % 2) {
							alert('身份证号码与性别不符');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.PriIDType.value == 1) {
					if (document.form1.PriGender.value == 1) {

						if (!(number.charAt(number.length - 2) % 2)) {
							alert('身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.PriGender.value == 2) {

						if (number.charAt(number.length - 2) % 2) {
							alert('身份证号码与性别不符');
							return false;
						}
					}
					break;
				}
			default:
				if (document.form1.PriIDType.value == 1) {
					alert('身份证位数不符合要求');
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
							alert('附属卡1身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.SuppSex1.value == 2) {

						if (number1.charAt(number1.length - 1) % 2) {
							alert('附属卡1身份证号码与性别不符');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.SuppIDType1.value == 1) {
					if (document.form1.SuppSex1.value == 1) {

						if (!(number1.charAt(number1.length - 2) % 2)) {
							alert('附属卡1身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.SuppSex1.value == 2) {

						if (number1.charAt(number1.length - 2) % 2) {
							alert('附属卡1身份证号码与性别不符');
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
							alert('附属卡2身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.SuppSex2.value == 2) {

						if (number2.charAt(number2.length - 1) % 2) {
							alert('附属卡2身份证号码与性别不符');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.SuppIDType2.value == 1) {
					if (document.form1.SuppSex2.value == 1) {

						if (!(number2.charAt(number2.length - 2) % 2)) {
							alert('附属卡2身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.SuppSex2.value == 2) {

						if (number2.charAt(number2.length - 2) % 2) {
							alert('附属卡2身份证号码与性别不符');
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
							alert('附属卡3身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.SuppSex3.value == 2) {

						if (number3.charAt(number3.length - 1) % 2) {
							alert('附属卡3身份证号码与性别不符');
							return false;
						}
					}
					break;
				}
			case 18:
				if (document.form1.SuppIDType3.value == 1) {
					if (document.form1.SuppSex3.value == 1) {

						if (!(number3.charAt(number3.length - 2) % 2)) {
							alert('附属卡3身份证号码与性别不符');
							return false;
						}
					}
					if (document.form1.SuppSex3.value == 2) {

						if (number3.charAt(number3.length - 2) % 2) {
							alert('附属卡3身份证号码与性别不符');
							return false;
						}
					}
					break;
				}
			}
		}
		if (document.form1.HomeOwshType.value == 4) {
			if (document.form1.HousePayAmt.value <= 0) {
				alert('每月供款无效，请补充');
				return false;
			}

		}

		if (document.all.supp1Check.value == 1) {
			if (document.form1.SuppLimitFlag1.value == 2) {
				if (document.form1.SuppLimitPercent1.value > 100) {

					document.form1.SuppLimitPercent1.value = 100;
				}
				if (document.form1.SuppLimitPercent1.value < 0) {
					alert('附属卡1额度百分比无效，请重填');
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
					alert('附属卡2额度百分比无效，请重填');
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
					alert('附属卡3额度百分比无效，请重填');
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
						alert('身份证与出生日期不符');
						return false;
					}
					break;
				}
			case 18:
				var cardbirth = idcard.substr(6, 8);
				if (document.form1.PriIDType.value == 1) {
					if (document.form1.PriCardBirthday.value != cardbirth) {
						alert('身份证与出生日期不符');
						return false;
					}
					break;
				}
			default:
				if (document.form1.PriIDType.value == 1) {
					alert('身份证位数不符合要求');
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
						alert('附属卡1身份证与出生日期不符');
						return false;
					}
					break;

				case 18:
					var cardbirth1 = idcard1.substr(6, 8);

					if (document.form1.SuppBirthday1.value != cardbirth1) {
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
		if (document.all.supp2Check.value == 1) {
			if (document.form1.SuppIDType2.value == 1) {
				var idcard2 = document.form1.SuppIDNo2.value;

				switch (idcard2.length) {

				case 15:

					var cardbirth2 = idcard2.substr(6, 6);

					if (document.form1.SuppBirthday2.value.substr(2, 6) != cardbirth2) {
						alert('附属卡2身份证与出生日期不符');
						return false;
					}
					break;

				case 18:
					var cardbirth2 = idcard2.substr(6, 8);

					if (document.form1.SuppBirthday2.value != cardbirth2) {
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
		if (document.all.supp3Check.value == 1) {
			if (document.form1.SuppIDType3.value == 1) {
				var idcard3 = document.form1.SuppIDNo3.value;

				switch (idcard3.length) {

				case 15:

					var cardbirth3 = idcard3.substr(6, 6);

					if (document.form1.SuppBirthday3.value.substr(2, 6) != cardbirth3) {
						alert('附属卡3身份证与出生日期不符');
						return false;
					}
					break;

				case 18:
					var cardbirth3 = idcard3.substr(6, 8);

					if (document.form1.SuppBirthday3.value != cardbirth3) {
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
		if (document.form1.CredAssetType1.value != 0) {
			if (document.form1.CredAssetValue1.value < 1) {
				alert('可证明的资产价值1无效，请补充');
				return false;
			}
		}

		if (document.form1.CredAssetType2.value != 0) {
			if (document.form1.CredAssetValue2.value < 1) {
				alert('可证明的资产价值2无效，请补充');
				return false;
			}
		}

		if (document.form1.CredAssetType3.value != 0) {
			if (document.form1.CredAssetValue3.value < 1) {
				alert('可证明的资产价值3无效，请补充');
				return false;
			}
		}
		if (document.form1.CredAssetType4.value != 0) {
			if (document.form1.CredAssetValue4.value < 1) {
				alert('可证明的资产价值4无效，请补充');
				return false;
			}
		}
		if (document.form1.AppType.value == 2
				|| document.form1.AppType.value == 3) {
			if (document.all.supp1.checked == false
					&& document.all.supp2.checked == false
					&& document.all.supp3.checked == false) {
				alert('需要勾选附属卡标签');
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
/* function $use1(){
	var d=$('class1content1');
	var sb=$('stateBut1');
	if(d.style.display=='none'){
	$D3();
	sb.innerHTML='人行信息收缩';
	}else{
	$D4();
	sb.innerHTML='人行信息展开';
	}
} */
</script>
  </head>
  
<body onLoad="changeValue()" onkeydown="ctlSubmit(event,'create')">
<center>
<form name="form" method="post">
    <table width="78%">
           <tr>
        <td width="50%" align = "center"> <span class="pt12" style = "font-size: 11pt;font-family= '黑体'" ><strong>信用卡授信决策系统(CDSE)</strong></span>        </td>
      <tr>
	  <tr>
        <td width="50%" align = "center"> <span class="pt12" style = "font-size: 11pt;font-family= '黑体'" ><strong>申请数据输入界面</strong></span>        </td>
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
        <td colspan=4 align="center"><strong class="color">申请单信息（必填项）</strong></td>
    </tr>
    <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AppId申请单编号</td>
        <td width="25%" class="BACKGROUND_c">
            <input name="AppId" value="2011072000001" size=20 maxlength=16 isNeed="Y" fieldName="申请单编号">
        </td>

	<td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AppType申请类型</td>
        <td width="25%" class="BACKGROUND_c">
            <select name="AppType"  onchange="javascript:changeSupplyOnly(this.value);">
            <option value="">请选择</option>
            <option value="1" selected >纯主卡申请</option>
            <option value="2">主卡+附属卡申请</option>
            <option value="3">纯附属卡申请</option>
			</select>
        </td>
    </tr>
 
        <tr>
       <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>recheckResultFlag 资信核查结果</td>
        <td width="25%" class="BACKGROUND_c" colspan=3> <select name="recheckResultFlag" onChange="javascript:changeRecheckResult(this.value);">
            <option value="">请选择</option>
            <option value="1" selected >1</option>
            <option value="2" >2</option>
            <option value="3" >3</option>
            <option value="4" >4</option>
          </select></td>
      </tr>

  </table>

    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong class="color">产品信息（必填项）</strong></td>
      </tr>
      <tr>
        <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>ProductCd 申请产品编号</td>


        <td width="25%" class="BACKGROUND_c"><select name="ProductCd">
            <option value="">请选择</option>
             <option value="aaaa">测试错误卡</option>
	    <option value="cccc">测试公务卡</option>
	    <option value="YD02">长城易达钱信用卡</option>
	    <option value="1P02" selected="selected">长城万事达精英白金卡</option>
	    <option value="2TB1">中银淘宝校园卡</option>
	    <option value="2ZF1">中银淘宝联名信用卡</option>
	    <option value="2P01">中银威士至尊白金卡</option>
	    <option value="HQT1">长城环球通个人银联金卡</option>
            <option value="VM01">长城国际卡VISA美元金卡</option>
            <option value="VY01">长城国际卡VISA英镑金卡</option>
            <option value="MM01">长城国际卡Master card美元钛金卡</option>
            <option value="MY01">长城国际卡Master card英镑钛金卡</option>
            <option value="1001">万事达个人普卡</option>
            <option value="1002">万事达个人金卡</option>
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

        <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>PriCardCurr 申请卡片货币种类</td>
        <td width="25%" class="BACKGROUND_c"> <select name="PriCardCurr">
            <option value="">请选择</option>
            <option value="1" >双币</option>
            <option value="2" selected>单币</option>
          </select> </td>
      </tr>
      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SupplApplOnly 纯粹附属卡</td>
        <td width="25%" class="BACKGROUND_c"> <select name="SupplApplOnly" onChange="javascript:changebytype()">
            <option value="">请选择</option>
            <option value="Y" >是</option>
            <option value="N" selected>否</option>
          </select> </td>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CCardTypeDownGrade 如被拒绝是否接受低一款信用卡</td>
        <td width="25%" class="BACKGROUND_c"> <select name="CCardTypeDownGrade">
            <option value="">请选择</option>
            <option value="Y" selected >是</option>
            <option value="N">否</option>
          </select> </td>
      </tr>
      <tr>
        <td class="BACKGROUND_a" align = "left">ZeroLimitFlag QCC 卡申请是否零额度</td>
        <td class="BACKGROUND_c"><select name="ZeroLimitFlag" id="ZeroLimitFlag" onChange="javascript:changebytype()">
          <option value=""></option>
          <option value="Y">是</option>
          <option value="N" selected >否</option>
                                </select></td>
        <td class="BACKGROUND_a" align = "left">ReservedField3 公务卡清偿方式</td>
        <td class="BACKGROUND_c"><select name="ReservedField3" id="ReservedField3">
          <option value="" selected>请选择</option>
          <option value="1">个人清偿</option>
          <option value="2">公司担保、人工清偿</option>
          <option value="3" selected>公司清偿</option>
                        </select></td>
      </tr>
    </table>
    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong class="color">个人信息（必填项）</strong></td>
    </tr>
    <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriJCBType 主卡人身份类型</td>
        <td width="25%" class="BACKGROUND_c" colspan="3">
            <select name="PriJCBType">
            <option value="">请选择</option>
            <option value="1" >日资企业工作人员</option>
			<option value="2">赴日商旅人士</option>
			<option value="3">赴日留学生</option>
			<option value="4" selected>其他</option>
              </select>
        （选择JCB卡的用户请选择此项）</td>
	</tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriGender 性别</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="PriGender">
          <option value="">请选择</option>
          <option value="1" selected>1男</option>
          <option value="2" >2女</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriCardBirthday 出生日期</td>
      <td width="25%" class="BACKGROUND_c"><input name="PriCardBirthday" value="19791103" size=8 maxlength=8>
      (YYYYMMDD)</td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriIDType 证件名称</td>
      <td width="25%" class="BACKGROUND_c" >
        <select name="PriIDType">
          <option value="">请选择</option>
          <option value="1" selected >身份证</option>
          <option value="2">护照</option>
          <option value="3">军官证</option>
          <option value="4">回乡证</option>
          <option value="5">台胞证</option>
        </select>
      </td>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriIDNo 证件号码</td>
      <td width="25%" class="BACKGROUND_c"><input name="PriIDNo" value="132237197911030419" size=20 maxlength=18></td>

    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriNationality 国籍</td>
      <td width="25%" class="BACKGROUND_c"><select name="PriNationality">
          <option value="">请选择</option>
          <option value="CHN" selected >中国</option>
          <option value="USA">美国</option>
          <option value="JPN">日本</option>
      </select></td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriMaritalSta 婚姻状况</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="PriMaritalSta">

          <option value="">请选择</option>
          <option value="1">未婚</option>
          <option value="2" selected >已婚</option>
          <option value="3">离异</option>
          <option value="4">其它</option>
        </select>
      </td>
    </tr>
<tr>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriEducationLvl 教育程度</td>
      <td width="75%" class="BACKGROUND_c" colspan=3>
        <select name="PriEducationLvl">
          <option value="">请选择</option>
          <option value="1" selected>1研究生及以上</option>
          <option value="2" >2大学本科</option>
          <option value="3">3大学专科/高职学院</option>
          <option value="4">4高中/职高</option>
          <option value="-9">-9其他</option>
        </select>
      </td>
    </tr>

    <tr>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriHomePtCd 现居住地邮编</td>
      <td width="25%" class="BACKGROUND_c" ><input name="PriHomePtCd" value="100055" size=20 maxlength=6></td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomeResidingYear 现居住地居住年份</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomeResidingYear" value="20" size=10 maxlength=2>
      年</td>

    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomeResidingMonth 现住地月份</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomeResidingMonth" value="4" size=10 maxlength=2>
      月</td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomeOwshType 现居住地性质</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="HomeOwshType">
          <option value="">请选择</option>
          <option value="1">1与亲属同住</option>
          <option value="2">2单位宿舍</option>
          <option value="3" selected >3无按揭自置</option>
          <option value="4">4按揭自置</option>
          <option value="5">5租用</option>
          <option value="6">6其它</option>
        </select>
      </td>
    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left">HouseHireAmt 若为租用，每月租金</td>
      <td width="25%" class="BACKGROUND_c"><input name="HouseHireAmt" value="" size=10 maxlength=10>元</td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HousePayAmt 若为按揭购买，每月供款</td>
      <td width="25%" class="BACKGROUND_c"><input name="HousePayAmt" value="" size=10 maxlength=10>元</td>
    </tr>

    <tr>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomePhonePro 家庭电话区号</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomePhonePro" value="010" size=10 maxlength=5></td>

      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>HomePhoneNo 家庭电话号码</td>
      <td width="25%" class="BACKGROUND_c"><input name="HomePhoneNo" value="72672367" size=10 maxlength=8></td>

    </tr>

    <tr>

      <td width="25%" class="BACKGROUND_a" align = "left">DependentCnt 供养人数</td>
      <td width="75%" class="BACKGROUND_c" colspan=3><input name="DependentCnt" value="" size=10 maxlength=2></td>
    </tr>

  </table>
    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong class="color">职业信息（必填项）</strong></td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>ComAddrPtCd 公司邮编</td>
        <td class="BACKGROUND_c"> <input name="ComAddrPtCd" value="100055" size=10 maxlength=6>
        </td>
         <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AT6120 职业信息</td>
        <td class="BACKGROUND_c" colspan=3> <input name="AT6120" value="" size=10 maxlength=6>
        </td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompTelPhonePro 公司电话区号</td>
        <td width="25%" class="BACKGROUND_c"><input name="CompTelPhonePro" value="010" size=10 maxlength=5></td>
  <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompTelPhone 公司电话号码</td>
        <td width="25%" class="BACKGROUND_c" ><input name="CompTelPhone" value="8348934" size=10 maxlength=8></td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompBizField 行业性质</td>
        <td class="BACKGROUND_c"><select name="CompBizField">
            <option value="">请选择</option>
            <option value="01" >制造业</option>
            <option value="02">进出口贸易</option>
            <option value="03">批发/零售/分销</option>
            <option value="04" selected>金融业</option>
            <option value="05">能源</option>
            <option value="06">网络/信息服务/电子商务</option>
            <option value="07">电信及邮政服务业</option>
            <option value="08">酒店/旅游</option>
            <option value="09">水利、环境和公共设施管理业</option>
            <option value="10">房地产</option>
            <option value="11">建筑</option>
            <option value="12">政府机构</option>
            <option value="13">文化/教育/培训</option>
            <option value="14">交通运输/仓储/物流</option>
            <option value="15">法律/会计</option>
            <option value="16">商业咨询/顾问服务</option>
            <option value="17">卫生/社会保障/福利业</option>
            <option value="18">文化/体育/娱乐业</option>
            <option value="19">媒体/公关/出版业</option>
            <option value="20">其它</option>
        </select></td>
         <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AT6130是否新表单</td>
        <td class="BACKGROUND_c">
        	<select name="AT6130">
        		<option value="">请选择</option>
        		<option value="1" >新表单</option>
        		<option value="2" selected="selected">旧表单</option>
        	</select>
        </td>
      </tr>
      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompBizOwShType 经济类型</td>
        <td width="25%" class="BACKGROUND_c" > <select name="CompBizOwShType">
            <option value="">请选择</option>
            <option value="11" selected>11政府机关/事业单位</option>
            <option value="12" >12国营企业</option>
            <option value="03">03集体企业</option>
            <option value="13">13个体经营/自由职业</option>
            <option value="14">14民营企业</option>
            <option value="15">15股份制公司</option>
            <option value="16">16外商投资/合资</option>
            <option value="08">08港澳台投资/合资</option>
            <option value="17">17军队</option>
            <option value="18">18其它</option>
			<option value="11">11高职</option>
        </select> </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>PriPos 主卡申请人职位</td>
        <td width="25%" class="BACKGROUND_c" > <select name="PriPos">
            <option value="">请选择</option>
		        <option value="501"> 	501(副)厅/局级以上 </option>
		        <option value="601">	601总经理/总裁     </option>
		        <option value="604">	604一般员工        </option>
		        <option value="701">	701高级职称及以上  </option>
		        <option value="801">	801厅/局级以上/企业负责人  </option>
		        <option value="802" selected>	802县处级/总经理  </option>
		        <option value="803">	803科级/部门经理  </option>
		        <option value="804">	804科员级/职工  </option>
		        <option value="805">	805其他  </option>
                        <option value="101" >101(副)厅/局级及以上公务员</option>
                        <option value="401">401总经理/总裁</option>
                        <option value="406">406一般员工</option>
                        <option value="407">407其它</option>
        </select> </td>
      </tr>

      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>CompPosSeniority 现职年限</td>
        <td width="25%" class="BACKGROUND_c"><input name="CompPosSeniority" value="5" size=10 maxlength=2>
        年</td>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>MthlySalary 当前工作月总收入</td>
        <td width="25%" class="BACKGROUND_c"><input name="MthlySalary" value="10000" size=10 maxlength=10>
        元</td>
      </tr>
      <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AmmSalary 年薪总额</td>
        <td class="BACKGROUND_c" colspan="3"><input name="AmmSalary" value="120000" size=10 maxlength=10>
        元</td>
        <tr>
        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AT0710 申请表年收入</td>
        <td class="BACKGROUND_c" colspan="3"><input name="AT0710" value="110000" size=10 maxlength=10>
        元</td>
      </tr>
    </table>
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong>您的银行与资产信息</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>OtherBankCardSta 持有其他发卡机构信用卡</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="OtherBankCardSta" onChange="javascript:changeOtherBankCardSta(this.value)">
          <option value="">请选择</option>
          <option value="0" >从未申请过信用卡</option>
          <option value="1" selected>其他银行</option>
          <option value="2">建设银行</option>
        </select>
      </td>
      <td width="25%" align = "left" class="BACKGROUND_a">OthCardCnt 现有信用卡数量</td>
      <td width="25%" class="BACKGROUND_c"><input name="OthCardCnt" value="" size=10 maxlength=2>张</td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>BOCSaveActFlg 是否已在建设银行开立储蓄账户</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="BOCSaveActFlg" >
          <option value="" selected>请选择</option>
          <option value="Y" >是</option>
          <option value="N" selected>否</option>
        </select>
      </td>
      <td width="25%" align = "left" class="BACKGROUND_a"> OthBankSaveActNum 在其它商业银行帐户数</td>
      <td width="25%" class="BACKGROUND_c"><input name="OthBankSaveActNum" value="" size=10 maxlength=2></td>
    </tr>

  </table>
  <b><span id="stateBut" onclick="$use()">附属卡信息</span></b>
  <div id="class1content" style="display: none">
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
  
    <tr>
        <td colspan=4 align="center"><strong><input type="checkbox" name="supp1" onClick="javascript:selectsupp1()">附属卡1信息</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppRelation1 与主卡申请人的关系</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppRelation1">
          <option value="" selected>请选择</option>
          <option value="1">父母</option>
          <option value="2">配偶</option>
          <option value="3">子女</option>
          <option value="4" >其它</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">PrimaryCardNo1 主卡卡号</td>
      <td width="25%" class="BACKGROUND_c"><input name="PrimaryCardNo1" value="" size=16 maxlength=16></td>
<!--0209
      <td class="BACKGROUND_a" align = "left">与主卡申请人的关系其他说明</td>
      <td class="BACKGROUND_c"><input name="SupplRelationExpl" value="" size=20 maxlength=30></td>
-->
    </tr>
    <tr>
    <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppSex1 性别</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppSex1">
          <option value="" selected>请选择</option>
          <option value="1" >男</option>
          <option value="2">女</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppBirthday1 附属卡出生日期</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppBirthday1" value="" size=8 maxlength=12>(YYYYMMDD)</td>
    </tr>
   <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDType1 证件名称</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppIDType1">
          <option value="" selected>请选择</option>
          <option value="1" >身份证</option>
          <option value="2">护照</option>
          <option value="3">军官证</option>
          <option value="4">台胞证</option>
          <option value="5">回乡证</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDNo1 证件号码</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppIDNo1" value="" size=20 maxlength=20></td>
    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppLimitFlag1 附属卡信用额度设定</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppLimitFlag1">
          <option value="">请选择</option>
          <option value="1" >与主卡共同使用</option>
          <option value="2" selected>设定，客户填写百分比</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppLimitPercent1 若为附属卡设定信用额度，百分比</td>
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
        <td colspan=4 align="center"><strong><input type="checkbox" name="supp2"  onclick="javascript:selectsupp2()">附属卡2信息</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppRelation2 与主卡申请人的关系</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppRelation2">
          <option value="" selected>请选择</option>
          <option value="1" >父母</option>
          <option value="2">配偶</option>
          <option value="3">子女</option>
          <option value="4" >其它</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">PrimaryCardNo2 主卡卡号</td>
      <td width="25%" class="BACKGROUND_c"><input name="PrimaryCardNo2" value="" size=16 maxlength=16></td>
<!--0209
      <td class="BACKGROUND_a" align = "left">与主卡申请人的关系其他说明</td>
      <td class="BACKGROUND_c"><input name="SupplRelationExpl" value="" size=20 maxlength=30></td>
-->
    </tr>
    <tr>
    <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppSex2 性别</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppSex2">
          <option value="" selected>请选择</option>
          <option value="1" >男</option>
          <option value="2">女</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppBirthday2 附属卡出生日期</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppBirthday2" value="" size=8 maxlength=8>(YYYYMMDD)</td>
    </tr>
   <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDType2 证件名称</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppIDType2">
          <option value="" selected>请选择</option>
          <option value="1" >身份证</option>
          <option value="2">护照</option>
          <option value="3">军官证</option>
          <option value="4">台胞证</option>
          <option value="5">回乡证</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDNo2 证件号码</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppIDNo2" value="" size=20 maxlength=20></td>
    </tr>

    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppLimitFlag2 附属卡信用额度设定</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppLimitFlag2">
          <option value="" selected>请选择</option>
          <option value="1" >与主卡共同使用</option>
          <option value="2">设定，客户填写百分比</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppLimitPercent2若为附属卡设定信用额度，百分比</td>
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
        <td colspan=4 align="center"><strong><input type="checkbox" name="supp3"  onclick="javascript:selectsupp3()">附属卡3信息</strong></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppRelation3 与主卡申请人的关系</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppRelation3">
          <option value="" selected>请选择</option>
          <option value="1" >父母</option>
          <option value="2">配偶</option>
          <option value="3">子女</option>
          <option value="4">其它</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">PrimaryCardNo3 主卡卡号</td>
      <td width="25%" class="BACKGROUND_c"><input name="PrimaryCardNo3" value="" size=16 maxlength=16></td>
<!--0209
      <td class="BACKGROUND_a" align = "left">与主卡申请人的关系其他说明</td>
      <td class="BACKGROUND_c"><input name="SupplRelationExpl" value="" size=20 maxlength=30></td>
-->
    </tr>
    <tr>
    <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppSex3 性别</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppSex3">
          <option value="" selected>请选择</option>
          <option value="1" >男</option>
          <option value="2">女</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppBirthday3 附属卡出生日期</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppBirthday3" value="" size=8 maxlength=8>(YYYYMMDD)</td>
    </tr>
   <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDType3 证件名称</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppIDType3">
          <option value="" selected>请选择</option>
          <option value="1" >身份证</option>
          <option value="2">护照</option>
          <option value="3">军官证</option>
          <option value="4">台胞证</option>
          <option value="5">回乡证</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppIDNo3 证件号码</td>
      <td width="25%" class="BACKGROUND_c"><input name="SuppIDNo3" value="" size=20 maxlength=20></td>
    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>SuppLimitFlag3 附属卡信用额度设定</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="SuppLimitFlag3">
          <option value="" selected>请选择</option>
          <option value="1" >与主卡共同使用</option>
          <option value="2">设定，客户填写百分比</option>
        </select>
      </td>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppLimitPercent3 若为附属卡设定信用额度，百分比</td>
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
        <td colspan=4 align="center"><strong>月结单选择</strong></td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>PriStatAddrSel 主卡对账单邮寄地址</td>
      <td width="75%" class="BACKGROUND_c" >
        <select name="PriStatAddrSel">
          <option value="">请选择</option>
          <option value="1" selected >公司地址</option>
          <option value="2" >家庭住址</option>
        </select>
      </td>

    </tr>
    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left">SuppStatAddrPtCd 若为其它地址，主卡对帐单邮寄邮编</td>
      <td width="75%" class="BACKGROUND_c" colspan=3><input name="SuppStatAddrPtCd" value="" size=10 maxlength=10></td>
    </tr>

  </table>
  <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong class="color">还款信息（必填项）</strong></td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AutoPayMethod 还款方式</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="AutoPayMethod">
          <option value="">请选择</option>
          <option value="2" >2自动还款</option>
          <option value="1" selected >1主动还款</option>
        </select>
      </td>
	<td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AutoPayAmtSel 还款额设定（人民币）</td>
      <td width="25%" class="BACKGROUND_c">
        <select name="AutoPayAmtSel">
          <option value="">请选择</option>
          <option value="1" selected >全额还款</option>
          <option value="2">最低还款</option>
        </select>
      </td>

    </tr>


    <tr>
      <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AutoPayActSel 还款账户选择</td>
      <td class="BACKGROUND_c" colspan=3>
        <select name="AutoPayActSel">
          <option value="">请选择</option>
          <option value="1" >人民币与外币分别还款</option>
          <option value="2" selected>所有结欠均以人民币还款</option>
        </select>
      </td>
    </tr>
  </table>

    <table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
      <tr>
        <td colspan=4 align="center"><strong >银行填写信息</strong></td>
      </tr>
    <tr>
        <td width="25%" class="BACKGROUND_a" align = "left">BKCC 营销活动编码</td>
        <td width="25%" class="BACKGROUND_c">
            <input name="BKCC" size=10 maxlength=9 value="" >        </td>
        <td width="25%" align = "left" class="BACKGROUND_a">BKBH 进件渠道编号</td>
        <td width="25%" class="BACKGROUND_c"><input name="BKBH" value="" size=20 maxlength=12></td>
	</tr>

      <tr>
        <td width="25%" align = "left" class="BACKGROUND_a">BKPCC 进件方式</td>
        <td width="25%" valign="middle" class="BACKGROUND_c"><input name="BKPCC" value="" size=10 maxlength=18></td>
        <td width="25%" class="BACKGROUND_a" align = "left">BKVIP 是否VIP</td>
        <td width="25%" class="BACKGROUND_c"> <select name="BKVIP">
            <option value="">请选择</option>
            <option value="Y" >是</option>
            <option value="N" selected >否</option>
          </select> </td>
      </tr>
      <tr>
        
        <td class="BACKGROUND_a" align = "left">IfBHDA是否分行审批</td>
        <td class="BACKGROUND_c"><select name="IfBHDA" id="IfBHDA">
          <option value="">请选择</option>
          <option value="Y">Y</option>
          <option value="N" selected>N</option>
                </select></td>
      </tr>

        <tr>
        <td colspan=4 align="center"><strong class="color">APS系统提供银行信息（带*号为必填项）</strong></td>
      </tr>

      <tr>
        <!--<td width="25%" class="BACKGROUND_a" align = "left">条形码</td>
        <td width="25%" class="BACKGROUND_c"><input name="ApplNum" value="" size=20 maxlength=16></td>-->

       <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>BKSTF 是否为员工卡</td>
        <td width="25%" class="BACKGROUND_c" colspan=3> <select name="BKSTF" onChange="javascript:changeBKSTF(this.value);">
            <option value="">请选择</option>
            <option value="Y" >是</option>
            <option value="N" selected >否</option>
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
      <td width="25%" align = "left" class="BACKGROUND_a">BOCCardHolder 是否本行信用卡现有持卡人</td>
      <td class="BACKGROUND_c" width="25%"> <select name="BOCCardHolder">
            <option value="">请选择</option>
            <option value="Y">是</option>
            <option value="N" selected>否</option>
          </select> </td>
      <td width="25%" align = "left" class="BACKGROUND_a">BOCCardBeginDate 持有本行信用卡的最早开始日期</td>
      <td width="25%" class="BACKGROUND_c"><input name="BOCCardBeginDate" value="" size=8 maxlength=8></td>
    </tr>
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>BOCCardLimit 主卡申请人在本行的总信用额度(人民币)</td>
      <td class="BACKGROUND_c" width="25%">
	<input name="BOCCardLimit" value="" size=20 maxlength=20>元</td>
      <td width="25%" align = "left" class="BACKGROUND_a">BOCCardAmnt 主卡的信用额度(人民币)</td>
      <td width="25%" class="BACKGROUND_c"><input name="BOCCardAmnt" id="BOCCardAmnt" value="" size=20 maxlength=20>
        元</td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">BOCCardNum 持有本行信用卡主卡的张数</td>
      <td class="BACKGROUND_c"><input name="BOCCardNum" value="" size=8 maxlength=8>
        张</td>
      <td align = "left" class="BACKGROUND_a">DPD30P24Mon 是否拖欠30天</td>
      <td class="BACKGROUND_c"><select name="DPD30P24Mon">
          <option value="">请选择</option>
          <option value="Y">是</option>
          <option value="N" selected>否</option>
        </select>      </td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">DPD60P24Mon 是否拖欠60天</td>
      <td class="BACKGROUND_c"><select name="DPD60P24Mon">
          <option value="">请选择</option>
          <option value="Y">是</option>
          <option value="N" selected>否</option>
        </select>      </td>
      <td align = "left" class="BACKGROUND_a">DPD90P24Mon 是否拖欠90天</td>
      <td class="BACKGROUND_c"><select name="DPD90P24Mon">
          <option value="">请选择</option>
          <option value="Y">是</option>
          <option value="N" selected>否</option>
        </select>      </td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">AppRanNum 客户随机数ID</td>
      <td class="BACKGROUND_c"><input name="AppRanNum" value="" size=3 maxlength=3></td>
      <td align = "left" class="BACKGROUND_a">FirstApprvdStrategyID 被批准时的策略标ID（S）</td>
      <td class="BACKGROUND_c"><input name="FirstApprvdStrategyID" value="" size=20 maxlength=20></td>
    </tr>
    <tr>
      <td align = "left" class="BACKGROUND_a">AppCnt 过去申请过的次数</td>
      <td class="BACKGROUND_c" ><input name="AppCnt" value="" size=8 maxlength=8></td>

      <td width="25%" align = "left" class="BACKGROUND_a">&nbsp;</td>
      <td width="25%" class="BACKGROUND_c" >&nbsp;</td>
    </tr>
    </table>

    <table id="AssetTableId" width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
        <td colspan=4 align="center"><strong class="color">审核信息（必填项）</strong></td>
    </tr>
    
 
    <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType1Id 可证明的资产类型1</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType1Id" name="CredAssetType1" onChange="javascript:changeValue1(this.value,'');">
            <option value="" selected>请选择</option>
            <option value="0" >无</option>
            <option value="21">自有房产</option>
            <option value="22">自有汽车</option>
            <option value="23">活期存款</option>
            <option value="24">定期存款</option>
            <option value="25">基金债券</option>
            <option value="26">人寿保险</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>可证明的资产价值1</td>
      <td class="BACKGROUND_c" width="25%"><span id="value1"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
        <tr>
       <td width="25%" align = "left" class="BACKGROUND_a">CredAssetType2Id 可证明的资产类型2</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType2Id" name="CredAssetType2" onChange="javascript:changeValue2(this.value,'');">
            <option value="" selected>请选择</option>
           <option value="0" >无</option>
            <option value="21">自有房产</option>
            <option value="22">自有汽车</option>
            <option value="23">活期存款</option>
            <option value="24">定期存款</option>
            <option value="25">基金债券</option>
            <option value="26">人寿保险</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a">可证明的资产价值2</td>
      <td class="BACKGROUND_c" width="25%"><span id="value2"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
    <tr>
       <td width="25%" align = "left" class="BACKGROUND_a">CredAssetType3Id 可证明的资产类型3</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType3Id" name="CredAssetType3" onChange="javascript:changeValue3(this.value,'');">
            <option value="" selected>请选择</option>
           <option value="0" >无</option>
            <option value="21">自有房产</option>
            <option value="22">自有汽车</option>
            <option value="23">活期存款</option>
            <option value="24">定期存款</option>
            <option value="25">基金债券</option>
            <option value="26">人寿保险</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a">可证明的资产价值3</td>
      <td class="BACKGROUND_c" width="25%"><span id="value3"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
    
   <!--   新加 -->
      <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType4Id 可证明的资产类型4</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType4Id" name="CredAssetType4" onChange="javascript:changeValue4(this.value,'');">
            <option value="" selected>请选择</option>
            <option value="0" >无</option>
            <option value="21">自有房产</option>
            <option value="22">自有汽车</option>
            <option value="23">活期存款</option>
            <option value="24">定期存款</option>
            <option value="25">基金债券</option>
            <option value="26">人寿保险</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>可证明的资产价值4</td>
      <td class="BACKGROUND_c" width="25%"><span id="value4"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P24Mon" value="" size=2 maxlength=1></td-->
    </tr>
	<tr>
	
	      <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType5Id 可证明的资产类型5</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType5Id" name="CredAssetType5" onChange="javascript:changeValue5(this.value,'');">
            <option value="" selected>请选择</option>
           <option value="0" >无</option>
            <option value="21">自有房产</option>
            <option value="22">自有汽车</option>
            <option value="23">活期存款</option>
            <option value="24">定期存款</option>
            <option value="25">基金债券</option>
            <option value="26">人寿保险</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>可证明的资产价值5</td>
      <td class="BACKGROUND_c" width="25%"><span id="value5"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P25Mon" value="" size=2 maxlength=1></td-->
    </tr>
	<tr>
	
	      <tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredAssetType6Id 可证明的资产类型6</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredAssetType6Id" name="CredAssetType6" onChange="javascript:changeValue6(this.value,'');">
            <option value="" selected>请选择</option>
           <option value="0" >无</option>
            <option value="21">自有房产</option>
            <option value="22">自有汽车</option>
            <option value="23">活期存款</option>
            <option value="24">定期存款</option>
            <option value="25">基金债券</option>
            <option value="26">人寿保险</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>可证明的资产价值6</td>
      <td class="BACKGROUND_c" width="25%"><span id="value6"></span></td>
      <!--td width="25%" class="BACKGROUND_c"><input name="DPD30P26Mon" value="" size=2 maxlength=1></td-->
    </tr>
    <!-- 新加可证明收入类型 -->
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome1 可证明的收入类型1</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredIncome1" name="CredIncome1" onChange="javascript:changeValue6(this.value,'');">
            <option value="" >请选择</option>
            <option value="11">11银行代发工资的存折/帐单</option>
            <option value="12">12个人所得税完税证明</option>
            <option value="13">13公积金扣缴凭证</option>
            <option value="14">14社会保险扣缴凭证</option>
            <option value="15">15知名企业开具的工资单</option>
            <option value="16">16地市级以上政府机关或事业单位人事部门开具的收入证明</option>
            <option value="17">17地区平均收入</option>
            <option value="18">18其他收入证明</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome1Value 可证明的收入类型值1</td>
      
      <td width="25%" class="BACKGROUND_c"><input id = "CredIncome1Value" name="CredIncome1Value" value="1300" size=20 maxlength=20></td>
    </tr>
    
    <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome2 可证明的收入类型2</td>
      <td class="BACKGROUND_c" width="25%"> <select id="CredIncome2" name="CredIncome2" onChange="javascript:changeValue6(this.value,'');">
            <option value="">请选择</option>
            <option value="11" >11银行代发工资的存折/帐单</option>
            <option value="12">12个人所得税完税证明</option>
            <option value="13">13公积金扣缴凭证</option>
            <option value="14">14社会保险扣缴凭证</option>
            <option value="15">15知名企业开具的工资单</option>
            <option value="16">16地市级以上政府机关或事业单位人事部门开具的收入证明</option>
            <option value="17">17地区平均收入</option>
            <option value="18">18其他收入证明</option>
          </select> </td>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>CredIncome2Value 可证明的收入类型值2</td>
      
      <td width="25%" class="BACKGROUND_c"><input id = "CredIncome2Value" name="CredIncome2Value" value="" size=20 maxlength=20></td>
    </tr>
    	<tr>

        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>AppiMcContactRelship 主卡人与联系人关系</td>
        <td width="25%" class="BACKGROUND_c"> <select name="AppiMcContactRelship"  >
            <option value="">请选择</option>
            <option value="11" selected>11父母</option>
            <option value="12" >12配偶</option>
            <option value="13" >13亲戚</option>
            <option value="14" >14其他</option>
          </select> </td>
     
    </tr>
    
	<tr>

        <td width="25%" class="BACKGROUND_a" align = "left"><font color="red">*</font>IncomeProof 是否提供收入证明文件</td>
        <td width="25%" class="BACKGROUND_c"> <select name="IncomeProof" onChange="javascript:changeIncomeProofValue(this.value,'');" >
            <option value="">请选择</option>
            <option value="Y" selected>是</option>
            <option value="N" >否</option>
          </select> </td>
     
    </tr>
	<tr>
       <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AprSpeGrpProof 客户分类</td>
      <td class="BACKGROUND_c" colspan=3><select name="AprSpeGrpProof" onChange="javascript:changeAprSpeGrpType(this.value);">
            <option value="">请选择</option>
            <option value="0" selected >普通客户</option>
            <option value="8100">8100重点行业客户</option>
            <option value="8200">8200重点客户</option>
            <option value="8410">8410高风险客户（有条件办卡类）</option>
            <option value="8420">8420高风险客户（拒绝类）</option>
						<option value="8500">8500学生客户</option>
						<option value="8600">8600中行集团员工客户</option>
						<option value="8700">8700推荐客户</option>
						<option value="8810">8810行内交叉销售客户(个人金融客户)</option>
						<option value="8820">8820行内交叉销售客户</option>
						<option value="8900">8900分行区域性特殊客户</option>
          </select></td>
	</tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AprPosLevl 可证明的职务级别</td>
      <td width="25%" class="BACKGROUND_c"><select name="AprPosLevl">
            <option value="">请选择</option>
            <option value="0" >缺失</option>
            <option value="1" selected>一般人员</option>
            <option value="2" >部门管理（或科级）</option>
            <option value="3">高级管理（或处级）</option>
            <option value="4">高层管理（或厅局级及以上）</option>
		</select>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>AprWrkSeniority 可证明的从业年限</td>
      <td width="25%" class="BACKGROUND_c"><input name="AprWrkSeniority" value="5" size=20 maxlength=5></td>
    </tr>
    <tr>
     <td width="25%" align = "left" class="BACKGROUND_a"><font color="red">*</font>IfHiRiskBiz 是否从事高风险行业</td>
      <td width="25%" class="BACKGROUND_c" colspan=3><select name="IfHiRiskBiz">
            <option value="">请选择</option>
            <option value="0" selected >否/缺失</option>
            <option value="1" >属于有条件办卡类</option>
            <option value="2">属于拒绝类</option>
		</select>		</td>
	  </tr>
	  
	  2014-1-12 2013-01-24 yyyyMMdd
	 <tr>
      <td align = "left" class="BACKGROUND_a">AppiMcHouseProperty 您是否拥有房产</td>
      <td class="BACKGROUND_c"><select name="AppiMcHouseProperty">
          <option value=""  >请选择</option>
          <option value="1">是</option>
          <option value="2" selected>否</option>
        </select>      </td>
      <td align = "left" class="BACKGROUND_a">AppiMcCarInd 您是否拥有机动车</td>
      <td class="BACKGROUND_c"><select name="AppiMcCarInd">
          <option value=""  >请选择</option>
          <option value="1">是</option>
          <option value="2" selected>否</option>
        </select>      </td>
    </tr>
	  
    <tr>
        <td colspan=4 align="center"><strong>APS系统提供外部数据</strong></td>
      </tr>
	   <tr>
       <td width="25%" align = "left" class="BACKGROUND_a">IfPBOCInfo 是否获取征信信息</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfPBOCInfo" onChange="javascript:changeIfPBOCInfoValue(this.value,'');">
             <option value="" >请选择</option>
            <option value="0" selected>缺失</option>
            <option value="1">匹配成功</option>
            <option value="2">匹配失败</option>
		</select>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">IfSSInfo 是否获取社保信息</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfSSInfo">
            <option value="" >请选择</option>
            <option value="0" selected>缺失</option>
            <option value="1" >匹配成功</option>
            <option value="2">匹配失败</option>
		</select></td>
    </tr>
	   <tr>
     <td width="25%" align = "left" class="BACKGROUND_a">IfMPSInfo 是否获取公安信息</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfMPSInfo">
             <option value="">请选择</option>
            <option value="0" selected>缺失</option>
            <option value="1" >匹配成功</option>
            <option value="2">匹配失败</option>
		</select>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">IfCBRCInfo 是否获取银联信息</td>
      <td width="25%" class="BACKGROUND_c"><select name="IfCBRCInfo">
            <option value="">请选择</option>
            <option value="0" selected>缺失</option>
            <option value="1" >匹配成功</option>
            <option value="2">匹配失败</option>
		</select></td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">LstSSPayDate 最近缴费年月</td>
      <td width="25%" class="BACKGROUND_c"><input name="LstSSPayDate" value="" size=6 maxlength=6>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CurrSSMonthPay 当前社保月缴款额</td>
      <td width="25%" class="BACKGROUND_c"><input name="CurrSSMonthPay" value="" size=20 maxlength=20></td>
    </tr>
	   <tr>
     <td width="25%" align = "left" class="BACKGROUND_a">MPSBirthDate 公安提供的出生日期</td>
      <td width="25%" class="BACKGROUND_c"><input name="MPSBirthDate" value="" size=8 maxlength=8>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">PayMonth 连续缴费的月数</td>
      <td width="25%" class="BACKGROUND_c"><input name="PayMonth" value="" size=20 maxlength=20></td>
    </tr>

	   <tr>
	     <td colspan="4" align = "left" class="BACKGROUND_a"><div align="center"><strong>征信贷记卡数据</strong></div></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">NumCCardAct 贷记卡帐户总数</td>
	     <td class="BACKGROUND_c"><input id="NumCCardActId" name="NumCCardAct" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">&nbsp;</td>
	     <td class="BACKGROUND_c">&nbsp;</td>
      </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CredCcardQcctNum 准贷记卡帐户数</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredCcardQcctNumId" name="CredCcardQcctNum" value="" size=8 maxlength=8>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">TotlCCardCLmt 贷记卡当月总信用额度</td>
      <td width="25%" class="BACKGROUND_c"><input id="TotlCCardCLmtId" name="TotlCCardCLmt" value="" size=20 maxlength=20>元</td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">TotlCCardOLmt 贷记卡当月总透支额度</td>
      <td width="25%" class="BACKGROUND_c"><input id="TotlCCardOLmtId" name="TotlCCardOLmt" value="" size=20 maxlength=20>元		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardFrtOpnDate 贷记卡最早开户日期</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardFrtOpnDateId" name="CCardFrtOpnDate" value="" size=8 maxlength=8>(YYYYMMDD)</td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardLstOpnDate 贷记卡最晚开户日期</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardLstOpnDateId" name="CCardLstOpnDate" value="" size=8 maxlength=8>(YYYYMMDD)		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardHiLimit 贷记卡单卡最高额度（人民币）</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardHiLimitId" name="CCardHiLimit" value="" size=20 maxlength=20>元</td>
    </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CredCcardL6M3Num 贷记卡近6个月M3+的次数</td>
	     <td class="BACKGROUND_c"><input id="CredCcardL6M3NumId" name="CredCcardL6M3Num" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">准贷记卡近3个月M3,M3+的次数</td>
	     <td class="BACKGROUND_c"><input id="CredQcardL3M3NumId" name="CredQcardL3M3Num" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CCardM0In3M 贷记卡近3个月M0的次数</td>
	     <td class="BACKGROUND_c"><input id="CCardM0In3MId" name="CCardM0In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">CCardM1In3M 贷记卡近3个月M1的次数</td>
	     <td class="BACKGROUND_c"><input id="CCardM1In3MId" name="CCardM1In3M" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CCardM2In3M 贷记卡近3个月M2+的次数</td>
	     <td class="BACKGROUND_c"><input id="CCardM2In3MId" name="CCardM2In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">&nbsp;</td>
	     <td class="BACKGROUND_c">&nbsp;</td>
      </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardM1In6M 贷记卡最近6个月M1的次数</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardM1In6MId" name="CCardM1In6M" value="" size=8 maxlength=8>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CCardM2In12M 贷记卡最近12个月M2或M2+的次数</td>
      <td width="25%" class="BACKGROUND_c"><input id="CCardM2In12MId" name="CCardM2In12M" value="" size=20 maxlength=20></td>
    </tr>
	   <tr>
	     <td colspan="4" align = "left" class="BACKGROUND_a"><div align="center"><strong>征信贷款数据</strong></div></td>
      </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CurrLoanBalance 贷款当前总余额</td>
      <td width="25%" class="BACKGROUND_c"><input id="CurrLoanBalanceId" name="CurrLoanBalance" value="" size=20 maxlength=20>元		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CredLoanContractOlmt 贷款合同金额</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredLoanContractOlmtId" name="CredLoanContractOlmt" value="" size=20 maxlength=20>元</td>
    </tr>
	   <tr>
      <td width="25%" align = "left" class="BACKGROUND_a">CredQcardL6M3Num 准贷记卡近6个月M3,M3+的次数</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredQcardL6M3NumId" name="CredQcardL6M3Num" value="" size=20 maxlength=20>		</td>
      <td width="25%" align = "left" class="BACKGROUND_a">CredCcardL6M2Num 贷记卡近6个月M2的次数</td>
      <td width="25%" class="BACKGROUND_c"><input id="CredCcardL6M2NumId" name="CredCcardL6M2Num" value="" size=20 maxlength=20>		</td>
    </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">LoanM0In3M 贷款近3个月M0的次数</td>
	     <td class="BACKGROUND_c"><input id="LoanM0In3MId" name="LoanM0In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">LoanM1In3M 贷款近3个月M1的次数</td>
	     <td class="BACKGROUND_c"><input id="LoanM1In3MId" name="LoanM1In3M" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">LoanM2In3M 贷款近3个月M2+的次数</td>
	     <td class="BACKGROUND_c"><input id="LoanM2In3MId" name="LoanM2In3M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">LoanM1In6M 贷款最近6个月M1的次数</td>
	     <td class="BACKGROUND_c"><input id="LoanM1In6MId" name="LoanM1In6M" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">LoanM2In12M 贷款最近12个月M2或M2+的次数</td>
	     <td class="BACKGROUND_c"><input id="LoanM2In12MId" name="LoanM2In12M" value="" size=20 maxlength=20></td>
	     <td align = "left" class="BACKGROUND_a">CredLoanL6M2Num 贷款近6个月M2,M2+的次数</td>
	     <td class="BACKGROUND_c"><input id="CredLoanL6M2NumId" name="CredLoanL6M2Num" value="" size=20 maxlength=20></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CLM1In3M 近6个月同时发生贷记卡和消费信贷逾期的次数</td>
	     <td class="BACKGROUND_c"><input name="CLM1In3M" id="CLM1In3M" value="" size="20" maxlength="20"></td>
	     <td align = "left" class="BACKGROUND_a">CredYearIncome 征信年收入</td>
	     <td class="BACKGROUND_c"><input name="CredYearIncome" id="CredYearIncome" value="" size="20" maxlength="20"></td>
      </tr>
      <tr>
	     <td align = "left" class="BACKGROUND_a">ProvFundFirstLimit 个人住房公积金月缴存额</td>
	     <td class="BACKGROUND_c"><input id="ProvFundFirstLimitId" name="ProvFundFirstLimit" value="" size=20 maxlength=20></td>
         <td align = "left" class="BACKGROUND_a">CurrLoanMthlyPay 贷款当月还款总额</td>
	     <td class="BACKGROUND_c"><input id="CurrLoanMthlyPayId" name="CurrLoanMthlyPay" value="" size="20" maxlength="20"></td>
      </tr>
	   <tr>
	     <td colspan="4" align = "left" class="BACKGROUND_a"><div align="center"><strong>其他核查信息</strong></div></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">ReservedField2 人工干预</td>
	     <td class="BACKGROUND_c"><select name="ReservedField2" id="ReservedField2">
           <option value="">请选择</option>
           <option value="0" selected>否</option>
           <option value="1">具备人行征信有逻辑问题</option>
           <option value="2">电话核实有逻辑问题</option>
           <option value="3">其他问题</option>
                                    </select></td>
	     <td align = "left" class="BACKGROUND_a">BlkChkResult 黑名单检测结果</td>
	     <td class="BACKGROUND_c"><select name="BlkChkResult" id="BlkChkResult">
           <option value="">请选择</option>
           <option value="0">不通过</option>
           <option value="1" selected>通过</option>
                  </select></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">EomChkResult EOM检测结果</td>
	     <td class="BACKGROUND_c"><select name="EomChkResult" id="EomChkResult">
           <option value="">请选择</option>
           <option value="0">不通过</option>
           <option value="1" selected>通过</option>
           <option value="9">检测中</option>
                  </select></td>
	     <td align = "left" class="BACKGROUND_a">DupChkResult 重复申请件检测结果</td>
	     <td class="BACKGROUND_c"><select name="DupChkResult" id="DupChkResult">
           <option value="">请选择</option>
           <option value="0">不通过</option>
           <option value="1" selected>通过</option>
         </select></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">CgryChkResult 公司灰名单检测结果</td>
	     <td class="BACKGROUND_c"><select name="CgryChkResult" id="CgryChkResult">
           <option value="">请选择</option>
           <option value="0">不通过</option>
           <option value="1" selected>通过</option>
         </select></td>
	     <td align = "left" class="BACKGROUND_a">PgryChkResult 个人灰名单检测结果</td>
	     <td class="BACKGROUND_c"><select name="PgryChkResult" id="PgryChkResult">
           <option value="">请选择</option>
           <option value="0">不通过</option>
           <option value="1" selected>通过</option>
         </select></td>
      </tr>
	   <tr>
	     <td align = "left" class="BACKGROUND_a">A2rChkResult 分行通知批准转拒绝检测结果</td>
	     <td class="BACKGROUND_c"><select name="A2rChkResult" id="A2rChkResult">
           <option value="">请选择</option>
           <option value="0">不通过</option>
           <option value="1" selected>通过</option>
         </select></td>

	     <td align = "left" class="BACKGROUND_a">AT4300 vip等级</td>
			<td>                                        
			<select name="AT4300" id="AT4300">
	          <option value="">请选择</option>
			  <option value="1">1美运</option>
	          <option value="2">2无限</option>
	          <option value="5">5至尊</option>
	          <option value="6" selected>6精英</option>
	          <option value="C" >C VIP</option>
			  <option value="0" >0 非VIP</option>
			  </select>
			</td>
      </tr>
<tr>
<td align = "left" class="BACKGROUND_a">BH 渠道编号</td>
        <td class="BACKGROUND_c"><select name="BH" id="BH">
          <option value="">请选择</option>
          <option value="4120264012">4120264012new new </option>
	  <option value="4324445000">4324445000苏州</option>
          <option value="4335143000">4335143000宁波</option>
          <option value="4900004000">4900004000总行</option>
          <option value="4110142000" selected>4110142000北京</option>
          <option value="4373810000" >4373810000山东</option>
          <option value="4355481000">4355481000福建</option>
          <option value="4447504001">4447504001广东</option>
          <option value="4310303999">4310303999上海</option>
          <option value="4508642000">4508642000重庆</option>
          <option value="4335129000">4335129000浙江</option>
          <option value="4487669000">4487669000深圳</option>
          <option value="4416243111">4416243111河南</option>
          <option value="4141041000">4141041000山西</option>
          <option value="4222208000">4222208000吉林</option>
          <option value="4324433001">4324433001江苏</option>
          <option value="4120202000">4120202000天津</option>
          <option value="4540600000">4540600000西藏</option>
          <option value="4130740999">4130740999河北</option>
          <option value="4151405000">4151405000内蒙古</option>
          <option value="4211785000">4211785000辽宁</option>
          <option value="4232465000">4232465000黑龙江</option>
          <option value="4613016070">4613016070陕西</option>
          <option value="4623251001">4623251001甘肃</option>
          <option value="4643347000">4643347000宁夏</option>
          <option value="4518631001">4518631001四川</option>
          <option value="4633469000">4633469000青海</option>
          <option value="4653600000">4653600000新疆</option>
          <option value="4344899000">4344899000安徽</option>
          <option value="4426405000">4426405000湖北</option>
          <option value="4436955000">4436955000湖南</option>
          <option value="4367370001">4367370001江西</option>
          <option value="4467806000">4467806000海南</option>
          <option value="4458051210">4458051210广西</option>
          <option value="4528882039">4528882039贵州</option>
          <option value="4539146000">4539146000云南</option>
			</select></td>
			<td class="BACKGROUND_a" align = "left">AT4320所属机构号(一级分行)</td><td><select name="AT4320" id="AT4320">
          <option value="">请选择</option>
	  <option value="4324433001">苏州</option>
          <option value="4335143000">宁波</option>
          <option value="4900004000">总行</option>
          <option value="4110142000" selected>北京</option>
          <option value="4373810000" >山东</option>
          <option value="4355481000">福建</option>
          <option value="4447504001">广东</option>
          <option value="4310303999">上海</option>
          <option value="4508642000">重庆</option>
          <option value="4335129000">浙江</option>
          <option value="4487669000">深圳</option>
          <option value="4416243111">河南</option>
          <option value="4141041000">山西</option>
          <option value="4222208000">吉林</option>
          <option value="4324433001">江苏</option>
          <option value="4120202000">天津</option>
          <option value="4540600000">西藏</option>
          <option value="4130740999">河北</option>
          <option value="4151405000">内蒙古</option>
          <option value="4211785000">辽宁</option>
          <option value="4232465000">黑龙江</option>
          <option value="4613016070">陕西</option>
          <option value="4623251001">甘肃</option>
          <option value="4643347000">宁夏</option>
          <option value="4518631001">四川</option>
          <option value="4633469000">青海</option>
          <option value="4653600000">新疆</option>
          <option value="4344899000">安徽</option>
          <option value="4426405000">湖北</option>
          <option value="4436955000">湖南</option>
          <option value="4367370001">江西</option>
          <option value="4467806000">海南</option>
          <option value="4458051210">广西</option>
          <option value="4528882039">贵州</option>
          <option value="4539146000">云南</option>
	  	  <option value="999">挑战分行</option>
                                </select>
	</td> 
			</tr>
			</table>
			<b><span id="stateBut1" onclick="$use1()">人行信息展开</span></b>
			<div  id="class1content1" style="">
			<table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
			
 <tr><td class="BACKGROUND_a" >A01001是否获取到征信报告：(Y/N)                               <input type='text' id='A01001' name='A01001' value='y'></td> 
    <td class="BACKGROUND_a" >A01002征信报告中是否具有征信信息：(Y/N)                           <input type='text' id='A01002' name='A01002' value='y'></td>
    <td class="BACKGROUND_a" >A02001是否我行信用卡客户：(Y/N)                               <input type='text' id='A02001' name='A02001' value='n'></td> 
    <td class="BACKGROUND_a" >A02002我行客户信用额度：                                     <input type='text' id='A02002' name='A02002' value='0'></td></tr>  
<tr><td class="BACKGROUND_a" >A04002行内个人金融资产类客户等级：                           
		<select name="A04002" id="A04002">
          <option value="">请选择</option>
			<option value="00" selected>普通客户</option>
          <option value="04">中银理财客户</option>
          <option value="05">特殊理财客户</option>
          <option value="06" >财富管理客户</option>
          <option value="08" >私人银行客户</option>

		  </select>
</td> 
	
    <td class="BACKGROUND_a" >A04003行内个人金融资产类客户近三个月月日均资产余额：         <input type='text' id='A04003' name='A04003' value='0'></td> 
    <td class="BACKGROUND_a" >A05001养老保险金参保地                                       <input type='text' id='A05001' name='A05001' value='0'></td> 
    <td class="BACKGROUND_a" >A05002养老保险金参保日期                                     <input type='text' id='A05002' name='A05002' value='20140608'></td></tr> 
<tr><td class="BACKGROUND_a" >A05003养老保险金累计缴费月数                                 <input type='text' id='A05003' name='A05003' value='8'></td> 
    <td class="BACKGROUND_a" >A05004养老保险金参加工作月份                                 <input type='text' id='A05004' name='A05004' value='20130602'></td> 
    <td class="BACKGROUND_a" >A05005养老保险金缴费状态                                     <input type='text' id='A05005' name='A05005' value='1'></td> 
    <td class="BACKGROUND_a" >A05006养老保险金个人缴费基数                                 <input type='text' id='A05006' name='A05006' value='1200'></td></tr> 
<tr><td class="BACKGROUND_a" >A05007养老保险金本月缴费金额                                 <input type='text' id='A05007' name='A05007' value='800'></td> 
    <td class="BACKGROUND_a" >A05008养老保险金信息更新日期                                 <input type='text' id='A05008' name='A05008' value='20140203'></td> 
    <td class="BACKGROUND_a" >A05009养老保险金缴费单位                                     <input type='text' id='A05009' name='A05009' value='aaa'></td> 
    <td class="BACKGROUND_a" >A05010养老保险金中断或终止缴费原因                           <input type='text' id='A05010' name='A05010' value='aaa'></td></tr> 
<tr><td class="BACKGROUND_a" >A06001住房公积金参缴地：                                     <input type='text' id='A06001' name='A06001' value='北京'></td>      
    <td class="BACKGROUND_a" >A06002住房公积金初缴月份：                                   <input type='text' id='A06002' name='A06002' value='06'></td>      
    <td class="BACKGROUND_a" >A06003住房公积金缴至月份：                                   <input type='text' id='A06003' name='A06003' value='201601'></td>      
    <td class="BACKGROUND_a" >A06004住房公积金缴费状态：                                   <input type='text' id='A06004' name='A06004' value=1'></td></tr> 
<tr><td class="BACKGROUND_a" >A06005住房公积金月缴存额：                                   <input type='text' id='A06005' name='A06005' value='800'></td>      
    <td class="BACKGROUND_a" >A06006住房公积金个人缴存比例：                               <input type='text' id='A06006' name='A06006' value='0.2'></td>      
    <td class="BACKGROUND_a" >A06007住房公积金单位缴存比例：                               <input type='text' id='A06007' name='A06007' value='0.8'></td>      
    <td class="BACKGROUND_a" >A06008住房公积金缴费单位                                     <input type='text' id='A06008' name='A06008' value='北京首航'></td></tr> 
<tr><td class="BACKGROUND_a" >A06009住房公积金信息更新日期                                 <input type='text' id='A06009' name='A06009' value='20141011'></td>      
    <td class="BACKGROUND_a" >A07001近3个月同时发生信用卡和贷款逾期的次数：                <input type='text' id='A07001' name='A07001' value='0' ></td>      
    <td class="BACKGROUND_a" >A07002近6个月同时发生信用卡和贷款逾期的次数：                <input type='text' id='A07002' name='A07002' value='0' ></td>      
    <td class="BACKGROUND_a" >A07003近12个月同时发生信用卡和贷款逾期的次数：               <input type='text' id='A07003' name='A07003' value='0' ></td></tr> 
<tr><td class="BACKGROUND_a" >A07004近24个月同时发生信用卡和贷款逾期的次数：               <input type='text' id='A07004' name='A07004' value='0' ></td>      
    <td class="BACKGROUND_a" >A08001贷记卡发卡机构数：                                     <input type='text' id='A08001' name='A08001' value='0'></td>      
    <td class="BACKGROUND_a" >A08002贷记卡账户数：                                         <input type='text' id='A08002' name='A08002' value='0'></td>      
    <td class="BACKGROUND_a" >A08003贷记卡非正常账户数：                                   <input type='text' id='A08003' name='A08003' value='0'></td></tr> 
<tr><td class="BACKGROUND_a" >A08004贷记卡最早开户日期：                                   <input type='text' id='A08004' name='A08004' value='0'></td>      
    <td class="BACKGROUND_a" >A08005贷记卡授信总额：                                       <input type='text' id='A08005' name='A08005' value='0'></td>      
    <td class="BACKGROUND_a" >A08006贷记卡总已用额度：                                     <input type='text' id='A08006' name='A08006' value='0'></td>      
    <td class="BACKGROUND_a" >A08007贷记卡最近6个月平均使用额度：                          <input type='text' id='A08007' name='A08007' value='0'></td></tr> 
<tr><td class="BACKGROUND_a" >A08008贷记卡单家行最高额度(人民币)：                         <input type='text' id='A08008' name='A08008' value='0'></td>      
    <td class="BACKGROUND_a" >A08009贷记卡单家行最低授信额(人民币)：                       <input type='text' id='A08009' name='A08009' value='0'></td>      
    <td class="BACKGROUND_a" >A08010贷记卡卡龄6个月以上最高额度(人民币)：                  <input type='text' id='A08010' name='A08010' value='0'></td>      
    <td class="BACKGROUND_a" >A08011贷记卡他行最高额度(人民币)：                           <input type='text' id='A08011' name='A08011' value='0'></td></tr> 
<tr><td class="BACKGROUND_a" >A08012贷记卡他行10万及以下第一高额度(人民币)：               <input type='text' id='A08012' name='A08012' value='0' ></td>      
    <td class="BACKGROUND_a" >A08013贷记卡他行10万及以下第二高额度(人民币)：               <input type='text' id='A08013' name='A08013' value='0' ></td>      
    <td class="BACKGROUND_a" >A08014贷记卡当前逾期总额：                                   <input type='text' id='A08014' name='A08014' value='0'></td>      
    </tr> 
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近3个月M1</td>
    	 <td class="BACKGROUND_a" >A09001贷记卡近3个月M1的次数：                                <input type='text' id='A09001' name='A09001' value='0'></td>
    	 <td class="BACKGROUND_a">A11001准贷记卡近3个月M1的次数：                              <input type='text' id='A11001' name='A11001' value='0'></td>
    	 <td class="BACKGROUND_a">A13001贷款近3个月M1的次数：                                  <input type='text' id='A13001' name='A13001' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近3个月M2</td>
    	<td class="BACKGROUND_a" >A09002贷记卡近3个月M2的次数：                                <input type='text' id='A09002' name='A09002' value='0'></td>
    	<td class="BACKGROUND_a">A11002准贷记卡近3个月M2的次数：                              <input type='text' id='A11002' name='A11002' value='0'></td>
    	<td class="BACKGROUND_a">A13002贷款近3个月M2的次数：                                  <input type='text' id='A13002' name='A13002' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近3个月M3</td>
    	<td class="BACKGROUND_a" >A09003贷记卡近3个月M3的次数：                                <input type='text' id='A09003' name='A09003' value='0'></td>
    	<td class="BACKGROUND_a">A11003准贷记卡近3个月M3的次数：                              <input type='text' id='A11003' name='A11003' value='0'></td>
    	<td class="BACKGROUND_a">A13003贷款近3个月M3的次数：                                  <input type='text' id='A13003' name='A13003' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近3个月M4</td>
    	<td class="BACKGROUND_a" >A09004贷记卡近3个月M4的次数：                                <input type='text' id='A09004' name='A09004' value='0'></td>
    	<td class="BACKGROUND_a">A11004准贷记卡近3个月M4的次数：                              <input type='text' id='A11004' name='A11004' value='0'></td>
    	<td class="BACKGROUND_a">A13004贷款近3个月M4的次数：                                  <input type='text' id='A13004' name='A13004' value='0'></td> 
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近3个月M5</td>
    	 <td class="BACKGROUND_a" >A09005贷记卡近3个月M5的次数：                                <input type='text' id='A09005' name='A09005' value='0'></td>
    	<td class="BACKGROUND_a">A11005准贷记卡近3个月M5的次数：                              <input type='text' id='A11005' name='A11005' value='0'></td>
    	<td class="BACKGROUND_a">A13005贷款近3个月M5的次数：                                  <input type='text' id='A13005' name='A13005' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近3个月M6</td>
    	 <td class="BACKGROUND_a" >A09006贷记卡近3个月M6的次数：                                <input type='text' id='A09006' name='A09006' value='0'></td>
    	 <td class="BACKGROUND_a">A11006准贷记卡近3个月M6的次数：                              <input type='text' id='A11006' name='A11006' value='0'></td>
    	 <td class="BACKGROUND_a">A13006贷款近3个月M6的次数：                                  <input type='text' id='A13006' name='A13006' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近3个月M7</td>
    	<td class="BACKGROUND_a" >A09007贷记卡近3个月M7的次数：                                <input type='text' id='A09007' name='A09007' value='0'></td> 
    	<td class="BACKGROUND_a">A11007准贷记卡近3个月M7的次数：                              <input type='text' id='A11007' name='A11007' value='0'></td>   
    	<td class="BACKGROUND_a">A13007贷款近3个月M7的次数：                                  <input type='text' id='A13007' name='A13007' value='0'></td>   
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近6个月M1</td>
    	<td class="BACKGROUND_a">A09008贷记卡近6个月M1的次数：                                <input type='text' id='A09008' name='A09008' value='0'></td>
    	<td class="BACKGROUND_a">A11008准贷记卡近6个月M1的次数：                              <input type='text' id='A11008' name='A11008' value='0'></td>
    	<td class="BACKGROUND_a">A13008贷款近6个月M1的次数：                                  <input type='text' id='A13008' name='A13008' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近6个月M2</td>
    	<td class="BACKGROUND_a" >A09009贷记卡近6个月M2的次数：                                <input type='text' id='A09009' name='A09009' value='0'></td>
    	<td class="BACKGROUND_a">A11009准贷记卡近6个月M2的次数：                              <input type='text' id='A11009' name='A11009' value='0'></td>
    	<td class="BACKGROUND_a">A13009贷款近6个月M2的次数：                                  <input type='text' id='A13009' name='A13009' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近6个月M3</td>
    	<td class="BACKGROUND_a">A09010贷记卡近6个月M3的次数：                                <input type='text' id='A09010' name='A09010' value='0'></td>
    	<td class="BACKGROUND_a">A11010准贷记卡近6个月M3的次数：                              <input type='text' id='A11010' name='A11010' value='0'></td>
    	<td class="BACKGROUND_a">A13010贷款近6个月M3的次数：                                  <input type='text' id='A13010' name='A13010' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近6个月M4</td>
    	<td class="BACKGROUND_a">A09011贷记卡近6个月M4的次数：                                <input type='text' id='A09011' name='A09011' value='0'></td>
    	<td class="BACKGROUND_a">A11011准贷记卡近6个月M4的次数：                              <input type='text' id='A11011' name='A11011' value='0'></td>
    	<td class="BACKGROUND_a">A13011贷款近6个月M4的次数：                                  <input type='text' id='A13011' name='A13011' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近6个月M5</td>
    	<td class="BACKGROUND_a">A09012贷记卡近6个月M5的次数：                                <input type='text' id='A09012' name='A09012' value='0'></td> 
    	<td class="BACKGROUND_a">A11012准贷记卡近6个月M5的次数：                              <input type='text' id='A11012' name='A11012' value='0'></td>
    	<td class="BACKGROUND_a">A13012贷款近6个月M5的次数：                                  <input type='text' id='A13012' name='A13012' value='0'></td>
    </tr>
     <tr>
    	<td class="BACKGROUND_a" style="color: red">近6个月M6</td>
    	<td class="BACKGROUND_a">A09013贷记卡近6个月M6的次数：                                <input type='text' id='A09013' name='A09013' value='0'></td>
    	<td class="BACKGROUND_a">A11013准贷记卡近6个月M6的次数：                              <input type='text' id='A11013' name='A11013' value='0'></td>
    	<td class="BACKGROUND_a">A13013贷款近6个月M6的次数：                                  <input type='text' id='A13013' name='A13013' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近6个月M7</td>
    	<td class="BACKGROUND_a">A09014贷记卡近6个月M7的次数：                                <input type='text' id='A09014' name='A09014' value='0'></td>
    	<td class="BACKGROUND_a">A11014准贷记卡近6个月M7的次数：                              <input type='text' id='A11014' name='A11014' value='0'></td>
    	<td class="BACKGROUND_a">A13014贷款近6个月M7的次数：                                  <input type='text' id='A13014' name='A13014' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近12个月M1</td>
    	 <td class="BACKGROUND_a">A09015贷记卡近12个月M1的次数：                               <input type='text' id='A09015' name='A09015' value='0'></td>
    	 <td class="BACKGROUND_a">A11015准贷记卡近12个月M1的次数：                             <input type='text' id='A11015' name='A11015' value='0'></td>
   		 <td class="BACKGROUND_a">A13015贷款近12个月M1的次数：                                 <input type='text' id='A13015' name='A13015' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近12个月M2</td>
    	<td class="BACKGROUND_a">A09016贷记卡近12个月M2的次数：                               <input type='text' id='A09016' name='A09016' value='0'></td>     
   		 <td class="BACKGROUND_a">A11016准贷记卡近12个月M2的次数：                             <input type='text' id='A11016' name='A11016' value='0'></td>
   		 <td class="BACKGROUND_a">A13016贷款近12个月M2的次数：                                 <input type='text' id='A13016' name='A13016' value='0'></td>
    </tr>
 	<tr>
    	<td class="BACKGROUND_a" style="color: red">近12个月M3</td>
    	<td class="BACKGROUND_a">A09017贷记卡近12个月M3的次数：                               <input type='text' id='A09017' name='A09017' value='0'></td>     
    	<td class="BACKGROUND_a">A11017准贷记卡近12个月M3的次数：                             <input type='text' id='A11017' name='A11017' value='0'></td>       
   		<td class="BACKGROUND_a">A13017贷款近12个月M3的次数：                                 <input type='text' id='A13017' name='A13017' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近12个月M4</td>
    	<td class="BACKGROUND_a">A09018贷记卡近12个月M4的次数：                               <input type='text' id='A09018' name='A09018' value='0'></td>
		<td class="BACKGROUND_a">A11018准贷记卡近12个月M4的次数：                             <input type='text' id='A11018' name='A11018' value='0'></td>
		<td class="BACKGROUND_a">A13018贷款近12个月M4的次数：                                 <input type='text' id='A13018' name='A13018' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近12个月M5</td>
    	<td class="BACKGROUND_a">A09019贷记卡近12个月M5的次数：                               <input type='text' id='A09019' name='A09019' value='0'></td>      
   		<td class="BACKGROUND_a">A11019准贷记卡近12个月M5的次数：                             <input type='text' id='A11019' name='A11019' value='0'></td>       
   	    <td class="BACKGROUND_a">A13019贷款近12个月M5的次数：                                 <input type='text' id='A13019' name='A13019' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近12个月M6</td>
    	<td class="BACKGROUND_a">A09020贷记卡近12个月M6的次数：                               <input type='text' id='A09020' name='A09020' value='0'></td>      
   		<td class="BACKGROUND_a">A11020准贷记卡近12个月M6的次数：                             <input type='text' id='A11020' name='A11020' value='0'></td>       
   		<td class="BACKGROUND_a">A13020贷款近12个月M6的次数：                                 <input type='text' id='A13020' name='A13020' value='0'></td> 
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近12个月M7</td>
    	<td class="BACKGROUND_a">A09021贷记卡近12个月M7的次数：                               <input type='text' id='A09021' name='A09021' value='0'></td>      
  		<td class="BACKGROUND_a">A11021准贷记卡近12个月M7的次数：                             <input type='text' id='A11021' name='A11021' value='0'></td>      
   	   <td class="BACKGROUND_a">A13021贷款近12个月M7的次数：                                 <input type='text' id='A13021' name='A13021' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近24个月M1</td>
    	<td class="BACKGROUND_a">A09022贷记卡近24个月M1的次数：                               <input type='text' id='A09022' name='A09022' value='0'></td>
		<td class="BACKGROUND_a">A11022准贷记卡近24个月M1的次数：                             <input type='text' id='A11022' name='A11022' value='0'></td> 
		<td class="BACKGROUND_a">A13022贷款近24个月M1的次数：                                 <input type='text' id='A13022' name='A13022' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近24个月M2</td>
    	<td class="BACKGROUND_a">A09023贷记卡近24个月M2的次数：                               <input type='text' id='A09023' name='A09023' value='0'></td>     
   		<td class="BACKGROUND_a">A11023准贷记卡近24个月M2的次数：                             <input type='text' id='A11023' name='A11023' value='0'></td>       
   		<td class="BACKGROUND_a">A13023贷款近24个月M2的次数：                                 <input type='text' id='A13023' name='A13023' value='0'></td>
    </tr>
     <tr>
    	<td class="BACKGROUND_a" style="color: red">近24个月M3</td>
    	<td class="BACKGROUND_a">A09024贷记卡近24个月M3的次数：                               <input type='text' id='A09024' name='A09024' value='0'></td>      
    	<td class="BACKGROUND_a">A11024准贷记卡近24个月M3的次数：                             <input type='text' id='A11024' name='A11024' value='0'></td>       
 	   <td class="BACKGROUND_a">A13024贷款近24个月M3的次数：                                 <input type='text' id='A13024' name='A13024' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近24个月M4</td>
    	<td class="BACKGROUND_a">A09025贷记卡近24个月M4的次数：                               <input type='text' id='A09025' name='A09025' value='0'></td>      
   	    <td class="BACKGROUND_a">A11025准贷记卡近24个月M4的次数：                             <input type='text' id='A11025' name='A11025' value='0'></td>       
    	<td class="BACKGROUND_a">A13025贷款近24个月M4的次数：                                 <input type='text' id='A13025' name='A13025' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近24个月M5</td>
    	<td class="BACKGROUND_a">A09026贷记卡近24个月M5的次数：                               <input type='text' id='A09026' name='A09026' value='0'></td>
		<td class="BACKGROUND_a">A11026准贷记卡近24个月M5的次数：                             <input type='text' id='A11026' name='A11026' value='0'></td>
		<td class="BACKGROUND_a">A13026贷款近24个月M5的次数：                                 <input type='text' id='A13026' name='A13026' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近24个月M6</td>
    	<td class="BACKGROUND_a">A09027贷记卡近24个月M6的次数：                               <input type='text' id='A09027' name='A09027' value='0'></td>    
   		 <td class="BACKGROUND_a">A11027准贷记卡近24个月M6的次数：                             <input type='text' id='A11027' name='A11027' value='0'></td>    
   		 <td class="BACKGROUND_a">A13027贷款近24个月M6的次数：                                 <input type='text' id='A13027' name='A13027' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近24个月M7</td>
    	 <td class="BACKGROUND_a">A09028贷记卡近24个月M7的次数：                               <input type='text' id='A09028' name='A09028' value='0'></td> 
    	 <td class="BACKGROUND_a">A11028准贷记卡近24个月M7的次数：                             <input type='text' id='A11028' name='A11028' value='0'></td>
    	  <td class="BACKGROUND_a">A13028贷款近24个月M7的次数：                                 <input type='text' id='A13028' name='A13028' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">近5年前36个月逾期最高持续月数</td>
    	<td class="BACKGROUND_a">A09029贷记卡近5年前36个月逾期最高持续月数：                  <input type='text' id='A09029' name='A09029' value='0'></td>      
   		<td class="BACKGROUND_a">A11029准贷记卡近5年前36个月逾期最高持续月数：                <input type='text' id='A11029' name='A11029' value='0'></td>      
  		<td class="BACKGROUND_a">A13029贷款近5年前36个月逾期最高持续月数：                    <input type='text' id='A13029' name='A13029' value='0'></td>
    </tr>
    <tr>
    	<td class="BACKGROUND_a" style="color: red">当月最高逾期级别</td>
    	<td class="BACKGROUND_a">A09030贷记卡当月最高逾期级别：                               <input type='text' id='A09030' name='A09030' value='0'></td>
		<td class="BACKGROUND_a">A11030准贷记卡当月最高逾期级别：                             <input type='text' id='A11030' name='A11030' value='0'></td>
		<td class="BACKGROUND_a">A13030贷款当月最高逾期级别：                                 <input type='text' id='A13030' name='A13030' value='0'></td>
    </tr>
<tr>      
    <td class="BACKGROUND_a">A10001准贷记卡发卡机构数：                                   <input type='text' id='A10001' name='A10001' value='0'></td>      
    <td class="BACKGROUND_a">A10002准贷记卡账户数：                                       <input type='text' id='A10002' name='A10002' value='0'></td>      
    <td class="BACKGROUND_a">A10003准贷记卡非正常账户数：                                 <input type='text' id='A10003' name='A10003' value='0'></td>
    <td class="BACKGROUND_a">发卡账户数<input type='text' id='A15033' name='A15033' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A10004准贷记卡最早开户日期：                                 <input type='text' id='A10004' name='A10004' value='20050305'></td>      
    <td class="BACKGROUND_a">A10005准贷记卡授信总额：                                     <input type='text' id='A10005' name='A10005' value='0'></td>      
    <td class="BACKGROUND_a">A10006准贷记卡总透支余额：                                   <input type='text' id='A10006' name='A10006' value='0'></td>      
    <td class="BACKGROUND_a">A10007准贷记卡最近6个月平均透支余额：                        <input type='text' id='A10007' name='A10007' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A10008准贷记卡单家行最高额度(人民币)：                       <input type='text' id='A10008' name='A10008' value='0'></td>      
    <td class="BACKGROUND_a">A10009准贷记卡单家行最低授信额(人民币)：                     <input type='text' id='A10009' name='A10009' value='0'></td>      
    <td class="BACKGROUND_a">A10010准贷记卡卡龄6个月以上最高额度(人民币)：                <input type='text' id='A10010' name='A10010' value='0'></td>      
    <td class="BACKGROUND_a">A10011贷记卡他行最高额度(人民币)：                           <input type='text' id='A10011' name='A10011' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A10012贷记卡他行10万及以下第一高额度(人民币)：               <input type='text' id='A10012' name='A10012' value='0'></td>      
    <td class="BACKGROUND_a">A10013贷记卡他行10万及以下第二高额度(人民币)：               <input type='text' id='A10013' name='A10013' value='0'></td>      
    <td class="BACKGROUND_a">A10014准贷记卡当前逾期总额：                                 <input type='text' id='A10014' name='A10014' value='0'></td>    
   </tr> 
<tr> 
    <td class="BACKGROUND_a">A08017:贷记卡他行10万及以下第三高额度(人民币)：<input type='text' id='A08017' name='A08017' value='0'></td>       
    <td class="BACKGROUND_a">A08018:贷记卡他行10万及以下平均额度(人民币) <input type='text' id='A08018' name='A08018' value='0'></td>
    <td class="BACKGROUND_a">A10017:准贷记卡他行10万及以下第三高额度(人民币)： <input type='text' id='A10017' name='A10017' value='0'></td> 
    <td class="BACKGROUND_a">A10018:准贷记卡他行10万及以下平均额度(人民币)：<input type='text' id='A10018' name='A10018' value='0'></td>       
</tr> 
<tr>      
    <td class="BACKGROUND_a">A12001贷款机构数：                                           <input type='text' id='A12001' name='A12001' value='0'></td>      
    <td class="BACKGROUND_a">A12002贷款总笔数：                                           <input type='text' id='A12002' name='A12002' value='0'></td>      
    <td class="BACKGROUND_a">A12003贷款非正常账户数：                                     <input type='text' id='A12003' name='A12003' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A12004贷款合同总额：                                         <input type='text' id='A12004' name='A12004' value='0'></td>      
    <td class="BACKGROUND_a">A12005贷款总余额：                                           <input type='text' id='A12005' name='A12005' value='0'></td>      
    <td class="BACKGROUND_a">A12006贷款最近6个月平均应还款：                              <input type='text' id='A12006' name='A12006' value='0'></td>      
    <td class="BACKGROUND_a">A12007贷款本月应还款总额：                                   <input type='text' id='A12007' name='A12007' value='0'></td></tr> 
<tr><td class="BACKGROUND_a">A12008贷款最近连续正常还款期数>=3的本月应还款总额：          <input type='text' id='A12008' name='A12008' value='0'></td>      
    <td class="BACKGROUND_a">A12009贷款当前逾期总额                                       <input type='text' id='A12009' name='A12009' value='0'></td>      
    <td class="BACKGROUND_a">A12010贷款（31-个人助学贷款）的笔数：                        <input type='text' id='A12010' name='A12010' value='0'></td> 
    <td class="BACKGROUND_a">A15002最近1个月内的查询机构数-信用卡审批：                   <input type='text' id='A15002' name='A15002' value='0'></td>     
    </tr> 
<tr>       
    <td class="BACKGROUND_a">A14001担保贷款五级分类为非正常的总数：                       <input type='text' id='A14001' name='A14001' value='0'></td>       
    <td class="BACKGROUND_a">A14002担保贷款五级分类为非正常的累计本金余额：               <input type='text' id='A14002' name='A14002' value='0'></td>       
    <td class="BACKGROUND_a">A15001最近1个月内的查询机构数-贷款审批：                     <input type='text' id='A15001' name='A15001' value='0'></td>
    <td class="BACKGROUND_a">A15003最近1个月内的查询次数-贷款审批：                       <input type='text' id='A15003' name='A15003' value='0'></td></tr>  
<tr>       
    <td class="BACKGROUND_a">A15004最近1个月内的查询次数-信用卡审批：                     <input type='text' id='A15004' name='A15004' value='0'></td>       
    <td class="BACKGROUND_a">A15005最近2年内的查询次数-贷后管理：                         <input type='text' id='A15005' name='A15005' value='0'></td>
    <td class="BACKGROUND_a">A15013账单月收入                                             <input type='text' id='A15013' name='A15013' value='0'></td>        
    <td class="BACKGROUND_a">AT4310是否为公安检测出4类人员(Y:BL01 在逃、BL02历史在逃、BL11、BL12)<input type='text' id='AT4310' name='AT4310' value=''></td>
    </tr>  
<tr><td class="BACKGROUND_a">A15006 最近2年内的查询次数-担保资格审查：                     <input type='text' id='A15006' name='A15006' value='0'></td>       
    <td class="BACKGROUND_a">A15007 最近2年内的查询次数-特约商户实名审查：                 <input type='text' id='A15007' name='A15007' value='0'></td> 
    <td class="BACKGROUND_a">AT4330 要客分类
	<select name="AT4330" id="AT4330">
          <option value="" selected>未知</option>
			<option value="A" >A:一级敏感要客</option>
          <option value="B">B:二级敏感要客</option>
          <option value="C">C:三级敏感要客</option>
          <option value="D">D:总行领导要客（北分专用）</option>
		  </select>
	</td>      
    </tr> 
<!-- 
A08017:贷记卡他行10万及以下第三高额度(人民币)：
A08018:贷记卡他行10万及以下平均额度(人民币)：
A10017:准贷记卡他行10万及以下第三高额度(人民币)：
A10018:准贷记卡他行10万及以下平均额度(人民币)：
A12013:房贷(已结清)月应还款总额还原
A12014:房贷(未结清)贷款合同金额
A12015:房贷(已结清)贷款合同金额
A16001:人行评分分数
A16002:人行评分相对位置
A16003:人行评分因素

 -->
 <tr><td class="BACKGROUND_a" style="color:red">A03001是否他行信用卡客户：(Y/N)                                   <input type='text' id='A03001' name='A03001' value='n'></td> 
    <td class="BACKGROUND_a" >A03002他行信用卡单卡最高额度(人民币)：                       <input type='text' id='A03002' name='A03002' value='0'></td> 
    <td class="BACKGROUND_a" >A03003他行信用卡卡龄6个月以上的单卡最高额度(人民币)：        <input type='text' id='A03003' name='A03003' value='0'></td> 
    <td class="BACKGROUND_a" >A03004:客户最长卡龄 <input type='text' id='A03004' name='A03004' value='7'></td> 
</tr> 
<tr>
    <td class="BACKGROUND_a" >A03005:客户名下近6个月平均额度使用率异常卡片数量 <input type='text' id='A03005' name='A03005' value='0'></td> 
    <td class="BACKGROUND_a" >A03006:客户贷记卡最小还款卡片数量<input type='text' id='A03006' name='A03006' value='0'></td> 
    <td class="BACKGROUND_a" >A03007:客户还款记录小于6个月（含）的消费贷款数量<input type='text' id='A03007' name='A03007' value='0'></td>
    <td class="BACKGROUND_a" >A03008:客户交易不活跃发卡机构数 <input type='text' id='A03008' name='A03008' value='0'></td>
</tr> 
<!-- 
A03008:客户交易不活跃发卡机构数
A03009:客户他行卡10万及以下第一高额度(人民币)
A03010:客户他行卡10万及以下第二高额度(人民币)
A03011:客户他行卡10万及以下第三高额度(人民币)
A03012:客户他行卡10万及以下平均额度(人民币)
 -->
<tr> 
    <td class="BACKGROUND_a" >A03009:客户他行卡10万及以下第一高额度(人民币) <input type='text' id='A03009' name='A03009' value='30000'></td> 
    <td class="BACKGROUND_a" >A03010:客户他行卡10万及以下第二高额度(人民币)<input type='text' id='A03010' name='A03010' value='20000'></td> 
    <td class="BACKGROUND_a" >A03011:客户他行卡10万及以下第三高额度(人民币)<input type='text' id='A03011' name='A03011' value='9000'></td>
    <td class="BACKGROUND_a">A03012:客户他行卡10万及以下平均额度(人民币)<input type='text' id='A03012' name='A03012' value='10000'></td> 
</tr> 
<tr>  
    <td class="BACKGROUND_a">A12011:房产价值<input type='text' id='A12011' name='A12011' value='0'></td>
    <td class="BACKGROUND_a">A12013:房贷(已结清)月应还款总额还原<input type='text' id='A12013' name='A12013' value='0'></td>       
    <td class="BACKGROUND_a">A12014:房贷(未结清)贷款合同金额<input type='text' id='A12014' name='A12014' value='0'></td>
    <td class="BACKGROUND_a">A12015:房贷(已结清)贷款合同金额 <input type='text' id='A12015' name='A12015' value='0'></td>  
</tr>  
<tr>  
    <td class="BACKGROUND_a">A16001:人行评分分数<input type='text' id='A16001' name='A16001' value='0'></td>
    <td class="BACKGROUND_a">A16002:人行评分相对位置<input type='text' id='A16002' name='A16002' value='0'></td>       
    <td class="BACKGROUND_a">A16003:人行评分因素<input type='text' id='A16003' name='A16003' value='0'></td>
    <td class="BACKGROUND_a" style="color:red">A04001是否行内个人金融资产类客户：  (Y/N)<input type='text' id='A04001' name='A04001' value='n'></td>
</tr>  
	</table>
	</div>
	<table  width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>
    <tr>
</table>
<br>
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
<td class="BACKGROUND_a" align="left">AT4721全部产品层账户账户状态</td><td>
<input type="text" name="AT4721" id="AT4721" value="1"/>
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4410工单产品是否专用卡:</td>
<td>
<select name="AT4410" id="AT4410">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select></td>

<td class="BACKGROUND_a" align="left">
AT4420清偿方式:</td><td>
<select name="AT4420" id="AT4420">
<option value="">未知</option>
<option value="1" selected>公司</option>
<option value="2">个人</option>
</select>
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">
AT4421公司组织机构代码号是否存在于支持临增公司名单中:</td><td>
<select name="AT4421" id="AT4421">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">
AT4422公司组织机构代码号是否存在于支持长增公司名单中：</td><td>
<select name="AT4422" id="AT4422">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4430是否为睡眠帐户</td><td>
<select name="AT4430" id="AT4430">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td>


</tr>
<tr>
	<td class="BACKGROUND_a" align="center" colspan="4">客户信息</td><td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4450客户证件类型: </td><td>
<select name="AT4450" id="AT4450">
<option value="">未知</option>
<option value="1" selected>身份证</option>
<option value="2">护照</option>
<option value="3">军人身份证</option>
<option value="4">香港居民来往内地通行证</option>
<option value="5">台湾居民往来大陆通行证</option>
<option value="I">武装警察身份证</option>
<option value="J">澳门居民来往内地通行证</option>
<option value="8">其他</option>
</select>

</td>										
 <td class="BACKGROUND_a" align="left">AT4451客户身份证号码</td><td> 
<input type="text" name="AT4451" id="AT4451" value="220402199306063361"/>
</td>
</tr>
<tr>									
<td class="BACKGROUND_a" align="left">AT4460客户出生日期 </td><td>
<input type="text" name="AT4460" id="AT4460" value="19910313"/>
</td>                              
<td class="BACKGROUND_a" align="left">AT4730套现规则触发结果</td><td>
<input type="text" name="AT4730" id="AT4730" value=""/>
<!-- <select name="AT4730" id="AT4730">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select> -->
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4490全部产品层账户开立日期</td><td>
<input type="text" name="AT4490" id="AT4490" value="20140505"/>             
</td> 
<td class="BACKGROUND_a" align="left">AT4550全部产品层账户争议交易金额</td><td>
<input type="text" name="AT4550" id="AT4550" value="0"/> 
</td>
</tr> 
<tr>                                     
<td class="BACKGROUND_a" align="left">AT4600客户是否存在于分行报送增额黑名单</td><td>
<select name="AT4600" id="AT4600">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4610客户是否存在于分行报送增额灰名单</td><td>
<select name="AT4610" id="AT4610">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td>
</tr> 
<tr>             
<td class="BACKGROUND_a" align="left">AT4530近半年内客户顶层临时额度提升次数</td><td>
<input type="text" name="AT4530" id="AT4530" value="0" />  
</td>
<td class="BACKGROUND_a" align="left">AT4470近半年内客户顶层永久额度提升次数</td><td>   
<input type="text" name="AT4470" id="AT4470" value="0" />
</td>  
</tr>
<tr>
	<td class="BACKGROUND_a" align="center" colspan="4">逾期历史</td>
</tr>

<tr>			

</tr>
<tr>		
<td class="BACKGROUND_a" align="left">AT4630近6个月内，连续未全额还款次数</td><td>
<input type="text" name="AT4630" id="AT4630" value="0"/> 
</td>
<td class="BACKGROUND_a" align="left">AT4640近6个月内，累计未全额还款次数</td><td>
<input type="text" name="AT4640" id="AT4640" value="0"/> 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4650近6个月内，最近一期账单是否全额还款</td><td>
<select name="AT4650" id="AT4650">
<option value="">未知</option>
<option value="1" selected>是</option>
<option value="2">否</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT4660近6个月内，M1次数</td><td>	
<input type="text" name="AT4660" id="AT4660" value="0"/> 	</td>
</tr>
<tr>									
<td class="BACKGROUND_a" align="left">AT4670卡龄</td><td>
<input type="text" name="AT4670" id="AT4670" value="5"/> 
</td>
<td class="BACKGROUND_a" align="left">AT4680近12个月内，连续未全额还款次数</td><td>
<input type="text" name="AT4680" id="AT4680" value="0" > 
</td>
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4690近12个月内，累计未全额还款次数</td><td>
<input type="text" name="AT4690" id="AT4690" value="0" /> 
</td>
<td class="BACKGROUND_a" align="left">AT4700近12个月内，M1次数	</td><td>	
<input type="text" name="AT4700" id="AT4700" value="0"/> 
</td>		</tr>
<tr>							
<td class="BACKGROUND_a" align="left">AT4710近12个月内，M2次数</td><td>
<input type="text" name="AT4710" id="AT4710" value="0"/> 
</td>
<td class="BACKGROUND_a" align="left">AT4720近24个月内，M3及M3+次数</td><td>
<input type="text" name="AT4720" id="AT4720" value="0"/> 
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

<td class="BACKGROUND_a" align="left">AT4740全部产品账户近6个月平均额度使用率</td><td>	
<input type="text" name="AT4740" id="AT4740" value="0"/> 
</td>	
<td class="BACKGROUND_a" align="left">AT4590全部产品层账户过去12个月内逾期M1及以上次数</td><td>
<input type="text" name="AT4590" id="AT4590" value="0"/> 
</td>	
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT4724是否年费逾期</td><td>
<select name="AT4724" id="AT4724">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td>
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
<td class="BACKGROUND_a" align="left">AT5600评分等级</td><td>
<select name="AT5600" id="AT5600">
<option value="">未知</option>
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
<td class="BACKGROUND_a" align="left">AT6040是否跨境交易客户</td><td>
<select name="AT6040" id="AT6040">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
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
<tr>
<td class="BACKGROUND_a" align="left">AT5609公司组织机构代码号</td><td>
<input type="text" name="AT5609" id="AT5609" value="0"/> 
</td>
<td class="BACKGROUND_a" align="left">AT5610公务卡临增上限</td><td>
<input type="text" name="AT5610" id="AT5610" value="0"/> 
</td>		
</tr>
<tr>									
<td class="BACKGROUND_a" align="left">AT5611公务卡长增上限 </td><td>
<input type="text" name="AT5611" id="AT5611" value="0"/> 
</td>
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
<td class="BACKGROUND_a" align="left">AT4440工单产品的当前永久额度（产品层）</td><td>
<input name="AT4440" id="AT4440" type="text" value="5000" />
</td>							
</tr>
<tr>
<td class="BACKGROUND_a" align="left">AT6020客户所有名下有效卡的最高永久额度 </td><td>
 <input type="text" name="AT6020" id="AT6020" value="30000" /> 
</td>
<td class="BACKGROUND_a" align="left">AT6030工单卡片子级CC01当前永久额度</td><td>
<input type="text" name="AT6030" id="AT6030" value="10000"/> 
</td>
</tr>
<tr><td class="BACKGROUND_a" align="left">AT5612客户近三个月行内资产余额</td>
<td><input type="text" name="AT5612" id="AT5612" value="0"/></td>
</tr>
</table>
<b><span>网络渠道申请</span></b>
<table width="99%" border="1" cellpadding="0" cellspacing="1" class=border_c>	
<tr><td class="BACKGROUND_a" align="left">AT20001渠道标识</td><td>
<select name="AT20001" id="AT20001">
<option value="">未知 </option>
<option value="0">0 分行录入</option>
<option value="1" selected="selected">1 网申</option>
<option value="2">2 移动终端网页版</option>
<option value="3">3 柜台老客户</option>
<option value="4">4 手机（微信）</option>
<option value="5">5 网银理财版</option>
<option value="6">6 缤纷生活</option>
<option value="7">7 行内平台（OCRM）</option>
<option value="8">8 客服</option>
<option value="9">9 自助终端</option>
<option value="A">A 移动终端(APP端)</option>
<option value="F">F 全流程审批进件</option>
<option value="N">N 批量预制卡（旧）</option>
<option value="O">O 老aps进件</option>
<option value="P">P 批量非预制卡</option>
<option value="Q">Q 批量预制卡（新）</option>
<option value="X">-777 区域中心</option>
<option value="Y">Y 商务公司录入</option>
<option value="Z">Z 综合开户</option>
<option value="10">10 引导办卡</option>
<option value="error">error</option>
</select>
<!-- <select name="AT20001" id="AT20001">
<option value="">未知 </option>
<option value="0100">0100总行NUW</option>
<option value="0101">0101总行NUW（分行录入）</option>
<option value="0102">0102总行NUW（商务公司录入）</option>
<option value="0103">0103总行NUW（区域中心录入）</option>
<option value="0101">0101总行NUW-老客户简化申请（分行录入）</option>
<option value="0102">0102总行NUW-老客户简化申请（商务公司录入）</option>
<option value="0103">0103总行NUW-老客户简化申请（区域中心录入）</option>
<option value="0104">0104批量预制卡（旧）</option>
<option value="0105">0105批量预制卡（新）</option>
<option value="0106">0106批量非预制卡</option>
<option value="0107">0107BANCS(综合开户)</option>
<option value="0108">0108旧审批系统（APS）</option>
<option value="0200">0200总行CSR，原：客服</option>
<option value="0300">0300总行CRM</option>
<option value="0400">0400分行落地终端</option>
<option value="0500">0500网银</option>
<option value="0600" selected="selected">0600网站</option>
<option value="0700">0700财富OCRM，原：行内平台（OCRM）</option>
<option value="0800">0800微信，原：手机</option>
<option value="0900">0900移动终端</option>
<option value="1000">1000缤纷生活</option>
</select> -->
</td>
<td class="BACKGROUND_a" align="left">AT20004户籍与工作地域是否一致</td><td>
<select name="AT20004" id="AT20004">
<option value="">未知</option>
<option value="1">是</option>
<option value="2" selected>否</option>
</select>
</td>
</tr>
<tr>
    <td class="BACKGROUND_a" align="left">AT20002 学历</td><td>
	<select name="AT20002" id="AT20002">
						<option value="">未知</option>
						<option value="-999">-999</option>
						<option value="-888">-888</option>
						<option value="专科">1专科</option>
						<option value="专科(高职)">2专科(高职)</option>
						<option value="专升本">3专升本</option>
						<option value="本科" selected>4本科</option>
						<option value="第二学士学位">5第二学士学位</option>
						<option value="硕士研究生">6硕士研究生</option>
						<option value="博士研究生">7博士研究生</option>
						<option value="第二本科">8第二本科</option>
						<option value="第二专科">9第二专科</option>
						<option value="研究生班">10研究生班</option>
						<option value="夜大电大函大普通班">11夜大电大函大普通班</option>
				</select>
				</td>
	<td class="BACKGROUND_a" align="left">AT20018 全国职业资格证书信息：证书等级</td><td>
	<select name="AT20018" id="AT20018">
	<option value="">未知</option>
	<option value="-999">-999</option>
	<option value="-888">-888</option>
	<option value="初级（国家职业资格5级）" selected>初级（国家职业资格5级）</option>
	<option value="中级（国家职业资格4级）">中级（国家职业资格4级）</option>
	<option value="高级（国家职业资格3级）">高级（国家职业资格3级）</option>
	<option value="技师（国家职业资格2级）">技师（国家职业资格2级）</option>
	<option value="高级技师（国家职业资格1级）">高级技师（国家职业资格1级）</option>
	</select>
	</td>
</tr>	
<tr>
<td class="BACKGROUND_a" align="left">AT20005是否为信用卡老客户</td><td>
<select name="AT20005" id="AT20005">
<option value="">未知</option>
<option value="1" selected>是</option>
<option value="2">否</option>
</select>
</td>
<td class="BACKGROUND_a" align="left">AT20006信用卡老客户额度</td><td><input type="text" name="AT20006" id="AT20006" value="0"/> </td>
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">A04009 是否白名单</td><td>
	<input type="text" name="A04009" id="A04009" value=""/>
	<!-- <select name="A04009" id="A04009">
	<option value="">未知</option>
	<option value="1">是</option>
	<option value="2" selected>否</option>
	</select> -->
	</td>
	<td class="BACKGROUND_a" align="left">
		A04010 白名单额度</td><td><input type="text" name="A04010" id="A04010" value="0"/>
    </td>
    </tr>
<tr>
    <td class="BACKGROUND_a" align="left">AT20009反申请欺诈评级</td><td>
	<select name="AT20009" id="AT20009">
	<option value="">未知</option>
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
	<td class="BACKGROUND_a" align="left">AT20031  反申请欺诈评分</td><td>
		<input type="text" id="AT20031" name="AT20031" value="50"/>
	</td>
</tr>		
<tr>
	<td class="BACKGROUND_a" align="left">AT20011审批状态</td><td>
		<select name="AT20011" id="AT20011">
		<option value="">未知</option>
		<option value="1" selected>一次决策</option>
		<option value="2">二次决策</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20010公安是否返回</td><td>
	 <input type="text" name="AT20010" id="AT20010" value="1" />
	<!--  <select name="AT20010" id="AT20010">
	<option value="">未知</option>
	<option value="1" selected="selected">是</option>
	<option value="2">否</option>
	<option value="-888">-888</option>
	</select> -->
	</td>
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">A04006 是否行内房贷客户</td><td>
	<input type="text" name="A04006" id="A04006"/>
	<!-- <select name="A04006" id="A04006">
	<option value="">未知</option>
	<option value="1">是</option>
	<option value="2" selected="selected">否</option>
	</select> -->
	</td>
	<td class="BACKGROUND_a" align="left">A04007  最长正常还款周期长度（天）</td><td>
		<input type="text" id="A04007" name="A04007" value="300"/>
	</td>
</tr>	
<tr>
	<td class="BACKGROUND_a" align="left">A04008 本月累计应还款额（元）</td><td>
		<input type="text" id="A04008" name="A04008" value="2000"/>
	</td>
	<td class="BACKGROUND_a" align="left">AT20020  是否有学籍</td><td>
		<select name="AT20020" id="AT20020">
			<option value="">请选择</option>
			<option value="-888">-888</option>
			<option value="-999">-999</option>
			<option value="3">3接口之外</option>
			<option value="1"selected="selected">是</option>
			<option value="2">否</option>	
		</select>
	</td>
</tr>		
<tr>
	<td class="BACKGROUND_a" align="left">AT20021 公安失信被执行人</td><td>
		<select name="AT20021" id="AT20021">
			<option value="" selected="selected">请选择</option>
			<option value="-999">-999</option>
			<option value="-888">-888</option>
			<option value="-777">-777接口之外</option>
			<option value="1">是</option>
			<option value="2">否</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20027  毕业院校类型(schoolType desc)</td><td>
	<select name="AT20027" id="AT20027">
		<option value="">未知</option>
		<option value="1">1-985院校</option>
		<option value="2" selected="selected">2-211院校</option>
		<option value="3">3非985院校及211院校</option>
	</select>
	</td>
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">AT20022入学年份(enrolDate desc)</td>
	<td><input type="text" id="AT20022" name="AT20022" value="2015"/></td>
	<td class="BACKGROUND_a" align="left">AT20023毕业时间(graduateTime desc)</td>
	<td><input type="text" id="AT20023" name="AT20023" value="2015"/></td>
</tr>

<tr>
	<td class="BACKGROUND_a" align="left">AT20024毕业年限(bynx desc)</td>
	<td><input type="text" id="AT20024" name="AT20024" value="6"/></td>
	<td class="BACKGROUND_a" align="left">AT20025毕业结论(studyResult desc)</td>
	<td>
		<select name="AT20025" id="AT20025">
			<option value="">请选择</option>
			<option value="毕业"selected="selected">1毕业</option>
			<option value="结业">2结业</option>
			<option value="肄业">3肄业</option>
		</select>
	</td>
</tr>

<tr>
	<td class="BACKGROUND_a" align="left">AT20026学历类型D（dxllx desc）</td>
	<td>
		<select name="AT20026" id="AT20026">
			<option value="">请选择</option>
			<option value="普通"selected="selected">1普通</option>
			<option value="研究生">2研究生</option>
			<option value="成人">3成人</option>
			<option value="自考">4自考</option>
			<option value="网络教育">5网络教育</option>
			<option value="开放教育">6开放教育</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20028学校性质(公办、民办等)(schoolTrade desc)</td>
	<td>
		<select name="AT20028" id="AT20028">
			<option value="">请选择</option>
			<option value="公办" selected="selected">1公办</option>
			<option value="民办">2民办</option>
		</select>
	</td>
	
</tr>

<tr>
	<td class="BACKGROUND_a" align="left">AT20029学习形式D（dstudyStyle desc）</td>
	<td>
		<select name="AT20029" id="AT20029">
			<option value="">请选择</option>
			<option value="普通全日制">普通全日制</option>
			<option value="全日制">2全日制</option>
			<option value="非全日制">3非全日制</option>
			<option value="脱产">4脱产</option>	
			<option value="业余">5业余</option>
			<option value="在职">6在职</option>
			<option value="夜大学">7夜大学</option>
			<option value="网络教育">8网络教育</option>
			<option value="函教">9函教</option>
			<option value="开放教育">10开放教育</option>
			<option value="远程教育">11远程教育</option>
			<option value="电视教育">12电视教育</option>
			<option value="不详">13不详</option>
		</select>
	</td>
	<td class="BACKGROUND_a" align="left">AT20030证书-领证日期</td>
	<td>
		<input type="text" id="AT20030" name="AT20030" value="20150808" onkeydown="ctlSubmit(event,'create')"/>
	</td>
	
</tr>
<tr>
	<td class="BACKGROUND_a" align="left">PFTEST 测试专用 申请评分</td>
	<td>
		<input type="text" id="PFTEST" name="PFTEST" value=""/>
	</td>
</tr>

<!-- 从开始到现在  -->	
 	
    </table>
  <p>
    <img onClick="javascript:submitinfo('saveXml');" src="img/button8.gif" width="54" height="26">
    <img onClick="javascript:submitinfo('create');" src="img/审批.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('network');" src="img/网申.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('temporary');" src="img/临调.jpg" width="54" height="26">
    <img onClick="javascript:submitinfo('permanent');" src="img/永调.jpg" width="54" height="26">
    <input type="button" value="清空" id="re">
  </p>
  <input   type="hidden"  name="textfield" onclick="ctlSubmit(event,'create')"/>
</form>
<table width="100%" cellspacing="0" cellpadding="0" >
    <tr>
    	<td with= 75% align=center height="32"><span><font size="1">Copyright &copy; 2005 北京首航财务管理有限公司 版权所有</font></span>
    </tr>
</table></center>
</body>
</html>
   