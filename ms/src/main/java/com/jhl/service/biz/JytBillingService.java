package com.jhl.service.biz;


import com.jhl.dao.BaseDaoSupport;
import com.jhl.entity.Page;
import com.jhl.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("jytbillingService")
public class JytBillingService {

	@Resource(name = "webDaoSupport")
	private BaseDaoSupport dao;
	
	/*
	* 新增
	*/
	public void save(PageData pd)throws Exception{
		dao.save("JytBillingMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		dao.delete("JytBillingMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		dao.update("JytBillingMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("JytBillingMapper.datalistPage", page);
	}
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("JytBillingMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("JytBillingMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("JytBillingMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 对账信息
	 */
	public PageData selectAll(PageData pd) throws Exception {
		return (PageData) dao.findForObject("JytBillingMapper.selectAll", pd);
	}
}

