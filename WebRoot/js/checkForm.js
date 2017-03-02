/*
-------------------------------------------------------------------------------
�ļ����ƣ�checkForm.js
˵    ����JavaScript�ű�����֤���е�������
��    ����1.0
�޸ļ�¼:
---------------------------------------------------------------------------
ʱ��		�޸���		˵��
2005-03-05	wangyu		����
2005-05-20  luwei �޸�
		1.�������Text
����<input type="text" name="txt">
����<input type="password" name="pwd">
����<input type="hidden" name="hid">
����<input type="file" name="myfile">
����<textarea name="txts"></textarea>
����2.����ѡ��Choose
����<input type="checkbox" name="c">
����<input type="checkbox" name="c">
����<input type="radio" name="r">
����<input type="radio" name="r">
����3.���������˵�Select
����<select name="sel"></select>
����<select name="sels" multiple></select>
------------------------------------------------------------------------------- 	
*/

//����ȡ��checkForm
var bCancel = false;

function checkForm(objFrm){

	var len = 0;
	len = objFrm.elements.length;
  
	var i = 0;
	var objCheck;
	//�ı���

	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.disabled==false){
		if(objCheck.type =="text" && !f_checkTextValid(objCheck) ){
		
			return false;			
		}
		
		
		
		if(objCheck.type =="textarea" && !f_checkTextAreaValid(objCheck) ){
		
			return false;			
		}
		if(objCheck.type =='password' && objCheck.getAttribute("name").indexOf("conf_")<0){
			var conf="conf_"+objCheck.getAttribute("name");
			if(objCheck.value!=objFrm.elements(conf).value){
				f_alert(objCheck," ȷ�����������벻һ��,�����������룡");
				return false;
			}else if(!f_checkTextValid(objCheck)){
				return false;	
			}
		}
		
		if(objCheck.type =="radio" && !f_checkRadioValid(objCheck) ){
			return false;			
		}
	}
		
	}

	//��֤������ʽ
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		//�Ƿ���Ҫ��֤
		if(objCheck.checkReg)
		{
			if(!f_checkRegValid(objCheck)){
			  return false;
			}
		}
	}

	
	//������
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.type =="select-one" && !f_checkSelectValid(objCheck) ){
			return false;			
		}
	}
	
	//ʱ�����Ч
	if( f_checkStartAndEndDate(objFrm) == false) return false;
	
	
	return true;
}

//ȥ���ַ������ߵĿո�����ַ���Ϊnull,�򷵻�""
function trim(str){
    return rtrim(ltrim(str));
}

//ȥ���ַ�����ߵĿո�
function ltrim(s){
    if(s == null) return "";
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(0)) != -1) {
        var j=0, i = str.length;
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1){
            j++;
        }
        str = str.substring(j, i);
    }
    return str;
}

//ȥ���ַ����ұߵĿո�
function rtrim(s){
    if(s == null) return "";
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(str.length-1)) != -1){
        var i = str.length - 1;
        while (i >= 0 && whitespace.indexOf(str.charAt(i)) != -1){
            i--;
        }
        str = str.substring(0, i+1);
    }
    return str;
}

function f_checkRegValid(obj){
	  //ȡ����֤�������ַ���
			var sReg = obj.checkReg;
			//ȡ�ñ���ֵ,��ͨ��ȡֵ����
			var sVal = GetValue(obj);
			//�ַ���->������ʽ,�����ִ�Сд
			var reg = new RegExp(sReg,"i");
			if(!reg.test(sVal))
			{
				//��֤��ͨ��,������ʾwarning
				alert(obj.warning);
				//�ñ�Ԫ��ȡ�ý���,��ͨ�÷��غ���
				GoBack(obj)  
				return false;
			}
			return true;
}

function f_checkRadioValid(obj){
  if(obj.getAttribute("isNeed") != null){
  	obj.setAttribute("checkReg","^0$");
  	obj.setAttribute("warning","��ѡ��һ����¼��");
  	if(f_checkRegValid(obj) == false) return false;
  }
  return true;
}

