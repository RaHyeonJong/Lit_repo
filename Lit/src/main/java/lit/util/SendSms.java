package lit.util;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendSms {
		
	public static int sendSms(String phone) {
		String api_key = "NCSYUJT7PKQ41CWO";
		String api_secret = "1GTCWZIRDXAHGYAETPNFV123PATFYICV";
		Message coolsms = new Message(api_key, api_secret);
		
		Random rand = new Random();
		int ukey = rand.nextInt(899999) + 100000;

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone);
		params.put("from", "01086828830");
		params.put("type", "SMS");
		params.put("text", "[Life is Trip] 본인확인 인증번호 ["+ ukey +"]를 화면에 입력해주세요.");
//		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
			return ukey;
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		return ukey;
	}
}
