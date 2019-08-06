--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hibernate_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE hibernate_table (
    gen_pk character varying(255),
    gen_val integer
);


--
-- Name: table_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_admin (
    col_id integer NOT NULL,
    department character varying(255),
    col_email character varying(255),
    col_job_name character varying(255),
    col_login_ip character varying(255),
    col_login_time bigint,
    col_password character varying(100),
    col_real_name character varying(255),
    col_state integer,
    col_username character varying(20) NOT NULL
);


--
-- Name: table_admin_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_admin_role (
    col_admin_id integer NOT NULL,
    col_role_id integer NOT NULL
);


--
-- Name: table_admin_table_department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_admin_table_department (
    table_admin_col_id integer NOT NULL,
    departments_col_id integer NOT NULL
);


--
-- Name: table_aduit_base; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_aduit_base (
    col_id integer NOT NULL,
    col_appraise_standard character varying(65536),
    col_core_standar character varying(65536),
    col_first_kpi character varying(255),
    col_form_name character varying(255),
    col_index integer,
    col_job_name character varying(255),
    col_second_kpi character varying(255),
    col_sign_core integer
);


--
-- Name: table_department; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_department (
    col_id integer NOT NULL,
    col_department_name character varying(255),
    col_department_num character varying(255),
    col_leader_num character varying(255)
);


--
-- Name: table_department_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_department_user (
    col_department_id integer NOT NULL,
    col_user_id integer NOT NULL
);


--
-- Name: table_performance_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_performance_records (
    col_id integer NOT NULL,
    col_create_date bigint,
    col_num_value integer,
    col_state integer,
    col_type integer,
    col_user_id integer,
    col_user_name character varying(255),
    col_year integer
);


--
-- Name: table_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_role (
    col_id integer NOT NULL,
    col_description character varying(200),
    col_is_system boolean NOT NULL,
    col_name character varying(20) NOT NULL
);


--
-- Name: table_role_authority; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE table_role_authority (
    col_role_id integer NOT NULL,
    col_authoritie character varying(255)
);


--
-- Data for Name: hibernate_table; Type: TABLE DATA; Schema: public; Owner: -
--

COPY hibernate_table (gen_pk, gen_val) FROM stdin;
2	2
\.


--
-- Data for Name: table_admin; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_admin (col_id, department, col_email, col_job_name, col_login_ip, col_login_time, col_password, col_real_name, col_state, col_username) FROM stdin;
3	管理员部,	test@163.com	系统管理员	\N	\N	b59c67bf196a4758191e42f76670ceba	管理员	1	User
7	制造部,	无	无	\N	\N	b59c67bf196a4758191e42f76670ceba	test3	1	test3
4	产品工程1,	无	护理人员	\N	\N	b59c67bf196a4758191e42f76670ceba	李权芯	1	lqx
5	产品工程1,	无	管理人员	\N	\N	b59c67bf196a4758191e42f76670ceba	测试账号1	1	test1
2	管理员部,	test@163.com	系统管理员	0:0:0:0:0:0:0:1	1565075245	b59c67bf196a4758191e42f76670ceba	管理员	1	Admin
6	制造部,	无	无	0:0:0:0:0:0:0:1	1565081725	b59c67bf196a4758191e42f76670ceba	test2	1	test2
\.


--
-- Data for Name: table_admin_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_admin_role (col_admin_id, col_role_id) FROM stdin;
2	1
3	1
4	1
5	1
6	1
7	1
\.


--
-- Data for Name: table_admin_table_department; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_admin_table_department (table_admin_col_id, departments_col_id) FROM stdin;
\.


