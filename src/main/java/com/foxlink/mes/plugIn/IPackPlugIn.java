package com.foxlink.mes.plugIn;

public interface IPackPlugIn {
	
	public String preMethod(String lotId, String palletId, String goodsId, String[] columns, Boolean unique,Integer routeId, Integer siteId);
	
	public void postMethod(String lotId, String palletId, String goodsId, String[] columns, Boolean unique,Integer routeId, Integer siteId);
	
	public String preMethod(String lotId, String palletId, String goodsId, String[] columns, Boolean unique,Integer routeId, Integer siteId ,Integer[] siteColumnIds,String attachmentId,String wifiId,String lanId,String poSerial,String orderId);
}
