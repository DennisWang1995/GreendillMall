/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/19 22:17:44                           */
/*==============================================================*/

drop database if exists `greendillmall_oms`;

create database `greendillmall_oms`;

use greendillmall_oms;

drop table if exists oms_order;

drop table if exists oms_order_item;

drop table if exists oms_order_operate_history;

drop table if exists oms_order_return_apply;

drop table if exists oms_order_return_reason;

drop table if exists oms_order_setting;

drop table if exists oms_payment_info;

drop table if exists oms_refund_info;

/*==============================================================*/
/* Table: oms_order                                             */
/*==============================================================*/
create table oms_order
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment 'member_id',
   order_sn             char(32) comment '������',
   coupon_id            bigint comment 'ʹ�õ��Ż�ȯ',
   create_time          datetime comment 'create_time',
   member_username      varchar(200) comment '�û���',
   total_amount         decimal(18,4) comment '�����ܶ�',
   pay_amount           decimal(18,4) comment 'Ӧ���ܶ�',
   freight_amount       decimal(18,4) comment '�˷ѽ��',
   promotion_amount     decimal(18,4) comment '�����Ż��������ۡ����������ݼۣ�',
   integration_amount   decimal(18,4) comment '���ֵֿ۽��',
   coupon_amount        decimal(18,4) comment '�Ż�ȯ�ֿ۽��',
   discount_amount      decimal(18,4) comment '��̨��������ʹ�õ��ۿ۽��',
   pay_type             tinyint comment '֧����ʽ��1->֧������2->΢�ţ�3->������ 4->���������',
   source_type          tinyint comment '������Դ[0->PC������1->app����]',
   status               tinyint comment '����״̬��0->�����1->��������2->�ѷ�����3->����ɣ�4->�ѹرգ�5->��Ч������',
   delivery_company     varchar(64) comment '������˾(���ͷ�ʽ)',
   delivery_sn          varchar(64) comment '��������',
   auto_confirm_day     int comment '�Զ�ȷ��ʱ�䣨�죩',
   integration          int comment '���Ի�õĻ���',
   growth               int comment '���Ի�õĳɳ�ֵ',
   bill_type            tinyint comment '��Ʊ����[0->������Ʊ��1->���ӷ�Ʊ��2->ֽ�ʷ�Ʊ]',
   bill_header          varchar(255) comment '��Ʊ̧ͷ',
   bill_content         varchar(255) comment '��Ʊ����',
   bill_receiver_phone  varchar(32) comment '��Ʊ�˵绰',
   bill_receiver_email  varchar(64) comment '��Ʊ������',
   receiver_name        varchar(100) comment '�ջ�������',
   receiver_phone       varchar(32) comment '�ջ��˵绰',
   receiver_post_code   varchar(32) comment '�ջ����ʱ�',
   receiver_province    varchar(32) comment 'ʡ��/ֱϽ��',
   receiver_city        varchar(32) comment '����',
   receiver_region      varchar(32) comment '��',
   receiver_detail_address varchar(200) comment '��ϸ��ַ',
   note                 varchar(500) comment '������ע',
   confirm_status       tinyint comment 'ȷ���ջ�״̬[0->δȷ�ϣ�1->��ȷ��]',
   delete_status        tinyint comment 'ɾ��״̬��0->δɾ����1->��ɾ����',
   use_integration      int comment '�µ�ʱʹ�õĻ���',
   payment_time         datetime comment '֧��ʱ��',
   delivery_time        datetime comment '����ʱ��',
   receive_time         datetime comment 'ȷ���ջ�ʱ��',
   comment_time         datetime comment '����ʱ��',
   modify_time          datetime comment '�޸�ʱ��',
   primary key (id)
);

alter table oms_order comment '����';

/*==============================================================*/
/* Table: oms_order_item                                        */
/*==============================================================*/
create table oms_order_item
(
   id                   bigint not null auto_increment comment 'id',
   order_id             bigint comment 'order_id',
   order_sn             char(32) comment 'order_sn',
   spu_id               bigint comment 'spu_id',
   spu_name             varchar(255) comment 'spu_name',
   spu_pic              varchar(500) comment 'spu_pic',
   spu_brand            varchar(200) comment 'Ʒ��',
   category_id          bigint comment '��Ʒ����id',
   sku_id               bigint comment '��Ʒsku���',
   sku_name             varchar(255) comment '��Ʒsku����',
   sku_pic              varchar(500) comment '��ƷskuͼƬ',
   sku_price            decimal(18,4) comment '��Ʒsku�۸�',
   sku_quantity         int comment '��Ʒ���������',
   sku_attrs_vals       varchar(500) comment '��Ʒ����������ϣ�JSON��',
   promotion_amount     decimal(18,4) comment '��Ʒ�����ֽ���',
   coupon_amount        decimal(18,4) comment '�Ż�ȯ�Żݷֽ���',
   integration_amount   decimal(18,4) comment '�����Żݷֽ���',
   real_amount          decimal(18,4) comment '����Ʒ�����Żݺ�ķֽ���',
   gift_integration     int comment '���ͻ���',
   gift_growth          int comment '���ͳɳ�ֵ',
   primary key (id)
);

alter table oms_order_item comment '��������Ϣ';

