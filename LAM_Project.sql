--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-27 14:06:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 19517)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5885 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16416)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16415)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5886 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 225 (class 1259 OID 16454)
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    intertainment_id integer,
    image_url character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.images OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16453)
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.images_id_seq OWNER TO postgres;

--
-- TOC entry 5887 (class 0 OID 0)
-- Dependencies: 224
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- TOC entry 223 (class 1259 OID 16434)
-- Name: intertainment_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intertainment_map (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    address character varying(255),
    category_id integer,
    working_hours_id integer,
    phone_number character varying(255),
    website character varying(255),
    rating real,
    number_of_reviews integer DEFAULT 0,
    location public.geography(Point,4326),
    latitude real,
    longitude real
);


ALTER TABLE public.intertainment_map OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16433)
-- Name: intertainment_map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.intertainment_map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intertainment_map_id_seq OWNER TO postgres;

--
-- TOC entry 5888 (class 0 OID 0)
-- Dependencies: 222
-- Name: intertainment_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.intertainment_map_id_seq OWNED BY public.intertainment_map.id;


--
-- TOC entry 228 (class 1259 OID 16476)
-- Name: intertainment_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intertainment_tags (
    intertainment_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.intertainment_tags OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16495)
-- Name: suggested_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suggested_locations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    address character varying(255),
    website character varying(255)
);


ALTER TABLE public.suggested_locations OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16494)
-- Name: suggested_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suggested_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suggested_locations_id_seq OWNER TO postgres;

--
-- TOC entry 5889 (class 0 OID 0)
-- Dependencies: 229
-- Name: suggested_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suggested_locations_id_seq OWNED BY public.suggested_locations.id;


--
-- TOC entry 227 (class 1259 OID 16468)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16467)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tags_id_seq OWNER TO postgres;

--
-- TOC entry 5890 (class 0 OID 0)
-- Dependencies: 226
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 221 (class 1259 OID 16425)
-- Name: working_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.working_hours (
    id integer NOT NULL,
    monday_open time without time zone,
    monday_close time without time zone,
    tuesday_open time without time zone,
    tuesday_close time without time zone,
    wednesday_open time without time zone,
    wednesday_close time without time zone,
    thursday_open time without time zone,
    thursday_close time without time zone,
    friday_open time without time zone,
    friday_close time without time zone,
    saturday_open time without time zone,
    saturday_close time without time zone,
    sunday_open time without time zone,
    sunday_close time without time zone,
    additional_notes text
);


ALTER TABLE public.working_hours OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16424)
-- Name: working_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.working_hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.working_hours_id_seq OWNER TO postgres;

--
-- TOC entry 5891 (class 0 OID 0)
-- Dependencies: 220
-- Name: working_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.working_hours_id_seq OWNED BY public.working_hours.id;


--
-- TOC entry 5683 (class 2604 OID 16419)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 5687 (class 2604 OID 16457)
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- TOC entry 5685 (class 2604 OID 16503)
-- Name: intertainment_map id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intertainment_map ALTER COLUMN id SET DEFAULT nextval('public.intertainment_map_id_seq'::regclass);


--
-- TOC entry 5689 (class 2604 OID 16498)
-- Name: suggested_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggested_locations ALTER COLUMN id SET DEFAULT nextval('public.suggested_locations_id_seq'::regclass);


--
-- TOC entry 5688 (class 2604 OID 16471)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 5684 (class 2604 OID 16428)
-- Name: working_hours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.working_hours ALTER COLUMN id SET DEFAULT nextval('public.working_hours_id_seq'::regclass);


--
-- TOC entry 5868 (class 0 OID 16416)
-- Dependencies: 219
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Музеи
2	Галереи искусств
3	Театры
4	Исторические места и памятники
5	Концертные залы
6	Культурные центры
7	Бары
8	Клубы
9	Пабы
10	Караоке
11	Парки и сады
12	Парки аттракционов
13	Мастер-классы и студии
14	Квесты
\.


--
-- TOC entry 5874 (class 0 OID 16454)
-- Dependencies: 225
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, intertainment_id, image_url, description) FROM stdin;
\.


