package ssm.zjh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ssm.zjh.service.IndexInterface;

@Controller
public class IndexController {

	@Autowired
	private IndexInterface ifi;

	@RequestMapping(value="/insertEquip.do",produces="text/html; charset=UTF-8")
	public @ResponseBody String indexInsert(String iname, String ilevel, String itype) {
		String result = ifi.indexInsert(iname, ilevel, itype);
		return result;
	}
	@RequestMapping(value="/indexShowAll.do",produces="text/html; charset=UTF-8")
	public @ResponseBody String indexShowAll() {
		return ifi.getEquipListByJson();
	}
	@RequestMapping(value="/removeEquip.do",produces="text/html; charset=UTF-8")
	public @ResponseBody String removeEquip(String equipID) {
		return ifi.indexRemove(equipID);
	}

}