/*==============================================================*/
/* Table: oms_order_operate_history                             */
/*==============================================================*/
create table oms_order_operate_history
(
   id                   bigint not null auto_increment comment 'id',
   order_id             bigint comment '����id',
   operate_man          varchar(100) comment '������[�û���ϵͳ����̨����Ա]',
   create_time          datetime comment '����ʱ��',
   order_status         tinyint comment '����״̬��0->�����1->��������2->�ѷ�����3->����ɣ�4->�ѹرգ�5->��Ч������',
   note                 varchar(500) comment '��ע',
   primary key (id)
);

alter table oms_order_operate_history comment '����������ʷ��¼';

/*==============================================================*/
/* Table: oms_order_return_apply                                */
/*==============================================================*/
create table oms_order_return_apply
(
   id                   bigint not null auto_increment comment 'id',
   order_id             bigint comment 'order_id',
   sku_id               bigint comment '�˻���Ʒid',
   order_sn             char(32) comment '�������',
   create_time          datetime comment '����ʱ��',
   member_username      varchar(64) comment '��Ա�û���',
   return_amount        decimal(18,4) comment '�˿���',
   return_name          varchar(100) comment '�˻�������',
   return_phone         varchar(20) comment '�˻��˵绰',
   status               tinyint(1) comment '����״̬[0->������1->�˻��У�2->����ɣ�3->�Ѿܾ�]',
   handle_time          datetime comment '����ʱ��',
   sku_img              varchar(500) comment '��ƷͼƬ',
   sku_name             varchar(200) comment '��Ʒ����',
   sku_brand            varchar(200) comment '��ƷƷ��',
   sku_attrs_vals       varchar(500) comment '��Ʒ��������(JSON)',
   sku_count            int comment '�˻�����',
   sku_price            decimal(18,4) comment '��Ʒ����',
   sku_real_price       decimal(18,4) comment '��Ʒʵ��֧������',
   reason               varchar(200) comment 'ԭ��',
   description��         varchar(500) comment '����',
   desc_pics            varchar(2000) comment 'ƾ֤ͼƬ���Զ��Ÿ���',
   handle_note          varchar(500) comment '����ע',
   handle_man           varchar(200) comment '������Ա',
   receive_man          varchar(100) comment '�ջ���',
   receive_time         datetime comment '�ջ�ʱ��',
   receive_note         varchar(500) comment '�ջ���ע',
   receive_phone        varchar(20) comment '�ջ��绰',
   company_address      varchar(500) comment '��˾�ջ���ַ',
   primary key (id)
);

alter table oms_order_return_apply comment '�����˻�����';

/*==============================================================*/
/* Table: oms_order_return_reason                               */
/*==============================================================*/
create table oms_order_return_reason
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(200) comment '�˻�ԭ����',
   sort                 int comment '����',
   status               tinyint(1) comment '����״̬',
   create_time          datetime comment 'create_time',
   primary key (id)
);

alter table oms_order_return_reason comment '�˻�ԭ��';

/*==============================================================*/
/* Table: oms_order_setting                                     */
/*==============================================================*/
create table oms_order_setting
(
   id                   bigint not null auto_increment comment 'id',
   flash_order_overtime int comment '��ɱ������ʱ�ر�ʱ��(��)',
   normal_order_overtime int comment '����������ʱʱ��(��)',
   confirm_overtime     int comment '�������Զ�ȷ���ջ�ʱ�䣨�죩',
   finish_overtime      int comment '�Զ���ɽ���ʱ�䣬���������˻����죩',
   comment_overtime     int comment '������ɺ��Զ�����ʱ�䣨�죩',
   member_level         tinyint(2) comment '��Ա�ȼ���0-���޻�Ա�ȼ���ȫ��ͨ�ã�����-��Ӧ��������Ա�ȼ���',
   primary key (id)
);

alter table oms_order_setting comment '����������Ϣ';

/*==============================================================*/
/* Table: oms_payment_info                                      */
/*==============================================================*/
create table oms_payment_info
(
   id                   bigint not null auto_increment comment 'id',
   order_sn             char(32) comment '�����ţ�����ҵ��ţ�',
   order_id             bigint comment '����id',
   alipay_trade_no      varchar(50) comment '֧����������ˮ��',
   total_amount         decimal(18,4) comment '֧���ܽ��',
   subject              varchar(200) comment '��������',
   payment_status       varchar(20) comment '֧��״̬',
   create_time          datetime comment '����ʱ��',
   confirm_time         datetime comment 'ȷ��ʱ��',
   callback_content     varchar(4000) comment '�ص�����',
   callback_time        datetime comment '�ص�ʱ��',
   primary key (id)
);

alter table oms_payment_info comment '֧����Ϣ��';

/*==============================================================*/
/* Table: oms_refund_info                                       */
/*==============================================================*/
create table oms_refund_info
(
   id                   bigint not null auto_increment comment 'id',
   order_return_id      bigint comment '�˿�Ķ���',
   refund               decimal(18,4) comment '�˿���',
   refund_sn            varchar(64) comment '�˿����ˮ��',
   refund_status        tinyint(1) comment '�˿�״̬',
   refund_channel       tinyint comment '�˿�����[1-֧������2-΢�ţ�3-������4-���]',
   refund_content       varchar(5000),
   primary key (id)
);

alter table oms_refund_info comment '�˿���Ϣ';


drop database if exists `greendillmall_pms`;

