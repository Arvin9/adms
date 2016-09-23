package site.nebulas.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

import site.nebulas.dao.ChartsDao;

@Service
public class ChartsService {
	@Resource
	private ChartsDao chartsDao;

	public Map<String,Object> queryUserVisitPage(){
		Map<String,Object> userVisitPageMap = new HashMap<String,Object>();
		
		String[] legendData = {"答题页面","留言页面","客服机器人页面"};
		userVisitPageMap.put("legendData", legendData);
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> tempList = new ArrayList<Map<String,Object>>();
		list = chartsDao.queryUserVisitPage();
		Map<String,Object> tempMap;
		String type;
		for(Map<String,Object> m : list){
			tempMap = new HashMap<String,Object>();
			type = m.get("dynamicTyle").toString();
			if(null == type)
				continue;
			if("2".equals(type)){
				tempMap.put("value", m.get("amount"));
				tempMap.put("name", "答题页面");
				tempList.add(tempMap);
			}
			if("3".equals(type)){
				tempMap.put("value", m.get("amount"));
				tempMap.put("name", "留言页面");
				tempList.add(tempMap);
			}
			if("5".equals(type)){
				tempMap.put("value", m.get("amount"));
				tempMap.put("name", "客服机器人页面");
				tempList.add(tempMap);
			}
		}
		userVisitPageMap.put("seriesData", tempList);
    	return userVisitPageMap;
    }
}


