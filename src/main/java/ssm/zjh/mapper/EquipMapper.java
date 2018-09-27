package ssm.zjh.mapper;

import java.util.List;

import ssm.zjh.pojo.Equip;

public interface EquipMapper {
    int deleteByPrimaryKey(String equipId);

    int insert(Equip record);

    int insertSelective(Equip record);

    Equip selectByPrimaryKey(String equipId);

    int updateByPrimaryKeySelective(Equip record);

    int updateByPrimaryKey(Equip record);
    
    List<Equip> selectAllEquipList();
}