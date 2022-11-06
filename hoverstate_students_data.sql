--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
ALTER TABLE ONLY public.students DROP CONSTRAINT students_email_key;
ALTER TABLE ONLY public.students_courses DROP CONSTRAINT students_courses_pkey;
ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.students_courses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.courses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.students_id_seq;
DROP SEQUENCE public.students_courses_id_seq;
DROP TABLE public.students_courses;
DROP TABLE public.students;
DROP SEQUENCE public.courses_id_seq;
DROP TABLE public.courses;
DROP TABLE public."SequelizeMeta";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    course_code character varying(255) NOT NULL
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: students_courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students_courses (
    id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    grade integer
);


--
-- Name: students_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_courses_id_seq OWNED BY public.students_courses.id;


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: students_courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_courses ALTER COLUMN id SET DEFAULT nextval('public.students_courses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."SequelizeMeta" VALUES ('20221105151806-create-user.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221105152444-create-student.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221105152928-create-course.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221105155941-create-student-course.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221105175549-add-grade-to-studentcourse-model.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221106142359-add-abbreviation-to-course.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221106163413-change-abbreviation-to-course_code.js');
INSERT INTO public."SequelizeMeta" VALUES ('20221106184134-change-student-fields-to-snake-case.js');


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.courses VALUES (1, 'Intro to Multitasking', '2022-11-06 14:32:21.226-05', '2022-11-06 14:32:21.226-05', 'ITM 1900');
INSERT INTO public.courses VALUES (2, 'Intro to Product Design', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITPD 2558');
INSERT INTO public.courses VALUES (3, 'Intro to Patience', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITP 2407');
INSERT INTO public.courses VALUES (4, 'Intro to Process Automation', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITPA 1089');
INSERT INTO public.courses VALUES (5, 'Intro to Social Skills', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITSS 1194');
INSERT INTO public.courses VALUES (6, 'Intro to Active Listening', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITAL 1661');
INSERT INTO public.courses VALUES (7, 'Intro to Troubleshooting', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITT 2391');
INSERT INTO public.courses VALUES (8, 'Intro to Diplomacy', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITD 2926');
INSERT INTO public.courses VALUES (9, 'Intro to Storytelling', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITS 2713');
INSERT INTO public.courses VALUES (10, 'Intro to Critical Thinking', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITCT 1714');
INSERT INTO public.courses VALUES (11, 'Intro to Enterprise Resource Planning', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITERP 2836');
INSERT INTO public.courses VALUES (12, 'Intro to Creativity', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITC 1521');
INSERT INTO public.courses VALUES (13, 'Intro to Empathy', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITE 2326');
INSERT INTO public.courses VALUES (14, 'Intro to Data Analysis', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITDA 2478');
INSERT INTO public.courses VALUES (15, 'Intro to Organization', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITO 2922');
INSERT INTO public.courses VALUES (16, 'Intro to Storytelling', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITS 2917');
INSERT INTO public.courses VALUES (17, 'Intro to Negotiation', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITN 1905');
INSERT INTO public.courses VALUES (18, 'Intro to Multitasking', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITM 1615');
INSERT INTO public.courses VALUES (19, 'Intro to Social Skills', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITSS 1113');
INSERT INTO public.courses VALUES (20, 'Intro to Troubleshooting', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITT 2420');
INSERT INTO public.courses VALUES (21, 'Intro to Patience', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITP 1063');
INSERT INTO public.courses VALUES (22, 'Intro to Positivity', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITP 2895');
INSERT INTO public.courses VALUES (23, 'Intro to Data Privacy', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITDP 2462');
INSERT INTO public.courses VALUES (24, 'Intro to Patience', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITP 1701');
INSERT INTO public.courses VALUES (25, 'Intro to Patience', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ITP 1840');
INSERT INTO public.courses VALUES (26, 'Advanced Adaptability', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AA 3585');
INSERT INTO public.courses VALUES (27, 'Advanced Self-motivation', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AS 4406');
INSERT INTO public.courses VALUES (28, 'Advanced Positivity', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AP 4866');
INSERT INTO public.courses VALUES (29, 'Advanced Self-motivation', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AS 3045');
INSERT INTO public.courses VALUES (30, 'Advanced Customer Service', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ACS 4526');
INSERT INTO public.courses VALUES (31, 'Advanced Problem Solving', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'APS 3569');
INSERT INTO public.courses VALUES (32, 'Advanced Multitasking', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AM 3557');
INSERT INTO public.courses VALUES (33, 'Advanced Product Design', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'APD 3644');
INSERT INTO public.courses VALUES (34, 'Advanced Adaptability', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AA 3237');
INSERT INTO public.courses VALUES (35, 'Advanced Search Engine Optimization', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ASEO 3730');
INSERT INTO public.courses VALUES (36, 'Advanced Dependability', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AD 3652');
INSERT INTO public.courses VALUES (37, 'Advanced Empathy', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AE 4323');
INSERT INTO public.courses VALUES (38, 'Advanced Critical Thinking', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'ACT 4888');
INSERT INTO public.courses VALUES (39, 'Advanced Writing And Editing', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AWAE 3101');
INSERT INTO public.courses VALUES (40, 'Advanced Dependability', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AD 3535');
INSERT INTO public.courses VALUES (41, 'Advanced Work Ethic', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AWE 3058');
INSERT INTO public.courses VALUES (42, 'Advanced Attention To Detail', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AATD 4009');
INSERT INTO public.courses VALUES (43, 'Advanced Storytelling', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AS 3656');
INSERT INTO public.courses VALUES (44, 'Advanced Dependability', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AD 3297');
INSERT INTO public.courses VALUES (45, 'Advanced Attention To Detail', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AATD 4435');
INSERT INTO public.courses VALUES (46, 'Advanced Work Ethic', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AWE 3544');
INSERT INTO public.courses VALUES (47, 'Advanced Multilingualism', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AM 3814');
INSERT INTO public.courses VALUES (48, 'Advanced Accounting Or Bookkeeping', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AAOB 3276');
INSERT INTO public.courses VALUES (49, 'Advanced Work Ethic', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AWE 3737');
INSERT INTO public.courses VALUES (50, 'Advanced Patience', '2022-11-06 14:32:21.227-05', '2022-11-06 14:32:21.227-05', 'AP 4658');


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.students VALUES (1, 'Antonia', 'Jónasdóttir', 'somchit+morales307@hoverstate.edu', '2022-11-06 14:32:21.247-05', '2022-11-06 14:32:21.247-05');
INSERT INTO public.students VALUES (2, 'Amphon', 'Gil', 'shigeruthongkham921@hoverstate.edu', '2022-11-06 14:32:21.247-05', '2022-11-06 14:32:21.247-05');
INSERT INTO public.students VALUES (3, 'Joyce', 'García', 'samuel+chukwu210@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (4, 'Karl-Heinz', 'Hauksson', 'xiaoli.tomaszewski146@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (5, 'Aleksandr', 'Þórðarson', 'miguelendo634@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (6, 'Purity', 'König', 'ngozibevan@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (7, 'Rut', 'Maas', 'pablo_bunma@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (8, 'Ruth', 'Králová', 'agatapanya424@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (9, 'Carmen', 'Urbański', 'anong+schulz364@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (10, 'Claudia', 'Günther', 'ewa.kongkaeo603@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (11, 'Pilar', 'Halldórsson', 'akira+kondo@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (12, 'Linda', 'Jóhannsdóttir', 'bello-sanz@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (13, 'Miykhael', 'Björnsdóttir', 'kanchana+ngubane337@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (14, 'Andrey', 'Sarkar', 'xiangsaetan276@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (15, 'Somchit', 'Ágústsson', 'urai-omondi@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (16, 'Frank', 'Mustapha', 'herbert_zimmermann@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (17, 'Robert', 'Fernández', 'justynayan@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (18, 'Charles', 'Jäger', 'colin_bitton107@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (19, 'Sommai', 'Ramírez', 'sukanya.bailey945@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (20, 'Mardkhay', 'Michalski', 'latda.du-plessis@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (21, 'Francisco', 'Rivera', 'wei+bala415@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (22, 'Juan', 'Králová', 'tadashimulder844@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (23, 'Olga', 'Suissa', 'lihua.schmitt623@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (24, 'Laura', 'Žukauskas', 'santosh-sikora@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (25, 'Wojciech', 'Øvergård', 'ravi+bakker507@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (26, 'Somnuek', 'Ūžien', 'gareth-adamu809@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (27, 'Beata', 'Dai', 'mohammad+keller@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (28, 'Pedro', 'Gómez', 'elisabeth.bowen@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (29, 'Jakub', 'Mazur', 'hiroko+masarweh342@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (30, 'Isa', 'Ágústsson', 'aishazhao@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (31, 'Li', 'Khatun', 'takashi+sisuk737@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (32, 'Michal', 'Schmitz', 'miykhal-nkosi@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (33, 'Michiko', 'Jones', 'julie_wagner@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (34, 'Johan', 'Łuczak', 'jonathan.nakano@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (35, 'Nittaya', 'Suwan', 'ewa-kwiatkowski389@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (36, 'Rajendra', 'Jóhannsdóttir', 'xiaoping.schmidt454@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (37, 'Lijun', 'Jónasdóttir', 'sachiko+ansari123@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (38, 'Aliyu', 'Harðardóttir', 'anong_hayashi244@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (39, 'Anastasiya', 'Kučerová', 'andrea_nguyen541@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (40, 'Sunthon', 'Marková', 'isa.takahashi227@hoverstate.edu', '2022-11-06 14:32:21.248-05', '2022-11-06 14:32:21.248-05');
INSERT INTO public.students VALUES (41, 'Ming', 'Zieliński', 'teruko-bekher@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (42, 'Ewa', 'Kozłowski', 'tebogo.fang784@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (43, 'Katarzyna', 'Inoue', 'masakoallen@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (44, 'Paulina', 'Su', 'gareth.schouten@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (45, 'Krzysztof', 'Jabłoński', 'walter+lee@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (46, 'Usman', 'Wilson', 'yun+pillay295@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (47, 'Xiaohong', 'Kristjánsson', 'wirat.volkov129@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (48, 'Gerhard', 'Botha', 'wanphen_nowak130@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (49, 'Phonthip', 'Lis', 'sibongile_kwiatkowski89@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (50, 'Alyona', 'Thongkham', 'sammy_wafula136@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (51, 'Yoshie', 'John', 'galina_zheng@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (52, 'Kenneth', 'Hussein', 'rakesh_dlamini840@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (53, 'Denis', 'Robinson', 'toshiko_gutierrez@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (54, 'Michal', 'Weiß', 'thomas+mutuku733@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (55, 'Alexander', 'Pálsdóttir', 'richard.su160@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (56, 'Miykhael', 'Möller', 'irinamohammed@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (57, 'Heike', 'Hernández', 'yhudah-masarweh811@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (58, 'Dinesh', 'Mahato', 'minamabaso773@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (59, 'Philip', 'Price', 'ruth.okeke@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (60, 'Jakub', 'Piotrowski', 'isabelpietrzak@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (61, 'Oleg', 'Fischer', 'sukanya+wojciechowski@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (62, 'Otieno', 'Guðjónsson', 'sunil_salisu@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (63, 'Grzegorz', 'Kristinsdóttir', 'sibongile.lehmann468@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (64, 'Toshiko', 'Scholz', 'lyubov-ma@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (65, 'Lalita', 'Øvergård', 'karen.jia@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (66, 'Steven', 'Helgadóttir', 'keiko+collins879@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (67, 'Patricia', 'Kučera', 'fernando-ashknaziy@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (68, 'Karl-Heinz', 'Scholz', 'evgeniy.kozlov@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (69, 'Rita', 'Wilson', 'alina+ayutthaya18@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (70, 'Omer', 'Hájek', 'rakesh.ngubane933@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (71, 'Na', 'Ogawa', 'yosef-begam479@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (72, 'Adamu', 'Ágústsson', 'haiyan+piotrowski@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (73, 'Ming', 'Sakamoto', 'katarzyna+nakamura@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (74, 'Yelena', 'Ramírez', 'arun-langat@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (75, 'Carol', 'Ramos', 'chao-hernandez@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (76, 'Yaakv', 'Žukauskienė', 'suwit_williams@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (77, 'Suphaphon', 'Li', 'ivan_hasna492@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (78, 'Patricia', 'Harðardóttir', 'raj.jenkins336@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (79, 'Kun', 'Kamiński', 'margaret-sombun851@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (80, 'Sushila', 'Govender', 'noam-qiu472@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (81, 'Rattana', 'Jónasdóttir', 'bello_kowalski900@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (82, 'Uriy', 'Schulz', 'werner_thomas@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (83, 'Mei', 'Jónasdóttir', 'johan-thomas792@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (84, 'Einar', 'Pálsdóttir', 'kjartan+robinson@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (85, 'Lilian', 'Lee', 'wolfgang+hall370@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (86, 'Prasoet', 'Ðorðić', 'yun+starr967@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (87, 'Anong', 'Xu', 'abdullahi-martin861@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (88, 'Zhiqiang', 'Kristjánsson', 'lyubov+arnarson334@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (89, 'Zandile', 'Novikov', 'ravismits315@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (90, 'Pavel', 'Huang', 'wilai_yamada730@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (91, 'Igor', 'Krejčí', 'toshiko.levy72@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (92, 'Santosh', 'Vasilev', 'kseniya.schmid@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (93, 'Ian', 'Wei', 'daniyel-fujii@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (94, 'Elke', 'Ndlovu', 'kun.borkowski138@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (95, 'Walter', 'Pálsson', 'ramesh.zaytseva40@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (96, 'Petra', 'Gunnarsdóttir', 'hadiza-mayer692@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (97, 'Jason', 'Mandal', 'purityye198@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (98, 'Yuval', 'Harðarson', 'tal+meier@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (99, 'Simon', 'Castillo', 'jerzy.nayak952@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (100, 'Pavel', 'Ágústsson', 'chayah+dumont592@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (101, 'Nancy', 'Rungrueang', 'andreasshi646@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (102, 'Pilar', 'Gísladóttir', 'roman_ntuli@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (103, 'Anah', 'Andreeva', 'nokuthula.goto@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (104, 'Ilya', 'Kristjánsson', 'abubakar-jackson108@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (105, 'Marina', 'Žukauskienė', 'sanjay_keller225@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (106, 'Mukesh', 'Günther', 'tebogovolkova@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (107, 'Tebogo', 'Shi', 'steve_bekher@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (108, 'Saman', 'Jóhannsdóttir', 'sebastian_novikova@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (109, 'Fatima', 'Friðriksson', 'luis+meier@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (110, 'Chao', 'Jabłoński', 'michalcarter@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (111, 'Hans', 'Óskarsdóttir', 'tomiko+volkova373@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (112, 'Evgeniy', 'Vazquez', 'maria+prasad453@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (113, 'Keiko', 'Cortes', 'maria-pilar_martinez@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (114, 'Sebastian', 'Pétursdóttir', 'andreaudo831@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (115, 'Tebogo', 'Dudek', 'arnar.gaby845@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (116, 'Sita', 'Liu', 'li.michalski473@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (117, 'Nkosinathi', 'Jasiński', 'joannguyen355@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (118, 'Bongani', 'Álvarez', 'winai.tshabalala@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (119, 'Yukio', 'Kaur', 'barbaradai@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (120, 'Jacek', 'Kimani', 'tomiko-xu@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (121, 'Kun', 'Pfeiffer', 'adiy.shapiro966@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (122, 'Sammy', 'Frolova', 'joan_okon456@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (123, 'Karl-Heinz', 'Omondi', 'ekaterina_ghosh@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (124, 'Helga', 'Bello', 'li+liu@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (125, 'Nicola', 'Saito', 'xiaopingusman@hoverstate.edu', '2022-11-06 14:32:21.249-05', '2022-11-06 14:32:21.249-05');
INSERT INTO public.students VALUES (126, 'Masako', 'Beneš', 'michal_kowalski711@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (127, 'Kjartan', 'Kozłowski', 'andri_biswas@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (128, 'Isa', 'Pan', 'yue.rathod@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (129, 'Thabo', 'Jónsson', 'jean+white687@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (130, 'Min', 'Simiyu', 'james_parker@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (131, 'Noriko', 'Gómez', 'magdalena-fernandez540@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (132, 'Yhudah', 'Núñez', 'kamil_onyango@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (133, 'Aleksandra', 'Mahato', 'michalwagner@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (134, 'Helga', 'Ragnarsdóttir', 'jerzy.yakubu329@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (135, 'Anastasiya', 'Hartmann', 'jackline+zulu229@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (136, 'Lukasz', 'Bekher', 'umarfan@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (137, 'Fiona', 'Göbel', 'shoshanah+ngcobo@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (138, 'Joan', 'Fiala', 'kanchana+diaz@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (139, 'Ali', 'Sharabi', 'radha-price@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (140, 'Julie', 'Őri', 'ester+salisu930@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (141, 'Isaac', 'Fuchs', 'keiko_owino@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (142, 'Isa', 'Ansari', 'esther+mofokeng@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (143, 'Simon', 'Ishii', 'somnuek.chand@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (144, 'Monika', 'Göbel', 'anastasiya-ngubane@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (145, 'Grace', 'Jacobs', 'sita.mahto@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (146, 'Yukio', 'Visser', 'ying_vos@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (147, 'Nan', 'Gil', 'amiyt_morozov@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (148, 'Joyce', 'Karlsdóttir', 'miguel-mikhaylova14@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (149, 'Jean', 'Yamaguchi', 'nanarai371@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (150, 'Heike', 'Rungrueang', 'christian_photsi109@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (151, 'Artyom', 'Őhlschlägerová', 'bjarni+richter@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (152, 'Chayah', 'Stefánsdóttir', 'christopherram@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (153, 'Birna', 'Jenkins', 'jean_wekesa465@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (154, 'Peter', 'Szymański', 'cheng.chanthara131@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (155, 'Isa', 'Halldórsson', 'janusz-guerrero192@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (156, 'Ana', 'Guðmundsson', 'emma_yusuf388@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (157, 'Jonathan', 'Adamczyk', 'aminaprins@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (158, 'Dilip', 'Harrison', 'vladimir+owen689@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (159, 'Xiaoping', 'Ūsas', 'ivan.biswas840@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (160, 'Jean', 'Žukauskas', 'vinod.lim842@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (161, 'Xiaohong', 'De-Jong', 'pavel_su364@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (162, 'Denis', 'Ojo', 'ekaterina.gil75@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (163, 'Eugenia', 'Ramírez', 'liljasaetan@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (164, 'Blessing', 'Ramos', 'agata.qiu83@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (165, 'Gabra', 'Marciniak', 'samran-lang850@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (166, 'Tadashi', 'Hauksdóttir', 'peng_nayak292@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (167, 'Yoshimi', 'Köhler', 'rajesh_aguilar97@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (168, 'Lihua', 'Smit', 'shoshanah_huber@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (169, 'Somnuek', 'Volkova', 'artur.yahaya@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (170, 'Yusuf', 'Hernandez', 'jianhua.ber463@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (171, 'Chen', 'Suwan', 'amnuai.devi@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (172, 'Joyce', 'Ojo', 'lyudmila_rutkowski@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (173, 'Zainab', 'Volkov', 'salisu_jadhav@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (174, 'Bartosz', 'Petrov', 'dieter+anyango@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (175, 'Nikolay', 'Fialová', 'tal_wilson59@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (176, 'Carlos', 'Weiß', 'tamar-ali244@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (177, 'Jason', 'Pérez', 'bjarni.novikova@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (178, 'Emiko', 'Őllösová', 'yuvalnovikov@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (179, 'Zhen', 'Sokolova', 'lin-mendoza@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (180, 'Min', 'Mohammed', 'willem.de-bruijn@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (181, 'Bunmi', 'Ragnarsdóttir', 'akiramaseko804@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (182, 'Xiaoping', 'Romero', 'dieter.roy@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (183, 'Bongani', 'López', 'paula+vasilev368@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (184, 'Kristinn', 'Mikhaylov', 'amiyt-nxumalo586@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (185, 'Amphon', 'Veselý', 'dmitryarnarson316@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (186, 'Francisco', 'Haraldsdóttir', 'arnar.majewski754@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (187, 'Birgir', 'Žukauskas', 'zhiqiang+rumbelow32@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (188, 'Somsak', 'Achieng', 'isah.guo720@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (189, 'Yasuko', 'Visser', 'andreaparry971@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (190, 'Mitsuo', 'Maseko', 'andrzej.huber812@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (191, 'Usman', 'Wei', 'carol+watanabe@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (192, 'Nadezhda', 'Guðjónsson', 'yosef+zhou@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (193, 'Sam', 'Kamiński', 'dmitriy-prins808@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (194, 'Mo', 'Egorov', 'xin.thomas918@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (195, 'Miguel', 'Schütz', 'dorota.amadi172@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (196, 'Marcin', 'Cai', 'anndavies@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (197, 'Maria-Jose', 'Einarsdóttir', 'susan-nayak@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (198, 'Blessing', 'Sveinsdóttir', 'hideo.ray426@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (199, 'Chan', 'Peter', 'radha+hen263@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (200, 'Dmitriy', 'Patil', 'jan+ngobeni@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (201, 'Yahaya', 'Ortiz', 'anan.morris@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (202, 'Mieko', 'Ūžien', 'sebastian.haruna@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (203, 'Valentina', 'Morales', 'michal_thakur556@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (204, 'Evgeniy', 'Nikolaev', 'eliyahu-garrido@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (205, 'Steven', 'Volkov', 'aleksey_smit387@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (206, 'Ruth', 'Sah', 'petra-marciniak447@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (207, 'Herbert', 'Méndez', 'petraren@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (208, 'Ling', 'Nuñez', 'blessing-sombun586@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (209, 'Philip', 'Őri', 'maciej+fernandez823@hoverstate.edu', '2022-11-06 14:32:21.25-05', '2022-11-06 14:32:21.25-05');
INSERT INTO public.students VALUES (210, 'Lihua', 'Peña', 'aleksandr_ohana@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (211, 'Anah', 'Mtshali', 'katsumi.muhammadu@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (212, 'Jakub', 'Ólafsdóttir', 'carmenyamazaki@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (213, 'Wilai', 'Goto', 'ana.elbaz471@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (214, 'Anong', 'David', 'elkekjartansson@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (215, 'Xiaoping', 'Árnadóttir', 'edda_smith718@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (216, 'Johan', 'Muñoz', 'francisco+davis917@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (217, 'Elena', 'Björnsson', 'dariusz+dekker505@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (218, 'Suresh', 'Sanchez', 'manoj+szewczyk@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (219, 'Nan', 'Förster', 'birna_neumann675@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (220, 'William', 'Müller', 'kun.ota517@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (221, 'Joan', 'Hussein', 'viktor.ouma530@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (222, 'Suresh', 'Suleiman', 'emiko_morozova@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (223, 'Gary', 'Helgadóttir', 'grzegorzdominguez547@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (224, 'Alan', 'Nikitina', 'maria-isabel-okeke414@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (225, 'Atli', 'Lehmann', 'hong_kuipers@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (226, 'Walter', 'Harris', 'akira_pietrzak@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (227, 'Anna', 'Maciejewski', 'yan+zhao@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (228, 'Magdalena', 'Æbeltoft', 'wanchai.van-der-heijden98@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (229, 'Lihua', 'Yamamoto', 'martha.einarsson80@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (230, 'Jorge', 'Árnason', 'ana-maria.yakovleva967@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (231, 'Sharon', 'Naidoo', 'jin_muhammad654@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (232, 'Uriy', 'Akinyi', 'somnuek+roberts@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (233, 'Yosef', 'Mohammed', 'suphaphon-schmidt@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (234, 'Bunmi', 'Ágústsdóttir', 'maria-isabel+hoffmann@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (235, 'Agnieszka', 'Æbelø', 'jean+neumann@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (236, 'Hisako', 'Árnadóttir', 'haruna_luo@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (237, 'Prasit', 'Sibiya', 'anton.wairimu64@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (238, 'Paulina', 'Øvergård', 'francisco-javier+akpan@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (239, 'Konstantin', 'Krejčí', 'yan-rees162@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (240, 'Nushi', 'Moore', 'rattana.thakur221@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (241, 'Jesus', 'Mutuku', 'bin_simiyu@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (242, 'Hulda', 'Szewczyk', 'evgeniy+willems524@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (243, 'Yukio', 'Černý', 'ryan-omondi487@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (244, 'Isa', 'Weiß', 'andries-mabaso@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (245, 'Teruko', 'Bello', 'alan_watson283@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (246, 'Mark', 'Krejčí', 'jianhua.gumede837@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (247, 'Marek', 'Magnússon', 'josefa.yoshida@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (248, 'Shay', 'De-Graaf', 'grzegorz_tang@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (249, 'Hadiza', 'Kozlov', 'somnuek+ochieng@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (250, 'Somphong', 'Gómez', 'muhammad.andreev@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (251, 'Adamu', 'Karlsson', 'vijayjankowski16@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (252, 'Leah', 'Cooper', 'victoriameier176@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (253, 'Lucia', 'Kozlova', 'thawilewandowski589@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (254, 'Yasuo', 'Okoro', 'abubakar+de-bruijn143@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (255, 'Jorge', 'Herrera', 'yaakv.popov@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (256, 'Claudia', 'Khoza', 'kelvin+mayer663@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (257, 'Hideo', 'Matsumoto', 'nikitadahan670@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (258, 'Miguel', 'Halldórsdóttir', 'daniyel.serrano714@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (259, 'Yoshie', 'Wilson', 'sibusiso.reyes988@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (260, 'Thawi', 'Zimmermann', 'emma-richardson426@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (261, 'Aminu', 'Björnsdóttir', 'irina-de-graaf@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (262, 'Samuel', 'Žáková', 'kun.zhou@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (263, 'Haruna', 'Lloyd', 'raphael+photsi117@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (264, 'Shizuko', 'Muñoz', 'hassan_arai@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (265, 'Rong', 'Arai', 'agata.johnson277@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (266, 'Bongani', 'Cao', 'manfred+jadhav170@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (267, 'Chan', 'Þorsteinsdóttir', 'josef.helgason487@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (268, 'Katsumi', 'Kučera', 'helgi.katz@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (269, 'Jose-Maria', 'Marková', 'johannes+wagner@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (270, 'Jan', 'Nikitina', 'vladimir-dudek@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (271, 'Nonhlanhla', 'Hauksson', 'charoen.sangthong614@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (272, 'Ram', 'Sasaki', 'pilarbirgisson481@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (273, 'Sara', 'Hartmann', 'takako-allen@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (274, 'Bongani', 'Mitchell', 'michael+werner176@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (275, 'Santosh', 'Ãshaikh', 'williamgarrido@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (276, 'Noam', 'Weiß', 'ning+usman@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (277, 'Javier', 'Ríos', 'keikoadan919@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (278, 'Ana', 'Jónsdóttir', 'mohamed-moshe@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (279, 'Udom', 'Köhler', 'karolina-suleiman98@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (280, 'Leah', 'Beneš', 'hildur-adhiambo976@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (281, 'Berglind', 'Harðardóttir', 'yusuf_morozov982@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (282, 'Isa', 'Lopez', 'susanne-karanja683@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (283, 'Min', 'Þórðarson', 'olga-phillips740@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (284, 'Yong', 'Łukaszewski', 'amnuai-kimura@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (285, 'Joy', 'Meng', 'birgirkato@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (286, 'Sushila', 'Adhiambo', 'alyona+omondi479@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (287, 'Mo', 'Lim', 'ajay.mondal580@hoverstate.edu', '2022-11-06 14:32:21.251-05', '2022-11-06 14:32:21.251-05');
INSERT INTO public.students VALUES (288, 'Zanele', 'García', 'heinz.luo359@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (289, 'Pushpa', 'Helgadóttir', 'katarzyna-einarsson457@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (290, 'Ramesh', 'Mayer', 'sibongile+pretorius@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (291, 'Jesus', 'Vásquez', 'miriam_cai@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (292, 'Steven', 'Sasaki', 'teruko+jadhav288@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (293, 'Chan', 'Jónsdóttir', 'dmitry+yamamoto@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (294, 'Kanchana', 'Jóhannsdóttir', 'christa_ota881@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (295, 'Andreas', 'Groß', 'somchit-williams76@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (296, 'Nadezhda', 'Sigurjónsdóttir', 'jose_li173@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (297, 'Eugenia', 'Kristinsdóttir', 'erna_reyes412@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (298, 'Sommai', 'Hauksdóttir', 'mpho_jadhav@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (299, 'Anthony', 'Schütz', 'tatyana-fuchs844@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (300, 'Tamar', 'Dube', 'kenneth_khatun597@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (301, 'Ramesh', 'Méndez', 'sammy-cooper@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (302, 'Wichian', 'Helgason', 'miykhal-phillips731@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (303, 'Lin', 'Okoth', 'thulani-kucharski597@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (304, 'Yu', 'Johnson', 'miguelshevchenko632@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (305, 'Somnuek', 'Nováková', 'caroline-stepanova453@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (306, 'Mary', 'Matthews', 'mariusz.nayak@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (307, 'Xin', 'Olszewski', 'anastasiya+hussein@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (308, 'Yaakv', 'Romanov', 'kevin+das249@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (309, 'Kiran', 'Thomas', 'weisikora@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (310, 'Elena', 'Baldursdóttir', 'andrzej_hofmann@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (311, 'Hauwa', 'Ríos', 'wanphen+sakamoto469@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (312, 'Marek', 'Löffler', 'esther+blanco447@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (313, 'Somkiat', 'Þórðarson', 'olga-zwane942@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (314, 'Michal', 'Novák', 'ning+ngwenya@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (315, 'Lei', 'Łapiński', 'haiyansun@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (316, 'Erika', 'Krejčí', 'lijun.joseph@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (317, 'Katarzyna', 'Kučerová', 'nicolawalker892@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (318, 'Esther', 'Ashknaziy', 'darya-jansen523@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (319, 'Rong', 'Okafor', 'lyudmilakaranja@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (320, 'Tadashi', 'Onyango', 'yasuko+zawadzki@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (321, 'Zbigniew', 'Mondal', 'magda_volkov121@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (322, 'Dinesh', 'Muhammed', 'jane_vermeulen@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (323, 'Cristina', 'Bos', 'wirot_brown@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (324, 'Masami', 'Kumar', 'yongnayak@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (325, 'Sawat', 'Óskarsdóttir', 'werner.griffiths@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (326, 'Antonia', 'Jäger', 'nicolahassan685@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (327, 'Zbigniew', 'Aminu', 'anah-mkhize364@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (328, 'Steinunn', 'Böttcher', 'masami+rumbelow@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (329, 'Herbert', 'Aoki', 'christinekumar593@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (330, 'Brigitte', 'Moshe', 'sammythongdi2@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (331, 'Leah', 'Guzmán', 'renate.okada631@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (332, 'Margaret', 'Gomez', 'vijay_levy737@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (333, 'Katsumi', 'Musa', 'masako-nakano997@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (334, 'Yakubu', 'Ye', 'kenjiisa@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (335, 'Horst', 'Ríos', 'prasitmurakami@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (336, 'Kai', 'Ásgeirsdóttir', 'shimon-herbulot879@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (337, 'Julie', 'Díaz', 'paulinanakajima183@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (338, 'Agnieszka', 'Fiala', 'shimon.bibi@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (339, 'Aleksandra', 'Muñoz', 'maksim_rabiu300@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (340, 'Prasit', 'Hauksdóttir', 'rajesh-herrmann430@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (341, 'Anan', 'Jasiński', 'nan_buthelezi@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (342, 'Xiang', 'Hernández', 'bongani-ahmed657@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (343, 'Akira', 'Kristinsson', 'rajendra-omondi@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (344, 'Bernd', 'Ødegård', 'yisrael.sah@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (345, 'Francis', 'Jónsson', 'reiko_alvarez269@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (346, 'Tebogo', 'Ágústsson', 'einar.dijkstra10@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (347, 'Chao', 'Ceng', 'gitalu@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (348, 'Yisrael', 'Goldstein', 'lijun.wangui246@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (349, 'Zhen', 'Žukauskas', 'joyceumaru@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (350, 'Wanchai', 'Medina', 'lijunwairimu@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (351, 'Mohammed', 'Zulu', 'chao-garcia763@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (352, 'Oleg', 'Brown', 'daniel+abe927@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (353, 'Karin', 'Muñoz', 'ann-keller271@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (354, 'Paulina', 'Lis', 'liliandekker797@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (355, 'Yasuo', 'Dauda', 'julie+smith99@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (356, 'Amnuai', 'Halldórsdóttir', 'ibrahim_taylor@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (357, 'Karl', 'Mokoena', 'ewa_jiang897@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (358, 'Horst', 'Becker', 'linda+ota@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (359, 'Latda', 'Nowak', 'ping-smit@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (360, 'Ekaterina', 'Núñez', 'somphong-vasilev@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (361, 'Nokuthula', 'Őhlschlägerová', 'olgaqiu923@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (362, 'Qing', 'Czarnecki', 'hui_njuguna682@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (363, 'Kai', 'Dvořáková', 'somphong.ngubane232@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (364, 'Franz', 'Jiménez', 'usman.harrison76@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (365, 'David', 'Sveinsdóttir', 'januszyuan@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (366, 'Wanphen', 'Ólafsdóttir', 'mali_bala@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (367, 'Ian', 'Wekesa', 'somkhit_ouma@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (368, 'Yusuf', 'Sarkar', 'nonhlanhla.walter@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (369, 'Jerzy', 'Ahmed', 'lakshmi.liao304@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (370, 'Joy', 'Muñoz', 'susanne+bunmi839@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (371, 'Hiroko', 'Behera', 'michal-bekher@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (372, 'Michiko', 'Ūsas', 'akira-yakovleva800@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (373, 'Krishna', 'Vásquez', 'januszramirez@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (374, 'Somphong', 'Adri', 'martin+carter@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (375, 'Heike', 'Helgadóttir', 'wanjiru_pawlak240@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (376, 'Leah', 'Cooper', 'nicola+espinoza490@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (377, 'Urmila', 'Kamiński', 'ilya_kobayashi131@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (378, 'Abdullahi', 'Martínez', 'yuval-xu@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (379, 'Yong', 'Nováková', 'kiyoshi+dauda@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (380, 'Francisco-Javier', 'Harðarson', 'artyom_sukkasem772@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (381, 'Na', 'Krawczyk', 'hirokoharle-cowan@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (382, 'Somphong', 'Rosenberg', 'ruth+morozov@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (383, 'Marek', 'Harris', 'kenji_gumede226@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (384, 'Amit', 'Rodríguez', 'rekha_hartmann910@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (385, 'Bartosz', 'Procházková', 'lakshmi_sun35@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (386, 'Urai', 'Gísladóttir', 'wichian-hughes241@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (387, 'Charoen', 'Kowalczyk', 'yu_matthews710@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (388, 'Moshe', 'Jóhannsdóttir', 'elkecherinsuk135@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (389, 'Maciej', 'Æbelø', 'iwona+macharia112@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (390, 'Yuval', 'Łuczak', 'zbigniew.saetan897@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (391, 'Aleksandra', 'Janssen', 'bartosz.ayutthaya@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (392, 'Liping', 'Ansari', 'sammy+fischer@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (393, 'Marek', 'Akpan', 'raju-ashknaziy388@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (394, 'Kelvin', 'Matthews', 'jianhua_pugh303@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (395, 'Shankar', 'Baloyi', 'wichai_starr@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (396, 'Elena', 'Paswan', 'jianjun+kamau94@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (397, 'Paulina', 'Ágústsson', 'alex_allen124@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (398, 'Lan', 'Ragnarsdóttir', 'prasit.adri995@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (399, 'Yukio', 'Pétursson', 'fernandoendo145@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (400, 'Qing', 'Schäfer', 'zhenyamashita@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (401, 'Matt', 'Stefánsdóttir', 'lilian+ellis@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (402, 'Hui', 'Ūsas', 'lucy+grabowski@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (403, 'Ewa', 'Procházka', 'usha_romanova60@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (404, 'Liping', 'Łukaszewski', 'ewa-su774@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (405, 'Somphon', 'Hauksdóttir', 'akira_hu315@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (406, 'Dorota', 'Michalski', 'ali_sakamoto876@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (407, 'Hui', 'Wu', 'yosef+achieng142@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (408, 'Patrick', 'Æbeltoft', 'ibrahim.achieng735@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (409, 'Phonthip', 'Björnsson', 'sebastian+parker@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (410, 'Sawat', 'Hájek', 'lan+nikolaev@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (411, 'Prasit', 'Žukauskas', 'wirat_khatoon386@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (412, 'Haruna', 'Odhiambo', 'fiona.masarweh@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (413, 'Radha', 'Robinson', 'xiaoyanvan-beek@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (414, 'Margaret', 'Hongthong', 'sanjayblom@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (415, 'Jan', 'Ólafsson', 'yahaya+peretz191@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (416, 'Einar', 'Sveinsson', 'ann_nxumalo770@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (417, 'Alberto', 'Yao', 'thulanischmitz684@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (418, 'Kenneth', 'Goldstein', 'stephen.molefe@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (419, 'Krzysztof', 'Kumari', 'shimon_mhlongo723@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (420, 'Pieter', 'Isa', 'chayah+aliyu@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (421, 'Kristina', 'Kuznetsova', 'natalyaivanova375@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (422, 'Yue', 'Llewellyn', 'michal-lang641@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (423, 'Carol', 'Jóhannsson', 'christine-paramar91@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (424, 'Frank', 'Marek', 'avraham.schouten606@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (425, 'Andries', 'Rogers', 'mohammad_jacobs270@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (426, 'Ingrid', 'Delgado', 'tebogoczarnecki728@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (427, 'Agnieszka', 'Shaikh', 'darya+gupta@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (428, 'Masako', 'Jabłoński', 'yosef.kato896@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (429, 'Martha', 'Ãshaikh', 'ali-qiu63@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (430, 'Emiko', 'Sadowski', 'anton.wangui@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (431, 'Janet', 'Ishii', 'sombat.jansen@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (432, 'Dmitriy', 'Friðriksson', 'ian-michalak@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (433, 'Victoria', 'Bunsi', 'anankongkaeo@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (434, 'Roy', 'Ouma', 'martha+karlsson@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (435, 'Sawat', 'Adamczyk', 'radha.smirnov@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (436, 'Uwe', 'Rabiu', 'masaoomer@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (437, 'Keiko', 'Baran', 'peng+ding@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (438, 'Yhudiyt', 'Hill', 'yoshio_edwards162@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (439, 'Dorota', 'Őzse', 'marymeng838@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (440, 'Eugenia', 'Jónsdóttir', 'omer-friedman@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (441, 'Usha', 'Mofokeng', 'anahowino@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (442, 'Uriy', 'Pétursdóttir', 'francisco-javier.suarez63@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (443, 'Gang', 'García', 'alberto+yamamoto@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (444, 'Ning', 'Pétursdóttir', 'somsak-smit@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (445, 'Jason', 'Pálsdóttir', 'mali.radebe@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (446, 'Jean', 'Černý', 'rebeccaochieng649@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (447, 'Natalya', 'Baloyi', 'ahmad_schmid253@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (448, 'Bello', 'Dvořák', 'zainabohana@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (449, 'Muhammad', 'Delgado', 'josefa.ishikawa242@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (450, 'Lin', 'Gíslason', 'daniyel.eze797@hoverstate.edu', '2022-11-06 14:32:21.252-05', '2022-11-06 14:32:21.252-05');
INSERT INTO public.students VALUES (451, 'Rong', 'Baldursdóttir', 'ewa.novikov@hoverstate.edu', '2022-11-06 14:32:21.253-05', '2022-11-06 14:32:21.253-05');
INSERT INTO public.students VALUES (452, 'Ravi', 'Kozłowski', 'sveinn.kozlov@hoverstate.edu', '2022-11-06 14:32:21.253-05', '2022-11-06 14:32:21.253-05');
INSERT INTO public.students VALUES (453, 'Ragnar', 'Sigurðardóttir', 'jose-manuel_hussein8@hoverstate.edu', '2022-11-06 14:32:21.253-05', '2022-11-06 14:32:21.253-05');
INSERT INTO public.students VALUES (454, 'Wirot', 'Klein', 'eva-dekker@hoverstate.edu', '2022-11-06 14:32:21.253-05', '2022-11-06 14:32:21.253-05');
INSERT INTO public.students VALUES (455, 'Maria-Jose', 'Pétursdóttir', 'philip+adebayo778@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (456, 'Javier', 'Žukauskienė', 'esther_jakubowski@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (457, 'Michal', 'Kučera', 'valentinasergeeva@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (458, 'Gareth', 'Martínez', 'hong+walters757@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (459, 'Steve', 'Njoroge', 'suman.photsi756@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (460, 'Elisabeth', 'Starr', 'anah-de-jong811@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (461, 'Musa', 'López', 'lyubov.ochieng@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (462, 'Sveinn', 'Rungrueang', 'thawi+prieto@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (463, 'William', 'Guðjónsson', 'sebastian-yuan@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (464, 'Maksim', 'Lozano', 'tebogo-johnson@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (465, 'Diego', 'Huang', 'patriciaegorova190@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (466, 'Raju', 'Ūžien', 'chao.yahaya@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (467, 'Rakesh', 'Grabowski', 'li-maciejewski402@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (468, 'Yoko', 'Guðmundsson', 'tal_amadi444@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (469, 'Rosa', 'Schäfer', 'fatimagonzales@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (470, 'Heinz', 'Endo', 'andreas.thomas777@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (471, 'Omer', 'Ðekić', 'janusz-yamada932@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (472, 'Tamar', 'Günther', 'yasuo+mabaso@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (473, 'Ping', 'Pokorná', 'reiko_wambua@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (474, 'Bartosz', 'Peña', 'gary_brouwer@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (475, 'Kiran', 'Őllösová', 'haimnovikova103@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (476, 'Lan', 'Guðjónsson', 'stephenneumann@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (477, 'Sushila', 'Urbański', 'xiang-ramirez@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (478, 'Dorota', 'Karlsdóttir', 'fionamandal265@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (479, 'Eugenia', 'Veselý', 'jan-de-groot@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (480, 'Kjartan', 'Watson', 'grzegorz.espinoza@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (481, 'Lakshmi', 'Žukauskienė', 'yuval-schmitt@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (482, 'Maria-Pilar', 'Jabłoński', 'rachelellis309@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (483, 'Petrus', 'Jimenez', 'maria-michalak@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (484, 'Somphon', 'Fernández', 'kseniya.liang@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (485, 'Unnur', 'Jiménez', 'jianping.sulaiman@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (486, 'Somphon', 'Keller', 'maciej+shaw@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (487, 'Miriam', 'Kimani', 'moshengubane@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (488, 'Nkosinathi', 'Dijkstra', 'victor_sharma@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (489, 'Sergey', 'Martínez', 'james+aguilar@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (490, 'Xiaoli', 'Inoue', 'somkhitrumbelow220@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (491, 'Takashi', 'Óskarsdóttir', 'manju+mizrahi653@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (492, 'Sarah', 'Macharia', 'jennifer-sadowski@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (493, 'Pawel', 'Mahato', 'somchitmurakami@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (494, 'Ngozi', 'Schmidt', 'ragnar+mokoena@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (495, 'Fran', 'Jabłoński', 'shay-igwe79@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (496, 'Nadezhda', 'Karlsdóttir', 'helen-kaczmarek@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (497, 'Javier', 'Horák', 'hendrik_sangthong305@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (498, 'Andrea', 'Egorov', 'dorota.vasileva@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (499, 'Sunita', 'Pálsson', 'francisco-javiersmith@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');
INSERT INTO public.students VALUES (500, 'Nobuko', 'Eliyahu', 'xiaoping.mbatha792@hoverstate.edu', '2022-11-06 14:32:21.254-05', '2022-11-06 14:32:21.254-05');


--
-- Data for Name: students_courses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.students_courses VALUES (1, 35, 43, '2022-11-06 14:32:21.872-05', '2022-11-06 14:32:21.872-05', 3);
INSERT INTO public.students_courses VALUES (2, 149, 1, '2022-11-06 14:32:21.871-05', '2022-11-06 14:32:21.871-05', 0);
INSERT INTO public.students_courses VALUES (3, 135, 24, '2022-11-06 14:32:21.873-05', '2022-11-06 14:32:21.873-05', 0);
INSERT INTO public.students_courses VALUES (4, 286, 5, '2022-11-06 14:32:21.873-05', '2022-11-06 14:32:21.873-05', 2);
INSERT INTO public.students_courses VALUES (5, 257, 7, '2022-11-06 14:32:21.872-05', '2022-11-06 14:32:21.872-05', 3);
INSERT INTO public.students_courses VALUES (6, 80, 43, '2022-11-06 14:32:21.872-05', '2022-11-06 14:32:21.872-05', 1);
INSERT INTO public.students_courses VALUES (7, 338, 42, '2022-11-06 14:32:21.872-05', '2022-11-06 14:32:21.872-05', 2);
INSERT INTO public.students_courses VALUES (8, 35, 41, '2022-11-06 14:32:21.874-05', '2022-11-06 14:32:21.874-05', 2);
INSERT INTO public.students_courses VALUES (9, 301, 25, '2022-11-06 14:32:21.873-05', '2022-11-06 14:32:21.873-05', 3);
INSERT INTO public.students_courses VALUES (10, 490, 48, '2022-11-06 14:32:21.874-05', '2022-11-06 14:32:21.874-05', 2);
INSERT INTO public.students_courses VALUES (11, 6, 31, '2022-11-06 14:32:21.875-05', '2022-11-06 14:32:21.875-05', 0);
INSERT INTO public.students_courses VALUES (12, 15, 29, '2022-11-06 14:32:21.875-05', '2022-11-06 14:32:21.875-05', 1);
INSERT INTO public.students_courses VALUES (13, 345, 46, '2022-11-06 14:32:21.876-05', '2022-11-06 14:32:21.876-05', 0);
INSERT INTO public.students_courses VALUES (14, 215, 29, '2022-11-06 14:32:21.875-05', '2022-11-06 14:32:21.875-05', 0);
INSERT INTO public.students_courses VALUES (15, 200, 8, '2022-11-06 14:32:21.877-05', '2022-11-06 14:32:21.877-05', 4);
INSERT INTO public.students_courses VALUES (16, 293, 5, '2022-11-06 14:32:21.877-05', '2022-11-06 14:32:21.877-05', 1);
INSERT INTO public.students_courses VALUES (17, 367, 10, '2022-11-06 14:32:21.876-05', '2022-11-06 14:32:21.876-05', 3);
INSERT INTO public.students_courses VALUES (18, 381, 16, '2022-11-06 14:32:21.876-05', '2022-11-06 14:32:21.876-05', 3);
INSERT INTO public.students_courses VALUES (19, 341, 2, '2022-11-06 14:32:21.878-05', '2022-11-06 14:32:21.878-05', 1);
INSERT INTO public.students_courses VALUES (20, 366, 22, '2022-11-06 14:32:21.878-05', '2022-11-06 14:32:21.878-05', 0);
INSERT INTO public.students_courses VALUES (21, 178, 1, '2022-11-06 14:32:21.877-05', '2022-11-06 14:32:21.877-05', 3);
INSERT INTO public.students_courses VALUES (22, 377, 4, '2022-11-06 14:32:21.88-05', '2022-11-06 14:32:21.88-05', 2);
INSERT INTO public.students_courses VALUES (23, 43, 42, '2022-11-06 14:32:21.879-05', '2022-11-06 14:32:21.879-05', 3);
INSERT INTO public.students_courses VALUES (24, 226, 50, '2022-11-06 14:32:21.878-05', '2022-11-06 14:32:21.878-05', 1);
INSERT INTO public.students_courses VALUES (25, 442, 11, '2022-11-06 14:32:21.879-05', '2022-11-06 14:32:21.879-05', 1);
INSERT INTO public.students_courses VALUES (26, 433, 40, '2022-11-06 14:32:21.88-05', '2022-11-06 14:32:21.88-05', 4);
INSERT INTO public.students_courses VALUES (27, 277, 44, '2022-11-06 14:32:21.879-05', '2022-11-06 14:32:21.879-05', 1);
INSERT INTO public.students_courses VALUES (28, 260, 6, '2022-11-06 14:32:21.881-05', '2022-11-06 14:32:21.881-05', 3);
INSERT INTO public.students_courses VALUES (29, 344, 20, '2022-11-06 14:32:21.881-05', '2022-11-06 14:32:21.881-05', 1);
INSERT INTO public.students_courses VALUES (30, 119, 46, '2022-11-06 14:32:21.88-05', '2022-11-06 14:32:21.88-05', 3);
INSERT INTO public.students_courses VALUES (31, 119, 18, '2022-11-06 14:32:21.88-05', '2022-11-06 14:32:21.88-05', 1);
INSERT INTO public.students_courses VALUES (32, 268, 28, '2022-11-06 14:32:21.882-05', '2022-11-06 14:32:21.882-05', 4);
INSERT INTO public.students_courses VALUES (33, 71, 44, '2022-11-06 14:32:21.881-05', '2022-11-06 14:32:21.881-05', 0);
INSERT INTO public.students_courses VALUES (34, 418, 32, '2022-11-06 14:32:21.881-05', '2022-11-06 14:32:21.881-05', 3);
INSERT INTO public.students_courses VALUES (35, 93, 36, '2022-11-06 14:32:21.883-05', '2022-11-06 14:32:21.883-05', 3);
INSERT INTO public.students_courses VALUES (36, 405, 25, '2022-11-06 14:32:21.883-05', '2022-11-06 14:32:21.883-05', 1);
INSERT INTO public.students_courses VALUES (37, 479, 35, '2022-11-06 14:32:21.881-05', '2022-11-06 14:32:21.881-05', 2);
INSERT INTO public.students_courses VALUES (38, 246, 28, '2022-11-06 14:32:21.882-05', '2022-11-06 14:32:21.882-05', 3);
INSERT INTO public.students_courses VALUES (39, 356, 50, '2022-11-06 14:32:21.884-05', '2022-11-06 14:32:21.884-05', 3);
INSERT INTO public.students_courses VALUES (40, 97, 11, '2022-11-06 14:32:21.882-05', '2022-11-06 14:32:21.882-05', 1);
INSERT INTO public.students_courses VALUES (41, 95, 35, '2022-11-06 14:32:21.882-05', '2022-11-06 14:32:21.882-05', 1);
INSERT INTO public.students_courses VALUES (42, 345, 43, '2022-11-06 14:32:21.884-05', '2022-11-06 14:32:21.884-05', 0);
INSERT INTO public.students_courses VALUES (43, 30, 50, '2022-11-06 14:32:21.884-05', '2022-11-06 14:32:21.884-05', 2);
INSERT INTO public.students_courses VALUES (44, 55, 5, '2022-11-06 14:32:21.883-05', '2022-11-06 14:32:21.883-05', 2);
INSERT INTO public.students_courses VALUES (45, 62, 24, '2022-11-06 14:32:21.883-05', '2022-11-06 14:32:21.883-05', 2);
INSERT INTO public.students_courses VALUES (46, 215, 2, '2022-11-06 14:32:21.884-05', '2022-11-06 14:32:21.884-05', 3);
INSERT INTO public.students_courses VALUES (47, 459, 44, '2022-11-06 14:32:21.884-05', '2022-11-06 14:32:21.884-05', 1);
INSERT INTO public.students_courses VALUES (48, 424, 30, '2022-11-06 14:32:21.884-05', '2022-11-06 14:32:21.884-05', 3);
INSERT INTO public.students_courses VALUES (49, 155, 11, '2022-11-06 14:32:21.885-05', '2022-11-06 14:32:21.885-05', 1);
INSERT INTO public.students_courses VALUES (50, 174, 46, '2022-11-06 14:32:21.885-05', '2022-11-06 14:32:21.885-05', 2);
INSERT INTO public.students_courses VALUES (51, 295, 18, '2022-11-06 14:32:21.885-05', '2022-11-06 14:32:21.885-05', 2);
INSERT INTO public.students_courses VALUES (52, 54, 33, '2022-11-06 14:32:21.885-05', '2022-11-06 14:32:21.885-05', 4);
INSERT INTO public.students_courses VALUES (53, 386, 16, '2022-11-06 14:32:21.885-05', '2022-11-06 14:32:21.885-05', 2);
INSERT INTO public.students_courses VALUES (54, 439, 36, '2022-11-06 14:32:21.885-05', '2022-11-06 14:32:21.885-05', 2);
INSERT INTO public.students_courses VALUES (55, 258, 32, '2022-11-06 14:32:21.885-05', '2022-11-06 14:32:21.885-05', 4);
INSERT INTO public.students_courses VALUES (56, 184, 29, '2022-11-06 14:32:21.886-05', '2022-11-06 14:32:21.886-05', 3);
INSERT INTO public.students_courses VALUES (57, 186, 9, '2022-11-06 14:32:21.887-05', '2022-11-06 14:32:21.887-05', 1);
INSERT INTO public.students_courses VALUES (58, 282, 33, '2022-11-06 14:32:21.886-05', '2022-11-06 14:32:21.886-05', 3);
INSERT INTO public.students_courses VALUES (59, 160, 43, '2022-11-06 14:32:21.886-05', '2022-11-06 14:32:21.886-05', 1);
INSERT INTO public.students_courses VALUES (60, 177, 20, '2022-11-06 14:32:21.886-05', '2022-11-06 14:32:21.886-05', 2);
INSERT INTO public.students_courses VALUES (61, 355, 10, '2022-11-06 14:32:21.887-05', '2022-11-06 14:32:21.887-05', 1);
INSERT INTO public.students_courses VALUES (62, 410, 48, '2022-11-06 14:32:21.886-05', '2022-11-06 14:32:21.886-05', 0);
INSERT INTO public.students_courses VALUES (63, 142, 39, '2022-11-06 14:32:21.886-05', '2022-11-06 14:32:21.886-05', 4);
INSERT INTO public.students_courses VALUES (64, 390, 31, '2022-11-06 14:32:21.887-05', '2022-11-06 14:32:21.887-05', 2);
INSERT INTO public.students_courses VALUES (65, 61, 49, '2022-11-06 14:32:21.888-05', '2022-11-06 14:32:21.888-05', 2);
INSERT INTO public.students_courses VALUES (66, 323, 11, '2022-11-06 14:32:21.887-05', '2022-11-06 14:32:21.887-05', 3);
INSERT INTO public.students_courses VALUES (67, 438, 39, '2022-11-06 14:32:21.887-05', '2022-11-06 14:32:21.887-05', 1);
INSERT INTO public.students_courses VALUES (68, 89, 37, '2022-11-06 14:32:21.888-05', '2022-11-06 14:32:21.888-05', 2);
INSERT INTO public.students_courses VALUES (69, 195, 18, '2022-11-06 14:32:21.887-05', '2022-11-06 14:32:21.887-05', 2);
INSERT INTO public.students_courses VALUES (70, 164, 41, '2022-11-06 14:32:21.888-05', '2022-11-06 14:32:21.888-05', 1);
INSERT INTO public.students_courses VALUES (71, 119, 14, '2022-11-06 14:32:21.888-05', '2022-11-06 14:32:21.888-05', 4);
INSERT INTO public.students_courses VALUES (72, 434, 29, '2022-11-06 14:32:21.888-05', '2022-11-06 14:32:21.888-05', 2);
INSERT INTO public.students_courses VALUES (73, 464, 26, '2022-11-06 14:32:21.888-05', '2022-11-06 14:32:21.888-05', 0);
INSERT INTO public.students_courses VALUES (74, 439, 3, '2022-11-06 14:32:21.888-05', '2022-11-06 14:32:21.888-05', 3);
INSERT INTO public.students_courses VALUES (75, 168, 13, '2022-11-06 14:32:21.889-05', '2022-11-06 14:32:21.889-05', 0);
INSERT INTO public.students_courses VALUES (76, 400, 9, '2022-11-06 14:32:21.889-05', '2022-11-06 14:32:21.889-05', 3);
INSERT INTO public.students_courses VALUES (77, 304, 38, '2022-11-06 14:32:21.889-05', '2022-11-06 14:32:21.889-05', 2);
INSERT INTO public.students_courses VALUES (78, 456, 38, '2022-11-06 14:32:21.889-05', '2022-11-06 14:32:21.889-05', 0);
INSERT INTO public.students_courses VALUES (79, 457, 48, '2022-11-06 14:32:21.889-05', '2022-11-06 14:32:21.889-05', 3);
INSERT INTO public.students_courses VALUES (80, 473, 20, '2022-11-06 14:32:21.889-05', '2022-11-06 14:32:21.889-05', 1);
INSERT INTO public.students_courses VALUES (81, 351, 48, '2022-11-06 14:32:21.89-05', '2022-11-06 14:32:21.89-05', 1);
INSERT INTO public.students_courses VALUES (82, 161, 3, '2022-11-06 14:32:21.89-05', '2022-11-06 14:32:21.89-05', 1);
INSERT INTO public.students_courses VALUES (83, 36, 48, '2022-11-06 14:32:21.89-05', '2022-11-06 14:32:21.89-05', 0);
INSERT INTO public.students_courses VALUES (84, 116, 36, '2022-11-06 14:32:21.891-05', '2022-11-06 14:32:21.891-05', 3);
INSERT INTO public.students_courses VALUES (85, 175, 32, '2022-11-06 14:32:21.892-05', '2022-11-06 14:32:21.892-05', 0);
INSERT INTO public.students_courses VALUES (86, 314, 40, '2022-11-06 14:32:21.891-05', '2022-11-06 14:32:21.891-05', 3);
INSERT INTO public.students_courses VALUES (87, 130, 3, '2022-11-06 14:32:21.89-05', '2022-11-06 14:32:21.89-05', 1);
INSERT INTO public.students_courses VALUES (88, 123, 15, '2022-11-06 14:32:21.89-05', '2022-11-06 14:32:21.89-05', 1);
INSERT INTO public.students_courses VALUES (89, 417, 32, '2022-11-06 14:32:21.892-05', '2022-11-06 14:32:21.892-05', 3);
INSERT INTO public.students_courses VALUES (90, 114, 45, '2022-11-06 14:32:21.891-05', '2022-11-06 14:32:21.891-05', 1);
INSERT INTO public.students_courses VALUES (91, 131, 6, '2022-11-06 14:32:21.892-05', '2022-11-06 14:32:21.892-05', 2);
INSERT INTO public.students_courses VALUES (92, 258, 19, '2022-11-06 14:32:21.893-05', '2022-11-06 14:32:21.893-05', 2);
INSERT INTO public.students_courses VALUES (93, 383, 5, '2022-11-06 14:32:21.894-05', '2022-11-06 14:32:21.894-05', 3);
INSERT INTO public.students_courses VALUES (94, 124, 22, '2022-11-06 14:32:21.892-05', '2022-11-06 14:32:21.892-05', 3);
INSERT INTO public.students_courses VALUES (95, 231, 38, '2022-11-06 14:32:21.893-05', '2022-11-06 14:32:21.893-05', 1);
INSERT INTO public.students_courses VALUES (96, 22, 21, '2022-11-06 14:32:21.893-05', '2022-11-06 14:32:21.893-05', 1);
INSERT INTO public.students_courses VALUES (97, 47, 42, '2022-11-06 14:32:21.893-05', '2022-11-06 14:32:21.893-05', 2);
INSERT INTO public.students_courses VALUES (98, 85, 32, '2022-11-06 14:32:21.894-05', '2022-11-06 14:32:21.894-05', 3);
INSERT INTO public.students_courses VALUES (99, 349, 12, '2022-11-06 14:32:21.894-05', '2022-11-06 14:32:21.894-05', 2);
INSERT INTO public.students_courses VALUES (100, 382, 45, '2022-11-06 14:32:21.894-05', '2022-11-06 14:32:21.894-05', 1);
INSERT INTO public.students_courses VALUES (101, 341, 48, '2022-11-06 14:32:21.897-05', '2022-11-06 14:32:21.897-05', 0);
INSERT INTO public.students_courses VALUES (102, 136, 41, '2022-11-06 14:32:21.894-05', '2022-11-06 14:32:21.894-05', 1);
INSERT INTO public.students_courses VALUES (103, 479, 45, '2022-11-06 14:32:21.894-05', '2022-11-06 14:32:21.894-05', 0);
INSERT INTO public.students_courses VALUES (104, 451, 25, '2022-11-06 14:32:21.895-05', '2022-11-06 14:32:21.895-05', 2);
INSERT INTO public.students_courses VALUES (105, 368, 19, '2022-11-06 14:32:21.897-05', '2022-11-06 14:32:21.897-05', 1);
INSERT INTO public.students_courses VALUES (106, 89, 12, '2022-11-06 14:32:21.895-05', '2022-11-06 14:32:21.895-05', 3);
INSERT INTO public.students_courses VALUES (107, 436, 5, '2022-11-06 14:32:21.895-05', '2022-11-06 14:32:21.895-05', 2);
INSERT INTO public.students_courses VALUES (108, 86, 25, '2022-11-06 14:32:21.896-05', '2022-11-06 14:32:21.896-05', 2);
INSERT INTO public.students_courses VALUES (109, 392, 8, '2022-11-06 14:32:21.898-05', '2022-11-06 14:32:21.898-05', 1);
INSERT INTO public.students_courses VALUES (110, 103, 14, '2022-11-06 14:32:21.897-05', '2022-11-06 14:32:21.897-05', 2);
INSERT INTO public.students_courses VALUES (111, 257, 49, '2022-11-06 14:32:21.897-05', '2022-11-06 14:32:21.897-05', 3);
INSERT INTO public.students_courses VALUES (112, 490, 23, '2022-11-06 14:32:21.898-05', '2022-11-06 14:32:21.898-05', 3);
INSERT INTO public.students_courses VALUES (113, 35, 24, '2022-11-06 14:32:21.898-05', '2022-11-06 14:32:21.898-05', 2);
INSERT INTO public.students_courses VALUES (114, 24, 34, '2022-11-06 14:32:21.898-05', '2022-11-06 14:32:21.898-05', 2);
INSERT INTO public.students_courses VALUES (115, 343, 42, '2022-11-06 14:32:21.898-05', '2022-11-06 14:32:21.898-05', 2);
INSERT INTO public.students_courses VALUES (116, 111, 24, '2022-11-06 14:32:21.899-05', '2022-11-06 14:32:21.899-05', 4);
INSERT INTO public.students_courses VALUES (117, 491, 49, '2022-11-06 14:32:21.898-05', '2022-11-06 14:32:21.898-05', 0);
INSERT INTO public.students_courses VALUES (118, 55, 7, '2022-11-06 14:32:21.899-05', '2022-11-06 14:32:21.899-05', 3);
INSERT INTO public.students_courses VALUES (119, 118, 48, '2022-11-06 14:32:21.899-05', '2022-11-06 14:32:21.899-05', 0);
INSERT INTO public.students_courses VALUES (120, 3, 17, '2022-11-06 14:32:21.899-05', '2022-11-06 14:32:21.899-05', 0);
INSERT INTO public.students_courses VALUES (121, 463, 31, '2022-11-06 14:32:21.899-05', '2022-11-06 14:32:21.899-05', 3);
INSERT INTO public.students_courses VALUES (122, 308, 33, '2022-11-06 14:32:21.9-05', '2022-11-06 14:32:21.9-05', 4);
INSERT INTO public.students_courses VALUES (123, 137, 29, '2022-11-06 14:32:21.899-05', '2022-11-06 14:32:21.899-05', 1);
INSERT INTO public.students_courses VALUES (124, 6, 5, '2022-11-06 14:32:21.9-05', '2022-11-06 14:32:21.9-05', 2);
INSERT INTO public.students_courses VALUES (125, 55, 5, '2022-11-06 14:32:21.899-05', '2022-11-06 14:32:21.899-05', 1);
INSERT INTO public.students_courses VALUES (126, 258, 38, '2022-11-06 14:32:21.9-05', '2022-11-06 14:32:21.9-05', 3);
INSERT INTO public.students_courses VALUES (127, 236, 35, '2022-11-06 14:32:21.9-05', '2022-11-06 14:32:21.9-05', 1);
INSERT INTO public.students_courses VALUES (128, 43, 42, '2022-11-06 14:32:21.901-05', '2022-11-06 14:32:21.901-05', 2);
INSERT INTO public.students_courses VALUES (129, 27, 17, '2022-11-06 14:32:21.9-05', '2022-11-06 14:32:21.9-05', 1);
INSERT INTO public.students_courses VALUES (130, 232, 11, '2022-11-06 14:32:21.901-05', '2022-11-06 14:32:21.901-05', 3);
INSERT INTO public.students_courses VALUES (131, 72, 44, '2022-11-06 14:32:21.9-05', '2022-11-06 14:32:21.9-05', 1);
INSERT INTO public.students_courses VALUES (132, 329, 17, '2022-11-06 14:32:21.902-05', '2022-11-06 14:32:21.902-05', 4);
INSERT INTO public.students_courses VALUES (133, 210, 50, '2022-11-06 14:32:21.901-05', '2022-11-06 14:32:21.901-05', 1);
INSERT INTO public.students_courses VALUES (134, 169, 12, '2022-11-06 14:32:21.901-05', '2022-11-06 14:32:21.901-05', 1);
INSERT INTO public.students_courses VALUES (135, 336, 30, '2022-11-06 14:32:21.901-05', '2022-11-06 14:32:21.901-05', 2);
INSERT INTO public.students_courses VALUES (136, 438, 28, '2022-11-06 14:32:21.904-05', '2022-11-06 14:32:21.904-05', 0);
INSERT INTO public.students_courses VALUES (137, 489, 29, '2022-11-06 14:32:21.901-05', '2022-11-06 14:32:21.901-05', 1);
INSERT INTO public.students_courses VALUES (138, 316, 49, '2022-11-06 14:32:21.901-05', '2022-11-06 14:32:21.901-05', 2);
INSERT INTO public.students_courses VALUES (139, 99, 14, '2022-11-06 14:32:21.902-05', '2022-11-06 14:32:21.902-05', 2);
INSERT INTO public.students_courses VALUES (140, 67, 26, '2022-11-06 14:32:21.904-05', '2022-11-06 14:32:21.904-05', 3);
INSERT INTO public.students_courses VALUES (141, 335, 46, '2022-11-06 14:32:21.904-05', '2022-11-06 14:32:21.904-05', 3);
INSERT INTO public.students_courses VALUES (142, 396, 12, '2022-11-06 14:32:21.905-05', '2022-11-06 14:32:21.905-05', 2);
INSERT INTO public.students_courses VALUES (143, 404, 9, '2022-11-06 14:32:21.905-05', '2022-11-06 14:32:21.905-05', 4);
INSERT INTO public.students_courses VALUES (144, 228, 7, '2022-11-06 14:32:21.905-05', '2022-11-06 14:32:21.905-05', 2);
INSERT INTO public.students_courses VALUES (145, 490, 37, '2022-11-06 14:32:21.904-05', '2022-11-06 14:32:21.904-05', 1);
INSERT INTO public.students_courses VALUES (146, 105, 8, '2022-11-06 14:32:21.906-05', '2022-11-06 14:32:21.906-05', 3);
INSERT INTO public.students_courses VALUES (147, 56, 44, '2022-11-06 14:32:21.905-05', '2022-11-06 14:32:21.905-05', 2);
INSERT INTO public.students_courses VALUES (148, 493, 37, '2022-11-06 14:32:21.905-05', '2022-11-06 14:32:21.905-05', 1);
INSERT INTO public.students_courses VALUES (149, 223, 27, '2022-11-06 14:32:21.906-05', '2022-11-06 14:32:21.906-05', 4);
INSERT INTO public.students_courses VALUES (150, 356, 28, '2022-11-06 14:32:21.907-05', '2022-11-06 14:32:21.907-05', 1);
INSERT INTO public.students_courses VALUES (151, 163, 19, '2022-11-06 14:32:21.906-05', '2022-11-06 14:32:21.906-05', 3);
INSERT INTO public.students_courses VALUES (152, 415, 49, '2022-11-06 14:32:21.907-05', '2022-11-06 14:32:21.907-05', 1);
INSERT INTO public.students_courses VALUES (153, 452, 31, '2022-11-06 14:32:21.906-05', '2022-11-06 14:32:21.906-05', 3);
INSERT INTO public.students_courses VALUES (154, 393, 13, '2022-11-06 14:32:21.909-05', '2022-11-06 14:32:21.909-05', 1);
INSERT INTO public.students_courses VALUES (155, 249, 22, '2022-11-06 14:32:21.908-05', '2022-11-06 14:32:21.908-05', 0);
INSERT INTO public.students_courses VALUES (156, 78, 22, '2022-11-06 14:32:21.908-05', '2022-11-06 14:32:21.908-05', 3);
INSERT INTO public.students_courses VALUES (157, 215, 20, '2022-11-06 14:32:21.91-05', '2022-11-06 14:32:21.91-05', 3);
INSERT INTO public.students_courses VALUES (158, 64, 21, '2022-11-06 14:32:21.909-05', '2022-11-06 14:32:21.909-05', 0);
INSERT INTO public.students_courses VALUES (159, 248, 12, '2022-11-06 14:32:21.908-05', '2022-11-06 14:32:21.908-05', 4);
INSERT INTO public.students_courses VALUES (160, 139, 23, '2022-11-06 14:32:21.909-05', '2022-11-06 14:32:21.909-05', 1);
INSERT INTO public.students_courses VALUES (161, 38, 34, '2022-11-06 14:32:21.909-05', '2022-11-06 14:32:21.909-05', 3);
INSERT INTO public.students_courses VALUES (162, 151, 44, '2022-11-06 14:32:21.91-05', '2022-11-06 14:32:21.91-05', 2);
INSERT INTO public.students_courses VALUES (163, 131, 24, '2022-11-06 14:32:21.911-05', '2022-11-06 14:32:21.911-05', 1);
INSERT INTO public.students_courses VALUES (164, 328, 32, '2022-11-06 14:32:21.91-05', '2022-11-06 14:32:21.91-05', 0);
INSERT INTO public.students_courses VALUES (165, 17, 43, '2022-11-06 14:32:21.912-05', '2022-11-06 14:32:21.912-05', 2);
INSERT INTO public.students_courses VALUES (166, 166, 42, '2022-11-06 14:32:21.91-05', '2022-11-06 14:32:21.91-05', 4);
INSERT INTO public.students_courses VALUES (167, 105, 21, '2022-11-06 14:32:21.912-05', '2022-11-06 14:32:21.912-05', 4);
INSERT INTO public.students_courses VALUES (168, 461, 20, '2022-11-06 14:32:21.913-05', '2022-11-06 14:32:21.913-05', 2);
INSERT INTO public.students_courses VALUES (169, 217, 27, '2022-11-06 14:32:21.912-05', '2022-11-06 14:32:21.912-05', 3);
INSERT INTO public.students_courses VALUES (170, 188, 3, '2022-11-06 14:32:21.912-05', '2022-11-06 14:32:21.912-05', 1);
INSERT INTO public.students_courses VALUES (171, 79, 6, '2022-11-06 14:32:21.912-05', '2022-11-06 14:32:21.912-05', 2);
INSERT INTO public.students_courses VALUES (172, 248, 42, '2022-11-06 14:32:21.913-05', '2022-11-06 14:32:21.913-05', 2);
INSERT INTO public.students_courses VALUES (173, 395, 32, '2022-11-06 14:32:21.913-05', '2022-11-06 14:32:21.913-05', 3);
INSERT INTO public.students_courses VALUES (174, 331, 11, '2022-11-06 14:32:21.913-05', '2022-11-06 14:32:21.913-05', 2);
INSERT INTO public.students_courses VALUES (175, 367, 48, '2022-11-06 14:32:21.914-05', '2022-11-06 14:32:21.914-05', 4);
INSERT INTO public.students_courses VALUES (176, 414, 48, '2022-11-06 14:32:21.914-05', '2022-11-06 14:32:21.914-05', 0);
INSERT INTO public.students_courses VALUES (177, 143, 29, '2022-11-06 14:32:21.913-05', '2022-11-06 14:32:21.913-05', 3);
INSERT INTO public.students_courses VALUES (178, 255, 28, '2022-11-06 14:32:21.913-05', '2022-11-06 14:32:21.913-05', 3);
INSERT INTO public.students_courses VALUES (179, 396, 8, '2022-11-06 14:32:21.914-05', '2022-11-06 14:32:21.914-05', 3);
INSERT INTO public.students_courses VALUES (180, 120, 36, '2022-11-06 14:32:21.913-05', '2022-11-06 14:32:21.913-05', 4);
INSERT INTO public.students_courses VALUES (181, 99, 3, '2022-11-06 14:32:21.914-05', '2022-11-06 14:32:21.914-05', 2);
INSERT INTO public.students_courses VALUES (182, 142, 10, '2022-11-06 14:32:21.914-05', '2022-11-06 14:32:21.914-05', 3);
INSERT INTO public.students_courses VALUES (183, 85, 19, '2022-11-06 14:32:21.914-05', '2022-11-06 14:32:21.914-05', 4);
INSERT INTO public.students_courses VALUES (184, 10, 40, '2022-11-06 14:32:21.915-05', '2022-11-06 14:32:21.915-05', 1);
INSERT INTO public.students_courses VALUES (185, 405, 10, '2022-11-06 14:32:21.915-05', '2022-11-06 14:32:21.915-05', 2);
INSERT INTO public.students_courses VALUES (186, 227, 31, '2022-11-06 14:32:21.915-05', '2022-11-06 14:32:21.915-05', 0);
INSERT INTO public.students_courses VALUES (187, 207, 30, '2022-11-06 14:32:21.915-05', '2022-11-06 14:32:21.915-05', 2);
INSERT INTO public.students_courses VALUES (188, 179, 7, '2022-11-06 14:32:21.915-05', '2022-11-06 14:32:21.915-05', 3);
INSERT INTO public.students_courses VALUES (189, 297, 10, '2022-11-06 14:32:21.915-05', '2022-11-06 14:32:21.915-05', 3);
INSERT INTO public.students_courses VALUES (190, 486, 24, '2022-11-06 14:32:21.915-05', '2022-11-06 14:32:21.915-05', 2);
INSERT INTO public.students_courses VALUES (191, 137, 4, '2022-11-06 14:32:21.916-05', '2022-11-06 14:32:21.916-05', 1);
INSERT INTO public.students_courses VALUES (192, 141, 32, '2022-11-06 14:32:21.916-05', '2022-11-06 14:32:21.916-05', 2);
INSERT INTO public.students_courses VALUES (193, 18, 22, '2022-11-06 14:32:21.916-05', '2022-11-06 14:32:21.916-05', 3);
INSERT INTO public.students_courses VALUES (194, 414, 37, '2022-11-06 14:32:21.917-05', '2022-11-06 14:32:21.917-05', 2);
INSERT INTO public.students_courses VALUES (195, 68, 2, '2022-11-06 14:32:21.916-05', '2022-11-06 14:32:21.916-05', 0);
INSERT INTO public.students_courses VALUES (196, 350, 27, '2022-11-06 14:32:21.916-05', '2022-11-06 14:32:21.916-05', 1);
INSERT INTO public.students_courses VALUES (197, 159, 24, '2022-11-06 14:32:21.917-05', '2022-11-06 14:32:21.917-05', 3);
INSERT INTO public.students_courses VALUES (198, 300, 12, '2022-11-06 14:32:21.917-05', '2022-11-06 14:32:21.917-05', 2);
INSERT INTO public.students_courses VALUES (199, 316, 6, '2022-11-06 14:32:21.916-05', '2022-11-06 14:32:21.916-05', 3);
INSERT INTO public.students_courses VALUES (200, 331, 3, '2022-11-06 14:32:21.917-05', '2022-11-06 14:32:21.917-05', 0);
INSERT INTO public.students_courses VALUES (201, 328, 24, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 0);
INSERT INTO public.students_courses VALUES (202, 184, 18, '2022-11-06 14:32:21.917-05', '2022-11-06 14:32:21.917-05', 2);
INSERT INTO public.students_courses VALUES (203, 385, 2, '2022-11-06 14:32:21.917-05', '2022-11-06 14:32:21.917-05', 0);
INSERT INTO public.students_courses VALUES (204, 130, 44, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 4);
INSERT INTO public.students_courses VALUES (205, 213, 25, '2022-11-06 14:32:21.917-05', '2022-11-06 14:32:21.917-05', 4);
INSERT INTO public.students_courses VALUES (206, 38, 21, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 2);
INSERT INTO public.students_courses VALUES (207, 46, 49, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 3);
INSERT INTO public.students_courses VALUES (208, 195, 34, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 2);
INSERT INTO public.students_courses VALUES (209, 321, 38, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 2);
INSERT INTO public.students_courses VALUES (210, 284, 8, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 3);
INSERT INTO public.students_courses VALUES (211, 125, 50, '2022-11-06 14:32:21.918-05', '2022-11-06 14:32:21.918-05', 3);
INSERT INTO public.students_courses VALUES (212, 309, 3, '2022-11-06 14:32:21.919-05', '2022-11-06 14:32:21.919-05', 2);
INSERT INTO public.students_courses VALUES (213, 209, 20, '2022-11-06 14:32:21.919-05', '2022-11-06 14:32:21.919-05', 2);
INSERT INTO public.students_courses VALUES (214, 423, 22, '2022-11-06 14:32:21.919-05', '2022-11-06 14:32:21.919-05', 3);
INSERT INTO public.students_courses VALUES (215, 474, 46, '2022-11-06 14:32:21.919-05', '2022-11-06 14:32:21.919-05', 2);
INSERT INTO public.students_courses VALUES (216, 103, 39, '2022-11-06 14:32:21.919-05', '2022-11-06 14:32:21.919-05', 2);
INSERT INTO public.students_courses VALUES (217, 193, 36, '2022-11-06 14:32:21.919-05', '2022-11-06 14:32:21.919-05', 3);
INSERT INTO public.students_courses VALUES (218, 34, 34, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 0);
INSERT INTO public.students_courses VALUES (219, 201, 32, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 1);
INSERT INTO public.students_courses VALUES (220, 492, 8, '2022-11-06 14:32:21.919-05', '2022-11-06 14:32:21.919-05', 3);
INSERT INTO public.students_courses VALUES (221, 172, 14, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 0);
INSERT INTO public.students_courses VALUES (222, 330, 41, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 3);
INSERT INTO public.students_courses VALUES (223, 87, 42, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 3);
INSERT INTO public.students_courses VALUES (224, 284, 4, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 1);
INSERT INTO public.students_courses VALUES (225, 244, 33, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 3);
INSERT INTO public.students_courses VALUES (226, 219, 46, '2022-11-06 14:32:21.921-05', '2022-11-06 14:32:21.921-05', 4);
INSERT INTO public.students_courses VALUES (227, 422, 13, '2022-11-06 14:32:21.921-05', '2022-11-06 14:32:21.921-05', 1);
INSERT INTO public.students_courses VALUES (228, 496, 49, '2022-11-06 14:32:21.92-05', '2022-11-06 14:32:21.92-05', 1);
INSERT INTO public.students_courses VALUES (229, 256, 26, '2022-11-06 14:32:21.921-05', '2022-11-06 14:32:21.921-05', 1);
INSERT INTO public.students_courses VALUES (230, 310, 22, '2022-11-06 14:32:21.921-05', '2022-11-06 14:32:21.921-05', 3);
INSERT INTO public.students_courses VALUES (231, 301, 10, '2022-11-06 14:32:21.921-05', '2022-11-06 14:32:21.921-05', 3);
INSERT INTO public.students_courses VALUES (232, 412, 48, '2022-11-06 14:32:21.921-05', '2022-11-06 14:32:21.921-05', 1);
INSERT INTO public.students_courses VALUES (233, 236, 9, '2022-11-06 14:32:21.922-05', '2022-11-06 14:32:21.922-05', 1);
INSERT INTO public.students_courses VALUES (234, 101, 49, '2022-11-06 14:32:21.921-05', '2022-11-06 14:32:21.921-05', 1);
INSERT INTO public.students_courses VALUES (235, 155, 33, '2022-11-06 14:32:21.922-05', '2022-11-06 14:32:21.922-05', 1);
INSERT INTO public.students_courses VALUES (236, 24, 19, '2022-11-06 14:32:21.922-05', '2022-11-06 14:32:21.922-05', 3);
INSERT INTO public.students_courses VALUES (237, 108, 10, '2022-11-06 14:32:21.922-05', '2022-11-06 14:32:21.922-05', 0);
INSERT INTO public.students_courses VALUES (238, 486, 20, '2022-11-06 14:32:21.922-05', '2022-11-06 14:32:21.922-05', 3);
INSERT INTO public.students_courses VALUES (239, 121, 39, '2022-11-06 14:32:21.922-05', '2022-11-06 14:32:21.922-05', 3);
INSERT INTO public.students_courses VALUES (240, 466, 20, '2022-11-06 14:32:21.923-05', '2022-11-06 14:32:21.923-05', 1);
INSERT INTO public.students_courses VALUES (241, 21, 34, '2022-11-06 14:32:21.923-05', '2022-11-06 14:32:21.923-05', 4);
INSERT INTO public.students_courses VALUES (242, 49, 29, '2022-11-06 14:32:21.924-05', '2022-11-06 14:32:21.924-05', 2);
INSERT INTO public.students_courses VALUES (243, 442, 31, '2022-11-06 14:32:21.924-05', '2022-11-06 14:32:21.924-05', 3);
INSERT INTO public.students_courses VALUES (244, 359, 31, '2022-11-06 14:32:21.924-05', '2022-11-06 14:32:21.924-05', 0);
INSERT INTO public.students_courses VALUES (245, 420, 16, '2022-11-06 14:32:21.925-05', '2022-11-06 14:32:21.925-05', 2);
INSERT INTO public.students_courses VALUES (246, 193, 11, '2022-11-06 14:32:21.925-05', '2022-11-06 14:32:21.925-05', 4);
INSERT INTO public.students_courses VALUES (247, 195, 25, '2022-11-06 14:32:21.925-05', '2022-11-06 14:32:21.925-05', 3);
INSERT INTO public.students_courses VALUES (248, 377, 2, '2022-11-06 14:32:21.926-05', '2022-11-06 14:32:21.926-05', 3);
INSERT INTO public.students_courses VALUES (249, 41, 33, '2022-11-06 14:32:21.926-05', '2022-11-06 14:32:21.926-05', 2);
INSERT INTO public.students_courses VALUES (250, 161, 17, '2022-11-06 14:32:21.927-05', '2022-11-06 14:32:21.927-05', 1);
INSERT INTO public.students_courses VALUES (251, 127, 25, '2022-11-06 14:32:21.926-05', '2022-11-06 14:32:21.926-05', 1);
INSERT INTO public.students_courses VALUES (252, 423, 20, '2022-11-06 14:32:21.926-05', '2022-11-06 14:32:21.926-05', 2);
INSERT INTO public.students_courses VALUES (253, 258, 6, '2022-11-06 14:32:21.927-05', '2022-11-06 14:32:21.927-05', 4);
INSERT INTO public.students_courses VALUES (254, 430, 3, '2022-11-06 14:32:21.928-05', '2022-11-06 14:32:21.928-05', 0);
INSERT INTO public.students_courses VALUES (255, 18, 17, '2022-11-06 14:32:21.927-05', '2022-11-06 14:32:21.927-05', 3);
INSERT INTO public.students_courses VALUES (256, 408, 16, '2022-11-06 14:32:21.928-05', '2022-11-06 14:32:21.928-05', 1);
INSERT INTO public.students_courses VALUES (257, 218, 22, '2022-11-06 14:32:21.928-05', '2022-11-06 14:32:21.928-05', 2);
INSERT INTO public.students_courses VALUES (258, 236, 30, '2022-11-06 14:32:21.928-05', '2022-11-06 14:32:21.928-05', 0);
INSERT INTO public.students_courses VALUES (259, 128, 23, '2022-11-06 14:32:21.928-05', '2022-11-06 14:32:21.928-05', 3);
INSERT INTO public.students_courses VALUES (260, 66, 30, '2022-11-06 14:32:21.929-05', '2022-11-06 14:32:21.929-05', 2);
INSERT INTO public.students_courses VALUES (261, 233, 29, '2022-11-06 14:32:21.929-05', '2022-11-06 14:32:21.929-05', 2);
INSERT INTO public.students_courses VALUES (262, 109, 48, '2022-11-06 14:32:21.929-05', '2022-11-06 14:32:21.929-05', 0);
INSERT INTO public.students_courses VALUES (263, 261, 31, '2022-11-06 14:32:21.929-05', '2022-11-06 14:32:21.929-05', 2);
INSERT INTO public.students_courses VALUES (264, 224, 43, '2022-11-06 14:32:21.929-05', '2022-11-06 14:32:21.929-05', 1);
INSERT INTO public.students_courses VALUES (265, 157, 42, '2022-11-06 14:32:21.929-05', '2022-11-06 14:32:21.929-05', 1);
INSERT INTO public.students_courses VALUES (266, 156, 19, '2022-11-06 14:32:21.93-05', '2022-11-06 14:32:21.93-05', 2);
INSERT INTO public.students_courses VALUES (267, 359, 28, '2022-11-06 14:32:21.93-05', '2022-11-06 14:32:21.93-05', 2);
INSERT INTO public.students_courses VALUES (268, 75, 28, '2022-11-06 14:32:21.93-05', '2022-11-06 14:32:21.93-05', 3);
INSERT INTO public.students_courses VALUES (269, 164, 37, '2022-11-06 14:32:21.93-05', '2022-11-06 14:32:21.93-05', 1);
INSERT INTO public.students_courses VALUES (270, 481, 9, '2022-11-06 14:32:21.93-05', '2022-11-06 14:32:21.93-05', 1);
INSERT INTO public.students_courses VALUES (271, 264, 35, '2022-11-06 14:32:21.931-05', '2022-11-06 14:32:21.931-05', 3);
INSERT INTO public.students_courses VALUES (272, 30, 46, '2022-11-06 14:32:21.93-05', '2022-11-06 14:32:21.93-05', 2);
INSERT INTO public.students_courses VALUES (273, 500, 3, '2022-11-06 14:32:21.931-05', '2022-11-06 14:32:21.931-05', 1);
INSERT INTO public.students_courses VALUES (274, 257, 21, '2022-11-06 14:32:21.931-05', '2022-11-06 14:32:21.931-05', 2);
INSERT INTO public.students_courses VALUES (275, 457, 10, '2022-11-06 14:32:21.931-05', '2022-11-06 14:32:21.931-05', 2);
INSERT INTO public.students_courses VALUES (276, 60, 45, '2022-11-06 14:32:21.931-05', '2022-11-06 14:32:21.931-05', 1);
INSERT INTO public.students_courses VALUES (277, 421, 9, '2022-11-06 14:32:21.931-05', '2022-11-06 14:32:21.931-05', 3);
INSERT INTO public.students_courses VALUES (278, 461, 9, '2022-11-06 14:32:21.932-05', '2022-11-06 14:32:21.932-05', 2);
INSERT INTO public.students_courses VALUES (279, 82, 36, '2022-11-06 14:32:21.932-05', '2022-11-06 14:32:21.932-05', 2);
INSERT INTO public.students_courses VALUES (280, 242, 31, '2022-11-06 14:32:21.931-05', '2022-11-06 14:32:21.931-05', 2);
INSERT INTO public.students_courses VALUES (281, 228, 50, '2022-11-06 14:32:21.932-05', '2022-11-06 14:32:21.932-05', 3);
INSERT INTO public.students_courses VALUES (282, 482, 5, '2022-11-06 14:32:21.932-05', '2022-11-06 14:32:21.932-05', 3);
INSERT INTO public.students_courses VALUES (283, 313, 35, '2022-11-06 14:32:21.932-05', '2022-11-06 14:32:21.932-05', 0);
INSERT INTO public.students_courses VALUES (284, 52, 32, '2022-11-06 14:32:21.932-05', '2022-11-06 14:32:21.932-05', 1);
INSERT INTO public.students_courses VALUES (285, 384, 3, '2022-11-06 14:32:21.932-05', '2022-11-06 14:32:21.932-05', 2);
INSERT INTO public.students_courses VALUES (286, 415, 33, '2022-11-06 14:32:21.933-05', '2022-11-06 14:32:21.933-05', 4);
INSERT INTO public.students_courses VALUES (287, 500, 46, '2022-11-06 14:32:21.933-05', '2022-11-06 14:32:21.933-05', 1);
INSERT INTO public.students_courses VALUES (288, 39, 25, '2022-11-06 14:32:21.933-05', '2022-11-06 14:32:21.933-05', 2);
INSERT INTO public.students_courses VALUES (289, 285, 10, '2022-11-06 14:32:21.933-05', '2022-11-06 14:32:21.933-05', 1);
INSERT INTO public.students_courses VALUES (290, 62, 22, '2022-11-06 14:32:21.934-05', '2022-11-06 14:32:21.934-05', 1);
INSERT INTO public.students_courses VALUES (291, 334, 43, '2022-11-06 14:32:21.933-05', '2022-11-06 14:32:21.933-05', 4);
INSERT INTO public.students_courses VALUES (292, 181, 20, '2022-11-06 14:32:21.934-05', '2022-11-06 14:32:21.934-05', 1);
INSERT INTO public.students_courses VALUES (293, 423, 8, '2022-11-06 14:32:21.933-05', '2022-11-06 14:32:21.933-05', 2);
INSERT INTO public.students_courses VALUES (294, 483, 4, '2022-11-06 14:32:21.934-05', '2022-11-06 14:32:21.934-05', 2);
INSERT INTO public.students_courses VALUES (295, 241, 1, '2022-11-06 14:32:21.934-05', '2022-11-06 14:32:21.934-05', 3);
INSERT INTO public.students_courses VALUES (296, 204, 34, '2022-11-06 14:32:21.934-05', '2022-11-06 14:32:21.934-05', 3);
INSERT INTO public.students_courses VALUES (297, 318, 38, '2022-11-06 14:32:21.934-05', '2022-11-06 14:32:21.934-05', 0);
INSERT INTO public.students_courses VALUES (298, 180, 3, '2022-11-06 14:32:21.935-05', '2022-11-06 14:32:21.935-05', 2);
INSERT INTO public.students_courses VALUES (299, 376, 30, '2022-11-06 14:32:21.935-05', '2022-11-06 14:32:21.935-05', 1);
INSERT INTO public.students_courses VALUES (300, 486, 33, '2022-11-06 14:32:21.935-05', '2022-11-06 14:32:21.935-05', 1);
INSERT INTO public.students_courses VALUES (301, 80, 43, '2022-11-06 14:32:21.935-05', '2022-11-06 14:32:21.935-05', 3);
INSERT INTO public.students_courses VALUES (302, 75, 29, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 0);
INSERT INTO public.students_courses VALUES (303, 13, 1, '2022-11-06 14:32:21.935-05', '2022-11-06 14:32:21.935-05', 1);
INSERT INTO public.students_courses VALUES (304, 217, 30, '2022-11-06 14:32:21.935-05', '2022-11-06 14:32:21.935-05', 2);
INSERT INTO public.students_courses VALUES (305, 478, 6, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 0);
INSERT INTO public.students_courses VALUES (306, 438, 21, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 2);
INSERT INTO public.students_courses VALUES (307, 382, 17, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 2);
INSERT INTO public.students_courses VALUES (308, 465, 17, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 4);
INSERT INTO public.students_courses VALUES (309, 61, 41, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 3);
INSERT INTO public.students_courses VALUES (310, 232, 16, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 1);
INSERT INTO public.students_courses VALUES (311, 373, 44, '2022-11-06 14:32:21.936-05', '2022-11-06 14:32:21.936-05', 1);
INSERT INTO public.students_courses VALUES (312, 399, 18, '2022-11-06 14:32:21.937-05', '2022-11-06 14:32:21.937-05', 4);
INSERT INTO public.students_courses VALUES (313, 390, 5, '2022-11-06 14:32:21.937-05', '2022-11-06 14:32:21.937-05', 1);
INSERT INTO public.students_courses VALUES (314, 221, 25, '2022-11-06 14:32:21.937-05', '2022-11-06 14:32:21.937-05', 1);
INSERT INTO public.students_courses VALUES (315, 472, 43, '2022-11-06 14:32:21.937-05', '2022-11-06 14:32:21.937-05', 2);
INSERT INTO public.students_courses VALUES (316, 492, 49, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 0);
INSERT INTO public.students_courses VALUES (317, 418, 18, '2022-11-06 14:32:21.937-05', '2022-11-06 14:32:21.937-05', 1);
INSERT INTO public.students_courses VALUES (318, 99, 44, '2022-11-06 14:32:21.937-05', '2022-11-06 14:32:21.937-05', 2);
INSERT INTO public.students_courses VALUES (319, 148, 46, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 1);
INSERT INTO public.students_courses VALUES (320, 324, 3, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 1);
INSERT INTO public.students_courses VALUES (321, 357, 11, '2022-11-06 14:32:21.937-05', '2022-11-06 14:32:21.937-05', 1);
INSERT INTO public.students_courses VALUES (322, 449, 13, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 2);
INSERT INTO public.students_courses VALUES (323, 6, 1, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 3);
INSERT INTO public.students_courses VALUES (324, 292, 6, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 3);
INSERT INTO public.students_courses VALUES (325, 224, 19, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 2);
INSERT INTO public.students_courses VALUES (326, 170, 5, '2022-11-06 14:32:21.938-05', '2022-11-06 14:32:21.938-05', 1);
INSERT INTO public.students_courses VALUES (327, 304, 17, '2022-11-06 14:32:21.939-05', '2022-11-06 14:32:21.939-05', 1);
INSERT INTO public.students_courses VALUES (328, 467, 13, '2022-11-06 14:32:21.94-05', '2022-11-06 14:32:21.94-05', 2);
INSERT INTO public.students_courses VALUES (329, 390, 14, '2022-11-06 14:32:21.939-05', '2022-11-06 14:32:21.939-05', 4);
INSERT INTO public.students_courses VALUES (330, 209, 5, '2022-11-06 14:32:21.939-05', '2022-11-06 14:32:21.939-05', 0);
INSERT INTO public.students_courses VALUES (331, 166, 49, '2022-11-06 14:32:21.939-05', '2022-11-06 14:32:21.939-05', 1);
INSERT INTO public.students_courses VALUES (332, 271, 25, '2022-11-06 14:32:21.94-05', '2022-11-06 14:32:21.94-05', 1);
INSERT INTO public.students_courses VALUES (333, 356, 47, '2022-11-06 14:32:21.939-05', '2022-11-06 14:32:21.939-05', 4);
INSERT INTO public.students_courses VALUES (334, 227, 26, '2022-11-06 14:32:21.94-05', '2022-11-06 14:32:21.94-05', 0);
INSERT INTO public.students_courses VALUES (335, 352, 20, '2022-11-06 14:32:21.94-05', '2022-11-06 14:32:21.94-05', 4);
INSERT INTO public.students_courses VALUES (336, 86, 39, '2022-11-06 14:32:21.941-05', '2022-11-06 14:32:21.941-05', 2);
INSERT INTO public.students_courses VALUES (337, 410, 9, '2022-11-06 14:32:21.941-05', '2022-11-06 14:32:21.941-05', 0);
INSERT INTO public.students_courses VALUES (338, 287, 33, '2022-11-06 14:32:21.941-05', '2022-11-06 14:32:21.941-05', 0);
INSERT INTO public.students_courses VALUES (339, 72, 29, '2022-11-06 14:32:21.942-05', '2022-11-06 14:32:21.942-05', 4);
INSERT INTO public.students_courses VALUES (340, 379, 29, '2022-11-06 14:32:21.943-05', '2022-11-06 14:32:21.943-05', 0);
INSERT INTO public.students_courses VALUES (341, 211, 46, '2022-11-06 14:32:21.941-05', '2022-11-06 14:32:21.941-05', 3);
INSERT INTO public.students_courses VALUES (342, 241, 26, '2022-11-06 14:32:21.943-05', '2022-11-06 14:32:21.943-05', 1);
INSERT INTO public.students_courses VALUES (343, 60, 48, '2022-11-06 14:32:21.943-05', '2022-11-06 14:32:21.943-05', 3);
INSERT INTO public.students_courses VALUES (344, 353, 5, '2022-11-06 14:32:21.942-05', '2022-11-06 14:32:21.942-05', 1);
INSERT INTO public.students_courses VALUES (345, 434, 23, '2022-11-06 14:32:21.942-05', '2022-11-06 14:32:21.942-05', 0);
INSERT INTO public.students_courses VALUES (346, 424, 4, '2022-11-06 14:32:21.944-05', '2022-11-06 14:32:21.944-05', 0);
INSERT INTO public.students_courses VALUES (347, 178, 4, '2022-11-06 14:32:21.943-05', '2022-11-06 14:32:21.943-05', 4);
INSERT INTO public.students_courses VALUES (348, 499, 19, '2022-11-06 14:32:21.943-05', '2022-11-06 14:32:21.943-05', 2);
INSERT INTO public.students_courses VALUES (349, 353, 24, '2022-11-06 14:32:21.944-05', '2022-11-06 14:32:21.944-05', 1);
INSERT INTO public.students_courses VALUES (350, 280, 1, '2022-11-06 14:32:21.945-05', '2022-11-06 14:32:21.945-05', 4);
INSERT INTO public.students_courses VALUES (351, 412, 49, '2022-11-06 14:32:21.945-05', '2022-11-06 14:32:21.945-05', 1);
INSERT INTO public.students_courses VALUES (352, 424, 39, '2022-11-06 14:32:21.945-05', '2022-11-06 14:32:21.945-05', 0);
INSERT INTO public.students_courses VALUES (353, 145, 24, '2022-11-06 14:32:21.946-05', '2022-11-06 14:32:21.946-05', 0);
INSERT INTO public.students_courses VALUES (354, 257, 31, '2022-11-06 14:32:21.945-05', '2022-11-06 14:32:21.945-05', 2);
INSERT INTO public.students_courses VALUES (355, 474, 36, '2022-11-06 14:32:21.944-05', '2022-11-06 14:32:21.944-05', 3);
INSERT INTO public.students_courses VALUES (356, 465, 40, '2022-11-06 14:32:21.946-05', '2022-11-06 14:32:21.946-05', 0);
INSERT INTO public.students_courses VALUES (357, 210, 25, '2022-11-06 14:32:21.946-05', '2022-11-06 14:32:21.946-05', 2);
INSERT INTO public.students_courses VALUES (358, 51, 4, '2022-11-06 14:32:21.945-05', '2022-11-06 14:32:21.945-05', 0);
INSERT INTO public.students_courses VALUES (359, 171, 44, '2022-11-06 14:32:21.946-05', '2022-11-06 14:32:21.946-05', 3);
INSERT INTO public.students_courses VALUES (360, 496, 17, '2022-11-06 14:32:21.946-05', '2022-11-06 14:32:21.946-05', 3);
INSERT INTO public.students_courses VALUES (361, 204, 13, '2022-11-06 14:32:21.946-05', '2022-11-06 14:32:21.946-05', 4);
INSERT INTO public.students_courses VALUES (362, 66, 11, '2022-11-06 14:32:21.946-05', '2022-11-06 14:32:21.946-05', 2);
INSERT INTO public.students_courses VALUES (363, 28, 1, '2022-11-06 14:32:21.947-05', '2022-11-06 14:32:21.947-05', 3);
INSERT INTO public.students_courses VALUES (364, 242, 41, '2022-11-06 14:32:21.947-05', '2022-11-06 14:32:21.947-05', 3);
INSERT INTO public.students_courses VALUES (365, 285, 5, '2022-11-06 14:32:21.948-05', '2022-11-06 14:32:21.948-05', 2);
INSERT INTO public.students_courses VALUES (366, 238, 2, '2022-11-06 14:32:21.948-05', '2022-11-06 14:32:21.948-05', 4);
INSERT INTO public.students_courses VALUES (367, 159, 29, '2022-11-06 14:32:21.948-05', '2022-11-06 14:32:21.948-05', 1);
INSERT INTO public.students_courses VALUES (368, 202, 47, '2022-11-06 14:32:21.948-05', '2022-11-06 14:32:21.948-05', 2);
INSERT INTO public.students_courses VALUES (369, 309, 28, '2022-11-06 14:32:21.949-05', '2022-11-06 14:32:21.949-05', 0);
INSERT INTO public.students_courses VALUES (370, 337, 19, '2022-11-06 14:32:21.948-05', '2022-11-06 14:32:21.948-05', 4);
INSERT INTO public.students_courses VALUES (371, 344, 48, '2022-11-06 14:32:21.948-05', '2022-11-06 14:32:21.948-05', 3);
INSERT INTO public.students_courses VALUES (372, 330, 26, '2022-11-06 14:32:21.948-05', '2022-11-06 14:32:21.948-05', 0);
INSERT INTO public.students_courses VALUES (373, 86, 17, '2022-11-06 14:32:21.949-05', '2022-11-06 14:32:21.949-05', 4);
INSERT INTO public.students_courses VALUES (374, 280, 39, '2022-11-06 14:32:21.949-05', '2022-11-06 14:32:21.949-05', 1);
INSERT INTO public.students_courses VALUES (375, 271, 46, '2022-11-06 14:32:21.949-05', '2022-11-06 14:32:21.949-05', 0);
INSERT INTO public.students_courses VALUES (376, 112, 27, '2022-11-06 14:32:21.949-05', '2022-11-06 14:32:21.949-05', 2);
INSERT INTO public.students_courses VALUES (377, 281, 19, '2022-11-06 14:32:21.949-05', '2022-11-06 14:32:21.949-05', 0);
INSERT INTO public.students_courses VALUES (378, 180, 50, '2022-11-06 14:32:21.95-05', '2022-11-06 14:32:21.95-05', 4);
INSERT INTO public.students_courses VALUES (379, 189, 39, '2022-11-06 14:32:21.949-05', '2022-11-06 14:32:21.949-05', 3);
INSERT INTO public.students_courses VALUES (380, 272, 31, '2022-11-06 14:32:21.95-05', '2022-11-06 14:32:21.95-05', 0);
INSERT INTO public.students_courses VALUES (381, 123, 27, '2022-11-06 14:32:21.95-05', '2022-11-06 14:32:21.95-05', 3);
INSERT INTO public.students_courses VALUES (382, 475, 22, '2022-11-06 14:32:21.95-05', '2022-11-06 14:32:21.95-05', 1);
INSERT INTO public.students_courses VALUES (383, 274, 41, '2022-11-06 14:32:21.951-05', '2022-11-06 14:32:21.951-05', 0);
INSERT INTO public.students_courses VALUES (384, 19, 14, '2022-11-06 14:32:21.95-05', '2022-11-06 14:32:21.95-05', 0);
INSERT INTO public.students_courses VALUES (385, 259, 37, '2022-11-06 14:32:21.951-05', '2022-11-06 14:32:21.951-05', 4);
INSERT INTO public.students_courses VALUES (386, 132, 28, '2022-11-06 14:32:21.95-05', '2022-11-06 14:32:21.95-05', 2);
INSERT INTO public.students_courses VALUES (387, 334, 29, '2022-11-06 14:32:21.951-05', '2022-11-06 14:32:21.951-05', 0);
INSERT INTO public.students_courses VALUES (388, 267, 7, '2022-11-06 14:32:21.951-05', '2022-11-06 14:32:21.951-05', 1);
INSERT INTO public.students_courses VALUES (389, 391, 4, '2022-11-06 14:32:21.951-05', '2022-11-06 14:32:21.951-05', 4);
INSERT INTO public.students_courses VALUES (390, 85, 8, '2022-11-06 14:32:21.951-05', '2022-11-06 14:32:21.951-05', 2);
INSERT INTO public.students_courses VALUES (391, 372, 41, '2022-11-06 14:32:21.952-05', '2022-11-06 14:32:21.952-05', 2);
INSERT INTO public.students_courses VALUES (392, 383, 19, '2022-11-06 14:32:21.951-05', '2022-11-06 14:32:21.951-05', 1);
INSERT INTO public.students_courses VALUES (393, 242, 13, '2022-11-06 14:32:21.952-05', '2022-11-06 14:32:21.952-05', 1);
INSERT INTO public.students_courses VALUES (394, 200, 39, '2022-11-06 14:32:21.952-05', '2022-11-06 14:32:21.952-05', 2);
INSERT INTO public.students_courses VALUES (395, 174, 35, '2022-11-06 14:32:21.952-05', '2022-11-06 14:32:21.952-05', 2);
INSERT INTO public.students_courses VALUES (396, 110, 2, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 2);
INSERT INTO public.students_courses VALUES (397, 478, 3, '2022-11-06 14:32:21.952-05', '2022-11-06 14:32:21.952-05', 0);
INSERT INTO public.students_courses VALUES (398, 322, 46, '2022-11-06 14:32:21.952-05', '2022-11-06 14:32:21.952-05', 1);
INSERT INTO public.students_courses VALUES (399, 329, 37, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 1);
INSERT INTO public.students_courses VALUES (400, 58, 50, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 3);
INSERT INTO public.students_courses VALUES (401, 212, 18, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 1);
INSERT INTO public.students_courses VALUES (402, 404, 42, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 3);
INSERT INTO public.students_courses VALUES (403, 242, 43, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 3);
INSERT INTO public.students_courses VALUES (404, 183, 36, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 4);
INSERT INTO public.students_courses VALUES (405, 447, 35, '2022-11-06 14:32:21.953-05', '2022-11-06 14:32:21.953-05', 1);
INSERT INTO public.students_courses VALUES (406, 293, 5, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 3);
INSERT INTO public.students_courses VALUES (407, 122, 25, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 2);
INSERT INTO public.students_courses VALUES (408, 286, 35, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 0);
INSERT INTO public.students_courses VALUES (409, 139, 33, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 0);
INSERT INTO public.students_courses VALUES (410, 288, 43, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 1);
INSERT INTO public.students_courses VALUES (411, 168, 44, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 3);
INSERT INTO public.students_courses VALUES (412, 325, 20, '2022-11-06 14:32:21.955-05', '2022-11-06 14:32:21.955-05', 0);
INSERT INTO public.students_courses VALUES (413, 141, 5, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 3);
INSERT INTO public.students_courses VALUES (414, 303, 42, '2022-11-06 14:32:21.955-05', '2022-11-06 14:32:21.955-05', 3);
INSERT INTO public.students_courses VALUES (415, 424, 48, '2022-11-06 14:32:21.955-05', '2022-11-06 14:32:21.955-05', 1);
INSERT INTO public.students_courses VALUES (416, 468, 35, '2022-11-06 14:32:21.954-05', '2022-11-06 14:32:21.954-05', 3);
INSERT INTO public.students_courses VALUES (417, 407, 14, '2022-11-06 14:32:21.955-05', '2022-11-06 14:32:21.955-05', 2);
INSERT INTO public.students_courses VALUES (418, 6, 40, '2022-11-06 14:32:21.955-05', '2022-11-06 14:32:21.955-05', 3);
INSERT INTO public.students_courses VALUES (419, 341, 50, '2022-11-06 14:32:21.955-05', '2022-11-06 14:32:21.955-05', 3);
INSERT INTO public.students_courses VALUES (420, 255, 27, '2022-11-06 14:32:21.956-05', '2022-11-06 14:32:21.956-05', 1);
INSERT INTO public.students_courses VALUES (421, 48, 47, '2022-11-06 14:32:21.955-05', '2022-11-06 14:32:21.955-05', 3);
INSERT INTO public.students_courses VALUES (422, 268, 6, '2022-11-06 14:32:21.956-05', '2022-11-06 14:32:21.956-05', 2);
INSERT INTO public.students_courses VALUES (423, 238, 36, '2022-11-06 14:32:21.956-05', '2022-11-06 14:32:21.956-05', 2);
INSERT INTO public.students_courses VALUES (424, 308, 45, '2022-11-06 14:32:21.956-05', '2022-11-06 14:32:21.956-05', 2);
INSERT INTO public.students_courses VALUES (425, 62, 12, '2022-11-06 14:32:21.958-05', '2022-11-06 14:32:21.958-05', 4);
INSERT INTO public.students_courses VALUES (426, 124, 36, '2022-11-06 14:32:21.962-05', '2022-11-06 14:32:21.962-05', 1);
INSERT INTO public.students_courses VALUES (427, 58, 28, '2022-11-06 14:32:21.956-05', '2022-11-06 14:32:21.956-05', 3);
INSERT INTO public.students_courses VALUES (428, 48, 24, '2022-11-06 14:32:21.962-05', '2022-11-06 14:32:21.962-05', 3);
INSERT INTO public.students_courses VALUES (429, 351, 25, '2022-11-06 14:32:21.962-05', '2022-11-06 14:32:21.962-05', 3);
INSERT INTO public.students_courses VALUES (430, 477, 40, '2022-11-06 14:32:21.959-05', '2022-11-06 14:32:21.959-05', 1);
INSERT INTO public.students_courses VALUES (431, 36, 20, '2022-11-06 14:32:21.963-05', '2022-11-06 14:32:21.963-05', 4);
INSERT INTO public.students_courses VALUES (432, 441, 48, '2022-11-06 14:32:21.963-05', '2022-11-06 14:32:21.963-05', 1);
INSERT INTO public.students_courses VALUES (433, 406, 8, '2022-11-06 14:32:21.962-05', '2022-11-06 14:32:21.962-05', 2);
INSERT INTO public.students_courses VALUES (434, 134, 19, '2022-11-06 14:32:21.963-05', '2022-11-06 14:32:21.963-05', 0);
INSERT INTO public.students_courses VALUES (435, 51, 24, '2022-11-06 14:32:21.963-05', '2022-11-06 14:32:21.963-05', 2);
INSERT INTO public.students_courses VALUES (436, 341, 2, '2022-11-06 14:32:21.963-05', '2022-11-06 14:32:21.963-05', 2);
INSERT INTO public.students_courses VALUES (437, 441, 19, '2022-11-06 14:32:21.964-05', '2022-11-06 14:32:21.964-05', 2);
INSERT INTO public.students_courses VALUES (438, 109, 21, '2022-11-06 14:32:21.963-05', '2022-11-06 14:32:21.963-05', 3);
INSERT INTO public.students_courses VALUES (439, 361, 7, '2022-11-06 14:32:21.963-05', '2022-11-06 14:32:21.963-05', 4);
INSERT INTO public.students_courses VALUES (440, 5, 8, '2022-11-06 14:32:21.964-05', '2022-11-06 14:32:21.964-05', 3);
INSERT INTO public.students_courses VALUES (441, 19, 43, '2022-11-06 14:32:21.964-05', '2022-11-06 14:32:21.964-05', 1);
INSERT INTO public.students_courses VALUES (442, 249, 38, '2022-11-06 14:32:21.964-05', '2022-11-06 14:32:21.964-05', 2);
INSERT INTO public.students_courses VALUES (443, 211, 39, '2022-11-06 14:32:21.964-05', '2022-11-06 14:32:21.964-05', 3);
INSERT INTO public.students_courses VALUES (444, 101, 15, '2022-11-06 14:32:21.964-05', '2022-11-06 14:32:21.964-05', 3);
INSERT INTO public.students_courses VALUES (445, 84, 37, '2022-11-06 14:32:21.964-05', '2022-11-06 14:32:21.964-05', 1);
INSERT INTO public.students_courses VALUES (446, 358, 1, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 3);
INSERT INTO public.students_courses VALUES (447, 481, 11, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 2);
INSERT INTO public.students_courses VALUES (448, 90, 24, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 2);
INSERT INTO public.students_courses VALUES (449, 36, 36, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 3);
INSERT INTO public.students_courses VALUES (450, 24, 43, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 4);
INSERT INTO public.students_courses VALUES (451, 485, 33, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 2);
INSERT INTO public.students_courses VALUES (452, 260, 27, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 1);
INSERT INTO public.students_courses VALUES (453, 10, 45, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 2);
INSERT INTO public.students_courses VALUES (454, 374, 22, '2022-11-06 14:32:21.965-05', '2022-11-06 14:32:21.965-05', 2);
INSERT INTO public.students_courses VALUES (455, 92, 39, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 1);
INSERT INTO public.students_courses VALUES (456, 131, 26, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 0);
INSERT INTO public.students_courses VALUES (457, 253, 37, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 0);
INSERT INTO public.students_courses VALUES (458, 185, 18, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 3);
INSERT INTO public.students_courses VALUES (459, 439, 49, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 4);
INSERT INTO public.students_courses VALUES (460, 294, 20, '2022-11-06 14:32:21.967-05', '2022-11-06 14:32:21.967-05', 0);
INSERT INTO public.students_courses VALUES (461, 84, 30, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 3);
INSERT INTO public.students_courses VALUES (462, 233, 45, '2022-11-06 14:32:21.966-05', '2022-11-06 14:32:21.966-05', 1);
INSERT INTO public.students_courses VALUES (463, 197, 14, '2022-11-06 14:32:21.968-05', '2022-11-06 14:32:21.968-05', 1);
INSERT INTO public.students_courses VALUES (464, 333, 20, '2022-11-06 14:32:21.967-05', '2022-11-06 14:32:21.967-05', 4);
INSERT INTO public.students_courses VALUES (465, 450, 8, '2022-11-06 14:32:21.967-05', '2022-11-06 14:32:21.967-05', 4);
INSERT INTO public.students_courses VALUES (466, 259, 22, '2022-11-06 14:32:21.967-05', '2022-11-06 14:32:21.967-05', 4);
INSERT INTO public.students_courses VALUES (467, 238, 15, '2022-11-06 14:32:21.968-05', '2022-11-06 14:32:21.968-05', 2);
INSERT INTO public.students_courses VALUES (468, 55, 38, '2022-11-06 14:32:21.968-05', '2022-11-06 14:32:21.968-05', 2);
INSERT INTO public.students_courses VALUES (469, 462, 17, '2022-11-06 14:32:21.968-05', '2022-11-06 14:32:21.968-05', 2);
INSERT INTO public.students_courses VALUES (470, 365, 32, '2022-11-06 14:32:21.968-05', '2022-11-06 14:32:21.968-05', 3);
INSERT INTO public.students_courses VALUES (471, 364, 35, '2022-11-06 14:32:21.969-05', '2022-11-06 14:32:21.969-05', 0);
INSERT INTO public.students_courses VALUES (472, 72, 48, '2022-11-06 14:32:21.97-05', '2022-11-06 14:32:21.97-05', 3);
INSERT INTO public.students_courses VALUES (473, 332, 40, '2022-11-06 14:32:21.97-05', '2022-11-06 14:32:21.97-05', 0);
INSERT INTO public.students_courses VALUES (474, 435, 21, '2022-11-06 14:32:21.97-05', '2022-11-06 14:32:21.97-05', 1);
INSERT INTO public.students_courses VALUES (475, 373, 24, '2022-11-06 14:32:21.97-05', '2022-11-06 14:32:21.97-05', 4);
INSERT INTO public.students_courses VALUES (476, 77, 12, '2022-11-06 14:32:21.97-05', '2022-11-06 14:32:21.97-05', 1);
INSERT INTO public.students_courses VALUES (477, 174, 21, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 1);
INSERT INTO public.students_courses VALUES (478, 438, 16, '2022-11-06 14:32:21.97-05', '2022-11-06 14:32:21.97-05', 2);
INSERT INTO public.students_courses VALUES (479, 334, 9, '2022-11-06 14:32:21.97-05', '2022-11-06 14:32:21.97-05', 1);
INSERT INTO public.students_courses VALUES (480, 207, 29, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 2);
INSERT INTO public.students_courses VALUES (481, 368, 24, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 1);
INSERT INTO public.students_courses VALUES (482, 288, 2, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 1);
INSERT INTO public.students_courses VALUES (483, 358, 23, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 0);
INSERT INTO public.students_courses VALUES (484, 403, 11, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 2);
INSERT INTO public.students_courses VALUES (485, 446, 25, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 1);
INSERT INTO public.students_courses VALUES (486, 24, 33, '2022-11-06 14:32:21.971-05', '2022-11-06 14:32:21.971-05', 3);
INSERT INTO public.students_courses VALUES (487, 237, 24, '2022-11-06 14:32:21.972-05', '2022-11-06 14:32:21.972-05', 4);
INSERT INTO public.students_courses VALUES (488, 33, 5, '2022-11-06 14:32:21.972-05', '2022-11-06 14:32:21.972-05', 0);
INSERT INTO public.students_courses VALUES (489, 189, 17, '2022-11-06 14:32:21.972-05', '2022-11-06 14:32:21.972-05', 3);
INSERT INTO public.students_courses VALUES (490, 266, 1, '2022-11-06 14:32:21.972-05', '2022-11-06 14:32:21.972-05', 2);
INSERT INTO public.students_courses VALUES (491, 120, 22, '2022-11-06 14:32:21.972-05', '2022-11-06 14:32:21.972-05', 2);
INSERT INTO public.students_courses VALUES (492, 162, 9, '2022-11-06 14:32:21.972-05', '2022-11-06 14:32:21.972-05', 2);
INSERT INTO public.students_courses VALUES (493, 241, 11, '2022-11-06 14:32:21.976-05', '2022-11-06 14:32:21.976-05', 3);
INSERT INTO public.students_courses VALUES (494, 331, 44, '2022-11-06 14:32:21.973-05', '2022-11-06 14:32:21.973-05', 1);
INSERT INTO public.students_courses VALUES (495, 315, 5, '2022-11-06 14:32:21.972-05', '2022-11-06 14:32:21.972-05', 3);
INSERT INTO public.students_courses VALUES (496, 130, 8, '2022-11-06 14:32:21.979-05', '2022-11-06 14:32:21.979-05', 2);
INSERT INTO public.students_courses VALUES (497, 171, 19, '2022-11-06 14:32:21.973-05', '2022-11-06 14:32:21.973-05', 3);
INSERT INTO public.students_courses VALUES (498, 30, 41, '2022-11-06 14:32:21.973-05', '2022-11-06 14:32:21.973-05', 1);
INSERT INTO public.students_courses VALUES (499, 145, 20, '2022-11-06 14:32:21.973-05', '2022-11-06 14:32:21.973-05', 1);
INSERT INTO public.students_courses VALUES (500, 191, 31, '2022-11-06 14:32:21.978-05', '2022-11-06 14:32:21.978-05', 3);
INSERT INTO public.students_courses VALUES (501, 126, 6, '2022-11-06 14:32:21.977-05', '2022-11-06 14:32:21.977-05', 1);
INSERT INTO public.students_courses VALUES (502, 97, 13, '2022-11-06 14:32:21.978-05', '2022-11-06 14:32:21.978-05', 4);
INSERT INTO public.students_courses VALUES (503, 348, 18, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 3);
INSERT INTO public.students_courses VALUES (504, 236, 3, '2022-11-06 14:32:21.979-05', '2022-11-06 14:32:21.979-05', 1);
INSERT INTO public.students_courses VALUES (505, 50, 48, '2022-11-06 14:32:21.979-05', '2022-11-06 14:32:21.979-05', 2);
INSERT INTO public.students_courses VALUES (506, 402, 27, '2022-11-06 14:32:21.979-05', '2022-11-06 14:32:21.979-05', 4);
INSERT INTO public.students_courses VALUES (507, 217, 7, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 2);
INSERT INTO public.students_courses VALUES (508, 152, 3, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 3);
INSERT INTO public.students_courses VALUES (509, 222, 50, '2022-11-06 14:32:21.979-05', '2022-11-06 14:32:21.979-05', 2);
INSERT INTO public.students_courses VALUES (510, 121, 3, '2022-11-06 14:32:21.979-05', '2022-11-06 14:32:21.979-05', 0);
INSERT INTO public.students_courses VALUES (511, 133, 27, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 1);
INSERT INTO public.students_courses VALUES (512, 182, 15, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 3);
INSERT INTO public.students_courses VALUES (513, 369, 12, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 1);
INSERT INTO public.students_courses VALUES (514, 134, 12, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 0);
INSERT INTO public.students_courses VALUES (515, 210, 47, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 2);
INSERT INTO public.students_courses VALUES (516, 209, 35, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 4);
INSERT INTO public.students_courses VALUES (517, 302, 13, '2022-11-06 14:32:21.98-05', '2022-11-06 14:32:21.98-05', 1);
INSERT INTO public.students_courses VALUES (518, 68, 14, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 2);
INSERT INTO public.students_courses VALUES (519, 316, 34, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 3);
INSERT INTO public.students_courses VALUES (520, 148, 38, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 1);
INSERT INTO public.students_courses VALUES (521, 204, 37, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 1);
INSERT INTO public.students_courses VALUES (522, 242, 39, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 2);
INSERT INTO public.students_courses VALUES (523, 337, 29, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 1);
INSERT INTO public.students_courses VALUES (524, 382, 16, '2022-11-06 14:32:21.981-05', '2022-11-06 14:32:21.981-05', 3);
INSERT INTO public.students_courses VALUES (525, 376, 6, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 4);
INSERT INTO public.students_courses VALUES (526, 61, 48, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 3);
INSERT INTO public.students_courses VALUES (527, 239, 12, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 0);
INSERT INTO public.students_courses VALUES (528, 47, 36, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 1);
INSERT INTO public.students_courses VALUES (529, 304, 41, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 1);
INSERT INTO public.students_courses VALUES (530, 176, 26, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 4);
INSERT INTO public.students_courses VALUES (531, 77, 41, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 2);
INSERT INTO public.students_courses VALUES (532, 341, 14, '2022-11-06 14:32:21.982-05', '2022-11-06 14:32:21.982-05', 2);
INSERT INTO public.students_courses VALUES (533, 256, 19, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 3);
INSERT INTO public.students_courses VALUES (534, 20, 44, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 4);
INSERT INTO public.students_courses VALUES (535, 294, 14, '2022-11-06 14:32:21.984-05', '2022-11-06 14:32:21.984-05', 1);
INSERT INTO public.students_courses VALUES (536, 81, 38, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 2);
INSERT INTO public.students_courses VALUES (537, 16, 43, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 0);
INSERT INTO public.students_courses VALUES (538, 498, 41, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 1);
INSERT INTO public.students_courses VALUES (539, 87, 17, '2022-11-06 14:32:21.984-05', '2022-11-06 14:32:21.984-05', 2);
INSERT INTO public.students_courses VALUES (540, 32, 40, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 0);
INSERT INTO public.students_courses VALUES (541, 407, 1, '2022-11-06 14:32:21.983-05', '2022-11-06 14:32:21.983-05', 1);
INSERT INTO public.students_courses VALUES (542, 481, 13, '2022-11-06 14:32:21.984-05', '2022-11-06 14:32:21.984-05', 1);
INSERT INTO public.students_courses VALUES (543, 40, 8, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 2);
INSERT INTO public.students_courses VALUES (544, 242, 32, '2022-11-06 14:32:21.984-05', '2022-11-06 14:32:21.984-05', 1);
INSERT INTO public.students_courses VALUES (545, 453, 5, '2022-11-06 14:32:21.984-05', '2022-11-06 14:32:21.984-05', 0);
INSERT INTO public.students_courses VALUES (546, 135, 22, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 1);
INSERT INTO public.students_courses VALUES (547, 156, 33, '2022-11-06 14:32:21.984-05', '2022-11-06 14:32:21.984-05', 3);
INSERT INTO public.students_courses VALUES (548, 401, 15, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 1);
INSERT INTO public.students_courses VALUES (549, 137, 47, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 2);
INSERT INTO public.students_courses VALUES (550, 439, 8, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 1);
INSERT INTO public.students_courses VALUES (551, 452, 13, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 3);
INSERT INTO public.students_courses VALUES (552, 432, 49, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 4);
INSERT INTO public.students_courses VALUES (553, 337, 49, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 1);
INSERT INTO public.students_courses VALUES (554, 199, 41, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 0);
INSERT INTO public.students_courses VALUES (555, 42, 30, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 1);
INSERT INTO public.students_courses VALUES (556, 433, 5, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 2);
INSERT INTO public.students_courses VALUES (557, 172, 50, '2022-11-06 14:32:21.985-05', '2022-11-06 14:32:21.985-05', 0);
INSERT INTO public.students_courses VALUES (558, 15, 41, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 3);
INSERT INTO public.students_courses VALUES (559, 81, 3, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 2);
INSERT INTO public.students_courses VALUES (560, 481, 29, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 1);
INSERT INTO public.students_courses VALUES (561, 136, 15, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 2);
INSERT INTO public.students_courses VALUES (562, 87, 47, '2022-11-06 14:32:21.986-05', '2022-11-06 14:32:21.986-05', 2);
INSERT INTO public.students_courses VALUES (563, 286, 44, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 1);
INSERT INTO public.students_courses VALUES (564, 283, 3, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 0);
INSERT INTO public.students_courses VALUES (565, 433, 13, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 3);
INSERT INTO public.students_courses VALUES (566, 497, 30, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 2);
INSERT INTO public.students_courses VALUES (567, 342, 45, '2022-11-06 14:32:21.988-05', '2022-11-06 14:32:21.988-05', 4);
INSERT INTO public.students_courses VALUES (568, 311, 28, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 1);
INSERT INTO public.students_courses VALUES (569, 149, 17, '2022-11-06 14:32:21.988-05', '2022-11-06 14:32:21.988-05', 3);
INSERT INTO public.students_courses VALUES (570, 97, 21, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 3);
INSERT INTO public.students_courses VALUES (571, 450, 45, '2022-11-06 14:32:21.987-05', '2022-11-06 14:32:21.987-05', 1);
INSERT INTO public.students_courses VALUES (572, 61, 39, '2022-11-06 14:32:21.991-05', '2022-11-06 14:32:21.991-05', 1);
INSERT INTO public.students_courses VALUES (573, 402, 43, '2022-11-06 14:32:21.988-05', '2022-11-06 14:32:21.988-05', 3);
INSERT INTO public.students_courses VALUES (574, 29, 22, '2022-11-06 14:32:21.988-05', '2022-11-06 14:32:21.988-05', 1);
INSERT INTO public.students_courses VALUES (575, 116, 39, '2022-11-06 14:32:21.99-05', '2022-11-06 14:32:21.99-05', 4);
INSERT INTO public.students_courses VALUES (576, 395, 12, '2022-11-06 14:32:21.992-05', '2022-11-06 14:32:21.992-05', 3);
INSERT INTO public.students_courses VALUES (577, 344, 18, '2022-11-06 14:32:21.988-05', '2022-11-06 14:32:21.988-05', 4);
INSERT INTO public.students_courses VALUES (578, 276, 32, '2022-11-06 14:32:21.988-05', '2022-11-06 14:32:21.988-05', 1);
INSERT INTO public.students_courses VALUES (579, 473, 18, '2022-11-06 14:32:21.992-05', '2022-11-06 14:32:21.992-05', 1);
INSERT INTO public.students_courses VALUES (580, 429, 43, '2022-11-06 14:32:21.992-05', '2022-11-06 14:32:21.992-05', 3);
INSERT INTO public.students_courses VALUES (581, 192, 15, '2022-11-06 14:32:21.993-05', '2022-11-06 14:32:21.993-05', 1);
INSERT INTO public.students_courses VALUES (582, 498, 43, '2022-11-06 14:32:21.993-05', '2022-11-06 14:32:21.993-05', 4);
INSERT INTO public.students_courses VALUES (583, 211, 14, '2022-11-06 14:32:21.992-05', '2022-11-06 14:32:21.992-05', 0);
INSERT INTO public.students_courses VALUES (584, 53, 39, '2022-11-06 14:32:21.994-05', '2022-11-06 14:32:21.994-05', 3);
INSERT INTO public.students_courses VALUES (585, 266, 6, '2022-11-06 14:32:21.993-05', '2022-11-06 14:32:21.993-05', 0);
INSERT INTO public.students_courses VALUES (586, 5, 2, '2022-11-06 14:32:21.993-05', '2022-11-06 14:32:21.993-05', 4);
INSERT INTO public.students_courses VALUES (587, 429, 40, '2022-11-06 14:32:21.994-05', '2022-11-06 14:32:21.994-05', 3);
INSERT INTO public.students_courses VALUES (588, 276, 22, '2022-11-06 14:32:21.995-05', '2022-11-06 14:32:21.995-05', 2);
INSERT INTO public.students_courses VALUES (589, 480, 7, '2022-11-06 14:32:21.994-05', '2022-11-06 14:32:21.994-05', 2);
INSERT INTO public.students_courses VALUES (590, 237, 50, '2022-11-06 14:32:21.995-05', '2022-11-06 14:32:21.995-05', 1);
INSERT INTO public.students_courses VALUES (591, 486, 31, '2022-11-06 14:32:21.994-05', '2022-11-06 14:32:21.994-05', 2);
INSERT INTO public.students_courses VALUES (592, 97, 40, '2022-11-06 14:32:21.994-05', '2022-11-06 14:32:21.994-05', 1);
INSERT INTO public.students_courses VALUES (593, 324, 25, '2022-11-06 14:32:21.995-05', '2022-11-06 14:32:21.995-05', 1);
INSERT INTO public.students_courses VALUES (594, 406, 10, '2022-11-06 14:32:21.995-05', '2022-11-06 14:32:21.995-05', 2);
INSERT INTO public.students_courses VALUES (595, 80, 49, '2022-11-06 14:32:21.995-05', '2022-11-06 14:32:21.995-05', 3);
INSERT INTO public.students_courses VALUES (596, 441, 26, '2022-11-06 14:32:21.996-05', '2022-11-06 14:32:21.996-05', 3);
INSERT INTO public.students_courses VALUES (597, 116, 23, '2022-11-06 14:32:21.996-05', '2022-11-06 14:32:21.996-05', 0);
INSERT INTO public.students_courses VALUES (598, 222, 44, '2022-11-06 14:32:21.995-05', '2022-11-06 14:32:21.995-05', 4);
INSERT INTO public.students_courses VALUES (599, 271, 18, '2022-11-06 14:32:21.996-05', '2022-11-06 14:32:21.996-05', 2);
INSERT INTO public.students_courses VALUES (600, 28, 31, '2022-11-06 14:32:21.996-05', '2022-11-06 14:32:21.996-05', 4);
INSERT INTO public.students_courses VALUES (601, 298, 10, '2022-11-06 14:32:21.996-05', '2022-11-06 14:32:21.996-05', 2);
INSERT INTO public.students_courses VALUES (602, 101, 17, '2022-11-06 14:32:21.997-05', '2022-11-06 14:32:21.997-05', 4);
INSERT INTO public.students_courses VALUES (603, 53, 15, '2022-11-06 14:32:21.997-05', '2022-11-06 14:32:21.997-05', 3);
INSERT INTO public.students_courses VALUES (604, 250, 39, '2022-11-06 14:32:21.997-05', '2022-11-06 14:32:21.997-05', 4);
INSERT INTO public.students_courses VALUES (605, 238, 11, '2022-11-06 14:32:21.997-05', '2022-11-06 14:32:21.997-05', 2);
INSERT INTO public.students_courses VALUES (606, 65, 11, '2022-11-06 14:32:21.997-05', '2022-11-06 14:32:21.997-05', 1);
INSERT INTO public.students_courses VALUES (607, 493, 11, '2022-11-06 14:32:21.997-05', '2022-11-06 14:32:21.997-05', 3);
INSERT INTO public.students_courses VALUES (608, 309, 50, '2022-11-06 14:32:21.998-05', '2022-11-06 14:32:21.998-05', 1);
INSERT INTO public.students_courses VALUES (609, 409, 21, '2022-11-06 14:32:21.998-05', '2022-11-06 14:32:21.998-05', 3);
INSERT INTO public.students_courses VALUES (610, 55, 29, '2022-11-06 14:32:21.997-05', '2022-11-06 14:32:21.997-05', 4);
INSERT INTO public.students_courses VALUES (611, 138, 20, '2022-11-06 14:32:21.998-05', '2022-11-06 14:32:21.998-05', 2);
INSERT INTO public.students_courses VALUES (612, 152, 33, '2022-11-06 14:32:21.998-05', '2022-11-06 14:32:21.998-05', 3);
INSERT INTO public.students_courses VALUES (613, 205, 16, '2022-11-06 14:32:21.998-05', '2022-11-06 14:32:21.998-05', 4);
INSERT INTO public.students_courses VALUES (614, 399, 7, '2022-11-06 14:32:21.998-05', '2022-11-06 14:32:21.998-05', 3);
INSERT INTO public.students_courses VALUES (615, 460, 16, '2022-11-06 14:32:21.998-05', '2022-11-06 14:32:21.998-05', 3);
INSERT INTO public.students_courses VALUES (616, 330, 35, '2022-11-06 14:32:21.999-05', '2022-11-06 14:32:21.999-05', 1);
INSERT INTO public.students_courses VALUES (617, 353, 30, '2022-11-06 14:32:21.999-05', '2022-11-06 14:32:21.999-05', 3);
INSERT INTO public.students_courses VALUES (618, 453, 49, '2022-11-06 14:32:21.999-05', '2022-11-06 14:32:21.999-05', 2);
INSERT INTO public.students_courses VALUES (619, 160, 40, '2022-11-06 14:32:22-05', '2022-11-06 14:32:22-05', 2);
INSERT INTO public.students_courses VALUES (620, 383, 23, '2022-11-06 14:32:21.999-05', '2022-11-06 14:32:21.999-05', 3);
INSERT INTO public.students_courses VALUES (621, 94, 18, '2022-11-06 14:32:21.999-05', '2022-11-06 14:32:21.999-05', 1);
INSERT INTO public.students_courses VALUES (622, 298, 25, '2022-11-06 14:32:21.999-05', '2022-11-06 14:32:21.999-05', 0);
INSERT INTO public.students_courses VALUES (623, 56, 40, '2022-11-06 14:32:21.999-05', '2022-11-06 14:32:21.999-05', 4);
INSERT INTO public.students_courses VALUES (624, 179, 1, '2022-11-06 14:32:22-05', '2022-11-06 14:32:22-05', 0);
INSERT INTO public.students_courses VALUES (625, 375, 5, '2022-11-06 14:32:22-05', '2022-11-06 14:32:22-05', 2);
INSERT INTO public.students_courses VALUES (626, 436, 11, '2022-11-06 14:32:22-05', '2022-11-06 14:32:22-05', 1);
INSERT INTO public.students_courses VALUES (627, 457, 35, '2022-11-06 14:32:22-05', '2022-11-06 14:32:22-05', 3);
INSERT INTO public.students_courses VALUES (628, 243, 15, '2022-11-06 14:32:22-05', '2022-11-06 14:32:22-05', 1);
INSERT INTO public.students_courses VALUES (629, 183, 28, '2022-11-06 14:32:22.001-05', '2022-11-06 14:32:22.001-05', 2);
INSERT INTO public.students_courses VALUES (630, 278, 8, '2022-11-06 14:32:22-05', '2022-11-06 14:32:22-05', 2);
INSERT INTO public.students_courses VALUES (631, 129, 29, '2022-11-06 14:32:22.001-05', '2022-11-06 14:32:22.001-05', 3);
INSERT INTO public.students_courses VALUES (632, 104, 20, '2022-11-06 14:32:22.001-05', '2022-11-06 14:32:22.001-05', 2);
INSERT INTO public.students_courses VALUES (633, 67, 15, '2022-11-06 14:32:22.001-05', '2022-11-06 14:32:22.001-05', 2);
INSERT INTO public.students_courses VALUES (634, 329, 14, '2022-11-06 14:32:22.001-05', '2022-11-06 14:32:22.001-05', 1);
INSERT INTO public.students_courses VALUES (635, 9, 16, '2022-11-06 14:32:22.002-05', '2022-11-06 14:32:22.002-05', 0);
INSERT INTO public.students_courses VALUES (636, 349, 18, '2022-11-06 14:32:22.001-05', '2022-11-06 14:32:22.001-05', 2);
INSERT INTO public.students_courses VALUES (637, 356, 19, '2022-11-06 14:32:22.002-05', '2022-11-06 14:32:22.002-05', 4);
INSERT INTO public.students_courses VALUES (638, 62, 48, '2022-11-06 14:32:22.002-05', '2022-11-06 14:32:22.002-05', 2);
INSERT INTO public.students_courses VALUES (639, 323, 40, '2022-11-06 14:32:22.002-05', '2022-11-06 14:32:22.002-05', 2);
INSERT INTO public.students_courses VALUES (640, 115, 26, '2022-11-06 14:32:22.002-05', '2022-11-06 14:32:22.002-05', 2);
INSERT INTO public.students_courses VALUES (641, 234, 25, '2022-11-06 14:32:22.003-05', '2022-11-06 14:32:22.003-05', 2);
INSERT INTO public.students_courses VALUES (642, 19, 15, '2022-11-06 14:32:22.003-05', '2022-11-06 14:32:22.003-05', 4);
INSERT INTO public.students_courses VALUES (643, 340, 13, '2022-11-06 14:32:22.002-05', '2022-11-06 14:32:22.002-05', 2);
INSERT INTO public.students_courses VALUES (644, 350, 29, '2022-11-06 14:32:22.003-05', '2022-11-06 14:32:22.003-05', 3);
INSERT INTO public.students_courses VALUES (645, 463, 27, '2022-11-06 14:32:22.003-05', '2022-11-06 14:32:22.003-05', 3);
INSERT INTO public.students_courses VALUES (646, 489, 19, '2022-11-06 14:32:22.003-05', '2022-11-06 14:32:22.003-05', 1);
INSERT INTO public.students_courses VALUES (647, 264, 13, '2022-11-06 14:32:22.004-05', '2022-11-06 14:32:22.004-05', 1);
INSERT INTO public.students_courses VALUES (648, 39, 40, '2022-11-06 14:32:22.004-05', '2022-11-06 14:32:22.004-05', 1);
INSERT INTO public.students_courses VALUES (649, 452, 17, '2022-11-06 14:32:22.003-05', '2022-11-06 14:32:22.003-05', 0);
INSERT INTO public.students_courses VALUES (650, 288, 28, '2022-11-06 14:32:22.004-05', '2022-11-06 14:32:22.004-05', 1);
INSERT INTO public.students_courses VALUES (651, 235, 44, '2022-11-06 14:32:22.004-05', '2022-11-06 14:32:22.004-05', 3);
INSERT INTO public.students_courses VALUES (652, 363, 14, '2022-11-06 14:32:22.004-05', '2022-11-06 14:32:22.004-05', 2);
INSERT INTO public.students_courses VALUES (653, 196, 25, '2022-11-06 14:32:22.006-05', '2022-11-06 14:32:22.006-05', 3);
INSERT INTO public.students_courses VALUES (654, 433, 1, '2022-11-06 14:32:22.005-05', '2022-11-06 14:32:22.005-05', 2);
INSERT INTO public.students_courses VALUES (655, 427, 8, '2022-11-06 14:32:22.005-05', '2022-11-06 14:32:22.005-05', 1);
INSERT INTO public.students_courses VALUES (656, 2, 29, '2022-11-06 14:32:22.012-05', '2022-11-06 14:32:22.012-05', 3);
INSERT INTO public.students_courses VALUES (657, 176, 33, '2022-11-06 14:32:22.011-05', '2022-11-06 14:32:22.011-05', 2);
INSERT INTO public.students_courses VALUES (658, 476, 15, '2022-11-06 14:32:22.012-05', '2022-11-06 14:32:22.012-05', 3);
INSERT INTO public.students_courses VALUES (659, 406, 34, '2022-11-06 14:32:22.012-05', '2022-11-06 14:32:22.012-05', 0);
INSERT INTO public.students_courses VALUES (660, 421, 29, '2022-11-06 14:32:22.013-05', '2022-11-06 14:32:22.013-05', 2);
INSERT INTO public.students_courses VALUES (661, 84, 30, '2022-11-06 14:32:22.012-05', '2022-11-06 14:32:22.012-05', 3);
INSERT INTO public.students_courses VALUES (662, 165, 1, '2022-11-06 14:32:22.013-05', '2022-11-06 14:32:22.013-05', 2);
INSERT INTO public.students_courses VALUES (663, 493, 20, '2022-11-06 14:32:22.013-05', '2022-11-06 14:32:22.013-05', 4);
INSERT INTO public.students_courses VALUES (664, 232, 42, '2022-11-06 14:32:22.013-05', '2022-11-06 14:32:22.013-05', 2);
INSERT INTO public.students_courses VALUES (665, 415, 37, '2022-11-06 14:32:22.014-05', '2022-11-06 14:32:22.014-05', 3);
INSERT INTO public.students_courses VALUES (666, 452, 9, '2022-11-06 14:32:22.014-05', '2022-11-06 14:32:22.014-05', 3);
INSERT INTO public.students_courses VALUES (667, 93, 29, '2022-11-06 14:32:22.013-05', '2022-11-06 14:32:22.013-05', 0);
INSERT INTO public.students_courses VALUES (668, 493, 46, '2022-11-06 14:32:22.013-05', '2022-11-06 14:32:22.013-05', 1);
INSERT INTO public.students_courses VALUES (669, 337, 24, '2022-11-06 14:32:22.014-05', '2022-11-06 14:32:22.014-05', 1);
INSERT INTO public.students_courses VALUES (670, 194, 2, '2022-11-06 14:32:22.014-05', '2022-11-06 14:32:22.014-05', 2);
INSERT INTO public.students_courses VALUES (671, 307, 1, '2022-11-06 14:32:22.014-05', '2022-11-06 14:32:22.014-05', 1);
INSERT INTO public.students_courses VALUES (672, 349, 39, '2022-11-06 14:32:22.015-05', '2022-11-06 14:32:22.015-05', 2);
INSERT INTO public.students_courses VALUES (673, 341, 10, '2022-11-06 14:32:22.015-05', '2022-11-06 14:32:22.015-05', 1);
INSERT INTO public.students_courses VALUES (674, 495, 8, '2022-11-06 14:32:22.014-05', '2022-11-06 14:32:22.014-05', 2);
INSERT INTO public.students_courses VALUES (675, 363, 44, '2022-11-06 14:32:22.015-05', '2022-11-06 14:32:22.015-05', 3);
INSERT INTO public.students_courses VALUES (676, 390, 37, '2022-11-06 14:32:22.015-05', '2022-11-06 14:32:22.015-05', 3);
INSERT INTO public.students_courses VALUES (677, 164, 36, '2022-11-06 14:32:22.015-05', '2022-11-06 14:32:22.015-05', 1);
INSERT INTO public.students_courses VALUES (678, 433, 39, '2022-11-06 14:32:22.015-05', '2022-11-06 14:32:22.015-05', 2);
INSERT INTO public.students_courses VALUES (679, 404, 26, '2022-11-06 14:32:22.015-05', '2022-11-06 14:32:22.015-05', 4);
INSERT INTO public.students_courses VALUES (680, 339, 50, '2022-11-06 14:32:22.016-05', '2022-11-06 14:32:22.016-05', 1);
INSERT INTO public.students_courses VALUES (681, 178, 40, '2022-11-06 14:32:22.016-05', '2022-11-06 14:32:22.016-05', 1);
INSERT INTO public.students_courses VALUES (682, 72, 46, '2022-11-06 14:32:22.016-05', '2022-11-06 14:32:22.016-05', 2);
INSERT INTO public.students_courses VALUES (683, 151, 30, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 1);
INSERT INTO public.students_courses VALUES (684, 242, 44, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 1);
INSERT INTO public.students_courses VALUES (685, 452, 19, '2022-11-06 14:32:22.016-05', '2022-11-06 14:32:22.016-05', 2);
INSERT INTO public.students_courses VALUES (686, 123, 47, '2022-11-06 14:32:22.016-05', '2022-11-06 14:32:22.016-05', 2);
INSERT INTO public.students_courses VALUES (687, 289, 40, '2022-11-06 14:32:22.016-05', '2022-11-06 14:32:22.016-05', 1);
INSERT INTO public.students_courses VALUES (688, 5, 39, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 0);
INSERT INTO public.students_courses VALUES (689, 186, 33, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 1);
INSERT INTO public.students_courses VALUES (690, 94, 13, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 2);
INSERT INTO public.students_courses VALUES (691, 318, 28, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 4);
INSERT INTO public.students_courses VALUES (692, 333, 34, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 1);
INSERT INTO public.students_courses VALUES (693, 244, 1, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 2);
INSERT INTO public.students_courses VALUES (694, 309, 47, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 1);
INSERT INTO public.students_courses VALUES (695, 72, 3, '2022-11-06 14:32:22.017-05', '2022-11-06 14:32:22.017-05', 3);
INSERT INTO public.students_courses VALUES (696, 219, 37, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 3);
INSERT INTO public.students_courses VALUES (697, 223, 27, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 0);
INSERT INTO public.students_courses VALUES (698, 25, 28, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 2);
INSERT INTO public.students_courses VALUES (699, 212, 33, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 4);
INSERT INTO public.students_courses VALUES (700, 121, 10, '2022-11-06 14:32:22.019-05', '2022-11-06 14:32:22.019-05', 2);
INSERT INTO public.students_courses VALUES (701, 357, 35, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 3);
INSERT INTO public.students_courses VALUES (702, 302, 38, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 0);
INSERT INTO public.students_courses VALUES (703, 104, 28, '2022-11-06 14:32:22.019-05', '2022-11-06 14:32:22.019-05', 2);
INSERT INTO public.students_courses VALUES (704, 361, 18, '2022-11-06 14:32:22.019-05', '2022-11-06 14:32:22.019-05', 0);
INSERT INTO public.students_courses VALUES (705, 16, 49, '2022-11-06 14:32:22.018-05', '2022-11-06 14:32:22.018-05', 4);
INSERT INTO public.students_courses VALUES (706, 76, 8, '2022-11-06 14:32:22.02-05', '2022-11-06 14:32:22.02-05', 0);
INSERT INTO public.students_courses VALUES (707, 364, 35, '2022-11-06 14:32:22.02-05', '2022-11-06 14:32:22.02-05', 1);
INSERT INTO public.students_courses VALUES (708, 251, 29, '2022-11-06 14:32:22.019-05', '2022-11-06 14:32:22.019-05', 2);
INSERT INTO public.students_courses VALUES (709, 417, 12, '2022-11-06 14:32:22.02-05', '2022-11-06 14:32:22.02-05', 0);
INSERT INTO public.students_courses VALUES (710, 58, 11, '2022-11-06 14:32:22.02-05', '2022-11-06 14:32:22.02-05', 4);
INSERT INTO public.students_courses VALUES (711, 413, 32, '2022-11-06 14:32:22.02-05', '2022-11-06 14:32:22.02-05', 1);
INSERT INTO public.students_courses VALUES (712, 115, 22, '2022-11-06 14:32:22.02-05', '2022-11-06 14:32:22.02-05', 3);
INSERT INTO public.students_courses VALUES (713, 499, 22, '2022-11-06 14:32:22.02-05', '2022-11-06 14:32:22.02-05', 3);
INSERT INTO public.students_courses VALUES (714, 397, 7, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 3);
INSERT INTO public.students_courses VALUES (715, 142, 19, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 3);
INSERT INTO public.students_courses VALUES (716, 52, 30, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 4);
INSERT INTO public.students_courses VALUES (717, 360, 21, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 0);
INSERT INTO public.students_courses VALUES (718, 43, 45, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 0);
INSERT INTO public.students_courses VALUES (719, 32, 23, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 1);
INSERT INTO public.students_courses VALUES (720, 423, 7, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 3);
INSERT INTO public.students_courses VALUES (721, 323, 28, '2022-11-06 14:32:22.021-05', '2022-11-06 14:32:22.021-05', 4);
INSERT INTO public.students_courses VALUES (722, 33, 27, '2022-11-06 14:32:22.022-05', '2022-11-06 14:32:22.022-05', 2);
INSERT INTO public.students_courses VALUES (723, 234, 29, '2022-11-06 14:32:22.022-05', '2022-11-06 14:32:22.022-05', 3);
INSERT INTO public.students_courses VALUES (724, 239, 20, '2022-11-06 14:32:22.022-05', '2022-11-06 14:32:22.022-05', 1);
INSERT INTO public.students_courses VALUES (725, 416, 20, '2022-11-06 14:32:22.024-05', '2022-11-06 14:32:22.024-05', 1);
INSERT INTO public.students_courses VALUES (726, 42, 26, '2022-11-06 14:32:22.022-05', '2022-11-06 14:32:22.022-05', 3);
INSERT INTO public.students_courses VALUES (727, 375, 39, '2022-11-06 14:32:22.023-05', '2022-11-06 14:32:22.023-05', 2);
INSERT INTO public.students_courses VALUES (728, 348, 27, '2022-11-06 14:32:22.024-05', '2022-11-06 14:32:22.024-05', 1);
INSERT INTO public.students_courses VALUES (729, 473, 38, '2022-11-06 14:32:22.022-05', '2022-11-06 14:32:22.022-05', 0);
INSERT INTO public.students_courses VALUES (730, 448, 44, '2022-11-06 14:32:22.025-05', '2022-11-06 14:32:22.025-05', 4);
INSERT INTO public.students_courses VALUES (731, 397, 11, '2022-11-06 14:32:22.025-05', '2022-11-06 14:32:22.025-05', 1);
INSERT INTO public.students_courses VALUES (732, 368, 33, '2022-11-06 14:32:22.026-05', '2022-11-06 14:32:22.026-05', 0);
INSERT INTO public.students_courses VALUES (733, 171, 21, '2022-11-06 14:32:22.026-05', '2022-11-06 14:32:22.026-05', 4);
INSERT INTO public.students_courses VALUES (734, 193, 18, '2022-11-06 14:32:22.026-05', '2022-11-06 14:32:22.026-05', 3);
INSERT INTO public.students_courses VALUES (735, 178, 20, '2022-11-06 14:32:22.026-05', '2022-11-06 14:32:22.026-05', 1);
INSERT INTO public.students_courses VALUES (736, 332, 41, '2022-11-06 14:32:22.027-05', '2022-11-06 14:32:22.027-05', 3);
INSERT INTO public.students_courses VALUES (737, 271, 44, '2022-11-06 14:32:22.027-05', '2022-11-06 14:32:22.027-05', 1);
INSERT INTO public.students_courses VALUES (738, 106, 6, '2022-11-06 14:32:22.026-05', '2022-11-06 14:32:22.026-05', 2);
INSERT INTO public.students_courses VALUES (739, 322, 36, '2022-11-06 14:32:22.026-05', '2022-11-06 14:32:22.026-05', 0);
INSERT INTO public.students_courses VALUES (740, 371, 24, '2022-11-06 14:32:22.027-05', '2022-11-06 14:32:22.027-05', 0);
INSERT INTO public.students_courses VALUES (741, 67, 50, '2022-11-06 14:32:22.027-05', '2022-11-06 14:32:22.027-05', 1);
INSERT INTO public.students_courses VALUES (742, 475, 26, '2022-11-06 14:32:22.027-05', '2022-11-06 14:32:22.027-05', 3);
INSERT INTO public.students_courses VALUES (743, 242, 38, '2022-11-06 14:32:22.027-05', '2022-11-06 14:32:22.027-05', 0);
INSERT INTO public.students_courses VALUES (744, 279, 31, '2022-11-06 14:32:22.028-05', '2022-11-06 14:32:22.028-05', 1);
INSERT INTO public.students_courses VALUES (745, 323, 5, '2022-11-06 14:32:22.028-05', '2022-11-06 14:32:22.028-05', 0);
INSERT INTO public.students_courses VALUES (746, 409, 9, '2022-11-06 14:32:22.028-05', '2022-11-06 14:32:22.028-05', 3);
INSERT INTO public.students_courses VALUES (747, 227, 21, '2022-11-06 14:32:22.028-05', '2022-11-06 14:32:22.028-05', 1);
INSERT INTO public.students_courses VALUES (748, 43, 50, '2022-11-06 14:32:22.028-05', '2022-11-06 14:32:22.028-05', 1);
INSERT INTO public.students_courses VALUES (749, 331, 17, '2022-11-06 14:32:22.028-05', '2022-11-06 14:32:22.028-05', 3);
INSERT INTO public.students_courses VALUES (750, 417, 22, '2022-11-06 14:32:22.029-05', '2022-11-06 14:32:22.029-05', 0);
INSERT INTO public.students_courses VALUES (751, 88, 23, '2022-11-06 14:32:22.029-05', '2022-11-06 14:32:22.029-05', 3);
INSERT INTO public.students_courses VALUES (752, 183, 24, '2022-11-06 14:32:22.029-05', '2022-11-06 14:32:22.029-05', 2);
INSERT INTO public.students_courses VALUES (753, 20, 8, '2022-11-06 14:32:22.029-05', '2022-11-06 14:32:22.029-05', 3);
INSERT INTO public.students_courses VALUES (754, 339, 16, '2022-11-06 14:32:22.029-05', '2022-11-06 14:32:22.029-05', 2);
INSERT INTO public.students_courses VALUES (755, 313, 39, '2022-11-06 14:32:22.029-05', '2022-11-06 14:32:22.029-05', 1);
INSERT INTO public.students_courses VALUES (756, 72, 40, '2022-11-06 14:32:22.029-05', '2022-11-06 14:32:22.029-05', 2);
INSERT INTO public.students_courses VALUES (757, 316, 43, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 3);
INSERT INTO public.students_courses VALUES (758, 147, 31, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 2);
INSERT INTO public.students_courses VALUES (759, 240, 15, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 3);
INSERT INTO public.students_courses VALUES (760, 248, 26, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 2);
INSERT INTO public.students_courses VALUES (761, 160, 27, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 2);
INSERT INTO public.students_courses VALUES (762, 138, 29, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 1);
INSERT INTO public.students_courses VALUES (763, 327, 33, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 4);
INSERT INTO public.students_courses VALUES (764, 40, 13, '2022-11-06 14:32:22.031-05', '2022-11-06 14:32:22.031-05', 2);
INSERT INTO public.students_courses VALUES (765, 28, 49, '2022-11-06 14:32:22.031-05', '2022-11-06 14:32:22.031-05', 3);
INSERT INTO public.students_courses VALUES (766, 172, 41, '2022-11-06 14:32:22.031-05', '2022-11-06 14:32:22.031-05', 3);
INSERT INTO public.students_courses VALUES (767, 130, 30, '2022-11-06 14:32:22.03-05', '2022-11-06 14:32:22.03-05', 1);
INSERT INTO public.students_courses VALUES (768, 30, 17, '2022-11-06 14:32:22.031-05', '2022-11-06 14:32:22.031-05', 3);
INSERT INTO public.students_courses VALUES (769, 104, 7, '2022-11-06 14:32:22.031-05', '2022-11-06 14:32:22.031-05', 1);
INSERT INTO public.students_courses VALUES (770, 322, 45, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 0);
INSERT INTO public.students_courses VALUES (771, 377, 24, '2022-11-06 14:32:22.031-05', '2022-11-06 14:32:22.031-05', 1);
INSERT INTO public.students_courses VALUES (772, 72, 26, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 4);
INSERT INTO public.students_courses VALUES (773, 354, 32, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 4);
INSERT INTO public.students_courses VALUES (774, 289, 7, '2022-11-06 14:32:22.031-05', '2022-11-06 14:32:22.031-05', 2);
INSERT INTO public.students_courses VALUES (775, 83, 47, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 3);
INSERT INTO public.students_courses VALUES (776, 37, 6, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 3);
INSERT INTO public.students_courses VALUES (777, 160, 25, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 2);
INSERT INTO public.students_courses VALUES (778, 408, 14, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 1);
INSERT INTO public.students_courses VALUES (779, 289, 2, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 3);
INSERT INTO public.students_courses VALUES (780, 442, 16, '2022-11-06 14:32:22.032-05', '2022-11-06 14:32:22.032-05', 0);
INSERT INTO public.students_courses VALUES (781, 371, 29, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 4);
INSERT INTO public.students_courses VALUES (782, 437, 35, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 2);
INSERT INTO public.students_courses VALUES (783, 393, 14, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 1);
INSERT INTO public.students_courses VALUES (784, 108, 33, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 1);
INSERT INTO public.students_courses VALUES (785, 36, 6, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 2);
INSERT INTO public.students_courses VALUES (786, 109, 39, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 2);
INSERT INTO public.students_courses VALUES (787, 317, 26, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 2);
INSERT INTO public.students_courses VALUES (788, 417, 24, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 1);
INSERT INTO public.students_courses VALUES (789, 417, 43, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 2);
INSERT INTO public.students_courses VALUES (790, 466, 39, '2022-11-06 14:32:22.033-05', '2022-11-06 14:32:22.033-05', 3);
INSERT INTO public.students_courses VALUES (791, 490, 2, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 0);
INSERT INTO public.students_courses VALUES (792, 235, 3, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 1);
INSERT INTO public.students_courses VALUES (793, 347, 49, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 2);
INSERT INTO public.students_courses VALUES (794, 256, 41, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 0);
INSERT INTO public.students_courses VALUES (795, 365, 45, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 0);
INSERT INTO public.students_courses VALUES (796, 147, 2, '2022-11-06 14:32:22.035-05', '2022-11-06 14:32:22.035-05', 3);
INSERT INTO public.students_courses VALUES (797, 136, 33, '2022-11-06 14:32:22.034-05', '2022-11-06 14:32:22.034-05', 1);
INSERT INTO public.students_courses VALUES (798, 470, 38, '2022-11-06 14:32:22.036-05', '2022-11-06 14:32:22.036-05', 3);
INSERT INTO public.students_courses VALUES (799, 10, 5, '2022-11-06 14:32:22.035-05', '2022-11-06 14:32:22.035-05', 2);
INSERT INTO public.students_courses VALUES (800, 328, 3, '2022-11-06 14:32:22.035-05', '2022-11-06 14:32:22.035-05', 2);
INSERT INTO public.students_courses VALUES (801, 171, 42, '2022-11-06 14:32:22.035-05', '2022-11-06 14:32:22.035-05', 3);
INSERT INTO public.students_courses VALUES (802, 384, 15, '2022-11-06 14:32:22.036-05', '2022-11-06 14:32:22.036-05', 0);
INSERT INTO public.students_courses VALUES (803, 21, 21, '2022-11-06 14:32:22.036-05', '2022-11-06 14:32:22.036-05', 2);
INSERT INTO public.students_courses VALUES (804, 497, 47, '2022-11-06 14:32:22.036-05', '2022-11-06 14:32:22.036-05', 4);
INSERT INTO public.students_courses VALUES (805, 74, 18, '2022-11-06 14:32:22.036-05', '2022-11-06 14:32:22.036-05', 3);
INSERT INTO public.students_courses VALUES (806, 259, 1, '2022-11-06 14:32:22.036-05', '2022-11-06 14:32:22.036-05', 3);
INSERT INTO public.students_courses VALUES (807, 469, 40, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 3);
INSERT INTO public.students_courses VALUES (808, 215, 37, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 3);
INSERT INTO public.students_courses VALUES (809, 324, 48, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 3);
INSERT INTO public.students_courses VALUES (810, 226, 3, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 3);
INSERT INTO public.students_courses VALUES (811, 353, 26, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 2);
INSERT INTO public.students_courses VALUES (812, 224, 28, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 3);
INSERT INTO public.students_courses VALUES (813, 334, 25, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 3);
INSERT INTO public.students_courses VALUES (814, 369, 4, '2022-11-06 14:32:22.038-05', '2022-11-06 14:32:22.038-05', 0);
INSERT INTO public.students_courses VALUES (815, 473, 25, '2022-11-06 14:32:22.038-05', '2022-11-06 14:32:22.038-05', 0);
INSERT INTO public.students_courses VALUES (816, 143, 1, '2022-11-06 14:32:22.038-05', '2022-11-06 14:32:22.038-05', 0);
INSERT INTO public.students_courses VALUES (817, 466, 23, '2022-11-06 14:32:22.037-05', '2022-11-06 14:32:22.037-05', 4);
INSERT INTO public.students_courses VALUES (818, 84, 35, '2022-11-06 14:32:22.038-05', '2022-11-06 14:32:22.038-05', 3);
INSERT INTO public.students_courses VALUES (819, 200, 44, '2022-11-06 14:32:22.038-05', '2022-11-06 14:32:22.038-05', 1);
INSERT INTO public.students_courses VALUES (820, 349, 13, '2022-11-06 14:32:22.038-05', '2022-11-06 14:32:22.038-05', 2);
INSERT INTO public.students_courses VALUES (821, 370, 20, '2022-11-06 14:32:22.038-05', '2022-11-06 14:32:22.038-05', 4);
INSERT INTO public.students_courses VALUES (822, 296, 37, '2022-11-06 14:32:22.039-05', '2022-11-06 14:32:22.039-05', 1);
INSERT INTO public.students_courses VALUES (823, 459, 32, '2022-11-06 14:32:22.039-05', '2022-11-06 14:32:22.039-05', 1);
INSERT INTO public.students_courses VALUES (824, 231, 3, '2022-11-06 14:32:22.039-05', '2022-11-06 14:32:22.039-05', 0);
INSERT INTO public.students_courses VALUES (825, 373, 8, '2022-11-06 14:32:22.043-05', '2022-11-06 14:32:22.043-05', 2);
INSERT INTO public.students_courses VALUES (826, 129, 29, '2022-11-06 14:32:22.039-05', '2022-11-06 14:32:22.039-05', 0);
INSERT INTO public.students_courses VALUES (827, 307, 11, '2022-11-06 14:32:22.039-05', '2022-11-06 14:32:22.039-05', 2);
INSERT INTO public.students_courses VALUES (828, 480, 10, '2022-11-06 14:32:22.043-05', '2022-11-06 14:32:22.043-05', 2);
INSERT INTO public.students_courses VALUES (829, 274, 1, '2022-11-06 14:32:22.044-05', '2022-11-06 14:32:22.044-05', 4);
INSERT INTO public.students_courses VALUES (830, 54, 22, '2022-11-06 14:32:22.039-05', '2022-11-06 14:32:22.039-05', 3);
INSERT INTO public.students_courses VALUES (831, 404, 25, '2022-11-06 14:32:22.043-05', '2022-11-06 14:32:22.043-05', 2);
INSERT INTO public.students_courses VALUES (832, 383, 16, '2022-11-06 14:32:22.044-05', '2022-11-06 14:32:22.044-05', 2);
INSERT INTO public.students_courses VALUES (833, 265, 28, '2022-11-06 14:32:22.043-05', '2022-11-06 14:32:22.043-05', 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 50, true);


--
-- Name: students_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_courses_id_seq', 833, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 500, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: students_courses students_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students_courses
    ADD CONSTRAINT students_courses_pkey PRIMARY KEY (id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

