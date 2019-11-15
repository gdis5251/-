/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019-11-15 ���� 9:17:31                        */
/*==============================================================*/


drop table if exists pms_base_area;

drop table if exists pms_base_building;

drop table if exists pms_base_group;

drop table if exists pms_base_owner;

drop table if exists pms_base_room;

drop table if exists pms_base_unit;

drop table if exists pms_charge_argument;

drop table if exists pms_charge_cost;

drop table if exists pms_charge_formula;

drop table if exists pms_charge_item;

drop table if exists pms_charge_order;

drop table if exists pms_charge_order_detail;

drop table if exists pms_charge_room_relation;

drop table if exists pms_sys_menu;

drop table if exists pms_sys_menu_rule;

drop table if exists pms_sys_rule;

drop table if exists pms_sys_user;

/*==============================================================*/
/* Table: pms_base_area                                         */
/*==============================================================*/
create table pms_base_area
(
   id                   bigint not null,
   areaName             varchar(50) not null,
   areaAddress          varchar(100) not null,
   areaManager          varchar(50) not null,
   areaTel              varchar(20) not null,
   groupID              bigint not null,
   groupIDList          varchar(300) not null,
   primary key (id)
);

alter table pms_base_area comment 'С����';

/*==============================================================*/
/* Table: pms_base_building                                     */
/*==============================================================*/
create table pms_base_building
(
   id                   bigint not null,
   buildingName         varchar(50) not null,
   buildingManager      varchar(50) not null,
   buildingManagerTel   varchar(20) not null,
   buildingFloor        int not null,
   areaID               bigint not null,
   primary key (id)
);

alter table pms_base_building comment '¥���';

/*==============================================================*/
/* Table: pms_base_group                                        */
/*==============================================================*/
create table pms_base_group
(
   id                   bigint not null,
   groupName            varchar(50) not null,
   groupRemark          varchar(100) not null,
   parentID             bigint not null,
   primary key (id)
);

alter table pms_base_group comment '��֯����';

/*==============================================================*/
/* Table: pms_base_owner                                        */
/*==============================================================*/
create table pms_base_owner
(
   id                   bigint not null,
   ownerName            varchar(50) not null,
   ownerTel             varchar(20) not null,
   ownerIDNumber        char(18) not null,
   primary key (id)
);

alter table pms_base_owner comment 'ҵ��';

/*==============================================================*/
/* Table: pms_base_room                                         */
/*==============================================================*/
create table pms_base_room
(
   id                   bigint not null,
   roomNumber           varchar(20) not null,
   roomArea             decimal(6,2) not null,
   roomFloor            tinyint not null,
   roomDirection        tinyint not null,
   roomType             tinyint not null,
   buildingID           bigint not null,
   buildingIDList       varchar(300) not null,
   unitID               bigint not null,
   ownerID              bigint not null,
   primary key (id)
);

alter table pms_base_room comment '�׻���';

/*==============================================================*/
/* Table: pms_base_unit                                         */
/*==============================================================*/
create table pms_base_unit
(
   id                   bigint not null,
   unitName             varchar(50) not null,
   buildingID           bigint not null,
   primary key (id)
);

alter table pms_base_unit comment '��Ԫ��';

/*==============================================================*/
/* Table: pms_charge_argument                                   */
/*==============================================================*/
create table pms_charge_argument
(
   id                   bigint not null,
   round                tinyint not null comment '1:��������(Ĭ��)
            2:ֻ�᲻��
            3:ֻ�벻��',
   precision            tinyint not null comment '1:��(Ĭ��)
            2:��
            3:Ԫ',
   primary key (id)
);

alter table pms_charge_argument comment '�շѲ�����';

/*==============================================================*/
/* Table: pms_charge_cost                                       */
/*==============================================================*/
create table pms_charge_cost
(
   id                   bigint not null,
   roomID               bigint not null,
   ownerID              bigint not null,
   chargeItemID         bigint not null,
   chargeItemName       varchar(50) not null,
   chargeFormulaID      bigint not null,
   formulaName          varchar(50) not null,
   feeUnitPrice         decimal(10,2) not null,
   formulaValue         varchar(1000) not null,
   feeAccount           decimal(10,2) not null,
   feePayment           decimal(10,2) not null,
   feeBalance           decimal(10,2) not null,
   collectDate          datetime not null,
   chargeBeginDate      datetime not null,
   chargeEndDate        datetime not null,
   primary key (id)
);

