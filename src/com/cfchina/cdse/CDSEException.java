package com.cfchina.cdse;

/**
 * <p>CDSEException�ฺ��CDSE�����⴦��</p>
 *
 * <p>Copyright: ��Ȩ (c) 2002</p>
 * <p>Company: �׺�����������޹�˾</p>
 * @author: CDSE��Ŀ��
 * @version 1.0
 * @see   Exception
 */

public class CDSEException
    extends Exception {

    private int errorCode;  //�������
    /**
     * ���ش����
     */
    public int getErrorCode() {
        return this.errorCode;
    }

    /**
     * ���ô����
     * @param errorCode   The new �����
     */
    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * ͨ�������Ź���һ��CDSE������
     *
     * @param   errorCode   ������
     */

    public CDSEException(int errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * ͨ��������Ϣ����һ��CDSE������
     *
     * @param   error   ������Ϣ
     */

    public CDSEException(String error) {
        super(error);
    }
}
