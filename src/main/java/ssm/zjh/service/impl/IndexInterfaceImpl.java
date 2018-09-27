package ssm.zjh.service.impl;

import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;
import ssm.zjh.mapper.EquipMapper;
import ssm.zjh.pojo.Equip;
import ssm.zjh.service.IndexInterface;

@Service
public class IndexInterfaceImpl implements IndexInterface {
	@Autowired
	private EquipMapper em;
	
	@Autowired
	private Gson g;

	@Override
	public String indexInsert(String iname, String ilevel, String itype) {
		Equip equip = new Equip();
		equip.setEquipId(UUID.randomUUID().toString());
		equip.setEquipName(iname);
		equip.setEquipLevel(ilevel);
		equip.setEquipType(itype);
		try {
			return em.insert(equip) > 0 ? "SUCCESS" : "ERROR";
		} catch (Exception e) {
			return "ERROR";
		}
	}

	@Override
	public String indexRemove(String equipID) {
		try {
			return em.deleteByPrimaryKey(equipID) > 0 ? "SUCCESS" : "ERROR";
		} catch (Exception e) {
			return "ERROR";
		}
	}

	@Override
	public String getEquipListByJson() {
		return g.toJson(em.selectAllEquipList());
	}
}