create database `greendillmall_pms`;

use greendillmall_pms;

drop table if exists pms_attr;

drop table if exists pms_attr_attrgroup_relation;

drop table if exists pms_attr_group;

drop table if exists pms_brand;

drop table if exists pms_category;

drop table if exists pms_comment_replay;

drop table if exists pms_product_attr_value;

drop table if exists pms_sku_images;

drop table if exists pms_sku_info;

drop table if exists pms_sku_sale_attr_value;

drop table if exists pms_spu_comment;

drop table if exists pms_spu_images;

drop table if exists pms_spu_info;

drop table if exists pms_spu_info_desc;

/*==============================================================*/
/* Table: pms_attr                                              */
/*==============================================================*/
create table pms_attr
(
   attr_id              bigint not null auto_increment comment '����id',
   attr_name            char(30) comment '������',
   search_type          tinyint comment '�Ƿ���Ҫ����[0-����Ҫ��1-��Ҫ]',
   icon                 varchar(255) comment '����ͼ��',
   value_select         char(255) comment '��ѡֵ�б�[�ö��ŷָ�]',
   attr_type            tinyint comment '��������[0-�������ԣ�1-�������ԣ�2-���������������ǻ�������]',
   enable               bigint comment '����״̬[0 - ���ã�1 - ����]',
   catelog_id           bigint comment '��������',
   show_desc            tinyint comment '����չʾ���Ƿ�չʾ�ڽ����ϣ�0-�� 1-�ǡ�����sku����Ȼ���Ե���',
   primary key (attr_id)
);

alter table pms_attr comment '��Ʒ����';

/*==============================================================*/
/* Table: pms_attr_attrgroup_relation                           */
/*==============================================================*/
create table pms_attr_attrgroup_relation
(
   id                   bigint not null auto_increment comment 'id',
   attr_id              bigint comment '����id',
   attr_group_id        bigint comment '���Է���id',
   attr_sort            int comment '������������',
   primary key (id)
);

alter table pms_attr_attrgroup_relation comment '����&���Է������';

/*==============================================================*/
/* Table: pms_attr_group                                        */
/*==============================================================*/
create table pms_attr_group
(
   attr_group_id        bigint not null auto_increment comment '����id',
   attr_group_name      char(20) comment '����',
   sort                 int comment '����',
   descript             varchar(255) comment '����',
   icon                 varchar(255) comment '��ͼ��',
   catelog_id           bigint comment '��������id',
   primary key (attr_group_id)
);

alter table pms_attr_group comment '���Է���';

/*==============================================================*/
/* Table: pms_brand                                             */
/*==============================================================*/
create table pms_brand
(
   brand_id             bigint not null auto_increment comment 'Ʒ��id',
   name                 char(50) comment 'Ʒ����',
   logo                 varchar(2000) comment 'Ʒ��logo��ַ',
   descript             longtext comment '����',
   show_status          tinyint comment '��ʾ״̬[0-����ʾ��1-��ʾ]',
   first_letter         char(1) comment '��������ĸ',
   sort                 int comment '����',
   primary key (brand_id)
);

alter table pms_brand comment 'Ʒ��';

/*==============================================================*/
/* Table: pms_category                                          */
/*==============================================================*/
create table pms_category
(
   cat_id               bigint not null auto_increment comment '����id',
   name                 char(50) comment '��������',
   parent_cid           bigint comment '������id',
   cat_level            int comment '�㼶',
   show_status          tinyint comment '�Ƿ���ʾ[0-����ʾ��1��ʾ]',
   sort                 int comment '����',
   icon                 char(255) comment 'ͼ���ַ',
   product_unit         char(50) comment '������λ',
   product_count        int comment '��Ʒ����',
   primary key (cat_id)
);

alter table pms_category comment '��Ʒ��������';

/*==============================================================*/
/* Table: pms_comment_replay                                    */
/*==============================================================*/
create table pms_comment_replay
(
   id                   bigint not null auto_increment comment 'id',
   comment_id           bigint comment '����id',
   reply_id             bigint comment '�ظ�id',
   primary key (id)
);

alter table pms_comment_replay comment '��Ʒ���ۻظ���ϵ';

/*==============================================================*/
/* Table: pms_product_attr_value                                */
/*==============================================================*/
create table pms_product_attr_value
(
   id                   bigint not null auto_increment comment 'id',
   spu_id               bigint comment '��Ʒid',
   attr_id              bigint comment '����id',
   attr_name            varchar(200) comment '������',
   attr_value           varchar(200) comment '����ֵ',
   attr_sort            int comment '˳��',
   quick_show           tinyint comment '����չʾ���Ƿ�չʾ�ڽ����ϣ�0-�� 1-�ǡ�',
   primary key (id)
);

alter table pms_product_attr_value comment 'spu����ֵ';

/*==============================================================*/
/* Table: pms_sku_images                                        */
/*==============================================================*/
create table pms_sku_images
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'sku_id',
   img_url              varchar(255) comment 'ͼƬ��ַ',
   img_sort             int comment '����',
   default_img          int comment 'Ĭ��ͼ[0 - ����Ĭ��ͼ��1 - ��Ĭ��ͼ]',
   primary key (id)
);

alter table pms_sku_images comment 'skuͼƬ';

