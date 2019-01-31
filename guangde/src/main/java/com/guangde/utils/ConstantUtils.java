package com.guangde.utils;

public class ConstantUtils {

	public interface subjectStatus {
		/**
		 * 1-未结
		 */
		final String UNDO = "1";
		/**
		 * 2-已结
		 */
		final String DOWN = "2";
		/**
		 * 3-审核中
		 */
		final String REVIEW = "3";
		/**
		 * 4-顶置
		 */
		final String TOPPING = "4";
		/**
		 * 5-精贴
		 */
		final String FINE = "5";
	}

}
