/*
-------------------------------------------------------------------------------
文件名称：checkForm.js
说    明：JavaScript脚本，验证表单中的数据项
版    本：1.0
修改纪录:
---------------------------------------------------------------------------
时间		修改人		说明
2005-03-05	wangyu		创建
2005-05-20  luwei 修改
		1.文输入框Text
　　<input type="text" name="txt">
　　<input type="password" name="pwd">
　　<input type="hidden" name="hid">
　　<input type="file" name="myfile">
　　<textarea name="txts"></textarea>
　　2.单多选框Choose
　　<input type="checkbox" name="c">
　　<input type="checkbox" name="c">
　　<input type="radio" name="r">
　　<input type="radio" name="r">
　　3.单多下拉菜单Select
　　<select name="sel"></select>
　　<select name="sels" multiple></select>
------------------------------------------------------------------------------- 	
*/

//用于取消checkForm
var bCancel = false;

function checkForm(objFrm){

	var len = 0;
	len = objFrm.elements.length;
  
	var i = 0;
	var objCheck;
	//文本框

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
				f_alert(objCheck," 确认密码与密码不一致,请您重新输入！");
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

	//验证正则表达式
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		//是否需要验证
		if(objCheck.checkReg)
		{
			if(!f_checkRegValid(objCheck)){
			  return false;
			}
		}
	}

	
	//下拉框
	for(i = 0; i < len; i ++){
		objCheck = objFrm.elements[i];
		if(objCheck.type =="select-one" && !f_checkSelectValid(objCheck) ){
			return false;			
		}
	}
	
	//时间段有效
	if( f_checkStartAndEndDate(objFrm) == false) return false;
	
	
	return true;
}

//去掉字符串两边的空格。如果字符串为null,则返回""
function trim(str){
    return rtrim(ltrim(str));
}

//去掉字符串左边的空格
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

//去掉字符串右边的空格
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
	  //取得验证的正则字符串
			var sReg = obj.checkReg;
			//取得表单的值,用通用取值函数
			var sVal = GetValue(obj);
			//字符串->正则表达式,不区分大小写
			var reg = new RegExp(sReg,"i");
			if(!reg.test(sVal))
			{
				//验证不通过,弹出提示warning
				alert(obj.warning);
				//该表单元素取得焦点,用通用返回函数
				GoBack(obj)  
				return false;
			}
			return true;
}

function f_checkRadioValid(obj){
  if(obj.getAttribute("isNeed") != null){
  	obj.setAttribute("checkReg","^0$");
  	obj.setAttribute("warning","请选择一条记录！");
  	if(f_checkRegValid(obj) == false) return false;
  }
  return true;
}

function f_checkSelectValid(obj){
	//alert("check select");
	if(obj.getAttribute("isNeed") != null){
	if(obj.options.length <= 0){
		alert("下拉选框无数据!");
		return false;	
	} 
}
	return true;
}

//通用取值函数分三类进行取值
//文本输入框,直接取值el.value
//单多选,遍历所有选项取得被选中的个数返回结果"00"表示选中两个
//单多下拉菜单,遍历所有选项取得被选中的个数返回结果"0"表示选中一个
function GetValue(el)
{
	//取得表单元素的类型
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
	//取得radio,checkbox的选中数,用"0"来表示选中的个数,我们写正则的时候就可以通过0{1,}来表示选中个数
	function GetValueChoose(el)
	{
		var sValue = "";
		//取得第一个元素的name,搜索这个元素组
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
	//取得select的选中数,用"0"来表示选中的个数,我们写正则的时候就可以通过0{1,}来表示选中个数
	function GetValueSel(el)
	{
		var sValue = "";
		for(var i=0;i<el.options.length;i++)
		{
			//单选下拉框提示选项设置为value=""
			if(el.options[i].selected && el.options[i].value!="")
			{
				sValue += "0";
			}
		}
		return sValue;
	}
}


//通用返回函数,验证没通过返回的效果.分三类进行取值
//文本输入框,光标定位在文本输入框的末尾
//单多选,第一选项取得焦点
//单多下拉菜单,取得焦点
function GoBack(el)
{
	//取得表单元素的类型
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
	//不能为空
	if(obj.getAttribute("isNeed") != null&&obj.getAttribute("isNeed")=="Y"){
		if(f_isNotNull(obj) == false) return false;
	}
	//不能超过长度

	if(obj.getAttribute("maxlength") != null){
    
		if(f_checkLength(obj) == false) return false;
	}
	return true;
}


function f_checkTextValid(obj){
	//不能为空
	if(obj.getAttribute("isNeed") != null&&obj.getAttribute("isNeed")=="Y"){
		if(f_isNotNull(obj) == false) return false;
	}
	//不能超过长度

	if(obj.getAttribute("maxlength") != null){
  
		if(f_checkLength(obj) == false) return false;
	}
	var checkType ="";
	checkType = obj.getAttribute("checkType");
	if(checkType==null||checkType=="") return true;
	//卢伟添加，如果为空则不检查checktype
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
		f_alert(obj, " 不允许为空值！");
		return false;
	}
	return true;
}

