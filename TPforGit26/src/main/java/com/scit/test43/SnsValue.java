package com.scit.test43;


import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SnsValue implements SnsUrls{
	private String clientId;
	private String clientSecret;
	private String service;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	private String profileUrl;
	
	public SnsValue(String service, String cid, String cs, String rurl) {
		this.service = service;
		this.clientId = cid;
		this.clientSecret = cs;
		this.redirectUrl = rurl;
		if (StringUtils.equalsIgnoreCase(service, "naver")) {
			this.api20Instance = NaverAPI20.instacne();
			this.profileUrl = NAVER_PROFILE_URL;
		}else if (StringUtils.equalsIgnoreCase(service, "google")) {
			this.api20Instance = GoogleApi20.instance();
			this.profileUrl = GOOGLE_PROFILE_URL;
		}
	}
}
