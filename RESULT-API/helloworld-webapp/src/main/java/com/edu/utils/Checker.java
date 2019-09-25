package com.edu.utils;

import java.util.List;
import java.util.Map;

/**
 * 常用判断工具类
* @author   
* @date 2019年4月27日
 */
public class Checker {
	public static final boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	public static final boolean isEmpty(StringBuffer str) {
		return str == null || str.length() == 0;
	}

	public static boolean isEmpty(String[] array) {
		return array == null || array.length == 0;
	}

	public static boolean isEmpty(String[][] array) {
		return array == null || array.length == 0;
	}

	public static boolean isEmpty(List list) {
		return list == null || list.size() < 1;
	}

	public static boolean isEmpty(Map map) {
		return map == null || map.size() < 1;
	}

	public static boolean isInteger(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				Integer.parseInt(str);
				return true;
			} catch (Exception arg1) {
				return false;
			}
		}
	}

	public static boolean isPositiveInteger(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				int ex = Integer.parseInt(str);
				return ex > 0;
			} catch (Exception arg1) {
				return false;
			}
		}
	}

	public static boolean isNonnegativeInteger(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				int ex = Integer.parseInt(str);
				return ex >= 0;
			} catch (Exception arg1) {
				return false;
			}
		}
	}

	public static boolean isLong(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				Long.parseLong(str);
				return true;
			} catch (Exception arg1) {
				return false;
			}
		}
	}

	public static boolean isPositiveLong(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				long ex = Long.parseLong(str);
				return ex > 0L;
			} catch (Exception arg2) {
				return false;
			}
		}
	}

	public static boolean isNonnegativeLong(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				long ex = Long.parseLong(str);
				return ex >= 0L;
			} catch (Exception arg2) {
				return false;
			}
		}
	}

	public static boolean isDecimal(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				Double.parseDouble(str);
				return true;
			} catch (Exception arg1) {
				return false;
			}
		}
	}

	public static boolean isPositiveDecimal(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				double e = Double.parseDouble(str);
				return e > 0.0D;
			} catch (Exception arg2) {
				return false;
			}
		}
	}

	public static boolean isNonnegativeDecimal(String str) {
		if (isEmpty(str)) {
			return false;
		} else {
			try {
				double e = Double.parseDouble(str);
				return e >= 0.0D;
			} catch (Exception arg2) {
				return false;
			}
		}
	}

}
