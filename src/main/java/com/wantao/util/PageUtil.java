package com.wantao.util;
//分页辅助类
import com.wantao.bean.Page;

public class PageUtil {
	public static Page createPage(int currentPage, int everyPageCount, int totalCount) {// 当前页，每页的记录数，总记录数
		currentPage = getCurrentPage(currentPage);
		everyPageCount = getEveryPageCount(everyPageCount);
		totalCount = getTotalCount(totalCount);
		int totalPage = getTotalPage(totalCount, everyPageCount);
		int beginIndex = getBeginIndex(currentPage, everyPageCount);
		boolean hasPrePage = getHasPrePage(currentPage);
		boolean hasNextPage = getHasNextPage(currentPage, totalPage);
		return new Page(everyPageCount, totalCount, totalPage, currentPage, beginIndex, hasPrePage, hasNextPage);
	}

	public static int getCurrentPage(int currentPage) {// 获得当前页

		return currentPage == 0 ? 1 : currentPage;
	}

	public static int getEveryPageCount(int everyPageCount) {// 获得每页的记录数

		return everyPageCount == 0 ? 10 : everyPageCount;
	}

	public static int getTotalCount(int totalCount) {// 获得总的记录数

		return totalCount;
	}

	public static int getTotalPage(int totalCount, int everyPageCount) {// 获得总页数
		int totalPage = 0;
		if (totalCount != 0 && totalCount % everyPageCount == 0) {
			totalPage = totalCount / everyPageCount;
		} else {
			totalPage = (totalCount / everyPageCount) + 1;
		}
		return totalPage;

	}

	public static int getBeginIndex(int currentPage, int everyPageCount) {// 获得起始位置
		return (currentPage - 1) * everyPageCount;

	}

	public static boolean getHasPrePage(int currentPage) {// 是否有上一页
		return currentPage == 1 ? false : true;
	}

	public static boolean getHasNextPage(int currentPage, int totalPage) {// 是否有下一页
		return currentPage == totalPage || totalPage == 0 ? false : true;
	}

}