function f_checkSelectValid(obj){
	//alert("check select");
	if(obj.getAttribute("isNeed") != null){
	if(obj.options.length <= 0){
		alert("����ѡ��������!");
		return false;	
	} 
}
	return true;
}

//ͨ��ȡֵ�������������ȡֵ
//�ı������,ֱ��ȡֵel.value
//����ѡ,��������ѡ��ȡ�ñ�ѡ�еĸ������ؽ��"00"��ʾѡ������
//���������˵�,��������ѡ��ȡ�ñ�ѡ�еĸ������ؽ��"0"��ʾѡ��һ��
function GetValue(el)
{
	//ȡ�ñ�Ԫ�ص�����
	var sType = el.type;
	switch(sType)
	{
		case "text":
		case "hidden":
		case "password":
		case "file":
		case "textarea": return el.value;
		case "checkbox":
		case "radio": return GetValueChoose(el);
		case "select-one":
		case "select-multiple": return GetValueSel(el);
	}
	//ȡ��radio,checkbox��ѡ����,��"0"����ʾѡ�еĸ���,����д�����ʱ��Ϳ���ͨ��0{1,}����ʾѡ�и���
	function GetValueChoose(el)
	{
		var sValue = "";
		//ȡ�õ�һ��Ԫ�ص�name,�������Ԫ����
		var tmpels = document.getElementsByName(el.name);
		for(var i=0;i<tmpels.length;i++)
		{
			if(tmpels[i].checked)
			{
				sValue += "0";
			}
		}
		return sValue;
	}
	//ȡ��select��ѡ����,��"0"����ʾѡ�еĸ���,����д�����ʱ��Ϳ���ͨ��0{1,}����ʾѡ�и���
	function GetValueSel(el)
	{
		var sValue = "";
		for(var i=0;i<el.options.length;i++)
		{
			//��ѡ��������ʾѡ������Ϊvalue=""
			if(el.options[i].selected && el.options[i].value!="")
			{
				sValue += "0";
			}
		}
		return sValue;
	}
}


//ͨ�÷��غ���,��֤ûͨ�����ص�Ч��.���������ȡֵ
//�ı������,��궨λ���ı�������ĩβ
//����ѡ,��һѡ��ȡ�ý���
//���������˵�,ȡ�ý���
function GoBack(el)
{
	//ȡ�ñ�Ԫ�ص�����
	var sType = el.type;
	switch(sType)
	{
		case "text":
		case "hidden":
		case "password":
		case "file":
		case "textarea": el.focus();var rng = el.createTextRange(); rng.collapse(false); rng.select();
		case "checkbox":
		case "radio": var els = document.getElementsByName(el.name);els[0].focus();
		case "select-one":
		case "select-multiple":el.focus();
	}
}





function f_checkStartAndEndDate(frm){
	var len = frm.elements.length;
	if(len == null && len == 0) return true;
	var i=0;
	var temp;
	var objCheck;
	var objStartDate;
	var objEndDate;
	//alert("start date period check");
	try{
		for(i=0; i< len ; i++){
			objCheck = frm.elements[i];
			temp = objCheck.name;
			if( temp.indexOf("startDate") >0 ||temp.indexOf("beginDate")>0 )
				objStartDate = objCheck;
			if( temp.indexOf("endDate") > 0 )
				objEndDate = objCheck;
				
		}
		//alert(objStartDate.value);
		//alert(objEndDate.value);
		if(objStartDate.value==null || objStartDate.value =="" || objStartDate.value ==null || objStartDate.value ==""){
			return true;
		}
		return checkTwoDate(objStartDate.value, objEndDate.value);	
		//alert("end date period check");
	}catch(E){}
	return true;
}


