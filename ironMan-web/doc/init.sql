订单表
    id
    订单总金额（进货成本）
    订单单位金额（进货价，用于报表）
    客户返款金额
    盈利总金额（客户返款-进货成本）
    订单状态（0开始8返款中9结束）
    逻辑删除标示位（删除标记 ，0正常，1删除）
    建立日期
    更新日期
    备注
    
CREATE TABLE IF NOT EXISTS `t_order` (
  `id` INTEGER  PRIMARY KEY autoincrement,-- '订单id'
  `order_total_salary` REAL NOT NULL DEFAULT '0' , -- '订单总金额（进货成本）'
  `order_unit_salary` REAL NOT NULL DEFAULT '0' , -- '订单单位金额（进货价，用于报表）'
  `repay_salary` REAL ,-- '客户返款金额'
  `gain_salary` REAL , --'盈利总金额（客户返款-进货成本）'
  `order_status` int NOT NULL DEFAULT '0' , -- '订单状态（0开始8返款中9结束）'
  `del_flag` int NOT NULL DEFAULT '0' , -- '删除标记 ，0正常，1删除'
  `create_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '建立日期'
  `update_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '更新日期'
  `remark` TEXT(128) DEFAULT '无'  -- '备注'
)

    
投资人表
    id
    投资人姓名
    逻辑删除标示位（删除标记 ，0正常，1删除）
    建立日期
    更新日期
    备注
CREATE TABLE IF NOT EXISTS `t_investor` (
  `id` INTEGER  PRIMARY KEY autoincrement,-- 'id'
  `user_name` TEXT(12) DEFAULT '', -- 投资人姓名
  `del_flag` int NOT NULL DEFAULT '0' , -- '删除标记 ，0正常，1删除'
  `create_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '建立日期'
  `update_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '更新日期'
  `remark` TEXT(128) DEFAULT '无'  -- '备注'
)
    
    
投资人投资流水表
    id
    投资人id
    订单id
    出资金额
    盈利金额
    是否分成（0不分成；1分成）
    逻辑删除标示位（删除标记 ，0正常，1删除）
    建立日期
    更新日期
    备注
CREATE TABLE IF NOT EXISTS `t_investor_order` (
  `id` INTEGER  PRIMARY KEY autoincrement,-- 'id'
  `investor_id` int DEFAULT 0, -- 投资人id
  `order_id` int DEFAULT 0, -- 订单id
  `sharing_flag` int DEFAULT 1, -- 是否分成（0不分成；1分成）
  `invest_salary` REAL NOT NULL DEFAULT '0' , -- '订单出资金额'
  `gain_salary` REAL NOT NULL DEFAULT '0' , -- '订单盈利金额'
  `del_flag` int NOT NULL DEFAULT '0' , -- '删除标记 ，0正常，1删除'
  `create_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '建立日期'
  `update_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '更新日期'
  `remark` TEXT(128) DEFAULT '无'  -- '备注'
)
    
基本表
    id
    逻辑删除标示位（删除标记 ，0正常，1删除）
    建立日期
    更新日期
    备注
    
-- mysql用
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标记 ，0正常，1删除',
  `item_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 ，0正常；1停用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) DEFAULT '无' COMMENT '备注',
    
-- 测试用
drop table test;
create table test (
    [tkid]            integer PRIMARY KEY autoincrement,                -- 设置主键
    [tktype]          int default 0,
    [tableid]         varchar (50),
    [createdate]      datetime default (datetime('now', 'localtime'))    -- 时间
);