/*==============================================================*/
/* Table: pms_sku_info                                          */
/*==============================================================*/
create table pms_sku_info
(
   sku_id               bigint not null auto_increment comment 'skuId',
   spu_id               bigint comment 'spuId',
   sku_name             varchar(255) comment 'sku����',
   sku_desc             varchar(2000) comment 'sku��������',
   catalog_id           bigint comment '��������id',
   brand_id             bigint comment 'Ʒ��id',
   sku_default_img      varchar(255) comment 'Ĭ��ͼƬ',
   sku_title            varchar(255) comment '����',
   sku_subtitle         varchar(2000) comment '������',
   price                decimal(18,4) comment '�۸�',
   sale_count           bigint comment '����',
   primary key (sku_id)
);

alter table pms_sku_info comment 'sku��Ϣ';

/*==============================================================*/
/* Table: pms_sku_sale_attr_value                               */
/*==============================================================*/
create table pms_sku_sale_attr_value
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'sku_id',
   attr_id              bigint comment 'attr_id',
   attr_name            varchar(200) comment '����������',
   attr_value           varchar(200) comment '��������ֵ',
   attr_sort            int comment '˳��',
   primary key (id)
);

alter table pms_sku_sale_attr_value comment 'sku��������&ֵ';

/*==============================================================*/
/* Table: pms_spu_comment                                       */
/*==============================================================*/
create table pms_spu_comment
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'sku_id',
   spu_id               bigint comment 'spu_id',
   spu_name             varchar(255) comment '��Ʒ����',
   member_nick_name     varchar(255) comment '��Ա�ǳ�',
   star                 tinyint(1) comment '�Ǽ�',
   member_ip            varchar(64) comment '��Աip',
   create_time          datetime comment '����ʱ��',
   show_status          tinyint(1) comment '��ʾ״̬[0-����ʾ��1-��ʾ]',
   spu_attributes       varchar(255) comment '����ʱ�������',
   likes_count          int comment '������',
   reply_count          int comment '�ظ���',
   resources            varchar(1000) comment '����ͼƬ/��Ƶ[json���ݣ�[{type:�ļ�����,url:��Դ·��}]]',
   content              text comment '����',
   member_icon          varchar(255) comment '�û�ͷ��',
   comment_type         tinyint comment '��������[0 - ����Ʒ��ֱ�����ۣ�1 - �����۵Ļظ�]',
   primary key (id)
);

alter table pms_spu_comment comment '��Ʒ����';

/*==============================================================*/
/* Table: pms_spu_images                                        */
/*==============================================================*/
create table pms_spu_images
(
   id                   bigint not null auto_increment comment 'id',
   spu_id               bigint comment 'spu_id',
   img_name             varchar(200) comment 'ͼƬ��',
   img_url              varchar(255) comment 'ͼƬ��ַ',
   img_sort             int comment '˳��',
   default_img          tinyint comment '�Ƿ�Ĭ��ͼ',
   primary key (id)
);

alter table pms_spu_images comment 'spuͼƬ';

