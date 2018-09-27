package ssm;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Repeat;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;
import ssm.zjh.service.IndexInterface;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class EquipTest {
	@Autowired
	private IndexInterface ifi;
	@Test
	@Transactional
	@Rollback
	@Repeat(100)
	public void removeEquip() {
		System.out.println(ifi.indexRemove("1adabd36-876d-4dc0-9bca-8866fe8e0c59"));
	}
}