--
-- Data for Name: table_aduit_base; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_aduit_base (col_id, col_appraise_standard, col_core_standar, col_first_kpi, col_form_name, col_index, col_job_name, col_second_kpi, col_sign_core) FROM stdin;
2	出具虚假证明、私自收费、骗取医保基金等违规行为，本月考核不合格；不遵守医院管理制度，发现一次扣10分。	1.严格执行《九不准》规定，坚持廉洁行医，遵守卫生法律法规及医院管理制度。 	综合考核（30分）	表2	2	护理人员	医德医风	10
3	无故迟到早退，一次扣0.5分，无故旷工一天扣2分，缺勤1天扣1.5分；有串岗、脱岗、做私活、玩游戏、扎堆聊天、造谣诽谤等不良现象者，发现一次扣3分、有投诉查实一次扣2分； 仪表不端庄、服饰不整洁，未戴护士帽和胸牌上岗，发现一次扣1分。 	2.出满勤，做到不迟到、不早退，值班时坚守工作岗位，做到不串岗、不脱岗、不做私活、不玩游戏等，上班时衣帽整洁、不穿拖鞋，佩戴胸卡上岗。	综合考核（30分）	表2	3	护理人员	工作纪律	10
4	无记录或记录不全扣1分；无故不参加学习一次扣2分。	3.积极参加院科两级组织的政治业务学习并做好记录。 	综合考核（30分）	表2	4	护理人员	政治业务学习	5
5	科室内发现烟头、烟灰、乱扔纸屑等一次扣1分；私自使用电器和其他易燃易爆物品，发现一次扣1分；乱倒垃圾、污水一次扣1分；科室区域环境脏乱差扣2分。	4.科室区域卫生整洁有序。	综合考核（30分）	表2	5	护理人员	环境卫生	5
6	每下降1%，扣0.5分。	5.门诊、观察、病房护理人次数（包括输液）不低于单位核定的平均数。	业务考核（70分）	表2	6	护理人员	护理工作数量和质量	20
7	一项做不到扣1分。	6.认真执行护理操作常规，做好基础护理。	业务考核（70分）	表2	7	护理人员	护理工作数量和质量	5
8	一项做不到扣2分。	7.严格执行三查八对、交接班等制度。	业务考核（70分）	表2	8	护理人员	护理工作数量和质量	5
9	填写项目齐全，内容规范，书写字迹工整清晰，有一项不符合扣1分。	8.各种护理标记、五种护理文书书写规范，病历摆放有序。	业务考核（70分）	表2	9	护理人员	护理工作数量和质量	5
10	掌握消毒液使用、效期等，一次性塑料用品用后毁形、消毒，并有记录，医疗废弃物分类存放等，一次做不到扣1分。	9.控制院内感染，实行“一人一针一管一用一消毒一毁形”，毁形消毒、处理有记录。	业务考核（70分）	表2	10	护理人员	护理工作数量和质量	5
11	发现一次不规范扣1分，灯管有灰尘扣1分，消毒无记录扣1分。	10.严格护理技术操作规程；治疗室定期进行紫外线空气消毒，定期擦拭灯管，有记录。	业务考核（70分）	表2	11	护理人员	护理工作数量和质量	5
12	缺一项扣1分，扣完为止。	11.开展中医拔罐、刮痧、艾灸等护理。	业务考核（70分）	表2	12	护理人员	护理工作数量和质量	5
13	缺一项扣1分，管理不到位扣2分，发生一次差错、事故扣10分。	12.配备足够急诊急救器械、药品，做到五定，有交接记录，确保无差错事故发生。	业务考核（70分）	表2	13	护理人员	护理工作数量和质量	5
14	掌握病人姓名、性别、年龄、病情诊断、注意事项等基本情况，加强病房巡视并做好记录，有一项做不到扣2分。	13.规范临床分级护理及护理服务内涵，保证护理质量，按分级护理巡视病房。	业务考核（70分）	表2	14	护理人员	病区管理	5
15	发现一次做不到扣1分。	14.加强与患者交流沟通，了解患者的思想、生活情况，征求病员对护理工作的意见。	业务考核（70分）	表2	15	护理人员	病区管理	5
16	发现一次做不到扣1分。	15.各病室通风、消毒，床铺平整、整洁，各类物品摆放整齐有序。	业务考核（70分）	表2	16	护理人员	病区管理	5
17	职工投诉一次扣10分，接到群众或患者反映差评的，一次扣10分。	16.群众满意度。	业务考核（70分）	表2	17	护理人员	扣分项目	\N
18	获得患者或群众好评的，加10分。	17.奖励分	业务考核（70分）	表2	18	护理人员	加分项目	\N
19	不遵守医院管理制度，发现一次扣10分。	1.严格执行《九不准》规定，遵守卫生法律法规及医院管理制度。 	综合考核（30分）	表6	19	管理人员	医德医风	10
20	无故迟到早退，一次扣0.5分，无故旷工一天扣2分，缺勤1天扣1.5分；有串岗、脱岗、做私活、玩游戏、扎堆聊天、造谣诽谤等不良现象者，发现一次扣5分、有投诉查实一次扣2分；仪表不端庄、服饰不整洁，发现一次扣1分。 	2.出满勤，做到不迟到、不早退，值班时坚守工作岗位，做到不串岗、不脱岗、不做私活、不玩游戏等，上班时衣帽整洁、不穿拖鞋。	综合考核（30分）	表6	20	管理人员	工作纪律	10
21	无记录或记录不全扣1分；无故不参加学习一次扣2分。	3.积极参加院科两级组织的政治业务学习并做好记录。 	综合考核（30分）	表6	21	管理人员	政治业务学习	5
22	科室内发现烟头、烟灰、乱扔纸屑等一次扣1分；私自使用电器和其他易燃易爆物品，发现一次扣1分；乱倒垃圾、污水一次扣1分；科室区域环境脏乱差扣2分。	4.科室区域卫生整洁有序	综合考核（30分）	表6	22	管理人员	环境卫生	5
23	无计划、总结，检查、考核不及时，每一项扣2.5分。	5.各项工作及时制订月计划、周安排，及时总结；按规定开展检查、考核等工作。	业务考核（70分）	表6	23	管理人员	工作数量和质量	10
24	出现一次一项管理不规范扣3分，出现一次管理责任事故扣6分。	6.行政、医疗、人事、财务、基本公共卫生服务等管理和岗位设置规范合理。	业务考核（70分）	表6	24	管理人员	工作数量和质量	10
25	不按时完成一次扣3分，出现一次不符合要求扣3分。	7.按时完成上级和相关部门下达的各项工作任务。	业务考核（70分）	表6	25	管理人员	工作数量和质量	20
26	不按时上报一次，扣2分。	8.按时上报各类人事、医疗、财务等报表。	业务考核（70分）	表6	26	管理人员	工作数量和质量	10
27	发现一次不及时扣2分，影响正常工作的扣5分。	9.各类医用物资、药品材料和办公用品等采购供应及时，服务周到。	业务考核（70分）	表6	27	管理人员	工作数量和质量	10
28	查归档文册、台账，不规范扣1分，发现未归档，无台账扣2分。	10.各类行政文件、财务账册，公共物资台账建立规范有序。	业务考核（70分）	表6	28	管理人员	工作数量和质量	10
29	职工投诉一次扣10分，接到群众或患者反映差评的，一次扣10分。	11.群众满意度。	业务考核（70分）	表6	29	管理人员	扣分项目	\N
30	获得患者或群众好评的，加10分。	12.奖励分。	业务考核（70分）	表6	30	管理人员	加分项目	\N
\.