/*==============================================================*/
/* Table: pms_spu_info                                          */
/*==============================================================*/
create table pms_spu_info
(
   id                   bigint not null auto_increment comment '��Ʒid',
   spu_name             varchar(200) comment '��Ʒ����',
   spu_description      varchar(1000) comment '��Ʒ����',
   catalog_id           bigint comment '��������id',
   brand_id             bigint comment 'Ʒ��id',
   weight               decimal(18,4),
   publish_status       tinyint comment '�ϼ�״̬[0 - �¼ܣ�1 - �ϼ�]',
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

alter table pms_spu_info comment 'spu��Ϣ';

/*==============================================================*/
/* Table: pms_spu_info_desc                                     */
/*==============================================================*/
create table pms_spu_info_desc
(
   spu_id               bigint not null comment '��Ʒid',
   decript              longtext comment '��Ʒ����',
   primary key (spu_id)
);

alter table pms_spu_info_desc comment 'spu��Ϣ����';

drop database if exists `greendillmall_sms`;

create database `greendillmall_sms`;

use greendillmall_sms;

drop table if exists sms_category_bounds;

drop table if exists sms_coupon;

drop table if exists sms_coupon_history;

drop table if exists sms_coupon_spu_category_relation;

drop table if exists sms_coupon_spu_relation;

drop table if exists sms_home_adv;

drop table if exists sms_home_subject;

drop table if exists sms_home_subject_spu;

drop table if exists sms_member_price;

drop table if exists sms_seckill_promotion;

drop table if exists sms_seckill_session;

drop table if exists sms_seckill_sku_notice;

drop table if exists sms_seckill_sku_relation;

drop table if exists sms_sku_bounds;

drop table if exists sms_sku_full_reduction;

drop table if exists sms_sku_ladder;

drop table if exists sms_spu_bounds;


/*==============================================================*/
/* Table: sms_category_bounds                                   */
/*==============================================================*/
create table sms_category_bounds
(
   id                   bigint not null auto_increment comment 'id',
   category_id          bigint,
   grow_bounds          decimal(18,4) comment '�ɳ�����',
   buy_bounds           decimal(18,4) comment '�������',
   work                 tinyint(1) comment '�Ż���Ч���[1111���ĸ�״̬λ�����ҵ���;0 - ���Żݣ��ɳ������Ƿ�����;1 - ���Żݣ���������Ƿ�����;2 - ���Żݣ��ɳ������Ƿ�����;3 - ���Żݣ���������Ƿ����͡�״̬λ0�������ͣ�1�����͡�]',
   primary key (id)
);

alter table sms_category_bounds comment '��Ʒ�����������';

/*==============================================================*/
/* Table: sms_coupon                                            */
/*==============================================================*/
create table sms_coupon
(
   id                   bigint not null auto_increment comment 'id',
   coupon_type          tinyint(1) comment '�Żݾ�����[0->ȫ����ȯ��1->��Ա��ȯ��2->������ȯ��3->ע����ȯ]',
   coupon_img           varchar(2000) comment '�Ż�ȯͼƬ',
   coupon_name          varchar(100) comment '�Żݾ�����',
   num                  int comment '����',
   amount               decimal(18,4) comment '���',
   per_limit            int comment 'ÿ����������',
   min_point            decimal(18,4) comment 'ʹ���ż�',
   start_time           datetime comment '��ʼʱ��',
   end_time             datetime comment '����ʱ��',
   use_type             tinyint(1) comment 'ʹ������[0->ȫ��ͨ�ã�1->ָ�����ࣻ2->ָ����Ʒ]',
   note                 varchar(200) comment '��ע',
   publish_count        int(11) comment '��������',
   use_count            int(11) comment '��ʹ������',
   receive_count        int(11) comment '��ȡ����',
   enable_start_time    datetime comment '������ȡ�Ŀ�ʼ����',
   enable_end_time      datetime comment '������ȡ�Ľ�������',
   code                 varchar(64) comment '�Ż���',
   member_level         tinyint(1) comment '������ȡ�Ļ�Ա�ȼ�[0->���޵ȼ�������-��Ӧ�ȼ�]',
   publish              tinyint(1) comment '����״̬[0-δ������1-�ѷ���]',
   primary key (id)
);

alter table sms_coupon comment '�Ż�ȯ��Ϣ';

/*==============================================================*/
/* Table: sms_coupon_history                                    */
/*==============================================================*/
create table sms_coupon_history
(
   id                   bigint not null auto_increment comment 'id',
   coupon_id            bigint comment '�Ż�ȯid',
   member_id            bigint comment '��Աid',
   member_nick_name     varchar(64) comment '��Ա����',
   get_type             tinyint(1) comment '��ȡ��ʽ[0->��̨���ͣ�1->������ȡ]',
   create_time          datetime comment '����ʱ��',
   use_type             tinyint(1) comment 'ʹ��״̬[0->δʹ�ã�1->��ʹ�ã�2->�ѹ���]',
   use_time             datetime comment 'ʹ��ʱ��',
   order_id             bigint comment '����id',
   order_sn             bigint comment '������',
   primary key (id)
);

alter table sms_coupon_history comment '�Ż�ȯ��ȡ��ʷ��¼';

/*==============================================================*/
/* Table: sms_coupon_spu_category_relation                      */
/*==============================================================*/
create table sms_coupon_spu_category_relation
(
   id                   bigint not null auto_increment comment 'id',
   coupon_id            bigint comment '�Ż�ȯid',
   category_id          bigint comment '��Ʒ����id',
   category_name        varchar(64) comment '��Ʒ��������',
   primary key (id)
);

alter table sms_coupon_spu_category_relation comment '�Ż�ȯ�������';

/*==============================================================*/
/* Table: sms_coupon_spu_relation                               */
/*==============================================================*/
create table sms_coupon_spu_relation
(
   id                   bigint not null auto_increment comment 'id',
   coupon_id            bigint comment '�Ż�ȯid',
   spu_id               bigint comment 'spu_id',
   spu_name             varchar(255) comment 'spu_name',
   primary key (id)
);

alter table sms_coupon_spu_relation comment '�Ż�ȯ���Ʒ����';

/*==============================================================*/
/* Table: sms_home_adv                                          */
/*==============================================================*/
create table sms_home_adv
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(100) comment '����',
   pic                  varchar(500) comment 'ͼƬ��ַ',
   start_time           datetime comment '��ʼʱ��',
   end_time             datetime comment '����ʱ��',
   status               tinyint(1) comment '״̬',
   click_count          int comment '�����',
   url                  varchar(500) comment '����������ӵ�ַ',
   note                 varchar(500) comment '��ע',
   sort                 int comment '����',
   publisher_id         bigint comment '������',
   auth_id              bigint comment '�����',
   primary key (id)
);

alter table sms_home_adv comment '��ҳ�ֲ����';

/*==============================================================*/
/* Table: sms_home_subject                                      */
/*==============================================================*/
create table sms_home_subject
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(200) comment 'ר������',
   title                varchar(255) comment 'ר�����',
   sub_title            varchar(255) comment 'ר�⸱����',
   status               tinyint(1) comment '��ʾ״̬',
   url                  varchar(500) comment '��������',
   sort                 int comment '����',
   img                  varchar(500) comment 'ר��ͼƬ��ַ',
   primary key (id)
);

alter table sms_home_subject comment '��ҳר���jd��ҳ����ܶ�ר�⣬ÿ��ר�������µ�ҳ�棬չʾר����Ʒ��Ϣ��';