function f_checkTextAreaValid(obj){
	//����Ϊ��
	if(obj.getAttribute("isNeed") != null&&obj.getAttribute("isNeed")=="Y"){
		if(f_isNotNull(obj) == false) return false;
	}
	//���ܳ�������

	if(obj.getAttribute("maxlength") != null){
    
		if(f_checkLength(obj) == false) return false;
	}
	return true;
}


function f_checkTextValid(obj){
	//����Ϊ��
	if(obj.getAttribute("isNeed") != null&&obj.getAttribute("isNeed")=="Y"){
		if(f_isNotNull(obj) == false) return false;
	}
	//���ܳ�������

	if(obj.getAttribute("maxlength") != null){
  
		if(f_checkLength(obj) == false) return false;
	}
	var checkType ="";
	checkType = obj.getAttribute("checkType");
	if(checkType==null||checkType=="") return true;
	//¬ΰ��ӣ����Ϊ���򲻼��checktype
	if(obj.value == "") return true;
	//
	if (checkType.indexOf("number") >=0){
		if(f_isNumber(obj) == false)  return false;
		if(f_checkNumType(obj,checkType) == false)  return false;
		
	}
	if (checkType.indexOf("code") >=0){
		if(f_isNumber(obj) == false)  return false;
	    if(f_isPositive(obj)==false)  return false;
		if(f_checkCodeType(obj,checkType) == false)  return false;
		}
	
	//
	if (checkType.indexOf("positive") >=0){
		if(f_isNumber(obj) == false)  return false;
		if(f_isPositive(obj)==false)  return false;
		if(f_checkNumType(obj,checkType) == false)  return false;
		
	}
	if (checkType.indexOf("date") >=0){
		if(f_checkDate(obj) == false) return false;
		
	}
	if(checkType.indexOf("char") >=0){
		if(isChar(obj,false) == false) return false;
	}
    if(checkType.indexOf("email") >=0){
		if(isEmail(obj) == false) return false;
	}
	
   

	
	/*
	switch(checkType){
		case "number": if(f_isNumber(obj) == false) return false;break;
		case "date": if(f_checkDate(obj) == false) return false;break;
		default:
	}
	*/
	return true;
}

function f_isNotNull(obj){
	if(obj.value == ""){
		f_alert(obj, " ������Ϊ��ֵ��");
		return false;
	}
	return true;
}

function f_isNumber(obj){
	if(isNaN(obj.value)){
		 f_alert(obj," ӦΪ��ֵ����");
		return false;		
	}
	return true;

}
function f_checkDate(obj) {
	if(checkDate(obj.value) ==false){
		 f_alert(obj," ���ǺϷ����ڸ�ʽ��");
		return false;		
	}
	return true;
}

function f_checkLength(obj){

	if(getStringLength(obj.value) >   Math.abs(obj.getAttribute("maxlength")) ){
		 f_alert(obj," ������������!");
		return false;		
	}
	return true;
	
}

//����ַ�������
function getStringLength(str){
  var endvalue=0;
  var sourcestr=new String(str);
  var tempstr;
  for (var strposition = 0; strposition < sourcestr.length; strposition ++) {
    tempstr=sourcestr.charAt(strposition);
    if (tempstr.charCodeAt(0)>255 || tempstr.charCodeAt(0)<0) {
      endvalue=endvalue+2;
    } else {
      endvalue=endvalue+1;
    }
  }
  return(endvalue);
}

function  f_alert(obj,alertStr){
	var fielName = obj.getAttribute("fieldName");
	if(fielName == null)
		fielName = "";
	alert(fielName + "\n" +alertStr);
	obj.select();
	obj.focus();
}