--
-- TOC entry 5872 (class 0 OID 16434)
-- Dependencies: 223
-- Data for Name: intertainment_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intertainment_map (id, name, description, address, category_id, working_hours_id, phone_number, website, rating, number_of_reviews, location, latitude, longitude) FROM stdin;
1	парк Гагарина	\N	\r\nгородской округ Самара, Промышленный район, парк культуры и отдыха имени Юрия Гагарина	11	\N	\N	\N	4.9	\N	0101000020E6100000F1F109D9791949405DC5E237859D4A40	53.23063	50.19903
2	парк Победы	\N	Аэродромная ул., 90	11	\N	\N	\N	4.6	\N	0101000020E61000000725CCB4FD1949404C8A8F4FC8984A40	53.19361	50.203056
3	Ботанический сад Самарского университета	\N	\r\nМосковское ш., 36	11	\N	\N	\N	4.4	\N	0101000020E6100000D7868A71FE1649403C84F1D3B89B4A40	53.21658	50.17964
4	Загородный парк	\N	городской округ Самара, Октябрьский район, Загородный центральный парк культуры и отдыха имени М. Горького	11	\N	\N	\N	4.8	\N	0101000020E61000008D2782380F154940B153AC1A849D4A40	53.230595	50.164528
5	Струковский сад	\N	\r\nул. Куйбышева, 147А	11	\N	\N	\N	5	\N	0101000020E61000008B54185B080C4940618907944D994A40	53.19768	50.094006
6	мк Колокол	\N	просп. Масленникова, 15	13	\N	\N	\N	5	\N	0101000020E61000003221E692AA13494010919A76319B4A40	53.21245	50.153645
7	мк ПростоАрт	\N	просп. Масленникова, 12А	13	\N	\N	\N	4.9	\N	0101000020E6100000B3B27DC85B144940F2CF0CE2039B4A40	53.211056	50.15905
8	мк Центр Сотворчества Живой!	\N	ул. Ерошевского, 5	13	\N	\N	\N	4.8	\N	0101000020E6100000FA2AF9D85D144940925D6919A99B4A40	53.2161	50.159115
9	музей Дача К.П. Головкина	\N	\r\nул. Советской Армии, 292	1	\N	\N	\N	4.9	\N	0101000020E6100000513239B533164940E753C72AA59F4A40	53.247227	50.173454
10	музей Авиации и космонавтики	\N	Московское ш., 34А	1	\N	\N	\N	4.4	\N	0101000020E610000079E75086AA1649409A6038D7309B4A40	53.21243	50.17708
11	музей им. П.В. Алабина	\N	Красноармейская ул., 75	1	\N	\N	\N	4.5	\N	0101000020E6100000FAD4B14AE90D49404432E4D87A984A40	53.19125	50.10868
12	музей шоколада	\N	Садовая ул., 256	1	\N	\N	\N	4.4	\N	0101000020E6100000747973B8560F494081EB8A19E1994A40	53.202183	50.119835
13	музей модерна	\N	\r\nКрасноармейская ул., 15	1	\N	\N	\N	4.8	\N	0101000020E6100000B4E6C75F5A0C49403CC1FEEBDC984A40	53.19424	50.096508
15	бункер Сталина	\N	\r\nул. Фрунзе, 167	4	\N	\N	\N	4.7	\N	0101000020E6100000A510C8258E0C49403012DA722E994A40	53.19673	50.098087
16	дом - музей В.И. Ленина 	\N	\r\nЛенинская ул., 131	1	\N	\N	\N	4.6	\N	0101000020E6100000BDFF8F13260E4940D787F546AD984A40	53.192787	50.11054
17	КвестГуру	\N	Ленинская ул., 61	14	\N	\N	\N	5	\N	0101000020E6100000C713419C870D4940DA20938C9C974A40	53.184464	50.1057
18	квест Изоляция	\N	\r\nул. Высоцкого, 3А	14	\N	\N	\N	5	\N	0101000020E6100000ED9FA701830C49403F19E3C3EC974A40	53.186913	50.097748
19	квест Black Duck	\N	Ленинская ул., 202	14	\N	\N	\N	5	\N	0101000020E61000009B560A815C0E4940F0DB10E335994A40	53.196957	50.112198
20	квесты, лазертаг Бункер	\N	\r\nУльяновская ул., 18	14	\N	\N	\N	5	\N	0101000020E6100000711B0DE02D0E494096ED43DE72994A40	53.19882	50.110775
21	Кулинарные шоу CooknRun Events	\N	\r\nул. Куйбышева, 94	13	\N	\N	\N	5	\N	0101000020E610000011C47938810B494076DEC66647984A40	53.18968	50.08988
22	бар Свойский	\N	\r\nНекрасовская ул., 62	7	\N	\N	\N	4.9	\N	0101000020E6100000198EE733A00C49404DF4F92823984A40	53.188572	50.09864
23	 бар ресторан Smoky People\r\n	\N	\r\nНово-Садовая ул.,3	7	\N	\N	\N	5	\N	0101000020E610000001BF46922010494085798F334D9A4A40	53.205482	50.125996
24	бар Родная	\N	\r\nМосковское ш., литЕ110	7	\N	\N	\N	4.7	\N	0101000020E6100000DA01D715331249409F5BE84A049A4A40	53.203255	50.142185
25	бар Дядя Блёва	\N	\r\nЯрмарочная ул., 29	7	\N	\N	\N	5	\N	0101000020E6100000C0CDE2C5C20E49404C546F0D6C994A40	53.19861	50.11532
26	бар На Посошок	\N	Галактионовская ул., 91	7	\N	\N	\N	4.9	\N	0101000020E6100000FAB31F29220D49402F3196E997984A40	53.192135	50.102604
27	Самарский академический театр драмы имени Максима Горького	\N	 площадь Чапаева, 1	3	\N	\N	\N	5	\N	0101000020E6100000D68EE21C750C494003B5183C4C994A40	53.19764	50.097324
28	Самарский театр кукол	\N	\r\nСамарская ул., 95	3	\N	\N	\N	4.9	\N	0101000020E6100000DACA4BFE270D494025E659492B984A40	53.18882	50.102783
29	Самарская государственная филармония	\N	\r\nул. Фрунзе, 141	5	\N	\N	\N	5	\N	0101000020E610000028B682A6250C4940276A696E85984A40	53.19157	50.0949
14	третьяковская галерея	\N	\r\nНово-Садовая ул., 149	2	\N	\N	\N	4.8	\N	0101000020E6100000594E42E90B134940D61C2098A39B4A40	53.21593	50.1488
\.


