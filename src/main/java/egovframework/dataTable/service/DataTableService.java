package egovframework.dataTable.service;

import java.util.List;
import java.util.Map;

public interface DataTableService {	
		
		List<?> ajax(Map mapSearch) throws Exception;
		
		int ajaxTotCnt(Map mapSearch);
	}

