package com.jhl.proxy.impl.jh;

import com.alibaba.fastjson.JSONObject;
import com.jhl.util.HttpClient431Util;
import com.jhl.util.SeqNoUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2016/2/26.
 * 非自动转账交易实现类
 */
public class JhUnAutomatic extends BaseJh {

    public void send(){
        //String response = sendMsg();parseResp()
    }

    /**
     * （6W8020）非自动转帐交易xml
     * <p> Create Date: 2014-5-10 </p>
     * @return
     */
    private static String buildReqXml(String requestSn, String custId, String userId, String password,
                               String payAccno, String recvAccno, String RecvAccName, String RecvOpenaccDept,
                               String recvUbankno, String amount, String curType, String useof, String rem1, String rem2, String signInfo, String signCert){
        StringBuffer reqXml = new StringBuffer();
        reqXml.append("<?xml version=\"1.0\" encoding=\"GB2312\" standalone=\"yes\" ?>");
        reqXml.append("<TX>")
                .append("<REQUEST_SN>").append(requestSn).append("</REQUEST_SN>").//请求序列码
                append("<CUST_ID>").append(custId).append("</CUST_ID>").//客户号
                append("<USER_ID>").append(userId).append("</USER_ID>").//操作员号
                append("<PASSWORD>").append(password).append("</PASSWORD>").//密码
                append("<TX_CODE>6W8020</TX_CODE>").//请求交易码
                append("<LANGUAGE>CN</LANGUAGE>").
                append("<TX_INFO>").
                append("<PAY_ACCNO>").append(payAccno).append("</PAY_ACCNO>").//转出账户号
                append("<RECV_ACCNO>").append(recvAccno).append("</RECV_ACCNO>").//转入账户号
                append("<RECV_ACC_NAME>").append(RecvAccName).append("</RECV_ACC_NAME>").//转入账户名称
                append("<RECV_OPENACC_DEPT>").append(RecvOpenaccDept).append("</RECV_OPENACC_DEPT>").//转入账户开户机构名称
                append("<RECV_UBANKNO>").append(recvUbankno).append("</RECV_UBANKNO>").//转入账户联行号
                append("<AMOUNT>").append(amount).append("</AMOUNT>").//金额
                append("<CUR_TYPE>").append(curType).append("</CUR_TYPE>").//币种
                append("<USEOF>").append(useof).append("</USEOF>").//用途
                append("<REM1>").append(rem1).append("</REM1>").//备注1
                append("<REM2>").append(rem2).append("</REM2>").//备注2
                append("</TX_INFO>").
                append("<SIGN_INFO>").append(signInfo).append("</SIGN_INFO>").//签名信息
                append("<SIGNCERT>").append(signCert).append("</SIGNCERT>").//签名CA信息
                append("</TX>");
        return reqXml.toString();

    }

    @Override
    protected JSONObject parseBizResp(JSONObject headJson, String xml) throws Exception {
        JSONObject respJson = headJson;
        respJson.put("CREDIT_NO",JhClientMsg.getTxtInfo(xml,"CREDIT_NO"));//凭证号
        respJson.put("DEAL_TYPE",JhClientMsg.getTxtInfo(xml,"DEAL_TYPE"));//处理方式
        respJson.put("VALIDATE_CODE",JhClientMsg.getTxtInfo(xml,"VALIDATE_CODE"));//验证码
        respJson.put("INDIVIDUAL1",JhClientMsg.getTxtInfo(xml,"INDIVIDUAL1"));//自定义输出内容1
        respJson.put("INDIVIDUAL_NAME2",JhClientMsg.getTxtInfo(xml,"INDIVIDUAL_NAME2"));//自定义输出名称2
        respJson.put("INDIVIDUAL2",JhClientMsg.getTxtInfo(xml,"INDIVIDUAL2"));//自定义输出内容2
        respJson.put("REM1",JhClientMsg.getTxtInfo(xml,"REM1"));//备注1
        respJson.put("REM2",JhClientMsg.getTxtInfo(xml,"REM2"));//备注2

        return respJson;
    }


    public static void main(String[] args) throws Exception {
        Map<String,String> paramMap = new HashMap<String,String>();
        paramMap.put("requestXml", JhUnAutomatic.buildReqXml("201510291008","SZP717856009#002","WLPT05","999999",
                "44201501100052511215", "44001400101053013342", "测试账号", "中国建设银行深圳市分行营业部", "", "0.05",
                "01", "非自动转账", "","", "",""));
        String res = HttpClient431Util.sendXmlData("http://58.0.99.176:8888",paramMap);
        System.out.println(res);
        JhUnAutomatic jhBinding = new JhUnAutomatic();
        System.out.println(jhBinding.parseResp(res).toJSONString());
    }
}
