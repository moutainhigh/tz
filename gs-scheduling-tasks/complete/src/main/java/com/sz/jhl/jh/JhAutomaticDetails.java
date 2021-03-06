package com.sz.jhl.jh;

import com.alibaba.fastjson.JSONObject;
import com.sz.jhl.util.XmlUtil;

/**
 * Created by Administrator on 2016/2/26.
 * 转账交易结果查询实现类
 */
public class JhAutomaticDetails extends BaseJh{



    /**
     * （6W0500）转帐交易结果查询
     * <p> Create Date: 2014-5-10 </p>
     * @return
     */
    private static String buildReqXml(String requestSn, String custId, String userId, String password, String requestSn1){
        StringBuffer reqXml = new StringBuffer();
        reqXml.append("<?xml version=\"1.0\" encoding=\"GB2312\" standalone=\"yes\" ?>");
        reqXml.append("<TX>")
                .append("<REQUEST_SN>").append(requestSn).append("</REQUEST_SN>").//请求序列码
                append("<CUST_ID>").append(custId).append("</CUST_ID>").//客户号
                append("<USER_ID>").append(userId).append("</USER_ID>").//操作员号
                append("<PASSWORD>").append(password).append("</PASSWORD>").//密码
                append("<TX_CODE>6W0500</TX_CODE>").//请求交易码
                append("<LANGUAGE>CN</LANGUAGE>").
                append("<TX_INFO>").
                append("<REQUEST_SN1>").append(requestSn1).append("</REQUEST_SN1>").//原交易请求序列码
                append("</TX_INFO>").
                append("</TX>");
        return reqXml.toString();

    }

    @Override
    protected JSONObject parseBizResp(JSONObject headJson, String xml) throws Exception {
        JSONObject respJson = headJson;
        respJson.put("CREDIT_NO", XmlUtil.getTxtInfo(xml,"CREDIT_NO"));//凭证号
        respJson.put("DEAL_RESULT", XmlUtil.getTxtInfo(xml,"DEAL_RESULT"));//处理方式
        respJson.put("MESSAGE", XmlUtil.getTxtInfo(xml,"MESSAGE"));//错误原因
        respJson.put("REM1", XmlUtil.getTxtInfo(xml,"REM1"));//备注1
        respJson.put("REM2", XmlUtil.getTxtInfo(xml,"REM2"));//备注2
        return respJson;
    }

    public static void main(String[] args) throws Exception {
//        Map<String,String> paramMap = new HashMap<String,String>();
//        paramMap.put("requestXml", JhAutomaticDetails.buildReqXml(SeqNoUtil.nextSeqNo(),"SZP717856009#002","WLPT05","999999","201510290102"));
//        String res = HttpClient431Util.sendXmlData("http://58.0.99.176:8888",paramMap);
//        System.out.println(res);
//        JhAutomaticDetails jhBinding = new JhAutomaticDetails();
//        System.out.println(jhBinding.parseResp(res).toJSONString());
    }

}

