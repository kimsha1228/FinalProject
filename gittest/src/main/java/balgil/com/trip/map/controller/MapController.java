package balgil.com.trip.map.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import balgil.com.trip.map.model.LatLngVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MapController {

	@Autowired
	HttpSession session;
	
	//가져온 방법 https://creampuffy.tistory.com/entry/Spring-MVC-%ED%94%84%EB%A1%9C%ED%8D%BC%ED%8B%B0-%ED%8C%8C%EC%9D%BC-value-%EA%B0%80%EC%A0%B8%EC%98%A4%EA%B8%B0
	@Value("#{property['naver.CLIENTID']}")
	private String CLIENTID;
	@Value("#{property['naver.CLIENTSECRET']}")
	private String CLIENTSECRET;
	
	//CURL 사용하기:
	//https://formatter.xyz/curl-to-apache-httpclient-converter
	@ResponseBody
	@RequestMapping(value = {"/directions5.do"}, produces="application/json;charset=UTF-8", method = RequestMethod.POST)
	public String directions5(@RequestBody List<LatLngVO> vo) throws JsonParseException, JsonMappingException, IOException {
		
		//그냥 vo.get(0).getX 하면 에러나서 찾은 해결법
		//https://storiaquotidiana.tistory.com/48
		ObjectMapper om = new ObjectMapper();
		List<LatLngVO> newVos= om.convertValue(vo, new TypeReference<List<LatLngVO>>() {});
		
		log.info(newVos.toString());
		log.info("{}",newVos.get(0));
		log.info("{}",newVos.get(vo.size()-1));																			
		log.info("{}",newVos.get(0).get_lat());
		log.info("{}",newVos.get(0).getX());
		//127.1058342,37.359708
		
		//원하는 uri: 
		//https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=127.1058342,37.359708&goal=129.075986,35.179470&option=trafast
		StringBuffer stringBuffer = new StringBuffer( "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=");
		stringBuffer.append(
				String.valueOf(newVos.get(0).getX())+
				","+
				String.valueOf(newVos.get(0).getY())+
				"&goal="+
				String.valueOf(newVos.get(newVos.size()-1).getX())+
				","+
				String.valueOf(newVos.get(newVos.size()-1).getY())+
				"&option=trafast"
				);
		log.info("{}",stringBuffer.toString());
		
		//경유지가 있나 체크
		if(newVos.size()>=3) {
			//처음과 마지막은 건너뜀
			stringBuffer.append("&waypoints=");
			for (int i = 1; i < newVos.size()-1; i++) {
				stringBuffer.append(String.valueOf(newVos.get(i).getX())+
										","+
										String.valueOf(newVos.get(i).getY())+
										"%7C" // | <- 이걸 uri 코드화한것
									);
			}
			stringBuffer.deleteCharAt(stringBuffer.length()-1);
			stringBuffer.deleteCharAt(stringBuffer.length()-1);
			stringBuffer.deleteCharAt(stringBuffer.length()-1);
		}
		log.info("{}",stringBuffer.toString());
		
		//
		HttpGet request = new HttpGet(stringBuffer.toString());

		request.addHeader("X-NCP-APIGW-API-KEY-ID", CLIENTID);
		request.addHeader("X-NCP-APIGW-API-KEY", CLIENTSECRET);

		CloseableHttpClient httpClient = null;
		CloseableHttpResponse response = null;

		try {
		    httpClient = HttpClients.createDefault();
		    response = httpClient.execute(request);
		    log.info("Response code: {}",response.getStatusLine().getStatusCode());
		    HttpEntity entity = response.getEntity();
		    if (entity != null) {
		        String result = EntityUtils.toString(entity);
		        log.info(result);
		        return result;
		    }
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    try {
		        if (response != null) {
		            response.close();
		        }
		        if (httpClient != null) {
		            httpClient.close();
		        }
		    } catch (IOException e) {
		    	e.printStackTrace();
		    }
		}
		
		return "home";
	}
	
	@RequestMapping(value = "/map_test01.do", method = RequestMethod.GET)
	public String map_test() {
		return "test/map_test/01";
	}
	@RequestMapping(value = "/map_test02.do", method = RequestMethod.GET)
	public String map_test2() {
		return "test/map_test/02";
	}
	@RequestMapping(value = "/map_test03.do", method = RequestMethod.GET)
	public String map_test3() {
		return "test/map_test/03";
	}
	@RequestMapping(value = "/map_test04.do", method = RequestMethod.GET)
	public String map_test4() {
		return "test/map_test/04";
	}
	@RequestMapping(value = "/map_test05.do", method = RequestMethod.GET)
	public String map_test5() {
		return "test/map_test/05";
	}
	@RequestMapping(value = "/map_test06.do", method = RequestMethod.GET)
	public String map_test6() {
		return "test/map_test/06";
	}
	@RequestMapping(value = "/map_test07.do", method = RequestMethod.GET)
	public String map_test7() {
		return "test/map_test/07";
	}
	@RequestMapping(value = "/map_test08.do", method = RequestMethod.GET)
	public String map_test8() {
		return "test/map_test/08";
	}
	@RequestMapping(value = "/map_test09.do", method = RequestMethod.GET)
	public String map_test9() {
		return "test/map_test/09";
	}
	@RequestMapping(value = "/map_test10.do", method = RequestMethod.GET)
	public String map_test10() {
		return "test/map_test/10";
	}
	@RequestMapping(value = "/map_test11.do", method = RequestMethod.GET)
	public String map_test11() {
		return "test/map_test/11";
	}
	@RequestMapping(value = "/map_test12.do", method = RequestMethod.GET)
	public String map_test12() {
		return "test/map_test/12";
	}
	@RequestMapping(value = "/map_test13.do", method = RequestMethod.GET)
	public String map_test13() {
		return "test/map_test/13";
	}
}