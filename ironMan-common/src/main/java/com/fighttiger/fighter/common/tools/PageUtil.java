package com.fighttiger.fighter.common.tools;

import com.fighttiger.fighter.common.tools.golbal.Page;

/**
 * Created by weiqz on 2017/3/1.
 * 使用domain包下的PageUtil
 */
@Deprecated
public class PageUtil {

    public static Page initPage(int pageIndex, int pageSize) {
        Page page = new Page();
        page.setPageIndex(pageIndex);
        page.setPageSize(pageSize);
        return page;
    }

    public static Page initAppPage(int pageIndex) {
        Page page = new Page();
        page.setPageIndex(pageIndex);
        page.setPageSize(Page.DEFAUTL_APP_PAGESIZE);
        return page;
    }

}
