package ssm.zjh.service;

public interface IndexInterface {
	
	String indexInsert(String iname,String ilevel,String itype);
	
	String indexRemove(String iid);
	
	String getEquipListByJson();
		
}