function f_checkNumType(obj, numType){
	//����: �Ѿ��������������ж�
	
	var strTemp;
	var numpric;
	var numLen;
	var strArr;
	var defaultLen = 19;
	var defaultpric = 5;

	try{
		if(numType == null|| numType =="") return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		if(numType.indexOf("(") < 0 || numType.indexOf(")") < 0 ) return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		strTemp = numType.substr( numType.indexOf("(") + 1 ,numType.indexOf(")") - numType.indexOf("(") -1 );
		if(strTemp == null||strTemp =="") return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		strArr = strTemp.split(",");	
		numLen = Math.abs( strArr[0] ); 
		numpric = Math.abs( strArr[1] );	
		return f_checkNumLenPrec(obj,numLen, numpric);
	}catch(e){
		alert("in f_checkNumType = " + e);
		 return f_checkNumLenPrec(obj,defaultLen, defaultpric);
	}

}
/*
��֤�����
*/
function f_checkCodeType(obj, numType){
	//����: �Ѿ��������������ж�
	
	var strTemp;
	var numpric;
	var numLen;
	var strArr;
	var defaultLen = 19;
	var defaultpric = 0;
    var slength=obj.value.length;
    var tzleng=0;//
    var msg="";
    var length= Math.abs(slength);
    var idclass=Math.abs(obj.getAttribute("idclass"));
    var temp_id=obj.getAttribute("temp_id");
    var temp_type=Math.abs(obj.getAttribute("temp_type"));
    
	try{
		if(numType == null|| numType =="") return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		if(numType.indexOf("(") < 0 || numType.indexOf(")") < 0 ) return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		strTemp = numType.substr( numType.indexOf("(") + 1 ,numType.indexOf(")") - numType.indexOf("(") -1 );
		if(strTemp == null||strTemp =="") return f_checkNumLenPrec(obj,defaultLen, defaultpric);
		 if(!(temp_id==null || temp_id=="") && temp_id.indexOf("-1")<0){
		if(temp_type==0){
		if(slength!=temp_id.length){
		 msg="�������볤���뼶�β�����";
		 f_alert(obj, msg);
		 return false;	
		}
		}else{
		
		if(obj.value.indexOf(temp_id)<0){
		 msg="�������뿪ͷ��������������룡";
		 f_alert(obj, msg);
		 return false;	
		}
		if(slength==temp_id.length){
		 msg="�������볤���뼶�β�����";
		 f_alert(obj, msg);
		 return false;	
		}
		}
		}
		strArr = strTemp.split("-");
	    var arr_len=0;
	    if(idclass<=strArr.length){
	    arr_len=idclass;
	    }else{
	    arr_len=strArr.length;
	    }
	   
		for(var i=0;i<arr_len;i++){
		numLen = Math.abs(strArr[i]);
		tzleng=tzleng+numLen;
		if(length<=0){
		
		break;
		return true;
		} 
		if(numLen>length){
		 msg="���������"+(i+1)+"��ĳ��ȱ���Ϊ"+numLen;
		 f_alert(obj, msg);
		 return false;	
		 }else{
		
		 length=length-numLen;
		
		 }
		}	
		
		if(slength>tzleng){
			msg="����������ܳ�����ָ������"+tzleng;
		 f_alert(obj, msg);
		 return false;	
		}
		return true;
		
	
	}catch(e){
		alert("in f_checkNumType = " + e);
		 return f_checkNumLenPrec(obj,defaultLen, defaultpric);
	}

}