function f_isNumber(obj){
	if(isNaN(obj.value)){
		 f_alert(obj," 应为数值类型");
		return false;		
	}
	return true;

}
function f_checkDate(obj) {
	if(checkDate(obj.value) ==false){
		 f_alert(obj," 不是合法日期格式！");
		return false;		
	}
	return true;
}

function f_checkLength(obj){

	if(getStringLength(obj.value) >   Math.abs(obj.getAttribute("maxlength")) ){
		 f_alert(obj," 超出长度限制!");
		return false;		
	}
	return true;
	
}

//获得字符串长度
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
	//假设: 已经进行数字类型判断
	
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
验证层次码
*/
function f_checkCodeType(obj, numType){
	//假设: 已经进行数字类型判断
	
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
		 msg="输入层次码长度与级次不符！";
		 f_alert(obj, msg);
		 return false;	
		}
		}else{
		
		if(obj.value.indexOf(temp_id)<0){
		 msg="输入层次码开头必须包含父级编码！";
		 f_alert(obj, msg);
		 return false;	
		}
		if(slength==temp_id.length){
		 msg="输入层次码长度与级次不符！";
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
		 msg="输入层次码第"+(i+1)+"层的长度必须为"+numLen;
		 f_alert(obj, msg);
		 return false;	
		 }else{
		
		 length=length-numLen;
		
		 }
		}	
		
		if(slength>tzleng){
			msg="输入层次码的总长超过指定长度"+tzleng;
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
		//整数
		if(pric==0){
			numReg =/[\.]/;
			//alert(numReg.test(value));
			if(numReg.test(value) == true){
				f_alert(obj, "输入必须为整数类型!");
				return false;	
			}			
		}
		
		if(strValueTemp.indexOf(".") < 0 ){
			//alert("lennth==" + strValueTemp);		
			if(strValueTemp.length >( len - pric)){
				f_alert(obj, "整数位不能超过"+ (len - pric) +"位");
				return false;
			}
		
		}else{
			strInt = strValueTemp.substr( 0, strValueTemp.indexOf(".") );		
			//alert("lennth==" + strInt);		
			if(strInt.length >( len - pric)){
				f_alert(obj, "整数位不能超过"+ (len - pric) +"位");
				return false;
			}		

			strDec = strValueTemp.substr( (strValueTemp.indexOf(".")+1), strValueTemp.length );		
			//alert("pric==" + strDec);		
			if(strDec.length > pric){
				f_alert(obj, "小数位不能超过"+  pric +"位");
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
		f_alert(obj, "必须为正整数!");
		return false;
	}
	if(numReg.test(obj.value) == true){
		f_alert(obj, "必须为正数!");
		return false;
	}
	return true;
	
}
/*
function selectedCheckboxCount(form)
功能说明：对Form中选中的可选项计数

参数说明：
form:指定的表单
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

//校验是否全部由字母，数字，下划线组成
//sign - 如果要校验的对象为空，返回该值(必须为boolean型)，默认为false
function isChar(obj,sign) {
var s=obj.value;
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
	var re = new RegExp("^[A-Za-z0-9_]*$");
	 if(re.test(s)==false){
	f_alert(obj, "必须全部由字母，数字，下划线组成!");
      return false;
	}
	return true;
}

//校验是否为空
function isEmpty (s) {
  if (s == null || trim(s) == "") return true;
  return false;
}

function isEmail(obj){
	var s=obj.value;
	if(isEmailV(s,false)==false){
	f_alert(obj, "输入的EMAIL格式不对!");
		  return false;
	}
	return true;
}
//校验是否为email地址
//sign - 如果要校验的对象为空，返回该值(必须为boolean型)，默认为false
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

//检查checkbox和radio
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
   alert('只能选择一项'+fieldName);
   return null;
 }
 else if (j==0)
 {
   alert('请选择一项'+fieldName);
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
		alert('请选择一项'+fieldName);
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
 alert('请选择一项'+fieldName);
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
	
	alert('至少选择一项'+chkbox_msg);
  return false;
}


//检查checkbox和radio
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
   alert('只能选择一项'+fieldName);
   return null;
 }
 else if (j==0)
 {
   alert('请选择一项'+fieldName);
   return null;
 }
 return ret;

}

/***
 * 防止表单多次提交函数
 * 如果是第一次提交表单，函数返回true，表示可以提交，否则不能提交
 * frm - 表单对象。第一次提交表单后，会将表单内的所有的button置为不可用
 */
var FRM_SUBMITED = false;
function confirmSubmited(frm){
  
  if(!FRM_SUBMITED){
    FRM_SUBMITED = true;
    //为了视觉效果，将表单内所有的按钮置为不可用    
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
