use zufang;
create view qyzf as select `data2`.`qu` AS `qy`,sum(`data2`.`num`) AS `zfdata` from `data2` where (`data2`.`qu` = '海淀') union select `data2`.`qu` AS `qy`,sum(`data2`.`num`) AS `zfdata` from `data2` where (`data2`.`qu` = '东城') union select `data2`.`qu` AS `qy`,sum(`data2`.`num`) AS `zfdata` from `data2` where (`data2`.`qu` = '朝阳') union select `data2`.`qu` AS `qy`,sum(`data2`.`num`) AS `zfdata` from `data2` where (`data2`.`qu` = '西城') union select `data2`.`qu` AS `qy`,sum(`data2`.`num`) AS `zfdata` from `data2` where (`data2`.`qu` = '朝阳') union select `data2`.`qu` AS `qy`,sum(`data2`.`num`) AS `zfdata` from `data2` where (`data2`.`qu` = '大兴') union select `data2`.`qu` AS `qy`,sum(`data2`.`num`) AS `zfdata` from `data2` where (`data2`.`qu` = '丰台')