function f_checkNumLenPrec(obj, len, pric){
	var numReg;
	var value = obj.value;
	var strValueTemp, strInt, strDec;	
	//alert(value + "=====" + len + "====="+ pric);
	try{	
		
		numReg =/[\-]/;
		strValueTemp = value.replace(numReg, "");
		strValueTemp = strValueTemp.replace(numReg, "");
		//����
		if(pric==0){
			numReg =/[\.]/;
			//alert(numReg.test(value));
			if(numReg.test(value) == true){
				f_alert(obj, "�������Ϊ��������!");
				return false;	
			}			
		}
		
		if(strValueTemp.indexOf(".") < 0 ){
			//alert("lennth==" + strValueTemp);		
			if(strValueTemp.length >( len - pric)){
				f_alert(obj, "����λ���ܳ���"+ (len - pric) +"λ");
				return false;
			}
		
		}else{
			strInt = strValueTemp.substr( 0, strValueTemp.indexOf(".") );		
			//alert("lennth==" + strInt);		
			if(strInt.length >( len - pric)){
				f_alert(obj, "����λ���ܳ���"+ (len - pric) +"λ");
				return false;
			}		

			strDec = strValueTemp.substr( (strValueTemp.indexOf(".")+1), strValueTemp.length );		
			//alert("pric==" + strDec);		
			if(strDec.length > pric){
				f_alert(obj, "С��λ���ܳ���"+  pric +"λ");
				return false;
			}		
		}
		
		return true;
	}catch(e){
		alert("in f_checkNumLenPrec = " + e);
		return false;
	}	
}
function f_isPositive(obj){
	var numReg =/[\-]/;
	var re = new RegExp("^[0-9]*[1-9][0-9]*$");
	if(re.test(obj.value) == false){
		f_alert(obj, "����Ϊ������!");
		return false;
	}
	if(numReg.test(obj.value) == true){
		f_alert(obj, "����Ϊ����!");
		return false;
	}
	return true;
	
}
/*
function selectedCheckboxCount(form)
����˵������Form��ѡ�еĿ�ѡ�����

����˵����
form:ָ���ı�
*/
function selectedCheckboxCount(form){
	var length =0;
	var i=0;
	var count =0;
	eles = form.elements;
	while(i<eles.length){
		obj= eles.item(i);
		type = obj.attributes.item("type").nodeValue;
		if(type == "checkbox"){
			if(obj.checked){
				count++;
			}
		}
		i++;
	}
	return count;
}

//У���Ƿ�ȫ������ĸ�����֣��»������
//sign - ���ҪУ��Ķ���Ϊ�գ����ظ�ֵ(����Ϊboolean��)��Ĭ��Ϊfalse
function isChar(obj,sign) {
var s=obj.value;
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
	var re = new RegExp("^[A-Za-z0-9_]*$");
	 if(re.test(s)==false){
	f_alert(obj, "����ȫ������ĸ�����֣��»������!");
      return false;
	}
	return true;
}

//У���Ƿ�Ϊ��
function isEmpty (s) {
  if (s == null || trim(s) == "") return true;
  return false;
}

function isEmail(obj){
	var s=obj.value;
	if(isEmailV(s,false)==false){
	f_alert(obj, "�����EMAIL��ʽ����!");
		  return false;
	}
	return true;
}
//У���Ƿ�Ϊemail��ַ
//sign - ���ҪУ��Ķ���Ϊ�գ����ظ�ֵ(����Ϊboolean��)��Ĭ��Ϊfalse
function isEmailV(s,sign) {
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
  var emailPat=/^(.+)@(.+)$/;
  var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
  var validChars="\[^\\s" + specialChars + "\]";
  var quotedUser="(\"[^\"]*\")";
  var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
  var atom=validChars + '+';
  var word="(" + atom + "|" + quotedUser + ")";
  var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
  var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");
  var matchArray=s.match(emailPat);
  if (matchArray == null)  return false;
  var user=matchArray[1];
  var domain=matchArray[2];
  if (user.match(userPat) == null)   return false;
  var IPArray = domain.match(ipDomainPat);
  if (IPArray != null) {
    for (var i = 1; i <= 4; i++) {
      if (IPArray[i] > 255) return false;
    }
    return true;
  }
  var domainArray=domain.match(domainPat);
  if (domainArray == null)  return false;
  var atomPat=new RegExp(atom,"g");
  var domArr=domain.match(atomPat);
  var len=domArr.length;
  if ((domArr[domArr.length-1].length < 2) || (domArr[domArr.length-1].length > 3)) {
    return false;
  }
  if (len < 2) return false;
  return true;
}                     

