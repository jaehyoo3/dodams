package com.dodam.infra.common.util;

import java.time.LocalDateTime;

public class UtilDateTime {
	public static LocalDateTime nowLocalDateTime () throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		return localDateTime;
	}
}
