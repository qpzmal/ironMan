������
    id
    �����ܽ������ɱ���
    ������λ�������ۣ����ڱ���
    �ͻ�������
    ӯ���ܽ��ͻ�����-�����ɱ���
    ����״̬��0��ʼ8������9������
    �߼�ɾ����ʾλ��ɾ����� ��0������1ɾ����
    ��������
    ��������
    ��ע
    
CREATE TABLE IF NOT EXISTS `t_order` (
  `id` INTEGER  PRIMARY KEY autoincrement,-- '����id'
  `order_total_salary` REAL NOT NULL DEFAULT '0' , -- '�����ܽ������ɱ���'
  `order_unit_salary` REAL NOT NULL DEFAULT '0' , -- '������λ�������ۣ����ڱ���'
  `repay_salary` REAL ,-- '�ͻ�������'
  `gain_salary` REAL , --'ӯ���ܽ��ͻ�����-�����ɱ���'
  `order_status` int NOT NULL DEFAULT '0' , -- '����״̬��0��ʼ8������9������'
  `del_flag` int NOT NULL DEFAULT '0' , -- 'ɾ����� ��0������1ɾ��'
  `create_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '��������'
  `update_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '��������'
  `remark` TEXT(128) DEFAULT '��'  -- '��ע'
)

    
Ͷ���˱�
    id
    Ͷ��������
    �߼�ɾ����ʾλ��ɾ����� ��0������1ɾ����
    ��������
    ��������
    ��ע
CREATE TABLE IF NOT EXISTS `t_investor` (
  `id` INTEGER  PRIMARY KEY autoincrement,-- 'id'
  `user_name` TEXT(12) DEFAULT '', -- Ͷ��������
  `del_flag` int NOT NULL DEFAULT '0' , -- 'ɾ����� ��0������1ɾ��'
  `create_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '��������'
  `update_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '��������'
  `remark` TEXT(128) DEFAULT '��'  -- '��ע'
)
    
    
Ͷ����Ͷ����ˮ��
    id
    Ͷ����id
    ����id
    ���ʽ��
    ӯ�����
    �Ƿ�ֳɣ�0���ֳɣ�1�ֳɣ�
    �߼�ɾ����ʾλ��ɾ����� ��0������1ɾ����
    ��������
    ��������
    ��ע
CREATE TABLE IF NOT EXISTS `t_investor_order` (
  `id` INTEGER  PRIMARY KEY autoincrement,-- 'id'
  `investor_id` int DEFAULT 0, -- Ͷ����id
  `order_id` int DEFAULT 0, -- ����id
  `sharing_flag` int DEFAULT 1, -- �Ƿ�ֳɣ�0���ֳɣ�1�ֳɣ�
  `invest_salary` REAL NOT NULL DEFAULT '0' , -- '�������ʽ��'
  `gain_salary` REAL NOT NULL DEFAULT '0' , -- '����ӯ�����'
  `del_flag` int NOT NULL DEFAULT '0' , -- 'ɾ����� ��0������1ɾ��'
  `create_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '��������'
  `update_time` TIMESTAMP NOT NULL DEFAULT (datetime('now', 'localtime')) , -- '��������'
  `remark` TEXT(128) DEFAULT '��'  -- '��ע'
)
    
������
    id
    �߼�ɾ����ʾλ��ɾ����� ��0������1ɾ����
    ��������
    ��������
    ��ע
    
-- mysql��
  `del_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ɾ����� ��0������1ɾ��',
  `item_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '״̬ ��0������1ͣ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remark` varchar(500) DEFAULT '��' COMMENT '��ע',
    
-- ������
drop table test;
create table test (
    [tkid]            integer PRIMARY KEY autoincrement,                -- ��������
    [tktype]          int default 0,
    [tableid]         varchar (50),
    [createdate]      datetime default (datetime('now', 'localtime'))    -- ʱ��
);