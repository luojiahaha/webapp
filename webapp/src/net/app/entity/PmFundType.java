package net.app.entity;

import javax.persistence.Entity;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
/** 
 * 产品类型
 * 
 */
@Entity
@Table(name = "pm_fund_type")
@SequenceGenerator(name = "sequenceGenerator", sequenceName = "pm_fund_type_sequence")
public class PmFundType extends BaseEntity{
	private static final long serialVersionUID = 3740749931470292300L;
	/** 产品类型名称 */
	private String fundTypeName;
	/** 产品类型状态 */
	private int fundTypeState;
	/** 备注 */
	private String remark;
	public String getFundTypeName() {
		return fundTypeName;
	}
	public void setFundTypeName(String fundTypeName) {
		this.fundTypeName = fundTypeName;
	}
	public int getFundTypeState() {
		return fundTypeState;
	}
	public void setFundTypeState(int fundTypeState) {
		this.fundTypeState = fundTypeState;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	   
	   
	   
}