/*==============================================================*/
/* Table: sms_home_subject_spu                                  */
/*==============================================================*/
create table sms_home_subject_spu
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(200) comment 'ר������',
   subject_id           bigint comment 'ר��id',
   spu_id               bigint comment 'spu_id',
   sort                 int comment '����',
   primary key (id)
);

alter table sms_home_subject_spu comment 'ר����Ʒ';

/*==============================================================*/
/* Table: sms_member_price                                      */
/*==============================================================*/
create table sms_member_price
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'sku_id',
   member_level_id      bigint comment '��Ա�ȼ�id',
   member_level_name    varchar(100) comment '��Ա�ȼ���',
   member_price         decimal(18,4) comment '��Ա��Ӧ�۸�',
   add_other            tinyint(1) comment '�ɷ���������Ż�[0-���ɵ����Żݣ�1-�ɵ���]',
   primary key (id)
);

alter table sms_member_price comment '��Ʒ��Ա�۸�';

/*==============================================================*/
/* Table: sms_seckill_promotion                                 */
/*==============================================================*/
create table sms_seckill_promotion
(
   id                   bigint not null auto_increment comment 'id',
   title                varchar(255) comment '�����',
   start_time           datetime comment '��ʼ����',
   end_time             datetime comment '��������',
   status               tinyint comment '������״̬',
   create_time          datetime comment '����ʱ��',
   user_id              bigint comment '������',
   primary key (id)
);

alter table sms_seckill_promotion comment '��ɱ�';

/*==============================================================*/
/* Table: sms_seckill_session                                   */
/*==============================================================*/
create table sms_seckill_session
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(200) comment '��������',
   start_time           datetime comment 'ÿ�տ�ʼʱ��',
   end_time             datetime comment 'ÿ�ս���ʱ��',
   status               tinyint(1) comment '����״̬',
   create_time          datetime comment '����ʱ��',
   primary key (id)
);

alter table sms_seckill_session comment '��ɱ�����';

/*==============================================================*/
/* Table: sms_seckill_sku_notice                                */
/*==============================================================*/
create table sms_seckill_sku_notice
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment 'member_id',
   sku_id               bigint comment 'sku_id',
   session_id           bigint comment '�����id',
   subcribe_time        datetime comment '����ʱ��',
   send_time            datetime comment '����ʱ��',
   notice_type          tinyint(1) comment '֪ͨ��ʽ[0-���ţ�1-�ʼ�]',
   primary key (id)
);

alter table sms_seckill_sku_notice comment '��ɱ��Ʒ֪ͨ����';

/*==============================================================*/
/* Table: sms_seckill_sku_relation                              */
/*==============================================================*/
create table sms_seckill_sku_relation
(
   id                   bigint not null auto_increment comment 'id',
   promotion_id         bigint comment '�id',
   promotion_session_id bigint comment '�����id',
   sku_id               bigint comment '��Ʒid',
   seckill_price        decimal comment '��ɱ�۸�',
   seckill_count        decimal comment '��ɱ����',
   seckill_limit        decimal comment 'ÿ���޹�����',
   seckill_sort         int comment '����',
   primary key (id)
);

alter table sms_seckill_sku_relation comment '��ɱ���Ʒ����';

/*==============================================================*/
/* Table: sms_sku_bounds                                        */
/*==============================================================*/
create table sms_sku_bounds
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint,
   grow_bounds          decimal(18,4) comment '�ɳ�����',
   buy_bounds           decimal(18,4) comment '�������',
   work                 tinyint(1) comment '�Ż���Ч���[1111���ĸ�״̬λ�����ҵ���;0 - ���Żݣ��ɳ������Ƿ�����;1 - ���Żݣ���������Ƿ�����;2 - ���Żݣ��ɳ������Ƿ�����;3 - ���Żݣ���������Ƿ����͡�״̬λ0�������ͣ�1�����͡�]',
   primary key (id)
);

alter table sms_sku_bounds comment '��Ʒsku��������';

/*==============================================================*/
/* Table: sms_sku_full_reduction                                */
/*==============================================================*/
create table sms_sku_full_reduction
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'spu_id',
   full_price           decimal(18,4) comment '������',
   reduce_price         decimal(18,4) comment '������',
   add_other            tinyint(1) comment '�Ƿ���������Ż�',
   primary key (id)
);

alter table sms_sku_full_reduction comment '��Ʒ������Ϣ';

/*==============================================================*/
/* Table: sms_sku_ladder                                        */
/*==============================================================*/
create table sms_sku_ladder
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'spu_id',
   full_count           int comment '������',
   discount             decimal(4,2) comment '����',
   price                decimal(18,4) comment '�ۺ��',
   add_other            tinyint(1) comment '�Ƿ���������Ż�[0-���ɵ��ӣ�1-�ɵ���]',
   primary key (id)
);

alter table sms_sku_ladder comment '��Ʒ���ݼ۸�';

/*==============================================================*/
/* Table: sms_spu_bounds                                        */
/*==============================================================*/
create table sms_spu_bounds
(
   id                   bigint not null auto_increment comment 'id',
   spu_id               bigint,
   grow_bounds          decimal(18,4) comment '�ɳ�����',
   buy_bounds           decimal(18,4) comment '�������',
   work                 tinyint(1) comment '�Ż���Ч���[1111���ĸ�״̬λ�����ҵ���;0 - ���Żݣ��ɳ������Ƿ�����;1 - ���Żݣ���������Ƿ�����;2 - ���Żݣ��ɳ������Ƿ�����;3 - ���Żݣ���������Ƿ����͡�״̬λ0�������ͣ�1�����͡�]',
   primary key (id)
);

