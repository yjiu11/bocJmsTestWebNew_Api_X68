package com.cfchina.cdse;

import java.util.ArrayList;

public class Test {
    private static final String comStr="ak123x45617960?302gef4563";

    public Test() {
        try {
            jbInit();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        char[] tempCharArr=comStr.toCharArray();
        String tempStr="";
        ArrayList tempList=new ArrayList();
        for(int i=0;i<tempCharArr.length;++i)
        {
            if('0'==tempCharArr[i] || '1'==tempCharArr[i])
            {
                tempStr+=String.valueOf(tempCharArr[i]);
            }else if(!"".equals(tempStr))
            {
                tempList.add(tempStr);
            }
        }

    }

    private void jbInit() throws Exception {
    }
}
