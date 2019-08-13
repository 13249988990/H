package com.foxlink.utils;

import com.foxlink.mes.Interface.RecordState;

public class RecordsUtils {

		public static String stateToString(int state){
			switch (state) {
			case RecordState.UNDEFINED:
				return "未填写";
			case RecordState.ZERO:
				return "已填写";
			case RecordState.ONE:
				return "待稽核";
			case RecordState.TWO:
				return "待复核";
			case RecordState.THREE:
				return "已复核";
			default:
				break;
			}
			return null;
			
		}
}
