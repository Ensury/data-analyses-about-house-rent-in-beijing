use zufang;
create view hxfb as select '3室1厅1卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '3室1厅1卫') union select '3室1厅2卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '3室1厅2卫') union select '2室1厅1卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '2室1厅1卫') union select '3室2厅4卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '3室2厅4卫') union select '1室1厅1卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '1室1厅1卫') union select '2室2厅2卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '2室2厅2卫') union select '1室0厅1卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '1室0厅1卫') union select '4室2厅3卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '4室2厅3卫') union select '5室3厅5卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '5室3厅5卫') union select '5室3厅3卫' AS `hx`,count(0) AS `sl` from `chaoyang` where (`chaoyang`.`house_type` = '5室3厅3卫')