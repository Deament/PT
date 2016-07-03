package  cn.base;

import javax.servlet.http.HttpServletRequest;

import cn.qtone.common.utils.base.AJAXPaginate;
import util.javaweb.Page;

public class BaseControllor {

	/**
	 * 获取ajax形式的分页代码.使用自定义的分页方法来代替默认的jump
	 * 
	 * @param request
	 * @return
	 */
	protected String getAjaxPage(HttpServletRequest request, int curPage,
			Page page, String funcName) {
		AJAXPaginate html = new AJAXPaginate(page.getTotals(), curPage,
				page.getPageSize());
		html.setUrl(request, funcName);
		return html.getRoll();
	}
	
}