--
-- TOC entry 5877 (class 0 OID 16476)
-- Dependencies: 228
-- Data for Name: intertainment_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intertainment_tags (intertainment_id, tag_id) FROM stdin;
\.


--
-- TOC entry 5682 (class 0 OID 19839)
-- Dependencies: 232
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5879 (class 0 OID 16495)
-- Dependencies: 230
-- Data for Name: suggested_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suggested_locations (id, name, description, address, website) FROM stdin;
\.


--
-- TOC entry 5876 (class 0 OID 16468)
-- Dependencies: 227
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (id, name) FROM stdin;
\.


--
-- TOC entry 5870 (class 0 OID 16425)
-- Dependencies: 221
-- Data for Name: working_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.working_hours (id, monday_open, monday_close, tuesday_open, tuesday_close, wednesday_open, wednesday_close, thursday_open, thursday_close, friday_open, friday_close, saturday_open, saturday_close, sunday_open, sunday_close, additional_notes) FROM stdin;
\.


--
-- TOC entry 5892 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 14, true);


--
-- TOC entry 5893 (class 0 OID 0)
-- Dependencies: 224
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 1, false);


--
-- TOC entry 5894 (class 0 OID 0)
-- Dependencies: 222
-- Name: intertainment_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.intertainment_map_id_seq', 301, true);


--
-- TOC entry 5895 (class 0 OID 0)
-- Dependencies: 229
-- Name: suggested_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suggested_locations_id_seq', 1, false);


--
-- TOC entry 5896 (class 0 OID 0)
-- Dependencies: 226
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- TOC entry 5897 (class 0 OID 0)
-- Dependencies: 220
-- Name: working_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.working_hours_id_seq', 1, false);


--
-- TOC entry 5692 (class 2606 OID 16423)
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- TOC entry 5694 (class 2606 OID 16421)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 5701 (class 2606 OID 16461)
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- TOC entry 5699 (class 2606 OID 16505)
-- Name: intertainment_map intertainment_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intertainment_map
    ADD CONSTRAINT intertainment_map_pkey PRIMARY KEY (id);


--
-- TOC entry 5707 (class 2606 OID 16480)
-- Name: intertainment_tags intertainment_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intertainment_tags
    ADD CONSTRAINT intertainment_tags_pkey PRIMARY KEY (intertainment_id, tag_id);


--
-- TOC entry 5709 (class 2606 OID 16502)
-- Name: suggested_locations suggested_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suggested_locations
    ADD CONSTRAINT suggested_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 5703 (class 2606 OID 16475)
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- TOC entry 5705 (class 2606 OID 16473)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5696 (class 2606 OID 16430)
-- Name: working_hours working_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.working_hours
    ADD CONSTRAINT working_hours_pkey PRIMARY KEY (id);


--
-- TOC entry 5697 (class 1259 OID 20603)
-- Name: idx_places_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_places_location ON public.intertainment_map USING gist (location);


--
-- TOC entry 5714 (class 2606 OID 16506)
-- Name: images images_intertainment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_intertainment_id_fkey FOREIGN KEY (intertainment_id) REFERENCES public.intertainment_map(id) ON DELETE CASCADE;


--
-- TOC entry 5712 (class 2606 OID 16442)
-- Name: intertainment_map intertainment_map_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intertainment_map
    ADD CONSTRAINT intertainment_map_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 5713 (class 2606 OID 16448)
-- Name: intertainment_map intertainment_map_working_hours_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intertainment_map
    ADD CONSTRAINT intertainment_map_working_hours_id_fkey FOREIGN KEY (working_hours_id) REFERENCES public.working_hours(id);


--
-- TOC entry 5715 (class 2606 OID 16511)
-- Name: intertainment_tags intertainment_tags_intertainment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intertainment_tags
    ADD CONSTRAINT intertainment_tags_intertainment_id_fkey FOREIGN KEY (intertainment_id) REFERENCES public.intertainment_map(id) ON DELETE CASCADE;


--
-- TOC entry 5716 (class 2606 OID 16486)
-- Name: intertainment_tags intertainment_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intertainment_tags
    ADD CONSTRAINT intertainment_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


-- Completed on 2025-05-27 14:06:02

--
-- PostgreSQL database dump complete
--