--
-- Data for Name: table_department; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_department (col_id, col_department_name, col_department_num, col_leader_num) FROM stdin;
1	管理员部	1001	AK47
5	制造部	1003	test2
3	产品工程1	1002	lqx
\.


--
-- Data for Name: table_department_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_department_user (col_department_id, col_user_id) FROM stdin;
1	2
1	3
5	6
5	7
3	4
3	5
\.


--
-- Data for Name: table_performance_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_performance_records (col_id, col_create_date, col_num_value, col_state, col_type, col_user_id, col_user_name, col_year) FROM stdin;
\.


--
-- Data for Name: table_role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_role (col_id, col_description, col_is_system, col_name) FROM stdin;
1	最高权限管理员	t	系统管理员
\.


--
-- Data for Name: table_role_authority; Type: TABLE DATA; Schema: public; Owner: -
--

COPY table_role_authority (col_role_id, col_authoritie) FROM stdin;
1	/admin/delete.html
1	/admin/list.html
1	/admin/toAdd.html
1	/admin/update.html
1	/attachment/delete.html
1	/board/list.html
1	/order/delete.html
1	/order/toAdd.html
1	/pack/showPallet.html
1	/pack/splitBox.html
1	/pack/splitCarton.html
1	/pack/splitPallet.html
1	/pack/toUnpack.html
1	/packType/list.html
1	/packType/toAdd.html
1	/packType/toUpdate.html
1	/plan/aspDelete.html
1	/plan/delete.html
1	/plan/toAspUpdate.html
1	/plan/toPoAdd.html
1	/plan/toUpdate.html
1	/plan/toUpdatePallet.html
1	/production/rework.html
1	/repair/toUnbind.html
1	/role/delete.html
1	/role/list.html
1	/role/toAdd.html
1	/role/toUpdate.html
1	/route/delete.html
1	/route/list.html
1	/route/toAdd.html
1	/route/toUpdate.html
1	/ship/insertEDI.html
1	/ship/toUnaccept.html
1	/ship/toUnship.html
1	/site/delete.html
1	/site/list.html
1	/site/toAdd.html
1	/site/toUpdate.html
1	/siteColumn/delete.html
1	/siteColumn/list.html
1	/siteColumn/toAdd.html
1	/siteColumn/toUpdate.html
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('hibernate_sequence', 7, true);


