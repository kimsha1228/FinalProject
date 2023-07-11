package balgil.com.trip.map.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MapController {

	@Autowired
	HttpSession session;
	
	@Value("#{property['naver.CLIENTID']}")
	private String CLIENTID;
	@Value("#{property['naver.CLIENTSECRET']}")
	private String CLIENTSECRET;
	
	@ResponseBody
	@RequestMapping(value = {"/directions5.do"}, produces="application/json;charset=UTF-8", method = RequestMethod.GET)
	public String home() {
		log.info(CLIENTID);
		log.info(CLIENTSECRET);
		
		HttpGet request = new HttpGet("https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?start=127.1058342,37.359708&goal=129.075986,35.179470&option=trafast");

		request.addHeader("X-NCP-APIGW-API-KEY-ID", CLIENTID);
		request.addHeader("X-NCP-APIGW-API-KEY", CLIENTSECRET);

		CloseableHttpClient httpClient = null;
		CloseableHttpResponse response = null;

		try {
		    httpClient = HttpClients.createDefault();
		    response = httpClient.execute(request);
		    System.out.println("Response code: " + response.getStatusLine().getStatusCode());
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
