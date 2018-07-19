package egovframework.dataTable.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
@Repository("dataTableDAO")
public class DataTableDAO extends EgovAbstractDAO{
	
	public List<?> ajax(Map mapSearch)throws Exception{
		return list("dataTableDAO.ajax",mapSearch);
	}
	
	public int ajaxTotCnt(Map mapSearch){
		return (Integer) select("dataTableDAO.ajaxTotCnt",mapSearch);
	}
}