--
-- Name: table_admin table_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_admin
    ADD CONSTRAINT table_admin_pkey PRIMARY KEY (col_id);


--
-- Name: table_admin_role table_admin_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_admin_role
    ADD CONSTRAINT table_admin_role_pkey PRIMARY KEY (col_admin_id, col_role_id);


--
-- Name: table_aduit_base table_aduit_base_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_aduit_base
    ADD CONSTRAINT table_aduit_base_pkey PRIMARY KEY (col_id);


--
-- Name: table_department table_department_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_department
    ADD CONSTRAINT table_department_pkey PRIMARY KEY (col_id);


--
-- Name: table_performance_records table_performance_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_performance_records
    ADD CONSTRAINT table_performance_records_pkey PRIMARY KEY (col_id);


--
-- Name: table_role table_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_role
    ADD CONSTRAINT table_role_pkey PRIMARY KEY (col_id);


--
-- Name: table_admin uk_4yr924bat8d36dhqeevxet25p; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_admin
    ADD CONSTRAINT uk_4yr924bat8d36dhqeevxet25p UNIQUE (col_username);


--
-- Name: table_department uk_me11lkpcdctc09f20c5vsd962; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_department
    ADD CONSTRAINT uk_me11lkpcdctc09f20c5vsd962 UNIQUE (col_department_num);


--
-- Name: table_role_authority fk_3w8i70ipmnb4f1fhg4j1jh78k; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_role_authority
    ADD CONSTRAINT fk_3w8i70ipmnb4f1fhg4j1jh78k FOREIGN KEY (col_role_id) REFERENCES table_role(col_id);


--
-- Name: table_admin_role fk_7b03xmjog5k544jjt3b6nduw6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_admin_role
    ADD CONSTRAINT fk_7b03xmjog5k544jjt3b6nduw6 FOREIGN KEY (col_role_id) REFERENCES table_role(col_id);


--
-- Name: table_department_user fk_ds9ntn3ae3l2lu5mgw13v01w8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_department_user
    ADD CONSTRAINT fk_ds9ntn3ae3l2lu5mgw13v01w8 FOREIGN KEY (col_user_id) REFERENCES table_admin(col_id);


--
-- Name: table_department_user fk_jtaquf6xwrwo22md1b1on1cgd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_department_user
    ADD CONSTRAINT fk_jtaquf6xwrwo22md1b1on1cgd FOREIGN KEY (col_department_id) REFERENCES table_department(col_id);


--
-- Name: table_admin_role fk_mp6k1mgr1mk9mqdaamoxtgpd5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY table_admin_role
    ADD CONSTRAINT fk_mp6k1mgr1mk9mqdaamoxtgpd5 FOREIGN KEY (col_admin_id) REFERENCES table_admin(col_id);


--
-- PostgreSQL database dump complete
--

