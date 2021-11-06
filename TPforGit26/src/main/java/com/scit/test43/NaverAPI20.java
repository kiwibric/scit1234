package com.scit.test43;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls {
	private static NaverAPI20 _instance;
	private NaverAPI20() {
		
	}
	
	private static class InstanceHolder{
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}
	
	public static NaverAPI20 instacne() {
		if(_instance == null) {
			_instance = new NaverAPI20();
			
		}
		return _instance;
	}
	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	
	
	}
	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
}
