package com.elink.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Data2Json {
	
	public static String data2json(List<Map<String, Object>> data){
		String jsonStr = null;
		if(data!=null && data.size() > 0){
			jsonStr = JSONArray.toJSONString(data).replace('\\', ' ');
			jsonStr = "{\"Rows\":" + jsonStr.replace(" ", "") + ", \"Total\":" + data.size() + "}";
		}
		return jsonStr;
	}
}
