package egovframework.dataTable.service.impl;

import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.dataTable.service.DataTableService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("dataTableService")
public class DataTableServiceImpl extends EgovAbstractServiceImpl implements DataTableService {

	
	
	@Resource(name="dataTableDAO")
	private DataTableDAO dataTableDAO;
	
	@Override
	public List<?> ajax(Map mapSearch) throws Exception{
		return dataTableDAO.ajax(mapSearch);
	}
	
	
	@Override
	public int ajaxTotCnt(Map mapSearch){
		return dataTableDAO.ajaxTotCnt(mapSearch);
	}
}