alter table pms_charge_cost comment 'Ӧ�ձ�';

/*==============================================================*/
/* Table: pms_charge_formula                                    */
/*==============================================================*/
create table pms_charge_formula
(
   id                   bigint not null,
   chargeItemID         bigint not null,
   formulaName          varchar(50) not null,
   formulaType          tinyint not null comment '0:����*���
            1:����*ʹ����
            2:����
            3:�Զ���',
   formulaValue         varchar(1000) not null,
   coefficient          decimal(3,2) not null,
   unitPrice            decimal(10,2) not null,
   primary key (id)
);

alter table pms_charge_formula comment '�շѹ�ʽ';

/*==============================================================*/
/* Table: pms_charge_item                                       */
/*==============================================================*/
create table pms_charge_item
(
   id                   bigint not null,
   chargeItemName       varchar(50) not null,
   chargeItemRemark     varchar(100) not null,
   chargeItemType       tinyint not null comment '0:������
            1:Ѻ����
            2:�Ǳ���
            3:��ʱ��
            ',
   primary key (id)
);

alter table pms_charge_item comment '�շ���Ŀ';

/*==============================================================*/
/* Table: pms_charge_order                                      */
/*==============================================================*/
create table pms_charge_order
(
   id                   bigint not null,
   orderNumber          varchar(50) not null,
   createDate           datetime not null,
   amount               decimal(10,2) not null,
   payMethod            tinyint not null comment '0:�ֽ�
            1:΢��֧��
            2:֧����
            3:POS��-���
            4:POS��-���ÿ�',
   operatorName         varchar(50) not null,
   operatorID           bigint not null,
   orderStatus          tinyint not null comment '1:��֧��
            2:֧���ɹ�
            3:�ر�',
   primary key (id)
);

alter table pms_charge_order comment '������';

/*==============================================================*/
/* Table: pms_charge_order_detail                               */
/*==============================================================*/
create table pms_charge_order_detail
(
   id                   bigint not null,
   orderID              bigint not null,
   costID               bigint not null,
   chargeItemName       varchar(50) not null,
   chargeItemID         bigint not null,
   chargeFormulaName    varchar(50) not null,
   chargeFormulaID      bigint not null,
   feeAccount           decimal(10,2) not null,
   feeBalance           decimal(10,2) not null,
   feePayment           decimal(10,2) not null,
   primary key (id)
);

alter table pms_charge_order_detail comment '������ϸ';

/*==============================================================*/
/* Table: pms_charge_room_relation                              */
/*==============================================================*/
create table pms_charge_room_relation
(
   id                   bigint not null,
   roomID               bigint not null,
   ownerID              bigint not null,
   chargeItemID         bigint not null,
   chargeFormulaID      bigint not null,
   primary key (id)
);

alter table pms_charge_room_relation comment '�շѹ�ʽ�����';

/*==============================================================*/
/* Table: pms_sys_menu                                          */
/*==============================================================*/
create table pms_sys_menu
(
   id                   bigint not null,
   menuTitle            varchar(50) not null,
   menuPath             varchar(50) not null,
   menuOrder            int not null,
   primary key (id)
);

alter table pms_sys_menu comment '�˵���';

/*==============================================================*/
/* Table: pms_sys_menu_rule                                     */
/*==============================================================*/
create table pms_sys_menu_rule
(
   id                   bigint not null,
   menuID               bigint not null,
   ruleID               bigint not null,
   primary key (id)
);

alter table pms_sys_menu_rule comment '�˵���ɫ������';

/*==============================================================*/
/* Table: pms_sys_rule                                          */
/*==============================================================*/
create table pms_sys_rule
(
   id                   bigint not null,
   ruleName             varchar(50) not null,
   ruleDesc             varchar(100) not null,
   primary key (id)
);

alter table pms_sys_rule comment '��ɫ��';

/*==============================================================*/
/* Table: pms_sys_user                                          */
/*==============================================================*/
create table pms_sys_user
(
   id                   bigint not null,
   loginName            varchar(50) not null,
   loginPassword        varchar(50) not null,
   userName             varchar(50) not null,
   userTel              varchar(20) not null,
   createDate           datetime not null,
   ruleID               bigint not null,
   primary key (id)
);

alter table pms_sys_user comment '�û���';

