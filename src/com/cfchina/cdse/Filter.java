package com.cfchina.cdse;

import java.io.*;

/**
 * <p>Filter��ʵ����FilenameFilter�ӿ��࣬����ָ���ļ���׺��
 *</p>
 *
 * <p>Copyright: ��Ȩ (c) 2002</p>
 * <p>Company: �׺�����������޹�˾</p>
 * @author: CDSE��Ŀ��
 * @version 1.0
 */

public class Filter
    implements FilenameFilter {
    /**�ļ���׺*/
    String extent;

    /**
     * Filter ָ���ļ���׺
     *
     * @param extent   �ļ���׺
     */

    public Filter(String extent) {
        this.extent = extent.trim().toLowerCase();
    }

    /**
     * accept ʵ�ֽӿڷ���
     *
     * @param dir   �ļ�Ŀ¼
     * @param name   �ļ���
     * @return boolean �Ƿ����ָ���ļ���׺
     */

    public boolean accept(File dir, String name) {
        return name.toLowerCase().endsWith("." + extent);
    }

}