alter table sms_spu_bounds comment '��Ʒspu��������';


drop database if exists `greendillmall_ums`;

create database `greendillmall_ums`;

use greendillmall_ums;

drop table if exists ums_growth_change_history;

drop table if exists ums_integration_change_history;

drop table if exists ums_member;

drop table if exists ums_member_collect_spu;

drop table if exists ums_member_collect_subject;

drop table if exists ums_member_level;

drop table if exists ums_member_login_log;

drop table if exists ums_member_receive_address;

drop table if exists ums_member_statistics_info;

/*==============================================================*/
/* Table: ums_growth_change_history                             */
/*==============================================================*/
create table ums_growth_change_history
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment 'member_id',
   create_time          datetime comment 'create_time',
   change_count         int comment '�ı��ֵ������������',
   note                 varchar(0) comment '��ע',
   source_type          tinyint comment '������Դ[0-���1-����Ա�޸�]',
   primary key (id)
);

alter table ums_growth_change_history comment '�ɳ�ֵ�仯��ʷ��¼';

/*==============================================================*/
/* Table: ums_integration_change_history                        */
/*==============================================================*/
create table ums_integration_change_history
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment 'member_id',
   create_time          datetime comment 'create_time',
   change_count         int comment '�仯��ֵ',
   note                 varchar(255) comment '��ע',
   source_tyoe          tinyint comment '��Դ[0->���1->����Ա�޸�;2->�]',
   primary key (id)
);

alter table ums_integration_change_history comment '���ֱ仯��ʷ��¼';

/*==============================================================*/
/* Table: ums_member                                            */
/*==============================================================*/
create table ums_member
(
   id                   bigint not null auto_increment comment 'id',
   level_id             bigint comment '��Ա�ȼ�id',
   username             char(64) comment '�û���',
   password             varchar(64) comment '����',
   nickname             varchar(64) comment '�ǳ�',
   mobile               varchar(20) comment '�ֻ�����',
   email                varchar(64) comment '����',
   header               varchar(500) comment 'ͷ��',
   gender               tinyint comment '�Ա�',
   birth                date comment '����',
   city                 varchar(500) comment '���ڳ���',
   job                  varchar(255) comment 'ְҵ',
   sign                 varchar(255) comment '����ǩ��',
   source_type          tinyint comment '�û���Դ',
   integration          int comment '����',
   growth               int comment '�ɳ�ֵ',
   status               tinyint comment '����״̬',
   create_time          datetime comment 'ע��ʱ��',
   primary key (id)
);

alter table ums_member comment '��Ա';

/*==============================================================*/
/* Table: ums_member_collect_spu                                */
/*==============================================================*/
create table ums_member_collect_spu
(
   id                   bigint not null comment 'id',
   member_id            bigint comment '��Աid',
   spu_id               bigint comment 'spu_id',
   spu_name             varchar(500) comment 'spu_name',
   spu_img              varchar(500) comment 'spu_img',
   create_time          datetime comment 'create_time',
   primary key (id)
);

alter table ums_member_collect_spu comment '��Ա�ղص���Ʒ';

/*==============================================================*/
/* Table: ums_member_collect_subject                            */
/*==============================================================*/
create table ums_member_collect_subject
(
   id                   bigint not null auto_increment comment 'id',
   subject_id           bigint comment 'subject_id',
   subject_name         varchar(255) comment 'subject_name',
   subject_img          varchar(500) comment 'subject_img',
   subject_urll         varchar(500) comment '�url',
   primary key (id)
);

alter table ums_member_collect_subject comment '��Ա�ղص�ר��';

/*==============================================================*/
/* Table: ums_member_level                                      */
/*==============================================================*/
create table ums_member_level
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(100) comment '�ȼ�����',
   growth_point         int comment '�ȼ���Ҫ�ĳɳ�ֵ',
   default_status       tinyint comment '�Ƿ�ΪĬ�ϵȼ�[0->���ǣ�1->��]',
   free_freight_point   decimal(18,4) comment '���˷ѱ�׼',
   comment_growth_point int comment 'ÿ�����ۻ�ȡ�ĳɳ�ֵ',
   priviledge_free_freight tinyint comment '�Ƿ���������Ȩ',
   priviledge_member_price tinyint comment '�Ƿ��л�Ա�۸���Ȩ',
   priviledge_birthday  tinyint comment '�Ƿ���������Ȩ',
   note                 varchar(255) comment '��ע',
   primary key (id)
);

alter table ums_member_level comment '��Ա�ȼ�';

/*==============================================================*/
/* Table: ums_member_login_log                                  */
/*==============================================================*/
create table ums_member_login_log
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment 'member_id',
   create_time          datetime comment '����ʱ��',
   ip                   varchar(64) comment 'ip',
   city                 varchar(64) comment 'city',
   login_type           tinyint(1) comment '��¼����[1-web��2-app]',
   primary key (id)
);

alter table ums_member_login_log comment '��Ա��¼��¼';