//���checkbox��radio
function isOnlyOneSelected(field,fieldName) {
 var len;
 var j;
 j=0;
 var ret;
 if(field==null)
   return null;
 len=field.length;

if(len==null) {
if(field.checked) {
	j=1;
	ret = field.value;
}
else {
	j=0;
}
}
 for (var i=0; i<len; i++)
 {
   if (field[i].checked)
   {
     j++;
     ret = field[i].value;
   }
 }
 if (j>1)
 {
   alert('ֻ��ѡ��һ��'+fieldName);
   return null;
 }
 else if (j==0)
 {
   alert('��ѡ��һ��'+fieldName);
   return null;
 }
 return ret;

}


function isAtLeastOneSelected(field,fieldName) {

 var len;
 if(field==null)
   return false;
 len=field.length;
	if(len==null) {
	if(field.checked) {
		return true;
	}
	else {
		alert('��ѡ��һ��'+fieldName);
		return false;
	}
 }

 for (var i=0; i<len; i++)
 {
   if (field[i].checked)
   {
     return true;
   }
 }
 alert('��ѡ��һ��'+fieldName);
 return false;

}


function isAtLeastOneSelectedChk(form_name, chkbox_name,chkbox_msg)
{

	len = form_name.elements.length;
	var index = 0;
	var temp;
	for( index; index < len; index++ )
	{
		if( form_name.elements[index].name.indexOf(chkbox_name) >= 0 ){
			if (form_name.elements[index].disabled == false){
	             if(form_name.elements[index].checked){
	              return true;
	            }
	          }
	        }
	}
	
	alert('����ѡ��һ��'+chkbox_msg);
  return false;
}


//���checkbox��radio
function isOneSelected(field,fieldName) {
 var len;
 var j;
 j=0;
 var ret;
 if(field==null)
   return null;
 len=field.length;

if(len==null) {
if(field.checked) {
	j=1;
	ret = field;
}
else {
	j=0;
}
}
 for (var i=0; i<len; i++)
 {
   if (field[i].checked)
   {
     j++;
     ret = field[i];
   }
 }
 if (j>1)
 {
   alert('ֻ��ѡ��һ��'+fieldName);
   return null;
 }
 else if (j==0)
 {
   alert('��ѡ��һ��'+fieldName);
   return null;
 }
 return ret;

}

/***
 * ��ֹ������ύ����
 * ����ǵ�һ���ύ������������true����ʾ�����ύ���������ύ
 * frm - �����󡣵�һ���ύ���󣬻Ὣ���ڵ����е�button��Ϊ������
 */
var FRM_SUBMITED = false;
function confirmSubmited(frm){
  
  if(!FRM_SUBMITED){
    FRM_SUBMITED = true;
    //Ϊ���Ӿ�Ч�������������еİ�ť��Ϊ������    
    if(frm){   
      var eles = frm.elements;
      for(var i=0; i < eles.length; i++) {    
        obj= eles.item(i);
        type=obj.type;
        if((type == "button" || type == "submit") && obj.disabled == false){        
          obj.disabled = true;
        }
      }
    }     
    return true;
  }
  return false;
}

function genOperation(opervalue){
	element = document.getElementById("operation");
	var IsIE = navigator.userAgent.indexOf("MSIE") != -1;
	if(element == null){
	   var span = document.forms[0];
	   if ( span !=null ) {
	         if ( !IsIE ) {
						var fileObj = document.createElement("input");
						if ( fileObj != null ) {
							fileObj.type="hidden";
							fileObj.name = "operation";
							fileObj.id = "operation";
							fileObj.value=opervalue;
							span.appendChild(fileObj);
						}//if fileObj
					}// !IsIE

					if ( IsIE ) {
						var fileTag = "<input type='hidden' id ='operation' name='operation' value='"+opervalue+"'>";
						var fileObj = document.createElement(fileTag); 
						span.appendChild(fileObj);
					}//IsIE if
			
	  }//if span
	}else{
	 element.value=opervalue;
	}
	return true;
}
