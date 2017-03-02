function isLeapYear(year) 
{ 
 if((year%4==0&&year%100!=0)||(year%400==0)) 
 { 
 return true; 
 }  
 return false; 
} 

function isNumber(pObj,errMsg){
 var obj = eval(pObj);
 strRef = "1234567890";
 if(!isEmpty(pObj,errMsg))return false;
 for (i=0;i<obj.value.length;i++) {
  tempChar= obj.value.substring(i,i+1);
  if (strRef.indexOf(tempChar,0)==-1) {
   //if (errMsg == null || errMsg =="")
   // alert("数据不符合要求,请检查");
   //else
   // alert(errMsg);
   if(obj.type=="text") 
    obj.focus(); 
   return false; 
  }
 }
 return true;
}
function CheckValid(checktext){
s = checktext.value;
//alert(s);
if (s=="" || s==null){
alert("对不起，申请单编号不能为空!");
 return
 }
if (s.length!=16){
	alert("对不起，必须输入16位字符!");
	return;
}
if (!isDate(checktext)){
alert("对不起，申请单编号输入不符合要求，请重新输入!");
return ;
}
if (!isNumber(checktext,"")){
alert("对不起，申请单编号输入不符合要求，请重新输入!");
return;
}
document.form1.submit();
}
function Trim(str){
 if(str.charAt(0) == " "){
  str = str.slice(1);
  str = Trim(str); 
 }
 return str;
}
//判断是否是空
function isEmpty(pObj,errMsg){
 var obj = eval(pObj);
 if( obj == null || Trim(obj.value) == ""){
  if (errMsg == null || errMsg =="")
   alert("输入为空!");
  else
   alert(errMsg); 
  obj.focus(); 
  return false;
 }
 return true;
}
function isDate(checktext){
var datetime;
var year,month,day;
var gone,gtwo;
 datetime=Trim(checktext.value);
  year=datetime.substring(0,4);
  if(isNaN(year)==true){
   checktext.focus();
   return false;
  }
  month=datetime.substring(4,6);
  if(isNaN(month)==true){
   checktext.focus();
   return false;
  }
  day=datetime.substring(6,8);
  if(isNaN(day)==true){
   checktext.focus();
   return false;
  }
   if(month<1||month>12) { 
    checktext.focus();
    return false; 
    } 
   if(day<1||day>31){ 
    checktext.focus(); 
    return false; 
   }else{
    if(month==2){  
     if(isLeapYear(year)&&day>29){ 
       checktext.focus();
       return false; 
     }       
     if(!isLeapYear(year)&&day>28){ 
       checktext.focus(); 
       return false; 
     } 
    } 
    if((month==4||month==6||month==9||month==11)&&(day>30)){ 
     checktext.focus(); 
     return false; 
    } 
  }
return true;
}