/*==============================================================*/
/* Table: ums_member_receive_address                            */
/*==============================================================*/
create table ums_member_receive_address
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment 'member_id',
   name                 varchar(255) comment '�ջ�������',
   phone                varchar(64) comment '�绰',
   post_code            varchar(64) comment '��������',
   province             varchar(100) comment 'ʡ��/ֱϽ��',
   city                 varchar(100) comment '����',
   region               varchar(100) comment '��',
   detail_address       varchar(255) comment '��ϸ��ַ(�ֵ�)',
   areacode             varchar(15) comment 'ʡ��������',
   default_status       tinyint(1) comment '�Ƿ�Ĭ��',
   primary key (id)
);

alter table ums_member_receive_address comment '��Ա�ջ���ַ';

/*==============================================================*/
/* Table: ums_member_statistics_info                            */
/*==============================================================*/
create table ums_member_statistics_info
(
   id                   bigint not null auto_increment comment 'id',
   member_id            bigint comment '��Աid',
   consume_amount       decimal(18,4) comment '�ۼ����ѽ��',
   coupon_amount        decimal(18,4) comment '�ۼ��Żݽ��',
   order_count          int comment '��������',
   coupon_count         int comment '�Ż�ȯ����',
   comment_count        int comment '������',
   return_order_count   int comment '�˻�����',
   login_count          int comment '��¼����',
   attend_count         int comment '��ע����',
   fans_count           int comment '��˿����',
   collect_product_count int comment '�ղص���Ʒ����',
   collect_subject_count int comment '�ղص�ר������',
   collect_comment_count int comment '�ղص���������',
   invite_friend_count  int comment '�������������',
   primary key (id)
);

alter table ums_member_statistics_info comment '��Աͳ����Ϣ';


drop database if exists `greendillmall_wms`;

create database `greendillmall_wms`;

use greendillmall_wms;

drop table if exists wms_purchase;

drop table if exists wms_purchase_detail;

drop table if exists wms_ware_info;

drop table if exists wms_ware_order_task;

drop table if exists wms_ware_order_task_detail;

drop table if exists wms_ware_sku;



/*==============================================================*/
/* Table: wms_purchase                                          */
/*==============================================================*/
create table wms_purchase
(
   id                   bigint not null auto_increment,
   assignee_id          bigint,
   assignee_name        varchar(255),
   phone                char(13),
   priority             int(4),
   status               int(4),
   ware_id              bigint,
   amount               decimal(18,4),
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

alter table wms_purchase comment '�ɹ���Ϣ';

/*==============================================================*/
/* Table: wms_purchase_detail                                   */
/*==============================================================*/
create table wms_purchase_detail
(
   id                   bigint not null auto_increment,
   purchase_id          bigint comment '�ɹ���id',
   sku_id               bigint comment '�ɹ���Ʒid',
   sku_num              int comment '�ɹ�����',
   sku_price            decimal(18,4) comment '�ɹ����',
   ware_id              bigint comment '�ֿ�id',
   status               int comment '״̬[0�½���1�ѷ��䣬2���ڲɹ���3����ɣ�4�ɹ�ʧ��]',
   primary key (id)
);

/*==============================================================*/
/* Table: wms_ware_info                                         */
/*==============================================================*/
create table wms_ware_info
(
   id                   bigint not null auto_increment comment 'id',
   name                 varchar(255) comment '�ֿ���',
   address              varchar(255) comment '�ֿ��ַ',
   areacode             varchar(20) comment '�������',
   primary key (id)
);

alter table wms_ware_info comment '�ֿ���Ϣ';

/*==============================================================*/
/* Table: wms_ware_order_task                                   */
/*==============================================================*/
create table wms_ware_order_task
(
   id                   bigint not null auto_increment comment 'id',
   order_id             bigint comment 'order_id',
   order_sn             varchar(255) comment 'order_sn',
   consignee            varchar(100) comment '�ջ���',
   consignee_tel        char(15) comment '�ջ��˵绰',
   delivery_address     varchar(500) comment '���͵�ַ',
   order_comment        varchar(200) comment '������ע',
   payment_way          tinyint(1) comment '���ʽ�� 1:���߸��� 2:�������',
   task_status          tinyint(2) comment '����״̬',
   order_body           varchar(255) comment '��������',
   tracking_no          char(30) comment '��������',
   create_time          datetime comment 'create_time',
   ware_id              bigint comment '�ֿ�id',
   task_comment         varchar(500) comment '��������ע',
   primary key (id)
);

alter table wms_ware_order_task comment '��湤����';

/*==============================================================*/
/* Table: wms_ware_order_task_detail                            */
/*==============================================================*/
create table wms_ware_order_task_detail
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'sku_id',
   sku_name             varchar(255) comment 'sku_name',
   sku_num              int comment '�������',
   task_id              bigint comment '������id',
   primary key (id)
);

alter table wms_ware_order_task_detail comment '��湤����';

/*==============================================================*/
/* Table: wms_ware_sku                                          */
/*==============================================================*/
create table wms_ware_sku
(
   id                   bigint not null auto_increment comment 'id',
   sku_id               bigint comment 'sku_id',
   ware_id              bigint comment '�ֿ�id',
   stock                int comment '�����',
   sku_name             varchar(200) comment 'sku_name',
   stock_locked         int comment '�������',
   primary key (id)
);

alter table wms_ware_sku comment '��Ʒ���';



