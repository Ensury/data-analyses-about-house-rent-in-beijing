use zufang;
create view avgmjzj as select '西城区' AS `qy`,avg(`xicheng`.`Rent_area`) AS `mjzjdata` from `xicheng` union select '东城区' AS `qy`,avg(`dongcheng`.`Rent_area`) AS `mjzjdata` from `dongcheng` union select '海淀区' AS `qy`,avg(`haidian`.`Rent_area`) AS `mjzjdata` from `haidian` union select '朝阳区' AS `qy`,avg(`chaoyang`.`Rent_area`) AS `mjzjdata` from `chaoyang` union select '大兴区' AS `qy`,avg(`daxing`.`Rent_area`) AS `mjzjdata` from `daxing` union select '丰台区' AS `qy`,avg(`fengtai`.`Rent_area`) AS `mjzjdata` from `fengtai`