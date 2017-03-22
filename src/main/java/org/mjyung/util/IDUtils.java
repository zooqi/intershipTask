/**
 * @ProjectName : intershipTask
 * @PackageName : org.mjyung.util
 * @Description : TODO(描述文件的用途)
 * @CreationDate : 2017/3/20 11:03
 * TODO(修改内容)
 */
package org.mjyung.util;

import java.util.UUID;

/**
 * 自动生成Id
 * @author mjyung
 * @since 2017.03.19
 */
public class IDUtils {

    /**
     * 获取独一无二的Id
     *
     * @return
     */
    public static String generateID() {
        return UUID.randomUUID().toString();
    }
}
