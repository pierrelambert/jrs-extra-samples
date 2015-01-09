--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public."time" DROP CONSTRAINT time_pkey;
ALTER TABLE ONLY public.agency DROP CONSTRAINT agency_pkey;
DROP TABLE public."time";
DROP TABLE public.rejects;
DROP TABLE public.part;
DROP TABLE public.order_2012;
DROP TABLE public.fusion_map_id;
DROP TABLE public.agency;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agency; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE agency (
    agency_id integer NOT NULL,
    agency_region character varying,
    agency_country character varying,
    agency_sedad_id character varying,
    agency_name character varying,
    agency_contract_type character(1),
    agency_certified_2012 boolean,
    sales_rep_name character varying,
    fusion_map_id character varying
);


ALTER TABLE public.agency OWNER TO postgres;

--
-- Name: fusion_map_id; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fusion_map_id (
    map_ame character varying,
    id character varying,
    short_name character varying,
    region_name character varying
);


ALTER TABLE public.fusion_map_id OWNER TO postgres;

--
-- Name: order_2012; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_2012 (
    time_id integer,
    part_id integer,
    agency_id integer,
    sales numeric,
    sales_prediscount numeric,
    discount numeric,
    discount_perc integer,
    is_stressful_order integer
);


ALTER TABLE public.order_2012 OWNER TO postgres;

--
-- Name: part; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE part (
    part_id integer NOT NULL,
    part_number character varying,
    part_ref character varying,
    part_family character varying,
    part_price numeric
);


ALTER TABLE public.part OWNER TO postgres;

--
-- Name: rejects; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rejects (
    reject_type character varying(500) NOT NULL,
    excel_line integer NOT NULL,
    reason_reject character varying(500) NOT NULL,
    sales_rep_name character varying(500),
    sales_rep_country character varying(20)
);


ALTER TABLE public.rejects OWNER TO postgres;

--
-- Name: time; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "time" (
    time_id integer NOT NULL,
    date timestamp without time zone,
    year integer,
    quarter character varying,
    month_of_year integer,
    fiscal_period integer
);


ALTER TABLE public."time" OWNER TO postgres;

--
-- Data for Name: agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agency (agency_id, agency_region, agency_country, agency_sedad_id, agency_name, agency_contract_type, agency_certified_2012, sales_rep_name, fusion_map_id) FROM stdin;
1	Abruzzo	Italy	AX1000100	Abruzzo Agency 1	A	f	Victoria Adams	001
2	Abruzzo	Italy	AX1000101	Abruzzo Agency 2	B	f	Victoria Adams	001
3	Alsace	France	AX1000103	Alsace Agency 1	B	f	Frank Chemoul	002
4	Alsace	France	AX1000104	Alsace Agency 2	B	f	Frank Chemoul	002
5	Alsace	France	AX1000105	Alsace Agency 3	A	t	Frank Chemoul	002
6	Alsace	France	AX1000106	Alsace Agency 4	B	f	Frank Chemoul	002
7	Alsace	France	AX1000107	Alsace Agency 5	B	f	Frank Chemoul	002
8	Aquitaine	France	AX1000108	Aquitaine Agency 1	B	t	Georges Delaville	003
9	Aquitaine	France	AX1000109	Aquitaine Agency 2	B	f	Georges Delaville	003
10	Aquitaine	France	AX1000110	Aquitaine Agency 3	A	f	Georges Delaville	003
11	Aquitaine	France	AX1000111	Aquitaine Agency 4	B	f	Georges Delaville	003
12	Aquitaine	France	AX1000112	Aquitaine Agency 5	B	t	Georges Delaville	003
13	Aquitaine	France	AX1000113	Aquitaine Agency 6	B	t	Georges Delaville	003
14	Auvergne	France	AX1000114	Auvergne Agency 7	B	f	Maria Martin	004
15	Auvergne	France	AX1000115	Auvergne Agency 8	A	f	Maria Martin	004
16	Auvergne	France	AX1000116	Auvergne Agency 9	B	f	Maria Martin	004
17	Baden-Wuerttemberg	Germany	AX1000117	Baden-Wuerttemberg Agency 1	B	t	Jan Muller	001
18	Baden-Wuerttemberg	Germany	AX1000118	Baden-Wuerttemberg Agency 2	B	t	Jan Muller	001
19	Basilicata	Italy	AX1000119	Basilicata Agency 1	B	t	Mario Colli	002
20	Basilicata	Italy	AX1000120	Basilicata Agency 2	A	f	Mario Colli	002
21	Basilicata	Italy	AX1000121	Basilicata Agency 3	B	f	Mario Colli	002
22	Basilicata	Italy	AX1000122	Basilicata Agency 4	B	f	Mario Colli	002
23	Basse-Normandie	France	AX1000123	Basse-Normandie Agency 1	B	f	Frank Chemoul	017
24	Basse-Normandie	France	AX1000124	Basse-Normandie Agency 2	B	t	Frank Chemoul	017
25	Basse-Normandie	France	AX1000125	Basse-Normandie Agency 3	A	f	Frank Chemoul	017
26	Basse-Normandie	France	AX1000126	Basse-Normandie Agency 4	B	t	Frank Chemoul	017
27	Basse-Normandie	France	AX1000127	Basse-Normandie Agency 5	B	f	Frank Chemoul	017
28	Bayern	Germany	AX1000128	Bayern Agency 1	B	t	Jan Muller	002
29	Bayern	Germany	AX1000129	Bayern Agency 2	B	f	Jan Muller	002
30	Berlin	Germany	AX1000130	Berlin Agency 1	A	t	Rudi Projnow	003
31	Berlin	Germany	AX1000131	Berlin Agency 2	B	t	Rudi Projnow	003
32	Berlin	Germany	AX1000132	Berlin Agency 3	B	f	Rudi Projnow	003
33	Bourgogne	France	AX1000133	Bourgogne Agency 1	B	f	Frank Chemoul	006
34	Bourgogne	France	AX1000134	Bourgogne Agency 2	B	f	Frank Chemoul	006
35	Bourgogne	France	AX1000135	Bourgogne Agency 3	A	f	Frank Chemoul	006
36	Bourgogne	France	AX1000136	Bourgogne Agency 4	B	f	Frank Chemoul	006
37	Bourgogne	France	AX1000137	Bourgogne Agency 5	B	f	Frank Chemoul	006
38	Bourgogne	France	AX1000138	Bourgogne Agency 6	B	t	Frank Chemoul	006
39	Brandenburg	Germany	AX1000139	Brandenburg Agency 1	B	f	Jan Muller	004
40	Brandenburg	Germany	AX1000140	Brandenburg Agency 2	A	t	Jan Muller	004
41	Brandenburg	Germany	AX1000141	Brandenburg Agency 3	B	f	Jan Muller	004
42	Brandenburg	Germany	AX1000142	Brandenburg Agency 4	B	f	Jan Muller	004
43	Brandenburg	Germany	AX1000143	Brandenburg Agency 5	B	f	Jan Muller	004
44	Brandenburg	Germany	AX1000144	Brandenburg Agency 6	B	f	Jan Muller	004
45	Brandenburg	Germany	AX1000145	Brandenburg Agency 7	A	f	Jan Muller	004
46	Bremen	Germany	AX1000146	Bremen Agency 1	B	f	Jan Muller	005
47	Bremen	Germany	AX1000147	Bremen Agency 2	B	f	Jan Muller	005
48	Bremen	Germany	AX1000148	Bremen Agency 3	B	f	Jan Muller	005
49	Bretagne	France	AX1000149	Bretagne Agency 1	B	f	Frank Chemoul	005
50	Bretagne	France	AX1000150	Bretagne Agency 2	A	f	Frank Chemoul	005
51	Bretagne	France	AX1000151	Bretagne Agency 3	B	f	Frank Chemoul	005
52	Bretagne	France	AX1000152	Bretagne Agency 4	B	t	Frank Chemoul	005
53	Bretagne	France	AX1000153	Bretagne Agency 5	B	f	Frank Chemoul	005
54	Calabria	Italy	AX1000154	Calabria Agency 1	B	f	Mario Colli	003
55	Calabria	Italy	AX1000155	Calabria Agency 2	A	f	Mario Colli	003
56	Calabria	Italy	AX1000156	Calabria Agency 3	B	f	Mario Colli	003
57	Calabria	Italy	AX1000157	Calabria Agency 4	B	f	Mario Colli	003
58	Calabria	Italy	AX1000158	Calabria Agency 5	B	f	Mario Colli	003
59	Campania	Italy	AX1000159	Campania Agency 1	B	f	Luigi Massimo	004
60	Campania	Italy	AX1000160	Campania Agency 2	A	t	Luigi Massimo	004
61	Campania	Italy	AX1000161	Campania Agency 3	B	f	Luigi Massimo	004
62	Campania	Italy	AX1000162	Campania Agency 4	B	f	Luigi Massimo	004
63	Centre	France	AX1000163	Centre Agency 1	B	f	Georges Delaville	007
64	Centre	France	AX1000164	Centre Agency 2	B	f	Georges Delaville	007
65	Centre	France	AX1000165	Centre Agency 3	A	f	Georges Delaville	007
66	Centre	France	AX1000166	Centre Agency 4	B	f	Georges Delaville	007
67	Centre	France	AX1000167	Centre Agency 5	B	f	Georges Delaville	007
68	Centre	France	AX1000168	Centre Agency 6	B	f	Georges Delaville	007
69	Champagne-Ardenne	France	AX1000169	Champagne-Ardenne Agency 1	B	t	Frank Chemoul	008
70	Champagne-Ardenne	France	AX1000170	Champagne-Ardenne Agency 2	A	f	Frank Chemoul	008
71	Champagne-Ardenne	France	AX1000171	Champagne-Ardenne Agency 3	B	f	Frank Chemoul	008
72	Champagne-Ardenne	France	AX1000172	Champagne-Ardenne Agency 4	B	f	Frank Chemoul	008
73	Corse	France	AX1000173	Corse Agency 1	B	f	Martin Lemieux	009
74	Corse	France	AX1000174	Corse Agency 2	B	f	Martin Lemieux	009
75	Corse	France	AX1000175	Corse Agency 3	A	f	Martin Lemieux	009
76	Emilia-Romagna	Italy	AX1000176	Emilia-Romagna Agency 1	B	f	Victoria Adams	005
77	Emilia-Romagna	Italy	AX1000177	Emilia-Romagna Agency 2	B	t	Victoria Adams	005
78	Emilia-Romagna	Italy	AX1000178	Emilia-Romagna Agency 3	B	f	Victoria Adams	005
154	Molise	Italy	AX1000254	Molise Agency 3	B	f	Luigi Massimo	011
79	Emilia-Romagna	Italy	AX1000179	Emilia-Romagna Agency 4	B	f	Victoria Adams	005
80	Franche-Comté	France	AX1000180	Franche-Comté Agency 1	A	f	Georges Delaville	010
81	Franche-Comté	France	AX1000181	Franche-Comté Agency 2	B	f	Georges Delaville	010
82	Franche-Comté	France	AX1000182	Franche-Comté Agency 3	B	f	Georges Delaville	010
83	Franche-Comté	France	AX1000183	Franche-Comté Agency 4	B	t	Georges Delaville	010
84	Franche-Comté	France	AX1000184	Franche-Comté Agency 5	B	f	Georges Delaville	010
85	Friuli-Venezia Giulia	Italy	AX1000185	Friuli-Venezia Giulia Agency 1	A	f	Mario Colli	006
86	Friuli-Venezia Giulia	Italy	AX1000186	Friuli-Venezia Giulia Agency 2	B	f	Mario Colli	006
87	Friuli-Venezia Giulia	Italy	AX1000187	Friuli-Venezia Giulia Agency 3	B	f	Mario Colli	006
88	Friuli-Venezia Giulia	Italy	AX1000188	Friuli-Venezia Giulia Agency 4	B	f	Mario Colli	006
89	Friuli-Venezia Giulia	Italy	AX1000189	Friuli-Venezia Giulia Agency 5	B	f	Mario Colli	006
90	Hamburg	Germany	AX1000190	Hamburg Agency 1	A	f	Rudi Projnow	006
91	Hamburg	Germany	AX1000191	Hamburg Agency 2	B	f	Rudi Projnow	006
92	Hamburg	Germany	AX1000192	Hamburg Agency 3	B	f	Rudi Projnow	006
93	Haute-Normandie	France	AX1000193	Haute-Normandie Agency 1	B	f	Frank Chemoul	023
94	Haute-Normandie	France	AX1000194	Haute-Normandie Agency 2	B	t	Frank Chemoul	023
95	Haute-Normandie	France	AX1000195	Haute-Normandie Agency 3	A	f	Frank Chemoul	023
96	Haute-Normandie	France	AX1000196	Haute-Normandie Agency 4	B	f	Frank Chemoul	023
97	Haute-Normandie	France	AX1000197	Haute-Normandie Agency 5	B	f	Frank Chemoul	023
98	Hessen	Germany	AX1000198	Hessen Agency 1	B	t	Rudi Projnow	007
99	Hessen	Germany	AX1000199	Hessen Agency 2	B	f	Rudi Projnow	007
100	Hessen	Germany	AX1000200	Hessen Agency 3	A	t	Rudi Projnow	007
101	Ile-de-France	France	AX1000201	Ile-de-France Agency 1	B	f	Maria Martin	011
102	Ile-de-France	France	AX1000202	Ile-de-France Agency 2	B	f	Maria Martin	011
103	Ile-de-France	France	AX1000203	Ile-de-France Agency 3	B	t	Maria Martin	011
104	Ile-de-France	France	AX1000204	Ile-de-France Agency 4	B	f	Maria Martin	011
105	Ile-de-France	France	AX1000205	Ile-de-France Agency 5	A	t	Maria Martin	011
106	Ile-de-France	France	AX1000206	Ile-de-France Agency 6	B	f	Maria Martin	011
107	Ile-de-France	France	AX1000207	Ile-de-France Agency 7	B	f	Maria Martin	011
108	Languedoc-Roussillon	France	AX1000208	Languedoc-Roussillon Agency 1	B	f	Maria Martin	012
109	Languedoc-Roussillon	France	AX1000209	Languedoc-Roussillon Agency 2	B	f	Maria Martin	012
110	Languedoc-Roussillon	France	AX1000210	Languedoc-Roussillon Agency 3	A	f	Maria Martin	012
111	Lazio	Italy	AX1000211	Lazio Agency 1	B	f	Mario Colli	007
112	Lazio	Italy	AX1000212	Lazio Agency 2	B	t	Mario Colli	007
113	Lazio	Italy	AX1000213	Lazio Agency 3	B	f	Mario Colli	007
114	Lazio	Italy	AX1000214	Lazio Agency 4	B	f	Mario Colli	007
115	Lazio	Italy	AX1000215	Lazio Agency 5	A	f	Mario Colli	007
116	Liguria	Italy	AX1000216	Liguria Agency 1	B	f	Luigi Massimo	008
117	Liguria	Italy	AX1000217	Liguria Agency 2	B	f	Luigi Massimo	008
118	Liguria	Italy	AX1000218	Liguria Agency 3	B	f	Luigi Massimo	008
119	Liguria	Italy	AX1000219	Liguria Agency 4	B	f	Luigi Massimo	008
120	Liguria	Italy	AX1000220	Liguria Agency 5	A	f	Luigi Massimo	008
121	Limousin	France	AX1000221	Limousin Agency 1	B	t	Frank Chemoul	013
122	Limousin	France	AX1000222	Limousin Agency 2	B	f	Frank Chemoul	013
123	Limousin	France	AX1000223	Limousin Agency 3	B	f	Frank Chemoul	013
124	Limousin	France	AX1000224	Limousin Agency 4	B	f	Frank Chemoul	013
125	Limousin	France	AX1000225	Limousin Agency 5	A	f	Frank Chemoul	013
126	Lombardia	Italy	AX1000226	Lombardia Agency 1	B	t	Mario Colli	009
127	Lombardia	Italy	AX1000227	Lombardia Agency 2	B	f	Mario Colli	009
128	Lombardia	Italy	AX1000228	Lombardia Agency 3	B	f	Mario Colli	009
129	Lombardia	Italy	AX1000229	Lombardia Agency 4	B	f	Mario Colli	009
130	Lombardia	Italy	AX1000230	Lombardia Agency 5	A	f	Mario Colli	009
131	Lombardia	Italy	AX1000231	Lombardia Agency 6	B	f	Mario Colli	009
132	Lorraine	France	AX1000232	Lorraine Agency 1	B	f	Georges Delaville	014
133	Lorraine	France	AX1000233	Lorraine Agency 2	B	f	Georges Delaville	014
134	Lorraine	France	AX1000234	Lorraine Agency 3	B	f	Georges Delaville	014
135	Lorraine	France	AX1000235	Lorraine Agency 4	A	f	Georges Delaville	014
136	Lorraine	France	AX1000236	Lorraine Agency 5	B	f	Georges Delaville	014
137	Marche	Italy	AX1000237	Marche Agency 6	B	f	Luigi Massimo	010
138	Marche	Italy	AX1000238	Marche Agency 1	B	t	Luigi Massimo	010
139	Marche	Italy	AX1000239	Marche Agency 2	B	f	Luigi Massimo	010
140	Marche	Italy	AX1000240	Marche Agency 3	A	f	Luigi Massimo	010
141	Marche	Italy	AX1000241	Marche Agency 4	B	f	Luigi Massimo	010
142	Mecklenburg-Vorpommern	Germany	AX1000242	Mecklenburg-Vorpommern Agency 1	B	f	Rudi Projnow	008
143	Mecklenburg-Vorpommern	Germany	AX1000243	Mecklenburg-Vorpommern Agency 2	B	t	Rudi Projnow	008
144	Mecklenburg-Vorpommern	Germany	AX1000244	Mecklenburg-Vorpommern Agency 3	B	f	Rudi Projnow	008
145	Mecklenburg-Vorpommern	Germany	AX1000245	Mecklenburg-Vorpommern Agency 4	A	t	Rudi Projnow	008
146	Mecklenburg-Vorpommern	Germany	AX1000246	Mecklenburg-Vorpommern Agency 5	B	t	Rudi Projnow	008
147	Mecklenburg-Vorpommern	Germany	AX1000247	Mecklenburg-Vorpommern Agency 6	B	t	Rudi Projnow	008
148	Mecklenburg-Vorpommern	Germany	AX1000248	Mecklenburg-Vorpommern Agency 7	B	t	Rudi Projnow	008
149	Midi-Pyrénées	France	AX1000249	Midi-Pyrénées Agency 1	B	f	Frank Chemoul	015
150	Midi-Pyrénées	France	AX1000250	Midi-Pyrénées Agency 2	A	f	Frank Chemoul	015
151	Midi-Pyrénées	France	AX1000251	Midi-Pyrénées Agency 3	B	f	Frank Chemoul	015
152	Molise	Italy	AX1000252	Molise Agency 1	B	t	Luigi Massimo	011
153	Molise	Italy	AX1000253	Molise Agency 2	B	f	Luigi Massimo	011
155	Niedersachsen	Germany	AX1000255	Niedersachsen Agency 1	A	f	Jan Muller	009
156	Niedersachsen	Germany	AX1000256	Niedersachsen Agency 2	B	f	Jan Muller	009
157	Niedersachsen	Germany	AX1000257	Niedersachsen Agency 3	B	t	Jan Muller	009
158	Niedersachsen	Germany	AX1000258	Niedersachsen Agency 1	B	f	Jan Muller	009
159	Niedersachsen	Germany	AX1000259	Niedersachsen Agency 2	B	t	Jan Muller	009
160	Niedersachsen	Germany	AX1000260	Niedersachsen Agency 3	A	f	Jan Muller	009
161	Niedersachsen	Germany	AX1000261	Niedersachsen Agency 1	B	t	Jan Muller	009
162	Nord-Pas-de-Calais	France	AX1000262	Nord-Pas-de-Calais Agency 1	B	t	Maria Martin	016
163	Nord-Pas-de-Calais	France	AX1000263	Nord-Pas-de-Calais Agency 2	B	t	Maria Martin	016
164	Nord-Pas-de-Calais	France	AX1000264	Nord-Pas-de-Calais Agency 3	B	t	Maria Martin	016
165	Nord-Pas-de-Calais	France	AX1000265	Nord-Pas-de-Calais Agency 4	A	f	Maria Martin	016
166	Nord-Pas-de-Calais	France	AX1000266	Nord-Pas-de-Calais Agency 5	B	f	Maria Martin	016
167	Nordrhein-Westfalen	Germany	AX1000267	Nordrhein-Westfalen Agency 6	B	f	Jan Muller	010
168	Nordrhein-Westfalen	Germany	AX1000268	Nordrhein-Westfalen Agency 7	B	t	Jan Muller	010
169	Nordrhein-Westfalen	Germany	AX1000269	Nordrhein-Westfalen Agency 8	B	f	Jan Muller	010
170	Pays de la Loire	France	AX1000270	Pays de la Loire Agency 1	A	f	Maria Martin	018
171	Pays de la Loire	France	AX1000271	Pays de la Loire Agency 2	B	f	Maria Martin	018
172	Pays de la Loire	France	AX1000272	Pays de la Loire Agency 3	B	f	Maria Martin	018
173	Pays de la Loire	France	AX1000273	Pays de la Loire Agency 4	B	t	Maria Martin	018
174	Pays de la Loire	France	AX1000274	Pays de la Loire Agency 5	B	f	Maria Martin	018
175	Picardie	France	AX1000275	Picardie Agency 1	A	f	Maria Martin	019
176	Picardie	France	AX1000276	Picardie Agency 2	B	t	Maria Martin	019
177	Picardie	France	AX1000277	Picardie Agency 3	B	f	Maria Martin	019
178	Piemonte	Italy	AX1000278	Piemonte Agency 1	B	f	Victoria Adams	012
179	Piemonte	Italy	AX1000279	Piemonte Agency 2	B	f	Victoria Adams	012
180	Piemonte	Italy	AX1000280	Piemonte Agency 3	A	t	Victoria Adams	012
181	Piemonte	Italy	AX1000281	Piemonte Agency 4	B	f	Victoria Adams	012
182	Piemonte	Italy	AX1000282	Piemonte Agency 5	B	f	Victoria Adams	012
183	Piemonte	Italy	AX1000283	Piemonte Agency 6	B	f	Victoria Adams	012
184	Poitou-Charentes	France	AX1000284	Poitou-Charentes Agency 2	B	t	Maria Martin	020
185	Poitou-Charentes	France	AX1000285	Poitou-Charentes Agency 3	A	f	Maria Martin	020
186	Poitou-Charentes	France	AX1000286	Poitou-Charentes Agency 4	B	f	Maria Martin	020
187	Poitou-Charentes	France	AX1000287	Poitou-Charentes Agency 5	B	t	Maria Martin	020
188	Poitou-Charentes	France	AX1000288	Poitou-Charentes Agency 6	B	f	Maria Martin	020
189	Poitou-Charentes	France	AX1000289	Poitou-Charentes Agency 7	B	f	Maria Martin	020
190	Provence-Alpes-Côte D'Azur	France	AX1000290	Provence-Alpes-Côte D'Azur Agency 2	A	t	Frank Chemoul	021
191	Provence-Alpes-Côte D'Azur	France	AX1000291	Provence-Alpes-Côte D'Azur Agency 3	B	f	Frank Chemoul	021
192	Provence-Alpes-Côte D'Azur	France	AX1000292	Provence-Alpes-Côte D'Azur Agency 4	B	f	Frank Chemoul	021
193	Puglia	Italy	AX1000293	Puglia Agency 1	B	t	Mario Colli	013
194	Puglia	Italy	AX1000294	Puglia Agency 2	B	f	Mario Colli	013
195	Puglia	Italy	AX1000295	Puglia Agency 3	A	f	Mario Colli	013
196	Rheinland-Pfalz	Germany	AX1000296	Rheinland-Pfalz Agency 1	B	t	Jan Muller	011
197	Rheinland-Pfalz	Germany	AX1000297	Rheinland-Pfalz Agency 2	B	t	Jan Muller	011
198	Rhône-Alpes	France	AX1000298	Rhône-Alpes Agency 1	B	t	Georges Delaville	022
199	Rhône-Alpes	France	AX1000299	Rhône-Alpes Agency 2	B	f	Georges Delaville	022
200	Rhône-Alpes	France	AX1000300	Rhône-Alpes Agency 3	A	f	Georges Delaville	022
201	Saarland	Germany	AX1000301	Saarland Agency 1	B	t	Rudi Projnow	012
202	Saarland	Germany	AX1000302	Saarland Agency 2	B	f	Rudi Projnow	012
203	Sachsen	Germany	AX1000303	Sachsen Agency 1	B	f	Jan Muller	013
204	Sachsen	Germany	AX1000304	Sachsen Agency 2	B	t	Jan Muller	013
205	Sachsen	Germany	AX1000305	Sachsen Agency 3	A	f	Jan Muller	013
206	Sachsen-Anhalt	Germany	AX1000306	Sachsen-Anhalt Agency 1	B	t	Rudi Projnow	014
207	Sachsen-Anhalt	Germany	AX1000307	Sachsen-Anhalt Agency 2	B	f	Rudi Projnow	014
208	Sachsen-Anhalt	Germany	AX1000308	Sachsen-Anhalt Agency 3	B	t	Rudi Projnow	014
209	Sachsen-Anhalt	Germany	AX1000309	Sachsen-Anhalt Agency 4	B	t	Rudi Projnow	014
210	Sachsen-Anhalt	Germany	AX1000310	Sachsen-Anhalt Agency 5	A	t	Rudi Projnow	014
211	Sachsen-Anhalt	Germany	AX1000311	Sachsen-Anhalt Agency 6	B	t	Rudi Projnow	014
212	Sachsen-Anhalt	Germany	AX1000312	Sachsen-Anhalt Agency 7	B	f	Rudi Projnow	014
213	Sanmarino	Italy	AX1000313	Sanmarino Agency 1	B	f	Mario Colli	021
214	Sanmarino	Italy	AX1000314	Sanmarino Agency 2	B	t	Mario Colli	021
215	Sanmarino	Italy	AX1000315	Sanmarino Agency 3	A	f	Mario Colli	021
216	Sanmarino	Italy	AX1000316	Sanmarino Agency 4	B	f	Mario Colli	021
217	Sanmarino	Italy	AX1000317	Sanmarino Agency 5	B	t	Mario Colli	021
218	Sardegna	Italy	AX1000318	Sardegna Agency 1	B	f	Luigi Massimo	014
219	Sardegna	Italy	AX1000319	Sardegna Agency 2	B	f	Luigi Massimo	014
220	Sardegna	Italy	AX1000320	Sardegna Agency 3	A	f	Luigi Massimo	014
221	Sardegna	Italy	AX1000321	Sardegna Agency 4	B	f	Luigi Massimo	014
222	Schleswig-Holstein	Germany	AX1000322	Schleswig-Holstein Agency 1	B	t	Jan Muller	015
223	Schleswig-Holstein	Germany	AX1000323	Schleswig-Holstein Agency 2	B	t	Jan Muller	015
224	Schleswig-Holstein	Germany	AX1000324	Schleswig-Holstein Agency 3	B	t	Jan Muller	015
225	Schleswig-Holstein	Germany	AX1000325	Schleswig-Holstein Agency 4	A	t	Jan Muller	015
226	Schleswig-Holstein	Germany	AX1000326	Schleswig-Holstein Agency 5	B	t	Jan Muller	015
227	Schleswig-Holstein	Germany	AX1000327	Schleswig-Holstein Agency 6	B	t	Jan Muller	015
228	Schleswig-Holstein	Germany	AX1000328	Schleswig-Holstein Agency 7	B	f	Jan Muller	015
229	Sicilia	Italy	AX1000329	Sicilia Agency 1	B	f	Luigi Massimo	015
230	Sicilia	Italy	AX1000330	Sicilia Agency 2	A	f	Luigi Massimo	015
231	Sicilia	Italy	AX1000331	Sicilia Agency 3	B	f	Luigi Massimo	015
232	Sicilia	Italy	AX1000332	Sicilia Agency 4	B	f	Luigi Massimo	015
233	Sicilia	Italy	AX1000333	Sicilia Agency 5	B	f	Luigi Massimo	015
234	Thueringen	Germany	AX1000334	Thueringen Agency 1	B	t	Rudi Projnow	016
235	Thueringen	Germany	AX1000335	Thueringen Agency 2	A	t	Rudi Projnow	016
236	Thueringen	Germany	AX1000336	Thueringen Agency 3	B	t	Rudi Projnow	016
237	Toscana	Italy	AX1000337	Toscana Agency 1	B	f	Mario Colli	016
238	Toscana	Italy	AX1000338	Toscana Agency 2	B	f	Mario Colli	016
239	Toscana	Italy	AX1000339	Toscana Agency 3	B	f	Mario Colli	016
240	Toscana	Italy	AX1000340	Toscana Agency 4	A	f	Mario Colli	016
241	Toscana	Italy	AX1000341	Toscana Agency 5	B	f	Mario Colli	016
242	Trentino-Alto Adige	Italy	AX1000342	Trentino-Alto Adige Agency 1	B	f	Luigi Massimo	017
243	Trentino-Alto Adige	Italy	AX1000343	Trentino-Alto Adige Agency 2	B	f	Luigi Massimo	017
244	Trentino-Alto Adige	Italy	AX1000344	Trentino-Alto Adige Agency 3	B	f	Luigi Massimo	017
245	Trentino-Alto Adige	Italy	AX1000345	Trentino-Alto Adige Agency 4	A	f	Luigi Massimo	017
246	Umbria	Italy	AX1000346	Umbria Agency 1	B	t	Mario Colli	018
247	Umbria	Italy	AX1000347	Umbria Agency 2	B	f	Mario Colli	018
248	Valle d'Aosta	Italy	AX1000348	Valle d'Aosta Agency 3	B	f	Luigi Massimo	019
249	Valle d'Aosta	Italy	AX1000349	Valle d'Aosta Agency 1	B	f	Luigi Massimo	019
250	Veneto	Italy	AX1000350	Veneto. Agency 2	A	f	Mario Colli	020
\.


--
-- Data for Name: fusion_map_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fusion_map_id (map_ame, id, short_name, region_name) FROM stdin;
Italy	001	AB	Abruzzo
Italy	002	BA	Basilicata
Italy	003	CA	Calabria
Italy	004	CM	Campania
Italy	005	EM	Emilia-Romagna
Italy	006	FI	Friuli-Venezia Giulia
Italy	007	LA	Lazio
Italy	008	LI	Liguria
Italy	009	LO	Lombardia
Italy	010	MA	Marche
Italy	011	MO	Molise
Italy	012	PI	Piemonte
Italy	013	PU	Puglia
Italy	014	SA	Sardegna
Italy	015	SI	Sicilia
Italy	016	TO	Toscana
Italy	017	TR	Trentino-Alto Adige
Italy	018	UM	Umbria
Italy	019	VA	Valle d'Aosta
Italy	020	VE	Veneto.
Italy	021	SM	Sanmarino
Germany	001	BA	Baden-Wuerttemberg
Germany	002	BY	Bayern
Germany	003	BE	Berlin
Germany	004	BR	Brandenburg
Germany	005	BM	Bremen
Germany	006	HA	Hamburg
Germany	007	HE	Hessen
Germany	008	ME	Mecklenburg-Vorpommern
Germany	009	NI	Niedersachsen
Germany	010	NO	Nordrhein-Westfalen
Germany	011	RH	Rheinland-Pfalz
Germany	012	SA	Saarland
Germany	013	SC	Sachsen
Germany	014	SH	Sachsen-Anhalt
Germany	015	SS	Schleswig-Holstein
Germany	016	TH	Thueringen
France	002	AL	Alsace
France	003	AQ	Aquitaine
France	004	AU	Auvergne
France	005	BR	Bretagne
France	006	BU	Bourgogne
France	007	CE	Centre
France	008	CH	Champagne-Ardenne
France	009	CO	Corse
France	010	FR	Franche-Comté
France	011	LL	Ile-de-France
France	012	LA	Languedoc-Roussillon
France	013	LI	Limousin
France	014	LO	Lorraine
France	015	MI	Midi-Pyrénées
France	016	NO	Nord-Pas-de-Calais
France	017	NR	Basse-Normandie
France	018	PD	Pays de la Loire
France	019	PI	Picardie
France	020	PC	Poitou-Charentes
France	021	PR	Provence-Alpes-Côte D'Azur
France	022	RH	Rhône-Alpes
France	023	HN	Haute-Normandie
\.


--
-- Data for Name: order_2012; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_2012 (time_id, part_id, agency_id, sales, sales_prediscount, discount, discount_perc, is_stressful_order) FROM stdin;
51	8	1	4698.45	5107.00	408.57	8	0
51	8	2	5168.29	5617.70	449.42	8	1
51	8	3	6107.98	6639.10	531.13	8	1
51	8	4	6174.37	6639.10	464.74	7	1
51	8	5	9121.11	9703.30	582.20	6	0
51	8	6	5336.82	5617.70	280.89	5	1
51	8	7	7047.66	7660.50	612.85	8	1
51	8	8	6720.82	7149.81	428.99	6	1
51	8	9	5821.98	6128.40	306.43	5	1
51	8	10	8273.35	9192.61	919.27	10	0
51	8	11	5760.70	6128.40	367.71	6	1
51	8	12	9499.02	10214.00	714.99	7	1
51	8	13	4698.45	5107.00	408.57	8	1
51	8	14	8549.12	9192.61	643.49	7	1
51	8	15	8160.99	8681.90	520.92	6	0
51	8	16	4851.65	5107.00	255.36	5	1
51	8	17	6720.82	7149.81	428.99	6	1
51	8	18	6577.82	7149.81	571.99	8	1
51	8	19	5336.82	5617.70	280.89	5	1
51	8	20	5638.13	6128.40	490.28	8	0
51	8	21	7277.48	7660.50	383.03	5	1
51	8	22	7124.27	7660.50	536.24	7	1
51	8	23	5112.11	5617.70	505.60	9	1
51	8	24	7354.08	8171.20	817.13	10	1
51	8	25	9601.16	10214.00	612.85	6	0
51	8	26	4800.58	5107.00	306.43	6	1
51	8	27	5638.13	6128.40	490.28	8	1
51	8	28	8830.01	9703.30	873.30	9	1
51	8	29	8273.35	9192.61	919.27	10	1
51	8	30	7277.48	7660.50	383.03	5	0
51	8	31	9121.11	9703.30	582.20	6	1
51	8	32	8273.35	9192.61	919.27	10	1
51	8	33	8732.97	9703.30	970.33	10	1
51	8	34	8074.17	8681.90	607.74	7	1
51	8	35	7680.93	8171.20	490.28	6	0
51	8	36	8549.12	9192.61	643.49	7	1
51	8	37	4596.31	5107.00	510.71	10	1
51	8	38	7354.08	8171.20	817.13	10	1
51	8	39	8732.97	9192.61	459.64	5	1
51	8	40	8732.97	9703.30	970.33	10	0
51	8	41	5280.64	5617.70	337.07	6	1
51	8	42	5699.42	6128.40	428.99	7	1
51	8	43	6307.15	6639.10	331.96	5	1
51	8	44	7200.87	7660.50	459.63	6	1
51	8	45	7813.72	8681.90	868.20	10	0
51	8	46	8074.17	8681.90	607.74	7	1
51	8	47	5638.13	6128.40	490.28	8	1
51	8	48	4800.58	5107.00	306.43	6	1
51	8	49	4596.31	5107.00	510.71	10	1
51	8	50	6649.32	7149.81	500.49	7	0
51	8	51	6174.37	6639.10	464.74	7	1
51	8	52	5515.56	6128.40	612.85	10	1
51	8	53	6506.32	7149.81	643.49	9	1
51	8	54	6894.45	7660.50	766.06	10	1
51	8	55	8160.99	8681.90	520.92	6	0
51	8	56	9499.02	10214.00	714.99	7	1
51	8	57	6577.82	7149.81	571.99	8	1
51	8	58	7517.51	8171.20	653.70	8	1
51	8	59	6434.83	7149.81	714.99	10	1
51	8	60	5112.11	5617.70	505.60	9	0
51	8	61	8457.20	9192.61	735.41	8	1
51	8	62	7987.35	8681.90	694.56	8	1
51	8	63	8273.35	9192.61	919.27	10	1
51	8	64	8074.17	8681.90	607.74	7	1
51	8	65	6720.82	7149.81	428.99	6	0
51	8	66	5975.19	6639.10	663.91	10	1
51	8	67	4698.45	5107.00	408.57	8	1
51	8	68	7762.64	8171.20	408.57	5	1
51	8	69	4800.58	5107.00	306.43	6	1
51	8	70	5638.13	6128.40	490.28	8	0
51	8	71	5055.94	5617.70	561.77	10	1
51	8	72	7124.27	7660.50	536.24	7	1
51	8	73	6577.82	7149.81	571.99	8	1
51	8	74	7354.08	8171.20	817.13	10	1
51	8	75	7599.22	8171.20	571.99	7	0
51	8	76	7435.80	8171.20	735.41	9	1
51	8	77	9601.16	10214.00	612.85	6	1
51	8	78	9499.02	10214.00	714.99	7	1
51	8	79	8641.05	9192.61	551.56	6	1
51	8	80	4698.45	5107.00	408.57	8	0
51	8	81	8549.12	9192.61	643.49	7	1
51	8	82	9121.11	9703.30	582.20	6	1
51	8	83	5515.56	6128.40	612.85	10	1
51	8	84	6894.45	7660.50	766.06	10	1
51	8	85	4800.58	5107.00	306.43	6	0
51	8	86	8830.01	9703.30	873.30	9	1
51	8	87	4698.45	5107.00	408.57	8	1
51	8	88	5515.56	6128.40	612.85	10	1
51	8	89	9499.02	10214.00	714.99	7	1
51	8	90	7762.64	8171.20	408.57	5	0
51	8	91	5168.29	5617.70	449.42	8	1
51	8	92	5699.42	6128.40	428.99	7	1
51	8	93	8074.17	8681.90	607.74	7	1
51	8	94	6577.82	7149.81	571.99	8	1
51	8	95	7354.08	8171.20	817.13	10	0
51	8	96	8160.99	8681.90	520.92	6	1
51	8	97	5975.19	6639.10	663.91	10	1
51	8	98	6577.82	7149.81	571.99	8	1
51	8	99	8549.12	9192.61	643.49	7	1
51	8	100	8273.35	9192.61	919.27	10	0
51	8	101	8247.81	8681.90	434.10	5	1
51	8	102	9121.11	9703.30	582.20	6	1
51	8	103	9703.30	10214.00	510.71	5	1
51	8	104	9294.74	10214.00	919.26	9	1
51	8	105	8641.05	9192.61	551.56	6	0
51	8	106	7277.48	7660.50	383.03	5	1
51	8	107	7517.51	8171.20	653.70	8	1
51	8	108	4596.31	5107.00	510.71	10	1
51	8	109	6174.37	6639.10	464.74	7	1
51	8	110	7680.93	8171.20	490.28	6	0
51	8	111	8549.12	9192.61	643.49	7	1
51	8	112	7813.72	8681.90	868.20	10	1
51	8	113	5975.19	6639.10	663.91	10	1
51	8	114	7987.35	8681.90	694.56	8	1
51	8	115	7200.87	7660.50	459.63	6	0
51	8	116	9396.89	10214.00	817.13	8	1
51	8	117	4800.58	5107.00	306.43	6	1
51	8	118	5280.64	5617.70	337.07	6	1
51	8	119	6577.82	7149.81	571.99	8	1
51	8	120	9192.61	10214.00	1021.41	10	0
51	8	121	5760.70	6128.40	367.71	6	1
51	8	122	7435.80	8171.20	735.41	9	1
51	8	123	4647.37	5107.00	459.63	9	1
51	8	124	5576.85	6128.40	551.56	9	1
51	8	125	8830.01	9703.30	873.30	9	0
51	8	126	4596.31	5107.00	510.71	10	1
51	8	127	7047.66	7660.50	612.85	8	1
51	8	128	4596.31	5107.00	510.71	10	1
51	8	129	6041.59	6639.10	597.52	9	1
51	8	130	8641.05	9192.61	551.56	6	0
51	8	131	7200.87	7660.50	459.63	6	1
51	8	132	7047.66	7660.50	612.85	8	1
51	8	133	6107.98	6639.10	531.13	8	1
51	8	134	7680.93	8171.20	490.28	6	1
51	8	135	5576.85	6128.40	551.56	9	0
51	8	136	8160.99	8681.90	520.92	6	1
51	8	137	9499.02	10214.00	714.99	7	1
51	8	138	7680.93	8171.20	490.28	6	1
51	8	139	7762.64	8171.20	408.57	5	1
51	8	140	8641.05	9192.61	551.56	6	0
51	8	141	7517.51	8171.20	653.70	8	1
51	8	142	4851.65	5107.00	255.36	5	1
51	8	143	6041.59	6639.10	597.52	9	1
51	8	144	8732.97	9192.61	459.64	5	1
51	8	145	8927.04	9703.30	776.27	8	0
51	8	146	7047.66	7660.50	612.85	8	1
51	8	147	9703.30	10214.00	510.71	5	1
51	8	148	5975.19	6639.10	663.91	10	1
51	8	149	4800.58	5107.00	306.43	6	1
51	8	150	6240.76	6639.10	398.35	6	0
51	8	151	7200.87	7660.50	459.63	6	1
51	8	152	8247.81	8681.90	434.10	5	1
51	8	153	9192.61	10214.00	1021.41	10	1
51	8	154	7599.22	8171.20	571.99	7	1
51	8	155	4851.65	5107.00	255.36	5	0
51	8	156	7599.22	8171.20	571.99	7	1
51	8	157	7900.53	8681.90	781.38	9	1
51	8	158	8641.05	9192.61	551.56	6	1
51	8	159	8830.01	9703.30	873.30	9	1
51	8	160	7277.48	7660.50	383.03	5	0
51	8	161	5975.19	6639.10	663.91	10	1
51	8	162	5975.19	6639.10	663.91	10	1
51	8	163	7900.53	8681.90	781.38	9	1
51	8	164	5168.29	5617.70	449.42	8	1
51	8	165	5699.42	6128.40	428.99	7	0
51	8	166	6107.98	6639.10	531.13	8	1
51	8	167	6041.59	6639.10	597.52	9	1
51	8	168	6792.31	7149.81	357.50	5	1
51	8	169	5821.98	6128.40	306.43	5	1
51	8	170	8074.17	8681.90	607.74	7	0
51	8	171	7047.66	7660.50	612.85	8	1
51	8	172	5576.85	6128.40	551.56	9	1
51	8	173	5760.70	6128.40	367.71	6	1
51	8	174	5055.94	5617.70	561.77	10	1
51	8	175	8830.01	9703.30	873.30	9	0
51	8	176	4698.45	5107.00	408.57	8	1
51	8	177	4749.51	5107.00	357.50	7	1
51	8	178	5638.13	6128.40	490.28	8	1
51	8	179	7680.93	8171.20	490.28	6	1
51	8	180	5168.29	5617.70	449.42	8	0
51	8	181	5760.70	6128.40	367.71	6	1
51	8	182	5638.13	6128.40	490.28	8	1
51	8	183	6041.59	6639.10	597.52	9	1
51	8	184	5760.70	6128.40	367.71	6	1
51	8	185	5515.56	6128.40	612.85	10	0
51	8	186	6720.82	7149.81	428.99	6	1
51	8	187	8927.04	9703.30	776.27	8	1
51	8	188	4698.45	5107.00	408.57	8	1
51	8	189	4800.58	5107.00	306.43	6	1
51	8	190	8830.01	9703.30	873.30	9	0
51	8	191	8160.99	8681.90	520.92	6	1
51	8	192	7435.80	8171.20	735.41	9	1
51	8	193	9121.11	9703.30	582.20	6	1
51	8	194	8457.20	9192.61	735.41	8	1
51	8	195	4851.65	5107.00	255.36	5	0
51	8	196	6894.45	7660.50	766.06	10	1
51	8	197	5168.29	5617.70	449.42	8	1
51	8	198	7435.80	8171.20	735.41	9	1
51	8	199	8273.35	9192.61	919.27	10	1
51	8	200	5638.13	6128.40	490.28	8	0
51	8	201	6577.82	7149.81	571.99	8	1
51	8	202	5515.56	6128.40	612.85	10	1
51	8	203	5576.85	6128.40	551.56	9	1
51	8	204	5224.47	5617.70	393.24	7	1
51	8	205	7987.35	8681.90	694.56	8	0
51	8	206	6894.45	7660.50	766.06	10	1
51	8	207	4749.51	5107.00	357.50	7	1
51	8	208	4800.58	5107.00	306.43	6	1
51	8	209	8160.99	8681.90	520.92	6	1
51	8	210	8074.17	8681.90	607.74	7	0
51	8	211	8549.12	9192.61	643.49	7	1
51	8	212	6174.37	6639.10	464.74	7	1
51	8	213	9192.61	10214.00	1021.41	10	1
51	8	214	9703.30	10214.00	510.71	5	1
51	8	215	8927.04	9703.30	776.27	8	0
51	8	216	4698.45	5107.00	408.57	8	1
51	8	217	8273.35	9192.61	919.27	10	1
51	8	218	6041.59	6639.10	597.52	9	1
51	8	219	8927.04	9703.30	776.27	8	1
51	8	220	4596.31	5107.00	510.71	10	0
51	8	221	8457.20	9192.61	735.41	8	1
51	8	222	5336.82	5617.70	280.89	5	1
51	8	223	7200.87	7660.50	459.63	6	1
51	8	224	5168.29	5617.70	449.42	8	1
51	8	225	5280.64	5617.70	337.07	6	0
51	8	226	8927.04	9703.30	776.27	8	1
51	8	227	6307.15	6639.10	331.96	5	1
51	8	228	6107.98	6639.10	531.13	8	1
51	8	229	4647.37	5107.00	459.63	9	1
51	8	230	7987.35	8681.90	694.56	8	0
51	8	231	5055.94	5617.70	561.77	10	1
51	8	232	4851.65	5107.00	255.36	5	1
51	8	233	6434.83	7149.81	714.99	10	1
51	8	234	5168.29	5617.70	449.42	8	1
51	8	235	4647.37	5107.00	459.63	9	0
51	8	236	5821.98	6128.40	306.43	5	1
51	8	237	6894.45	7660.50	766.06	10	1
51	8	238	9396.89	10214.00	817.13	8	1
51	8	239	5112.11	5617.70	505.60	9	1
51	8	240	8457.20	9192.61	735.41	8	0
51	8	241	6506.32	7149.81	643.49	9	1
51	8	242	7435.80	8171.20	735.41	9	1
51	8	243	7813.72	8681.90	868.20	10	1
51	8	244	8365.27	9192.61	827.34	9	1
51	8	245	9601.16	10214.00	612.85	6	0
51	8	246	8549.12	9192.61	643.49	7	1
51	8	247	5055.94	5617.70	561.77	10	1
51	8	248	7277.48	7660.50	383.03	5	1
51	8	249	4698.45	5107.00	408.57	8	1
51	8	250	6894.45	7660.50	766.06	10	0
53	37	1	3906.23	4340.25	434.03	10	1
52	27	2	1878.55	2041.90	163.36	8	0
55	47	3	9550.98	10381.50	830.52	8	0
53	45	4	2318.41	2520.00	201.60	8	1
56	22	5	3973.85	4319.40	345.56	8	0
57	15	6	121.73	135.25	13.53	10	1
52	12	7	162.57	174.81	12.24	7	0
52	29	8	8650.78	9506.36	855.58	9	1
52	37	9	3993.04	4340.25	347.23	8	1
56	27	11	2170.25	2333.60	163.36	7	1
54	15	12	995.45	1082.00	86.57	8	1
53	33	14	185.25	195.00	9.75	5	1
53	44	16	1105.93	1228.80	122.88	10	0
57	19	17	224.78	247.00	22.24	9	0
57	28	21	3383.74	3759.71	375.98	10	1
51	34	22	1719.64	1910.71	191.08	10	0
56	42	23	328.53	349.50	20.97	6	0
59	25	24	256.31	275.61	19.30	7	0
59	21	25	5348.76	5877.75	529.00	9	1
56	49	26	651.52	715.96	64.44	9	0
52	33	27	1667.25	1755.00	87.75	5	0
59	28	28	2524.37	2685.50	161.13	6	0
55	43	29	418.15	454.50	36.36	8	1
54	35	30	793.52	872.00	78.49	9	0
59	48	32	550.53	598.40	47.88	8	1
56	41	33	2322.93	2471.20	148.28	6	0
51	42	34	643.09	699.00	55.93	8	1
59	28	36	1530.74	1611.31	80.57	5	0
57	50	37	2044.25	2222.00	177.76	8	1
59	14	38	2217.08	2383.95	166.88	7	0
54	49	39	1121.66	1193.25	71.60	6	0
58	18	40	55.42	60.91	5.49	9	0
57	15	41	1132.05	1217.25	85.21	7	1
53	24	42	496.45	551.61	55.17	10	1
59	15	44	738.47	811.50	73.04	9	1
54	22	45	2030.12	2159.70	129.59	6	0
52	18	46	94.40	101.50	7.11	7	0
56	50	47	999.90	1111.00	111.11	10	0
54	20	48	3442.86	3702.00	259.15	7	0
54	50	50	1022.13	1111.00	88.88	8	0
51	17	51	137.12	152.35	15.24	10	1
54	30	52	429.79	452.41	22.63	5	1
52	11	55	3369.97	3663.00	293.05	8	1
54	32	57	821.11	892.50	71.41	8	1
58	45	60	1449.00	1575.00	126.00	8	1
53	47	63	4291.02	4614.00	322.99	7	0
57	21	64	5466.31	5877.75	411.45	7	0
57	15	65	1230.78	1352.50	121.73	9	1
55	32	66	273.70	297.50	23.81	8	0
58	21	69	3173.99	3526.65	352.67	10	0
52	16	70	412.38	438.70	26.33	6	0
51	47	71	3287.48	3460.50	173.03	5	0
54	22	72	1310.22	1439.80	129.59	9	0
55	44	73	698.88	768.00	69.13	9	1
53	28	74	2497.52	2685.50	187.99	7	0
56	31	75	9413.84	9909.30	495.47	5	1
52	43	76	744.48	818.11	73.63	9	1
51	36	77	4571.55	4812.16	240.61	5	1
54	29	79	6179.13	6790.25	611.13	9	1
53	13	80	2294.28	2549.20	254.92	10	1
59	15	83	256.98	270.50	13.53	5	0
51	36	84	5753.96	6187.06	433.10	7	1
59	13	85	908.16	955.95	47.80	5	0
57	46	86	3386.12	3602.25	216.14	6	0
54	18	87	76.33	81.21	4.88	6	0
53	34	88	1796.06	1910.71	114.65	6	1
55	11	90	2838.83	3052.50	213.68	7	1
55	15	91	1107.70	1217.25	109.56	9	0
57	49	92	2219.45	2386.50	167.06	7	0
54	18	93	73.08	81.21	8.13	10	1
58	26	94	1721.71	1851.30	129.60	7	1
57	31	95	6077.71	6606.20	528.50	8	1
57	36	96	4475.30	4812.16	336.86	7	0
58	13	97	289.98	318.65	28.68	9	1
52	33	98	370.50	390.00	19.50	5	0
54	49	99	651.52	715.96	64.44	9	0
55	46	101	360.23	400.25	40.03	10	1
54	47	102	3252.87	3460.50	207.63	6	0
58	18	103	171.74	182.71	10.97	6	1
59	24	104	512.99	551.61	38.62	7	0
52	26	106	6090.78	6479.56	388.78	6	0
54	47	107	1061.23	1153.50	92.29	8	0
59	11	108	5000.00	5494.50	494.51	9	0
57	26	110	1684.69	1851.30	166.62	9	0
52	28	111	3496.53	3759.71	263.18	7	1
55	41	112	574.56	617.80	43.25	7	1
57	10	114	1325.48	1472.75	147.28	10	0
59	40	115	11916.99	12953.25	1036.26	8	0
57	37	116	4739.56	5208.30	468.75	9	0
51	25	117	190.17	206.71	16.54	8	1
54	38	118	2374.20	2609.00	234.82	9	0
53	23	119	5953.95	6615.50	661.56	10	1
57	18	121	113.28	121.81	8.53	7	0
54	20	122	4442.41	4936.00	493.61	10	0
52	42	123	629.11	699.00	69.91	10	0
53	37	124	8072.87	8680.50	607.64	7	0
58	24	125	253.74	275.81	22.07	8	0
59	12	126	402.05	437.00	34.97	8	1
54	29	127	3748.22	4074.15	325.94	8	1
52	22	128	4585.77	5039.31	453.54	9	1
51	32	129	699.13	743.75	44.63	6	1
52	39	130	1534.65	1632.60	97.96	6	1
51	35	131	655.75	697.61	41.86	6	0
53	28	132	3061.48	3222.61	161.14	5	0
54	33	133	1649.70	1755.00	105.30	6	1
56	32	134	821.11	892.50	71.41	8	1
58	26	135	5220.67	5553.90	333.24	6	0
53	39	136	1534.65	1632.60	97.96	6	1
52	16	137	998.05	1096.75	98.71	9	0
54	30	138	1134.02	1206.41	72.39	6	1
55	11	139	2899.88	3052.50	152.63	5	0
51	16	140	399.22	438.70	39.49	9	1
58	41	141	3373.19	3706.80	333.62	9	0
59	16	142	2083.83	2193.50	109.68	5	0
58	36	143	1917.99	2062.36	144.37	7	0
52	48	145	481.72	523.61	41.89	8	1
52	38	147	1961.97	2087.20	125.24	6	0
51	26	148	6886.84	7405.20	518.37	7	1
56	30	149	554.95	603.21	48.26	8	0
56	34	150	987.20	1061.50	74.31	7	1
53	40	151	5181.31	5757.00	575.71	10	1
57	36	152	3265.39	3437.25	171.87	5	1
52	22	153	2678.03	2879.60	201.58	7	1
56	25	154	248.05	275.61	27.57	10	0
57	24	155	64.82	68.96	4.14	6	0
56	14	156	4481.83	4767.90	286.08	6	0
53	35	157	1656.80	1744.00	87.21	5	0
57	45	158	2006.56	2205.00	198.45	9	0
59	12	159	332.13	349.61	17.49	5	1
57	13	160	1159.89	1274.60	114.72	9	0
53	34	164	798.25	849.21	50.96	6	1
51	11	166	4059.83	4273.50	213.68	5	1
55	23	167	4399.31	4630.85	231.55	5	1
59	41	168	1173.82	1235.60	61.79	5	0
54	16	170	1237.14	1316.10	78.97	6	0
55	23	171	2460.97	2646.20	185.24	7	0
58	38	172	991.42	1043.60	52.18	5	0
54	26	173	870.12	925.65	55.54	6	0
51	14	174	746.98	794.65	47.68	6	0
54	13	175	1758.95	1911.90	152.96	8	1
54	25	176	126.78	137.81	11.03	8	0
57	15	177	369.24	405.75	36.52	9	0
53	36	179	3162.27	3437.25	274.99	8	1
51	36	180	4475.30	4812.16	336.86	7	0
58	15	181	1230.78	1352.50	121.73	9	1
59	35	182	1459.73	1569.61	109.88	7	1
55	33	183	1579.50	1755.00	175.50	10	0
54	42	184	664.05	699.00	34.96	5	0
59	30	185	1248.63	1357.21	108.58	8	0
51	15	186	508.54	541.00	32.47	6	0
55	50	187	2088.68	2222.00	133.32	6	0
52	19	190	229.71	247.00	17.30	7	0
54	25	191	250.80	275.61	24.81	9	1
58	33	192	549.90	585.00	35.11	6	1
51	23	193	3612.07	3969.30	357.24	9	0
53	43	194	845.37	909.00	63.64	7	0
56	46	195	2633.65	2801.75	168.11	6	0
57	49	196	226.72	238.66	11.94	5	1
57	10	197	1896.91	2061.85	164.95	8	0
56	50	199	5055.06	5555.00	499.95	9	1
59	13	201	2119.03	2230.55	111.53	5	0
55	46	202	736.47	800.50	64.05	8	0
59	24	203	124.12	137.91	13.80	10	0
51	12	204	332.13	349.61	17.49	5	1
59	15	205	1144.22	1217.25	73.04	6	1
55	41	206	3373.19	3706.80	333.62	9	1
55	18	207	18.48	20.31	1.83	9	0
57	43	208	170.90	181.81	10.91	6	0
53	27	209	1371.00	1458.50	87.51	6	1
55	35	210	486.58	523.21	36.63	7	0
59	37	211	1579.86	1736.10	156.25	9	0
54	11	212	1666.67	1831.50	164.84	9	0
55	11	213	4542.12	4884.00	341.89	7	1
59	12	214	241.23	262.21	20.98	8	1
56	20	215	2776.50	3085.00	308.50	10	0
57	39	217	13811.80	14693.40	881.61	6	1
54	24	219	583.32	620.56	37.24	6	1
52	30	220	678.61	754.00	75.41	10	1
53	35	221	317.41	348.81	31.40	9	1
52	31	222	4657.38	4954.65	297.28	6	1
55	12	223	373.64	393.31	19.67	5	1
58	46	224	3762.35	4002.50	240.15	6	1
59	40	225	5411.58	5757.00	345.42	6	0
59	22	227	3275.55	3599.50	323.96	9	0
55	23	229	4353.00	4630.85	277.86	6	0
58	33	6	1450.80	1560.00	109.21	7	1
55	40	230	2619.44	2878.50	259.07	9	0
53	41	231	1112.04	1235.60	123.57	10	1
56	19	232	23.22	24.70	1.49	6	1
52	31	233	12551.78	13212.40	660.63	5	1
52	29	235	11000.21	12222.45	1222.25	10	0
53	42	237	1100.93	1223.25	122.33	10	0
59	40	238	4101.87	4317.75	215.89	5	0
51	47	239	10958.25	11535.00	576.75	5	0
54	12	240	321.64	349.61	27.97	8	1
51	17	243	708.43	761.75	53.33	7	0
56	40	244	1367.29	1439.25	71.97	5	1
55	41	245	3484.40	3706.80	222.41	6	0
54	40	247	9470.27	10074.75	604.49	6	1
57	45	248	897.75	945.00	47.25	5	0
56	21	249	11050.18	11755.50	705.33	6	1
56	44	250	583.68	614.40	30.72	5	0
58	50	2	8354.72	8888.00	533.28	6	1
59	46	3	2605.63	2801.75	196.13	7	0
52	39	4	9011.96	9795.60	783.65	8	1
54	50	5	5055.06	5555.00	499.95	9	0
56	48	6	355.31	374.00	18.70	5	0
58	35	7	1255.69	1395.21	139.53	10	0
52	34	8	1931.94	2123.00	191.07	9	1
54	49	9	1737.38	1909.21	171.83	9	1
58	12	12	249.10	262.21	13.12	5	0
53	36	14	4427.18	4812.16	384.98	8	0
52	30	17	686.14	754.00	67.86	9	0
53	17	18	420.49	457.05	36.57	8	0
54	35	19	1428.34	1569.61	141.27	9	1
52	25	22	313.50	344.50	31.01	9	0
52	48	23	336.61	374.00	37.40	10	0
51	31	24	7597.14	8257.75	660.63	8	0
51	36	25	6324.54	6874.50	549.97	8	1
54	38	27	469.62	521.80	52.18	10	0
51	43	31	167.26	181.81	14.55	8	0
56	42	32	492.80	524.25	31.46	6	0
51	50	33	3133.02	3333.00	199.98	6	1
52	36	34	618.71	687.46	68.75	10	1
59	11	35	1721.61	1831.50	109.90	6	1
54	10	36	2680.41	2945.50	265.10	9	1
56	28	37	2524.37	2685.50	161.13	6	1
57	44	38	1118.21	1228.80	110.60	9	0
52	41	39	3521.46	3706.80	185.35	5	0
57	24	41	564.71	620.56	55.85	9	0
54	11	42	5219.78	5494.50	274.73	5	0
56	47	43	2122.45	2307.00	184.57	8	0
51	26	45	1666.18	1851.30	185.13	10	0
56	26	46	5109.59	5553.90	444.32	8	0
51	31	47	4459.19	4954.65	495.47	10	1
57	27	48	1312.66	1458.50	145.85	10	0
59	31	49	4459.19	4954.65	495.47	10	1
59	37	50	5651.01	6076.35	425.35	7	1
59	43	51	413.60	454.50	40.91	9	0
56	42	52	985.59	1048.50	62.91	6	1
57	10	53	270.99	294.56	23.57	8	0
53	26	54	6960.89	7405.20	444.32	6	0
58	38	55	1643.67	1826.30	182.63	10	0
55	35	56	491.81	523.21	31.40	6	1
58	32	57	1398.25	1487.50	89.25	6	1
58	48	58	568.48	598.40	29.93	5	0
56	33	59	544.05	585.00	40.96	7	0
56	36	60	3127.90	3437.25	309.36	9	0
53	43	61	248.16	272.71	24.55	9	0
56	28	62	2997.02	3222.61	225.59	7	0
57	10	63	839.47	883.66	44.19	5	0
56	14	64	2217.08	2383.95	166.88	7	0
52	45	65	2693.25	2835.00	141.75	5	0
56	31	66	12155.41	13212.40	1057.00	8	0
51	10	67	1938.14	2061.85	123.72	6	0
53	16	68	197.42	219.35	21.94	10	1
58	28	69	4833.91	5371.00	537.11	10	1
58	28	70	977.53	1074.21	96.68	9	1
53	37	71	2421.86	2604.15	182.30	7	0
56	12	72	318.14	349.61	31.47	9	1
53	16	73	197.42	219.35	21.94	10	0
51	25	74	224.27	241.16	16.89	7	1
56	16	75	1184.50	1316.10	131.61	10	0
58	50	77	10554.50	11110.00	555.50	5	0
59	23	78	2976.98	3307.75	330.78	10	0
54	37	79	6458.30	6944.40	486.11	7	1
51	47	82	10612.21	11535.00	922.81	8	0
51	39	83	9305.82	9795.60	489.78	5	0
58	50	84	7999.20	8888.00	888.81	10	1
58	35	85	331.37	348.81	17.45	5	1
54	43	86	167.26	181.81	14.55	8	0
55	43	87	86.36	90.91	4.55	5	0
57	15	88	628.92	676.25	47.34	7	1
53	25	89	186.04	206.71	20.68	10	0
55	19	90	234.65	247.00	12.36	5	0
53	49	91	658.68	715.96	57.28	8	1
56	32	92	279.65	297.50	17.85	6	0
57	24	93	64.82	68.96	4.14	6	0
57	34	94	197.44	212.31	14.87	7	1
55	39	95	14693.40	16326.00	1632.61	10	0
54	26	99	879.37	925.65	46.29	5	1
52	37	100	4079.84	4340.25	260.42	6	0
54	41	101	2322.93	2471.20	148.28	6	0
52	10	102	276.88	294.56	17.68	6	0
54	21	104	8934.18	9404.40	470.23	5	0
58	27	105	1662.69	1750.20	87.51	5	1
53	46	106	1861.17	2001.25	140.09	7	1
57	14	107	5848.63	6357.20	508.58	8	0
56	19	109	22.98	24.70	1.73	7	1
52	33	110	1614.61	1755.00	140.41	8	1
58	25	112	98.19	103.36	5.17	5	0
56	13	113	1172.64	1274.60	101.97	8	0
52	40	114	9268.78	10074.75	805.99	8	1
57	30	116	981.71	1055.61	73.90	7	0
57	18	117	18.48	20.31	1.83	9	0
57	12	119	119.31	131.11	11.80	9	0
52	50	120	1033.24	1111.00	77.78	7	0
56	18	121	130.74	142.10	11.37	8	1
54	15	123	246.16	270.50	24.35	9	1
58	48	124	412.90	448.80	35.91	8	1
56	41	125	4448.16	4942.40	494.25	10	0
51	34	126	965.97	1061.50	95.54	9	1
57	10	127	530.20	589.11	58.92	10	0
58	30	128	1262.20	1357.21	95.01	7	1
56	35	129	819.68	872.00	52.33	6	1
55	10	131	1855.67	2061.85	206.19	10	1
58	19	133	114.86	123.50	8.65	7	0
54	21	134	9733.56	10579.95	846.40	8	1
57	12	135	157.33	174.81	17.49	10	0
58	44	136	829.44	921.60	92.16	10	0
54	29	138	11366.88	12222.45	855.58	7	1
57	24	139	188.24	206.86	18.62	9	0
51	45	140	2866.50	3150.00	283.50	9	0
58	42	142	830.07	873.75	43.69	5	1
56	32	143	1383.38	1487.50	104.13	7	0
52	46	144	1140.72	1200.75	60.04	5	0
53	12	145	118.00	131.11	13.12	10	0
55	31	147	15524.57	16515.50	990.93	6	1
58	47	148	6228.91	6921.00	692.11	10	1
51	21	149	1093.27	1175.55	82.29	7	1
59	23	153	5477.64	5953.95	476.32	8	1
58	36	155	3265.39	3437.25	171.87	5	0
57	34	156	403.38	424.61	21.24	5	0
58	44	157	419.33	460.80	41.48	9	0
59	49	158	1794.65	1909.21	114.56	6	1
52	44	161	989.19	1075.21	86.02	8	1
55	18	162	182.71	203.00	20.31	10	1
56	11	163	5799.75	6105.00	305.25	5	1
53	27	164	822.60	875.10	52.51	6	0
53	43	165	409.06	454.50	45.46	10	1
59	15	166	984.63	1082.00	97.38	9	0
51	49	167	644.36	715.96	71.60	10	0
56	31	168	7762.29	8257.75	495.47	6	0
51	13	169	1185.38	1274.60	89.23	7	1
55	31	171	1552.46	1651.55	99.10	6	1
56	28	172	1450.18	1611.31	161.14	10	1
55	13	173	2345.27	2549.20	203.94	8	1
53	44	174	691.21	768.00	76.81	10	0
55	36	175	3918.47	4124.71	206.24	5	0
58	25	176	248.05	275.61	27.57	10	0
57	17	178	831.84	914.10	82.27	9	1
52	38	179	1174.05	1304.50	130.46	10	1
54	25	181	313.50	344.50	31.01	9	1
57	41	182	1161.47	1235.60	74.14	6	1
58	43	183	836.29	909.00	72.72	8	1
58	10	184	1384.39	1472.75	88.37	6	0
56	22	186	5895.99	6479.10	583.12	9	1
57	39	187	10399.67	11428.20	1028.54	9	0
57	35	188	481.35	523.21	41.86	8	1
52	28	189	1998.02	2148.41	150.39	7	0
57	16	190	1649.52	1754.80	105.29	6	0
55	18	191	92.37	101.50	9.14	9	0
58	11	192	3479.85	3663.00	183.16	5	1
53	36	193	3231.02	3437.25	206.24	6	0
55	29	195	7659.41	8148.30	488.90	6	0
52	42	196	1300.14	1398.00	97.87	7	0
53	45	197	2072.70	2205.00	132.30	6	0
56	46	198	728.46	800.50	72.05	9	1
56	12	199	246.47	262.21	15.74	6	0
55	16	200	987.08	1096.75	109.68	10	0
52	38	201	2348.10	2609.00	260.91	10	0
54	48	202	140.63	149.60	8.98	6	0
53	12	203	406.41	437.00	30.60	7	1
59	13	204	1210.87	1274.60	63.73	5	1
59	40	205	1324.12	1439.25	115.15	8	0
57	26	206	8330.86	9256.50	925.66	10	0
56	34	208	1995.62	2123.00	127.38	6	0
51	20	209	3930.29	4319.00	388.71	9	1
58	23	210	1885.42	1984.65	99.24	5	0
53	38	212	1239.28	1304.50	65.23	5	1
53	38	213	735.74	782.70	46.97	6	0
57	16	214	611.99	658.05	46.07	7	0
52	15	215	1119.88	1217.25	97.38	8	0
56	18	217	93.39	101.50	8.13	8	0
51	32	218	1258.43	1338.75	80.33	6	1
59	50	220	6332.70	6666.00	333.31	5	0
54	29	221	7740.89	8148.30	407.42	5	0
52	10	222	1107.51	1178.21	70.70	6	1
51	31	223	4657.38	4954.65	297.28	6	0
53	21	224	6700.64	7053.30	352.67	5	0
55	21	225	11167.73	11755.50	587.78	5	0
51	25	226	64.77	68.91	4.14	6	1
53	20	227	3479.88	3702.00	222.13	6	1
55	46	228	3278.05	3602.25	324.21	9	1
53	46	230	2633.65	2801.75	168.11	6	0
56	32	231	415.02	446.25	31.24	7	1
53	23	232	3109.29	3307.75	198.47	6	0
55	34	233	585.95	636.91	50.96	8	0
51	40	234	1367.29	1439.25	71.97	5	1
58	40	235	5296.45	5757.00	460.57	8	1
59	16	236	1427.97	1535.46	107.49	7	1
56	12	237	160.82	174.81	13.99	8	0
57	18	238	146.16	162.41	16.25	10	0
51	30	239	542.89	603.21	60.33	10	1
53	34	240	382.15	424.61	42.47	10	0
51	12	243	124.55	131.11	6.56	5	0
52	25	244	291.45	310.06	18.61	6	1
53	16	245	611.99	658.05	46.07	7	0
59	43	247	507.23	545.41	38.18	7	0
52	31	250	10867.20	11560.86	693.66	6	1
52	33	1	1813.50	1950.00	136.50	7	0
53	11	2	1648.36	1831.50	183.16	10	0
58	50	3	1055.46	1111.00	55.56	5	0
57	37	4	4123.24	4340.25	217.02	5	0
59	36	7	5004.64	5499.61	494.97	9	0
52	24	8	372.34	413.71	41.38	10	1
51	44	10	291.84	307.20	15.36	5	1
51	16	11	833.53	877.40	43.88	5	1
52	32	12	669.38	743.75	74.38	10	0
54	49	13	1718.28	1909.21	190.93	10	0
58	32	14	1231.66	1338.75	107.11	8	1
52	16	15	1009.01	1096.75	87.74	8	1
52	47	16	1084.29	1153.50	69.21	6	1
54	40	19	5469.15	5757.00	287.86	5	0
57	22	20	5240.88	5759.20	518.33	9	0
51	21	21	6347.97	7053.30	705.33	10	1
58	10	23	547.87	589.11	41.24	7	1
56	30	24	560.98	603.21	42.23	7	1
55	39	26	4505.98	4897.80	391.83	8	1
55	37	28	8072.87	8680.50	607.64	7	1
52	27	29	2362.77	2625.30	262.53	10	0
58	48	30	68.82	74.80	5.99	8	1
53	35	31	983.62	1046.41	62.79	6	1
58	40	32	11787.46	12953.25	1165.80	9	0
52	26	34	7664.39	8330.86	666.47	8	0
59	28	35	5048.74	5371.00	322.26	6	0
58	30	36	548.92	603.21	54.29	9	1
53	11	37	579.98	610.50	30.53	5	0
51	32	39	1353.63	1487.50	133.88	9	0
58	21	40	5348.76	5877.75	529.00	9	0
57	24	42	501.96	551.61	49.65	9	1
52	44	44	1244.16	1382.40	138.24	10	0
56	40	45	3929.16	4317.75	388.60	9	0
58	37	47	7899.26	8680.50	781.25	9	1
58	29	48	4943.31	5432.20	488.90	9	1
55	16	49	1458.68	1535.46	76.78	5	1
57	48	50	476.48	523.61	47.13	9	0
52	25	51	253.56	275.61	22.05	8	0
54	46	52	1092.69	1200.75	108.07	9	1
54	21	53	6347.97	7053.30	705.33	10	0
52	22	54	4787.34	5039.31	251.97	5	0
56	26	55	5896.40	6479.56	583.16	9	1
56	31	56	15359.42	16515.50	1156.09	7	0
59	31	58	14863.96	16515.50	1651.56	10	1
52	17	59	1121.30	1218.80	97.51	8	0
58	40	60	12176.06	12953.25	777.20	6	0
54	39	61	12015.94	13060.80	1044.87	8	0
53	21	62	4231.98	4702.20	470.23	10	1
51	45	63	289.81	315.00	25.20	8	1
52	28	64	3996.03	4296.81	300.78	7	0
59	15	65	1257.83	1352.50	94.68	7	0
55	49	67	224.34	238.66	14.32	6	1
56	48	68	619.35	673.20	53.86	8	0
59	13	69	879.48	955.95	76.48	8	1
53	43	70	250.89	272.71	21.82	8	0
52	18	72	92.37	101.50	9.14	9	1
58	23	73	2513.89	2646.20	132.32	5	1
55	14	74	4386.47	4767.90	381.44	8	0
51	35	75	662.73	697.61	34.89	5	0
59	50	77	8354.72	8888.00	533.28	6	1
59	14	78	2217.08	2383.95	166.88	7	1
53	22	79	4686.55	5039.31	352.76	7	1
54	24	80	131.01	137.91	6.90	5	1
53	38	81	2183.74	2348.10	164.37	7	1
55	16	84	1250.30	1316.10	65.81	5	1
58	10	85	830.64	883.66	53.02	6	0
57	11	87	1123.32	1221.00	97.69	8	0
57	25	88	221.86	241.16	19.30	8	1
54	24	89	124.12	137.91	13.80	10	1
55	33	90	544.05	585.00	40.96	7	1
52	36	91	5114.63	5499.61	384.98	7	1
53	36	92	4475.30	4812.16	336.86	7	0
55	36	93	3918.47	4124.71	206.24	5	0
55	34	94	1159.16	1273.81	114.65	9	1
52	13	97	2052.11	2230.55	178.45	8	0
58	27	100	268.37	291.70	23.34	8	1
58	49	101	1085.86	1193.25	107.40	9	1
59	45	102	1480.50	1575.00	94.50	6	1
51	32	103	276.68	297.50	20.83	7	0
58	48	104	67.32	74.80	7.49	10	0
52	22	105	2620.44	2879.60	259.17	9	0
54	36	108	639.33	687.46	48.13	7	1
58	19	109	44.47	49.40	4.95	10	0
52	37	110	1562.50	1736.10	173.62	10	0
52	11	111	1684.99	1831.50	146.53	8	0
53	38	112	1440.17	1565.40	125.24	8	1
53	13	113	2421.74	2549.20	127.46	5	1
52	15	114	861.55	946.75	85.21	9	1
55	46	115	1472.93	1601.00	128.09	8	1
53	29	116	1290.15	1358.05	67.91	5	0
58	26	119	7497.77	8330.86	833.09	10	0
57	33	120	1597.05	1755.00	157.95	9	0
52	12	121	369.71	393.31	23.60	6	0
57	33	122	926.25	975.00	48.75	5	0
55	20	123	1702.93	1851.00	148.09	8	1
59	31	124	10751.60	11560.86	809.26	7	0
59	49	125	1756.47	1909.21	152.74	8	0
51	32	126	1258.43	1338.75	80.33	6	1
51	31	127	15194.27	16515.50	1321.25	8	0
54	34	128	394.88	424.61	29.73	7	0
55	44	129	1271.81	1382.40	110.60	8	0
59	17	130	434.20	457.05	22.86	5	1
53	19	131	162.53	172.91	10.38	6	0
54	10	132	830.64	883.66	53.02	6	0
59	42	133	164.27	174.75	10.49	6	1
59	39	134	11754.72	13060.80	1306.08	10	1
57	18	135	94.40	101.50	7.11	7	0
52	36	136	653.08	687.46	34.38	5	1
51	41	137	5807.32	6178.00	370.69	6	1
53	40	138	10362.61	11514.00	1151.41	10	0
55	36	139	3093.53	3437.25	343.73	10	1
59	43	140	84.54	90.91	6.37	7	0
51	22	141	5298.47	5759.20	460.74	8	0
54	19	142	181.80	197.60	15.81	8	0
55	10	143	1876.29	2061.85	185.57	9	1
53	28	144	2040.99	2148.41	107.43	5	1
51	10	145	1340.21	1472.75	132.55	9	0
54	43	147	690.85	727.21	36.37	5	1
53	10	148	2491.90	2650.96	159.06	6	0
56	28	149	2470.67	2685.50	214.85	8	1
56	44	150	1167.36	1228.80	61.44	5	1
55	41	151	2780.10	3089.00	308.91	10	1
55	18	153	188.79	203.00	14.22	7	1
52	32	154	138.34	148.75	10.42	7	0
54	22	155	4636.16	5039.31	403.15	8	1
58	28	156	988.27	1074.21	85.94	8	1
58	17	158	700.82	761.75	60.94	8	0
59	12	159	162.57	174.81	12.24	7	1
56	42	160	650.07	699.00	48.94	7	0
52	21	161	5466.31	5877.75	411.45	7	0
59	22	162	3419.53	3599.50	179.98	5	1
56	19	163	112.39	123.50	11.12	9	1
57	38	165	1734.99	1826.30	91.32	5	0
57	39	166	1534.65	1632.60	97.96	6	1
52	18	167	18.68	20.31	1.63	8	0
53	42	168	1258.21	1398.00	139.81	10	0
53	27	169	536.73	583.40	46.68	8	0
58	23	170	5953.95	6615.50	661.56	10	0
51	13	171	1449.86	1593.25	143.40	9	0
56	49	172	1360.31	1431.91	71.60	5	1
53	31	173	7762.29	8257.75	495.47	6	1
57	39	174	3003.99	3265.20	261.22	8	0
57	47	176	3114.46	3460.50	346.06	10	0
52	30	177	274.46	301.61	27.15	9	1
58	30	178	407.17	452.41	45.25	10	0
58	38	180	1661.94	1826.30	164.37	9	1
52	15	181	513.95	541.00	27.06	5	0
54	35	182	1428.34	1569.61	141.27	9	0
53	12	183	164.32	174.81	10.49	6	0
58	39	184	2938.68	3265.20	326.52	10	0
52	34	185	1931.94	2123.00	191.07	9	0
58	38	186	2400.29	2609.00	208.72	8	0
55	39	187	2938.68	3265.20	326.52	10	1
52	49	188	1718.28	1909.21	190.93	10	1
58	30	189	277.48	301.61	24.13	8	0
55	47	190	3218.27	3460.50	242.24	7	0
56	34	192	382.15	424.61	42.47	10	0
53	43	193	769.02	818.11	49.09	6	0
58	48	196	673.21	748.00	74.80	10	1
58	15	197	871.01	946.75	75.74	8	0
59	49	198	2147.85	2386.50	238.66	10	0
57	12	199	39.34	43.71	4.38	10	0
53	33	201	1482.00	1560.00	78.00	5	1
51	14	202	4386.47	4767.90	381.44	8	1
59	30	203	1387.37	1508.00	120.65	8	0
56	37	204	2473.95	2604.15	130.21	5	0
56	38	207	1440.17	1565.40	125.24	8	0
51	39	208	3101.94	3265.20	163.26	5	0
54	32	209	1231.66	1338.75	107.11	8	0
52	27	210	2712.81	2917.00	204.20	7	1
56	17	211	822.69	914.10	91.41	10	1
51	13	212	2294.28	2549.20	254.92	10	1
52	18	213	184.74	203.00	18.27	9	0
55	38	214	1941.10	2087.20	146.11	7	1
52	43	215	507.23	545.41	38.18	7	1
59	40	216	1324.12	1439.25	115.15	8	0
58	47	217	2099.37	2307.00	207.63	9	0
52	30	218	716.30	754.00	37.71	5	1
52	29	219	2444.49	2716.10	271.62	10	0
54	10	220	2650.96	2945.50	294.56	10	0
56	43	221	84.54	90.91	6.37	7	0
55	45	222	2608.21	2835.00	226.81	8	1
56	20	223	567.64	617.00	49.36	8	1
53	21	224	4467.09	4702.20	235.12	5	1
53	13	225	1159.89	1274.60	114.72	9	0
59	26	226	6960.89	7405.20	444.32	6	1
57	28	227	2040.99	2148.41	107.43	5	0
56	45	229	2579.85	2835.00	255.15	9	1
56	25	230	310.06	344.50	34.46	10	0
54	14	231	6436.67	7151.85	715.19	10	1
59	45	232	1480.50	1575.00	94.50	6	0
54	17	233	548.47	609.40	60.94	10	1
58	24	234	376.47	413.71	37.24	9	1
52	15	235	615.39	676.25	60.87	9	0
56	34	236	403.38	424.61	21.24	5	0
51	40	237	3972.34	4317.75	345.43	8	0
57	21	239	5407.54	5877.75	470.23	8	1
51	17	241	138.64	152.35	13.72	9	0
57	34	242	1974.39	2123.00	148.62	7	1
58	18	243	151.04	162.41	11.37	7	0
51	31	246	10520.38	11560.86	1040.48	9	1
52	39	247	6073.28	6530.40	457.13	7	1
59	34	248	605.06	636.91	31.85	5	1
54	46	249	368.24	400.25	32.03	8	0
53	34	250	199.57	212.31	12.74	6	1
57	26	1	870.12	925.65	55.54	6	0
58	13	2	1481.73	1593.25	111.53	7	0
53	35	3	1135.35	1220.80	85.46	7	0
59	16	4	824.76	877.40	52.65	6	0
55	34	5	806.75	849.21	42.47	5	1
54	28	6	1976.53	2148.41	171.88	8	1
59	14	7	1430.37	1589.30	158.94	10	1
58	27	8	2193.59	2333.60	140.02	6	1
53	49	10	680.16	715.96	35.80	5	1
52	19	11	139.31	148.20	8.90	6	1
57	48	12	137.64	149.60	11.97	8	1
58	38	13	2136.78	2348.10	211.33	9	1
54	39	14	6073.28	6530.40	457.13	7	1
53	34	15	1528.57	1698.41	169.85	10	1
51	17	17	693.20	761.75	68.56	9	0
53	38	18	2452.47	2609.00	156.54	6	1
58	26	19	7034.94	7405.20	370.26	5	0
58	46	20	1140.72	1200.75	60.04	5	0
56	30	22	429.79	452.41	22.63	5	0
59	10	23	1107.51	1178.21	70.70	6	1
55	18	24	18.27	20.31	2.04	10	1
59	28	25	2524.37	2685.50	161.13	6	1
59	48	27	137.64	149.60	11.97	8	1
57	34	28	955.36	1061.50	106.16	10	1
55	21	29	4279.01	4702.20	423.20	9	0
56	19	30	89.91	98.80	8.90	9	0
55	13	32	2638.43	2867.85	229.43	8	1
55	31	33	15359.42	16515.50	1156.09	7	0
57	50	34	4999.50	5555.00	555.50	10	0
52	14	36	4386.47	4767.90	381.44	8	0
54	31	38	10751.60	11560.86	809.26	7	1
59	35	39	793.52	872.00	78.49	9	0
58	15	40	508.54	541.00	32.47	6	0
58	37	41	3229.15	3472.20	243.06	7	1
57	21	42	5525.09	5877.75	352.67	6	0
55	46	43	1801.13	2001.25	200.13	10	1
53	36	44	5630.22	6187.06	556.84	9	1
57	47	45	7267.06	8074.50	807.46	10	1
57	15	46	642.44	676.25	33.82	5	0
55	48	47	269.28	299.20	29.93	10	0
54	43	48	490.87	545.41	54.55	10	0
51	38	50	1961.97	2087.20	125.24	6	1
52	42	51	954.14	1048.50	94.37	9	0
58	50	52	2044.25	2222.00	177.76	8	0
58	42	53	830.07	873.75	43.69	5	0
56	42	54	1314.12	1398.00	83.88	6	1
57	22	55	3239.56	3599.50	359.96	10	1
56	37	56	4036.44	4340.25	303.82	7	0
52	34	57	2016.85	2123.00	106.16	5	1
58	16	58	1855.71	1974.15	118.45	6	1
54	26	60	3517.47	3702.60	185.13	5	0
56	24	61	444.04	482.66	38.62	8	0
58	10	63	2191.46	2356.41	164.95	7	0
54	41	64	2780.10	3089.00	308.91	10	0
56	21	66	4326.03	4702.20	376.18	8	1
56	26	68	879.37	925.65	46.29	5	0
56	19	69	117.33	123.50	6.18	5	0
58	38	71	2374.20	2609.00	234.82	9	1
51	12	72	278.37	305.91	27.54	9	1
55	49	75	1536.91	1670.55	133.65	8	0
57	26	76	7747.70	8330.86	583.16	7	0
59	30	77	950.05	1055.61	105.57	10	1
51	47	78	4152.61	4614.00	461.41	10	0
57	46	80	1092.69	1200.75	108.07	9	0
55	23	81	5418.10	5953.95	535.86	9	1
55	28	82	3534.12	3759.71	225.59	6	1
51	44	83	282.63	307.20	24.58	8	1
52	17	84	572.84	609.40	36.57	6	1
57	50	85	10221.21	11110.00	888.81	8	0
59	46	88	1861.17	2001.25	140.09	7	1
53	33	89	544.05	585.00	40.96	7	0
59	10	90	2491.90	2650.96	159.06	6	0
56	10	91	795.29	883.66	88.37	10	0
55	49	92	1360.31	1431.91	71.60	5	0
54	37	93	7187.46	7812.45	625.00	8	0
59	17	94	700.82	761.75	60.94	8	1
58	34	96	1396.94	1486.11	89.17	6	0
55	18	98	56.64	60.91	4.27	7	0
53	26	99	7581.08	8330.86	749.78	9	1
51	10	100	559.65	589.11	29.46	5	0
57	26	101	3332.35	3702.60	370.26	10	1
55	15	102	622.15	676.25	54.11	8	1
55	18	104	92.37	101.50	9.14	9	1
58	45	105	1464.75	1575.00	110.26	7	0
52	15	106	746.59	811.50	64.93	8	0
51	10	108	1643.59	1767.31	123.72	7	0
52	40	109	5411.58	5757.00	345.42	6	1
54	42	110	964.63	1048.50	83.88	8	0
56	32	111	276.68	297.50	20.83	7	0
52	12	112	196.66	218.50	21.86	10	0
53	20	114	1159.97	1234.00	74.04	6	0
53	35	115	627.85	697.61	69.77	10	1
57	49	116	673.00	715.96	42.96	6	0
56	37	117	7265.58	7812.45	546.88	7	1
51	30	118	140.25	150.81	10.56	7	1
55	27	119	271.29	291.70	20.42	7	1
58	48	120	269.28	299.20	29.93	10	1
54	23	123	6152.42	6615.50	463.09	7	1
52	36	124	3196.65	3437.25	240.61	7	0
56	50	125	8354.72	8888.00	533.28	6	0
57	21	126	1093.27	1175.55	82.29	7	0
56	25	127	310.06	344.50	34.46	10	1
56	35	128	655.75	697.61	41.86	6	1
57	19	129	92.88	98.80	5.93	6	0
56	12	131	361.84	393.31	31.47	8	0
54	27	132	2654.48	2917.00	262.53	9	0
55	19	133	23.47	24.70	1.24	5	0
57	42	135	1572.75	1747.50	174.75	10	0
52	48	136	695.64	748.00	52.37	7	1
52	50	137	2999.71	3333.00	333.31	10	1
53	21	139	10815.07	11755.50	940.45	8	1
59	33	140	370.50	390.00	19.50	5	0
58	39	141	15346.44	16326.00	979.56	6	1
57	20	142	2838.21	3085.00	246.81	8	1
54	19	143	92.88	98.80	5.93	6	0
59	19	144	140.79	148.20	7.42	5	0
56	23	145	4306.70	4630.85	324.16	7	0
57	43	146	760.84	818.11	57.27	7	0
57	16	147	206.19	219.35	13.17	6	0
59	27	148	2100.24	2333.60	233.37	10	1
53	20	149	1110.61	1234.00	123.41	10	1
52	29	150	7659.41	8148.30	488.90	6	1
55	15	151	254.27	270.50	16.24	6	0
52	36	152	1264.91	1374.91	110.00	8	0
51	23	153	1256.95	1323.10	66.16	5	0
59	18	154	192.85	203.00	10.16	5	0
54	29	155	1222.25	1358.05	135.81	10	1
58	11	156	4542.12	4884.00	341.89	7	1
54	47	157	5421.45	5767.50	346.06	6	0
58	28	158	2900.35	3222.61	322.27	10	0
57	42	159	160.78	174.75	13.99	8	1
57	43	160	172.72	181.81	9.10	5	0
57	12	162	246.47	262.21	15.74	6	0
57	28	163	4995.03	5371.00	375.98	7	1
55	46	165	2257.41	2401.50	144.10	6	0
59	11	167	1147.75	1221.00	73.26	6	1
57	38	168	970.55	1043.60	73.06	7	1
54	38	169	704.43	782.70	78.27	10	0
54	19	170	69.66	74.10	4.45	6	0
56	12	171	39.77	43.71	3.94	9	1
57	18	172	192.85	203.00	10.16	5	0
56	45	173	2898.00	3150.00	252.00	8	0
57	45	174	1984.50	2205.00	220.50	10	0
52	25	175	96.12	103.36	7.24	7	1
56	28	176	2416.96	2685.50	268.56	10	0
51	15	177	746.59	811.50	64.93	8	0
52	24	178	327.52	344.75	17.24	5	1
58	13	179	2096.72	2230.55	133.84	6	0
53	49	180	453.44	477.31	23.87	5	1
58	19	182	224.78	247.00	22.24	9	0
59	31	183	9116.56	9909.30	792.75	8	1
54	22	185	2051.72	2159.70	107.99	5	0
54	10	186	1876.29	2061.85	185.57	9	0
51	42	187	803.86	873.75	69.91	8	1
55	21	188	2186.53	2351.10	164.58	7	0
51	37	190	7812.45	8680.50	868.06	10	0
51	15	191	497.73	541.00	43.29	8	1
58	19	192	70.40	74.10	3.71	5	1
59	43	195	165.44	181.81	16.37	9	1
52	24	196	124.12	137.91	13.80	10	0
51	48	197	680.69	748.00	67.32	9	0
59	10	198	2167.89	2356.41	188.52	8	0
52	28	199	1998.02	2148.41	150.39	7	1
58	37	201	7109.33	7812.45	703.13	9	1
58	29	202	11000.21	12222.45	1222.25	10	1
59	27	203	1356.41	1458.50	102.10	7	0
55	43	205	501.77	545.41	43.64	8	1
52	18	206	18.68	20.31	1.63	8	0
51	28	207	3910.09	4296.81	386.72	9	1
57	46	208	364.23	400.25	36.03	9	0
58	41	210	3373.19	3706.80	333.62	9	0
59	13	211	1185.38	1274.60	89.23	7	0
56	12	212	164.32	174.81	10.49	6	0
54	13	213	2052.11	2230.55	178.45	8	1
55	11	214	3846.16	4273.50	427.36	10	0
58	29	215	5051.95	5432.20	380.26	7	1
54	22	217	2620.44	2879.60	259.17	9	1
59	27	218	268.37	291.70	23.34	8	1
56	21	219	9733.56	10579.95	846.40	8	0
55	28	220	504.88	537.11	32.23	6	0
53	27	221	1662.69	1750.20	87.51	5	1
52	44	222	1155.08	1228.80	73.73	6	1
55	15	224	251.57	270.50	18.94	7	1
51	24	227	627.45	689.50	62.06	9	0
54	32	228	676.82	743.75	66.94	9	1
57	15	231	635.68	676.25	40.58	6	0
57	16	232	1596.87	1754.80	157.94	9	0
56	18	233	57.86	60.91	3.05	5	0
53	18	234	95.41	101.50	6.09	6	0
54	38	235	237.42	260.90	23.49	9	0
51	11	236	1648.36	1831.50	183.16	10	1
57	41	238	568.38	617.80	49.43	8	1
56	16	239	618.57	658.05	39.49	6	1
53	10	241	2215.02	2356.41	141.39	6	1
54	27	242	787.59	875.10	87.51	10	0
53	14	243	6436.67	7151.85	715.19	10	0
56	30	244	554.95	603.21	48.26	8	1
54	27	246	542.57	583.40	40.84	7	1
59	18	247	18.68	20.31	1.63	8	1
58	20	249	573.81	617.00	43.20	7	1
59	42	250	1625.18	1747.50	122.33	7	0
56	29	1	10103.90	10864.40	760.51	7	0
59	26	2	2554.80	2776.95	222.16	8	0
55	22	3	1324.62	1439.80	115.19	8	0
55	18	4	133.58	142.10	8.53	6	1
52	43	5	259.07	272.71	13.64	5	0
59	33	7	538.21	585.00	46.81	8	1
51	45	9	1464.75	1575.00	110.26	7	0
56	39	10	12407.76	13060.80	653.04	5	0
59	20	11	3479.88	3702.00	222.13	6	1
56	28	12	4887.62	5371.00	483.39	9	0
57	28	13	4039.00	4296.81	257.81	6	1
53	33	14	733.20	780.00	46.80	6	1
58	13	15	1449.86	1593.25	143.40	9	0
51	13	16	2052.11	2230.55	178.45	8	0
53	35	17	497.05	523.21	26.17	5	0
59	28	18	1976.53	2148.41	171.88	8	0
52	12	19	332.13	349.61	17.49	5	1
52	28	21	1482.40	1611.31	128.91	8	0
51	31	22	11891.16	13212.40	1321.25	10	1
59	46	23	2945.85	3202.00	256.17	8	0
58	31	24	10867.20	11560.86	693.66	6	0
53	20	25	2807.35	3085.00	277.65	9	0
56	45	26	2636.55	2835.00	198.46	7	0
53	11	27	1703.30	1831.50	128.21	7	0
54	28	28	1020.50	1074.21	53.72	5	1
59	46	29	720.46	800.50	80.06	10	0
57	22	30	1367.81	1439.80	71.99	5	0
56	10	31	1855.67	2061.85	206.19	10	0
56	32	32	136.85	148.75	11.91	8	0
51	47	33	2191.66	2307.00	115.36	5	0
53	42	35	157.28	174.75	17.48	10	0
56	38	36	1487.13	1565.40	78.27	5	1
51	24	37	634.35	689.50	55.17	8	0
53	43	38	496.32	545.41	49.09	9	0
56	43	39	85.45	90.91	5.46	6	1
52	39	41	13664.87	14693.40	1028.54	7	1
56	18	43	73.90	81.21	7.31	9	1
58	19	45	155.62	172.91	17.30	10	0
57	39	46	7346.70	8163.00	816.31	10	1
57	24	47	620.56	689.50	68.96	10	1
54	40	48	5354.01	5757.00	403.00	7	0
54	45	49	1159.21	1260.00	100.80	8	0
56	14	51	6508.19	7151.85	643.67	9	1
57	11	52	2197.81	2442.00	244.21	10	0
54	48	53	204.21	224.40	20.20	9	1
53	46	56	1472.93	1601.00	128.09	8	0
51	21	57	1081.51	1175.55	94.05	8	0
57	41	58	1136.76	1235.60	98.85	8	0
58	50	59	3166.35	3333.00	166.66	5	1
54	50	61	3066.37	3333.00	266.64	8	1
52	12	62	357.91	393.31	35.40	9	1
51	30	63	693.69	754.00	60.33	8	0
53	32	64	1106.70	1190.00	83.31	7	0
56	33	65	538.21	585.00	46.81	8	1
55	48	66	673.21	748.00	74.80	10	0
52	27	67	1050.12	1166.80	116.69	10	0
51	18	68	133.58	142.10	8.53	6	1
59	46	69	736.47	800.50	64.05	8	0
52	33	70	1242.16	1365.00	122.85	9	0
54	37	71	2473.95	2604.15	130.21	5	1
51	48	72	605.88	673.20	67.32	10	0
51	28	74	488.77	537.11	48.34	9	1
53	27	75	1341.83	1458.50	116.69	8	0
54	26	76	8330.86	9256.50	925.66	10	1
56	50	77	10221.21	11110.00	888.81	8	0
53	10	78	1369.66	1472.75	103.10	7	0
53	15	80	622.15	676.25	54.11	8	1
51	21	81	8840.14	9404.40	564.27	6	1
53	49	82	1813.75	1909.21	95.47	5	0
58	29	83	9886.61	10864.40	977.80	9	0
53	49	84	1097.79	1193.25	95.47	8	0
58	13	85	2370.76	2549.20	178.45	7	1
54	36	86	3196.65	3437.25	240.61	7	0
54	48	87	412.90	448.80	35.91	8	0
59	49	89	1503.50	1670.55	167.06	10	0
54	33	90	926.25	975.00	48.75	5	0
59	27	91	1108.46	1166.80	58.35	5	0
59	11	92	4444.45	4884.00	439.57	9	0
51	21	93	11050.18	11755.50	705.33	6	0
58	40	95	7944.67	8635.50	690.85	8	0
58	24	96	131.01	137.91	6.90	5	1
51	28	97	2524.37	2685.50	161.13	6	1
57	35	98	491.81	523.21	31.40	6	0
51	39	99	15509.70	16326.00	816.31	5	1
53	38	100	1961.97	2087.20	125.24	6	1
56	31	101	9314.75	9909.30	594.56	6	0
59	40	102	10823.16	11514.00	690.84	6	0
59	40	103	13528.95	14392.50	863.55	6	0
54	45	104	2293.21	2520.00	226.80	9	1
57	28	105	3953.06	4296.81	343.75	8	0
55	13	106	2396.25	2549.20	152.96	6	0
57	40	108	4058.69	4317.75	259.07	6	1
57	29	109	10321.18	10864.40	543.23	5	0
58	24	110	253.74	275.81	22.07	8	0
53	27	111	831.35	875.10	43.76	5	0
57	11	112	2222.23	2442.00	219.79	9	0
54	14	113	5975.77	6357.20	381.44	6	1
56	40	115	1367.29	1439.25	71.97	5	0
58	24	116	589.53	620.56	31.03	5	0
52	46	117	2661.67	2801.75	140.09	5	1
51	48	118	340.35	374.00	33.66	9	0
58	27	119	530.90	583.40	52.51	9	1
55	10	120	1608.25	1767.31	159.06	9	1
51	30	121	554.95	603.21	48.26	8	0
57	46	122	1080.68	1200.75	120.08	10	0
51	40	123	11916.99	12953.25	1036.26	8	1
58	39	124	12407.76	13060.80	653.04	5	0
53	30	125	429.79	452.41	22.63	5	0
53	38	126	2452.47	2609.00	156.54	6	1
52	42	127	1462.66	1572.75	110.10	7	1
52	41	128	1705.13	1853.40	148.28	8	1
59	50	129	1033.24	1111.00	77.78	7	1
55	38	130	495.71	521.80	26.09	5	0
56	33	131	1088.10	1170.00	81.91	7	0
59	38	132	1226.24	1304.50	78.27	6	1
53	23	133	3043.14	3307.75	264.63	8	0
51	43	136	253.62	272.71	19.09	7	1
57	32	137	410.56	446.25	35.71	8	0
59	34	139	585.95	636.91	50.96	8	0
59	18	140	57.25	60.91	3.66	6	0
53	28	141	1955.05	2148.41	193.36	9	0
57	41	142	1723.67	1853.40	129.74	7	0
59	45	143	2318.41	2520.00	201.60	8	1
53	50	145	6999.31	7777.00	777.71	10	0
53	23	147	1845.73	1984.65	138.93	7	0
51	44	148	875.52	921.60	46.08	5	0
57	29	150	12629.87	13580.50	950.64	7	0
59	29	152	2444.49	2716.10	271.62	10	1
54	18	153	114.50	121.81	7.31	6	1
55	41	154	3373.19	3706.80	333.62	9	0
59	13	155	2581.07	2867.85	286.79	10	1
54	12	156	160.82	174.81	13.99	8	1
58	27	158	1096.80	1166.80	70.01	6	0
53	14	160	2892.53	3178.60	286.08	9	1
58	49	161	658.68	715.96	57.28	8	0
59	43	162	769.02	818.11	49.09	6	1
55	23	164	628.48	661.55	33.08	5	0
52	29	165	2444.49	2716.10	271.62	10	0
54	26	166	4165.43	4628.25	462.83	10	0
59	44	167	1155.08	1228.80	73.73	6	0
53	21	168	7735.12	8228.86	493.74	6	0
54	48	169	210.94	224.40	13.47	6	0
59	21	170	8934.18	9404.40	470.23	5	0
57	35	171	828.40	872.00	43.61	5	0
51	25	172	219.45	241.16	21.71	9	1
54	32	173	279.65	297.50	17.85	6	0
52	39	174	7346.70	8163.00	816.31	10	0
54	44	177	571.40	614.40	43.01	7	1
53	13	180	302.72	318.65	15.94	5	0
53	22	183	1986.93	2159.70	172.78	8	1
52	50	184	9299.07	9999.00	699.94	7	1
58	11	187	2838.83	3052.50	213.68	7	0
58	46	188	1440.91	1601.00	160.11	10	0
56	12	189	123.24	131.11	7.87	6	1
57	30	190	1357.21	1508.00	150.81	10	1
52	29	191	3870.45	4074.15	203.71	5	0
52	44	192	978.44	1075.21	96.77	9	0
51	25	193	31.35	34.46	3.11	9	0
59	14	195	1446.27	1589.30	143.04	9	0
54	20	196	5053.24	5553.00	499.77	9	1
52	47	197	1072.76	1153.50	80.75	7	1
57	47	198	10727.55	11535.00	807.46	7	1
53	40	200	2705.79	2878.50	172.71	6	1
55	30	201	542.89	603.21	60.33	10	0
56	16	202	1041.92	1096.75	54.84	5	1
56	20	203	4689.20	4936.00	246.81	5	1
55	50	204	2022.02	2222.00	199.98	9	1
58	11	205	1135.53	1221.00	85.48	7	1
53	12	206	365.77	393.31	27.54	7	0
58	24	209	125.49	137.91	12.42	9	1
58	36	210	3162.27	3437.25	274.99	8	0
58	10	211	2465.39	2650.96	185.57	7	0
55	31	213	15524.57	16515.50	990.93	6	1
51	33	214	1435.21	1560.00	124.80	8	0
51	41	215	1705.13	1853.40	148.28	8	0
53	28	216	3029.25	3222.61	193.36	6	1
54	33	217	1482.00	1560.00	78.00	5	0
51	16	218	2018.02	2193.50	175.48	8	0
59	38	220	2348.10	2609.00	260.91	10	0
56	15	222	1230.78	1352.50	121.73	9	0
58	23	223	3770.84	3969.30	198.47	5	0
53	27	224	2216.92	2333.60	116.69	5	0
56	42	226	1137.63	1223.25	85.63	7	0
56	29	227	8555.72	9506.36	950.64	10	0
53	40	228	10938.30	11514.00	575.71	5	0
54	41	229	1723.67	1853.40	129.74	7	1
53	17	230	280.33	304.70	24.38	8	0
51	37	231	6319.41	6944.40	625.00	9	0
59	41	232	3935.39	4324.60	389.22	9	0
55	39	233	15509.70	16326.00	816.31	5	1
55	24	235	627.45	689.50	62.06	9	0
57	13	237	1210.87	1274.60	63.73	5	0
54	32	238	553.35	595.00	41.66	7	1
52	29	239	8555.72	9506.36	950.64	10	1
58	20	240	1135.28	1234.00	98.72	8	0
59	13	241	605.44	637.30	31.87	5	0
57	12	242	82.16	87.41	5.25	6	0
57	29	243	1290.15	1358.05	67.91	5	0
58	30	244	693.69	754.00	60.33	8	0
58	38	245	2207.22	2348.10	140.89	6	0
52	48	246	417.39	448.80	31.42	7	0
55	16	249	206.19	219.35	13.17	6	0
51	39	250	4408.02	4897.80	489.78	10	0
53	49	3	1954.55	2147.85	193.31	9	0
55	19	4	44.47	49.40	4.95	10	1
52	18	5	55.42	60.91	5.49	9	0
55	40	6	6548.59	7196.25	647.67	9	1
54	34	7	781.27	849.21	67.94	8	1
54	25	8	196.37	206.71	10.34	5	0
55	29	9	9031.04	9506.36	475.32	5	1
55	15	10	503.13	541.00	37.88	7	0
58	27	11	542.57	583.40	40.84	7	0
52	29	14	2553.14	2716.10	162.97	6	0
55	37	16	7109.33	7812.45	703.13	9	0
53	43	17	163.63	181.81	18.19	10	1
58	19	19	187.72	197.60	9.89	5	1
51	37	20	824.65	868.05	43.41	5	0
58	25	21	282.15	310.06	27.91	9	1
53	12	22	410.78	437.00	26.22	6	0
56	26	23	833.09	925.65	92.57	10	0
55	20	24	2319.93	2468.00	148.08	6	1
51	18	25	146.16	162.41	16.25	10	1
57	46	26	3682.31	4002.50	320.20	8	0
55	38	28	245.25	260.90	15.66	6	0
57	45	30	567.00	630.00	63.00	10	1
51	11	31	3888.89	4273.50	384.62	9	1
51	19	32	183.77	197.60	13.84	7	1
55	42	34	498.04	524.25	26.22	5	1
58	35	35	320.90	348.81	27.91	8	0
55	28	37	4887.62	5371.00	483.39	9	1
54	28	38	3061.48	3222.61	161.14	5	0
56	17	39	1157.86	1218.80	60.94	5	0
54	12	40	353.98	393.31	39.34	10	0
52	38	42	2452.47	2609.00	156.54	6	1
59	41	43	5807.32	6178.00	370.69	6	1
56	14	44	5975.77	6357.20	381.44	6	0
57	21	45	7652.84	8228.86	576.02	7	1
56	19	46	179.82	197.60	17.79	9	0
53	32	47	565.25	595.00	29.75	5	1
57	18	49	152.66	162.41	9.75	6	1
51	30	50	407.17	452.41	45.25	10	1
57	20	52	1135.28	1234.00	98.72	8	0
59	30	53	560.98	603.21	42.23	7	0
59	40	54	9571.02	10074.75	503.74	5	0
57	32	56	1106.70	1190.00	83.31	7	0
53	48	57	632.81	673.20	40.40	6	0
51	46	58	3041.90	3202.00	160.11	5	0
54	47	59	8305.21	9228.00	922.81	10	0
59	40	60	7944.67	8635.50	690.85	8	1
51	45	61	567.00	630.00	63.00	10	1
52	26	62	8793.68	9256.50	462.83	5	0
53	12	63	284.49	305.91	21.42	7	1
51	48	66	703.13	748.00	44.88	6	0
56	32	67	565.25	595.00	29.75	5	0
54	22	70	5183.28	5759.20	575.92	10	1
54	20	71	4016.67	4319.00	302.34	7	0
52	13	72	908.16	955.95	47.80	5	1
52	11	73	5000.00	5494.50	494.51	9	0
54	39	74	15509.70	16326.00	816.31	5	0
59	32	75	691.69	743.75	52.07	7	0
51	34	76	1197.38	1273.81	76.43	6	0
53	39	77	9011.96	9795.60	783.65	8	0
53	27	78	1341.83	1458.50	116.69	8	1
51	31	79	1486.40	1651.55	165.16	10	1
57	13	80	1497.66	1593.25	95.60	6	0
59	29	82	12765.68	13580.50	814.83	6	0
53	37	83	3949.63	4340.25	390.63	9	1
58	31	84	1502.92	1651.55	148.64	9	1
51	23	85	4974.86	5292.40	317.55	6	0
51	28	87	4995.03	5371.00	375.98	7	1
51	12	88	82.16	87.41	5.25	6	1
51	23	89	5418.10	5953.95	535.86	9	1
53	35	90	828.40	872.00	43.61	5	1
54	22	91	6695.07	7199.00	503.94	7	0
55	21	92	2186.53	2351.10	164.58	7	1
54	46	93	2233.40	2401.50	168.11	7	1
59	34	94	955.36	1061.50	106.16	10	0
54	50	95	8443.61	8888.00	444.41	5	1
56	15	96	615.39	676.25	60.87	9	0
56	19	98	234.65	247.00	12.36	5	0
58	17	99	693.20	761.75	68.56	9	1
55	39	100	1534.65	1632.60	97.96	6	0
51	37	101	2343.74	2604.15	260.42	10	0
55	46	102	736.47	800.50	64.05	8	0
51	39	103	13958.73	14693.40	734.68	5	1
59	13	104	605.44	637.30	31.87	5	1
53	42	108	1286.17	1398.00	111.85	8	0
59	13	109	2867.85	3186.50	318.66	10	0
55	16	110	605.41	658.05	52.65	8	1
55	39	111	11754.72	13060.80	1306.08	10	0
58	11	112	2246.64	2442.00	195.37	8	1
59	20	114	4442.41	4936.00	493.61	10	0
53	41	115	5869.10	6178.00	308.91	5	0
53	19	116	67.44	74.10	6.67	9	0
52	36	117	2502.32	2749.81	247.49	9	1
52	40	118	5181.31	5757.00	575.71	10	1
55	50	120	3133.02	3333.00	199.98	6	1
51	43	121	345.43	363.61	18.19	5	1
59	32	125	691.69	743.75	52.07	7	1
53	44	126	1285.64	1382.40	96.77	7	0
55	44	127	999.94	1075.21	75.27	7	0
53	43	128	327.25	363.61	36.37	10	0
53	39	129	15509.70	16326.00	816.31	5	0
57	46	130	1104.70	1200.75	96.07	8	0
55	16	131	1667.06	1754.80	87.75	5	1
55	38	132	1982.84	2087.20	104.36	5	1
53	18	133	36.95	40.61	3.66	9	1
58	29	134	11244.66	12222.45	977.80	8	0
58	15	135	381.41	405.75	24.35	6	0
52	13	137	1778.07	1911.90	133.84	7	0
56	32	138	1218.27	1338.75	120.49	9	0
55	41	140	4547.01	4942.40	395.40	8	0
53	41	142	5745.54	6178.00	432.47	7	0
54	35	143	313.93	348.81	34.89	10	0
58	31	144	10404.77	11560.86	1156.09	10	0
53	21	145	6559.57	7053.30	493.74	7	1
56	28	146	2443.81	2685.50	241.70	9	0
52	48	147	136.14	149.60	13.47	9	1
51	14	148	5117.55	5562.56	445.01	8	1
56	20	149	561.48	617.00	55.54	9	1
52	50	150	2110.91	2222.00	111.11	5	0
57	43	151	598.13	636.31	38.18	6	1
56	11	152	561.66	610.50	48.85	8	0
59	20	153	586.15	617.00	30.86	5	0
52	36	154	3918.47	4124.71	206.24	5	1
52	11	155	555.56	610.50	54.95	9	1
57	32	157	419.48	446.25	26.78	6	1
54	19	158	234.65	247.00	12.36	5	0
52	36	159	5630.22	6187.06	556.84	9	1
59	50	161	8088.08	8888.00	799.92	9	1
51	24	162	310.28	344.75	34.48	10	0
56	45	163	1480.50	1575.00	94.50	6	0
56	50	164	6132.73	6666.00	533.28	8	1
55	24	165	190.31	206.86	16.55	8	0
51	17	166	144.74	152.35	7.62	5	0
55	30	167	283.51	301.61	18.10	6	1
56	37	168	781.25	868.05	86.81	10	0
57	28	169	4350.52	4833.91	483.40	10	1
57	35	170	1412.65	1569.61	156.97	10	0
52	33	171	733.20	780.00	46.80	6	1
58	45	172	2664.90	2835.00	170.10	6	0
51	43	173	744.48	818.11	73.63	9	0
57	25	174	155.03	172.25	17.23	10	0
59	49	175	1775.56	1909.21	133.65	7	0
56	48	176	639.54	673.20	33.66	5	1
53	34	177	585.95	636.91	50.96	8	1
59	18	178	149.41	162.41	13.00	8	0
59	39	180	9109.91	9795.60	685.70	7	0
55	46	181	2977.86	3202.00	224.15	7	1
56	18	182	56.64	60.91	4.27	7	1
54	38	183	1424.52	1565.40	140.89	9	1
52	13	184	1497.66	1593.25	95.60	6	1
59	31	186	10404.77	11560.86	1156.09	10	0
57	12	187	40.65	43.71	3.06	7	1
52	39	188	7754.85	8163.00	408.16	5	1
58	33	189	1111.50	1170.00	58.50	5	1
58	10	190	2144.33	2356.41	212.08	9	1
55	46	191	3009.88	3202.00	192.13	6	0
53	14	192	3774.59	3973.25	198.67	5	0
55	43	194	259.07	272.71	13.64	5	1
51	17	195	723.67	761.75	38.09	5	0
59	34	196	1159.16	1273.81	114.65	9	0
53	50	197	10110.11	11110.00	999.90	9	0
53	47	198	7347.80	8074.50	726.71	9	0
54	15	199	1257.83	1352.50	94.68	7	0
53	45	200	2318.41	2520.00	201.60	8	0
53	49	203	680.16	715.96	35.80	5	0
56	30	204	1134.02	1206.41	72.39	6	1
56	48	205	210.94	224.40	13.47	6	0
59	19	206	179.82	197.60	17.79	9	0
58	17	207	1416.86	1523.50	106.65	7	1
56	42	208	1100.93	1223.25	122.33	10	0
51	29	210	2553.14	2716.10	162.97	6	0
51	40	212	12046.53	12953.25	906.73	7	1
59	18	214	135.00	142.10	7.11	5	0
52	47	215	2122.45	2307.00	184.57	8	1
59	19	216	227.25	247.00	19.77	8	0
58	15	217	377.35	405.75	28.41	7	0
59	47	219	1061.23	1153.50	92.29	8	1
54	39	220	7428.33	8163.00	734.67	9	0
57	35	221	1297.54	1395.21	97.67	7	1
51	34	223	764.29	849.21	84.93	10	1
52	26	224	842.35	925.65	83.31	9	1
58	50	225	4088.49	4444.00	355.52	8	0
55	30	226	1235.06	1357.21	122.15	9	0
52	18	227	130.74	142.10	11.37	8	1
58	20	229	2295.24	2468.00	172.77	7	1
56	25	230	32.73	34.46	1.73	5	1
57	19	231	200.07	222.30	22.24	10	0
58	32	233	1071.00	1190.00	119.00	10	1
58	49	234	1997.51	2147.85	150.35	7	1
59	40	235	13385.03	14392.50	1007.48	7	0
52	47	236	6298.12	6921.00	622.89	9	0
55	28	237	1482.40	1611.31	128.91	8	0
51	13	238	889.04	955.95	66.92	7	0
57	11	239	3931.63	4273.50	341.88	8	1
54	26	240	4211.71	4628.25	416.55	9	0
52	12	241	198.84	218.50	19.67	9	0
56	29	242	2444.49	2716.10	271.62	10	1
51	28	243	4592.21	4833.91	241.70	5	1
53	27	244	1341.83	1458.50	116.69	8	1
57	45	245	2006.56	2205.00	198.45	9	0
52	10	247	1354.94	1472.75	117.83	8	0
52	41	248	3892.14	4324.60	432.46	10	1
58	43	249	777.20	818.11	40.91	5	0
59	11	250	1135.53	1221.00	85.48	7	1
56	29	1	1276.57	1358.05	81.49	6	0
53	40	2	9571.02	10074.75	503.74	5	1
52	15	4	1006.26	1082.00	75.75	7	1
56	28	5	2932.57	3222.61	290.04	9	1
59	39	6	9011.96	9795.60	783.65	8	0
59	24	7	453.70	482.66	28.96	6	0
51	20	9	3887.10	4319.00	431.91	10	0
54	40	10	2619.44	2878.50	259.07	9	1
55	18	11	113.28	121.81	8.53	7	1
59	40	12	13385.03	14392.50	1007.48	7	1
55	23	14	3109.29	3307.75	198.47	6	0
56	28	15	5048.74	5371.00	322.26	6	1
55	47	16	4337.16	4614.00	276.84	6	1
52	10	17	2709.87	2945.50	235.65	8	0
53	12	18	39.77	43.71	3.94	9	0
51	23	19	1204.03	1323.10	119.08	9	0
59	22	20	2030.12	2159.70	129.59	6	0
56	22	22	1965.33	2159.70	194.38	9	1
57	33	23	1111.50	1170.00	58.50	5	1
56	13	26	2581.07	2867.85	286.79	10	0
51	28	27	1498.51	1611.31	112.80	7	0
54	48	28	471.25	523.61	52.37	10	0
58	22	29	4787.34	5039.31	251.97	5	1
59	15	30	1095.53	1217.25	121.73	10	0
59	39	31	4408.02	4897.80	489.78	10	0
56	28	32	4447.19	4833.91	386.72	8	0
57	35	35	1428.34	1569.61	141.27	9	0
54	22	36	6155.15	6479.10	323.96	5	0
54	31	37	6209.83	6606.20	396.38	6	0
56	18	38	169.92	182.71	12.79	7	0
52	42	40	812.59	873.75	61.17	7	1
58	46	42	3602.25	4002.50	400.25	10	1
55	29	44	7414.96	8148.30	733.35	9	0
54	47	45	6367.33	6921.00	553.69	8	0
52	48	46	562.50	598.40	35.91	6	0
59	41	47	2224.08	2471.20	247.13	10	0
54	11	48	555.56	610.50	54.95	9	0
52	43	49	669.03	727.21	58.18	8	1
53	24	50	384.75	413.71	28.96	7	0
58	44	52	423.94	460.80	36.87	8	0
59	10	53	536.09	589.11	53.02	9	1
56	36	54	1917.99	2062.36	144.37	7	1
51	43	56	854.46	909.00	54.54	6	1
55	29	57	4997.63	5432.20	434.58	8	0
51	28	58	494.14	537.11	42.97	8	1
59	24	59	524.02	551.61	27.59	5	1
55	37	61	2421.86	2604.15	182.30	7	0
58	15	62	1119.88	1217.25	97.38	8	0
58	50	63	7310.38	7777.00	466.63	6	0
53	16	64	1649.52	1754.80	105.29	6	0
58	17	65	144.74	152.35	7.62	5	0
58	31	66	15359.42	16515.50	1156.09	7	1
57	38	67	727.92	782.70	54.79	7	1
57	46	68	376.24	400.25	24.02	6	1
58	48	69	140.63	149.60	8.98	6	1
51	49	70	219.56	238.66	19.10	8	1
59	38	71	2452.47	2609.00	156.54	6	0
54	35	72	313.93	348.81	34.89	10	0
56	39	73	7428.33	8163.00	734.67	9	0
56	39	74	4554.96	4897.80	342.85	7	0
59	44	75	1167.36	1228.80	61.44	5	0
55	43	76	167.26	181.81	14.55	8	1
58	47	77	4244.89	4614.00	369.13	8	0
51	48	78	481.72	523.61	41.89	8	1
51	41	81	4108.37	4324.60	216.23	5	0
54	36	83	2474.83	2749.81	274.99	10	0
56	43	84	334.52	363.61	29.09	8	1
58	10	86	536.09	589.11	53.02	9	1
51	37	87	7031.21	7812.45	781.25	10	1
55	29	88	5106.27	5432.20	325.94	6	1
54	40	89	13241.11	14392.50	1151.41	8	1
55	35	90	648.77	697.61	48.84	7	0
53	10	91	1896.91	2061.85	164.95	8	1
52	12	92	198.84	218.50	19.67	9	0
52	17	94	411.35	457.05	45.71	10	0
53	26	95	4396.84	4628.25	231.42	5	0
53	43	97	690.85	727.21	36.37	5	0
54	50	98	2066.47	2222.00	155.55	7	1
51	38	99	1187.10	1304.50	117.41	9	1
56	10	100	1678.94	1767.31	88.37	5	1
51	44	101	583.68	614.40	30.72	5	0
55	30	102	283.51	301.61	18.10	6	1
57	31	103	6275.89	6606.20	330.32	5	0
55	45	104	859.96	945.00	85.05	9	1
57	27	106	262.53	291.70	29.18	10	0
58	50	107	2088.68	2222.00	133.32	6	0
58	26	108	8423.42	9256.50	833.09	9	1
56	35	109	627.85	697.61	69.77	10	1
57	10	110	1643.59	1767.31	123.72	7	0
56	41	111	5226.59	5560.20	333.62	6	1
54	23	112	3770.84	3969.30	198.47	5	1
54	26	113	7034.94	7405.20	370.26	5	0
51	18	114	184.74	203.00	18.27	9	1
59	43	117	85.45	90.91	5.46	6	1
56	27	118	2625.31	2917.00	291.70	10	1
56	29	119	2444.49	2716.10	271.62	10	1
54	35	120	481.35	523.21	41.86	8	0
54	43	121	172.72	181.81	9.10	5	1
52	14	122	1462.16	1589.30	127.15	8	0
56	42	123	164.27	174.75	10.49	6	0
58	30	124	1134.02	1206.41	72.39	6	1
52	17	125	1288.89	1371.15	82.27	6	1
59	45	126	567.00	630.00	63.00	10	0
58	43	128	427.23	454.50	27.27	6	1
58	45	129	1757.70	1890.00	132.31	7	0
52	42	130	1113.16	1223.25	110.10	9	0
59	18	133	91.36	101.50	10.16	10	0
53	37	134	3229.15	3472.20	243.06	7	1
54	40	135	10362.61	11514.00	1151.41	10	0
52	24	136	188.24	206.86	18.62	9	0
56	22	137	6839.05	7199.00	359.96	5	0
55	50	139	2066.47	2222.00	155.55	7	1
52	46	140	760.48	800.50	40.03	5	0
55	15	141	254.27	270.50	16.24	6	1
57	44	142	144.39	153.60	9.22	6	0
52	37	143	3906.23	4340.25	434.03	10	1
56	17	146	716.05	761.75	45.71	6	0
51	20	147	573.81	617.00	43.20	7	0
53	27	148	2654.48	2917.00	262.53	9	1
52	28	149	1998.02	2148.41	150.39	7	1
55	42	150	159.03	174.75	15.73	9	0
52	50	152	10443.40	11110.00	666.61	6	1
58	20	153	5861.50	6170.00	308.50	5	0
54	10	154	2518.41	2650.96	132.55	5	1
56	44	155	1105.93	1228.80	122.88	10	0
56	31	157	7597.14	8257.75	660.63	8	0
58	12	158	369.71	393.31	23.60	6	1
51	47	159	4337.16	4614.00	276.84	6	0
54	48	160	619.35	673.20	53.86	8	0
54	50	161	6199.38	6666.00	466.63	7	0
56	16	162	824.76	877.40	52.65	6	0
54	41	163	574.56	617.80	43.25	7	0
55	13	164	2931.58	3186.50	254.93	8	0
55	25	165	65.46	68.91	3.45	5	1
56	15	166	486.91	541.00	54.11	10	0
51	20	167	1147.62	1234.00	86.39	7	0
56	10	168	2709.87	2945.50	235.65	8	0
56	23	169	3770.84	3969.30	198.47	5	0
57	25	170	63.39	68.91	5.52	8	0
54	23	171	4974.86	5292.40	317.55	6	0
53	47	172	8489.77	9228.00	738.25	8	1
57	20	173	3405.85	3702.00	296.17	8	0
51	21	174	5407.54	5877.75	470.23	8	1
59	33	175	1614.61	1755.00	140.41	8	0
59	28	176	2997.02	3222.61	225.59	7	1
51	20	177	2776.50	3085.00	308.50	10	1
55	35	178	1639.36	1744.00	104.65	6	0
57	12	179	321.64	349.61	27.97	8	1
54	33	182	926.25	975.00	48.75	5	1
56	22	183	4736.95	5039.31	302.36	6	1
55	20	184	1135.28	1234.00	98.72	8	0
51	12	185	118.00	131.11	13.12	10	0
56	36	186	1278.66	1374.91	96.25	7	0
58	44	187	978.44	1075.21	96.77	9	0
59	10	188	2191.46	2356.41	164.95	7	1
55	32	190	1353.63	1487.50	133.88	9	1
55	22	191	3973.85	4319.40	345.56	8	0
51	31	192	6209.83	6606.20	396.38	6	0
58	49	193	665.84	715.96	50.12	7	0
54	23	194	3691.45	3969.30	277.86	7	0
58	43	196	512.68	545.41	32.73	6	1
52	44	198	571.40	614.40	43.01	7	0
52	24	200	496.45	551.61	55.17	10	0
55	13	202	2931.58	3186.50	254.93	8	1
58	32	203	812.18	892.50	80.33	9	0
57	39	204	14693.40	16326.00	1632.61	10	1
52	20	205	5108.77	5553.00	444.25	8	1
56	44	206	989.19	1075.21	86.02	8	1
58	23	207	3010.06	3307.75	297.70	9	1
52	24	209	196.51	206.86	10.35	5	0
51	49	211	1756.47	1909.21	152.74	8	0
55	13	213	879.48	955.95	76.48	8	1
59	18	214	182.71	203.00	20.31	10	1
56	18	215	147.79	162.41	14.62	9	0
54	38	217	727.92	782.70	54.79	7	1
53	34	218	987.20	1061.50	74.31	7	0
54	11	219	3369.97	3663.00	293.05	8	1
52	26	220	7581.08	8330.86	749.78	9	1
58	24	221	194.44	206.86	12.42	6	0
54	25	222	93.02	103.36	10.34	10	0
57	27	223	2494.04	2625.30	131.27	5	1
51	46	224	1504.94	1601.00	96.07	6	0
55	20	226	573.81	617.00	43.20	7	1
54	13	228	586.32	637.30	50.99	8	0
56	28	229	4941.33	5371.00	429.69	8	0
56	49	230	897.33	954.61	57.28	6	1
55	32	231	141.32	148.75	7.44	5	0
53	36	232	2502.32	2749.81	247.49	9	0
57	42	233	487.56	524.25	36.70	7	0
53	32	234	1245.04	1338.75	93.72	7	0
54	17	235	411.35	457.05	45.71	10	0
52	33	236	725.40	780.00	54.61	7	1
52	46	237	1440.91	1601.00	160.11	10	1
55	13	238	1449.86	1593.25	143.40	9	0
52	19	239	93.86	98.80	4.95	5	1
55	30	240	429.79	452.41	22.63	5	0
56	19	241	159.07	172.91	13.84	8	1
52	26	242	8330.86	9256.50	925.66	10	0
56	34	243	1910.71	2123.00	212.31	10	0
55	29	246	12222.46	13580.50	1358.06	10	1
58	39	247	9305.82	9795.60	489.78	5	1
55	14	248	6579.71	7151.85	572.15	8	1
51	38	249	474.84	521.80	46.97	9	0
53	11	250	4639.81	4884.00	244.21	5	0
57	19	1	229.71	247.00	17.30	7	0
57	35	2	1569.61	1744.00	174.41	10	0
59	12	3	397.68	437.00	39.33	9	0
58	16	4	1041.92	1096.75	54.84	5	1
53	41	6	5560.20	6178.00	617.81	10	1
56	47	7	3114.46	3460.50	346.06	10	0
59	43	9	85.45	90.91	5.46	6	1
54	10	10	2650.96	2945.50	294.56	10	1
53	35	11	634.82	697.61	62.79	9	1
52	11	12	1703.30	1831.50	128.21	7	0
55	42	13	1314.12	1398.00	83.88	6	1
51	49	14	1587.03	1670.55	83.53	5	0
57	45	15	1701.00	1890.00	189.00	10	1
59	16	17	208.39	219.35	10.97	5	1
56	15	18	852.08	946.75	94.68	10	1
54	46	19	3602.25	4002.50	400.25	10	1
58	30	20	814.33	904.81	90.49	10	0
51	14	21	731.08	794.65	63.58	8	1
59	40	23	10477.74	11514.00	1036.26	9	0
52	29	24	3748.22	4074.15	325.94	8	0
53	38	25	1961.97	2087.20	125.24	6	1
54	38	27	1424.52	1565.40	140.89	9	0
53	46	28	2257.41	2401.50	144.10	6	1
59	28	30	2416.96	2685.50	268.56	10	0
51	32	32	838.95	892.50	53.55	6	0
53	28	33	1514.63	1611.31	96.68	6	0
59	46	34	3009.88	3202.00	192.13	6	1
56	38	37	1408.86	1565.40	156.54	10	0
57	34	38	1579.52	1698.41	118.89	7	0
55	26	39	6155.58	6479.56	323.98	5	1
58	30	40	277.48	301.61	24.13	8	0
54	24	41	655.03	689.50	34.48	5	0
55	22	43	6767.06	7199.00	431.94	6	0
52	36	44	2557.32	2749.81	192.49	7	1
59	23	45	3076.21	3307.75	231.55	7	0
56	47	46	9654.80	10381.50	726.71	7	1
57	24	48	64.82	68.96	4.14	6	1
51	22	49	2706.83	2879.60	172.78	6	1
56	30	50	274.46	301.61	27.15	9	0
52	42	52	160.78	174.75	13.99	8	1
52	46	53	3009.88	3202.00	192.13	6	0
58	46	55	1104.70	1200.75	96.07	8	1
56	13	56	1778.07	1911.90	133.84	7	1
51	33	57	1076.41	1170.00	93.61	8	0
54	32	58	1413.13	1487.50	74.38	5	1
53	41	59	4547.01	4942.40	395.40	8	1
57	39	60	11885.33	13060.80	1175.48	9	1
57	26	61	5276.21	5553.90	277.70	5	0
59	42	62	498.04	524.25	26.22	5	0
59	33	63	185.25	195.00	9.75	5	0
52	41	64	2934.55	3089.00	154.46	5	1
57	34	65	1528.57	1698.41	169.85	10	0
56	50	66	5277.25	5555.00	277.75	5	1
51	36	67	1856.12	2062.36	206.24	10	0
51	20	68	555.31	617.00	61.71	10	1
54	44	69	714.25	768.00	53.77	7	1
59	35	72	476.12	523.21	47.09	9	1
59	13	74	299.54	318.65	19.12	6	0
53	17	76	868.40	914.10	45.71	5	1
57	18	77	91.36	101.50	10.16	10	0
58	10	78	1643.59	1767.31	123.72	7	0
51	32	79	279.65	297.50	17.85	6	0
54	25	80	261.82	275.61	13.79	5	0
53	29	82	7333.47	8148.30	814.83	10	0
52	46	83	1456.92	1601.00	144.10	9	0
58	47	85	2191.66	2307.00	115.36	5	0
58	21	86	11167.73	11755.50	587.78	5	1
52	11	87	579.98	610.50	30.53	5	1
58	49	88	1360.31	1431.91	71.60	5	0
59	38	89	1716.73	1826.30	109.58	6	0
59	14	90	2956.10	3178.60	222.51	7	1
51	37	93	6319.41	6944.40	625.00	9	0
55	15	94	1119.88	1217.25	97.38	8	0
51	40	95	9168.03	10074.75	906.73	9	0
59	26	96	7497.77	8330.86	833.09	10	0
55	42	99	328.53	349.50	20.97	6	0
58	41	100	1760.73	1853.40	92.68	5	1
53	50	101	7999.20	8888.00	888.81	10	0
57	27	102	2362.77	2625.30	262.53	10	1
53	27	103	1919.39	2041.90	122.52	6	1
54	33	104	185.25	195.00	9.75	5	0
57	34	105	1953.17	2123.00	169.85	8	1
53	17	106	425.06	457.05	32.00	7	0
56	29	108	1222.25	1358.05	135.81	10	1
51	40	109	12953.25	14392.50	1439.25	10	1
52	49	110	2195.58	2386.50	190.93	8	1
54	36	111	2529.82	2749.81	219.99	8	0
54	16	112	1237.14	1316.10	78.97	6	0
54	19	113	157.34	172.91	15.57	9	0
58	31	114	8918.37	9909.30	990.93	10	1
52	25	116	261.82	275.61	13.79	5	0
57	33	118	877.50	975.00	97.50	10	0
57	24	119	434.39	482.66	48.27	10	0
59	28	120	4081.97	4296.81	214.85	5	1
55	42	122	1590.23	1747.50	157.28	9	0
56	34	123	195.32	212.31	16.99	8	0
57	23	125	1865.58	1984.65	119.08	6	0
59	22	126	5298.47	5759.20	460.74	8	0
58	25	127	63.39	68.91	5.52	8	1
51	28	128	4039.00	4296.81	257.81	6	1
58	26	131	5276.21	5553.90	277.70	5	1
55	14	132	3019.67	3178.60	158.94	5	0
57	27	134	2467.79	2625.30	157.52	6	0
57	10	136	1958.76	2061.85	103.10	5	0
51	23	137	5358.56	5953.95	595.40	10	1
58	44	138	978.44	1075.21	96.77	9	0
57	14	139	6508.19	7151.85	643.67	9	1
52	29	141	4997.63	5432.20	434.58	8	1
53	13	142	860.36	955.95	95.60	10	0
53	36	143	2474.83	2749.81	274.99	10	1
56	42	144	975.11	1048.50	73.40	7	0
59	38	145	1716.73	1826.30	109.58	6	0
57	15	146	513.95	541.00	27.06	5	0
58	12	147	397.68	437.00	39.33	9	0
53	29	148	4997.63	5432.20	434.58	8	0
58	43	150	334.52	363.61	29.09	8	0
54	29	151	6382.84	6790.25	407.42	6	1
56	19	152	206.74	222.30	15.57	7	0
56	28	153	3571.72	3759.71	187.99	5	0
53	30	156	850.52	904.81	54.29	6	1
55	44	157	279.56	307.20	27.65	9	1
52	42	158	1272.19	1398.00	125.82	9	1
58	16	159	618.57	658.05	39.49	6	1
52	36	160	1917.99	2062.36	144.37	7	1
59	37	161	7265.58	7812.45	546.88	7	0
56	20	163	586.15	617.00	30.86	5	0
53	23	164	4167.77	4630.85	463.09	10	1
52	22	165	2649.24	2879.60	230.37	8	0
51	29	166	6111.23	6790.25	679.03	10	1
53	17	168	411.35	457.05	45.71	10	0
52	25	169	282.15	310.06	27.91	9	0
57	20	170	1739.94	1851.00	111.07	6	0
55	12	172	83.04	87.41	4.38	5	1
54	46	173	1140.72	1200.75	60.04	5	0
58	42	176	1607.71	1747.50	139.81	8	1
54	20	177	4059.86	4319.00	259.14	6	1
56	40	178	9168.03	10074.75	906.73	9	0
55	28	180	2497.52	2685.50	187.99	7	0
57	17	181	831.84	914.10	82.27	9	0
51	27	182	271.29	291.70	20.42	7	0
55	20	183	2344.60	2468.00	123.41	5	0
51	25	186	156.75	172.25	15.51	9	0
53	36	187	1278.66	1374.91	96.25	7	1
58	35	188	1491.13	1569.61	78.49	5	0
58	30	189	416.21	452.41	36.20	8	1
57	22	190	3973.85	4319.40	345.56	8	0
52	14	191	3575.93	3973.25	397.33	10	1
56	21	193	6630.11	7053.30	423.20	6	1
56	46	194	3041.90	3202.00	160.11	5	1
58	46	196	3682.31	4002.50	320.20	8	1
57	37	197	3906.23	4340.25	434.03	10	0
58	43	198	327.25	363.61	36.37	10	0
57	41	199	580.74	617.80	37.07	6	0
57	50	200	3133.02	3333.00	199.98	6	1
53	44	201	571.40	614.40	43.01	7	0
56	26	202	2638.11	2776.95	138.85	5	0
55	30	204	678.61	754.00	75.41	10	1
56	34	205	789.76	849.21	59.45	7	1
55	33	206	179.41	195.00	15.60	8	1
53	25	208	97.15	103.36	6.21	6	0
57	31	210	12023.29	13212.40	1189.12	9	1
57	22	211	4636.16	5039.31	403.15	8	0
54	24	212	192.38	206.86	14.48	7	1
52	16	213	987.08	1096.75	109.68	10	1
52	40	214	3972.34	4317.75	345.43	8	1
56	50	215	6999.31	7777.00	777.71	10	0
53	48	216	568.48	598.40	29.93	5	1
59	49	217	443.89	477.31	33.42	7	0
51	21	218	7817.41	8228.86	411.45	5	0
54	35	219	634.82	697.61	62.79	9	0
59	12	222	365.77	393.31	27.54	7	1
58	16	225	1412.62	1535.46	122.84	8	1
59	37	226	3194.43	3472.20	277.78	8	1
59	11	227	573.88	610.50	36.63	6	0
57	26	228	4350.56	4628.25	277.70	6	0
54	21	229	6700.64	7053.30	352.67	5	0
57	19	230	164.26	172.91	8.65	5	1
54	46	231	1504.94	1601.00	96.07	6	0
56	15	232	1006.26	1082.00	75.75	7	1
52	15	234	628.92	676.25	47.34	7	0
52	45	235	2693.25	2835.00	141.75	5	0
51	33	237	1296.75	1365.00	68.25	5	1
55	33	238	702.00	780.00	78.00	10	0
57	39	239	7509.97	8163.00	653.04	8	0
52	32	242	1398.25	1487.50	89.25	6	0
52	30	243	1097.83	1206.41	108.58	9	0
57	35	244	973.16	1046.41	73.25	7	1
55	22	246	5960.78	6479.10	518.33	8	1
51	44	247	285.70	307.20	21.51	7	1
52	15	248	871.01	946.75	75.74	8	0
56	35	249	973.16	1046.41	73.25	7	0
59	32	250	559.30	595.00	35.70	6	1
60	19	2	164.26	172.91	8.65	5	0
60	43	3	496.32	545.41	49.09	9	1
60	25	4	64.08	68.91	4.83	7	0
62	36	5	618.71	687.46	68.75	10	1
62	12	6	406.41	437.00	30.60	7	1
62	44	8	1021.44	1075.21	53.77	5	1
62	11	10	1135.53	1221.00	85.48	7	1
61	48	11	272.28	299.20	26.93	9	1
62	32	13	410.56	446.25	35.71	8	0
62	30	17	1134.02	1206.41	72.39	6	0
60	40	18	2619.44	2878.50	259.07	9	0
60	37	19	7899.26	8680.50	781.25	9	1
62	24	20	507.48	551.61	44.13	8	1
62	20	21	1172.30	1234.00	61.71	5	0
61	10	24	839.47	883.66	44.19	5	0
61	31	25	12287.54	13212.40	924.87	7	1
60	10	27	2739.32	2945.50	206.19	7	1
60	12	28	235.99	262.21	26.23	10	1
60	37	30	807.29	868.05	60.77	7	1
61	43	31	496.32	545.41	49.09	9	0
62	30	33	850.52	904.81	54.29	6	0
62	23	34	628.48	661.55	33.08	5	0
60	23	35	4353.00	4630.85	277.86	6	0
60	14	36	1446.27	1589.30	143.04	9	1
61	35	37	952.23	1046.41	94.18	9	1
62	40	38	1324.12	1439.25	115.15	8	1
60	45	39	1134.00	1260.00	126.00	10	1
62	32	40	133.88	148.75	14.88	10	0
60	50	41	10110.11	11110.00	999.90	9	0
62	48	42	486.95	523.61	36.66	7	0
62	20	43	3930.29	4319.00	388.71	9	0
61	11	44	573.88	610.50	36.63	6	0
61	47	45	4291.02	4614.00	322.99	7	0
60	17	46	1109.11	1218.80	109.70	9	1
61	30	47	1248.63	1357.21	108.58	8	1
61	25	48	64.08	68.91	4.83	7	0
60	22	49	2735.62	2879.60	143.98	5	0
61	45	50	1134.00	1260.00	126.00	10	1
61	30	51	981.71	1055.61	73.90	7	0
62	32	52	1398.25	1487.50	89.25	6	0
60	34	53	193.20	212.31	19.11	9	1
61	45	54	1757.70	1890.00	132.31	7	1
62	18	55	114.50	121.81	7.31	6	0
61	16	57	798.44	877.40	78.97	9	1
62	26	59	1666.18	1851.30	185.13	10	0
60	26	60	4304.28	4628.25	323.98	7	0
61	48	61	139.13	149.60	10.48	7	0
62	49	62	1360.31	1431.91	71.60	5	1
62	27	63	1858.13	2041.90	183.78	9	0
60	36	64	1306.16	1374.91	68.75	5	1
60	30	66	143.26	150.81	7.55	5	0
61	20	67	1110.61	1234.00	123.41	10	1
61	50	68	999.90	1111.00	111.11	10	0
61	11	69	4493.28	4884.00	390.73	8	0
60	40	70	11916.99	12953.25	1036.26	8	0
62	28	71	3383.74	3759.71	375.98	10	1
61	33	72	926.25	975.00	48.75	5	0
60	41	73	4547.01	4942.40	395.40	8	1
61	43	76	579.04	636.31	57.27	9	0
61	26	77	4257.99	4628.25	370.26	8	0
60	41	78	5683.77	6178.00	494.25	8	1
60	30	79	1097.83	1206.41	108.58	9	1
62	33	80	1296.75	1365.00	68.25	5	0
62	49	81	221.95	238.66	16.71	7	0
60	47	82	10727.55	11535.00	807.46	7	0
61	22	84	1965.33	2159.70	194.38	9	0
61	16	86	1237.14	1316.10	78.97	6	1
61	42	87	482.32	524.25	41.94	8	1
62	23	88	1204.03	1323.10	119.08	9	0
60	25	89	124.03	137.81	13.79	10	0
62	13	90	908.16	955.95	47.80	5	1
60	23	91	6152.42	6615.50	463.09	7	0
61	32	92	676.82	743.75	66.94	9	1
61	32	93	937.13	1041.25	104.13	10	0
60	19	94	204.52	222.30	17.79	8	1
61	12	95	207.58	218.50	10.93	5	0
61	23	96	3109.29	3307.75	198.47	6	1
61	21	97	11050.18	11755.50	705.33	6	0
62	33	98	358.81	390.00	31.20	8	0
61	38	99	1643.67	1826.30	182.63	10	1
62	21	100	2163.02	2351.10	188.09	8	1
61	47	101	6505.74	6921.00	415.26	6	0
61	15	102	124.44	135.25	10.83	8	1
62	26	103	5896.40	6479.56	583.16	9	1
60	20	104	5861.50	6170.00	308.50	5	0
62	24	105	558.50	620.56	62.06	10	0
61	48	110	421.88	448.80	26.93	6	0
62	21	111	11167.73	11755.50	587.78	5	0
60	10	112	1625.92	1767.31	141.39	8	1
60	23	114	1865.58	1984.65	119.08	6	0
61	15	115	128.49	135.25	6.77	5	1
62	47	116	3287.48	3460.50	173.03	5	0
60	17	117	1432.09	1523.50	91.41	6	0
62	37	118	3993.04	4340.25	347.23	8	0
62	41	119	2811.00	3089.00	278.01	9	1
62	11	120	2899.88	3052.50	152.63	5	1
61	34	121	1738.74	1910.71	171.97	9	1
60	14	122	2193.24	2383.95	190.72	8	0
60	35	123	994.09	1046.41	52.33	5	1
61	19	124	45.45	49.40	3.96	8	0
62	23	125	3770.84	3969.30	198.47	5	0
60	45	131	2551.50	2835.00	283.50	10	0
62	15	132	121.73	135.25	13.53	10	1
60	35	133	327.88	348.81	20.93	6	1
60	40	135	10477.74	11514.00	1036.26	9	1
60	44	136	288.77	307.20	18.44	6	0
60	36	138	3265.39	3437.25	171.87	5	0
61	28	140	3458.93	3759.71	300.78	8	0
62	32	141	821.11	892.50	71.41	8	1
60	36	142	3753.48	4124.71	371.23	9	0
62	14	143	2193.24	2383.95	190.72	8	1
60	25	144	130.91	137.81	6.90	5	0
60	25	146	259.07	275.61	16.54	6	0
61	13	147	2052.11	2230.55	178.45	8	1
62	35	148	317.41	348.81	31.40	9	1
61	27	149	2362.77	2625.30	262.53	10	1
60	27	150	2441.53	2625.30	183.78	7	0
61	31	151	4508.74	4954.65	445.92	9	0
60	49	152	434.35	477.31	42.96	9	1
61	11	153	5616.61	6105.00	488.41	8	1
61	19	154	185.75	197.60	11.86	6	1
60	26	155	5220.67	5553.90	333.24	6	1
62	19	156	67.44	74.10	6.67	9	0
62	29	157	3707.48	4074.15	366.68	9	1
61	18	158	54.82	60.91	6.10	10	0
61	12	159	249.10	262.21	13.12	5	0
61	24	160	380.61	413.71	33.10	8	0
61	12	162	246.47	262.21	15.74	6	0
60	32	163	1245.04	1338.75	93.72	7	0
61	28	165	4995.03	5371.00	375.98	7	1
60	34	166	965.97	1061.50	95.54	9	0
60	50	167	1022.13	1111.00	88.88	8	1
62	28	168	4833.91	5371.00	537.11	10	0
62	11	171	4639.81	4884.00	244.21	5	1
62	42	172	1125.40	1223.25	97.86	8	0
62	23	173	3142.37	3307.75	165.39	5	1
60	45	174	598.50	630.00	31.50	5	0
60	21	175	3279.79	3526.65	246.87	7	0
62	23	177	4399.31	4630.85	231.55	5	0
62	27	178	274.20	291.70	17.51	6	0
60	32	179	141.32	148.75	7.44	5	0
60	37	180	3949.63	4340.25	390.63	9	0
61	34	181	1613.49	1698.41	84.93	5	0
61	42	182	1590.23	1747.50	157.28	9	1
61	36	183	1917.99	2062.36	144.37	7	0
61	49	185	906.88	954.61	47.74	5	1
60	47	186	9550.98	10381.50	830.52	8	1
61	34	188	1352.36	1486.11	133.75	9	1
60	50	189	8265.85	8888.00	622.17	7	1
61	21	190	1116.78	1175.55	58.78	5	1
60	39	191	7346.70	8163.00	816.31	10	1
60	20	192	2869.05	3085.00	215.96	7	0
60	44	193	1443.84	1536.00	92.16	6	0
60	11	194	2777.78	3052.50	274.73	9	0
60	14	195	2240.92	2383.95	143.04	6	0
62	37	196	4791.64	5208.30	416.67	8	0
62	36	197	2557.32	2749.81	192.49	7	1
60	43	198	579.04	636.31	57.27	9	0
60	26	199	7581.08	8330.86	749.78	9	0
60	40	200	3885.98	4317.75	431.78	10	0
61	22	201	3419.53	3599.50	179.98	5	0
62	46	202	2257.41	2401.50	144.10	6	0
60	24	203	186.17	206.86	20.69	10	1
61	40	204	10823.16	11514.00	690.84	6	1
60	12	205	332.13	349.61	17.49	5	0
61	36	206	1306.16	1374.91	68.75	5	0
60	17	207	1371.16	1523.50	152.35	10	0
61	38	208	1226.24	1304.50	78.27	6	1
60	42	209	657.06	699.00	41.94	6	0
62	43	211	82.72	90.91	8.19	9	0
62	27	212	1939.81	2041.90	102.10	5	1
61	10	213	2518.41	2650.96	132.55	5	1
61	35	214	476.12	523.21	47.09	9	0
61	29	216	6314.94	6790.25	475.32	7	0
62	40	217	2619.44	2878.50	259.07	9	1
62	21	218	7570.55	8228.86	658.31	8	0
60	48	219	556.52	598.40	41.89	7	0
60	15	220	984.63	1082.00	97.38	9	0
60	50	221	3133.02	3333.00	199.98	6	1
62	40	222	12046.53	12953.25	906.73	7	0
61	23	223	4399.31	4630.85	231.55	5	0
60	16	224	1237.14	1316.10	78.97	6	0
62	31	226	4706.92	4954.65	247.74	5	0
60	19	228	45.45	49.40	3.96	8	0
61	46	229	364.23	400.25	36.03	9	0
61	20	230	579.99	617.00	37.02	6	0
62	10	232	1678.94	1767.31	88.37	5	1
62	10	233	1625.92	1767.31	141.39	8	0
61	46	234	1901.19	2001.25	100.07	5	1
60	27	235	2494.04	2625.30	131.27	5	0
61	30	236	693.69	754.00	60.33	8	0
62	49	237	1303.03	1431.91	128.88	9	1
62	32	238	1106.70	1190.00	83.31	7	0
61	18	239	55.42	60.91	5.49	9	0
60	15	240	1156.39	1217.25	60.87	5	0
61	50	242	2044.25	2222.00	177.76	8	0
62	30	243	678.61	754.00	75.41	10	1
62	23	244	628.48	661.55	33.08	5	1
61	18	245	18.48	20.31	1.83	9	0
62	23	246	1190.79	1323.10	132.32	10	0
62	46	247	752.47	800.50	48.04	6	1
62	47	248	9550.98	10381.50	830.52	8	1
61	39	249	15019.93	16326.00	1306.08	8	1
61	29	250	3829.71	4074.15	244.45	6	1
62	20	1	1739.94	1851.00	111.07	6	0
61	16	2	1667.06	1754.80	87.75	5	1
60	26	3	1684.69	1851.30	166.62	9	0
62	28	4	4350.52	4833.91	483.40	10	1
60	14	5	2924.32	3178.60	254.29	8	0
61	36	6	3753.48	4124.71	371.23	9	1
61	42	7	975.11	1048.50	73.40	7	1
60	40	8	1338.51	1439.25	100.75	7	0
60	41	9	4448.16	4942.40	494.25	10	1
60	23	10	5027.78	5292.40	264.63	5	1
60	34	11	394.88	424.61	29.73	7	0
62	10	12	1896.91	2061.85	164.95	8	0
61	32	13	565.25	595.00	29.75	5	0
62	34	14	1738.74	1910.71	171.97	9	0
61	13	16	573.57	637.30	63.73	10	1
62	48	17	69.57	74.80	5.24	7	0
62	47	18	8397.48	9228.00	830.52	9	1
61	28	19	488.77	537.11	48.34	9	0
62	31	20	8918.37	9909.30	990.93	10	0
62	13	21	2695.78	2867.85	172.08	6	0
60	15	22	770.93	811.50	40.58	5	0
62	50	23	6999.31	7777.00	777.71	10	0
62	39	24	13371.00	14693.40	1322.41	9	0
62	14	25	723.14	794.65	71.52	9	1
62	20	26	2869.05	3085.00	215.96	7	0
62	29	27	7577.92	8148.30	570.39	7	1
62	40	29	9067.28	10074.75	1007.48	10	0
62	24	30	393.02	413.71	20.69	5	1
61	43	31	585.40	636.31	50.91	8	1
62	37	32	2343.74	2604.15	260.42	10	1
60	15	34	492.32	541.00	48.69	9	0
60	39	35	10628.23	11428.20	799.98	7	0
61	26	36	6664.69	7405.20	740.52	10	1
60	16	37	1210.82	1316.10	105.29	8	0
62	25	38	32.73	34.46	1.73	5	1
60	11	39	4395.61	4884.00	488.41	10	0
62	20	40	555.31	617.00	61.71	10	1
61	45	41	1449.00	1575.00	126.00	8	0
60	15	43	125.79	135.25	9.47	7	0
61	31	44	3038.86	3303.10	264.25	8	0
60	47	46	2076.31	2307.00	230.71	10	0
61	13	47	605.44	637.30	31.87	5	0
60	47	48	5421.45	5767.50	346.06	6	0
61	25	49	288.35	310.06	21.71	7	1
61	33	50	177.46	195.00	17.56	9	0
61	47	51	6436.53	6921.00	484.48	7	1
61	13	52	2029.81	2230.55	200.75	9	0
60	36	53	639.33	687.46	48.13	7	0
60	25	54	229.10	241.16	12.06	5	1
62	36	55	3093.53	3437.25	343.73	10	0
61	20	56	5676.41	6170.00	493.61	8	0
61	11	59	1684.99	1831.50	146.53	8	0
61	50	60	4177.36	4444.00	266.64	6	0
62	28	62	1530.74	1611.31	80.57	5	1
61	29	63	11000.21	12222.45	1222.25	10	0
61	27	64	1592.69	1750.20	157.52	9	0
62	32	65	847.88	892.50	44.63	5	0
61	37	66	2369.78	2604.15	234.38	9	0
62	34	67	1146.43	1273.81	127.39	10	1
62	14	68	2240.92	2383.95	143.04	6	1
60	49	70	868.69	954.61	85.92	9	0
60	46	71	1128.71	1200.75	72.05	6	1
62	35	72	1311.49	1395.21	83.72	6	0
62	40	73	4101.87	4317.75	215.89	5	1
60	27	74	548.40	583.40	35.01	6	1
61	50	75	2088.68	2222.00	133.32	6	0
62	28	76	4447.19	4833.91	386.72	8	1
60	24	77	583.32	620.56	37.24	6	1
60	28	78	3458.93	3759.71	300.78	8	1
60	13	79	2581.07	2867.85	286.79	10	0
61	34	80	1596.50	1698.41	101.91	6	1
62	45	81	296.10	315.00	18.90	6	0
61	33	82	179.41	195.00	15.60	8	0
61	29	83	2498.82	2716.10	217.29	8	0
60	17	84	143.21	152.35	9.15	6	1
60	35	85	819.68	872.00	52.33	6	0
61	22	86	1367.81	1439.80	71.99	5	1
61	21	87	3209.26	3526.65	317.40	9	1
61	34	88	965.97	1061.50	95.54	9	1
61	35	89	1656.80	1744.00	87.21	5	1
62	27	91	1096.80	1166.80	70.01	6	0
61	24	93	518.51	551.61	33.10	6	1
60	48	94	71.06	74.80	3.75	5	0
62	22	95	1986.93	2159.70	172.78	8	1
61	50	96	6132.73	6666.00	533.28	8	1
61	44	97	1257.99	1382.40	124.42	9	1
62	16	98	204.00	219.35	15.36	7	0
61	47	99	2168.58	2307.00	138.42	6	1
60	22	100	6479.11	7199.00	719.91	10	0
60	43	101	85.45	90.91	5.46	6	0
61	47	102	5248.43	5767.50	519.08	9	1
60	27	103	536.73	583.40	46.68	8	1
61	16	104	206.19	219.35	13.17	6	0
61	45	105	1134.00	1260.00	126.00	10	1
60	42	106	1607.71	1747.50	139.81	8	0
62	14	107	7469.71	7946.50	476.79	6	1
60	27	110	262.53	291.70	29.18	10	0
61	46	111	1116.70	1200.75	84.06	7	0
60	41	113	5807.32	6178.00	370.69	6	0
61	23	114	3109.29	3307.75	198.47	6	1
61	28	116	3910.09	4296.81	386.72	9	0
62	38	117	949.68	1043.60	93.93	9	0
62	43	118	836.29	909.00	72.72	8	0
61	34	119	806.75	849.21	42.47	5	1
62	21	120	5289.98	5877.75	587.78	10	0
61	24	122	253.74	275.81	22.07	8	0
62	32	124	559.30	595.00	35.70	6	0
61	19	125	232.18	247.00	14.83	6	0
61	29	127	11000.21	12222.45	1222.25	10	0
62	41	128	3410.26	3706.80	296.55	8	0
62	37	129	4843.72	5208.30	364.59	7	1
61	12	132	83.04	87.41	4.38	5	0
61	28	133	1998.02	2148.41	150.39	7	0
60	49	134	1775.56	1909.21	133.65	7	0
60	31	136	1519.43	1651.55	132.13	8	1
61	28	137	2470.67	2685.50	214.85	8	0
61	10	138	1083.95	1178.21	94.26	8	1
61	34	139	386.39	424.61	38.22	9	0
62	19	140	222.31	247.00	24.71	10	1
61	10	141	1325.48	1472.75	147.28	10	0
61	48	142	408.41	448.80	40.40	9	1
61	20	143	5219.82	5553.00	333.19	6	0
62	44	146	141.32	153.60	12.29	8	0
61	25	147	32.39	34.46	2.07	6	0
61	19	149	159.07	172.91	13.84	8	1
60	34	150	1382.08	1486.11	104.03	7	1
62	35	152	158.71	174.41	15.70	9	1
61	21	153	4467.09	4702.20	235.12	5	0
61	31	154	15359.42	16515.50	1156.09	7	0
62	50	155	4132.93	4444.00	311.09	7	1
62	38	156	2426.37	2609.00	182.64	7	0
62	19	158	140.79	148.20	7.42	5	0
60	41	159	1742.20	1853.40	111.21	6	1
60	16	160	1197.66	1316.10	118.45	9	1
62	22	162	2030.12	2159.70	129.59	6	1
62	33	163	1597.05	1755.00	157.95	9	0
60	17	164	137.12	152.35	15.24	10	1
62	18	166	129.32	142.10	12.79	9	1
61	35	168	162.20	174.41	12.21	7	1
62	31	169	4558.28	4954.65	396.38	8	0
62	46	170	2913.83	3202.00	288.19	9	1
61	46	171	3350.10	3602.25	252.16	7	1
60	40	172	2619.44	2878.50	259.07	9	0
60	47	174	10842.90	11535.00	692.11	6	0
61	31	175	4459.19	4954.65	495.47	10	0
62	10	176	1083.95	1178.21	94.26	8	1
62	48	177	562.50	598.40	35.91	6	0
61	47	178	10612.21	11535.00	922.81	8	0
60	40	179	3972.34	4317.75	345.43	8	1
61	33	180	358.81	390.00	31.20	8	1
60	42	181	477.07	524.25	47.19	9	0
61	30	183	1235.06	1357.21	122.15	9	1
62	33	186	877.50	975.00	97.50	10	0
60	48	187	626.08	673.20	47.13	7	0
62	25	189	229.10	241.16	12.06	5	1
60	24	190	310.28	344.75	34.48	10	1
61	15	191	243.46	270.50	27.06	10	0
60	38	192	991.42	1043.60	52.18	5	1
61	27	193	822.60	875.10	52.51	6	0
60	40	194	4101.87	4317.75	215.89	5	0
61	42	195	1590.23	1747.50	157.28	9	1
61	39	196	10856.79	11428.20	571.41	5	0
60	47	199	5190.75	5767.50	576.75	10	1
60	49	201	1933.07	2147.85	214.79	10	1
61	26	202	6812.79	7405.20	592.42	8	0
62	19	203	22.24	24.70	2.48	10	1
61	33	204	1597.05	1755.00	157.95	9	1
62	39	205	7754.85	8163.00	408.16	5	1
61	42	206	975.11	1048.50	73.40	7	1
62	46	207	1440.91	1601.00	160.11	10	0
60	24	209	564.71	620.56	55.85	9	0
61	26	214	6155.58	6479.56	323.98	5	1
60	33	216	1813.50	1950.00	136.50	7	1
60	50	217	1011.01	1111.00	99.99	9	0
60	32	218	1231.66	1338.75	107.11	8	1
60	42	220	1272.19	1398.00	125.82	9	0
61	30	221	286.52	301.61	15.09	5	1
61	19	222	113.63	123.50	9.89	8	0
60	17	223	429.63	457.05	27.43	6	1
62	16	225	598.83	658.05	59.23	9	1
60	19	226	69.66	74.10	4.45	6	0
61	42	227	482.32	524.25	41.94	8	0
60	39	229	10856.79	11428.20	571.41	5	0
62	28	230	3953.06	4296.81	343.75	8	1
60	20	231	1684.42	1851.00	166.60	9	1
62	31	232	7431.98	8257.75	825.78	10	0
61	27	233	2625.31	2917.00	291.70	10	1
62	39	235	6007.97	6530.40	522.44	8	0
61	33	238	916.50	975.00	58.50	6	0
60	27	242	1061.79	1166.80	105.02	9	1
62	16	243	403.61	438.70	35.10	8	0
60	19	244	89.91	98.80	8.90	9	0
60	31	246	4607.83	4954.65	346.83	7	0
61	31	247	7679.71	8257.75	578.05	7	0
62	10	248	1095.73	1178.21	82.48	7	1
60	49	250	1976.03	2147.85	171.83	8	1
62	22	2	2620.44	2879.60	259.17	9	1
60	15	3	1257.83	1352.50	94.68	7	1
60	44	4	1459.20	1536.00	76.81	5	0
61	21	5	10815.07	11755.50	940.45	8	1
61	23	8	6152.42	6615.50	463.09	7	0
60	40	9	6620.56	7196.25	575.71	8	0
60	29	10	1262.99	1358.05	95.07	7	1
61	20	11	561.48	617.00	55.54	9	0
60	49	12	644.36	715.96	71.60	10	0
61	20	13	5164.29	5553.00	388.72	7	1
61	40	15	12305.59	12953.25	647.67	5	1
62	21	16	6489.04	7053.30	564.27	8	1
62	18	17	76.33	81.21	4.88	6	0
61	14	18	4434.15	4767.90	333.76	7	1
61	14	19	5284.43	5562.56	278.13	5	1
62	42	21	830.07	873.75	43.69	5	1
61	32	23	276.68	297.50	20.83	7	1
62	10	24	1896.91	2061.85	164.95	8	0
62	36	25	3794.73	4124.71	329.98	8	0
62	49	26	1718.28	1909.21	190.93	10	1
60	19	27	70.40	74.10	3.71	5	1
62	32	28	138.34	148.75	10.42	7	0
62	26	30	7914.31	8330.86	416.55	5	1
61	34	31	197.44	212.31	14.87	7	1
60	25	32	282.15	310.06	27.91	9	0
60	17	33	277.28	304.70	27.43	9	0
61	11	34	4395.61	4884.00	488.41	10	1
60	23	35	1786.19	1984.65	198.47	10	0
61	10	36	1855.67	2061.85	206.19	10	1
61	40	38	11916.99	12953.25	1036.26	8	1
60	33	39	1099.80	1170.00	70.21	6	1
60	39	41	3036.64	3265.20	228.57	7	1
60	24	42	186.17	206.86	20.69	10	0
62	47	43	6228.91	6921.00	692.11	10	0
62	36	44	2529.82	2749.81	219.99	8	1
61	12	45	275.32	305.91	30.60	10	1
61	22	46	2678.03	2879.60	201.58	7	1
62	23	48	595.40	661.55	66.16	10	0
61	20	51	4059.86	4319.00	259.14	6	1
61	36	54	3196.65	3437.25	240.61	7	1
60	41	55	5745.54	6178.00	432.47	7	0
61	29	56	9031.04	9506.36	475.32	5	0
61	26	57	4396.84	4628.25	231.42	5	1
61	34	58	1210.12	1273.81	63.70	5	1
61	38	59	735.74	782.70	46.97	6	1
61	47	60	10727.55	11535.00	807.46	7	0
60	49	61	429.57	477.31	47.74	10	1
60	25	62	124.03	137.81	13.79	10	0
60	40	63	5181.31	5757.00	575.71	10	1
62	32	64	1106.70	1190.00	83.31	7	1
62	24	65	380.61	413.71	33.10	8	1
60	12	66	80.41	87.41	7.00	8	0
62	21	67	2210.04	2351.10	141.07	6	1
62	39	68	15183.18	16326.00	1142.83	7	1
62	32	71	565.25	595.00	29.75	5	1
60	47	72	1038.16	1153.50	115.36	10	1
60	48	73	612.62	673.20	60.59	9	1
61	42	75	159.03	174.75	15.73	9	0
61	31	76	1486.40	1651.55	165.16	10	0
60	22	77	4535.37	5039.31	503.94	10	0
60	17	78	1145.68	1218.80	73.13	6	0
62	21	80	8840.14	9404.40	564.27	6	1
61	25	82	313.50	344.50	31.01	9	1
62	18	85	18.68	20.31	1.63	8	0
61	20	86	2807.35	3085.00	277.65	9	0
62	33	88	733.20	780.00	46.80	6	0
62	47	89	8489.77	9228.00	738.25	8	0
62	49	90	2171.72	2386.50	214.79	9	0
62	38	91	727.92	782.70	54.79	7	0
60	21	92	4467.09	4702.20	235.12	5	0
62	12	93	41.08	43.71	2.63	6	1
60	43	94	654.49	727.21	72.73	10	0
62	16	95	789.66	877.40	87.75	10	0
61	17	96	831.84	914.10	82.27	9	1
62	22	97	2620.44	2879.60	259.17	9	0
62	22	98	6155.15	6479.10	323.96	5	0
60	16	99	1614.42	1754.80	140.39	8	1
60	16	100	1237.14	1316.10	78.97	6	0
60	13	101	1198.13	1274.60	76.48	6	1
61	21	102	2163.02	2351.10	188.09	8	0
62	48	103	136.14	149.60	13.47	9	0
60	27	104	262.53	291.70	29.18	10	0
62	40	105	5296.45	5757.00	460.57	8	0
60	29	106	4943.31	5432.20	488.90	9	0
60	45	107	1496.25	1575.00	78.75	5	0
62	14	108	5117.55	5562.56	445.01	8	1
60	23	109	1825.88	1984.65	158.78	8	0
61	15	110	503.13	541.00	37.88	7	0
61	15	111	608.63	676.25	67.63	10	0
61	47	113	6367.33	6921.00	553.69	8	0
62	47	114	1084.29	1153.50	69.21	6	0
60	44	115	838.66	921.60	82.95	9	0
61	29	116	3748.22	4074.15	325.94	8	0
60	10	117	1678.94	1767.31	88.37	5	1
62	17	118	280.33	304.70	24.38	8	0
61	12	119	79.54	87.41	7.87	9	1
60	26	120	870.12	925.65	55.54	6	1
60	10	121	1608.25	1767.31	159.06	9	1
61	16	122	1776.74	1974.15	197.42	10	0
60	36	123	4949.65	5499.61	549.97	10	0
60	17	124	1261.46	1371.15	109.70	8	0
62	15	125	746.59	811.50	64.93	8	0
62	15	126	984.63	1082.00	97.38	9	1
61	29	127	1290.15	1358.05	67.91	5	0
61	34	128	1411.80	1486.11	74.31	5	1
60	42	130	321.55	349.50	27.97	8	0
62	16	131	1197.66	1316.10	118.45	9	1
62	50	132	6332.70	6666.00	333.31	5	1
61	39	133	9109.91	9795.60	685.70	7	1
61	42	135	821.33	873.75	52.43	6	0
60	24	138	501.96	551.61	49.65	9	0
60	48	140	344.09	374.00	29.93	8	0
61	46	141	1080.68	1200.75	120.08	10	0
60	31	142	7679.71	8257.75	578.05	7	0
62	13	144	1172.64	1274.60	101.97	8	0
62	35	145	1159.76	1220.80	61.04	5	0
61	11	146	1159.96	1221.00	61.06	5	1
60	11	147	2777.78	3052.50	274.73	9	0
60	28	148	4833.91	5371.00	537.11	10	0
62	25	149	126.78	137.81	11.03	8	1
62	20	150	4491.77	4936.00	444.25	9	0
60	10	151	2238.58	2356.41	117.83	5	0
62	22	152	5471.24	5759.20	287.96	5	0
61	47	153	5421.45	5767.50	346.06	6	1
61	43	154	490.87	545.41	54.55	10	0
62	14	155	2169.40	2383.95	214.56	9	1
62	33	156	1450.80	1560.00	109.21	7	1
60	35	157	160.45	174.41	13.96	8	0
61	37	158	807.29	868.05	60.77	7	0
60	36	159	6255.80	6874.50	618.71	9	1
61	18	160	169.92	182.71	12.79	7	0
61	50	161	999.90	1111.00	111.11	10	0
61	22	164	4636.16	5039.31	403.15	8	0
61	25	165	313.50	344.50	31.01	9	1
61	23	166	2513.89	2646.20	132.32	5	1
60	40	167	1367.29	1439.25	71.97	5	0
62	44	170	989.19	1075.21	86.02	8	0
61	43	171	345.43	363.61	18.19	5	0
61	13	172	1778.07	1911.90	133.84	7	0
62	32	173	847.88	892.50	44.63	5	1
60	30	174	832.42	904.81	72.39	8	1
60	35	175	1569.61	1744.00	174.41	10	0
62	37	176	4687.47	5208.30	520.83	10	0
61	50	177	2110.91	2222.00	111.11	5	0
60	28	178	1933.57	2148.41	214.85	10	1
61	36	179	1264.91	1374.91	110.00	8	0
62	35	180	994.09	1046.41	52.33	5	0
62	40	184	13097.18	14392.50	1295.33	9	1
60	12	185	198.84	218.50	19.67	9	0
60	34	186	573.22	636.91	63.70	10	1
62	12	187	166.07	174.81	8.75	5	1
60	45	188	567.00	630.00	63.00	10	0
62	17	189	286.42	304.70	18.29	6	0
60	35	190	828.40	872.00	43.61	5	1
61	39	191	1534.65	1632.60	97.96	6	1
60	19	192	22.24	24.70	2.48	10	1
60	20	193	5053.24	5553.00	499.77	9	0
61	20	194	5053.24	5553.00	499.77	9	0
60	42	195	332.03	349.50	17.48	5	0
62	42	198	471.83	524.25	52.43	10	0
60	44	199	1271.81	1382.40	110.60	8	1
61	10	200	1107.51	1178.21	70.70	6	1
62	29	201	7496.44	8148.30	651.87	8	1
62	37	202	8159.67	8680.50	520.83	6	1
62	22	203	655.11	719.90	64.80	9	1
60	23	206	3731.15	3969.30	238.16	6	0
61	18	207	166.26	182.71	16.45	9	0
62	24	208	253.74	275.81	22.07	8	1
62	22	209	683.91	719.90	36.00	5	0
62	17	210	981.14	1066.46	85.32	8	1
62	24	211	126.87	137.91	11.04	8	0
60	27	212	813.85	875.10	61.26	7	0
62	43	213	81.82	90.91	9.10	10	0
61	48	214	336.61	374.00	37.40	10	1
60	23	215	5358.56	5953.95	595.40	10	1
62	20	216	5861.50	6170.00	308.50	5	0
62	15	217	615.39	676.25	60.87	9	1
60	17	218	693.20	761.75	68.56	9	0
60	11	219	561.66	610.50	48.85	8	0
61	10	220	2491.90	2650.96	159.06	6	0
62	40	224	10823.16	11514.00	690.84	6	1
61	24	226	190.31	206.86	16.55	8	0
60	23	227	4167.77	4630.85	463.09	10	1
62	40	229	2705.79	2878.50	172.71	6	0
60	47	230	10958.25	11535.00	576.75	5	1
61	18	232	18.48	20.31	1.83	9	1
62	33	234	926.25	975.00	48.75	5	0
60	16	235	1210.82	1316.10	105.29	8	0
60	40	237	6548.59	7196.25	647.67	9	1
60	46	239	1821.14	2001.25	180.12	9	0
62	43	240	84.54	90.91	6.37	7	1
61	19	241	137.83	148.20	10.38	7	0
60	24	242	384.75	413.71	28.96	7	0
62	23	243	3691.45	3969.30	277.86	7	0
61	20	245	1159.97	1234.00	74.04	6	1
61	42	246	314.56	349.50	34.96	10	0
60	13	247	2899.72	3186.50	286.79	9	0
61	50	248	10554.50	11110.00	555.50	5	1
62	33	250	1450.80	1560.00	109.21	7	1
62	15	1	513.95	541.00	27.06	5	1
61	38	4	2230.70	2348.10	117.41	5	0
60	45	6	1134.00	1260.00	126.00	10	1
60	28	8	977.53	1074.21	96.68	9	1
61	34	9	806.75	849.21	42.47	5	0
62	36	10	4427.18	4812.16	384.98	8	0
60	30	11	143.26	150.81	7.55	5	1
61	18	12	57.25	60.91	3.66	6	0
61	12	14	410.78	437.00	26.22	6	1
61	20	15	579.99	617.00	37.02	6	0
60	12	16	332.13	349.61	17.49	5	1
62	33	17	549.90	585.00	35.11	6	1
62	30	18	542.89	603.21	60.33	10	0
61	40	19	6620.56	7196.25	575.71	8	0
62	18	20	166.26	182.71	16.45	9	0
62	49	22	1813.75	1909.21	95.47	5	0
60	46	23	2661.67	2801.75	140.09	5	0
61	22	25	6479.11	7199.00	719.91	10	1
62	14	26	7231.32	7946.50	715.19	9	1
60	16	27	206.19	219.35	13.17	6	1
60	40	28	3972.34	4317.75	345.43	8	0
60	41	30	568.38	617.80	49.43	8	1
60	27	31	1312.66	1458.50	145.85	10	0
61	36	32	5169.63	5499.61	329.98	6	1
61	30	33	971.16	1055.61	84.45	8	0
62	12	34	318.14	349.61	31.47	9	0
62	12	36	241.23	262.21	20.98	8	0
60	33	38	358.81	390.00	31.20	8	1
61	42	39	1300.14	1398.00	97.87	7	0
60	43	40	172.72	181.81	9.10	5	0
60	43	41	409.06	454.50	45.46	10	0
62	23	42	5358.56	5953.95	595.40	10	0
61	38	43	939.24	1043.60	104.36	10	0
62	26	44	4211.71	4628.25	416.55	9	1
61	34	46	579.58	636.91	57.33	9	0
61	28	47	504.88	537.11	32.23	6	0
62	25	48	62.02	68.91	6.90	10	1
61	15	49	127.14	135.25	8.12	6	1
60	22	51	2649.24	2879.60	230.37	8	0
62	13	52	2029.81	2230.55	200.75	9	1
61	43	53	490.87	545.41	54.55	10	0
61	20	54	3442.86	3702.00	259.15	7	1
60	28	55	510.25	537.11	26.86	5	0
62	26	56	6155.58	6479.56	323.98	5	0
60	35	57	1604.49	1744.00	139.53	8	0
62	26	58	1721.71	1851.30	129.60	7	1
61	19	59	22.48	24.70	2.23	9	0
61	49	61	1520.21	1670.55	150.35	9	1
62	20	62	5108.77	5553.00	444.25	8	0
61	17	63	708.43	761.75	53.33	7	0
61	23	64	3572.37	3969.30	396.94	10	1
62	27	65	1385.58	1458.50	72.93	5	0
60	17	66	429.63	457.05	27.43	6	1
60	21	67	3315.06	3526.65	211.60	6	1
61	12	68	39.77	43.71	3.94	9	1
61	17	69	1401.63	1523.50	121.88	8	1
62	12	70	314.65	349.61	34.97	10	0
60	29	71	6450.74	6790.25	339.52	5	0
62	46	72	1472.93	1601.00	128.09	8	0
61	13	73	1433.93	1593.25	159.33	10	1
60	37	74	3906.23	4340.25	434.03	10	0
60	23	75	621.86	661.55	39.70	6	0
62	44	76	577.54	614.40	36.87	6	0
62	10	78	1876.29	2061.85	185.57	9	0
62	41	79	2934.55	3089.00	154.46	5	0
61	25	80	32.04	34.46	2.42	7	0
62	46	81	2233.40	2401.50	168.11	7	0
60	10	82	1095.73	1178.21	82.48	7	0
60	21	83	1058.00	1175.55	117.56	10	1
60	11	84	579.98	610.50	30.53	5	1
62	46	86	3722.33	4002.50	280.18	7	1
61	47	87	10381.50	11535.00	1153.50	10	1
61	14	88	6651.23	7151.85	500.63	7	0
60	20	89	1147.62	1234.00	86.39	7	0
60	15	91	243.46	270.50	27.06	10	1
62	10	92	1107.51	1178.21	70.70	6	0
61	45	93	1159.21	1260.00	100.80	8	1
61	29	94	12765.68	13580.50	814.83	6	0
60	12	97	415.15	437.00	21.86	5	0
62	19	98	66.69	74.10	7.42	10	0
62	15	99	1017.08	1082.00	64.93	6	1
62	26	100	8515.98	9256.50	740.52	8	0
62	32	101	541.46	595.00	53.55	9	0
62	40	102	10477.74	11514.00	1036.26	9	1
60	37	103	4947.89	5208.30	260.42	5	0
61	27	104	536.73	583.40	46.68	8	1
62	32	105	133.88	148.75	14.88	10	1
62	36	106	4330.94	4812.16	481.22	10	1
60	47	108	8305.21	9228.00	922.81	10	0
61	47	110	10958.25	11535.00	576.75	5	0
62	16	111	1397.26	1535.46	138.20	9	0
60	29	112	5051.95	5432.20	380.26	7	0
62	17	113	1133.49	1218.80	85.32	7	0
62	45	114	573.31	630.00	56.70	9	1
60	44	115	433.16	460.80	27.65	6	0
61	45	117	1134.00	1260.00	126.00	10	1
62	36	118	6530.78	6874.50	343.73	5	1
62	11	120	2777.78	3052.50	274.73	9	1
61	12	122	198.84	218.50	19.67	9	0
61	31	123	6011.65	6606.20	594.56	9	1
61	24	124	655.03	689.50	34.48	5	1
62	21	125	3173.99	3526.65	352.67	10	1
60	21	126	8934.18	9404.40	470.23	5	1
60	36	128	3835.98	4124.71	288.73	7	1
62	29	129	12358.26	13580.50	1222.25	9	0
62	10	130	1958.76	2061.85	103.10	5	0
60	35	131	784.81	872.00	87.21	10	1
62	25	132	250.80	275.61	24.81	9	1
61	31	134	10867.20	11560.86	693.66	6	0
62	13	135	2995.31	3186.50	191.19	6	1
61	44	137	291.84	307.20	15.36	5	1
60	14	138	7469.71	7946.50	476.79	6	1
61	38	139	1213.19	1304.50	91.32	7	1
61	20	140	573.81	617.00	43.20	7	1
60	40	142	8031.02	8635.50	604.49	7	1
60	11	143	5799.75	6105.00	305.25	5	0
62	33	144	532.36	585.00	52.65	9	1
60	47	146	3114.46	3460.50	346.06	10	1
62	31	147	3104.92	3303.10	198.19	6	1
61	32	148	669.38	743.75	74.38	10	1
62	17	149	700.82	761.75	60.94	8	0
61	10	151	1625.92	1767.31	141.39	8	1
60	13	152	2029.81	2230.55	200.75	9	0
60	31	155	13823.48	14863.95	1040.48	7	0
62	19	156	133.38	148.20	14.83	10	0
62	45	157	585.90	630.00	44.11	7	1
61	21	158	4231.98	4702.20	470.23	10	0
61	22	159	3419.53	3599.50	179.98	5	0
62	10	160	839.47	883.66	44.19	5	0
60	39	161	1485.67	1632.60	146.94	9	0
60	17	162	822.69	914.10	91.41	10	1
61	22	163	3887.46	4319.40	431.94	10	0
61	30	164	429.79	452.41	22.63	5	1
62	17	166	1261.46	1371.15	109.70	8	0
61	19	167	204.52	222.30	17.79	8	1
60	18	168	164.44	182.71	18.28	10	1
62	48	169	206.45	224.40	17.96	8	0
61	16	170	987.08	1096.75	109.68	10	0
62	26	171	2499.26	2776.95	277.70	10	0
60	14	174	6794.26	7151.85	357.60	5	0
62	14	175	5721.48	6357.20	635.73	10	1
60	42	176	664.05	699.00	34.96	5	1
62	47	177	7428.54	8074.50	645.97	8	0
60	21	178	2115.99	2351.10	235.12	10	0
62	29	179	1249.41	1358.05	108.65	8	0
62	13	180	2052.11	2230.55	178.45	8	1
62	38	183	1174.05	1304.50	130.46	10	1
62	43	184	327.25	363.61	36.37	10	1
60	14	186	1430.37	1589.30	158.94	10	0
60	38	187	1174.05	1304.50	130.46	10	1
61	14	188	5173.18	5562.56	389.38	7	0
60	14	190	6039.34	6357.20	317.87	5	0
62	37	191	5711.77	6076.35	364.59	6	0
61	34	192	798.25	849.21	50.96	6	1
62	28	193	5102.45	5371.00	268.56	5	1
60	46	194	2977.86	3202.00	224.15	7	0
61	33	195	1269.45	1365.00	95.56	7	0
62	33	196	370.50	390.00	19.50	5	0
62	23	197	1243.72	1323.10	79.39	6	0
60	21	199	3173.99	3526.65	352.67	10	0
62	15	200	1257.83	1352.50	94.68	7	0
62	45	201	2394.00	2520.00	126.00	5	1
60	20	202	2245.89	2468.00	222.13	9	1
61	45	203	585.90	630.00	44.11	7	1
62	19	204	68.92	74.10	5.19	7	1
61	11	205	4590.97	4884.00	293.04	6	0
61	16	206	1855.71	1974.15	118.45	6	0
60	50	207	8354.72	8888.00	533.28	6	1
62	16	208	1412.62	1535.46	122.84	8	1
61	14	209	5117.55	5562.56	445.01	8	1
61	44	210	875.52	921.60	46.08	5	0
62	10	211	1354.94	1472.75	117.83	8	1
60	17	212	411.35	457.05	45.71	10	0
62	25	213	282.15	310.06	27.91	9	1
61	17	216	708.43	761.75	53.33	7	0
61	31	217	10982.81	11560.86	578.05	5	0
61	10	219	2385.86	2650.96	265.10	10	1
60	31	220	14120.76	14863.95	743.20	5	0
61	39	221	9109.91	9795.60	685.70	7	0
61	44	222	1459.20	1536.00	76.81	5	0
60	36	223	1306.16	1374.91	68.75	5	1
60	33	224	1269.45	1365.00	95.56	7	1
62	13	225	2899.72	3186.50	286.79	9	1
60	16	227	618.57	658.05	39.49	6	0
62	44	228	1299.46	1382.40	82.95	6	0
60	15	229	1027.90	1082.00	54.11	5	0
62	24	230	376.47	413.71	37.24	9	0
61	26	234	6886.84	7405.20	518.37	7	1
62	21	235	3315.06	3526.65	211.60	6	1
60	33	236	1597.05	1755.00	157.95	9	0
60	12	237	393.31	437.00	43.71	10	0
61	14	238	723.14	794.65	71.52	9	0
61	33	239	362.70	390.00	27.31	7	0
60	27	240	262.53	291.70	29.18	10	0
60	19	241	159.07	172.91	13.84	8	0
60	40	242	2734.58	2878.50	143.93	5	1
60	13	243	908.16	955.95	47.80	5	1
62	15	244	628.92	676.25	47.34	7	0
62	18	245	168.09	182.71	14.62	8	0
62	31	247	10867.20	11560.86	693.66	6	0
60	35	248	1255.69	1395.21	139.53	10	0
60	29	250	2471.66	2716.10	244.45	9	0
62	35	1	973.16	1046.41	73.25	7	0
62	30	2	1002.83	1055.61	52.79	5	0
61	13	3	1758.95	1911.90	152.96	8	0
62	44	4	276.49	307.20	30.72	10	0
62	43	6	690.85	727.21	36.37	5	1
60	10	7	2650.96	2945.50	294.56	10	1
61	14	8	2169.40	2383.95	214.56	9	1
61	32	9	1106.70	1190.00	83.31	7	0
61	19	10	23.22	24.70	1.49	6	0
61	46	11	3602.25	4002.50	400.25	10	0
61	48	12	632.81	673.20	40.40	6	1
60	23	13	3572.37	3969.30	396.94	10	1
61	29	14	12765.68	13580.50	814.83	6	0
61	36	17	6324.54	6874.50	549.97	8	0
61	13	18	2294.28	2549.20	254.92	10	0
61	50	19	6999.31	7777.00	777.71	10	1
61	24	20	310.28	344.75	34.48	10	0
62	27	22	1312.66	1458.50	145.85	10	0
60	40	23	3972.34	4317.75	345.43	8	1
62	48	24	284.24	299.20	14.97	5	0
60	31	25	15029.11	16515.50	1486.40	9	1
61	24	27	512.99	551.61	38.62	7	1
61	21	29	9839.36	10579.95	740.60	7	0
62	41	30	2248.80	2471.20	222.41	9	0
60	32	31	410.56	446.25	35.71	8	1
60	25	32	229.10	241.16	12.06	5	1
62	20	33	1684.42	1851.00	166.60	9	0
62	42	34	1137.63	1223.25	85.63	7	0
60	38	35	970.55	1043.60	73.06	7	1
60	16	36	833.53	877.40	43.88	5	1
61	35	37	1159.76	1220.80	61.04	5	1
62	42	38	629.11	699.00	69.91	10	1
60	13	39	1159.89	1274.60	114.72	9	0
61	20	40	2245.89	2468.00	222.13	9	1
62	38	41	735.74	782.70	46.97	6	0
60	41	42	2872.77	3089.00	216.24	7	1
61	44	43	583.68	614.40	30.72	5	0
60	16	44	592.25	658.05	65.81	10	0
62	39	45	8914.00	9795.60	881.61	9	1
60	48	47	136.14	149.60	13.47	9	0
60	32	48	1271.82	1338.75	66.94	5	1
61	29	52	9995.25	10864.40	869.16	8	1
61	14	53	7390.25	7946.50	556.26	7	1
62	41	54	2248.80	2471.20	222.41	9	0
60	48	55	139.13	149.60	10.48	7	0
61	47	56	3252.87	3460.50	207.63	6	1
60	13	58	2119.03	2230.55	111.53	5	0
60	22	59	2008.53	2159.70	151.18	7	0
60	16	61	1443.33	1535.46	92.13	6	1
61	10	62	2412.37	2650.96	238.59	9	1
61	50	63	2022.02	2222.00	199.98	9	1
60	20	64	4059.86	4319.00	259.14	6	0
61	18	65	19.29	20.31	1.02	5	0
60	49	66	887.78	954.61	66.83	7	1
60	30	67	693.69	754.00	60.33	8	1
61	19	69	179.82	197.60	17.79	9	1
61	28	73	3496.53	3759.71	263.18	7	1
60	38	74	485.28	521.80	36.53	7	1
62	33	77	1269.45	1365.00	95.56	7	0
61	34	78	798.25	849.21	50.96	6	1
62	17	79	1371.16	1523.50	152.35	10	0
62	13	80	1513.59	1593.25	79.67	5	1
61	34	81	997.81	1061.50	63.69	6	1
60	29	82	11122.43	12222.45	1100.03	9	0
61	33	84	1228.50	1365.00	136.50	10	0
62	39	85	6203.88	6530.40	326.52	5	0
60	38	87	2136.78	2348.10	211.33	9	1
60	40	88	9369.52	10074.75	705.24	7	1
60	33	89	555.75	585.00	29.25	5	0
62	32	90	535.50	595.00	59.50	10	0
62	42	91	1100.93	1223.25	122.33	10	1
60	22	92	6479.11	7199.00	719.91	10	0
62	28	93	999.01	1074.21	75.20	7	0
62	32	94	1204.88	1338.75	133.88	10	1
61	27	95	525.06	583.40	58.35	10	1
61	21	96	6630.11	7053.30	423.20	6	0
60	28	97	3383.74	3759.71	375.98	10	1
61	16	98	206.19	219.35	13.17	6	1
60	43	99	248.16	272.71	24.55	9	1
62	38	100	2426.37	2609.00	182.64	7	1
62	20	101	3331.81	3702.00	370.21	10	0
62	37	102	3949.63	4340.25	390.63	9	1
60	11	103	4444.45	4884.00	439.57	9	0
62	11	104	2197.81	2442.00	244.21	10	1
62	17	105	277.28	304.70	27.43	9	0
62	26	106	1703.20	1851.30	148.11	8	0
62	42	107	321.55	349.50	27.97	8	1
61	21	109	6347.97	7053.30	705.33	10	0
60	10	110	2518.41	2650.96	132.55	5	0
60	24	111	125.49	137.91	12.42	9	1
60	49	112	439.12	477.31	38.19	8	0
62	11	113	2295.49	2442.00	146.52	6	1
61	25	114	313.50	344.50	31.01	9	0
61	30	115	814.33	904.81	90.49	10	0
61	18	117	37.36	40.61	3.25	8	1
62	33	118	1632.15	1755.00	122.86	7	0
61	31	119	9116.56	9909.30	792.75	8	1
61	13	122	2052.11	2230.55	178.45	8	0
62	44	123	291.84	307.20	15.36	5	1
60	22	124	5960.78	6479.10	518.33	8	1
60	49	126	1737.38	1909.21	171.83	9	1
60	27	127	277.12	291.70	14.59	5	0
62	16	128	815.99	877.40	61.42	7	0
61	44	130	729.60	768.00	38.41	5	0
62	23	131	3076.21	3307.75	231.55	7	0
61	14	132	2860.74	3178.60	317.87	10	0
61	41	133	5807.32	6178.00	370.69	6	1
61	50	134	7388.15	7777.00	388.86	5	1
60	11	136	3443.22	3663.00	219.79	6	0
60	38	137	2160.26	2348.10	187.85	8	1
62	15	138	503.13	541.00	37.88	7	0
61	11	139	5677.65	6105.00	427.36	7	0
61	41	141	4645.86	4942.40	296.55	6	0
60	25	142	320.39	344.50	24.12	7	1
61	27	143	822.60	875.10	52.51	6	0
60	34	144	1411.80	1486.11	74.31	5	1
61	32	145	838.95	892.50	53.55	6	0
62	41	146	1112.04	1235.60	123.57	10	0
61	16	148	1875.45	1974.15	98.71	5	1
60	49	149	221.95	238.66	16.71	7	0
62	50	150	5277.25	5555.00	277.75	5	0
60	19	151	69.66	74.10	4.45	6	0
62	20	152	4059.86	4319.00	259.14	6	1
61	38	154	2478.55	2609.00	130.46	5	0
60	30	155	1146.08	1206.41	60.33	5	0
61	40	156	9571.02	10074.75	503.74	5	1
61	27	157	2625.31	2917.00	291.70	10	0
61	23	159	1845.73	1984.65	138.93	7	0
60	44	161	145.92	153.60	7.68	5	0
62	25	162	219.45	241.16	21.71	9	1
62	49	163	673.00	715.96	42.96	6	1
60	21	164	5407.54	5877.75	470.23	8	1
61	46	165	1821.14	2001.25	180.12	9	1
60	36	166	3753.48	4124.71	371.23	9	1
60	12	167	328.63	349.61	20.98	6	0
60	26	168	8608.55	9256.50	647.96	7	0
60	38	169	712.26	782.70	70.45	9	0
61	37	170	815.97	868.05	52.09	6	1
60	42	171	1113.16	1223.25	110.10	9	1
61	16	172	2039.96	2193.50	153.55	7	0
62	15	173	246.16	270.50	24.35	9	1
60	38	174	949.68	1043.60	93.93	9	0
62	50	175	3099.69	3333.00	233.32	7	1
60	11	176	5616.61	6105.00	488.41	8	0
60	19	177	111.16	123.50	12.36	10	0
60	26	178	8515.98	9256.50	740.52	8	1
62	50	179	9999.00	11110.00	1111.00	10	0
62	49	180	1536.91	1670.55	133.65	8	0
60	33	181	1667.25	1755.00	87.75	5	0
60	24	182	434.39	482.66	48.27	10	0
61	26	183	8423.42	9256.50	833.09	9	1
62	40	184	12176.06	12953.25	777.20	6	1
61	47	185	3149.06	3460.50	311.45	9	1
61	27	186	1327.24	1458.50	131.27	9	0
60	32	188	1130.50	1190.00	59.50	5	1
61	48	190	481.72	523.61	41.89	8	1
60	46	191	376.24	400.25	24.02	6	0
62	37	192	5772.54	6076.35	303.82	5	1
61	49	193	1737.38	1909.21	171.83	9	0
62	33	194	549.90	585.00	35.11	6	1
61	18	195	18.27	20.31	2.04	10	0
62	46	197	2257.41	2401.50	144.10	6	1
62	17	198	572.84	609.40	36.57	6	1
61	45	199	2608.21	2835.00	226.81	8	0
61	37	201	789.93	868.05	78.13	9	0
60	46	202	1128.71	1200.75	72.05	6	0
60	38	203	237.42	260.90	23.49	9	1
60	33	205	549.90	585.00	35.11	6	0
61	10	207	268.05	294.56	26.51	9	1
60	32	208	410.56	446.25	35.71	8	1
62	29	209	7740.89	8148.30	407.42	5	0
60	35	211	1325.45	1395.21	69.77	5	0
61	13	212	1210.87	1274.60	63.73	5	1
60	13	214	1172.64	1274.60	101.97	8	1
61	28	215	3534.12	3759.71	225.59	6	0
62	16	216	412.38	438.70	26.33	6	1
60	17	218	685.58	761.75	76.18	10	1
62	21	219	4420.07	4702.20	282.14	6	1
62	23	220	3651.76	3969.30	317.55	8	1
61	39	221	13517.93	14693.40	1175.48	8	0
62	24	222	583.32	620.56	37.24	6	0
60	49	223	1570.32	1670.55	100.24	6	0
60	12	226	321.64	349.61	27.97	8	0
60	14	227	6794.26	7151.85	357.60	5	0
61	26	228	6025.99	6479.56	453.57	7	1
61	50	229	2088.68	2222.00	133.32	6	1
62	23	230	595.40	661.55	66.16	10	0
60	22	231	4636.16	5039.31	403.15	8	0
62	39	232	9011.96	9795.60	783.65	8	0
60	47	233	6505.74	6921.00	415.26	6	0
60	21	234	8934.18	9404.40	470.23	5	1
61	41	235	4108.37	4324.60	216.23	5	0
61	23	236	5537.18	5953.95	416.78	7	1
61	34	237	1008.43	1061.50	53.08	5	0
61	11	238	1159.96	1221.00	61.06	5	1
60	14	239	4434.15	4767.90	333.76	7	0
62	35	240	1459.73	1569.61	109.88	7	0
62	19	242	22.24	24.70	2.48	10	1
61	40	243	7771.95	8635.50	863.56	10	0
62	37	244	8159.67	8680.50	520.83	6	1
61	49	245	1718.28	1909.21	190.93	10	0
61	15	246	899.42	946.75	47.34	5	0
60	39	247	3036.64	3265.20	228.57	7	1
60	17	248	434.20	457.05	22.86	5	1
62	41	1	1136.76	1235.60	98.85	8	0
60	45	3	592.20	630.00	37.80	6	1
62	30	5	573.04	603.21	30.17	5	1
62	22	6	2706.83	2879.60	172.78	6	1
61	23	7	1825.88	1984.65	158.78	8	0
61	50	8	1999.80	2222.00	222.21	10	1
60	35	9	648.77	697.61	48.84	7	0
62	11	10	4542.12	4884.00	341.89	7	0
60	39	11	12015.94	13060.80	1044.87	8	0
60	40	12	13097.18	14392.50	1295.33	9	1
60	16	13	1427.97	1535.46	107.49	7	1
62	30	14	1289.34	1357.21	67.86	5	0
62	30	15	1262.20	1357.21	95.01	7	0
61	14	16	5284.43	5562.56	278.13	5	0
60	40	17	13672.88	14392.50	719.63	5	1
60	10	18	1855.67	2061.85	206.19	10	1
62	44	19	279.56	307.20	27.65	9	1
61	25	20	64.77	68.91	4.14	6	0
62	24	21	250.98	275.81	24.83	9	1
61	27	24	268.37	291.70	23.34	8	1
60	47	25	7509.29	8074.50	565.22	7	0
60	50	26	4044.04	4444.00	399.96	9	1
62	42	28	492.80	524.25	31.46	6	1
62	12	29	238.61	262.21	23.60	9	1
60	23	30	6218.57	6615.50	396.94	6	0
60	11	31	2246.64	2442.00	195.37	8	1
61	23	32	3572.37	3969.30	396.94	10	1
60	36	34	2612.31	2749.81	137.50	5	0
60	12	35	201.03	218.50	17.49	8	0
62	32	36	676.82	743.75	66.94	9	1
62	39	37	1534.65	1632.60	97.96	6	0
60	50	38	4999.50	5555.00	555.50	10	1
62	33	39	544.05	585.00	40.96	7	1
62	34	40	399.13	424.61	25.48	6	0
61	50	41	1044.34	1111.00	66.66	6	1
61	15	42	871.01	946.75	75.74	8	1
62	28	43	5048.74	5371.00	322.26	6	1
60	25	44	95.09	103.36	8.27	8	1
60	32	45	706.57	743.75	37.19	5	1
61	35	46	1297.54	1395.21	97.67	7	1
62	30	48	960.60	1055.61	95.01	9	1
60	11	49	1648.36	1831.50	183.16	10	0
60	27	50	1050.12	1166.80	116.69	10	0
62	14	51	2240.92	2383.95	143.04	6	0
62	19	52	232.18	247.00	14.83	6	0
60	34	53	2016.85	2123.00	106.16	5	1
62	18	55	57.86	60.91	3.05	5	0
60	50	56	6132.73	6666.00	533.28	8	0
62	27	57	1371.00	1458.50	87.51	6	1
60	47	59	9447.17	10381.50	934.34	9	1
62	18	60	114.50	121.81	7.31	6	0
62	24	63	393.02	413.71	20.69	5	0
61	26	64	8701.11	9256.50	555.39	6	0
60	10	65	2465.39	2650.96	185.57	7	0
62	27	67	2389.03	2625.30	236.28	9	1
60	17	68	1302.60	1371.15	68.56	5	0
60	19	69	45.45	49.40	3.96	8	0
62	28	70	2497.52	2685.50	187.99	7	1
60	45	71	888.30	945.00	56.70	6	0
60	34	72	1352.36	1486.11	133.75	9	1
61	47	73	7590.03	8074.50	484.47	6	1
62	10	74	268.05	294.56	26.51	9	0
61	48	75	626.08	673.20	47.13	7	0
61	22	76	669.51	719.90	50.40	7	1
62	34	77	1815.17	1910.71	95.54	5	0
60	47	80	10381.50	11535.00	1153.50	10	0
61	18	81	184.74	203.00	18.27	9	0
62	30	82	701.22	754.00	52.79	7	0
61	45	83	585.90	630.00	44.11	7	1
61	13	84	286.79	318.65	31.87	10	0
62	13	85	1778.07	1911.90	133.84	7	1
62	24	86	194.44	206.86	12.42	6	1
62	31	87	9215.65	9909.30	693.66	7	1
60	26	88	5831.60	6479.56	647.96	10	1
60	42	89	1478.39	1572.75	94.37	6	1
60	29	90	2553.14	2716.10	162.97	6	1
60	28	91	4398.85	4833.91	435.06	9	1
60	14	92	3575.93	3973.25	397.33	10	0
61	19	93	111.16	123.50	12.36	10	0
62	20	95	4491.77	4936.00	444.25	9	0
60	27	96	2389.03	2625.30	236.28	9	1
62	46	97	368.24	400.25	32.03	8	1
61	48	98	275.27	299.20	23.94	8	0
61	48	99	695.64	748.00	52.37	7	1
62	18	104	57.86	60.91	3.05	5	0
62	43	107	777.20	818.11	40.91	5	1
61	49	108	1536.91	1670.55	133.65	8	1
60	13	109	302.72	318.65	15.94	5	0
61	18	111	112.06	121.81	9.75	8	1
60	17	112	822.69	914.10	91.41	10	0
62	36	114	1959.24	2062.36	103.12	5	0
62	31	115	9314.75	9909.30	594.56	6	1
61	43	116	169.08	181.81	12.73	7	0
60	42	117	328.53	349.50	20.97	6	0
62	17	118	1432.09	1523.50	91.41	6	0
62	41	119	2934.55	3089.00	154.46	5	1
61	50	120	3166.35	3333.00	166.66	5	0
60	38	121	1487.13	1565.40	78.27	5	1
60	27	122	2441.53	2625.30	183.78	7	0
61	21	124	6418.51	7053.30	634.80	9	1
62	33	125	906.75	975.00	68.25	7	0
61	28	126	3421.33	3759.71	338.38	9	0
62	34	129	1411.80	1486.11	74.31	5	1
62	28	130	3571.72	3759.71	187.99	5	0
61	40	131	8031.02	8635.50	604.49	7	0
62	34	132	1008.43	1061.50	53.08	5	0
60	39	134	7673.22	8163.00	489.78	6	1
61	42	135	159.03	174.75	15.73	9	0
61	30	136	1109.89	1206.41	96.52	8	0
61	17	137	548.47	609.40	60.94	10	0
60	41	138	1161.47	1235.60	74.14	6	0
61	17	139	138.64	152.35	13.72	9	0
60	28	140	504.88	537.11	32.23	6	1
61	32	141	1071.00	1190.00	119.00	10	1
60	15	142	381.41	405.75	24.35	6	0
61	39	143	13517.93	14693.40	1175.48	8	0
60	49	144	1536.91	1670.55	133.65	8	0
62	44	146	141.32	153.60	12.29	8	1
60	17	147	1133.49	1218.80	85.32	7	0
61	16	148	1223.98	1316.10	92.13	7	0
61	28	149	3867.13	4296.81	429.69	10	0
62	24	150	512.99	551.61	38.62	7	1
60	16	151	408.00	438.70	30.71	7	1
62	35	152	962.69	1046.41	83.72	8	0
60	17	153	274.24	304.70	30.47	10	0
61	48	154	355.31	374.00	18.70	5	1
61	48	155	355.31	374.00	18.70	5	0
61	46	156	3642.28	4002.50	360.23	9	1
60	40	158	10592.89	11514.00	921.13	8	0
61	39	159	4408.02	4897.80	489.78	10	0
61	38	160	991.42	1043.60	52.18	5	0
61	37	161	1562.50	1736.10	173.62	10	1
62	43	162	82.72	90.91	8.19	9	0
62	18	163	186.77	203.00	16.25	8	0
62	38	164	1716.73	1826.30	109.58	6	0
62	20	165	5275.35	5553.00	277.66	5	0
60	16	166	605.41	658.05	52.65	8	0
61	29	168	10103.90	10864.40	760.51	7	1
60	49	169	651.52	715.96	64.44	9	0
60	28	170	4447.19	4833.91	386.72	8	0
60	39	171	15183.18	16326.00	1142.83	7	0
61	29	173	3788.96	4074.15	285.20	7	0
60	27	174	1085.13	1166.80	81.68	7	0
60	38	176	1440.17	1565.40	125.24	8	0
60	10	177	1625.92	1767.31	141.39	8	0
61	34	178	1974.39	2123.00	148.62	7	1
62	20	179	5614.70	6170.00	555.30	9	0
62	29	180	11244.66	12222.45	977.80	8	0
61	36	181	3753.48	4124.71	371.23	9	0
62	48	182	695.64	748.00	52.37	7	0
62	30	183	1134.02	1206.41	72.39	6	0
60	48	185	69.57	74.80	5.24	7	0
62	34	186	197.44	212.31	14.87	7	0
61	14	187	7469.71	7946.50	476.79	6	0
62	13	188	1758.95	1911.90	152.96	8	0
61	41	189	4065.13	4324.60	259.48	6	1
62	16	190	592.25	658.05	65.81	10	0
61	21	191	5525.09	5877.75	352.67	6	0
62	28	192	2470.67	2685.50	214.85	8	0
62	25	193	130.91	137.81	6.90	5	0
60	15	196	492.32	541.00	48.69	9	1
61	29	197	12765.68	13580.50	814.83	6	0
62	13	198	1797.19	1911.90	114.72	6	1
61	14	200	6651.23	7151.85	500.63	7	0
62	41	201	574.56	617.80	43.25	7	1
62	24	202	313.73	344.75	31.03	9	0
61	12	203	78.67	87.41	8.75	10	1
62	19	204	22.24	24.70	2.48	10	1
62	45	205	1146.61	1260.00	113.40	9	1
60	17	206	1447.33	1523.50	76.18	5	0
60	24	208	310.28	344.75	34.48	10	1
61	21	210	7488.26	8228.86	740.60	9	0
62	11	211	2295.49	2442.00	146.52	6	1
60	28	212	1466.29	1611.31	145.02	9	0
60	13	213	2695.78	2867.85	172.08	6	0
60	11	214	2747.25	3052.50	305.25	10	1
60	40	216	4015.51	4317.75	302.25	7	0
61	26	217	4998.52	5553.90	555.39	10	0
60	14	218	6794.26	7151.85	357.60	5	1
62	23	219	5358.56	5953.95	595.40	10	0
62	31	220	7597.14	8257.75	660.63	8	0
62	28	222	4592.21	4833.91	241.70	5	0
61	14	223	723.14	794.65	71.52	9	1
61	32	224	136.85	148.75	11.91	8	1
60	18	225	56.64	60.91	4.27	7	0
60	27	226	831.35	875.10	43.76	5	0
62	48	228	556.52	598.40	41.89	7	0
62	31	229	10867.20	11560.86	693.66	6	1
61	50	231	2088.68	2222.00	133.32	6	0
61	37	232	4687.47	5208.30	520.83	10	0
62	25	233	32.39	34.46	2.07	6	0
62	10	234	1608.25	1767.31	159.06	9	1
62	17	235	1302.60	1371.15	68.56	5	0
62	26	236	5220.67	5553.90	333.24	6	1
60	46	237	2161.35	2401.50	240.16	10	0
60	13	238	1758.95	1911.90	152.96	8	1
61	21	241	4467.09	4702.20	235.12	5	1
60	25	242	192.24	206.71	14.47	7	0
61	26	243	5054.05	5553.90	499.86	9	0
61	47	245	2191.66	2307.00	115.36	5	0
61	22	246	4060.24	4319.40	259.17	6	0
61	25	247	229.10	241.16	12.06	5	0
60	13	248	2638.43	2867.85	229.43	8	1
61	16	250	1649.52	1754.80	105.29	6	0
61	22	1	683.91	719.90	36.00	5	0
60	46	2	2913.83	3202.00	288.19	9	1
61	37	3	3906.23	4340.25	434.03	10	0
62	32	5	847.88	892.50	44.63	5	0
62	15	6	1217.25	1352.50	135.25	10	1
62	40	7	6620.56	7196.25	575.71	8	1
60	28	9	1955.05	2148.41	193.36	9	0
62	11	10	5555.56	6105.00	549.45	9	0
60	49	12	1503.50	1670.55	167.06	10	1
62	43	13	836.29	909.00	72.72	8	0
61	18	14	164.44	182.71	18.28	10	0
62	47	15	2145.51	2307.00	161.50	7	0
60	35	16	486.58	523.21	36.63	7	1
61	21	17	4326.03	4702.20	376.18	8	1
62	47	19	7670.78	8074.50	403.73	5	0
62	47	21	10496.86	11535.00	1038.15	9	0
61	26	22	4257.99	4628.25	370.26	8	0
60	49	23	1954.55	2147.85	193.31	9	1
61	18	24	18.68	20.31	1.63	8	1
62	44	25	414.72	460.80	46.08	10	1
60	21	26	8934.18	9404.40	470.23	5	0
61	39	27	10399.67	11428.20	1028.54	9	1
61	38	29	490.50	521.80	31.31	6	1
60	30	30	832.42	904.81	72.39	8	1
61	27	31	1085.13	1166.80	81.68	7	0
60	49	32	1587.03	1670.55	83.53	5	1
62	28	33	488.77	537.11	48.34	9	1
61	21	34	11050.18	11755.50	705.33	6	0
61	27	36	1327.24	1458.50	131.27	9	0
60	11	38	3369.97	3663.00	293.05	8	1
61	50	39	8265.85	8888.00	622.17	7	0
62	30	40	1248.63	1357.21	108.58	8	1
60	39	41	14856.66	16326.00	1469.34	9	0
61	28	42	3534.12	3759.71	225.59	6	0
62	46	43	752.47	800.50	48.04	6	0
62	26	44	5961.19	6479.56	518.37	8	1
62	44	45	721.92	768.00	46.08	6	1
61	31	46	1552.46	1651.55	99.10	6	1
62	17	47	1121.30	1218.80	97.51	8	0
62	21	48	1069.76	1175.55	105.80	9	0
61	39	49	15509.70	16326.00	816.31	5	1
62	25	50	160.20	172.25	12.06	7	1
61	28	51	2443.81	2685.50	241.70	9	1
60	49	52	2195.58	2386.50	190.93	8	0
62	18	54	19.09	20.31	1.22	6	0
60	30	57	542.89	603.21	60.33	10	0
61	49	58	217.18	238.66	21.48	9	1
62	10	59	1119.29	1178.21	58.92	5	1
60	38	61	2374.20	2609.00	234.82	9	0
62	23	62	1845.73	1984.65	138.93	7	1
60	30	63	950.05	1055.61	105.57	10	0
61	44	64	847.88	921.60	73.73	8	0
61	17	65	283.38	304.70	21.33	7	0
61	13	66	2667.11	2867.85	200.75	7	0
60	13	67	2667.11	2867.85	200.75	7	0
60	40	69	6836.44	7196.25	359.82	5	0
62	44	70	433.16	460.80	27.65	6	0
61	38	71	1698.46	1826.30	127.85	7	1
61	45	72	1701.00	1890.00	189.00	10	0
62	30	73	271.45	301.61	30.17	10	0
61	20	74	2930.75	3085.00	154.25	5	1
60	42	75	1642.65	1747.50	104.85	6	0
61	18	76	166.26	182.71	16.45	9	1
61	25	77	64.08	68.91	4.83	7	0
62	17	79	283.38	304.70	21.33	7	0
61	50	80	7077.08	7777.00	699.93	9	0
62	23	81	3731.15	3969.30	238.16	6	1
60	26	82	4257.99	4628.25	370.26	8	1
62	35	83	1639.36	1744.00	104.65	6	0
60	32	84	423.94	446.25	22.32	5	1
60	21	85	4279.01	4702.20	423.20	9	1
62	21	86	7570.55	8228.86	658.31	8	0
62	30	87	429.79	452.41	22.63	5	1
61	13	88	2609.75	2867.85	258.11	9	1
60	24	91	388.88	413.71	24.83	6	1
60	17	92	1109.11	1218.80	109.70	9	0
61	40	93	6764.48	7196.25	431.78	6	0
62	43	94	170.90	181.81	10.91	6	1
62	12	95	124.55	131.11	6.56	5	0
61	16	96	1614.42	1754.80	140.39	8	0
62	23	97	2487.43	2646.20	158.78	6	0
60	10	98	1340.21	1472.75	132.55	9	0
62	11	99	3479.85	3663.00	183.16	5	0
61	23	101	1845.73	1984.65	138.93	7	1
60	25	102	98.19	103.36	5.17	5	1
62	14	103	2860.74	3178.60	317.87	10	0
60	25	104	97.15	103.36	6.21	6	0
60	18	106	168.09	182.71	14.62	8	0
60	12	108	166.07	174.81	8.75	5	1
61	43	109	418.15	454.50	36.36	8	0
60	40	110	6692.52	7196.25	503.74	7	1
62	19	111	90.90	98.80	7.91	8	1
61	30	112	841.47	904.81	63.34	7	1
61	40	113	2590.66	2878.50	287.86	10	1
61	19	114	229.71	247.00	17.30	7	0
61	30	115	841.47	904.81	63.34	7	0
61	19	116	137.83	148.20	10.38	7	1
62	45	117	573.31	630.00	56.70	9	1
61	25	118	310.06	344.50	34.46	10	1
62	41	119	4108.37	4324.60	216.23	5	0
60	50	122	9299.07	9999.00	699.94	7	1
60	17	123	1432.09	1523.50	91.41	6	1
62	30	125	138.74	150.81	12.07	8	0
62	27	126	2467.79	2625.30	157.52	6	0
60	19	127	232.18	247.00	14.83	6	0
60	37	128	807.29	868.05	60.77	7	1
61	24	129	434.39	482.66	48.27	10	1
60	34	130	193.20	212.31	19.11	9	0
62	39	131	13224.06	14693.40	1469.35	10	0
60	28	132	3534.12	3759.71	225.59	6	0
60	10	133	265.10	294.56	29.46	10	1
61	47	135	5479.13	5767.50	288.38	5	1
61	21	136	5583.87	5877.75	293.89	5	1
61	40	137	5238.87	5757.00	518.13	9	0
61	40	138	2677.01	2878.50	201.50	7	0
62	39	139	7346.70	8163.00	816.31	10	0
60	11	140	5109.89	5494.50	384.62	7	1
62	28	141	488.77	537.11	48.34	9	0
60	12	143	196.66	218.50	21.86	10	1
60	25	145	161.92	172.25	10.34	6	0
62	20	146	1122.95	1234.00	111.07	9	0
62	43	147	818.11	909.00	90.91	10	1
61	21	148	8934.18	9404.40	470.23	5	0
61	25	149	126.78	137.81	11.03	8	1
60	29	151	7740.89	8148.30	407.42	5	0
62	50	152	4088.49	4444.00	355.52	8	1
61	30	153	1085.77	1206.41	120.65	10	0
61	31	154	15029.11	16515.50	1486.40	9	0
62	25	155	188.10	206.71	18.61	9	0
62	39	156	6203.88	6530.40	326.52	5	1
62	12	157	159.07	174.81	15.74	9	0
61	38	158	485.28	521.80	36.53	7	1
61	41	159	2934.55	3089.00	154.46	5	0
62	48	160	208.70	224.40	15.71	7	0
61	32	161	957.96	1041.25	83.30	8	0
60	17	163	1288.89	1371.15	82.27	6	0
61	15	167	1006.26	1082.00	75.75	7	1
60	24	168	194.44	206.86	12.42	6	0
62	21	170	7652.84	8228.86	576.02	7	0
61	34	171	1738.74	1910.71	171.97	9	1
61	30	172	1002.83	1055.61	52.79	5	1
62	41	174	1112.04	1235.60	123.57	10	0
60	43	175	431.78	454.50	22.73	5	0
61	49	178	673.00	715.96	42.96	6	1
60	31	179	9116.56	9909.30	792.75	8	1
61	17	181	840.98	914.10	73.13	8	1
60	49	182	859.14	954.61	95.47	10	0
61	16	183	394.83	438.70	43.88	10	0
62	21	184	10697.51	11755.50	1058.00	9	0
60	42	185	487.56	524.25	36.70	7	1
62	34	187	394.88	424.61	29.73	7	1
61	49	188	217.18	238.66	21.48	9	0
61	16	189	611.99	658.05	46.07	7	1
61	35	190	962.69	1046.41	83.72	8	1
62	33	191	370.50	390.00	19.50	5	0
61	23	192	4921.94	5292.40	370.47	7	0
60	18	194	75.52	81.21	5.69	7	1
61	38	195	2160.26	2348.10	187.85	8	1
61	15	196	1132.05	1217.25	85.21	7	1
60	23	197	1845.73	1984.65	138.93	7	1
62	31	199	3038.86	3303.10	264.25	8	1
62	47	200	1095.83	1153.50	57.68	5	1
62	29	201	8650.78	9506.36	855.58	9	1
62	37	203	1562.50	1736.10	173.62	10	0
62	22	207	5895.99	6479.10	583.12	9	1
60	37	208	7812.45	8680.50	868.06	10	0
60	46	209	376.24	400.25	24.02	6	0
60	28	210	1498.51	1611.31	112.80	7	0
60	12	211	39.77	43.71	3.94	9	0
61	42	212	314.56	349.50	34.96	10	0
62	14	213	5228.80	5562.56	333.76	6	1
61	18	214	73.08	81.21	8.13	10	0
61	47	215	8674.32	9228.00	553.68	6	0
61	47	216	8397.48	9228.00	830.52	9	0
61	24	217	194.44	206.86	12.42	6	0
62	48	218	347.82	374.00	26.19	7	0
61	29	220	2471.66	2716.10	244.45	9	0
60	15	221	1107.70	1217.25	109.56	9	1
62	48	224	136.14	149.60	13.47	9	1
62	42	225	166.02	174.75	8.74	5	0
61	21	226	11167.73	11755.50	587.78	5	1
62	25	227	31.70	34.46	2.76	8	1
61	36	228	1278.66	1374.91	96.25	7	0
62	36	229	4427.18	4812.16	384.98	8	1
62	12	230	357.91	393.31	35.40	9	0
61	15	231	243.46	270.50	27.06	10	0
61	15	232	1144.22	1217.25	73.04	6	0
62	10	233	2167.89	2356.41	188.52	8	0
60	37	234	5529.48	6076.35	546.88	9	0
62	29	235	6111.23	6790.25	679.03	10	1
60	44	236	437.76	460.80	23.04	5	1
62	37	237	7265.58	7812.45	546.88	7	1
60	40	238	4058.69	4317.75	259.07	6	1
62	48	239	140.63	149.60	8.98	6	1
62	13	240	1816.31	1911.90	95.60	5	0
60	25	241	160.20	172.25	12.06	7	0
61	10	242	2238.58	2356.41	117.83	5	0
62	49	243	1813.75	1909.21	95.47	5	1
62	12	244	410.78	437.00	26.22	6	0
61	42	245	159.03	174.75	15.73	9	0
61	24	246	453.70	482.66	28.96	6	0
61	49	247	2195.58	2386.50	190.93	8	0
61	37	248	4123.24	4340.25	217.02	5	0
60	30	249	573.04	603.21	30.17	5	0
62	50	250	7154.85	7777.00	622.16	8	0
62	11	1	5799.75	6105.00	305.25	5	0
60	28	2	3867.13	4296.81	429.69	10	1
61	21	3	4420.07	4702.20	282.14	6	1
62	24	5	439.22	482.66	43.44	9	0
60	33	6	1450.80	1560.00	109.21	7	1
61	38	7	2348.10	2609.00	260.91	10	0
62	28	8	3383.74	3759.71	375.98	10	1
62	47	9	1095.83	1153.50	57.68	5	0
62	14	12	723.14	794.65	71.52	9	1
61	11	13	4017.09	4273.50	256.41	6	1
61	38	14	2478.55	2609.00	130.46	5	1
61	50	16	9399.06	9999.00	599.94	6	1
62	20	17	1135.28	1234.00	98.72	8	0
60	49	18	859.14	954.61	95.47	10	1
60	43	19	752.66	818.11	65.45	8	1
62	31	20	13377.56	14863.95	1486.40	10	1
62	33	21	1111.50	1170.00	58.50	5	0
60	11	23	1159.96	1221.00	61.06	5	0
60	28	25	2551.23	2685.50	134.28	5	0
61	46	26	736.47	800.50	64.05	8	0
60	39	27	1469.34	1632.60	163.26	10	1
62	17	28	1416.86	1523.50	106.65	7	0
62	39	29	4457.00	4897.80	440.81	9	1
60	22	30	5183.28	5759.20	575.92	10	1
62	21	31	7488.26	8228.86	740.60	9	1
62	25	33	62.70	68.91	6.21	9	0
60	26	34	6960.89	7405.20	444.32	6	0
62	48	35	281.25	299.20	17.96	6	0
61	24	36	313.73	344.75	31.03	9	0
62	11	40	2319.91	2442.00	122.11	5	0
60	44	41	989.19	1075.21	86.02	8	0
62	32	42	1271.82	1338.75	66.94	5	0
60	14	44	2987.89	3178.60	190.72	6	1
60	44	46	866.31	921.60	55.30	6	0
62	30	47	1275.77	1357.21	81.44	6	0
62	22	48	1986.93	2159.70	172.78	8	1
62	27	49	1898.97	2041.90	142.94	7	1
61	15	51	508.54	541.00	32.47	6	1
61	41	52	580.74	617.80	37.07	6	0
60	25	53	190.17	206.71	16.54	8	1
62	12	55	249.10	262.21	13.12	5	1
62	33	56	725.40	780.00	54.61	7	0
60	19	57	133.38	148.20	14.83	10	1
62	28	58	1450.18	1611.31	161.14	10	0
62	36	59	3835.98	4124.71	288.73	7	0
62	34	60	1562.53	1698.41	135.88	8	0
62	24	61	65.51	68.96	3.45	5	1
61	19	62	93.86	98.80	4.95	5	1
61	45	63	2050.65	2205.00	154.36	7	0
62	37	64	4739.56	5208.30	468.75	9	1
60	45	65	1464.75	1575.00	110.26	7	1
62	15	66	615.39	676.25	60.87	9	1
61	31	67	15029.11	16515.50	1486.40	9	1
62	22	68	2591.64	2879.60	287.96	10	1
62	13	69	2931.58	3186.50	254.93	8	1
62	49	70	1121.66	1193.25	71.60	6	0
62	30	71	841.47	904.81	63.34	7	1
60	46	72	376.24	400.25	24.02	6	0
60	32	73	1398.25	1487.50	89.25	6	1
62	10	74	2238.58	2356.41	117.83	5	0
62	47	75	6436.53	6921.00	484.48	7	0
61	19	76	112.39	123.50	11.12	9	0
60	42	77	664.05	699.00	34.96	5	1
62	23	78	1204.03	1323.10	119.08	9	0
61	33	79	717.61	780.00	62.40	8	0
60	33	80	354.91	390.00	35.11	9	0
60	25	82	285.25	310.06	24.81	8	0
61	32	83	968.37	1041.25	72.89	7	0
62	27	84	1837.71	2041.90	204.19	10	1
60	49	85	1360.31	1431.91	71.60	5	0
61	11	87	2899.88	3052.50	152.63	5	0
62	26	88	6664.69	7405.20	740.52	10	1
61	42	89	1607.71	1747.50	139.81	8	1
62	45	90	859.96	945.00	85.05	9	0
60	50	91	3066.37	3333.00	266.64	8	0
62	11	92	4590.97	4884.00	293.04	6	1
61	45	93	1480.50	1575.00	94.50	6	0
62	48	94	486.95	523.61	36.66	7	0
62	23	95	4167.77	4630.85	463.09	10	0
61	37	96	5590.25	6076.35	486.11	8	0
60	44	98	706.57	768.00	61.44	8	0
60	32	100	1130.50	1190.00	59.50	5	1
62	30	102	1235.06	1357.21	122.15	9	0
62	21	103	3315.06	3526.65	211.60	6	0
62	35	104	1311.49	1395.21	83.72	6	1
62	45	105	1464.75	1575.00	110.26	7	0
61	36	106	5630.22	6187.06	556.84	9	1
61	47	107	4337.16	4614.00	276.84	6	1
60	40	108	2619.44	2878.50	259.07	9	0
61	48	109	626.08	673.20	47.13	7	1
61	31	110	1502.92	1651.55	148.64	9	0
60	27	111	2193.59	2333.60	140.02	6	1
62	38	112	1424.52	1565.40	140.89	9	1
60	19	113	224.78	247.00	22.24	9	1
62	35	114	491.81	523.21	31.40	6	0
62	27	115	1939.81	2041.90	102.10	5	0
60	16	116	1197.66	1316.10	118.45	9	0
60	20	117	5275.35	5553.00	277.66	5	0
61	38	118	735.74	782.70	46.97	6	0
62	48	119	417.39	448.80	31.42	7	0
62	25	120	248.05	275.61	27.57	10	0
62	46	121	744.47	800.50	56.04	7	1
61	27	122	805.10	875.10	70.01	8	1
62	11	123	4444.45	4884.00	439.57	9	0
61	41	124	4596.44	4942.40	345.97	7	1
62	13	125	2345.27	2549.20	203.94	8	1
62	10	127	1896.91	2061.85	164.95	8	1
62	47	128	5479.13	5767.50	288.38	5	0
61	12	131	83.04	87.41	4.38	5	0
60	25	132	250.80	275.61	24.81	9	0
60	26	133	833.09	925.65	92.57	10	0
61	11	134	5616.61	6105.00	488.41	8	0
61	20	135	573.81	617.00	43.20	7	0
60	49	136	1303.03	1431.91	128.88	9	1
62	35	137	1123.14	1220.80	97.67	8	0
61	33	138	717.61	780.00	62.40	8	0
61	32	139	276.68	297.50	20.83	7	0
61	35	140	1459.73	1569.61	109.88	7	1
61	28	141	966.79	1074.21	107.43	10	1
62	37	142	789.93	868.05	78.13	9	1
60	15	143	1144.22	1217.25	73.04	6	0
60	46	145	1520.95	1601.00	80.06	5	0
62	29	146	2498.82	2716.10	217.29	8	1
60	37	149	8246.48	8680.50	434.03	5	0
61	11	150	561.66	610.50	48.85	8	0
62	41	152	4448.16	4942.40	494.25	10	0
62	10	154	830.64	883.66	53.02	6	0
60	35	155	331.37	348.81	17.45	5	0
61	23	156	615.25	661.55	46.31	7	0
62	22	157	2051.72	2159.70	107.99	5	0
61	20	158	3442.86	3702.00	259.15	7	1
61	30	159	283.51	301.61	18.10	6	1
62	11	160	5054.95	5494.50	439.57	8	1
61	41	162	3336.12	3706.80	370.69	10	0
62	30	163	548.92	603.21	54.29	9	1
60	40	164	8031.02	8635.50	604.49	7	1
62	48	165	68.82	74.80	5.99	8	0
62	32	166	968.37	1041.25	72.89	7	1
60	15	167	1107.70	1217.25	109.56	9	1
61	43	168	422.69	454.50	31.82	7	0
61	31	169	7514.56	8257.75	743.20	9	0
61	23	170	4353.00	4630.85	277.86	6	1
61	21	171	1116.78	1175.55	58.78	5	0
61	49	172	1587.03	1670.55	83.53	5	0
62	34	174	191.08	212.31	21.24	10	0
62	28	175	1482.40	1611.31	128.91	8	1
62	33	176	183.30	195.00	11.70	6	1
61	13	177	860.36	955.95	95.60	10	1
61	27	179	530.90	583.40	52.51	9	1
62	20	180	4491.77	4936.00	444.25	9	0
60	33	182	1450.80	1560.00	109.21	7	1
61	32	185	279.65	297.50	17.85	6	0
61	39	186	1534.65	1632.60	97.96	6	0
61	31	187	15194.27	16515.50	1321.25	8	1
61	30	188	814.33	904.81	90.49	10	0
61	44	190	1299.46	1382.40	82.95	6	1
60	35	191	491.81	523.21	31.40	6	0
62	13	194	2581.07	2867.85	286.79	10	1
62	11	197	3443.22	3663.00	219.79	6	0
62	41	199	1173.82	1235.60	61.79	5	1
61	46	200	2209.39	2401.50	192.13	8	1
62	12	201	275.32	305.91	30.60	10	1
60	15	202	1107.70	1217.25	109.56	9	0
61	24	203	126.87	137.91	11.04	8	0
61	43	205	604.49	636.31	31.82	5	0
61	22	207	4017.05	4319.40	302.36	7	1
60	49	209	439.12	477.31	38.19	8	0
62	11	210	4945.06	5494.50	549.46	10	0
61	47	211	9447.17	10381.50	934.34	9	0
62	38	214	735.74	782.70	46.97	6	1
61	18	215	133.58	142.10	8.53	6	0
61	31	217	9314.75	9909.30	594.56	6	1
60	33	218	1111.50	1170.00	58.50	5	1
62	40	219	1338.51	1439.25	100.75	7	0
60	39	220	12407.76	13060.80	653.04	5	0
60	41	222	1136.76	1235.60	98.85	8	0
61	37	223	3124.99	3472.20	347.23	10	0
60	12	224	284.49	305.91	21.42	7	1
60	13	225	3027.18	3186.50	159.33	5	0
62	39	226	7673.22	8163.00	489.78	6	1
62	34	227	1931.94	2123.00	191.07	9	0
61	38	228	1899.36	2087.20	187.85	9	0
62	50	229	999.90	1111.00	111.11	10	0
62	49	231	680.16	715.96	35.80	5	1
61	14	232	4291.11	4767.90	476.79	10	1
60	43	233	172.72	181.81	9.10	5	1
60	13	235	879.48	955.95	76.48	8	1
60	12	236	160.82	174.81	13.99	8	0
60	43	237	598.13	636.31	38.18	6	1
60	10	238	804.13	883.66	79.53	9	1
61	40	239	2648.23	2878.50	230.29	8	0
61	15	242	852.08	946.75	94.68	10	0
62	19	243	46.93	49.40	2.48	5	1
62	23	244	4167.77	4630.85	463.09	10	0
60	38	246	1200.15	1304.50	104.36	8	0
62	30	247	992.27	1055.61	63.34	6	1
60	22	248	5471.24	5759.20	287.96	5	1
61	18	249	154.29	162.41	8.13	5	0
62	19	250	117.33	123.50	6.18	5	1
62	19	1	177.85	197.60	19.77	10	0
62	50	2	8088.08	8888.00	799.92	9	0
62	24	4	196.51	206.86	10.35	5	1
62	24	5	634.35	689.50	55.17	8	1
62	12	6	164.32	174.81	10.49	6	1
62	36	7	3093.53	3437.25	343.73	10	1
60	19	9	181.80	197.60	15.81	8	0
61	22	10	5960.78	6479.10	518.33	8	0
60	14	11	5721.48	6357.20	635.73	10	0
60	50	12	4088.49	4444.00	355.52	8	0
62	24	14	188.24	206.86	18.62	9	1
60	45	15	2343.60	2520.00	176.41	7	0
62	23	17	2408.05	2646.20	238.16	9	0
61	28	19	3383.74	3759.71	375.98	10	0
62	41	20	2780.10	3089.00	308.91	10	0
61	47	21	5190.75	5767.50	576.75	10	1
60	14	22	7231.32	7946.50	715.19	9	1
62	10	23	536.09	589.11	53.02	9	1
62	18	25	130.74	142.10	11.37	8	0
60	13	26	2074.42	2230.55	156.14	7	0
61	36	27	5815.83	6187.06	371.23	6	1
60	21	28	9521.96	10579.95	1058.00	10	1
62	23	29	4306.70	4630.85	324.16	7	0
62	47	31	9343.36	10381.50	1038.16	10	0
62	19	32	112.39	123.50	11.12	9	0
60	13	33	1433.93	1593.25	159.33	10	0
60	23	34	4816.09	5292.40	476.32	9	0
60	46	35	1488.93	1601.00	112.08	7	1
61	35	36	627.85	697.61	69.77	10	1
62	23	38	3010.06	3307.75	297.70	9	1
60	32	39	1271.82	1338.75	66.94	5	0
61	38	40	735.74	782.70	46.97	6	1
62	43	41	604.49	636.31	31.82	5	0
61	20	42	5108.77	5553.00	444.25	8	1
62	16	43	2039.96	2193.50	153.55	7	1
60	28	44	3383.74	3759.71	375.98	10	0
60	15	45	730.36	811.50	81.16	10	1
61	39	46	13371.00	14693.40	1322.41	9	0
62	15	48	243.46	270.50	27.06	10	0
61	18	49	57.25	60.91	3.66	6	1
60	42	50	964.63	1048.50	83.88	8	0
61	36	52	1938.61	2062.36	123.75	6	1
60	43	54	507.23	545.41	38.18	7	1
60	41	55	4547.01	4942.40	395.40	8	1
61	37	56	4079.84	4340.25	260.42	6	0
60	18	57	186.77	203.00	16.25	8	0
60	49	59	1133.59	1193.25	59.67	5	0
60	24	61	186.17	206.86	20.69	10	1
61	40	62	2705.79	2878.50	172.71	6	0
62	20	63	5799.80	6170.00	370.20	6	0
62	47	64	9550.98	10381.50	830.52	8	0
61	34	65	394.88	424.61	29.73	7	1
61	22	68	5895.99	6479.10	583.12	9	0
60	23	69	1190.79	1323.10	132.32	10	1
60	11	70	2222.23	2442.00	219.79	9	0
61	49	72	226.72	238.66	11.94	5	1
62	32	73	136.85	148.75	11.91	8	0
62	45	74	1738.81	1890.00	151.21	8	1
60	34	75	1995.62	2123.00	127.38	6	0
62	43	77	507.23	545.41	38.18	7	0
60	30	78	1402.44	1508.00	105.57	7	1
61	49	79	2040.46	2147.85	107.40	5	0
61	25	80	294.55	310.06	15.51	5	1
60	24	81	64.82	68.96	4.14	6	0
60	14	82	2217.08	2383.95	166.88	7	0
61	12	83	198.84	218.50	19.67	9	0
60	26	86	3517.47	3702.60	185.13	5	0
62	35	87	165.69	174.41	8.73	5	0
62	37	88	2369.78	2604.15	234.38	9	0
61	32	89	706.57	743.75	37.19	5	0
61	22	90	2620.44	2879.60	259.17	9	0
60	16	91	1816.22	1974.15	157.94	8	1
61	41	93	2347.64	2471.20	123.57	5	0
60	31	94	13972.12	14863.95	891.84	6	1
61	49	95	1756.47	1909.21	152.74	8	1
62	50	96	2044.25	2222.00	177.76	8	0
60	19	97	227.25	247.00	19.77	8	0
60	45	98	1464.75	1575.00	110.26	7	1
62	35	100	491.81	523.21	31.40	6	0
62	26	101	3406.40	3702.60	296.21	8	0
62	13	102	1513.59	1593.25	79.67	5	0
61	20	104	1684.42	1851.00	166.60	9	1
62	36	105	3753.48	4124.71	371.23	9	0
62	31	106	1552.46	1651.55	99.10	6	1
61	17	107	685.58	761.75	76.18	10	0
61	30	108	554.95	603.21	48.26	8	1
60	43	109	579.04	636.31	57.27	9	0
62	16	110	1875.45	1974.15	98.71	5	0
61	23	111	1825.88	1984.65	158.78	8	1
61	43	113	422.69	454.50	31.82	7	1
62	37	114	807.29	868.05	60.77	7	0
60	31	115	10751.60	11560.86	809.26	7	1
61	37	116	8072.87	8680.50	607.64	7	0
62	16	117	412.38	438.70	26.33	6	0
62	23	118	2408.05	2646.20	238.16	9	0
60	16	119	204.00	219.35	15.36	7	1
61	24	121	63.44	68.96	5.52	8	1
61	39	122	7591.59	8163.00	571.42	7	1
60	18	123	154.29	162.41	8.13	5	1
60	50	125	6199.38	6666.00	466.63	7	0
60	23	127	2408.05	2646.20	238.16	9	0
61	44	128	139.78	153.60	13.83	9	0
60	29	129	2525.98	2716.10	190.13	7	1
61	42	131	1113.16	1223.25	110.10	9	0
62	35	132	810.96	872.00	61.05	7	1
61	22	133	3239.56	3599.50	359.96	10	1
62	19	134	200.07	222.30	22.24	10	1
60	36	135	3918.47	4124.71	206.24	5	1
60	17	136	578.93	609.40	30.47	5	0
60	38	137	1408.86	1565.40	156.54	10	0
60	43	138	85.45	90.91	5.46	6	0
61	48	139	568.48	598.40	29.93	5	1
60	32	140	559.30	595.00	35.70	6	1
60	32	141	699.13	743.75	44.63	6	1
62	48	142	70.32	74.80	4.49	6	1
61	27	143	1645.19	1750.20	105.02	6	0
61	30	144	992.27	1055.61	63.34	6	0
62	45	147	2293.21	2520.00	226.80	9	0
62	26	149	1721.71	1851.30	129.60	7	0
60	47	150	3252.87	3460.50	207.63	6	0
62	23	152	1806.04	1984.65	178.62	9	0
60	17	153	548.47	609.40	60.94	10	1
60	10	155	1678.94	1767.31	88.37	5	1
62	17	156	1288.89	1371.15	82.27	6	0
61	44	158	1271.81	1382.40	110.60	8	0
62	12	159	415.15	437.00	21.86	5	0
62	29	160	6247.04	6790.25	543.23	8	0
61	48	161	632.81	673.20	40.40	6	0
62	48	162	208.70	224.40	15.71	7	0
61	31	163	12287.54	13212.40	924.87	7	0
61	28	164	1009.75	1074.21	64.46	6	1
61	48	165	562.50	598.40	35.91	6	0
61	44	166	1244.16	1382.40	138.24	10	1
61	12	167	201.03	218.50	17.49	8	0
60	11	168	5494.50	6105.00	610.50	10	0
60	44	169	437.76	460.80	23.04	5	0
61	22	171	5183.28	5759.20	575.92	10	0
61	28	173	4081.97	4296.81	214.85	5	1
60	41	175	1161.47	1235.60	74.14	6	1
61	31	178	1502.92	1651.55	148.64	9	1
61	14	179	2892.53	3178.60	286.08	9	1
60	21	180	8463.96	9404.40	940.45	10	0
61	32	181	669.38	743.75	74.38	10	0
62	26	182	5961.19	6479.56	518.37	8	0
60	33	183	544.05	585.00	40.96	7	1
60	13	184	2899.72	3186.50	286.79	9	0
60	15	185	1144.22	1217.25	73.04	6	0
62	33	186	1774.50	1950.00	175.50	9	0
62	39	187	1502.00	1632.60	130.61	8	0
61	21	188	7405.97	8228.86	822.89	10	1
60	22	189	3419.53	3599.50	179.98	5	1
61	45	190	2551.50	2835.00	283.50	10	0
62	46	191	1861.17	2001.25	140.09	7	1
62	47	193	7428.54	8074.50	645.97	8	0
61	45	194	850.50	945.00	94.50	10	0
61	25	196	291.45	310.06	18.61	6	0
62	34	197	1159.16	1273.81	114.65	9	1
61	19	198	164.26	172.91	8.65	5	0
61	20	200	5553.00	6170.00	617.00	10	1
61	36	201	2584.82	2749.81	164.99	6	1
62	46	202	368.24	400.25	32.03	8	1
62	42	203	795.12	873.75	78.64	9	1
62	11	204	4444.45	4884.00	439.57	9	0
62	37	205	6319.41	6944.40	625.00	9	0
60	37	206	798.61	868.05	69.45	8	0
61	30	207	693.69	754.00	60.33	8	0
62	27	208	2123.58	2333.60	210.03	9	1
62	39	209	11885.33	13060.80	1175.48	9	0
62	20	210	5799.80	6170.00	370.20	6	0
62	15	211	861.55	946.75	85.21	9	1
61	23	212	1204.03	1323.10	119.08	9	0
62	37	213	5711.77	6076.35	364.59	6	0
60	20	214	2930.75	3085.00	154.25	5	0
61	41	215	4497.59	4942.40	444.82	9	0
62	33	217	916.50	975.00	58.50	6	0
60	13	219	2899.72	3186.50	286.79	9	1
60	32	220	276.68	297.50	20.83	7	1
60	29	221	8745.85	9506.36	760.51	8	1
60	20	222	555.31	617.00	61.71	10	0
61	23	224	595.40	661.55	66.16	10	0
61	50	226	3033.04	3333.00	299.97	9	0
61	18	229	115.72	121.81	6.10	5	1
60	44	230	142.85	153.60	10.76	7	0
60	29	231	4943.31	5432.20	488.90	9	0
60	37	233	4123.24	4340.25	217.02	5	0
61	18	234	129.32	142.10	12.79	9	1
61	22	235	4787.34	5039.31	251.97	5	0
62	10	236	553.76	589.11	35.35	6	0
62	19	237	112.39	123.50	11.12	9	0
61	48	238	336.61	374.00	37.40	10	0
61	23	239	3572.37	3969.30	396.94	10	1
60	43	240	431.78	454.50	22.73	5	0
60	47	241	2099.37	2307.00	207.63	9	1
62	32	242	989.19	1041.25	52.07	5	0
60	27	243	2494.04	2625.30	131.27	5	1
62	13	244	1465.79	1593.25	127.47	8	1
61	48	245	278.26	299.20	20.95	7	1
62	29	248	2580.30	2716.10	135.81	5	0
61	43	249	572.68	636.31	63.64	10	1
61	15	250	1119.88	1217.25	97.38	8	1
60	49	1	1570.32	1670.55	100.24	6	0
61	23	2	3010.06	3307.75	297.70	9	0
62	32	3	838.95	892.50	53.55	6	0
60	34	4	1396.94	1486.11	89.17	6	1
62	34	5	191.08	212.31	21.24	10	0
62	21	6	5525.09	5877.75	352.67	6	1
60	44	8	1285.64	1382.40	96.77	7	1
60	30	9	567.01	603.21	36.20	6	1
61	45	10	1496.25	1575.00	78.75	5	0
60	45	11	2898.00	3150.00	252.00	8	0
61	32	12	847.88	892.50	44.63	5	0
61	23	13	3731.15	3969.30	238.16	6	1
62	37	14	3159.71	3472.20	312.50	9	0
61	20	15	579.99	617.00	37.02	6	1
62	37	16	6458.30	6944.40	486.11	7	1
60	40	17	10362.61	11514.00	1151.41	10	1
62	17	18	831.84	914.10	82.27	9	0
60	13	20	2294.28	2549.20	254.92	10	1
62	18	22	94.40	101.50	7.11	7	0
61	46	24	720.46	800.50	80.06	10	0
60	29	25	5160.59	5432.20	271.62	5	1
61	29	26	10321.18	10864.40	543.23	5	1
62	49	27	1976.03	2147.85	171.83	8	0
60	11	28	4542.12	4884.00	341.89	7	1
61	46	29	3278.05	3602.25	324.21	9	0
61	31	30	1486.40	1651.55	165.16	10	1
60	22	31	2008.53	2159.70	151.18	7	0
62	14	32	4291.11	4767.90	476.79	10	1
61	11	33	1147.75	1221.00	73.26	6	0
60	24	35	453.70	482.66	28.96	6	0
62	38	36	247.86	260.90	13.05	5	1
61	40	37	2590.66	2878.50	287.86	10	0
62	44	38	829.44	921.60	92.16	10	0
61	36	40	1938.61	2062.36	123.75	6	0
60	46	41	1472.93	1601.00	128.09	8	0
61	32	42	968.37	1041.25	72.89	7	0
60	48	45	134.64	149.60	14.97	10	1
62	28	46	4995.03	5371.00	375.98	7	1
61	48	47	206.45	224.40	17.96	8	1
60	32	48	1353.63	1487.50	133.88	9	0
61	17	49	1371.16	1523.50	152.35	10	0
61	14	50	6794.26	7151.85	357.60	5	1
62	18	51	94.40	101.50	7.11	7	0
60	10	52	270.99	294.56	23.57	8	0
60	20	187	3516.90	3702.00	185.11	5	0
62	13	53	1797.19	1911.90	114.72	6	0
61	11	54	4395.61	4884.00	488.41	10	1
61	36	58	3162.27	3437.25	274.99	8	1
62	26	59	7034.94	7405.20	370.26	5	1
61	18	60	56.64	60.91	4.27	7	1
60	28	62	4039.00	4296.81	257.81	6	0
62	30	63	425.26	452.41	27.15	6	0
61	29	64	2553.14	2716.10	162.97	6	1
62	38	65	2478.55	2609.00	130.46	5	0
60	35	66	648.77	697.61	48.84	7	1
60	27	69	262.53	291.70	29.18	10	1
61	28	70	4995.03	5371.00	375.98	7	1
60	19	71	111.16	123.50	12.36	10	1
61	41	73	2322.93	2471.20	148.28	6	0
60	45	74	1738.81	1890.00	151.21	8	0
62	11	75	549.46	610.50	61.06	10	0
62	36	78	618.71	687.46	68.75	10	1
61	24	79	453.70	482.66	28.96	6	0
62	20	80	2245.89	2468.00	222.13	9	1
60	31	81	1552.46	1651.55	99.10	6	0
62	11	83	1159.96	1221.00	61.06	5	0
61	43	85	604.49	636.31	31.82	5	0
61	37	87	5772.54	6076.35	303.82	5	0
62	29	89	8840.91	9506.36	665.45	7	1
61	28	90	1530.74	1611.31	80.57	5	0
60	20	91	4541.12	4936.00	394.88	8	0
60	32	92	270.73	297.50	26.78	9	1
62	50	93	7388.15	7777.00	388.86	5	0
62	32	94	141.32	148.75	7.44	5	0
61	36	95	1306.16	1374.91	68.75	5	1
61	16	96	416.77	438.70	21.94	5	0
61	50	97	6266.04	6666.00	399.96	6	0
60	42	98	1258.21	1398.00	139.81	10	0
60	48	99	340.35	374.00	33.66	9	0
60	45	100	1496.25	1575.00	78.75	5	0
61	34	101	573.22	636.91	63.70	10	0
62	30	102	814.33	904.81	90.49	10	1
62	11	103	5738.70	6105.00	366.31	6	1
62	42	105	943.65	1048.50	104.86	10	0
61	47	106	1072.76	1153.50	80.75	7	1
62	12	107	406.41	437.00	30.60	7	0
62	42	108	1415.48	1572.75	157.28	10	1
62	41	110	5560.20	6178.00	617.81	10	0
62	32	111	1398.25	1487.50	89.25	6	0
62	11	112	2838.83	3052.50	213.68	7	1
60	30	113	708.76	754.00	45.24	6	1
61	34	114	965.97	1061.50	95.54	9	1
61	48	115	201.96	224.40	22.44	10	1
62	19	116	162.53	172.91	10.38	6	1
61	18	117	166.26	182.71	16.45	9	1
61	48	118	70.32	74.80	4.49	6	0
61	31	119	7431.98	8257.75	825.78	10	1
62	34	120	1197.38	1273.81	76.43	6	0
60	20	121	1110.61	1234.00	123.41	10	1
62	44	122	847.88	921.60	73.73	8	1
60	47	123	4152.61	4614.00	461.41	10	1
60	29	124	3870.45	4074.15	203.71	5	1
60	36	125	1251.16	1374.91	123.75	9	0
62	18	126	146.16	162.41	16.25	10	0
60	50	127	6199.38	6666.00	466.63	7	1
60	22	128	4736.95	5039.31	302.36	6	1
61	46	129	3682.31	4002.50	320.20	8	0
60	34	130	1396.94	1486.11	89.17	6	1
60	21	131	11050.18	11755.50	705.33	6	1
60	49	132	221.95	238.66	16.71	7	1
62	37	135	4895.81	5208.30	312.50	6	0
61	30	136	832.42	904.81	72.39	8	0
61	12	137	275.32	305.91	30.60	10	1
61	25	138	285.25	310.06	24.81	8	1
60	18	140	146.16	162.41	16.25	10	1
62	13	141	1739.83	1911.90	172.08	9	0
61	27	142	2389.03	2625.30	236.28	9	0
61	31	143	1519.43	1651.55	132.13	8	0
60	46	144	2549.60	2801.75	252.16	9	1
60	29	145	7740.89	8148.30	407.42	5	0
62	38	146	242.64	260.90	18.27	7	1
60	14	147	715.19	794.65	79.47	10	1
60	48	148	71.06	74.80	3.75	5	1
62	47	149	10842.90	11535.00	692.11	6	1
62	27	150	1385.58	1458.50	72.93	5	0
62	33	151	1450.80	1560.00	109.21	7	0
60	18	152	147.79	162.41	14.62	9	0
60	20	155	2838.21	3085.00	246.81	8	1
60	18	156	93.39	101.50	8.13	8	0
60	34	157	1528.57	1698.41	169.85	10	1
61	44	158	559.11	614.40	55.30	9	0
61	22	159	1943.73	2159.70	215.97	10	0
60	19	160	162.53	172.91	10.38	6	0
62	13	161	296.35	318.65	22.31	7	1
61	44	162	428.55	460.80	32.26	7	0
60	42	163	1415.48	1572.75	157.28	10	0
60	15	164	1217.25	1352.50	135.25	10	1
61	46	165	2977.86	3202.00	224.15	7	1
62	40	166	5354.01	5757.00	403.00	7	1
62	15	167	127.14	135.25	8.12	6	0
60	20	168	4590.48	4936.00	345.53	7	0
62	29	170	3707.48	4074.15	366.68	9	1
60	49	171	859.14	954.61	95.47	10	0
61	41	172	5807.32	6178.00	370.69	6	0
61	31	175	4459.19	4954.65	495.47	10	1
62	50	176	9999.00	11110.00	1111.00	10	0
61	45	177	1795.50	1890.00	94.50	5	0
60	16	178	1412.62	1535.46	122.84	8	1
60	41	179	2841.89	3089.00	247.13	8	1
62	30	181	138.74	150.81	12.07	8	1
62	38	182	2160.26	2348.10	187.85	8	0
60	34	183	191.08	212.31	21.24	10	1
62	29	184	2498.82	2716.10	217.29	8	0
60	45	185	2268.00	2520.00	252.00	10	0
62	34	186	764.29	849.21	84.93	10	0
62	20	188	4997.70	5553.00	555.31	10	1
62	31	189	10520.38	11560.86	1040.48	9	1
60	50	190	2066.47	2222.00	155.55	7	1
62	41	192	568.38	617.80	49.43	8	0
62	14	194	6039.34	6357.20	317.87	5	0
60	47	195	6228.91	6921.00	692.11	10	0
62	25	196	192.24	206.71	14.47	7	0
60	23	197	1190.79	1323.10	132.32	10	0
61	27	198	2123.58	2333.60	210.03	9	0
61	31	199	9116.56	9909.30	792.75	8	1
60	44	200	1285.64	1382.40	96.77	7	0
60	50	201	2999.71	3333.00	333.31	10	0
62	19	202	68.92	74.10	5.19	7	1
61	45	203	2608.21	2835.00	226.81	8	0
60	42	204	996.08	1048.50	52.43	5	1
61	19	205	23.22	24.70	1.49	6	0
62	27	206	1341.83	1458.50	116.69	8	1
60	30	207	1417.52	1508.00	90.48	6	1
60	40	210	6836.44	7196.25	359.82	5	0
60	36	211	1292.41	1374.91	82.50	6	0
62	23	212	628.48	661.55	33.08	5	1
60	38	213	1187.10	1304.50	117.41	9	1
62	39	214	12407.76	13060.80	653.04	5	0
61	45	216	1480.50	1575.00	94.50	6	0
60	13	217	2052.11	2230.55	178.45	8	1
60	48	218	68.07	74.80	6.74	9	1
60	10	219	2518.41	2650.96	132.55	5	0
60	11	220	1648.36	1831.50	183.16	10	0
61	46	221	1080.68	1200.75	120.08	10	0
62	25	222	98.19	103.36	5.17	5	1
61	21	223	1081.51	1175.55	94.05	8	0
61	35	224	648.77	697.61	48.84	7	0
60	41	226	1136.76	1235.60	98.85	8	0
60	50	227	2110.91	2222.00	111.11	5	0
61	12	229	278.37	305.91	27.54	9	1
60	37	230	8072.87	8680.50	607.64	7	0
60	41	231	5869.10	6178.00	308.91	5	0
62	24	232	317.18	344.75	27.59	8	0
61	32	233	1258.43	1338.75	80.33	6	0
61	34	234	1757.85	1910.71	152.86	8	0
61	11	235	1159.96	1221.00	61.06	5	0
62	37	237	781.25	868.05	86.81	10	0
61	25	238	124.03	137.81	13.79	10	1
61	14	239	5006.30	5562.56	556.26	10	0
61	19	240	69.66	74.10	4.45	6	0
62	32	242	401.63	446.25	44.63	10	0
62	28	243	3867.13	4296.81	429.69	10	1
62	22	244	4636.16	5039.31	403.15	8	0
61	47	245	9862.43	10381.50	519.08	5	0
60	16	246	1974.16	2193.50	219.36	10	0
62	14	247	2924.32	3178.60	254.29	8	0
61	18	249	132.16	142.10	9.95	7	1
61	40	250	12953.25	14392.50	1439.25	10	0
55	37	1	5711.77	6076.35	364.59	6	0
55	19	2	117.33	123.50	6.18	5	1
57	17	4	685.58	761.75	76.18	10	1
58	35	5	497.05	523.21	26.17	5	0
56	33	7	179.41	195.00	15.60	8	0
56	34	8	399.13	424.61	25.48	6	0
55	17	9	578.93	609.40	30.47	5	0
56	27	10	796.35	875.10	78.76	9	0
54	16	11	1458.68	1535.46	76.78	5	0
58	15	12	730.36	811.50	81.16	10	0
56	43	13	496.32	545.41	49.09	9	0
57	45	14	598.50	630.00	31.50	5	0
53	48	15	284.24	299.20	14.97	5	1
58	25	16	155.03	172.25	17.23	10	1
54	42	18	975.11	1048.50	73.40	7	1
53	10	19	265.10	294.56	29.46	10	0
51	10	21	1369.66	1472.75	103.10	7	0
52	32	22	830.03	892.50	62.48	7	0
58	17	24	566.75	609.40	42.66	7	1
54	39	26	4554.96	4897.80	342.85	7	0
54	25	27	285.25	310.06	24.81	8	1
55	26	29	842.35	925.65	83.31	9	0
59	33	33	354.91	390.00	35.11	9	1
57	12	34	397.68	437.00	39.33	9	0
57	13	35	1513.59	1593.25	79.67	5	0
59	18	36	115.72	121.81	6.10	5	1
51	20	37	1721.43	1851.00	129.58	7	1
56	40	39	8031.02	8635.50	604.49	7	1
56	18	42	73.90	81.21	7.31	9	0
52	34	43	399.13	424.61	25.48	6	0
54	46	44	3386.12	3602.25	216.14	6	0
57	47	45	2168.58	2307.00	138.42	6	1
52	13	46	2396.25	2549.20	152.96	6	1
59	31	47	14863.96	16515.50	1651.56	10	1
58	25	48	96.12	103.36	7.24	7	0
59	14	50	5061.93	5562.56	500.63	9	1
53	38	51	960.12	1043.60	83.49	8	0
53	32	52	706.57	743.75	37.19	5	0
57	24	54	313.73	344.75	31.03	9	0
52	38	55	1982.84	2087.20	104.36	5	0
53	40	56	5296.45	5757.00	460.57	8	1
52	40	57	13672.88	14392.50	719.63	5	1
52	16	58	416.77	438.70	21.94	5	1
58	38	60	485.28	521.80	36.53	7	0
59	40	61	5411.58	5757.00	345.42	6	0
54	35	62	1269.64	1395.21	125.57	9	0
58	11	63	5109.89	5494.50	384.62	7	1
56	25	64	294.55	310.06	15.51	5	1
58	25	65	226.69	241.16	14.47	6	0
58	34	69	1953.17	2123.00	169.85	8	0
54	12	71	325.13	349.61	24.48	7	0
58	17	73	1247.75	1371.15	123.41	9	0
58	35	74	317.41	348.81	31.40	9	0
57	23	75	3770.84	3969.30	198.47	5	0
58	48	77	68.07	74.80	6.74	9	0
59	25	78	64.08	68.91	4.83	7	0
55	11	85	1123.32	1221.00	97.69	8	1
51	16	86	208.39	219.35	10.97	5	0
58	29	87	3870.45	4074.15	203.71	5	1
55	25	88	31.70	34.46	2.76	8	1
51	45	90	2551.50	2835.00	283.50	10	1
58	16	91	1381.91	1535.46	153.55	10	1
51	26	92	5831.60	6479.56	647.96	10	1
56	38	93	2230.70	2348.10	117.41	5	1
54	41	95	2872.77	3089.00	216.24	7	1
58	36	98	1292.41	1374.91	82.50	6	0
55	40	101	1338.51	1439.25	100.75	7	0
54	27	102	1627.69	1750.20	122.52	7	1
58	30	103	425.26	452.41	27.15	6	0
58	36	105	1917.99	2062.36	144.37	7	0
51	22	106	6155.15	6479.10	323.96	5	0
51	48	107	269.28	299.20	29.93	10	0
57	12	108	318.14	349.61	31.47	9	1
57	48	109	688.17	748.00	59.85	8	0
51	42	110	1462.66	1572.75	110.10	7	1
56	35	111	810.96	872.00	61.05	7	0
57	21	112	5525.09	5877.75	352.67	6	0
56	36	113	2612.31	2749.81	137.50	5	0
51	50	114	6199.38	6666.00	466.63	7	0
54	45	115	283.50	315.00	31.50	10	0
51	30	117	1235.06	1357.21	122.15	9	0
54	24	122	448.87	482.66	33.79	7	0
56	28	123	510.25	537.11	26.86	5	0
59	23	124	1786.19	1984.65	198.47	10	1
51	41	125	1705.13	1853.40	148.28	8	0
52	20	126	3516.90	3702.00	185.11	5	1
53	24	128	317.18	344.75	27.59	8	1
56	41	130	1136.76	1235.60	98.85	8	0
54	23	131	1786.19	1984.65	198.47	10	0
57	43	132	598.13	636.31	38.18	6	0
57	28	133	510.25	537.11	26.86	5	0
52	31	134	14120.76	14863.95	743.20	5	0
56	19	137	222.31	247.00	24.71	10	0
51	46	139	2209.39	2401.50	192.13	8	1
57	17	140	1109.11	1218.80	109.70	9	0
54	37	141	3159.71	3472.20	312.50	9	0
51	23	143	5477.64	5953.95	476.32	8	1
54	30	144	1417.52	1508.00	90.48	6	0
58	11	145	3931.63	4273.50	341.88	8	0
52	50	150	2066.47	2222.00	155.55	7	0
56	39	151	8816.04	9795.60	979.56	10	1
52	39	152	9305.82	9795.60	489.78	5	0
51	24	158	190.31	206.86	16.55	8	0
54	15	159	508.54	541.00	32.47	6	0
55	38	160	991.42	1043.60	52.18	5	1
55	16	161	1835.96	1974.15	138.20	7	1
59	49	162	1503.50	1670.55	167.06	10	1
57	42	163	1314.12	1398.00	83.88	6	1
55	44	164	989.19	1075.21	86.02	8	0
51	45	165	598.50	630.00	31.50	5	0
53	40	166	5238.87	5757.00	518.13	9	0
56	45	167	2394.00	2520.00	126.00	5	1
53	45	168	2268.00	2520.00	252.00	10	0
58	43	169	431.78	454.50	22.73	5	0
58	16	170	1250.30	1316.10	65.81	5	0
51	18	171	192.85	203.00	10.16	5	1
58	42	172	162.52	174.75	12.24	7	0
52	12	173	162.57	174.81	12.24	7	0
57	46	175	1821.14	2001.25	180.12	9	1
55	23	177	3142.37	3307.75	165.39	5	0
51	28	180	1482.40	1611.31	128.91	8	0
58	23	181	1825.88	1984.65	158.78	8	0
58	26	182	1758.74	1851.30	92.57	5	0
56	24	183	518.51	551.61	33.10	6	0
54	13	184	908.16	955.95	47.80	5	0
59	17	186	572.84	609.40	36.57	6	1
51	50	187	7232.61	7777.00	544.40	7	0
54	40	188	13097.18	14392.50	1295.33	9	0
54	30	189	1432.60	1508.00	75.41	5	1
58	21	190	5525.09	5877.75	352.67	6	1
51	39	191	3101.94	3265.20	163.26	5	0
51	42	192	812.59	873.75	61.17	7	1
52	29	193	7333.47	8148.30	814.83	10	0
54	44	194	291.84	307.20	15.36	5	0
55	43	195	167.26	181.81	14.55	8	0
58	34	196	1528.57	1698.41	169.85	10	1
53	45	199	2898.00	3150.00	252.00	8	0
54	46	200	1504.94	1601.00	96.07	6	0
56	20	201	2245.89	2468.00	222.13	9	0
54	10	202	2412.37	2650.96	238.59	9	0
53	50	206	8265.85	8888.00	622.17	7	1
53	19	207	68.18	74.10	5.93	8	1
54	48	209	612.62	673.20	60.59	9	0
55	35	210	1656.80	1744.00	87.21	5	0
51	26	211	5831.60	6479.56	647.96	10	1
52	18	213	168.09	182.71	14.62	8	1
51	28	215	4350.52	4833.91	483.40	10	0
55	14	216	4481.83	4767.90	286.08	6	0
52	19	217	222.31	247.00	24.71	10	0
58	49	218	434.35	477.31	42.96	9	1
59	36	220	3918.47	4124.71	206.24	5	1
51	26	221	7831.00	8330.86	499.86	6	1
55	26	224	2610.34	2776.95	166.62	6	0
55	18	228	152.66	162.41	9.75	6	1
52	27	229	2494.04	2625.30	131.27	5	0
56	41	230	5115.39	5560.20	444.82	8	1
56	12	231	198.84	218.50	19.67	9	1
53	17	232	868.40	914.10	45.71	5	0
52	23	233	2513.89	2646.20	132.32	5	0
55	27	234	2654.48	2917.00	262.53	9	0
57	14	235	723.14	794.65	71.52	9	1
57	35	236	1135.35	1220.80	85.46	7	0
55	18	237	18.68	20.31	1.63	8	0
58	18	238	19.29	20.31	1.02	5	0
55	49	239	1288.72	1431.91	143.20	10	0
58	17	240	1447.33	1523.50	76.18	5	0
52	39	243	10856.79	11428.20	571.41	5	1
54	32	244	1204.88	1338.75	133.88	10	0
54	41	245	5226.59	5560.20	333.62	6	0
51	38	246	735.74	782.70	46.97	6	0
54	40	247	6548.59	7196.25	647.67	9	0
53	25	249	62.70	68.91	6.21	9	1
55	41	1	1161.47	1235.60	74.14	6	0
51	31	2	4508.74	4954.65	445.92	9	0
58	44	3	282.63	307.20	24.58	8	0
51	30	5	1109.89	1206.41	96.52	8	0
52	19	6	160.80	172.91	12.11	7	0
52	29	7	3870.45	4074.15	203.71	5	1
56	23	8	3043.14	3307.75	264.63	8	0
51	24	9	126.87	137.91	11.04	8	0
57	26	11	1758.74	1851.30	92.57	5	1
52	35	12	952.23	1046.41	94.18	9	1
51	33	13	1076.41	1170.00	93.61	8	0
59	26	14	4165.43	4628.25	462.83	10	1
53	38	16	1878.48	2087.20	208.72	10	0
51	30	18	280.49	301.61	21.12	7	1
52	50	19	4044.04	4444.00	399.96	9	0
59	22	20	6695.07	7199.00	503.94	7	0
51	14	22	3734.86	3973.25	238.40	6	0
52	27	24	1371.00	1458.50	87.51	6	0
59	49	25	1520.21	1670.55	150.35	9	0
59	20	26	555.31	617.00	61.71	10	0
51	25	27	31.01	34.46	3.45	10	1
57	50	30	5110.61	5555.00	444.41	8	0
51	34	31	195.32	212.31	16.99	8	0
51	43	33	854.46	909.00	54.54	6	1
57	31	34	7762.29	8257.75	495.47	6	1
52	47	35	3218.27	3460.50	242.24	7	0
54	23	36	1256.95	1323.10	66.16	5	1
59	34	37	781.27	849.21	67.94	8	1
51	50	39	8999.11	9999.00	999.91	10	0
51	19	41	23.22	24.70	1.49	6	0
59	47	43	1095.83	1153.50	57.68	5	0
56	22	44	3239.56	3599.50	359.96	10	0
57	48	45	538.56	598.40	59.85	10	1
59	31	46	7514.56	8257.75	743.20	9	0
59	50	47	2044.25	2222.00	177.76	8	1
56	19	48	70.40	74.10	3.71	5	0
57	31	49	14120.76	14863.95	743.20	5	1
55	24	50	65.51	68.96	3.45	5	1
51	29	54	10103.90	10864.40	760.51	7	1
59	12	55	238.61	262.21	23.60	9	0
55	37	58	3906.23	4340.25	434.03	10	0
56	48	59	544.55	598.40	53.86	9	1
55	35	61	324.39	348.81	24.42	7	0
51	21	63	2115.99	2351.10	235.12	10	0
52	19	65	91.89	98.80	6.92	7	0
51	46	66	3386.12	3602.25	216.14	6	0
54	20	67	2838.21	3085.00	246.81	8	1
59	10	72	1896.91	2061.85	164.95	8	1
58	47	74	3287.48	3460.50	173.03	5	0
57	43	75	777.20	818.11	40.91	5	1
58	36	76	1938.61	2062.36	123.75	6	0
56	34	77	1367.22	1486.11	118.89	8	0
52	10	79	1083.95	1178.21	94.26	8	0
55	25	80	186.04	206.71	20.68	10	0
59	45	81	292.95	315.00	22.06	7	1
57	26	84	1666.18	1851.30	185.13	10	1
52	39	86	11754.72	13060.80	1306.08	10	1
57	13	87	1172.64	1274.60	101.97	8	0
56	15	88	243.46	270.50	27.06	10	1
55	10	89	2739.32	2945.50	206.19	7	1
57	46	90	380.24	400.25	20.02	5	0
59	50	91	10110.11	11110.00	999.90	9	1
57	14	92	3774.59	3973.25	198.67	5	0
57	47	93	3287.48	3460.50	173.03	5	0
55	10	94	1384.39	1472.75	88.37	6	0
55	25	95	279.05	310.06	31.01	10	1
56	38	96	247.86	260.90	13.05	5	1
54	31	97	13674.84	14863.95	1189.12	8	0
51	10	98	530.20	589.11	58.92	10	1
51	20	101	5676.41	6170.00	493.61	8	1
59	16	102	1197.66	1316.10	118.45	9	0
56	14	104	5061.93	5562.56	500.63	9	1
58	48	105	275.27	299.20	23.94	8	1
59	35	108	634.82	697.61	62.79	9	1
53	15	109	608.63	676.25	67.63	10	0
54	31	110	1568.98	1651.55	82.58	5	1
53	35	114	1639.36	1744.00	104.65	6	0
54	41	116	5282.19	5560.20	278.01	5	0
53	23	117	1825.88	1984.65	158.78	8	1
57	18	118	115.72	121.81	6.10	5	1
51	47	119	9343.36	10381.50	1038.16	10	0
56	37	123	3949.63	4340.25	390.63	9	1
58	17	125	286.42	304.70	18.29	6	1
52	43	126	661.76	727.21	65.45	9	1
58	12	127	284.49	305.91	21.42	7	1
56	37	128	1614.58	1736.10	121.53	7	1
59	31	129	15359.42	16515.50	1156.09	7	1
54	34	130	997.81	1061.50	63.69	6	1
55	15	132	852.08	946.75	94.68	10	0
56	12	133	402.05	437.00	34.97	8	0
58	11	136	573.88	610.50	36.63	6	0
59	42	137	332.03	349.50	17.48	5	0
59	12	138	207.58	218.50	10.93	5	0
54	21	139	9945.16	10579.95	634.80	6	1
59	42	141	325.04	349.50	24.47	7	0
53	45	142	2394.00	2520.00	126.00	5	0
56	20	143	567.64	617.00	49.36	8	0
58	26	144	8701.11	9256.50	555.39	6	0
57	30	145	277.48	301.61	24.13	8	0
51	44	146	552.97	614.40	61.44	10	1
56	13	148	592.69	637.30	44.62	7	1
55	22	150	3930.66	4319.40	388.75	9	1
58	29	151	4888.98	5432.20	543.23	10	1
54	37	152	7899.26	8680.50	781.25	9	1
54	44	153	291.84	307.20	15.36	5	0
56	46	154	3314.08	3602.25	288.19	8	0
56	23	155	6218.57	6615.50	396.94	6	0
54	15	156	256.98	270.50	13.53	5	0
54	29	160	6179.13	6790.25	611.13	9	0
54	12	161	123.24	131.11	7.87	6	0
56	41	162	3978.64	4324.60	345.97	8	0
59	10	163	2120.77	2356.41	235.65	10	1
54	31	165	4607.83	4954.65	346.83	7	1
57	33	166	1283.10	1365.00	81.90	6	0
57	48	167	568.48	598.40	29.93	5	0
56	28	169	510.25	537.11	26.86	5	0
59	47	172	10842.90	11535.00	692.11	6	1
52	41	173	4645.86	4942.40	296.55	6	1
58	24	174	634.35	689.50	55.17	8	0
57	43	175	83.63	90.91	7.28	8	0
56	19	176	164.26	172.91	8.65	5	0
56	46	177	3722.33	4002.50	280.18	7	0
51	36	179	4330.94	4812.16	481.22	10	1
52	22	180	5356.06	5759.20	403.15	7	1
53	29	181	12629.87	13580.50	950.64	7	0
52	15	182	1156.39	1217.25	60.87	5	0
56	29	183	6247.04	6790.25	543.23	8	1
51	48	185	67.32	74.80	7.49	10	0
54	24	186	496.45	551.61	55.17	10	1
59	17	187	981.14	1066.46	85.32	8	1
59	43	188	676.30	727.21	50.91	7	1
51	29	189	2580.30	2716.10	135.81	5	1
59	21	191	8463.96	9404.40	940.45	10	1
53	29	192	8840.91	9506.36	665.45	7	1
52	34	193	789.76	849.21	59.45	7	1
53	18	194	18.27	20.31	2.04	10	1
52	46	195	380.24	400.25	20.02	5	0
54	46	196	3278.05	3602.25	324.21	9	0
58	29	197	11611.33	12222.45	611.13	5	1
53	39	198	1550.97	1632.60	81.63	5	0
52	32	199	676.82	743.75	66.94	9	1
57	18	200	18.48	20.31	1.83	9	1
56	19	201	89.91	98.80	8.90	9	0
53	19	202	22.48	24.70	2.23	9	0
53	17	204	578.93	609.40	30.47	5	1
56	12	205	361.84	393.31	31.47	8	1
52	25	206	158.47	172.25	13.79	8	0
58	32	207	141.32	148.75	7.44	5	0
55	13	208	2096.72	2230.55	133.84	6	0
53	29	209	1290.15	1358.05	67.91	5	0
59	25	210	130.91	137.81	6.90	5	1
59	27	211	1919.39	2041.90	122.52	6	0
56	10	212	2739.32	2945.50	206.19	7	0
51	29	213	11489.11	12222.45	733.35	6	0
55	32	217	803.25	892.50	89.25	10	1
52	50	218	9499.05	9999.00	499.96	5	1
52	34	219	201.69	212.31	10.62	5	1
55	23	220	602.02	661.55	59.54	9	1
53	42	221	325.04	349.50	24.47	7	1
52	43	223	82.72	90.91	8.19	9	0
58	46	225	752.47	800.50	48.04	6	1
56	29	226	7659.41	8148.30	488.90	6	1
58	41	228	5621.99	6178.00	556.02	9	1
56	36	229	4330.94	4812.16	481.22	10	1
54	28	230	3996.03	4296.81	300.78	7	1
51	44	231	857.09	921.60	64.52	7	1
58	18	233	113.28	121.81	8.53	7	0
55	48	234	408.41	448.80	40.40	9	0
58	30	236	1275.77	1357.21	81.44	6	1
54	41	239	5683.77	6178.00	494.25	8	1
51	47	241	4291.02	4614.00	322.99	7	0
54	43	242	501.77	545.41	43.64	8	0
53	41	243	3892.14	4324.60	432.46	10	0
54	29	245	1276.57	1358.05	81.49	6	1
55	38	247	2348.10	2609.00	260.91	10	1
58	16	248	1381.91	1535.46	153.55	10	1
55	16	249	618.57	658.05	39.49	6	1
58	17	2	1145.68	1218.80	73.13	6	0
53	13	5	3027.18	3186.50	159.33	5	0
56	20	7	2344.60	2468.00	123.41	5	1
55	34	8	987.20	1061.50	74.31	7	0
58	43	9	341.79	363.61	21.82	6	0
55	50	11	3133.02	3333.00	199.98	6	1
52	42	12	1478.39	1572.75	94.37	6	1
55	21	13	3350.32	3526.65	176.34	5	1
54	32	14	419.48	446.25	26.78	6	1
57	21	16	4231.98	4702.20	470.23	10	0
54	30	17	850.52	904.81	54.29	6	1
52	30	19	560.98	603.21	42.23	7	1
58	46	21	1881.18	2001.25	120.08	6	0
55	29	22	5051.95	5432.20	380.26	7	1
53	14	23	7469.71	7946.50	476.79	6	0
56	15	24	492.32	541.00	48.69	9	1
58	35	26	655.75	697.61	41.86	6	0
58	22	30	5471.24	5759.20	287.96	5	0
56	39	31	9011.96	9795.60	783.65	8	1
58	37	32	5590.25	6076.35	486.11	8	1
51	40	33	3929.16	4317.75	388.60	9	0
51	42	37	629.11	699.00	69.91	10	0
54	35	38	320.90	348.81	27.91	8	1
52	20	42	5053.24	5553.00	499.77	9	1
51	14	45	3734.86	3973.25	238.40	6	1
59	12	46	275.32	305.91	30.60	10	0
58	26	47	1684.69	1851.30	166.62	9	0
52	29	49	1290.15	1358.05	67.91	5	1
54	11	50	2271.06	2442.00	170.95	7	1
51	11	52	2271.06	2442.00	170.95	7	0
51	45	53	592.20	630.00	37.80	6	1
54	29	54	10321.18	10864.40	543.23	5	0
54	42	55	482.32	524.25	41.94	8	0
51	35	58	828.40	872.00	43.61	5	1
52	47	59	6574.95	6921.00	346.06	5	1
54	13	60	2581.07	2867.85	286.79	10	0
51	42	61	321.55	349.50	27.97	8	0
56	35	62	994.09	1046.41	52.33	5	0
54	23	64	2513.89	2646.20	132.32	5	0
57	28	66	4592.21	4833.91	241.70	5	0
57	20	67	2319.93	2468.00	148.08	6	1
53	42	70	1572.75	1747.50	174.75	10	0
57	16	71	2083.83	2193.50	109.68	5	0
51	29	73	6247.04	6790.25	543.23	8	1
57	31	74	4706.92	4954.65	247.74	5	0
59	37	76	2395.82	2604.15	208.34	8	1
58	19	77	206.74	222.30	15.57	7	0
55	14	78	723.14	794.65	71.52	9	1
55	49	79	1345.99	1431.91	85.92	6	1
52	13	80	869.92	955.95	86.04	9	1
59	30	81	1134.02	1206.41	72.39	6	1
51	41	83	5683.77	6178.00	494.25	8	0
54	35	84	327.88	348.81	20.93	6	0
52	36	87	1237.42	1374.91	137.50	10	1
54	45	88	2992.50	3150.00	157.50	5	1
57	27	89	1575.18	1750.20	175.02	10	1
52	35	90	1412.65	1569.61	156.97	10	0
52	24	92	310.28	344.75	34.48	10	0
56	41	94	2841.89	3089.00	247.13	8	1
59	33	95	1419.61	1560.00	140.41	9	1
51	39	96	9109.91	9795.60	685.70	7	0
56	45	97	299.25	315.00	15.75	5	0
51	12	99	321.64	349.61	27.97	8	0
54	13	100	879.48	955.95	76.48	8	0
58	20	101	4639.85	4936.00	296.16	6	1
52	10	102	2680.41	2945.50	265.10	9	0
55	19	104	162.53	172.91	10.38	6	0
53	16	105	403.61	438.70	35.10	8	0
55	43	106	165.44	181.81	16.37	9	1
54	24	110	190.31	206.86	16.55	8	1
52	38	112	2400.29	2609.00	208.72	8	1
55	33	113	181.35	195.00	13.66	7	0
57	26	114	2582.57	2776.95	194.39	7	1
59	27	116	1096.80	1166.80	70.01	6	0
58	41	117	5059.79	5560.20	500.42	9	0
52	24	118	558.50	620.56	62.06	10	1
59	33	119	549.90	585.00	35.11	6	0
57	22	120	6155.15	6479.10	323.96	5	0
59	11	121	2222.23	2442.00	219.79	9	0
53	47	122	3252.87	3460.50	207.63	6	0
56	23	125	2381.58	2646.20	264.63	10	0
57	42	128	498.04	524.25	26.22	5	1
55	22	131	1295.82	1439.80	143.98	10	1
59	16	132	199.61	219.35	19.75	9	1
54	38	133	480.06	521.80	41.75	8	1
52	22	134	676.71	719.90	43.20	6	0
59	10	135	2144.33	2356.41	212.08	9	1
57	17	137	141.69	152.35	10.67	7	1
56	49	138	217.18	238.66	21.48	9	0
51	50	139	2110.91	2222.00	111.11	5	0
52	46	140	752.47	800.50	48.04	6	0
59	11	141	5799.75	6105.00	305.25	5	1
52	34	142	955.36	1061.50	106.16	10	1
59	14	143	2987.89	3178.60	190.72	6	0
55	32	145	410.56	446.25	35.71	8	0
53	13	146	1739.83	1911.90	172.08	9	1
59	23	148	1825.88	1984.65	158.78	8	1
59	26	150	6155.58	6479.56	323.98	5	1
54	24	151	372.34	413.71	41.38	10	1
55	24	152	453.70	482.66	28.96	6	1
53	46	153	1440.91	1601.00	160.11	10	1
55	31	155	4657.38	4954.65	297.28	6	0
54	36	157	1856.12	2062.36	206.24	10	0
59	32	158	1094.80	1190.00	95.21	8	1
56	40	159	13528.95	14392.50	863.55	6	1
58	29	160	3707.48	4074.15	366.68	9	0
51	48	163	556.52	598.40	41.89	7	0
57	16	165	798.44	877.40	78.97	9	1
59	24	166	641.24	689.50	48.27	7	0
59	40	167	6764.48	7196.25	431.78	6	1
55	45	168	2579.85	2835.00	255.15	9	0
52	32	169	1106.70	1190.00	83.31	7	1
54	15	170	995.45	1082.00	86.57	8	0
55	35	171	1297.54	1395.21	97.67	7	1
57	39	172	12015.94	13060.80	1044.87	8	1
56	48	174	412.90	448.80	35.91	8	0
58	18	175	130.74	142.10	11.37	8	0
52	34	176	191.08	212.31	21.24	10	1
54	23	178	4214.08	4630.85	416.78	9	1
52	36	180	639.33	687.46	48.13	7	1
54	37	181	5529.48	6076.35	546.88	9	0
59	33	182	916.50	975.00	58.50	6	0
56	45	183	869.41	945.00	75.61	8	1
56	17	184	566.75	609.40	42.66	7	0
51	23	185	2460.97	2646.20	185.24	7	0
59	49	186	878.24	954.61	76.37	8	1
56	44	189	1244.16	1382.40	138.24	10	0
56	40	190	8203.73	8635.50	431.78	5	0
54	37	192	3949.63	4340.25	390.63	9	1
53	21	193	6347.97	7053.30	705.33	10	1
54	30	194	693.69	754.00	60.33	8	0
52	48	195	556.52	598.40	41.89	7	0
54	19	196	70.40	74.10	3.71	5	0
51	29	197	3788.96	4074.15	285.20	7	1
54	47	199	2076.31	2307.00	230.71	10	0
55	38	200	2207.22	2348.10	140.89	6	0
52	12	201	196.66	218.50	21.86	10	1
52	42	202	477.07	524.25	47.19	9	0
56	33	203	1794.00	1950.00	156.00	8	0
54	46	204	3314.08	3602.25	288.19	8	1
59	22	205	647.91	719.90	71.99	10	0
57	41	206	3336.12	3706.80	370.69	10	0
52	19	207	157.34	172.91	15.57	9	1
51	25	208	31.70	34.46	2.76	8	0
51	20	209	2869.05	3085.00	215.96	7	1
51	33	210	1296.75	1365.00	68.25	5	0
58	45	211	598.50	630.00	31.50	5	0
53	20	213	5164.29	5553.00	388.72	7	0
57	31	214	1552.46	1651.55	99.10	6	1
58	18	215	132.16	142.10	9.95	7	0
57	45	216	585.90	630.00	44.11	7	0
56	47	217	8397.48	9228.00	830.52	9	0
51	47	218	4383.31	4614.00	230.71	5	1
59	35	219	1255.69	1395.21	139.53	10	1
55	25	221	219.45	241.16	21.71	9	0
58	13	222	1797.19	1911.90	114.72	6	0
53	14	223	5173.18	5562.56	389.38	7	0
59	21	224	9627.76	10579.95	952.20	9	1
51	44	226	433.16	460.80	27.65	6	0
58	26	227	7497.77	8330.86	833.09	10	0
59	36	228	5630.22	6187.06	556.84	9	0
52	20	229	5676.41	6170.00	493.61	8	0
55	17	230	429.63	457.05	27.43	6	0
57	26	231	6886.84	7405.20	518.37	7	1
52	30	232	286.52	301.61	15.09	5	0
53	28	233	2470.67	2685.50	214.85	8	1
51	14	235	5284.43	5562.56	278.13	5	0
55	18	236	56.03	60.91	4.88	8	0
56	22	237	4787.34	5039.31	251.97	5	1
51	46	238	1801.13	2001.25	200.13	10	1
52	12	240	79.54	87.41	7.87	9	1
58	44	241	423.94	460.80	36.87	8	0
54	40	242	6620.56	7196.25	575.71	8	1
52	22	243	3383.53	3599.50	215.97	6	0
57	34	244	1757.85	1910.71	152.86	8	1
51	42	245	332.03	349.50	17.48	5	1
51	26	246	8515.98	9256.50	740.52	8	1
55	21	247	7405.97	8228.86	822.89	10	1
57	29	248	11366.88	12222.45	855.58	7	1
53	45	249	2608.21	2835.00	226.81	8	0
55	41	1	5683.77	6178.00	494.25	8	1
54	31	4	7762.29	8257.75	495.47	6	1
55	46	5	1801.13	2001.25	200.13	10	1
52	27	6	265.45	291.70	26.26	9	0
56	48	7	710.61	748.00	37.40	5	1
55	10	8	1095.73	1178.21	82.48	7	0
56	12	9	357.91	393.31	35.40	9	1
55	36	10	1876.74	2062.36	185.62	9	0
52	33	11	1649.70	1755.00	105.30	6	1
51	25	14	98.19	103.36	5.17	5	0
51	23	15	1806.04	1984.65	178.62	9	0
51	45	16	2608.21	2835.00	226.81	8	1
51	39	17	12407.76	13060.80	653.04	5	1
57	43	19	256.34	272.71	16.37	6	0
57	10	20	1608.25	1767.31	159.06	9	1
59	17	22	1261.46	1371.15	109.70	8	1
56	46	23	3602.25	4002.50	400.25	10	0
56	20	24	2930.75	3085.00	154.25	5	1
53	15	26	251.57	270.50	18.94	7	0
56	16	29	598.83	658.05	59.23	9	1
57	48	31	688.17	748.00	59.85	8	1
57	47	32	7670.78	8074.50	403.73	5	1
54	35	33	158.71	174.41	15.70	9	0
59	31	34	10982.81	11560.86	578.05	5	1
54	23	35	6020.11	6615.50	595.40	9	1
53	42	38	1314.12	1398.00	83.88	6	1
58	31	39	15689.73	16515.50	825.78	5	1
55	35	40	1311.49	1395.21	83.72	6	1
51	23	41	2381.58	2646.20	264.63	10	0
53	44	42	433.16	460.80	27.65	6	0
58	39	43	5877.36	6530.40	653.04	10	0
56	16	44	592.25	658.05	65.81	10	1
56	18	45	19.09	20.31	1.22	6	0
56	43	46	585.40	636.31	50.91	8	1
57	29	49	1222.25	1358.05	135.81	10	1
52	50	50	5277.25	5555.00	277.75	5	0
58	33	51	702.00	780.00	78.00	10	0
58	21	52	8463.96	9404.40	940.45	10	0
57	24	59	320.62	344.75	24.14	7	0
54	34	60	1776.96	1910.71	133.75	7	0
58	15	62	121.73	135.25	13.53	10	0
58	34	63	403.38	424.61	21.24	5	0
57	46	64	368.24	400.25	32.03	8	0
55	38	65	2400.29	2609.00	208.72	8	1
56	23	66	2460.97	2646.20	185.24	7	0
59	33	67	1614.61	1755.00	140.41	8	0
55	40	69	9369.52	10074.75	705.24	7	1
53	49	71	878.24	954.61	76.37	8	1
58	37	72	4739.56	5208.30	468.75	9	0
51	28	73	3996.03	4296.81	300.78	7	0
58	20	74	4442.41	4936.00	493.61	10	1
54	40	75	13097.18	14392.50	1295.33	9	1
59	30	76	823.37	904.81	81.44	9	0
56	47	77	9654.80	10381.50	726.71	7	0
59	40	78	10592.89	11514.00	921.13	8	1
58	30	79	143.26	150.81	7.55	5	0
58	18	81	95.41	101.50	6.09	6	1
54	30	84	138.74	150.81	12.07	8	0
56	21	89	9521.96	10579.95	1058.00	10	1
57	43	90	413.60	454.50	40.91	9	0
52	50	91	10221.21	11110.00	888.81	8	0
52	12	92	373.64	393.31	19.67	5	1
51	46	93	1080.68	1200.75	120.08	10	0
54	39	96	15346.44	16326.00	979.56	6	1
59	19	99	160.80	172.91	12.11	7	1
51	47	100	10727.55	11535.00	807.46	7	1
55	24	101	518.51	551.61	33.10	6	0
56	11	102	561.66	610.50	48.85	8	0
56	26	103	8793.68	9256.50	462.83	5	0
52	10	104	821.80	883.66	61.86	7	0
51	50	105	8443.61	8888.00	444.41	5	0
56	19	107	137.83	148.20	10.38	7	0
54	47	109	2076.31	2307.00	230.71	10	0
55	49	110	1503.50	1670.55	167.06	10	0
57	13	111	2609.75	2867.85	258.11	9	1
51	15	112	871.01	946.75	75.74	8	1
55	32	113	565.25	595.00	29.75	5	1
51	40	116	5238.87	5757.00	518.13	9	0
58	48	117	639.54	673.20	33.66	5	0
53	38	118	469.62	521.80	52.18	10	1
55	46	119	364.23	400.25	36.03	9	0
58	24	120	507.48	551.61	44.13	8	1
56	11	121	5616.61	6105.00	488.41	8	1
58	14	122	1430.37	1589.30	158.94	10	0
58	20	123	5108.77	5553.00	444.25	8	1
53	26	127	1721.71	1851.30	129.60	7	0
57	43	128	669.03	727.21	58.18	8	1
55	29	129	12494.07	13580.50	1086.45	8	1
58	32	130	565.25	595.00	29.75	5	0
51	47	131	10612.21	11535.00	922.81	8	1
54	29	134	12901.48	13580.50	679.03	5	0
57	16	135	201.81	219.35	17.55	8	1
54	14	136	3774.59	3973.25	198.67	5	1
53	44	137	1021.44	1075.21	53.77	5	1
56	36	139	4571.55	4812.16	240.61	5	0
59	30	140	678.61	754.00	75.41	10	1
58	38	141	1200.15	1304.50	104.36	8	0
53	21	142	1058.00	1175.55	117.56	10	1
56	19	143	90.90	98.80	7.91	8	1
55	40	147	11916.99	12953.25	1036.26	8	1
58	47	148	4152.61	4614.00	461.41	10	0
52	45	149	2898.00	3150.00	252.00	8	0
54	15	151	1230.78	1352.50	121.73	9	0
57	39	152	6073.28	6530.40	457.13	7	0
51	21	153	8934.18	9404.40	470.23	5	1
57	37	154	4739.56	5208.30	468.75	9	0
56	44	155	139.78	153.60	13.83	9	1
53	35	156	627.85	697.61	69.77	10	0
53	35	157	1639.36	1744.00	104.65	6	0
57	36	160	4523.43	4812.16	288.73	6	1
52	12	161	246.47	262.21	15.74	6	0
54	10	162	812.96	883.66	70.70	8	1
55	11	163	5164.83	5494.50	329.68	6	0
53	23	165	5596.72	5953.95	357.24	6	0
52	30	167	1262.20	1357.21	95.01	7	0
53	44	168	691.21	768.00	76.81	10	0
53	44	169	583.68	614.40	30.72	5	1
57	11	171	4493.28	4884.00	390.73	8	1
58	17	172	831.84	914.10	82.27	9	1
59	21	173	6700.64	7053.30	352.67	5	1
53	17	174	693.20	761.75	68.56	9	0
59	20	180	2807.35	3085.00	277.65	9	0
56	28	181	483.40	537.11	53.72	10	1
53	14	182	3774.59	3973.25	198.67	5	1
54	45	184	2551.50	2835.00	283.50	10	1
51	13	185	1185.38	1274.60	89.23	7	1
53	46	186	1472.93	1601.00	128.09	8	0
59	12	187	235.99	262.21	26.23	10	0
51	42	189	1642.65	1747.50	104.85	6	1
54	32	191	669.38	743.75	74.38	10	0
52	50	192	10443.40	11110.00	666.61	6	1
57	49	194	2219.45	2386.50	167.06	7	0
56	34	195	382.15	424.61	42.47	10	1
57	20	197	5676.41	6170.00	493.61	8	1
56	46	199	3242.03	3602.25	360.23	10	0
53	50	201	6266.04	6666.00	399.96	6	0
53	29	202	7740.89	8148.30	407.42	5	1
59	47	203	3183.67	3460.50	276.85	8	1
53	21	206	9521.96	10579.95	1058.00	10	0
54	22	207	683.91	719.90	36.00	5	0
58	43	208	83.63	90.91	7.28	8	0
58	24	210	453.70	482.66	28.96	6	1
55	43	211	422.69	454.50	31.82	7	0
55	49	212	906.88	954.61	47.74	5	0
54	48	213	347.82	374.00	26.19	7	1
57	48	214	281.25	299.20	17.96	6	0
59	25	216	126.78	137.81	11.03	8	1
57	43	217	431.78	454.50	22.73	5	0
52	41	218	5745.54	6178.00	432.47	7	0
56	16	221	1250.30	1316.10	65.81	5	0
55	15	223	1257.83	1352.50	94.68	7	1
55	24	226	380.61	413.71	33.10	8	1
57	11	227	5109.89	5494.50	384.62	7	1
58	49	228	1536.91	1670.55	133.65	8	0
52	37	229	7031.21	7812.45	781.25	10	1
54	18	230	18.68	20.31	1.63	8	0
54	30	232	407.17	452.41	45.25	10	0
58	44	233	698.88	768.00	69.13	9	1
51	27	234	2146.92	2333.60	186.69	8	0
56	36	235	3162.27	3437.25	274.99	8	0
59	23	236	2460.97	2646.20	185.24	7	1
53	44	237	829.44	921.60	92.16	10	0
55	10	238	559.65	589.11	29.46	5	0
52	26	239	7034.94	7405.20	370.26	5	0
59	24	241	262.01	275.81	13.80	5	0
52	14	243	4481.83	4767.90	286.08	6	0
53	25	245	194.30	206.71	12.41	6	0
57	10	246	2120.77	2356.41	235.65	10	1
57	17	248	434.20	457.05	22.86	5	0
57	47	250	6574.95	6921.00	346.06	5	0
58	50	2	5055.06	5555.00	499.95	9	1
58	14	3	1493.95	1589.30	95.36	6	0
58	25	5	313.50	344.50	31.01	9	1
51	32	6	684.25	743.75	59.50	8	1
52	23	7	3770.84	3969.30	198.47	5	0
59	43	8	169.08	181.81	12.73	7	0
56	10	9	1354.94	1472.75	117.83	8	1
55	32	10	1204.88	1338.75	133.88	10	0
54	24	11	192.38	206.86	14.48	7	0
52	46	12	1504.94	1601.00	96.07	6	0
51	29	13	12494.07	13580.50	1086.45	8	1
58	46	14	1440.91	1601.00	160.11	10	0
54	36	15	5568.35	6187.06	618.71	10	0
55	27	16	1341.83	1458.50	116.69	8	0
52	44	18	729.60	768.00	38.41	5	0
55	45	19	1701.00	1890.00	189.00	10	1
52	42	21	1642.65	1747.50	104.85	6	0
52	36	22	2529.82	2749.81	219.99	8	1
54	18	25	93.39	101.50	8.13	8	0
59	42	26	1272.19	1398.00	125.82	9	1
56	25	27	288.35	310.06	21.71	7	1
56	39	28	15019.93	16326.00	1306.08	8	1
53	39	29	11754.72	13060.80	1306.08	10	0
54	33	30	1813.50	1950.00	136.50	7	1
53	38	31	485.28	521.80	36.53	7	1
57	25	32	158.47	172.25	13.79	8	0
52	26	34	7664.39	8330.86	666.47	8	0
51	39	36	8816.04	9795.60	979.56	10	1
54	23	37	4306.70	4630.85	324.16	7	0
59	30	38	138.74	150.81	12.07	8	1
56	32	39	803.25	892.50	89.25	10	1
52	40	40	10592.89	11514.00	921.13	8	0
55	30	43	1235.06	1357.21	122.15	9	0
55	12	44	243.85	262.21	18.36	7	0
51	16	45	998.05	1096.75	98.71	9	0
53	20	46	3479.88	3702.00	222.13	6	1
54	25	48	160.20	172.25	12.06	7	1
57	33	50	1064.71	1170.00	105.30	9	1
51	46	53	1140.72	1200.75	60.04	5	0
58	11	55	3406.59	3663.00	256.42	7	0
58	12	56	205.39	218.50	13.11	6	1
53	49	57	217.18	238.66	21.48	9	1
51	29	59	12494.07	13580.50	1086.45	8	0
59	29	60	2498.82	2716.10	217.29	8	0
54	33	61	1053.00	1170.00	117.00	10	1
58	38	62	1661.94	1826.30	164.37	9	0
55	16	63	1009.01	1096.75	87.74	8	0
53	15	64	615.39	676.25	60.87	9	0
58	22	65	3930.66	4319.40	388.75	9	0
54	45	66	2608.21	2835.00	226.81	8	0
57	33	67	733.20	780.00	46.80	6	0
55	35	68	1491.13	1569.61	78.49	5	1
53	28	69	2551.23	2685.50	134.28	5	1
52	48	71	544.55	598.40	53.86	9	1
53	36	72	6530.78	6874.50	343.73	5	1
51	49	73	1345.99	1431.91	85.92	6	0
52	40	75	5469.15	5757.00	287.86	5	1
55	36	76	1897.37	2062.36	164.99	8	1
57	33	77	1649.70	1755.00	105.30	6	1
54	38	78	485.28	521.80	36.53	7	1
51	29	80	10103.90	10864.40	760.51	7	0
59	28	82	999.01	1074.21	75.20	7	1
51	13	83	2029.81	2230.55	200.75	9	0
54	21	84	8934.18	9404.40	470.23	5	0
57	22	85	4636.16	5039.31	403.15	8	0
55	38	86	474.84	521.80	46.97	9	1
57	26	88	2554.80	2776.95	222.16	8	0
52	15	89	622.15	676.25	54.11	8	1
55	25	90	323.83	344.50	20.67	6	0
51	32	91	138.34	148.75	10.42	7	1
54	24	92	380.61	413.71	33.10	8	1
56	18	93	73.08	81.21	8.13	10	1
57	45	94	1795.50	1890.00	94.50	5	0
59	24	97	64.82	68.96	4.14	6	0
51	41	98	2298.22	2471.20	172.99	7	1
52	33	99	1435.21	1560.00	124.80	8	1
54	36	101	5568.35	6187.06	618.71	10	0
56	25	103	98.19	103.36	5.17	5	0
59	40	104	11657.93	12953.25	1295.33	10	0
54	17	106	850.12	914.10	63.99	7	0
56	22	107	2649.24	2879.60	230.37	8	0
54	48	108	538.56	598.40	59.85	10	0
54	15	112	373.30	405.75	32.47	8	0
59	12	113	318.14	349.61	31.47	9	1
53	22	114	4636.16	5039.31	403.15	8	0
54	32	115	1130.50	1190.00	59.50	5	0
54	31	116	9314.75	9909.30	594.56	6	0
52	46	117	2185.37	2401.50	216.14	9	1
52	27	118	1610.19	1750.20	140.02	8	0
56	36	119	3162.27	3437.25	274.99	8	1
57	13	121	302.72	318.65	15.94	5	0
55	16	122	824.76	877.40	52.65	6	0
57	34	123	1738.74	1910.71	171.97	9	1
55	15	124	128.49	135.25	6.77	5	0
55	41	125	2298.22	2471.20	172.99	7	1
58	39	127	4652.91	4897.80	244.89	5	0
59	32	129	1231.66	1338.75	107.11	8	1
55	36	130	1938.61	2062.36	123.75	6	0
53	27	131	271.29	291.70	20.42	7	1
51	31	133	12287.54	13212.40	924.87	7	0
52	36	134	4475.30	4812.16	336.86	7	1
51	33	135	549.90	585.00	35.11	6	0
51	33	137	733.20	780.00	46.80	6	1
53	11	138	5555.56	6105.00	549.45	9	0
52	29	139	7496.44	8148.30	651.87	8	0
54	35	140	162.20	174.41	12.21	7	1
56	11	143	5054.95	5494.50	439.57	8	0
56	38	145	1187.10	1304.50	117.41	9	0
52	12	146	353.98	393.31	39.34	10	1
52	13	147	2867.85	3186.50	318.66	10	1
51	48	150	69.57	74.80	5.24	7	0
55	48	151	355.31	374.00	18.70	5	1
53	23	153	3010.06	3307.75	297.70	9	1
59	36	154	6324.54	6874.50	549.97	8	1
52	50	155	8354.72	8888.00	533.28	6	1
58	28	156	3910.09	4296.81	386.72	9	0
59	27	157	1061.79	1166.80	105.02	9	0
54	36	158	6324.54	6874.50	549.97	8	1
58	43	159	518.14	545.41	27.28	5	0
52	14	164	2264.76	2383.95	119.20	5	1
54	29	165	3829.71	4074.15	244.45	6	1
59	50	166	3099.69	3333.00	233.32	7	0
51	37	167	5468.72	6076.35	607.64	10	1
56	43	171	338.15	363.61	25.46	7	0
57	42	173	1286.17	1398.00	111.85	8	0
52	19	174	234.65	247.00	12.36	5	0
55	14	175	739.03	794.65	55.63	7	1
51	11	176	2747.25	3052.50	305.25	10	1
56	40	177	13385.03	14392.50	1007.48	7	0
57	31	178	4459.19	4954.65	495.47	10	1
54	36	179	5059.64	5499.61	439.97	8	0
54	37	181	6597.18	6944.40	347.23	5	1
51	12	183	287.55	305.91	18.36	6	0
54	26	185	8423.42	9256.50	833.09	9	0
53	44	186	428.55	460.80	32.26	7	0
51	36	187	3162.27	3437.25	274.99	8	0
51	17	188	868.40	914.10	45.71	5	0
57	49	189	224.34	238.66	14.32	6	1
54	48	190	412.90	448.80	35.91	8	0
57	35	191	641.80	697.61	55.81	8	0
51	34	192	605.06	636.91	31.85	5	1
55	21	193	4326.03	4702.20	376.18	8	0
56	50	194	8088.08	8888.00	799.92	9	1
59	32	195	133.88	148.75	14.88	10	0
55	31	197	13377.56	14863.95	1486.40	10	0
52	31	198	3038.86	3303.10	264.25	8	1
58	47	199	1095.83	1153.50	57.68	5	0
53	44	200	838.66	921.60	82.95	9	0
52	16	202	2083.83	2193.50	109.68	5	1
56	47	203	9654.80	10381.50	726.71	7	1
56	33	204	185.25	195.00	9.75	5	0
55	23	205	3572.37	3969.30	396.94	10	1
56	33	206	538.21	585.00	46.81	8	1
58	42	207	1272.19	1398.00	125.82	9	0
51	19	208	112.39	123.50	11.12	9	0
54	13	209	1778.07	1911.90	133.84	7	1
57	47	210	8489.77	9228.00	738.25	8	0
51	14	211	2240.92	2383.95	143.04	6	1
56	22	212	3383.53	3599.50	215.97	6	1
59	38	213	1961.97	2087.20	125.24	6	0
55	24	214	317.18	344.75	27.59	8	0
57	25	215	158.47	172.25	13.79	8	1
52	40	217	7771.95	8635.50	863.56	10	0
54	47	219	5190.75	5767.50	576.75	10	1
57	34	220	1579.52	1698.41	118.89	7	0
55	47	222	5363.78	5767.50	403.73	7	0
51	17	223	991.80	1066.46	74.66	7	1
52	18	226	184.74	203.00	18.27	9	0
58	14	227	6722.74	7151.85	429.12	6	0
51	44	229	552.97	614.40	61.44	10	1
51	30	230	286.52	301.61	15.09	5	0
51	25	231	256.31	275.61	19.30	7	1
57	19	232	113.63	123.50	9.89	8	0
58	13	233	1147.14	1274.60	127.46	10	0
59	49	234	868.69	954.61	85.92	9	0
58	24	236	64.82	68.96	4.14	6	1
56	32	237	968.37	1041.25	72.89	7	1
56	45	238	859.96	945.00	85.05	9	0
56	32	239	541.46	595.00	53.55	9	0
52	37	240	6458.30	6944.40	486.11	7	1
58	42	241	318.05	349.50	31.46	9	0
58	18	243	18.68	20.31	1.63	8	1
55	40	244	1338.51	1439.25	100.75	7	0
52	36	245	1959.24	2062.36	103.12	5	0
58	45	247	2293.21	2520.00	226.80	9	1
54	37	250	3159.71	3472.20	312.50	9	0
52	42	2	996.08	1048.50	52.43	5	0
52	11	4	1123.32	1221.00	97.69	8	1
53	39	5	9207.87	9795.60	587.74	6	0
51	13	7	296.35	318.65	22.31	7	0
51	17	8	1275.17	1371.15	95.99	7	0
58	16	9	394.83	438.70	43.88	10	0
55	31	10	1552.46	1651.55	99.10	6	1
53	13	13	1172.64	1274.60	101.97	8	0
53	41	14	2248.80	2471.20	222.41	9	0
59	31	17	10404.77	11560.86	1156.09	10	0
54	17	20	859.26	914.10	54.85	6	0
56	17	22	138.64	152.35	13.72	9	1
55	20	23	2776.50	3085.00	308.50	10	0
58	21	24	7405.97	8228.86	822.89	10	1
53	26	25	4998.52	5553.90	555.39	10	1
59	48	26	626.08	673.20	47.13	7	0
59	16	28	998.05	1096.75	98.71	9	0
59	12	29	83.04	87.41	4.38	5	1
59	40	30	6764.48	7196.25	431.78	6	0
53	25	32	313.50	344.50	31.01	9	1
51	26	34	1666.18	1851.30	185.13	10	1
51	43	35	760.84	818.11	57.27	7	1
58	26	36	2610.34	2776.95	166.62	6	0
59	20	38	4016.67	4319.00	302.34	7	0
59	42	39	1478.39	1572.75	94.37	6	1
55	14	40	6794.26	7151.85	357.60	5	1
52	30	42	1289.34	1357.21	67.86	5	0
59	27	43	542.57	583.40	40.84	7	0
59	28	45	3910.09	4296.81	386.72	9	0
52	15	46	1017.08	1082.00	64.93	6	0
57	35	47	1098.73	1220.80	122.08	10	1
52	45	48	1480.50	1575.00	94.50	6	0
56	44	50	866.31	921.60	55.30	6	0
51	20	51	5676.41	6170.00	493.61	8	1
51	15	53	861.55	946.75	85.21	9	0
53	29	54	6179.13	6790.25	611.13	9	0
58	46	55	3041.90	3202.00	160.11	5	1
59	21	56	3244.52	3526.65	282.14	8	0
56	10	57	1896.91	2061.85	164.95	8	0
54	21	58	8840.14	9404.40	564.27	6	0
56	23	59	6152.42	6615.50	463.09	7	0
59	39	61	11754.72	13060.80	1306.08	10	0
53	31	62	3104.92	3303.10	198.19	6	1
58	38	63	980.99	1043.60	62.62	6	1
51	45	64	299.25	315.00	15.75	5	0
54	17	65	144.74	152.35	7.62	5	0
56	29	66	5051.95	5432.20	380.26	7	1
56	20	67	2869.05	3085.00	215.96	7	0
53	16	68	1250.30	1316.10	65.81	5	1
58	43	73	345.43	363.61	18.19	5	0
54	19	74	44.47	49.40	4.95	10	0
54	48	77	492.19	523.61	31.42	6	0
54	30	79	1262.20	1357.21	95.01	7	0
55	38	80	1899.36	2087.20	187.85	9	0
59	40	81	3929.16	4317.75	388.60	9	0
51	48	82	351.57	374.00	22.44	6	1
58	13	83	286.79	318.65	31.87	10	0
54	28	84	3421.33	3759.71	338.38	9	0
56	42	88	328.53	349.50	20.97	6	1
57	39	90	13224.06	14693.40	1469.35	10	1
54	50	91	8265.85	8888.00	622.17	7	0
56	33	92	916.50	975.00	58.50	6	0
55	40	93	2648.23	2878.50	230.29	8	0
54	24	95	384.75	413.71	28.96	7	1
57	35	96	1297.54	1395.21	97.67	7	1
51	30	97	429.79	452.41	22.63	5	0
59	41	98	5807.32	6178.00	370.69	6	0
53	13	99	2345.27	2549.20	203.94	8	0
54	38	101	1698.46	1826.30	127.85	7	1
54	36	103	1306.16	1374.91	68.75	5	1
55	50	105	4177.36	4444.00	266.64	6	0
57	39	106	2971.34	3265.20	293.87	9	1
52	48	107	142.12	149.60	7.49	5	1
56	39	109	14693.40	16326.00	1632.61	10	1
54	13	110	2096.72	2230.55	133.84	6	1
59	47	111	2122.45	2307.00	184.57	8	1
53	26	113	5109.59	5553.90	444.32	8	1
54	44	114	285.70	307.20	21.51	7	0
53	14	115	2956.10	3178.60	222.51	7	1
51	31	116	13377.56	14863.95	1486.40	10	1
58	12	117	357.91	393.31	35.40	9	0
56	19	118	179.82	197.60	17.79	9	0
52	36	119	5815.83	6187.06	371.23	6	1
54	49	120	439.12	477.31	38.19	8	1
51	12	121	164.32	174.81	10.49	6	0
51	47	123	5421.45	5767.50	346.06	6	1
55	20	124	5614.70	6170.00	555.30	9	1
52	16	127	987.08	1096.75	109.68	10	1
58	38	129	245.25	260.90	15.66	6	1
51	16	131	1237.14	1316.10	78.97	6	0
54	20	132	4639.85	4936.00	296.16	6	1
51	44	134	291.84	307.20	15.36	5	1
56	49	135	1570.32	1670.55	100.24	6	1
56	17	140	700.82	761.75	60.94	8	0
56	50	141	5999.41	6666.00	666.61	10	0
58	25	142	192.24	206.71	14.47	7	0
53	26	143	8330.86	9256.50	925.66	10	1
57	24	144	570.91	620.56	49.65	8	0
52	24	145	583.32	620.56	37.24	6	0
59	43	146	827.20	909.00	81.82	9	0
53	43	147	409.06	454.50	45.46	10	1
58	49	148	651.52	715.96	64.44	9	1
51	29	149	9777.96	10864.40	1086.45	10	0
57	31	150	1519.43	1651.55	132.13	8	0
56	43	151	338.15	363.61	25.46	7	0
59	10	152	1678.94	1767.31	88.37	5	1
56	22	153	5895.99	6479.10	583.12	9	1
52	17	154	280.33	304.70	24.38	8	0
56	30	155	425.26	452.41	27.15	6	0
55	19	158	157.34	172.91	15.57	9	1
54	31	159	7762.29	8257.75	495.47	6	0
54	41	161	4448.16	4942.40	494.25	10	1
51	42	162	629.11	699.00	69.91	10	1
59	35	163	810.96	872.00	61.05	7	1
55	15	164	128.49	135.25	6.77	5	1
56	45	169	1496.25	1575.00	78.75	5	0
51	14	172	2987.89	3178.60	190.72	6	1
57	46	174	2161.35	2401.50	240.16	10	1
51	18	176	57.25	60.91	3.66	6	1
57	35	178	627.85	697.61	69.77	10	0
53	14	180	1478.05	1589.30	111.26	7	0
56	24	181	448.87	482.66	33.79	7	0
53	15	184	513.95	541.00	27.06	5	0
52	33	186	362.70	390.00	27.31	7	0
54	37	187	7343.71	7812.45	468.75	6	1
56	23	189	2434.51	2646.20	211.70	8	0
57	15	190	1006.26	1082.00	75.75	7	1
57	15	191	1119.88	1217.25	97.38	8	1
58	42	193	318.05	349.50	31.46	9	0
57	38	194	980.99	1043.60	62.62	6	1
55	35	195	1459.73	1569.61	109.88	7	1
59	45	196	598.50	630.00	31.50	5	0
57	27	201	542.57	583.40	40.84	7	1
55	13	202	2096.72	2230.55	133.84	6	1
54	30	203	823.37	904.81	81.44	9	1
52	34	204	1796.06	1910.71	114.65	6	0
52	44	206	857.09	921.60	64.52	7	0
51	29	207	10321.18	10864.40	543.23	5	1
58	47	208	4383.31	4614.00	230.71	5	0
59	38	209	939.24	1043.60	104.36	10	0
59	35	211	784.81	872.00	87.21	10	0
57	31	213	9314.75	9909.30	594.56	6	1
58	50	214	9999.00	11110.00	1111.00	10	0
52	16	215	824.76	877.40	52.65	6	0
52	45	216	888.30	945.00	56.70	6	1
55	25	217	98.19	103.36	5.17	5	1
56	18	218	56.64	60.91	4.27	7	1
54	34	219	1953.17	2123.00	169.85	8	0
54	19	220	162.53	172.91	10.38	6	0
58	20	221	2776.50	3085.00	308.50	10	1
56	25	222	248.05	275.61	27.57	10	1
55	31	223	4459.19	4954.65	495.47	10	0
58	32	225	136.85	148.75	11.91	8	0
54	29	226	11244.66	12222.45	977.80	8	0
55	35	228	1255.69	1395.21	139.53	10	0
58	17	229	840.98	914.10	73.13	8	1
53	25	230	94.05	103.36	9.31	9	0
54	34	231	1159.16	1273.81	114.65	9	0
57	15	232	984.63	1082.00	97.38	9	1
52	41	233	2934.55	3089.00	154.46	5	0
54	18	234	56.03	60.91	4.88	8	0
56	21	235	4279.01	4702.20	423.20	9	1
58	39	236	14693.40	16326.00	1632.61	10	1
57	32	237	282.63	297.50	14.88	5	1
54	16	238	1974.16	2193.50	219.36	10	0
56	25	239	194.30	206.71	12.41	6	0
56	20	240	3516.90	3702.00	185.11	5	0
52	23	241	3109.29	3307.75	198.47	6	0
52	33	242	1404.00	1560.00	156.00	10	0
57	38	243	712.26	782.70	70.45	9	0
53	36	244	639.33	687.46	48.13	7	1
54	41	245	5683.77	6178.00	494.25	8	0
57	48	246	632.81	673.20	40.40	6	0
54	40	247	12046.53	12953.25	906.73	7	1
58	13	248	2007.50	2230.55	223.06	10	1
58	43	250	250.89	272.71	21.82	8	0
54	24	1	453.70	482.66	28.96	6	1
57	40	2	5411.58	5757.00	345.42	6	1
53	47	3	7509.29	8074.50	565.22	7	1
54	41	8	2322.93	2471.20	148.28	6	0
54	11	9	2271.06	2442.00	170.95	7	1
51	17	11	1275.17	1371.15	95.99	7	1
51	34	12	1367.22	1486.11	118.89	8	1
56	49	13	453.44	477.31	23.87	5	1
51	19	16	222.31	247.00	24.71	10	0
57	31	17	10404.77	11560.86	1156.09	10	1
53	43	18	341.79	363.61	21.82	6	0
59	44	21	967.69	1075.21	107.53	10	0
53	30	23	271.45	301.61	30.17	10	1
54	14	24	754.92	794.65	39.74	5	0
59	27	26	548.40	583.40	35.01	6	0
52	35	27	476.12	523.21	47.09	9	1
55	45	28	2866.50	3150.00	283.50	9	1
59	27	29	265.45	291.70	26.26	9	0
57	30	30	411.69	452.41	40.72	9	0
57	32	31	1368.50	1487.50	119.00	8	0
59	16	33	592.25	658.05	65.81	10	1
55	14	35	1462.16	1589.30	127.15	8	0
53	31	36	9314.75	9909.30	594.56	6	0
56	20	38	2807.35	3085.00	277.65	9	1
51	17	39	1401.63	1523.50	121.88	8	1
54	34	41	1796.06	1910.71	114.65	6	0
58	24	43	589.53	620.56	31.03	5	0
56	10	44	2191.46	2356.41	164.95	7	0
57	18	45	147.79	162.41	14.62	9	1
51	23	47	1845.73	1984.65	138.93	7	0
51	33	48	1466.40	1560.00	93.60	6	1
55	49	49	1345.99	1431.91	85.92	6	0
52	50	50	4132.93	4444.00	311.09	7	0
52	16	51	833.53	877.40	43.88	5	1
51	46	52	2605.63	2801.75	196.13	7	0
59	29	54	10103.90	10864.40	760.51	7	0
52	37	60	6527.74	6944.40	416.67	6	1
56	11	62	567.77	610.50	42.74	7	0
54	17	63	859.26	914.10	54.85	6	1
56	10	64	1107.51	1178.21	70.70	6	1
56	15	66	127.14	135.25	8.12	6	0
57	25	68	310.06	344.50	34.46	10	0
51	37	69	2369.78	2604.15	234.38	9	0
56	29	70	1235.83	1358.05	122.23	9	1
59	49	71	214.79	238.66	23.87	10	0
56	30	72	701.22	754.00	52.79	7	1
55	25	73	316.94	344.50	27.57	8	0
55	46	74	380.24	400.25	20.02	5	0
57	13	75	2319.78	2549.20	229.43	9	1
51	34	76	605.06	636.91	31.85	5	0
55	11	77	3369.97	3663.00	293.05	8	0
58	39	78	1550.97	1632.60	81.63	5	0
51	15	79	628.92	676.25	47.34	7	1
55	21	80	2115.99	2351.10	235.12	10	0
58	49	81	1503.50	1670.55	167.06	10	0
55	14	82	4386.47	4767.90	381.44	8	0
58	44	83	729.60	768.00	38.41	5	0
59	31	84	13377.56	14863.95	1486.40	10	1
55	23	86	3109.29	3307.75	198.47	6	0
54	12	87	281.43	305.91	24.48	8	0
56	49	88	1775.56	1909.21	133.65	7	0
56	13	89	573.57	637.30	63.73	10	0
57	38	90	495.71	521.80	26.09	5	1
54	13	91	2345.27	2549.20	203.94	8	0
59	36	93	2584.82	2749.81	164.99	6	1
55	44	94	857.09	921.60	64.52	7	1
59	29	95	7740.89	8148.30	407.42	5	1
55	47	96	6436.53	6921.00	484.48	7	0
59	48	98	426.36	448.80	22.44	5	1
54	20	99	5275.35	5553.00	277.66	5	1
56	12	100	120.62	131.11	10.49	8	1
58	19	101	229.71	247.00	17.30	7	0
57	48	104	710.61	748.00	37.40	5	0
59	35	108	1325.45	1395.21	69.77	5	1
59	32	110	135.37	148.75	13.39	9	1
59	47	113	8489.77	9228.00	738.25	8	1
51	11	114	2197.81	2442.00	244.21	10	0
53	10	115	2680.41	2945.50	265.10	9	0
55	44	116	866.31	921.60	55.30	6	1
55	10	118	1876.29	2061.85	185.57	9	0
54	44	120	698.88	768.00	69.13	9	1
55	11	122	5677.65	6105.00	427.36	7	1
59	17	123	685.58	761.75	76.18	10	0
52	33	124	1833.00	1950.00	117.00	6	1
57	50	125	9999.00	11110.00	1111.00	10	0
57	28	126	3496.53	3759.71	263.18	7	1
54	17	127	560.65	609.40	48.76	8	1
59	41	128	3336.12	3706.80	370.69	10	1
54	18	130	182.71	203.00	20.31	10	0
58	11	133	2777.78	3052.50	274.73	9	1
52	39	134	13958.73	14693.40	734.68	5	1
55	26	135	5165.13	5553.90	388.78	7	0
53	48	136	68.07	74.80	6.74	9	1
57	34	137	390.64	424.61	33.97	8	0
55	45	138	2608.21	2835.00	226.81	8	0
58	34	140	1008.43	1061.50	53.08	5	0
55	45	141	2343.60	2520.00	176.41	7	0
51	14	142	5228.80	5562.56	333.76	6	0
57	24	143	558.50	620.56	62.06	10	1
52	18	144	75.52	81.21	5.69	7	0
58	42	146	325.04	349.50	24.47	7	0
55	10	147	2518.41	2650.96	132.55	5	1
57	29	148	3870.45	4074.15	203.71	5	0
57	44	149	838.66	921.60	82.95	9	0
52	24	150	512.99	551.61	38.62	7	0
57	34	151	1796.06	1910.71	114.65	6	1
52	27	152	813.85	875.10	61.26	7	0
59	11	153	4444.45	4884.00	439.57	9	0
51	31	154	7844.87	8257.75	412.89	5	0
54	21	155	4279.01	4702.20	423.20	9	0
59	25	157	94.05	103.36	9.31	9	1
55	22	158	4636.16	5039.31	403.15	8	0
52	22	159	2678.03	2879.60	201.58	7	0
59	16	161	1443.33	1535.46	92.13	6	1
53	15	162	125.79	135.25	9.47	7	1
59	28	163	504.88	537.11	32.23	6	1
52	49	164	217.18	238.66	21.48	9	0
57	47	165	9447.17	10381.50	934.34	9	0
57	20	166	2344.60	2468.00	123.41	5	1
51	26	171	8793.68	9256.50	462.83	5	0
57	10	172	1340.21	1472.75	132.55	9	0
52	36	173	4330.94	4812.16	481.22	10	1
57	47	176	5190.75	5767.50	576.75	10	0
59	44	177	138.25	153.60	15.36	10	0
53	17	178	280.33	304.70	24.38	8	1
55	48	179	347.82	374.00	26.19	7	0
51	40	182	7944.67	8635.50	690.85	8	0
57	42	183	318.05	349.50	31.46	9	0
59	31	184	12023.29	13212.40	1189.12	9	1
51	46	185	2633.65	2801.75	168.11	6	0
57	36	186	3127.90	3437.25	309.36	9	1
57	11	188	2222.23	2442.00	219.79	9	0
54	14	189	7469.71	7946.50	476.79	6	0
54	33	190	1111.50	1170.00	58.50	5	1
59	15	191	635.68	676.25	40.58	6	1
56	27	192	268.37	291.70	23.34	8	0
56	32	193	1245.04	1338.75	93.72	7	0
57	19	195	89.91	98.80	8.90	9	0
56	18	196	133.58	142.10	8.53	6	1
56	17	197	840.98	914.10	73.13	8	1
57	32	199	406.09	446.25	40.17	9	0
57	11	201	5054.95	5494.50	439.57	8	0
55	45	202	2835.00	3150.00	315.00	10	0
59	29	203	11244.66	12222.45	977.80	8	0
59	31	204	11891.16	13212.40	1321.25	10	0
51	44	207	141.32	153.60	12.29	8	0
56	25	208	226.69	241.16	14.47	6	0
54	46	211	2257.41	2401.50	144.10	6	1
58	43	212	409.06	454.50	45.46	10	0
51	22	213	2678.03	2879.60	201.58	7	1
59	35	214	1604.49	1744.00	139.53	8	1
53	33	215	358.81	390.00	31.20	8	0
52	45	216	2343.60	2520.00	176.41	7	1
57	16	217	408.00	438.70	30.71	7	1
59	32	218	279.65	297.50	17.85	6	0
55	35	219	828.40	872.00	43.61	5	1
58	35	220	491.81	523.21	31.40	6	0
54	14	222	3655.40	3973.25	317.87	8	0
54	45	224	2929.50	3150.00	220.51	7	0
51	30	226	716.30	754.00	37.71	5	0
53	43	227	427.23	454.50	27.27	6	0
58	11	228	3931.63	4273.50	341.88	8	0
53	15	229	1230.78	1352.50	121.73	9	0
54	41	230	4547.01	4942.40	395.40	8	0
51	47	231	7509.29	8074.50	565.22	7	1
54	34	232	598.69	636.91	38.22	6	1
57	30	233	1289.34	1357.21	67.86	5	1
56	27	235	265.45	291.70	26.26	9	0
51	43	236	518.14	545.41	27.28	5	1
55	39	237	7346.70	8163.00	816.31	10	1
58	13	238	2609.75	2867.85	258.11	9	1
58	16	240	1041.92	1096.75	54.84	5	0
58	39	241	4603.94	4897.80	293.87	6	0
59	11	243	2222.23	2442.00	219.79	9	1
59	30	244	1387.37	1508.00	120.65	8	0
55	16	245	1875.45	1974.15	98.71	5	0
59	14	246	4386.47	4767.90	381.44	8	0
55	49	248	1303.03	1431.91	128.88	9	1
58	30	249	1417.52	1508.00	90.48	6	1
58	34	1	386.39	424.61	38.22	9	0
58	11	2	3443.22	3663.00	219.79	6	1
56	48	3	347.82	374.00	26.19	7	1
54	50	4	10110.11	11110.00	999.90	9	0
59	49	7	1587.03	1670.55	83.53	5	0
59	20	8	3930.29	4319.00	388.71	9	1
55	47	11	10381.50	11535.00	1153.50	10	0
57	32	13	267.75	297.50	29.75	10	1
51	15	14	128.49	135.25	6.77	5	1
57	34	15	1910.71	2123.00	212.31	10	0
55	36	16	2474.83	2749.81	274.99	10	1
52	32	20	138.34	148.75	10.42	7	0
55	40	23	4058.69	4317.75	259.07	6	1
54	18	24	129.32	142.10	12.79	9	1
57	13	25	1816.31	1911.90	95.60	5	0
59	21	26	8463.96	9404.40	940.45	10	1
59	45	27	283.50	315.00	31.50	10	1
57	37	28	5529.48	6076.35	546.88	9	0
51	37	29	6319.41	6944.40	625.00	9	1
57	14	30	2240.92	2383.95	143.04	6	0
51	32	31	535.50	595.00	59.50	10	1
52	42	32	985.59	1048.50	62.91	6	1
55	30	33	548.92	603.21	54.29	9	1
53	30	34	693.69	754.00	60.33	8	0
56	14	35	754.92	794.65	39.74	5	1
56	28	36	1009.75	1074.21	64.46	6	1
56	43	37	82.72	90.91	8.19	9	1
52	16	38	1776.74	1974.15	197.42	10	0
57	41	39	4547.01	4942.40	395.40	8	1
53	15	40	497.73	541.00	43.29	8	0
56	19	41	22.98	24.70	1.73	7	0
52	39	42	11885.33	13060.80	1175.48	9	1
55	22	43	1367.81	1439.80	71.99	5	0
58	11	44	567.77	610.50	42.74	7	1
54	22	45	3383.53	3599.50	215.97	6	1
53	22	46	655.11	719.90	64.80	9	0
51	43	47	863.55	909.00	45.46	5	0
53	43	48	169.08	181.81	12.73	7	0
53	36	49	3835.98	4124.71	288.73	7	0
54	10	52	2518.41	2650.96	132.55	5	0
57	47	54	9447.17	10381.50	934.34	9	0
53	44	55	437.76	460.80	23.04	5	1
54	41	56	4596.44	4942.40	345.97	7	1
58	28	58	3383.74	3759.71	375.98	10	1
53	41	59	1668.06	1853.40	185.35	10	0
56	34	60	1596.50	1698.41	101.91	6	0
52	30	61	1109.89	1206.41	96.52	8	1
55	18	62	169.92	182.71	12.79	7	0
54	29	64	7740.89	8148.30	407.42	5	1
53	14	65	4434.15	4767.90	333.76	7	1
59	28	67	1466.29	1611.31	145.02	9	1
54	32	70	1106.70	1190.00	83.31	7	0
56	42	71	975.11	1048.50	73.40	7	1
54	21	72	5348.76	5877.75	529.00	9	0
54	23	74	5027.78	5292.40	264.63	5	0
53	12	76	238.61	262.21	23.60	9	1
59	16	77	394.83	438.70	43.88	10	0
55	25	80	327.28	344.50	17.23	5	1
58	25	81	64.77	68.91	4.14	6	0
59	13	83	302.72	318.65	15.94	5	0
55	11	86	573.88	610.50	36.63	6	1
54	24	87	634.35	689.50	55.17	8	0
53	42	88	964.63	1048.50	83.88	8	1
57	22	89	3887.46	4319.40	431.94	10	0
55	15	90	1027.90	1082.00	54.11	5	1
59	50	91	6199.38	6666.00	466.63	7	1
55	38	92	490.50	521.80	31.31	6	1
51	27	93	1341.83	1458.50	116.69	8	1
57	46	96	2913.83	3202.00	288.19	9	0
59	45	97	1795.50	1890.00	94.50	5	1
58	11	98	5219.78	5494.50	274.73	5	0
59	43	99	327.25	363.61	36.37	10	1
55	40	100	3972.34	4317.75	345.43	8	1
53	26	101	3369.37	3702.60	333.24	9	1
59	46	102	3278.05	3602.25	324.21	9	1
51	49	103	2018.98	2147.85	128.88	6	0
58	28	104	4941.33	5371.00	429.69	8	0
52	26	105	6025.99	6479.56	453.57	7	0
58	50	106	4999.50	5555.00	555.50	10	0
52	11	107	3406.59	3663.00	256.42	7	1
51	15	108	1017.08	1082.00	64.93	6	1
53	13	110	2029.81	2230.55	200.75	9	0
52	25	111	196.37	206.71	10.34	5	1
58	34	112	806.75	849.21	42.47	5	1
52	49	116	2040.46	2147.85	107.40	5	0
58	29	117	8745.85	9506.36	760.51	8	0
59	22	120	4736.95	5039.31	302.36	6	1
51	24	121	448.87	482.66	33.79	7	0
53	15	122	762.81	811.50	48.69	6	0
58	21	123	5289.98	5877.75	587.78	10	0
57	20	124	586.15	617.00	30.86	5	1
54	43	125	585.40	636.31	50.91	8	0
52	10	126	1958.76	2061.85	103.10	5	1
58	50	128	8354.72	8888.00	533.28	6	0
55	30	129	850.52	904.81	54.29	6	1
57	35	131	331.37	348.81	17.45	5	0
53	26	132	7497.77	8330.86	833.09	10	1
57	15	133	123.08	135.25	12.18	9	0
51	40	134	8203.73	8635.50	431.78	5	1
51	13	135	2724.46	2867.85	143.40	5	1
56	19	136	133.38	148.20	14.83	10	1
51	44	137	829.44	921.60	92.16	10	0
54	32	138	1218.27	1338.75	120.49	9	0
58	43	139	334.52	363.61	29.09	8	1
53	46	140	2605.63	2801.75	196.13	7	0
51	29	141	4888.98	5432.20	543.23	10	1
57	44	142	1155.08	1228.80	73.73	6	1
51	44	143	288.77	307.20	18.44	6	0
59	43	144	170.90	181.81	10.91	6	1
54	26	145	5220.67	5553.90	333.24	6	0
56	36	146	2612.31	2749.81	137.50	5	1
56	28	147	499.51	537.11	37.60	7	0
58	24	148	128.25	137.91	9.66	7	1
57	39	151	7673.22	8163.00	489.78	6	1
54	33	153	1813.50	1950.00	136.50	7	0
59	30	154	286.52	301.61	15.09	5	1
54	46	155	2161.35	2401.50	240.16	10	0
51	31	156	1535.95	1651.55	115.61	7	1
59	35	157	1569.61	1744.00	174.41	10	1
56	24	158	388.88	413.71	24.83	6	1
54	29	160	2580.30	2716.10	135.81	5	0
58	26	162	7581.08	8330.86	749.78	9	1
54	38	163	1982.84	2087.20	104.36	5	0
54	13	164	1465.79	1593.25	127.47	8	0
53	46	165	1488.93	1601.00	112.08	7	0
52	22	166	2735.62	2879.60	143.98	5	1
56	49	168	219.56	238.66	19.10	8	1
51	28	170	1933.57	2148.41	214.85	10	1
53	37	172	6597.18	6944.40	347.23	5	1
52	31	173	1552.46	1651.55	99.10	6	1
57	20	174	4059.86	4319.00	259.14	6	0
53	46	175	1456.92	1601.00	144.10	9	1
55	46	176	372.24	400.25	28.02	7	1
54	36	177	1292.41	1374.91	82.50	6	0
56	34	178	193.20	212.31	19.11	9	0
52	17	179	859.26	914.10	54.85	6	1
51	26	180	7831.00	8330.86	499.86	6	0
52	22	181	4017.05	4319.40	302.36	7	1
51	12	182	314.65	349.61	34.97	10	1
51	41	183	1705.13	1853.40	148.28	8	0
59	48	187	70.32	74.80	4.49	6	0
59	41	188	5226.59	5560.20	333.62	6	1
57	18	189	169.92	182.71	12.79	7	0
51	15	192	899.42	946.75	47.34	5	1
54	24	194	648.13	689.50	41.37	6	0
56	37	195	5468.72	6076.35	607.64	10	0
53	46	196	2257.41	2401.50	144.10	6	1
52	48	197	351.57	374.00	22.44	6	1
54	26	198	2582.57	2776.95	194.39	7	1
56	10	199	2491.90	2650.96	159.06	6	0
53	23	200	2487.43	2646.20	158.78	6	0
52	38	201	234.81	260.90	26.09	10	1
56	23	202	4353.00	4630.85	277.86	6	0
59	15	203	1156.39	1217.25	60.87	5	0
56	36	204	1264.91	1374.91	110.00	8	0
57	25	205	288.35	310.06	21.71	7	0
58	38	206	234.81	260.90	26.09	10	1
58	26	207	8423.42	9256.50	833.09	9	1
53	31	208	10982.81	11560.86	578.05	5	1
53	37	209	1562.50	1736.10	173.62	10	0
53	47	210	10612.21	11535.00	922.81	8	0
58	40	212	2619.44	2878.50	259.07	9	0
53	43	213	418.15	454.50	36.36	8	0
55	17	214	411.35	457.05	45.71	10	0
53	47	215	1049.69	1153.50	103.82	9	1
51	10	217	1876.29	2061.85	185.57	9	1
58	32	218	423.94	446.25	22.32	5	1
58	41	219	556.02	617.80	61.79	10	0
53	49	220	906.88	954.61	47.74	5	1
55	40	221	12176.06	12953.25	777.20	6	0
52	15	222	123.08	135.25	12.18	9	1
52	31	223	4508.74	4954.65	445.92	9	1
52	47	225	6228.91	6921.00	692.11	10	0
54	10	226	2215.02	2356.41	141.39	6	0
57	32	227	547.40	595.00	47.61	8	1
51	49	228	2040.46	2147.85	107.40	5	0
51	24	230	655.03	689.50	34.48	5	0
54	42	231	1462.66	1572.75	110.10	7	0
55	38	234	2160.26	2348.10	187.85	8	0
54	16	235	1381.91	1535.46	153.55	10	0
53	11	236	3479.85	3663.00	183.16	5	1
59	49	239	1303.03	1431.91	128.88	9	1
52	50	240	7154.85	7777.00	622.16	8	1
56	23	242	4869.01	5292.40	423.40	8	0
59	47	243	7590.03	8074.50	484.47	6	0
58	25	245	96.12	103.36	7.24	7	0
52	46	246	1881.18	2001.25	120.08	6	1
59	13	248	2052.11	2230.55	178.45	8	0
53	25	249	261.82	275.61	13.79	5	0
52	50	250	3033.04	3333.00	299.97	9	0
57	44	2	1155.08	1228.80	73.73	6	0
53	20	3	4059.86	4319.00	259.14	6	0
53	44	6	829.44	921.60	92.16	10	0
54	18	7	192.85	203.00	10.16	5	1
52	30	8	1387.37	1508.00	120.65	8	0
58	26	9	3369.37	3702.60	333.24	9	1
54	17	10	554.56	609.40	54.85	9	0
57	22	11	2649.24	2879.60	230.37	8	0
59	10	12	2385.86	2650.96	265.10	10	1
57	32	13	419.48	446.25	26.78	6	0
55	17	14	1386.39	1523.50	137.12	9	0
57	31	15	6275.89	6606.20	330.32	5	0
55	47	16	1049.69	1153.50	103.82	9	1
54	13	18	3027.18	3186.50	159.33	5	0
55	15	20	754.70	811.50	56.81	7	0
56	30	21	1417.52	1508.00	90.48	6	1
51	36	22	1897.37	2062.36	164.99	8	1
57	12	23	397.68	437.00	39.33	9	0
56	10	24	2412.37	2650.96	238.59	9	1
55	24	25	655.03	689.50	34.48	5	0
52	41	28	4021.88	4324.60	302.73	7	0
56	14	30	7469.71	7946.50	476.79	6	0
51	11	32	555.56	610.50	54.95	9	0
56	16	34	807.21	877.40	70.20	8	1
56	24	35	388.88	413.71	24.83	6	0
53	20	37	1739.94	1851.00	111.07	6	1
58	47	38	9447.17	10381.50	934.34	9	1
59	50	41	999.90	1111.00	111.11	10	0
52	40	42	9268.78	10074.75	805.99	8	0
54	39	43	12407.76	13060.80	653.04	5	0
51	47	44	2145.51	2307.00	161.50	7	0
53	21	45	7735.12	8228.86	493.74	6	1
55	14	46	5848.63	6357.20	508.58	8	0
55	39	47	10513.95	11428.20	914.26	8	1
52	39	48	5942.67	6530.40	587.74	9	0
51	23	51	2434.51	2646.20	211.70	8	0
55	38	52	1661.94	1826.30	164.37	9	1
58	27	53	1356.41	1458.50	102.10	7	1
56	17	54	548.47	609.40	60.94	10	0
58	49	57	665.84	715.96	50.12	7	0
52	24	58	583.32	620.56	37.24	6	0
59	40	59	13385.03	14392.50	1007.48	7	0
55	49	60	2243.31	2386.50	143.19	6	0
56	41	61	1112.04	1235.60	123.57	10	1
53	15	62	256.98	270.50	13.53	5	1
52	15	65	497.73	541.00	43.29	8	0
58	37	66	8159.67	8680.50	520.83	6	0
55	39	67	1485.67	1632.60	146.94	9	0
58	36	68	1856.12	2062.36	206.24	10	1
59	48	69	69.57	74.80	5.24	7	1
51	36	70	3918.47	4124.71	206.24	5	1
51	43	71	245.44	272.71	27.28	10	1
51	42	72	1446.94	1572.75	125.83	8	0
58	39	73	13371.00	14693.40	1322.41	9	1
57	31	75	5945.58	6606.20	660.63	10	0
51	27	76	2683.65	2917.00	233.37	8	1
58	14	77	5912.20	6357.20	445.01	7	1
59	13	78	592.69	637.30	44.62	7	1
57	40	80	2648.23	2878.50	230.29	8	0
56	48	81	421.88	448.80	26.93	6	0
57	23	84	4921.94	5292.40	370.47	7	1
52	10	85	2768.77	2945.50	176.73	6	0
51	33	86	532.36	585.00	52.65	9	0
51	48	87	272.28	299.20	26.93	9	1
51	36	90	4330.94	4812.16	481.22	10	0
51	32	94	1071.00	1190.00	119.00	10	0
52	18	95	92.37	101.50	9.14	9	0
58	37	96	7031.21	7812.45	781.25	10	1
53	48	99	336.61	374.00	37.40	10	0
53	21	100	2115.99	2351.10	235.12	10	0
52	47	102	9862.43	10381.50	519.08	5	1
59	33	103	1283.10	1365.00	81.90	6	0
56	17	105	1096.93	1218.80	121.88	10	0
51	40	106	12953.25	14392.50	1439.25	10	1
51	30	108	1121.96	1206.41	84.45	7	0
51	36	110	1959.24	2062.36	103.12	5	0
55	10	111	1340.21	1472.75	132.55	9	1
58	25	112	259.07	275.61	16.54	6	0
53	17	113	1401.63	1523.50	121.88	8	1
59	40	114	8203.73	8635.50	431.78	5	0
55	41	115	4695.28	4942.40	247.13	5	1
53	17	116	566.75	609.40	42.66	7	0
56	37	117	7031.21	7812.45	781.25	10	1
55	42	118	318.05	349.50	31.46	9	0
56	16	119	399.22	438.70	39.49	9	0
55	19	120	22.48	24.70	2.23	9	0
57	39	121	7673.22	8163.00	489.78	6	1
54	10	123	270.99	294.56	23.57	8	0
52	16	124	798.44	877.40	78.97	9	0
58	38	125	949.68	1043.60	93.93	9	0
51	41	127	4695.28	4942.40	247.13	5	0
54	18	128	135.00	142.10	7.11	5	0
52	34	129	1171.90	1273.81	101.91	8	0
54	38	130	1487.13	1565.40	78.27	5	0
55	20	132	3442.86	3702.00	259.15	7	1
55	38	133	1174.05	1304.50	130.46	10	0
56	43	134	84.54	90.91	6.37	7	1
52	37	135	7109.33	7812.45	703.13	9	0
57	14	136	7231.32	7946.50	715.19	9	0
51	26	137	860.86	925.65	64.80	7	0
52	20	138	4541.12	4936.00	394.88	8	1
58	28	140	3496.53	3759.71	263.18	7	0
57	35	141	962.69	1046.41	83.72	8	0
56	33	142	538.21	585.00	46.81	8	1
53	15	143	738.47	811.50	73.04	9	0
51	36	144	618.71	687.46	68.75	10	1
56	28	145	4592.21	4833.91	241.70	5	0
55	29	146	7496.44	8148.30	651.87	8	0
56	29	147	1262.99	1358.05	95.07	7	0
51	40	148	12953.25	14392.50	1439.25	10	1
56	38	149	1920.23	2087.20	166.98	8	0
56	24	150	384.75	413.71	28.96	7	0
56	46	151	3802.38	4002.50	200.13	5	1
52	14	152	715.19	794.65	79.47	10	0
52	18	153	115.72	121.81	6.10	5	1
51	45	154	573.31	630.00	56.70	9	0
58	17	157	1109.11	1218.80	109.70	9	1
53	21	158	2115.99	2351.10	235.12	10	0
56	37	159	7343.71	7812.45	468.75	6	0
52	27	162	805.10	875.10	70.01	8	0
53	32	163	410.56	446.25	35.71	8	1
59	10	164	1072.17	1178.21	106.04	9	0
54	19	166	136.35	148.20	11.86	8	0
59	21	167	1069.76	1175.55	105.80	9	1
54	49	168	1756.47	1909.21	152.74	8	1
55	49	169	1133.59	1193.25	59.67	5	0
58	33	171	1111.50	1170.00	58.50	5	1
54	34	173	1596.50	1698.41	101.91	6	0
52	42	175	964.63	1048.50	83.88	8	0
51	50	176	10554.50	11110.00	555.50	5	0
52	21	177	2115.99	2351.10	235.12	10	0
55	22	178	6551.10	7199.00	647.91	9	0
55	35	180	793.52	872.00	78.49	9	1
59	24	182	190.31	206.86	16.55	8	0
51	42	183	482.32	524.25	41.94	8	0
53	13	188	1497.66	1593.25	95.60	6	1
58	46	190	1801.13	2001.25	200.13	10	0
57	21	191	1081.51	1175.55	94.05	8	0
55	22	192	6479.11	7199.00	719.91	10	1
51	28	193	3383.74	3759.71	375.98	10	1
59	43	194	591.76	636.31	44.55	7	0
53	49	195	1073.93	1193.25	119.33	10	0
54	45	197	1480.50	1575.00	94.50	6	0
52	29	198	6450.74	6790.25	339.52	5	1
54	48	199	210.94	224.40	13.47	6	1
59	18	200	168.09	182.71	14.62	8	0
56	38	201	980.99	1043.60	62.62	6	1
57	39	202	14856.66	16326.00	1469.34	9	0
54	32	203	1245.04	1338.75	93.72	7	0
56	23	205	3572.37	3969.30	396.94	10	0
56	16	207	197.42	219.35	21.94	10	1
56	48	209	492.19	523.61	31.42	6	1
53	42	211	498.04	524.25	26.22	5	0
56	39	212	12015.94	13060.80	1044.87	8	0
53	22	213	683.91	719.90	36.00	5	0
57	45	214	1417.50	1575.00	157.50	10	1
55	44	215	279.56	307.20	27.65	9	0
52	24	216	620.56	689.50	68.96	10	0
57	24	217	564.71	620.56	55.85	9	0
57	12	218	290.61	305.91	15.30	5	1
55	11	219	5799.75	6105.00	305.25	5	0
55	41	220	1760.73	1853.40	92.68	5	0
57	11	222	579.98	610.50	30.53	5	1
58	29	224	5051.95	5432.20	380.26	7	0
54	13	225	860.36	955.95	95.60	10	1
58	26	227	5220.67	5553.90	333.24	6	1
53	25	228	125.40	137.81	12.41	9	1
58	50	229	2044.25	2222.00	177.76	8	1
57	47	231	3218.27	3460.50	242.24	7	1
55	39	232	3069.29	3265.20	195.92	6	0
58	32	234	978.78	1041.25	62.48	6	0
59	10	236	279.83	294.56	14.73	5	0
52	45	237	1159.21	1260.00	100.80	8	1
56	26	239	6738.74	7405.20	666.47	9	0
52	48	241	426.36	448.80	22.44	5	1
57	25	242	130.91	137.81	6.90	5	0
51	47	243	10842.90	11535.00	692.11	6	0
58	19	245	222.31	247.00	24.71	10	0
51	16	246	789.66	877.40	87.75	10	1
58	25	247	316.94	344.50	27.57	8	1
56	45	249	567.00	630.00	63.00	10	0
59	45	250	296.10	315.00	18.90	6	0
54	18	1	169.92	182.71	12.79	7	0
51	19	2	136.35	148.20	11.86	8	0
54	50	3	10221.21	11110.00	888.81	8	0
53	34	5	764.29	849.21	84.93	10	0
52	32	6	541.46	595.00	53.55	9	1
53	33	9	179.41	195.00	15.60	8	0
52	43	10	330.88	363.61	32.73	9	1
51	20	13	4442.41	4936.00	493.61	10	1
54	49	14	2018.98	2147.85	128.88	6	1
52	47	15	4152.61	4614.00	461.41	10	1
53	19	17	224.78	247.00	22.24	9	0
54	17	18	566.75	609.40	42.66	7	1
56	46	19	752.47	800.50	48.04	6	0
58	20	20	1172.30	1234.00	61.71	5	0
51	20	21	4103.06	4319.00	215.96	5	0
54	27	22	525.06	583.40	58.35	10	1
52	24	24	194.44	206.86	12.42	6	0
54	25	25	163.64	172.25	8.62	5	0
55	22	28	3383.53	3599.50	215.97	6	0
57	25	29	256.31	275.61	19.30	7	0
59	28	31	3867.13	4296.81	429.69	10	0
53	28	32	1998.02	2148.41	150.39	7	1
55	18	33	36.54	40.61	4.07	10	0
56	29	34	2525.98	2716.10	190.13	7	1
56	29	37	6111.23	6790.25	679.03	10	1
59	10	38	2739.32	2945.50	206.19	7	0
54	47	39	7670.78	8074.50	403.73	5	1
58	11	42	2197.81	2442.00	244.21	10	0
54	36	43	5692.09	6187.06	494.97	8	1
52	21	45	7817.41	8228.86	411.45	5	0
51	36	48	5753.96	6187.06	433.10	7	1
51	17	51	137.12	152.35	15.24	10	0
57	11	53	579.98	610.50	30.53	5	0
58	44	54	989.19	1075.21	86.02	8	0
56	47	56	5363.78	5767.50	403.73	7	0
59	33	57	926.25	975.00	48.75	5	1
52	24	58	194.44	206.86	12.42	6	1
51	48	59	426.36	448.80	22.44	5	0
52	21	60	4467.09	4702.20	235.12	5	1
56	28	61	4941.33	5371.00	429.69	8	0
51	43	62	591.76	636.31	44.55	7	1
52	17	63	959.81	1066.46	106.65	10	0
58	20	65	4442.41	4936.00	493.61	10	0
54	42	67	657.06	699.00	41.94	6	0
54	23	68	3109.29	3307.75	198.47	6	0
58	19	70	90.90	98.80	7.91	8	0
52	33	71	1813.50	1950.00	136.50	7	1
53	13	72	1159.89	1274.60	114.72	9	0
54	17	73	411.35	457.05	45.71	10	1
52	12	74	205.39	218.50	13.11	6	1
54	43	75	245.44	272.71	27.28	10	0
52	34	78	585.95	636.91	50.96	8	0
59	13	79	898.60	955.95	57.36	6	0
55	22	80	3887.46	4319.40	431.94	10	1
59	49	82	1997.51	2147.85	150.35	7	0
59	20	83	2807.35	3085.00	277.65	9	1
53	43	84	418.15	454.50	36.36	8	1
56	34	85	1579.52	1698.41	118.89	7	0
53	37	86	4079.84	4340.25	260.42	6	1
52	34	88	1995.62	2123.00	127.38	6	0
59	46	90	364.23	400.25	36.03	9	0
58	33	91	717.61	780.00	62.40	8	0
58	46	92	1861.17	2001.25	140.09	7	0
59	18	93	56.03	60.91	4.88	8	0
56	34	94	390.64	424.61	33.97	8	1
51	24	95	372.34	413.71	41.38	10	0
55	44	96	829.44	921.60	92.16	10	0
52	43	97	752.66	818.11	65.45	8	1
54	28	98	2551.23	2685.50	134.28	5	0
52	31	100	15029.11	16515.50	1486.40	9	0
59	30	101	407.17	452.41	45.25	10	0
54	16	102	1381.91	1535.46	153.55	10	0
55	49	103	214.79	238.66	23.87	10	1
56	26	108	2582.57	2776.95	194.39	7	1
59	30	109	560.98	603.21	42.23	7	1
51	10	110	541.98	589.11	47.13	8	0
59	32	111	812.18	892.50	80.33	9	0
59	44	112	144.39	153.60	9.22	6	1
51	13	114	2609.75	2867.85	258.11	9	0
58	20	115	4689.20	4936.00	246.81	5	0
55	42	116	1300.14	1398.00	97.87	7	0
52	11	117	1159.96	1221.00	61.06	5	0
58	27	119	2494.04	2625.30	131.27	5	0
59	37	120	5772.54	6076.35	303.82	5	1
52	26	121	1666.18	1851.30	185.13	10	1
51	17	122	1109.11	1218.80	109.70	9	0
58	29	125	2498.82	2716.10	217.29	8	1
52	32	126	401.63	446.25	44.63	10	1
53	40	127	5296.45	5757.00	460.57	8	0
54	46	128	2185.37	2401.50	216.14	9	1
55	16	129	789.66	877.40	87.75	10	0
58	10	130	559.65	589.11	29.46	5	0
54	28	131	2497.52	2685.50	187.99	7	0
57	49	132	1073.93	1193.25	119.33	10	0
53	21	133	5348.76	5877.75	529.00	9	0
53	11	134	2869.35	3052.50	183.16	6	0
55	45	135	2293.21	2520.00	226.80	9	1
54	25	136	226.69	241.16	14.47	6	0
56	23	137	4306.70	4630.85	324.16	7	0
58	12	138	119.31	131.11	11.80	9	1
58	25	139	155.03	172.25	17.23	10	0
58	23	140	608.63	661.55	52.93	8	1
58	43	141	345.43	363.61	18.19	5	0
51	13	142	1720.71	1911.90	191.19	10	0
51	36	143	1856.12	2062.36	206.24	10	0
52	31	145	9116.56	9909.30	792.75	8	1
51	12	146	361.84	393.31	31.47	8	0
58	15	147	871.01	946.75	75.74	8	1
52	33	148	549.90	585.00	35.11	6	1
52	10	149	2238.58	2356.41	117.83	5	1
59	12	150	357.91	393.31	35.40	9	1
52	13	151	1210.87	1274.60	63.73	5	0
53	35	154	486.58	523.21	36.63	7	1
58	42	155	1162.09	1223.25	61.17	5	0
51	13	156	1159.89	1274.60	114.72	9	0
52	46	157	1104.70	1200.75	96.07	8	1
52	29	160	11611.33	12222.45	611.13	5	0
51	44	161	282.63	307.20	24.58	8	0
58	35	162	162.20	174.41	12.21	7	1
57	37	163	824.65	868.05	43.41	5	0
59	30	164	280.49	301.61	21.12	7	0
58	47	165	9343.36	10381.50	1038.16	10	0
57	21	168	6489.04	7053.30	564.27	8	0
57	22	169	5831.19	6479.10	647.91	10	0
58	33	170	179.41	195.00	15.60	8	1
55	28	171	1466.29	1611.31	145.02	9	1
58	10	172	273.94	294.56	20.62	7	1
51	36	173	618.71	687.46	68.75	10	0
55	12	174	39.77	43.71	3.94	9	0
53	42	176	1258.21	1398.00	139.81	10	1
58	35	177	1123.14	1220.80	97.67	8	0
58	36	178	4379.06	4812.16	433.10	9	1
55	27	179	1627.69	1750.20	122.52	7	0
55	41	180	580.74	617.80	37.07	6	0
56	26	182	7747.70	8330.86	583.16	7	0
56	42	184	1300.14	1398.00	97.87	7	1
55	32	186	1413.13	1487.50	74.38	5	0
58	19	187	68.92	74.10	5.19	7	0
53	41	189	2224.08	2471.20	247.13	10	0
53	47	191	2076.31	2307.00	230.71	10	1
59	32	192	699.13	743.75	44.63	6	0
58	19	195	234.65	247.00	12.36	5	0
57	12	196	120.62	131.11	10.49	8	0
56	12	197	365.77	393.31	27.54	7	0
55	25	198	161.92	172.25	10.34	6	0
53	31	199	12287.54	13212.40	924.87	7	1
57	30	200	407.17	452.41	45.25	10	0
55	38	201	970.55	1043.60	73.06	7	1
51	32	203	553.35	595.00	41.66	7	1
56	30	205	1221.49	1357.21	135.72	10	0
54	49	206	859.14	954.61	95.47	10	1
57	22	207	4736.95	5039.31	302.36	6	0
53	46	208	1488.93	1601.00	112.08	7	1
54	42	209	821.33	873.75	52.43	6	0
59	44	210	714.25	768.00	53.77	7	1
54	10	211	1384.39	1472.75	88.37	6	1
58	36	214	618.71	687.46	68.75	10	1
53	44	215	1382.41	1536.00	153.61	10	0
54	31	219	7844.87	8257.75	412.89	5	0
53	37	220	4791.64	5208.30	416.67	8	0
53	14	221	2987.89	3178.60	190.72	6	0
51	23	222	5656.26	5953.95	297.70	5	0
53	10	223	2709.87	2945.50	235.65	8	0
57	12	224	41.08	43.71	2.63	6	0
56	46	225	2185.37	2401.50	216.14	9	0
52	40	227	12046.53	12953.25	906.73	7	0
52	26	228	7581.08	8330.86	749.78	9	1
56	26	229	8423.42	9256.50	833.09	9	1
56	19	230	22.24	24.70	2.48	10	0
57	23	231	1806.04	1984.65	178.62	9	1
53	14	233	2924.32	3178.60	254.29	8	1
57	41	234	1668.06	1853.40	185.35	10	0
52	30	235	277.48	301.61	24.13	8	1
53	19	236	140.79	148.20	7.42	5	1
53	46	237	2633.65	2801.75	168.11	6	0
58	47	238	5363.78	5767.50	403.73	7	1
54	20	239	2295.24	2468.00	172.77	7	1
53	18	240	76.33	81.21	4.88	6	1
57	15	243	852.08	946.75	94.68	10	1
55	37	244	7812.45	8680.50	868.06	10	0
51	36	245	2502.32	2749.81	247.49	9	0
57	46	246	2233.40	2401.50	168.11	7	0
51	12	247	397.68	437.00	39.33	9	1
52	14	249	723.14	794.65	71.52	9	0
52	41	250	562.20	617.80	55.61	9	1
58	12	1	332.13	349.61	17.49	5	0
59	23	2	6218.57	6615.50	396.94	6	1
52	44	3	857.09	921.60	64.52	7	1
51	31	5	13526.20	14863.95	1337.76	9	1
56	16	6	416.77	438.70	21.94	5	0
53	48	7	69.57	74.80	5.24	7	0
51	48	8	710.61	748.00	37.40	5	0
55	26	9	842.35	925.65	83.31	9	1
54	20	10	2245.89	2468.00	222.13	9	0
58	27	11	1575.18	1750.20	175.02	10	0
57	47	15	4152.61	4614.00	461.41	10	0
57	17	16	685.58	761.75	76.18	10	1
53	12	18	119.31	131.11	11.80	9	0
51	29	19	9886.61	10864.40	977.80	9	1
56	47	21	7347.80	8074.50	726.71	9	0
56	32	23	706.57	743.75	37.19	5	1
58	37	24	7187.46	7812.45	625.00	8	0
55	16	25	1397.26	1535.46	138.20	9	0
53	50	26	4999.50	5555.00	555.50	10	0
51	49	28	1536.91	1670.55	133.65	8	1
53	37	30	5651.01	6076.35	425.35	7	0
53	47	32	5363.78	5767.50	403.73	7	1
53	47	33	1095.83	1153.50	57.68	5	1
52	38	34	2374.20	2609.00	234.82	9	0
53	33	35	544.05	585.00	40.96	7	0
53	41	38	3892.14	4324.60	432.46	10	1
58	45	39	1197.00	1260.00	63.00	5	1
57	47	40	9758.61	10381.50	622.89	6	1
52	19	42	88.93	98.80	9.89	10	0
53	12	43	281.43	305.91	24.48	8	0
57	13	44	869.92	955.95	86.04	9	1
59	36	45	1938.61	2062.36	123.75	6	0
54	50	46	1055.46	1111.00	55.56	5	0
55	21	47	6559.57	7053.30	493.74	7	1
57	24	48	655.03	689.50	34.48	5	0
51	50	49	8265.85	8888.00	622.17	7	0
54	44	50	1021.44	1075.21	53.77	5	1
57	50	51	2110.91	2222.00	111.11	5	0
56	39	52	9011.96	9795.60	783.65	8	1
56	46	54	2881.81	3202.00	320.21	10	0
55	50	55	10110.11	11110.00	999.90	9	0
52	16	56	1614.42	1754.80	140.39	8	1
55	38	58	1643.67	1826.30	182.63	10	0
56	15	59	1156.39	1217.25	60.87	5	1
56	12	61	393.31	437.00	43.71	10	1
51	39	62	14856.66	16326.00	1469.34	9	0
52	28	63	1976.53	2148.41	171.88	8	0
51	43	66	259.07	272.71	13.64	5	0
55	50	68	9099.10	9999.00	899.91	9	1
51	20	69	4442.41	4936.00	493.61	10	1
53	24	70	376.47	413.71	37.24	9	1
51	27	71	2741.99	2917.00	175.02	6	1
51	27	72	2654.48	2917.00	262.53	9	1
53	46	73	3041.90	3202.00	160.11	5	0
57	49	74	897.33	954.61	57.28	6	0
52	11	75	2777.78	3052.50	274.73	9	0
55	10	76	1325.48	1472.75	147.28	10	0
57	20	77	4997.70	5553.00	555.31	10	1
53	16	78	199.61	219.35	19.75	9	0
54	13	79	1497.66	1593.25	95.60	6	0
52	10	80	1855.67	2061.85	206.19	10	0
58	41	81	562.20	617.80	55.61	9	1
53	33	82	725.40	780.00	54.61	7	0
57	32	84	1258.43	1338.75	80.33	6	0
59	31	85	1502.92	1651.55	148.64	9	1
51	47	86	2076.31	2307.00	230.71	10	0
57	18	87	115.72	121.81	6.10	5	1
59	45	88	2608.21	2835.00	226.81	8	1
52	30	89	1289.34	1357.21	67.86	5	0
59	48	90	208.70	224.40	15.71	7	1
56	49	91	1756.47	1909.21	152.74	8	0
56	30	92	274.46	301.61	27.15	9	1
59	35	93	994.09	1046.41	52.33	5	1
58	38	94	2374.20	2609.00	234.82	9	1
59	18	95	94.40	101.50	7.11	7	0
51	31	96	4459.19	4954.65	495.47	10	0
54	13	97	2119.03	2230.55	111.53	5	1
57	28	98	1009.75	1074.21	64.46	6	0
52	33	99	181.35	195.00	13.66	7	1
55	11	100	2869.35	3052.50	183.16	6	0
51	36	101	632.46	687.46	55.00	8	1
53	41	103	4108.37	4324.60	216.23	5	0
57	21	105	3350.32	3526.65	176.34	5	1
56	22	106	6623.08	7199.00	575.92	8	1
54	37	109	2421.86	2604.15	182.30	7	1
53	40	110	5469.15	5757.00	287.86	5	1
58	25	111	126.78	137.81	11.03	8	0
56	49	112	868.69	954.61	85.92	9	1
54	24	115	188.24	206.86	18.62	9	0
52	11	116	579.98	610.50	30.53	5	1
57	48	118	272.28	299.20	26.93	9	0
59	25	119	310.06	344.50	34.46	10	0
53	37	120	7265.58	7812.45	546.88	7	1
57	44	121	691.21	768.00	76.81	10	1
56	40	122	10938.30	11514.00	575.71	5	1
53	21	123	10697.51	11755.50	1058.00	9	1
51	41	124	3935.39	4324.60	389.22	9	1
52	43	126	760.84	818.11	57.27	7	0
59	21	128	6418.51	7053.30	634.80	9	1
59	50	130	5055.06	5555.00	499.95	9	0
53	38	132	960.12	1043.60	83.49	8	1
54	41	134	1136.76	1235.60	98.85	8	0
58	26	135	2582.57	2776.95	194.39	7	0
55	32	136	1383.38	1487.50	104.13	7	0
59	50	138	8088.08	8888.00	799.92	9	0
57	14	139	6722.74	7151.85	429.12	6	1
54	38	140	2207.22	2348.10	140.89	6	0
52	18	141	166.26	182.71	16.45	9	1
54	17	142	1121.30	1218.80	97.51	8	1
51	47	144	7590.03	8074.50	484.47	6	1
57	43	145	427.23	454.50	27.27	6	0
54	21	147	9521.96	10579.95	1058.00	10	0
52	47	148	5306.11	5767.50	461.41	8	1
52	11	151	579.98	610.50	30.53	5	0
52	12	152	78.67	87.41	8.75	10	1
54	30	153	950.05	1055.61	105.57	10	1
56	42	154	162.52	174.75	12.24	7	0
58	48	157	403.92	448.80	44.88	10	1
58	11	158	2869.35	3052.50	183.16	6	0
57	37	159	5529.48	6076.35	546.88	9	1
51	31	160	3137.95	3303.10	165.16	5	1
57	16	161	2018.02	2193.50	175.48	8	1
54	15	162	254.27	270.50	16.24	6	0
54	44	163	1382.41	1536.00	153.61	10	0
55	25	164	196.37	206.71	10.34	5	1
56	48	166	139.13	149.60	10.48	7	1
56	35	168	941.77	1046.41	104.65	10	1
56	16	170	1996.09	2193.50	197.42	9	1
52	33	171	1774.50	1950.00	175.50	9	0
59	31	172	13823.48	14863.95	1040.48	7	1
54	28	173	3534.12	3759.71	225.59	6	0
53	28	175	3496.53	3759.71	263.18	7	0
54	38	176	495.71	521.80	26.09	5	0
58	31	177	10751.60	11560.86	809.26	7	1
52	12	182	284.49	305.91	21.42	7	1
54	47	183	2168.58	2307.00	138.42	6	0
54	39	184	12407.76	13060.80	653.04	5	0
58	41	187	1136.76	1235.60	98.85	8	1
58	22	189	4535.37	5039.31	503.94	10	0
59	50	190	9099.10	9999.00	899.91	9	1
57	48	192	351.57	374.00	22.44	6	1
52	40	193	8031.02	8635.50	604.49	7	0
58	38	194	2230.70	2348.10	117.41	5	0
53	43	195	744.48	818.11	73.63	9	0
56	15	196	746.59	811.50	64.93	8	0
59	38	198	2348.10	2609.00	260.91	10	0
52	50	199	7232.61	7777.00	544.40	7	1
59	41	200	5004.19	5560.20	556.02	10	0
51	13	201	2695.78	2867.85	172.08	6	0
57	27	202	2216.92	2333.60	116.69	5	1
57	43	204	661.76	727.21	65.45	9	1
53	44	205	691.21	768.00	76.81	10	1
51	34	206	1562.53	1698.41	135.88	8	1
54	26	207	6155.58	6479.56	323.98	5	0
52	37	208	3949.63	4340.25	390.63	9	0
55	44	209	144.39	153.60	9.22	6	1
58	21	210	3279.79	3526.65	246.87	7	1
52	17	213	723.67	761.75	38.09	5	1
54	41	214	562.20	617.80	55.61	9	1
52	15	215	615.39	676.25	60.87	9	0
54	19	216	68.18	74.10	5.93	8	1
55	23	217	4306.70	4630.85	324.16	7	0
55	46	218	2945.85	3202.00	256.17	8	0
51	34	219	1562.53	1698.41	135.88	8	1
54	49	220	1317.35	1431.91	114.56	8	0
59	37	222	1579.86	1736.10	156.25	9	0
53	25	223	32.39	34.46	2.07	6	0
52	26	224	7664.39	8330.86	666.47	8	1
56	15	227	1119.88	1217.25	97.38	8	0
55	40	230	4101.87	4317.75	215.89	5	1
52	13	231	1816.31	1911.90	95.60	5	0
57	19	232	116.09	123.50	7.42	6	1
59	22	242	1986.93	2159.70	172.78	8	0
59	37	244	815.97	868.05	52.09	6	0
54	12	245	159.07	174.81	15.74	9	0
55	19	246	46.93	49.40	2.48	5	0
51	50	248	3999.60	4444.00	444.41	10	0
53	39	249	14856.66	16326.00	1469.34	9	0
58	43	250	245.44	272.71	27.28	10	1
55	42	3	1314.12	1398.00	83.88	6	0
52	50	5	2044.25	2222.00	177.76	8	0
55	49	6	2018.98	2147.85	128.88	6	0
55	19	9	112.39	123.50	11.12	9	1
58	11	11	2319.91	2442.00	122.11	5	0
53	16	12	1579.32	1754.80	175.49	10	0
59	42	13	996.08	1048.50	52.43	5	0
59	32	14	669.38	743.75	74.38	10	0
59	28	18	4833.91	5371.00	537.11	10	0
52	15	20	254.27	270.50	16.24	6	0
56	40	21	13385.03	14392.50	1007.48	7	1
52	47	22	10958.25	11535.00	576.75	5	1
57	36	23	1237.42	1374.91	137.50	10	1
53	21	24	5583.87	5877.75	293.89	5	1
54	37	25	4739.56	5208.30	468.75	9	1
57	33	26	1597.05	1755.00	157.95	9	1
54	10	27	2768.77	2945.50	176.73	6	1
57	37	28	7265.58	7812.45	546.88	7	1
52	39	29	4457.00	4897.80	440.81	9	0
51	48	30	70.32	74.80	4.49	6	1
58	10	33	559.65	589.11	29.46	5	1
54	33	34	733.20	780.00	46.80	6	0
56	48	35	68.07	74.80	6.74	9	1
52	25	37	310.06	344.50	34.46	10	0
59	13	39	573.57	637.30	63.73	10	1
55	47	40	1038.16	1153.50	115.36	10	0
52	23	41	4763.16	5292.40	529.25	10	0
55	24	42	64.13	68.96	4.83	7	1
57	16	43	1030.95	1096.75	65.81	6	0
51	48	44	426.36	448.80	22.44	5	1
52	30	47	1121.96	1206.41	84.45	7	1
51	40	48	2705.79	2878.50	172.71	6	1
52	27	49	1575.18	1750.20	175.02	10	0
52	41	53	2347.64	2471.20	123.57	5	1
52	30	54	1085.77	1206.41	120.65	10	0
54	15	56	1257.83	1352.50	94.68	7	0
57	21	57	5466.31	5877.75	411.45	7	1
58	33	58	1667.25	1755.00	87.75	5	1
52	28	59	2932.57	3222.61	290.04	9	1
54	13	60	879.48	955.95	76.48	8	1
57	33	61	1649.70	1755.00	105.30	6	0
57	47	63	7267.06	8074.50	807.46	10	1
57	10	65	2465.39	2650.96	185.57	7	1
52	47	66	2076.31	2307.00	230.71	10	0
58	34	67	399.13	424.61	25.48	6	1
57	23	68	3612.07	3969.30	357.24	9	1
56	50	69	8354.72	8888.00	533.28	6	0
59	33	70	733.20	780.00	46.80	6	0
56	49	72	878.24	954.61	76.37	8	1
54	23	74	1865.58	1984.65	119.08	6	1
52	30	75	283.51	301.61	18.10	6	1
51	24	76	128.25	137.91	9.66	7	0
51	25	77	161.92	172.25	10.34	6	0
56	19	78	46.93	49.40	2.48	5	1
52	26	79	4396.84	4628.25	231.42	5	0
51	40	83	1338.51	1439.25	100.75	7	1
54	12	84	314.65	349.61	34.97	10	0
51	26	85	5165.13	5553.90	388.78	7	0
52	11	86	5054.95	5494.50	439.57	8	1
56	34	91	1528.57	1698.41	169.85	10	0
58	15	92	1217.25	1352.50	135.25	10	1
51	17	94	578.93	609.40	30.47	5	1
56	29	95	8650.78	9506.36	855.58	9	0
51	14	96	2956.10	3178.60	222.51	7	0
55	32	97	1204.88	1338.75	133.88	10	0
52	31	98	3104.92	3303.10	198.19	6	0
58	38	99	960.12	1043.60	83.49	8	1
51	50	103	8354.72	8888.00	533.28	6	0
59	48	104	68.07	74.80	6.74	9	0
56	21	108	5525.09	5877.75	352.67	6	1
51	30	109	274.46	301.61	27.15	9	0
52	26	110	870.12	925.65	55.54	6	1
51	27	112	2415.28	2625.30	210.03	8	1
54	34	113	1184.64	1273.81	89.17	7	0
59	47	114	2145.51	2307.00	161.50	7	1
52	14	115	7390.25	7946.50	556.26	7	0
57	27	116	805.10	875.10	70.01	8	0
53	16	117	1397.26	1535.46	138.20	9	0
55	11	121	567.77	610.50	42.74	7	1
51	41	122	4108.37	4324.60	216.23	5	0
54	12	123	246.47	262.21	15.74	6	0
56	23	125	4974.86	5292.40	317.55	6	0
59	41	126	3978.64	4324.60	345.97	8	1
58	14	127	4291.11	4767.90	476.79	10	1
51	27	128	1858.13	2041.90	183.78	9	1
54	45	129	2693.25	2835.00	141.75	5	0
58	45	130	850.50	945.00	94.50	10	0
54	43	131	409.06	454.50	45.46	10	1
55	10	132	1590.58	1767.31	176.74	10	0
57	44	133	565.25	614.40	49.16	8	0
54	49	134	1775.56	1909.21	133.65	7	0
55	46	136	3422.14	3602.25	180.12	5	1
54	45	137	2006.56	2205.00	198.45	9	1
52	12	139	284.49	305.91	21.42	7	1
58	13	141	599.07	637.30	38.24	6	1
54	22	142	6479.11	7199.00	719.91	10	0
53	47	143	7267.06	8074.50	807.46	10	0
54	11	145	5555.56	6105.00	549.45	9	0
53	21	146	9521.96	10579.95	1058.00	10	1
59	39	148	4457.00	4897.80	440.81	9	0
52	11	149	5219.78	5494.50	274.73	5	0
54	46	151	376.24	400.25	24.02	6	1
52	49	152	2195.58	2386.50	190.93	8	1
53	26	155	5276.21	5553.90	277.70	5	1
55	35	156	1412.65	1569.61	156.97	10	0
58	39	158	15183.18	16326.00	1142.83	7	0
58	24	160	131.01	137.91	6.90	5	1
51	36	161	3835.98	4124.71	288.73	7	0
58	14	162	5912.20	6357.20	445.01	7	1
54	39	164	10742.51	11428.20	685.70	6	0
54	12	166	121.93	131.11	9.18	7	1
57	35	169	1269.64	1395.21	125.57	9	0
55	37	170	789.93	868.05	78.13	9	1
51	30	171	138.74	150.81	12.07	8	1
53	12	173	39.77	43.71	3.94	9	1
53	29	174	5106.27	5432.20	325.94	6	0
59	35	175	784.81	872.00	87.21	10	0
52	39	176	3101.94	3265.20	163.26	5	0
55	26	177	5961.19	6479.56	518.37	8	0
58	50	179	3099.69	3333.00	233.32	7	1
55	45	180	859.96	945.00	85.05	9	1
59	37	182	5772.54	6076.35	303.82	5	0
56	44	187	279.56	307.20	27.65	9	0
51	26	189	1740.23	1851.30	111.08	6	0
54	17	191	685.58	761.75	76.18	10	1
58	31	192	7844.87	8257.75	412.89	5	0
59	26	195	7664.39	8330.86	666.47	8	0
51	22	196	3311.54	3599.50	287.96	8	1
57	15	197	973.81	1082.00	108.21	10	0
52	18	198	19.29	20.31	1.02	5	0
55	22	201	676.71	719.90	43.20	6	0
54	27	202	530.90	583.40	52.51	9	1
54	42	203	629.11	699.00	69.91	10	0
53	10	204	279.83	294.56	14.73	5	1
52	19	205	136.35	148.20	11.86	8	0
59	32	206	141.32	148.75	7.44	5	0
51	15	207	871.01	946.75	75.74	8	0
56	15	210	121.73	135.25	13.53	10	0
51	49	211	1109.73	1193.25	83.53	7	0
59	47	213	1084.29	1153.50	69.21	6	0
57	45	214	1719.91	1890.00	170.10	9	0
58	39	216	4603.94	4897.80	293.87	6	0
53	38	217	474.84	521.80	46.97	9	0
57	15	218	1217.25	1352.50	135.25	10	0
52	18	219	152.66	162.41	9.75	6	1
59	34	220	781.27	849.21	67.94	8	0
59	30	224	548.92	603.21	54.29	9	0
55	19	225	140.79	148.20	7.42	5	0
57	29	226	1249.41	1358.05	108.65	8	1
57	49	227	868.69	954.61	85.92	9	1
55	31	228	3005.83	3303.10	297.28	9	1
52	11	229	2319.91	2442.00	122.11	5	0
58	17	230	1096.93	1218.80	121.88	10	0
54	10	231	536.09	589.11	53.02	9	0
59	10	232	1590.58	1767.31	176.74	10	1
56	11	233	1135.53	1221.00	85.48	7	0
54	37	235	6388.85	6944.40	555.56	8	0
51	23	236	1885.42	1984.65	99.24	5	0
56	39	238	8816.04	9795.60	979.56	10	0
52	24	239	512.99	551.61	38.62	7	0
57	13	240	2724.46	2867.85	143.40	5	1
52	34	243	592.32	636.91	44.59	7	0
59	18	244	75.52	81.21	5.69	7	0
57	50	245	1055.46	1111.00	55.56	5	1
53	27	247	2467.79	2625.30	157.52	6	1
51	46	248	2161.35	2401.50	240.16	10	1
51	44	249	571.40	614.40	43.01	7	0
57	46	1	752.47	800.50	48.04	6	0
52	31	2	9017.47	9909.30	891.84	9	1
57	39	3	1550.97	1632.60	81.63	5	1
53	50	4	2110.91	2222.00	111.11	5	0
56	19	6	224.78	247.00	22.24	9	0
57	50	7	9099.10	9999.00	899.91	9	1
53	38	8	242.64	260.90	18.27	7	0
57	32	9	270.73	297.50	26.78	9	1
57	30	10	271.45	301.61	30.17	10	1
55	27	11	1371.00	1458.50	87.51	6	1
53	15	13	128.49	135.25	6.77	5	1
56	18	14	56.03	60.91	4.88	8	0
53	18	15	18.88	20.31	1.43	7	0
57	40	16	4015.51	4317.75	302.25	7	0
54	36	17	3196.65	3437.25	240.61	7	0
54	37	18	5651.01	6076.35	425.35	7	1
51	40	19	10938.30	11514.00	575.71	5	1
59	22	20	3383.53	3599.50	215.97	6	1
53	19	21	204.52	222.30	17.79	8	0
59	43	22	598.13	636.31	38.18	6	1
55	15	23	1006.26	1082.00	75.75	7	0
54	33	24	185.25	195.00	9.75	5	0
54	25	26	126.78	137.81	11.03	8	0
53	34	28	1953.17	2123.00	169.85	8	1
53	22	29	676.71	719.90	43.20	6	0
51	42	30	636.10	699.00	62.91	9	0
56	41	31	3484.40	3706.80	222.41	6	0
52	42	32	157.28	174.75	17.48	10	0
53	19	34	136.35	148.20	11.86	8	0
53	23	35	3731.15	3969.30	238.16	6	0
53	33	36	1482.00	1560.00	78.00	5	0
51	11	38	3406.59	3663.00	256.42	7	1
57	48	39	568.48	598.40	29.93	5	1
51	39	40	11885.33	13060.80	1175.48	9	0
59	22	41	3887.46	4319.40	431.94	10	0
51	43	42	413.60	454.50	40.91	9	0
56	39	43	3003.99	3265.20	261.22	8	0
55	27	44	1837.71	2041.90	204.19	10	0
57	21	45	5525.09	5877.75	352.67	6	1
59	14	48	5284.43	5562.56	278.13	5	1
56	48	49	492.19	523.61	31.42	6	0
59	12	50	287.55	305.91	18.36	6	0
53	41	51	5621.99	6178.00	556.02	9	0
54	21	52	3279.79	3526.65	246.87	7	0
52	30	54	425.26	452.41	27.15	6	0
57	44	55	1142.79	1228.80	86.02	7	1
54	16	58	1197.66	1316.10	118.45	9	1
52	30	59	1134.02	1206.41	72.39	6	0
53	37	60	3949.63	4340.25	390.63	9	0
55	13	61	579.95	637.30	57.36	9	1
52	10	62	2144.33	2356.41	212.08	9	0
53	25	63	186.04	206.71	20.68	10	0
55	31	64	9413.84	9909.30	495.47	5	0
55	29	65	7333.47	8148.30	814.83	10	0
59	46	67	2161.35	2401.50	240.16	10	1
55	32	68	279.65	297.50	17.85	6	1
58	17	69	286.42	304.70	18.29	6	0
56	12	71	40.21	43.71	3.50	8	1
56	25	72	217.04	241.16	24.12	10	1
51	12	73	402.05	437.00	34.97	8	0
59	37	74	2447.91	2604.15	156.25	6	1
56	43	75	676.30	727.21	50.91	7	0
53	16	76	1996.09	2193.50	197.42	9	0
53	25	77	160.20	172.25	12.06	7	1
56	47	79	9758.61	10381.50	622.89	6	0
55	28	80	2964.80	3222.61	257.81	8	0
56	47	81	8397.48	9228.00	830.52	9	0
53	42	82	1462.66	1572.75	110.10	7	0
58	12	84	314.65	349.61	34.97	10	1
55	36	85	646.21	687.46	41.25	6	1
56	47	86	6436.53	6921.00	484.48	7	1
57	37	87	4079.84	4340.25	260.42	6	0
59	16	88	1184.50	1316.10	131.61	10	1
56	33	90	526.50	585.00	58.50	10	0
56	41	91	568.38	617.80	49.43	8	0
55	32	92	282.63	297.50	14.88	5	0
59	35	94	1569.61	1744.00	174.41	10	1
51	44	95	978.44	1075.21	96.77	9	0
54	14	97	739.03	794.65	55.63	7	0
55	11	98	4444.45	4884.00	439.57	9	1
51	46	99	2281.43	2401.50	120.08	5	0
58	29	100	2498.82	2716.10	217.29	8	0
54	49	102	897.33	954.61	57.28	6	1
56	50	103	1022.13	1111.00	88.88	8	1
59	50	104	8354.72	8888.00	533.28	6	0
59	45	107	2693.25	2835.00	141.75	5	1
57	35	108	481.35	523.21	41.86	8	1
52	18	110	182.71	203.00	20.31	10	1
57	27	111	536.73	583.40	46.68	8	0
52	24	112	384.75	413.71	28.96	7	0
51	38	113	1187.10	1304.50	117.41	9	0
53	45	115	2293.21	2520.00	226.80	9	0
52	40	122	9470.27	10074.75	604.49	6	0
59	19	123	22.24	24.70	2.48	10	1
54	42	124	664.05	699.00	34.96	5	0
51	21	125	9627.76	10579.95	952.20	9	1
51	39	126	7591.59	8163.00	571.42	7	0
54	49	127	221.95	238.66	16.71	7	1
55	18	128	190.82	203.00	12.18	6	1
53	24	129	253.74	275.81	22.07	8	1
56	30	130	960.60	1055.61	95.01	9	0
53	30	131	1402.44	1508.00	105.57	7	1
51	48	135	142.12	149.60	7.49	5	0
51	37	136	4036.44	4340.25	303.82	7	1
58	48	138	556.52	598.40	41.89	7	1
52	29	140	6382.84	6790.25	407.42	6	0
53	47	141	10727.55	11535.00	807.46	7	1
56	50	142	7310.38	7777.00	466.63	6	1
56	17	144	868.40	914.10	45.71	5	0
51	42	145	650.07	699.00	48.94	7	0
57	19	147	227.25	247.00	19.77	8	0
59	42	148	1590.23	1747.50	157.28	9	0
59	11	149	5799.75	6105.00	305.25	5	1
51	18	151	37.76	40.61	2.85	7	0
57	48	153	544.55	598.40	53.86	9	1
57	13	154	605.44	637.30	31.87	5	1
54	45	157	2636.55	2835.00	198.46	7	1
52	47	158	8582.04	9228.00	645.97	7	0
55	33	159	733.20	780.00	46.80	6	1
51	25	160	196.37	206.71	10.34	5	0
53	18	162	113.28	121.81	8.53	7	0
59	11	164	4395.61	4884.00	488.41	10	1
59	29	165	5051.95	5432.20	380.26	7	0
56	18	166	36.95	40.61	3.66	9	1
56	14	167	1478.05	1589.30	111.26	7	1
51	30	169	859.57	904.81	45.25	5	0
53	13	170	573.57	637.30	63.73	10	1
59	19	172	133.38	148.20	14.83	10	0
52	37	174	6527.74	6944.40	416.67	6	0
56	25	177	130.91	137.81	6.90	5	1
58	41	179	568.38	617.80	49.43	8	0
55	24	180	129.63	137.91	8.28	6	0
56	35	183	1325.45	1395.21	69.77	5	0
51	39	184	6203.88	6530.40	326.52	5	0
52	43	185	248.16	272.71	24.55	9	1
53	23	186	2460.97	2646.20	185.24	7	0
54	32	187	1368.50	1487.50	119.00	8	0
56	35	189	327.88	348.81	20.93	6	0
54	11	190	1648.36	1831.50	183.16	10	1
52	25	191	124.03	137.81	13.79	10	0
53	16	192	197.42	219.35	21.94	10	1
51	36	193	6324.54	6874.50	549.97	8	1
59	23	195	1217.26	1323.10	105.85	8	0
53	17	196	143.21	152.35	9.15	6	0
59	18	197	190.82	203.00	12.18	6	0
58	26	199	7581.08	8330.86	749.78	9	0
57	13	200	592.69	637.30	44.62	7	1
53	14	201	746.98	794.65	47.68	6	1
57	21	202	3315.06	3526.65	211.60	6	0
51	48	203	688.17	748.00	59.85	8	1
53	22	205	2030.12	2159.70	129.59	6	0
51	18	206	18.68	20.31	1.63	8	1
54	36	207	3918.47	4124.71	206.24	5	1
59	13	208	2029.81	2230.55	200.75	9	0
57	47	209	2168.58	2307.00	138.42	6	1
54	38	210	2136.78	2348.10	211.33	9	1
53	20	211	3887.10	4319.00	431.91	10	1
57	32	212	838.95	892.50	53.55	6	0
51	46	213	3350.10	3602.25	252.16	7	0
59	43	214	579.04	636.31	57.27	9	0
52	20	215	3368.83	3702.00	333.19	9	1
59	33	216	1794.00	1950.00	156.00	8	1
56	49	217	219.56	238.66	19.10	8	1
52	31	218	13526.20	14863.95	1337.76	9	0
59	23	221	3572.37	3969.30	396.94	10	1
56	47	223	10958.25	11535.00	576.75	5	0
53	45	226	289.81	315.00	25.20	8	0
58	46	227	2977.86	3202.00	224.15	7	0
54	25	228	95.09	103.36	8.27	8	1
51	36	231	5815.83	6187.06	371.23	6	0
53	46	232	1488.93	1601.00	112.08	7	0
58	16	233	1223.98	1316.10	92.13	7	0
56	21	234	7817.41	8228.86	411.45	5	1
53	16	236	206.19	219.35	13.17	6	0
57	19	237	229.71	247.00	17.30	7	1
56	23	238	6284.73	6615.50	330.78	5	0
52	15	241	243.46	270.50	27.06	10	0
52	33	242	1111.50	1170.00	58.50	5	1
57	33	243	179.41	195.00	15.60	8	1
53	46	244	2945.85	3202.00	256.17	8	0
56	15	246	121.73	135.25	13.53	10	0
51	30	247	1417.52	1508.00	90.48	6	1
56	42	249	1462.66	1572.75	110.10	7	1
54	41	250	568.38	617.80	49.43	8	0
52	2	2	142.76	153.50	10.75	7	0
58	5	3	202.98	223.05	20.08	9	1
59	4	4	3130.30	3295.05	164.76	5	1
54	1	5	5501.26	5852.40	351.15	6	0
51	4	6	6919.61	7688.45	768.85	10	0
52	2	7	291.65	307.00	15.36	5	0
56	4	8	7073.38	7688.45	615.08	8	0
58	5	9	541.27	594.80	53.54	9	0
56	1	11	1331.43	1463.10	131.68	9	0
58	3	12	491.86	546.50	54.66	10	0
54	4	16	6194.70	6590.10	395.41	6	0
55	5	17	553.17	594.80	41.64	7	0
51	5	18	345.73	371.75	26.03	7	1
59	4	20	1032.45	1098.35	65.91	6	0
56	2	21	282.44	307.00	24.57	8	0
55	2	22	285.51	307.00	21.50	7	1
58	4	25	10104.82	10983.50	878.69	8	1
51	3	26	1229.63	1366.25	136.63	10	1
59	1	27	680.35	731.55	51.21	7	1
57	5	28	484.02	520.45	36.44	7	0
52	3	30	491.86	546.50	54.66	10	0
55	3	31	1759.74	1912.75	153.03	8	1
54	1	33	1997.14	2194.65	197.52	9	1
53	1	36	6803.42	7315.50	512.09	7	0
57	1	37	6583.95	7315.50	731.56	10	1
53	2	38	552.61	614.00	61.41	10	0
56	5	39	629.01	669.15	40.15	6	0
51	2	40	1412.21	1535.00	122.80	8	0
55	1	41	6876.57	7315.50	438.94	6	0
55	1	42	5267.16	5852.40	585.25	10	0
56	2	43	706.11	767.50	61.40	8	0
55	1	44	4082.05	4389.30	307.26	7	0
56	5	45	401.49	446.10	44.61	10	0
57	5	46	67.66	74.35	6.70	9	1
52	4	49	2020.97	2196.70	175.74	8	0
55	2	50	838.12	921.00	82.90	9	0
52	4	51	5997.00	6590.10	593.11	9	0
58	5	53	138.30	148.70	10.41	7	1
58	3	54	770.57	819.75	49.19	6	0
57	5	55	202.98	223.05	20.08	9	0
54	5	56	338.30	371.75	33.46	9	0
55	3	57	1778.86	1912.75	133.90	7	0
56	4	58	2020.97	2196.70	175.74	8	0
56	1	59	5325.69	5852.40	526.72	9	0
52	4	60	1032.45	1098.35	65.91	6	0
56	4	61	988.52	1098.35	109.84	10	0
52	3	63	508.25	546.50	38.26	7	0
55	2	64	847.33	921.00	73.69	8	1
58	5	66	69.89	74.35	4.47	6	1
54	5	68	602.24	669.15	66.92	10	0
58	2	71	1412.21	1535.00	122.80	8	0
58	3	72	1817.12	1912.75	95.64	5	0
53	4	74	8259.60	8786.80	527.21	6	0
51	2	75	847.33	921.00	73.69	8	1
53	1	76	3401.71	3657.75	256.05	7	1
55	5	77	282.53	297.40	14.87	5	0
53	3	78	1557.53	1639.50	81.98	5	0
58	1	80	2662.85	2926.20	263.36	9	1
52	5	81	541.27	594.80	53.54	9	0
55	5	83	66.92	74.35	7.44	10	1
56	4	84	10324.49	10983.50	659.01	6	1
58	1	85	2041.03	2194.65	153.63	7	1
55	1	86	4762.40	5120.85	358.46	7	0
57	2	87	583.30	614.00	30.71	5	0
53	5	90	706.33	743.50	37.18	5	0
56	5	92	410.42	446.10	35.69	8	0
58	5	93	136.81	148.70	11.90	8	0
55	1	94	2041.03	2194.65	153.63	7	1
54	1	95	665.72	731.55	65.84	9	0
54	5	96	70.64	74.35	3.72	5	0
52	5	98	419.34	446.10	26.77	6	0
54	2	99	558.75	614.00	55.26	9	1
52	4	100	9094.34	9885.15	790.82	8	1
51	5	101	349.45	371.75	22.31	6	0
59	3	102	491.86	546.50	54.66	10	0
56	3	103	513.71	546.50	32.79	6	1
59	3	104	1005.57	1093.00	87.44	8	0
53	2	105	1312.43	1381.50	69.08	5	0
54	4	106	9292.05	9885.15	593.11	6	0
56	3	107	1524.74	1639.50	114.77	7	0
56	2	108	721.45	767.50	46.05	6	0
51	5	109	535.32	594.80	59.48	10	1
53	2	110	142.76	153.50	10.75	7	0
56	4	111	7227.15	7688.45	461.31	6	1
54	3	112	1229.63	1366.25	136.63	10	1
59	3	113	1557.53	1639.50	81.98	5	0
58	4	114	6919.61	7688.45	768.85	10	0
59	2	115	291.65	307.00	15.36	5	1
51	3	116	2541.23	2732.50	191.28	7	0
53	3	117	2595.88	2732.50	136.63	5	1
58	4	118	6128.80	6590.10	461.31	7	1
57	1	120	2084.92	2194.65	109.74	5	0
53	1	121	6254.76	6583.95	329.20	5	1
52	2	122	414.45	460.50	46.06	10	0
52	5	123	136.81	148.70	11.90	8	1
54	2	125	1284.80	1381.50	96.71	7	0
55	4	127	5052.41	5491.75	439.35	8	0
53	1	129	658.40	731.55	73.16	10	0
56	1	131	6949.73	7315.50	365.78	5	1
53	5	132	559.12	594.80	35.69	6	1
58	5	133	139.78	148.70	8.93	6	1
51	5	135	209.67	223.05	13.39	6	0
54	2	136	145.83	153.50	7.68	5	1
56	3	137	1038.35	1093.00	54.66	5	1
53	4	139	7304.03	7688.45	384.43	5	1
54	1	141	6057.24	6583.95	526.72	8	0
56	2	142	1142.04	1228.00	85.97	7	1
59	2	143	1154.32	1228.00	73.68	6	1
51	5	144	615.62	669.15	53.54	8	0
55	2	145	988.55	1074.50	85.97	8	1
56	1	146	665.72	731.55	65.84	9	1
56	4	147	7995.99	8786.80	790.82	9	0
51	4	148	9094.34	9885.15	790.82	8	0
51	3	150	2213.33	2459.25	245.93	10	1
56	1	151	6057.24	6583.95	526.72	8	1
57	1	152	3438.29	3657.75	219.47	6	0
54	4	153	9094.34	9885.15	790.82	8	0
53	4	155	5107.33	5491.75	384.43	7	0
54	5	156	401.49	446.10	44.61	10	0
56	5	157	133.83	148.70	14.87	10	1
51	5	158	276.59	297.40	20.82	7	1
59	1	159	6057.24	6583.95	526.72	8	1
58	4	160	6260.60	6590.10	329.51	5	1
56	1	163	1360.69	1463.10	102.42	7	1
55	1	165	4864.81	5120.85	256.05	5	0
59	3	166	1778.86	1912.75	133.90	7	0
52	5	167	66.92	74.35	7.44	10	1
56	2	169	423.67	460.50	36.85	8	0
53	1	171	665.72	731.55	65.84	9	1
57	4	172	4085.87	4393.40	307.54	7	1
53	1	173	1389.95	1463.10	73.16	5	0
57	2	174	1284.80	1381.50	96.71	7	1
57	5	175	608.93	669.15	60.23	9	0
58	3	176	1475.55	1639.50	163.96	10	1
52	3	181	1475.55	1639.50	163.96	10	1
54	4	182	3954.06	4393.40	439.34	10	1
53	4	183	7304.03	7688.45	384.43	5	0
56	4	184	3097.35	3295.05	197.71	6	1
58	1	186	3401.71	3657.75	256.05	7	1
51	1	188	4082.05	4389.30	307.26	7	1
51	1	190	5384.21	5852.40	468.20	8	0
58	5	191	698.89	743.50	44.61	6	1
55	2	192	145.83	153.50	7.68	5	0
56	4	193	9094.34	9885.15	790.82	8	0
59	1	194	1360.69	1463.10	102.42	7	0
52	2	195	838.12	921.00	82.90	9	0
51	1	197	6876.57	7315.50	438.94	6	1
59	5	200	615.62	669.15	53.54	8	1
58	5	201	684.02	743.50	59.49	8	0
52	2	202	828.90	921.00	92.11	10	1
52	3	205	1229.63	1366.25	136.63	10	1
53	5	206	553.17	594.80	41.64	7	1
58	3	207	1243.29	1366.25	122.97	9	1
51	2	208	865.74	921.00	55.26	6	0
53	2	211	577.16	614.00	36.84	6	1
51	3	212	1740.61	1912.75	172.15	9	1
56	2	213	856.53	921.00	64.48	7	0
59	4	216	10324.49	10983.50	659.01	6	1
52	4	217	4942.58	5491.75	549.18	10	1
58	3	219	248.66	273.25	24.60	9	1
56	1	220	2779.89	2926.20	146.32	5	0
57	4	223	9390.90	9885.15	494.26	5	0
51	1	224	687.66	731.55	43.90	6	0
54	4	225	9390.90	9885.15	494.26	5	1
57	4	226	9994.99	10983.50	988.52	9	0
51	4	227	6919.61	7688.45	768.85	10	0
54	2	228	144.29	153.50	9.21	6	0
55	2	229	276.31	307.00	30.71	10	1
51	3	230	1778.86	1912.75	133.90	7	1
53	3	231	770.57	819.75	49.19	6	0
57	1	232	665.72	731.55	65.84	9	1
52	4	233	999.50	1098.35	98.86	9	0
53	1	234	4762.40	5120.85	358.46	7	1
57	3	235	1721.48	1912.75	191.28	10	0
51	4	237	8083.86	8786.80	702.95	8	0
55	5	238	565.06	594.80	29.74	5	1
57	3	239	251.40	273.25	21.86	8	0
54	5	240	706.33	743.50	37.18	5	1
54	5	243	405.96	446.10	40.15	9	0
57	2	244	1458.25	1535.00	76.75	5	0
58	3	245	1243.29	1366.25	122.97	9	1
57	3	249	1740.61	1912.75	172.15	9	0
\.


--
-- Data for Name: part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY part (part_id, part_number, part_ref, part_family, part_price) FROM stdin;
1	S10X001461	Battery  Part #16	Battery	731.55
2	S10X001462	Battery  Part #27	Battery	153.5
3	S10X001463	Battery  Part #38	Battery	273.25
4	S10X001464	Battery  Part #46	Battery	1098.35
5	S10X001465	Battery  Part #5	Battery	74.35
6	S10X001466	Break Part #1	Break	3.15
7	S10X001467	Break Part #12	Break	555.9
8	S10X001468	Break Part #13	Break	510.7
9	S10X001469	Break Part #2	Break	19.35
10	S10X001410	Break Part #23	Break	294.55
11	S10X001411	Break Part #24	Break	610.5
12	S10X001412	Break Part #34	Break	43.7
13	S10X001413	Break Part #35	Break	318.65
14	S10X001414	Break Part #42	Break	794.65
15	S10X001415	Break Part #43	Break	135.25
16	S10X001416	Engine  Part #14	Engine	219.35
17	S10X001417	Engine  Part #25	Engine	152.35
18	S10X001418	Engine  Part #3	Engine	20.3
19	S10X001419	Engine  Part #36	Engine	24.7
20	S10X001420	Engine  Part #44	Engine	617
21	S10X001421	Engine Part #15	Engine	1175.55
22	S10X001422	Engine Part #26	Engine	719.9
23	S10X001423	Engine Part #37	Engine	661.55
24	S10X001424	Engine Part #4	Engine	68.95
25	S10X001425	Engine Part #45	Engine	34.45
26	S10X001426	Lights  Part #17	Lights	925.65
27	S10X001427	Lights  Part #28	Lights	291.7
28	S10X001428	Lights  Part #39	Lights	537.1
29	S10X001429	Lights  Part #47	Lights	1358.05
30	S10X001430	Lights  Part #6	Lights	150.8
31	S10X001431	On Board Computer  Part #18	On Board Computer	1651.55
32	S10X001432	On Board Computer  Part #19	On Board Computer	148.75
33	S10X001433	On Board Computer  Part #20	On Board Computer	195
34	S10X001434	On Board Computer  Part #29	On Board Computer	212.3
35	S10X001435	On Board Computer  Part #30	On Board Computer	174.4
36	S10X001436	On Board Computer  Part #31	On Board Computer	687.45
37	S10X001437	On Board Computer  Part #40	On Board Computer	868.05
38	S10X001438	On Board Computer  Part #41	On Board Computer	260.9
39	S10X001439	On Board Computer  Part #48	On Board Computer	1632.6
40	S10X001440	On Board Computer  Part #49	On Board Computer	1439.25
41	S10X001441	On Board Computer  Part #50	On Board Computer	617.8
42	S10X001442	On Board Computer  Part #7	On Board Computer	174.75
43	S10X001443	On Board Computer  Part #8	On Board Computer	90.9
44	S10X001444	On Board Computer  Part #9	On Board Computer	153.6
45	S10X001445	Safety Part #11	Safety	315
46	S10X001446	Safety Part #22	Safety	400.25
47	S10X001447	Safety Part #33	Safety	1153.5
48	S10X001448	Wheels Part #10	Wheels	74.8
49	S10X001449	Wheels Part #21	Wheels	238.65
50	S10X001450	Wheels Part #32	Wheels	1111
\.


--
-- Data for Name: rejects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rejects (reject_type, excel_line, reason_reject, sales_rep_name, sales_rep_country) FROM stdin;
Part	261	Part S10X001459 Not Found	Georges Delaville	France
Part	264	Part S10X001459 Not Found	Georges Delaville	France
Part	266	Part S10X001458 Not Found	Maria Martin	France
Part	269	Part S10X001455 Not Found	Jan Muller	Germany
Part	270	Part S10X001457 Not Found	Mario Colli	Italy
Part	271	Part S10X001457 Not Found	Mario Colli	Italy
Part	282	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	286	Part S10X001454 Not Found	Frank Chemoul	France
Part	294	Part S10X001451 Not Found	Jan Muller	Germany
Part	300	Part S10X001453 Not Found	Frank Chemoul	France
Part	304	Part S10X001454 Not Found	Frank Chemoul	France
Part	305	Part S10X001453 Not Found	Mario Colli	Italy
Part	307	Part S10X001453 Not Found	Mario Colli	Italy
Part	309	Part S10X001458 Not Found	Mario Colli	Italy
Part	310	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	312	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	313	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	318	Part S10X001452 Not Found	Georges Delaville	France
Part	319	Part S10X001451 Not Found	Georges Delaville	France
Part	329	Part S10X001455 Not Found	Victoria Adams	Italy
Part	332	Part S10X001451 Not Found	Georges Delaville	France
Part	333	Part S10X001458 Not Found	Georges Delaville	France
Part	340	Part S10X001458 Not Found	Mario Colli	Italy
Part	351	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	356	Part S10X001459 Not Found	Maria Martin	France
Part	360	Part S10X001460 Not Found	Maria Martin	France
Part	364	Part S10X001453 Not Found	Mario Colli	Italy
Part	371	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	395	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	397	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	412	Part S10X001451 Not Found	Jan Muller	Germany
Part	413	Part S10X001460 Not Found	Maria Martin	France
Part	414	Part S10X001457 Not Found	Maria Martin	France
Part	416	Part S10X001460 Not Found	Maria Martin	France
Part	420	Part S10X001454 Not Found	Jan Muller	Germany
Part	429	Part S10X001455 Not Found	Victoria Adams	Italy
Part	439	Part S10X001457 Not Found	Maria Martin	France
Part	440	Part S10X001454 Not Found	Maria Martin	France
Part	449	Part S10X001452 Not Found	Georges Delaville	France
Part	451	Part S10X001458 Not Found	Georges Delaville	France
Part	467	Part S10X001455 Not Found	Mario Colli	Italy
Part	469	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	477	Part S10X001453 Not Found	Jan Muller	Germany
Part	479	Part S10X001452 Not Found	Jan Muller	Germany
Part	485	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	487	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	492	Part S10X001459 Not Found	Mario Colli	Italy
Part	493	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	497	Part S10X001451 Not Found	Mario Colli	Italy
Part	502	Part S10X001456 Not Found	Victoria Adams	Italy
Part	511	Part S10X001459 Not Found	Georges Delaville	France
Part	512	Part S10X001451 Not Found	Georges Delaville	France
Part	514	Part S10X001455 Not Found	Georges Delaville	France
Part	516	Part S10X001458 Not Found	Maria Martin	France
Part	517	Part S10X001455 Not Found	Maria Martin	France
Part	521	Part S10X001453 Not Found	Mario Colli	Italy
Part	522	Part S10X001459 Not Found	Mario Colli	Italy
Part	527	Part S10X001460 Not Found	Frank Chemoul	France
Part	529	Part S10X001460 Not Found	Jan Muller	Germany
Part	530	Part S10X001455 Not Found	Jan Muller	Germany
Part	531	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	541	Part S10X001452 Not Found	Jan Muller	Germany
Part	545	Part S10X001453 Not Found	Jan Muller	Germany
Part	577	Part S10X001457 Not Found	Victoria Adams	Italy
Part	581	Part S10X001453 Not Found	Georges Delaville	France
Part	582	Part S10X001456 Not Found	Georges Delaville	France
Part	597	Part S10X001456 Not Found	Frank Chemoul	France
Part	598	Part S10X001451 Not Found	Frank Chemoul	France
Part	599	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	604	Part S10X001458 Not Found	Maria Martin	France
Part	609	Part S10X001453 Not Found	Maria Martin	France
Part	612	Part S10X001455 Not Found	Mario Colli	Italy
Part	616	Part S10X001455 Not Found	Mario Colli	Italy
Part	619	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	623	Part S10X001452 Not Found	Frank Chemoul	France
Part	631	Part S10X001458 Not Found	Mario Colli	Italy
Part	633	Part S10X001451 Not Found	Georges Delaville	France
Part	638	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	642	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	647	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	651	Part S10X001455 Not Found	Frank Chemoul	France
Part	652	Part S10X001460 Not Found	Frank Chemoul	France
Part	653	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	655	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	660	Part S10X001452 Not Found	Jan Muller	Germany
Part	661	Part S10X001452 Not Found	Jan Muller	Germany
Part	671	Part S10X001453 Not Found	Maria Martin	France
Part	678	Part S10X001458 Not Found	Maria Martin	France
Part	681	Part S10X001453 Not Found	Victoria Adams	Italy
Part	686	Part S10X001452 Not Found	Maria Martin	France
Part	695	Part S10X001454 Not Found	Mario Colli	Italy
Part	708	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	712	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	717	Part S10X001457 Not Found	Mario Colli	Italy
Part	720	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	730	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	742	Part S10X001454 Not Found	Mario Colli	Italy
Part	743	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	747	Part S10X001457 Not Found	Mario Colli	Italy
Part	749	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	750	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	756	Part S10X001451 Not Found	Frank Chemoul	France
Part	760	Part S10X001457 Not Found	Georges Delaville	France
Part	768	Part S10X001453 Not Found	Jan Muller	Germany
Part	769	Part S10X001454 Not Found	Jan Muller	Germany
Part	773	Part S10X001455 Not Found	Mario Colli	Italy
Part	776	Part S10X001452 Not Found	Frank Chemoul	France
Part	778	Part S10X001460 Not Found	Frank Chemoul	France
Part	784	Part S10X001451 Not Found	Frank Chemoul	France
Part	789	Part S10X001451 Not Found	Frank Chemoul	France
Part	792	Part S10X001456 Not Found	Jan Muller	Germany
Part	794	Part S10X001460 Not Found	Jan Muller	Germany
Part	797	Part S10X001452 Not Found	Jan Muller	Germany
Part	808	Part S10X001453 Not Found	Mario Colli	Italy
Part	817	Part S10X001452 Not Found	Georges Delaville	France
Part	822	Part S10X001460 Not Found	Frank Chemoul	France
Part	827	Part S10X001453 Not Found	Victoria Adams	Italy
Part	833	Part S10X001458 Not Found	Georges Delaville	France
Part	834	Part S10X001451 Not Found	Georges Delaville	France
Part	837	Part S10X001460 Not Found	Mario Colli	Italy
Part	846	Part S10X001453 Not Found	Frank Chemoul	France
Part	847	Part S10X001453 Not Found	Frank Chemoul	France
Part	849	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	850	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	857	Part S10X001459 Not Found	Maria Martin	France
Part	858	Part S10X001453 Not Found	Maria Martin	France
Part	868	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	869	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	897	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	903	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	908	Part S10X001460 Not Found	Jan Muller	Germany
Part	915	Part S10X001454 Not Found	Maria Martin	France
Part	926	Part S10X001458 Not Found	Maria Martin	France
Part	930	Part S10X001458 Not Found	Victoria Adams	Italy
Part	942	Part S10X001456 Not Found	Frank Chemoul	France
Part	945	Part S10X001457 Not Found	Mario Colli	Italy
Part	946	Part S10X001456 Not Found	Mario Colli	Italy
Part	951	Part S10X001452 Not Found	Georges Delaville	France
Part	956	Part S10X001457 Not Found	Jan Muller	Germany
Part	957	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	979	Part S10X001454 Not Found	Jan Muller	Germany
Part	989	Part S10X001451 Not Found	Mario Colli	Italy
Part	991	Part S10X001457 Not Found	Mario Colli	Italy
Part	995	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	996	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	1010	Part S10X001451 Not Found	Georges Delaville	France
Part	1017	Part S10X001458 Not Found	Maria Martin	France
Part	1022	Part S10X001458 Not Found	Mario Colli	Italy
Part	1027	Part S10X001451 Not Found	Frank Chemoul	France
Part	1032	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	1036	Part S10X001454 Not Found	Frank Chemoul	France
Part	1038	Part S10X001456 Not Found	Frank Chemoul	France
Part	1050	Part S10X001454 Not Found	Frank Chemoul	France
Part	1060	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	1063	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	1066	Part S10X001451 Not Found	Georges Delaville	France
Part	1068	Part S10X001455 Not Found	Georges Delaville	France
Part	1071	Part S10X001459 Not Found	Frank Chemoul	France
Part	1074	Part S10X001451 Not Found	Martin Lemieux	France
Part	1075	Part S10X001451 Not Found	Martin Lemieux	France
Part	1080	Part S10X001460 Not Found	Victoria Adams	Italy
Part	1087	Part S10X001457 Not Found	Mario Colli	Italy
Part	1088	Part S10X001455 Not Found	Mario Colli	Italy
Part	1096	Part S10X001459 Not Found	Frank Chemoul	France
Part	1098	Part S10X001456 Not Found	Frank Chemoul	France
Part	1104	Part S10X001455 Not Found	Maria Martin	France
Part	1108	Part S10X001452 Not Found	Maria Martin	France
Part	1114	Part S10X001453 Not Found	Mario Colli	Italy
Part	1122	Part S10X001455 Not Found	Frank Chemoul	France
Part	1123	Part S10X001460 Not Found	Frank Chemoul	France
Part	1131	Part S10X001458 Not Found	Mario Colli	Italy
Part	1135	Part S10X001454 Not Found	Georges Delaville	France
Part	1139	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	1162	Part S10X001456 Not Found	Jan Muller	Germany
Part	1165	Part S10X001453 Not Found	Maria Martin	France
Part	1167	Part S10X001452 Not Found	Maria Martin	France
Part	1182	Part S10X001454 Not Found	Victoria Adams	Italy
Part	1185	Part S10X001452 Not Found	Maria Martin	France
Part	1190	Part S10X001458 Not Found	Maria Martin	France
Part	1194	Part S10X001458 Not Found	Mario Colli	Italy
Part	1195	Part S10X001453 Not Found	Mario Colli	Italy
Part	1201	Part S10X001453 Not Found	Georges Delaville	France
Part	1205	Part S10X001458 Not Found	Jan Muller	Germany
Part	1210	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	1217	Part S10X001455 Not Found	Mario Colli	Italy
Part	1224	Part S10X001456 Not Found	Jan Muller	Germany
Part	1226	Part S10X001457 Not Found	Jan Muller	Germany
Part	1227	Part S10X001451 Not Found	Jan Muller	Germany
Part	1230	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	1231	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	1238	Part S10X001456 Not Found	Mario Colli	Italy
Part	1241	Part S10X001459 Not Found	Mario Colli	Italy
Part	1246	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	1249	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	1257	Part S10X001455 Not Found	Frank Chemoul	France
Part	1259	Part S10X001460 Not Found	Georges Delaville	France
Part	1271	Part S10X001458 Not Found	Mario Colli	Italy
Part	1285	Part S10X001460 Not Found	Frank Chemoul	France
Part	1291	Part S10X001453 Not Found	Jan Muller	Germany
Part	1293	Part S10X001455 Not Found	Jan Muller	Germany
Part	1295	Part S10X001458 Not Found	Jan Muller	Germany
Part	1301	Part S10X001458 Not Found	Frank Chemoul	France
Part	1305	Part S10X001453 Not Found	Mario Colli	Italy
Part	1306	Part S10X001452 Not Found	Mario Colli	Italy
Part	1311	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	1324	Part S10X001457 Not Found	Martin Lemieux	France
Part	1330	Part S10X001454 Not Found	Victoria Adams	Italy
Part	1339	Part S10X001457 Not Found	Mario Colli	Italy
Part	1345	Part S10X001453 Not Found	Frank Chemoul	France
Part	1358	Part S10X001454 Not Found	Maria Martin	France
Part	1365	Part S10X001453 Not Found	Mario Colli	Italy
Part	1385	Part S10X001458 Not Found	Georges Delaville	France
Part	1386	Part S10X001456 Not Found	Georges Delaville	France
Part	1389	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	1395	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	1397	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	1400	Part S10X001455 Not Found	Frank Chemoul	France
Part	1402	Part S10X001451 Not Found	Frank Chemoul	France
Part	1408	Part S10X001458 Not Found	Jan Muller	Germany
Part	1410	Part S10X001453 Not Found	Jan Muller	Germany
Part	1414	Part S10X001459 Not Found	Maria Martin	France
Part	1426	Part S10X001458 Not Found	Maria Martin	France
Part	1427	Part S10X001459 Not Found	Maria Martin	France
Part	1429	Part S10X001459 Not Found	Victoria Adams	Italy
Part	1430	Part S10X001452 Not Found	Victoria Adams	Italy
Part	1432	Part S10X001454 Not Found	Victoria Adams	Italy
Part	1433	Part S10X001460 Not Found	Victoria Adams	Italy
Part	1436	Part S10X001452 Not Found	Maria Martin	France
Part	1437	Part S10X001452 Not Found	Maria Martin	France
Part	1445	Part S10X001460 Not Found	Mario Colli	Italy
Part	1450	Part S10X001456 Not Found	Georges Delaville	France
Part	1458	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	1459	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	1463	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	1470	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	1472	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	1476	Part S10X001454 Not Found	Jan Muller	Germany
Part	1485	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	1487	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	1498	Part S10X001453 Not Found	Mario Colli	Italy
Part	1499	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	1502	Part S10X001455 Not Found	Victoria Adams	Italy
Part	1503	Part S10X001454 Not Found	Victoria Adams	Italy
Part	1513	Part S10X001455 Not Found	Georges Delaville	France
Part	1514	Part S10X001457 Not Found	Georges Delaville	France
Part	1516	Part S10X001458 Not Found	Maria Martin	France
Part	1519	Part S10X001456 Not Found	Jan Muller	Germany
Part	1528	Part S10X001457 Not Found	Frank Chemoul	France
Part	1530	Part S10X001455 Not Found	Jan Muller	Germany
Part	1534	Part S10X001456 Not Found	Frank Chemoul	France
Part	1537	Part S10X001455 Not Found	Frank Chemoul	France
Part	1542	Part S10X001455 Not Found	Jan Muller	Germany
Part	1549	Part S10X001453 Not Found	Jan Muller	Germany
Part	1552	Part S10X001452 Not Found	Frank Chemoul	France
Part	1556	Part S10X001457 Not Found	Mario Colli	Italy
Part	1565	Part S10X001460 Not Found	Georges Delaville	France
Part	1566	Part S10X001456 Not Found	Georges Delaville	France
Part	1569	Part S10X001460 Not Found	Georges Delaville	France
Part	1570	Part S10X001459 Not Found	Frank Chemoul	France
Part	1582	Part S10X001452 Not Found	Georges Delaville	France
Part	1587	Part S10X001460 Not Found	Mario Colli	Italy
Part	1598	Part S10X001459 Not Found	Frank Chemoul	France
Part	1606	Part S10X001453 Not Found	Maria Martin	France
Part	1607	Part S10X001460 Not Found	Maria Martin	France
Part	1608	Part S10X001453 Not Found	Maria Martin	France
Part	1614	Part S10X001452 Not Found	Mario Colli	Italy
Part	1620	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	1623	Part S10X001458 Not Found	Frank Chemoul	France
Part	1624	Part S10X001455 Not Found	Frank Chemoul	France
Part	1625	Part S10X001452 Not Found	Frank Chemoul	France
Part	1637	Part S10X001451 Not Found	Georges Delaville	France
Part	1640	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	1642	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	1657	Part S10X001451 Not Found	Jan Muller	Germany
Part	1661	Part S10X001453 Not Found	Jan Muller	Germany
Part	1680	Part S10X001458 Not Found	Victoria Adams	Italy
Part	1686	Part S10X001454 Not Found	Maria Martin	France
Part	1694	Part S10X001452 Not Found	Mario Colli	Italy
Part	1702	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	1703	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	1710	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	1712	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	1714	Part S10X001457 Not Found	Mario Colli	Italy
Part	1719	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	1723	Part S10X001459 Not Found	Jan Muller	Germany
Part	1729	Part S10X001460 Not Found	Jan Muller	Germany
Part	1733	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	1747	Part S10X001459 Not Found	Mario Colli	Italy
Part	1754	Part S10X001451 Not Found	Frank Chemoul	France
Part	1759	Part S10X001457 Not Found	Georges Delaville	France
Part	1764	Part S10X001460 Not Found	Georges Delaville	France
Part	1772	Part S10X001460 Not Found	Mario Colli	Italy
Part	1775	Part S10X001451 Not Found	Frank Chemoul	France
Part	1776	Part S10X001459 Not Found	Frank Chemoul	France
Part	1784	Part S10X001455 Not Found	Frank Chemoul	France
Part	1785	Part S10X001457 Not Found	Frank Chemoul	France
Part	1790	Part S10X001457 Not Found	Jan Muller	Germany
Part	1792	Part S10X001457 Not Found	Jan Muller	Germany
Part	1794	Part S10X001452 Not Found	Jan Muller	Germany
Part	1802	Part S10X001455 Not Found	Frank Chemoul	France
Part	1806	Part S10X001460 Not Found	Mario Colli	Italy
Part	1811	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	1830	Part S10X001456 Not Found	Victoria Adams	Italy
Part	1831	Part S10X001458 Not Found	Georges Delaville	France
Part	1833	Part S10X001455 Not Found	Georges Delaville	France
Part	1836	Part S10X001452 Not Found	Mario Colli	Italy
Part	1844	Part S10X001459 Not Found	Frank Chemoul	France
Part	1847	Part S10X001458 Not Found	Frank Chemoul	France
Part	1856	Part S10X001458 Not Found	Maria Martin	France
Part	1866	Part S10X001460 Not Found	Mario Colli	Italy
Part	1867	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	1878	Part S10X001456 Not Found	Mario Colli	Italy
Part	1882	Part S10X001454 Not Found	Mario Colli	Italy
Part	1883	Part S10X001460 Not Found	Georges Delaville	France
Part	1889	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	1895	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	1896	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	1902	Part S10X001459 Not Found	Frank Chemoul	France
Part	1907	Part S10X001451 Not Found	Jan Muller	Germany
Part	1931	Part S10X001459 Not Found	Victoria Adams	Italy
Part	1932	Part S10X001453 Not Found	Victoria Adams	Italy
Part	1940	Part S10X001459 Not Found	Maria Martin	France
Part	1946	Part S10X001451 Not Found	Mario Colli	Italy
Part	1948	Part S10X001454 Not Found	Jan Muller	Germany
Part	1950	Part S10X001455 Not Found	Georges Delaville	France
Part	1952	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	1959	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	1961	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	1963	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	1967	Part S10X001459 Not Found	Mario Colli	Italy
Part	1976	Part S10X001452 Not Found	Jan Muller	Germany
Part	1978	Part S10X001451 Not Found	Jan Muller	Germany
Part	1995	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	1996	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	2006	Part S10X001458 Not Found	Frank Chemoul	France
Part	2009	Part S10X001453 Not Found	Georges Delaville	France
Part	2017	Part S10X001455 Not Found	Maria Martin	France
Part	2023	Part S10X001458 Not Found	Mario Colli	Italy
Part	2027	Part S10X001458 Not Found	Frank Chemoul	France
Part	2030	Part S10X001460 Not Found	Jan Muller	Germany
Part	2032	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	2036	Part S10X001454 Not Found	Frank Chemoul	France
Part	2037	Part S10X001460 Not Found	Frank Chemoul	France
Part	2043	Part S10X001455 Not Found	Jan Muller	Germany
Part	2048	Part S10X001454 Not Found	Jan Muller	Germany
Part	2052	Part S10X001456 Not Found	Frank Chemoul	France
Part	2055	Part S10X001451 Not Found	Mario Colli	Italy
Part	2071	Part S10X001457 Not Found	Frank Chemoul	France
Part	2072	Part S10X001451 Not Found	Frank Chemoul	France
Part	2074	Part S10X001454 Not Found	Martin Lemieux	France
Part	2076	Part S10X001454 Not Found	Martin Lemieux	France
Part	2082	Part S10X001458 Not Found	Georges Delaville	France
Part	2085	Part S10X001457 Not Found	Georges Delaville	France
Part	2092	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	2093	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	2098	Part S10X001451 Not Found	Frank Chemoul	France
Part	2099	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	2108	Part S10X001459 Not Found	Maria Martin	France
Part	2116	Part S10X001460 Not Found	Mario Colli	Italy
Part	2118	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	2122	Part S10X001454 Not Found	Frank Chemoul	France
Part	2125	Part S10X001457 Not Found	Frank Chemoul	France
Part	2130	Part S10X001459 Not Found	Mario Colli	Italy
Part	2131	Part S10X001456 Not Found	Mario Colli	Italy
Part	2134	Part S10X001455 Not Found	Georges Delaville	France
Part	2136	Part S10X001455 Not Found	Georges Delaville	France
Part	2141	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	2150	Part S10X001456 Not Found	Frank Chemoul	France
Part	2155	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	2156	Part S10X001457 Not Found	Jan Muller	Germany
Part	2163	Part S10X001458 Not Found	Maria Martin	France
Part	2168	Part S10X001458 Not Found	Jan Muller	Germany
Part	2172	Part S10X001457 Not Found	Maria Martin	France
Part	2175	Part S10X001452 Not Found	Maria Martin	France
Part	2176	Part S10X001451 Not Found	Maria Martin	France
Part	2180	Part S10X001460 Not Found	Victoria Adams	Italy
Part	2185	Part S10X001460 Not Found	Maria Martin	France
Part	2186	Part S10X001459 Not Found	Maria Martin	France
Part	2193	Part S10X001460 Not Found	Frank Chemoul	France
Part	2196	Part S10X001459 Not Found	Mario Colli	Italy
Part	2204	Part S10X001453 Not Found	Jan Muller	Germany
Part	2208	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	2210	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	2221	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	2222	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	2224	Part S10X001457 Not Found	Jan Muller	Germany
Part	2225	Part S10X001451 Not Found	Jan Muller	Germany
Part	2234	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	2237	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	2241	Part S10X001453 Not Found	Mario Colli	Italy
Part	2242	Part S10X001454 Not Found	Mario Colli	Italy
Part	2246	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	2252	Part S10X001451 Not Found	Victoria Adams	Italy
Part	2258	Part S10X001453 Not Found	Frank Chemoul	France
Part	2260	Part S10X001459 Not Found	Georges Delaville	France
Part	2263	Part S10X001452 Not Found	Georges Delaville	France
Part	2265	Part S10X001455 Not Found	Maria Martin	France
Part	2266	Part S10X001458 Not Found	Maria Martin	France
Part	2267	Part S10X001454 Not Found	Maria Martin	France
Part	2273	Part S10X001452 Not Found	Mario Colli	Italy
Part	2274	Part S10X001458 Not Found	Frank Chemoul	France
Part	2277	Part S10X001453 Not Found	Frank Chemoul	France
Part	2280	Part S10X001457 Not Found	Jan Muller	Germany
Part	2283	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	2307	Part S10X001455 Not Found	Mario Colli	Italy
Part	2309	Part S10X001455 Not Found	Mario Colli	Italy
Part	2316	Part S10X001454 Not Found	Georges Delaville	France
Part	2325	Part S10X001455 Not Found	Martin Lemieux	France
Part	2326	Part S10X001460 Not Found	Martin Lemieux	France
Part	2334	Part S10X001458 Not Found	Georges Delaville	France
Part	2336	Part S10X001453 Not Found	Mario Colli	Italy
Part	2357	Part S10X001453 Not Found	Maria Martin	France
Part	2358	Part S10X001454 Not Found	Maria Martin	France
Part	2359	Part S10X001454 Not Found	Maria Martin	France
Part	2360	Part S10X001460 Not Found	Maria Martin	France
Part	2364	Part S10X001459 Not Found	Mario Colli	Italy
Part	2377	Part S10X001458 Not Found	Mario Colli	Italy
Part	2378	Part S10X001457 Not Found	Mario Colli	Italy
Part	2379	Part S10X001460 Not Found	Mario Colli	Italy
Part	2380	Part S10X001453 Not Found	Mario Colli	Italy
Part	2381	Part S10X001457 Not Found	Mario Colli	Italy
Part	2385	Part S10X001458 Not Found	Georges Delaville	France
Part	2388	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	2390	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	2396	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	2412	Part S10X001453 Not Found	Jan Muller	Germany
Part	2415	Part S10X001453 Not Found	Maria Martin	France
Part	2420	Part S10X001453 Not Found	Jan Muller	Germany
Part	2421	Part S10X001454 Not Found	Maria Martin	France
Part	2427	Part S10X001457 Not Found	Maria Martin	France
Part	2435	Part S10X001459 Not Found	Maria Martin	France
Part	2438	Part S10X001457 Not Found	Maria Martin	France
Part	2461	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	2466	Part S10X001455 Not Found	Mario Colli	Italy
Part	2476	Part S10X001454 Not Found	Jan Muller	Germany
Part	2478	Part S10X001459 Not Found	Jan Muller	Germany
Part	2482	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	2492	Part S10X001459 Not Found	Mario Colli	Italy
Part	2516	Part S10X001452 Not Found	Maria Martin	France
Part	2529	Part S10X001454 Not Found	Jan Muller	Germany
Part	2534	Part S10X001457 Not Found	Frank Chemoul	France
Part	2543	Part S10X001455 Not Found	Jan Muller	Germany
Part	2546	Part S10X001453 Not Found	Jan Muller	Germany
Part	2558	Part S10X001453 Not Found	Mario Colli	Italy
Part	2559	Part S10X001455 Not Found	Mario Colli	Italy
Part	2562	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	2570	Part S10X001453 Not Found	Frank Chemoul	France
Part	2591	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	2593	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	2609	Part S10X001458 Not Found	Maria Martin	France
Part	2610	Part S10X001452 Not Found	Maria Martin	France
Part	2613	Part S10X001460 Not Found	Mario Colli	Italy
Part	2616	Part S10X001451 Not Found	Mario Colli	Italy
Part	2622	Part S10X001454 Not Found	Frank Chemoul	France
Part	2624	Part S10X001451 Not Found	Frank Chemoul	France
Part	2627	Part S10X001453 Not Found	Mario Colli	Italy
Part	2631	Part S10X001457 Not Found	Mario Colli	Italy
Part	2632	Part S10X001451 Not Found	Mario Colli	Italy
Part	2636	Part S10X001458 Not Found	Georges Delaville	France
Part	2645	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	2646	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	2649	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	2652	Part S10X001458 Not Found	Frank Chemoul	France
Part	2658	Part S10X001455 Not Found	Jan Muller	Germany
Part	2662	Part S10X001453 Not Found	Jan Muller	Germany
Part	2666	Part S10X001452 Not Found	Maria Martin	France
Part	2668	Part S10X001452 Not Found	Jan Muller	Germany
Part	2674	Part S10X001455 Not Found	Maria Martin	France
Part	2683	Part S10X001453 Not Found	Victoria Adams	Italy
Part	2685	Part S10X001458 Not Found	Maria Martin	France
Part	2686	Part S10X001453 Not Found	Maria Martin	France
Part	2689	Part S10X001451 Not Found	Maria Martin	France
Part	2698	Part S10X001457 Not Found	Jan Muller	Germany
Part	2699	Part S10X001459 Not Found	Georges Delaville	France
Part	2701	Part S10X001458 Not Found	Georges Delaville	France
Part	2709	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	2711	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	2712	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	2713	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	2714	Part S10X001453 Not Found	Mario Colli	Italy
Part	2716	Part S10X001455 Not Found	Mario Colli	Italy
Part	2720	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	2725	Part S10X001453 Not Found	Jan Muller	Germany
Part	2729	Part S10X001455 Not Found	Jan Muller	Germany
Part	2735	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	2737	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	2738	Part S10X001455 Not Found	Mario Colli	Italy
Part	2740	Part S10X001454 Not Found	Mario Colli	Italy
Part	2741	Part S10X001457 Not Found	Mario Colli	Italy
Part	2742	Part S10X001451 Not Found	Mario Colli	Italy
Part	2746	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	2750	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	2752	Part S10X001458 Not Found	Victoria Adams	Italy
Part	2757	Part S10X001457 Not Found	Frank Chemoul	France
Part	2758	Part S10X001456 Not Found	Frank Chemoul	France
Part	2765	Part S10X001453 Not Found	Maria Martin	France
Part	2771	Part S10X001456 Not Found	Mario Colli	Italy
Part	2773	Part S10X001458 Not Found	Mario Colli	Italy
Part	2780	Part S10X001453 Not Found	Jan Muller	Germany
Part	2788	Part S10X001459 Not Found	Frank Chemoul	France
Part	2791	Part S10X001452 Not Found	Jan Muller	Germany
Part	2798	Part S10X001454 Not Found	Jan Muller	Germany
Part	2800	Part S10X001454 Not Found	Frank Chemoul	France
Part	2801	Part S10X001453 Not Found	Frank Chemoul	France
Part	2803	Part S10X001451 Not Found	Frank Chemoul	France
Part	2804	Part S10X001460 Not Found	Frank Chemoul	France
Part	2820	Part S10X001459 Not Found	Frank Chemoul	France
Part	2821	Part S10X001457 Not Found	Frank Chemoul	France
Part	2825	Part S10X001455 Not Found	Martin Lemieux	France
Part	2830	Part S10X001458 Not Found	Victoria Adams	Italy
Part	2832	Part S10X001453 Not Found	Georges Delaville	France
Part	2834	Part S10X001458 Not Found	Georges Delaville	France
Part	2835	Part S10X001458 Not Found	Georges Delaville	France
Part	2838	Part S10X001460 Not Found	Mario Colli	Italy
Part	2863	Part S10X001452 Not Found	Mario Colli	Italy
Part	2880	Part S10X001451 Not Found	Mario Colli	Italy
Part	2885	Part S10X001456 Not Found	Georges Delaville	France
Part	2887	Part S10X001459 Not Found	Georges Delaville	France
Part	2888	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	2890	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	2894	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	2913	Part S10X001455 Not Found	Maria Martin	France
Part	2914	Part S10X001459 Not Found	Maria Martin	France
Part	2919	Part S10X001451 Not Found	Jan Muller	Germany
Part	2920	Part S10X001453 Not Found	Jan Muller	Germany
Part	2932	Part S10X001460 Not Found	Victoria Adams	Italy
Part	2933	Part S10X001457 Not Found	Victoria Adams	Italy
Part	2934	Part S10X001458 Not Found	Victoria Adams	Italy
Part	2947	Part S10X001458 Not Found	Jan Muller	Germany
Part	2948	Part S10X001457 Not Found	Jan Muller	Germany
Part	2955	Part S10X001459 Not Found	Jan Muller	Germany
Part	2956	Part S10X001452 Not Found	Jan Muller	Germany
Part	2972	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	2973	Part S10X001460 Not Found	Jan Muller	Germany
Part	2974	Part S10X001458 Not Found	Jan Muller	Germany
Part	2976	Part S10X001459 Not Found	Jan Muller	Germany
Part	2979	Part S10X001453 Not Found	Jan Muller	Germany
Part	2982	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	2984	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	2987	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	2989	Part S10X001453 Not Found	Mario Colli	Italy
Part	2995	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	3000	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	3003	Part S10X001454 Not Found	Victoria Adams	Italy
Part	3004	Part S10X001457 Not Found	Frank Chemoul	France
Part	3006	Part S10X001451 Not Found	Frank Chemoul	France
Part	3008	Part S10X001455 Not Found	Frank Chemoul	France
Part	3014	Part S10X001454 Not Found	Georges Delaville	France
Part	3022	Part S10X001458 Not Found	Mario Colli	Italy
Part	3025	Part S10X001460 Not Found	Frank Chemoul	France
Part	3030	Part S10X001452 Not Found	Jan Muller	Germany
Part	3036	Part S10X001456 Not Found	Frank Chemoul	France
Part	3038	Part S10X001458 Not Found	Frank Chemoul	France
Part	3046	Part S10X001452 Not Found	Jan Muller	Germany
Part	3051	Part S10X001460 Not Found	Frank Chemoul	France
Part	3061	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	3078	Part S10X001458 Not Found	Victoria Adams	Italy
Part	3086	Part S10X001453 Not Found	Mario Colli	Italy
Part	3091	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	3096	Part S10X001459 Not Found	Frank Chemoul	France
Part	3097	Part S10X001454 Not Found	Frank Chemoul	France
Part	3108	Part S10X001455 Not Found	Maria Martin	France
Part	3110	Part S10X001460 Not Found	Maria Martin	France
Part	3117	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	3120	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	3122	Part S10X001459 Not Found	Frank Chemoul	France
Part	3128	Part S10X001454 Not Found	Mario Colli	Italy
Part	3134	Part S10X001452 Not Found	Georges Delaville	France
Part	3137	Part S10X001453 Not Found	Georges Delaville	France
Part	3142	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	3146	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	3151	Part S10X001451 Not Found	Frank Chemoul	France
Part	3154	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	3155	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	3166	Part S10X001459 Not Found	Maria Martin	France
Part	3173	Part S10X001460 Not Found	Maria Martin	France
Part	3174	Part S10X001455 Not Found	Maria Martin	France
Part	3182	Part S10X001454 Not Found	Victoria Adams	Italy
Part	3183	Part S10X001459 Not Found	Victoria Adams	Italy
Part	3186	Part S10X001460 Not Found	Maria Martin	France
Part	3190	Part S10X001457 Not Found	Maria Martin	France
Part	3199	Part S10X001459 Not Found	Georges Delaville	France
Part	3215	Part S10X001457 Not Found	Mario Colli	Italy
Part	3216	Part S10X001457 Not Found	Mario Colli	Italy
Part	3219	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	3227	Part S10X001451 Not Found	Jan Muller	Germany
Part	3232	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	3233	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	3234	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	3247	Part S10X001456 Not Found	Mario Colli	Italy
Part	3250	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	3256	Part S10X001453 Not Found	Frank Chemoul	France
Part	3266	Part S10X001451 Not Found	Maria Martin	France
Part	3267	Part S10X001460 Not Found	Maria Martin	France
Part	3272	Part S10X001454 Not Found	Mario Colli	Italy
Part	3277	Part S10X001451 Not Found	Frank Chemoul	France
Part	3279	Part S10X001459 Not Found	Jan Muller	Germany
Part	3297	Part S10X001454 Not Found	Jan Muller	Germany
Part	3300	Part S10X001458 Not Found	Frank Chemoul	France
Part	3301	Part S10X001455 Not Found	Frank Chemoul	France
Part	3302	Part S10X001456 Not Found	Frank Chemoul	France
Part	3308	Part S10X001456 Not Found	Mario Colli	Italy
Part	3311	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	3319	Part S10X001460 Not Found	Georges Delaville	France
Part	3321	Part S10X001457 Not Found	Frank Chemoul	France
Part	3322	Part S10X001452 Not Found	Frank Chemoul	France
Part	3323	Part S10X001459 Not Found	Frank Chemoul	France
Part	3326	Part S10X001460 Not Found	Martin Lemieux	France
Part	3327	Part S10X001458 Not Found	Victoria Adams	Italy
Part	3334	Part S10X001456 Not Found	Georges Delaville	France
Part	3337	Part S10X001455 Not Found	Mario Colli	Italy
Part	3359	Part S10X001456 Not Found	Maria Martin	France
Part	3367	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	3371	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	3372	Part S10X001454 Not Found	Frank Chemoul	France
Part	3376	Part S10X001455 Not Found	Frank Chemoul	France
Part	3380	Part S10X001459 Not Found	Mario Colli	Italy
Part	3386	Part S10X001458 Not Found	Georges Delaville	France
Part	3391	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	3398	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	3404	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	3409	Part S10X001456 Not Found	Jan Muller	Germany
Part	3411	Part S10X001456 Not Found	Jan Muller	Germany
Part	3438	Part S10X001452 Not Found	Maria Martin	France
Part	3440	Part S10X001456 Not Found	Maria Martin	France
Part	3447	Part S10X001455 Not Found	Jan Muller	Germany
Part	3451	Part S10X001455 Not Found	Georges Delaville	France
Part	3455	Part S10X001456 Not Found	Jan Muller	Germany
Part	3457	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	3461	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	3464	Part S10X001454 Not Found	Mario Colli	Italy
Part	3468	Part S10X001451 Not Found	Mario Colli	Italy
Part	3475	Part S10X001451 Not Found	Jan Muller	Germany
Part	3476	Part S10X001456 Not Found	Jan Muller	Germany
Part	3492	Part S10X001456 Not Found	Mario Colli	Italy
Part	3500	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	3501	Part S10X001451 Not Found	Mario Colli	Italy
Part	3503	Part S10X001451 Not Found	Victoria Adams	Italy
Part	3505	Part S10X001458 Not Found	Frank Chemoul	France
Part	3523	Part S10X001458 Not Found	Mario Colli	Italy
Part	3524	Part S10X001460 Not Found	Frank Chemoul	France
Part	3528	Part S10X001455 Not Found	Frank Chemoul	France
Part	3534	Part S10X001456 Not Found	Frank Chemoul	France
Part	3548	Part S10X001453 Not Found	Jan Muller	Germany
Part	3555	Part S10X001457 Not Found	Mario Colli	Italy
Part	3559	Part S10X001453 Not Found	Mario Colli	Italy
Part	3562	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	3563	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	3567	Part S10X001456 Not Found	Georges Delaville	France
Part	3579	Part S10X001458 Not Found	Victoria Adams	Italy
Part	3580	Part S10X001452 Not Found	Victoria Adams	Italy
Part	3595	Part S10X001457 Not Found	Frank Chemoul	France
Part	3601	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	3602	Part S10X001457 Not Found	Maria Martin	France
Part	3603	Part S10X001460 Not Found	Maria Martin	France
Part	3604	Part S10X001457 Not Found	Maria Martin	France
Part	3606	Part S10X001452 Not Found	Maria Martin	France
Part	3607	Part S10X001457 Not Found	Maria Martin	France
Part	3611	Part S10X001458 Not Found	Maria Martin	France
Part	3614	Part S10X001452 Not Found	Mario Colli	Italy
Part	3624	Part S10X001452 Not Found	Frank Chemoul	France
Part	3628	Part S10X001452 Not Found	Mario Colli	Italy
Part	3629	Part S10X001455 Not Found	Mario Colli	Italy
Part	3634	Part S10X001454 Not Found	Georges Delaville	France
Part	3646	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	3658	Part S10X001459 Not Found	Jan Muller	Germany
Part	3668	Part S10X001457 Not Found	Jan Muller	Germany
Part	3673	Part S10X001453 Not Found	Maria Martin	France
Part	3676	Part S10X001457 Not Found	Maria Martin	France
Part	3685	Part S10X001457 Not Found	Maria Martin	France
Part	3695	Part S10X001457 Not Found	Mario Colli	Italy
Part	3696	Part S10X001458 Not Found	Mario Colli	Italy
Part	3700	Part S10X001451 Not Found	Georges Delaville	France
Part	3708	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	3710	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	3716	Part S10X001455 Not Found	Mario Colli	Italy
Part	3722	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	3728	Part S10X001458 Not Found	Jan Muller	Germany
Part	3731	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	3740	Part S10X001456 Not Found	Mario Colli	Italy
Part	3741	Part S10X001454 Not Found	Mario Colli	Italy
Part	3745	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	3750	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	3755	Part S10X001455 Not Found	Frank Chemoul	France
Part	3759	Part S10X001458 Not Found	Georges Delaville	France
Part	3762	Part S10X001454 Not Found	Georges Delaville	France
Part	3769	Part S10X001459 Not Found	Jan Muller	Germany
Part	3771	Part S10X001454 Not Found	Mario Colli	Italy
Part	3779	Part S10X001451 Not Found	Jan Muller	Germany
Part	3786	Part S10X001455 Not Found	Frank Chemoul	France
Part	3788	Part S10X001456 Not Found	Frank Chemoul	France
Part	3804	Part S10X001459 Not Found	Frank Chemoul	France
Part	3806	Part S10X001451 Not Found	Mario Colli	Italy
Part	3807	Part S10X001459 Not Found	Mario Colli	Italy
Part	3811	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	3819	Part S10X001452 Not Found	Georges Delaville	France
Part	3829	Part S10X001451 Not Found	Victoria Adams	Italy
Part	3840	Part S10X001460 Not Found	Mario Colli	Italy
Part	3841	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	3851	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	3856	Part S10X001451 Not Found	Maria Martin	France
Part	3858	Part S10X001459 Not Found	Maria Martin	France
Part	3871	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	3872	Part S10X001457 Not Found	Frank Chemoul	France
Part	3875	Part S10X001451 Not Found	Frank Chemoul	France
Part	3885	Part S10X001459 Not Found	Georges Delaville	France
Part	3893	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	3895	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	3901	Part S10X001460 Not Found	Frank Chemoul	France
Part	3913	Part S10X001457 Not Found	Maria Martin	France
Part	3915	Part S10X001456 Not Found	Maria Martin	France
Part	3916	Part S10X001457 Not Found	Maria Martin	France
Part	3917	Part S10X001453 Not Found	Maria Martin	France
Part	3920	Part S10X001457 Not Found	Jan Muller	Germany
Part	3924	Part S10X001460 Not Found	Maria Martin	France
Part	3927	Part S10X001452 Not Found	Maria Martin	France
Part	3928	Part S10X001458 Not Found	Maria Martin	France
Part	3931	Part S10X001459 Not Found	Victoria Adams	Italy
Part	3937	Part S10X001455 Not Found	Maria Martin	France
Part	3944	Part S10X001451 Not Found	Mario Colli	Italy
Part	3949	Part S10X001460 Not Found	Georges Delaville	France
Part	3953	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	3955	Part S10X001460 Not Found	Jan Muller	Germany
Part	3956	Part S10X001459 Not Found	Jan Muller	Germany
Part	3957	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	3970	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	3973	Part S10X001451 Not Found	Jan Muller	Germany
Part	3974	Part S10X001457 Not Found	Jan Muller	Germany
Part	4005	Part S10X001460 Not Found	Frank Chemoul	France
Part	4011	Part S10X001455 Not Found	Georges Delaville	France
Part	4012	Part S10X001460 Not Found	Georges Delaville	France
Part	4016	Part S10X001458 Not Found	Maria Martin	France
Part	4023	Part S10X001460 Not Found	Mario Colli	Italy
Part	4025	Part S10X001452 Not Found	Frank Chemoul	France
Part	4033	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	4038	Part S10X001459 Not Found	Frank Chemoul	France
Part	4039	Part S10X001458 Not Found	Frank Chemoul	France
Part	4040	Part S10X001452 Not Found	Jan Muller	Germany
Part	4044	Part S10X001458 Not Found	Jan Muller	Germany
Part	4046	Part S10X001455 Not Found	Jan Muller	Germany
Part	4051	Part S10X001457 Not Found	Frank Chemoul	France
Part	4055	Part S10X001460 Not Found	Mario Colli	Italy
Part	4082	Part S10X001460 Not Found	Georges Delaville	France
Part	4087	Part S10X001458 Not Found	Mario Colli	Italy
Part	4098	Part S10X001454 Not Found	Frank Chemoul	France
Part	4100	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	4102	Part S10X001455 Not Found	Maria Martin	France
Part	4127	Part S10X001460 Not Found	Mario Colli	Italy
Part	4130	Part S10X001458 Not Found	Mario Colli	Italy
Part	4131	Part S10X001456 Not Found	Mario Colli	Italy
Part	4145	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	4148	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	4149	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	4152	Part S10X001459 Not Found	Frank Chemoul	France
Part	4154	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	4162	Part S10X001453 Not Found	Jan Muller	Germany
Part	4174	Part S10X001451 Not Found	Maria Martin	France
Part	4179	Part S10X001455 Not Found	Victoria Adams	Italy
Part	4182	Part S10X001452 Not Found	Victoria Adams	Italy
Part	4184	Part S10X001458 Not Found	Victoria Adams	Italy
Part	4185	Part S10X001457 Not Found	Maria Martin	France
Part	4190	Part S10X001455 Not Found	Maria Martin	France
Part	4193	Part S10X001455 Not Found	Frank Chemoul	France
Part	4194	Part S10X001459 Not Found	Mario Colli	Italy
Part	4196	Part S10X001454 Not Found	Mario Colli	Italy
Part	4197	Part S10X001456 Not Found	Jan Muller	Germany
Part	4199	Part S10X001460 Not Found	Georges Delaville	France
Part	4205	Part S10X001454 Not Found	Jan Muller	Germany
Part	4207	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	4209	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	4213	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	4214	Part S10X001452 Not Found	Mario Colli	Italy
Part	4217	Part S10X001451 Not Found	Mario Colli	Italy
Part	4222	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	4231	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	4235	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	4241	Part S10X001452 Not Found	Mario Colli	Italy
Part	4242	Part S10X001453 Not Found	Mario Colli	Italy
Part	4246	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	4254	Part S10X001456 Not Found	Frank Chemoul	France
Part	4259	Part S10X001459 Not Found	Georges Delaville	France
Part	4264	Part S10X001455 Not Found	Georges Delaville	France
Part	4267	Part S10X001455 Not Found	Maria Martin	France
Part	4269	Part S10X001453 Not Found	Jan Muller	Germany
Part	4275	Part S10X001457 Not Found	Frank Chemoul	France
Part	4281	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	4288	Part S10X001460 Not Found	Frank Chemoul	France
Part	4298	Part S10X001451 Not Found	Jan Muller	Germany
Part	4302	Part S10X001454 Not Found	Frank Chemoul	France
Part	4304	Part S10X001460 Not Found	Frank Chemoul	France
Part	4309	Part S10X001454 Not Found	Mario Colli	Italy
Part	4311	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	4317	Part S10X001453 Not Found	Georges Delaville	France
Part	4318	Part S10X001455 Not Found	Georges Delaville	France
Part	4322	Part S10X001459 Not Found	Frank Chemoul	France
Part	4327	Part S10X001453 Not Found	Victoria Adams	Italy
Part	4335	Part S10X001457 Not Found	Georges Delaville	France
Part	4336	Part S10X001454 Not Found	Mario Colli	Italy
Part	4343	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	4350	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	4354	Part S10X001454 Not Found	Maria Martin	France
Part	4363	Part S10X001457 Not Found	Mario Colli	Italy
Part	4371	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	4375	Part S10X001453 Not Found	Frank Chemoul	France
Part	4377	Part S10X001452 Not Found	Mario Colli	Italy
Part	4381	Part S10X001454 Not Found	Mario Colli	Italy
Part	4396	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	4397	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	4399	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	4402	Part S10X001452 Not Found	Frank Chemoul	France
Part	4405	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	4408	Part S10X001458 Not Found	Jan Muller	Germany
Part	4421	Part S10X001454 Not Found	Maria Martin	France
Part	4423	Part S10X001451 Not Found	Maria Martin	France
Part	4425	Part S10X001454 Not Found	Maria Martin	France
Part	4427	Part S10X001456 Not Found	Maria Martin	France
Part	4428	Part S10X001460 Not Found	Maria Martin	France
Part	4443	Part S10X001459 Not Found	Frank Chemoul	France
Part	4446	Part S10X001456 Not Found	Mario Colli	Italy
Part	4450	Part S10X001455 Not Found	Georges Delaville	France
Part	4467	Part S10X001454 Not Found	Mario Colli	Italy
Part	4469	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	4474	Part S10X001459 Not Found	Jan Muller	Germany
Part	4476	Part S10X001455 Not Found	Jan Muller	Germany
Part	4478	Part S10X001458 Not Found	Jan Muller	Germany
Part	4479	Part S10X001454 Not Found	Jan Muller	Germany
Part	4483	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	4497	Part S10X001456 Not Found	Mario Colli	Italy
Part	4498	Part S10X001457 Not Found	Mario Colli	Italy
Part	4508	Part S10X001452 Not Found	Frank Chemoul	France
Part	4520	Part S10X001455 Not Found	Mario Colli	Italy
Part	4522	Part S10X001455 Not Found	Mario Colli	Italy
Part	4524	Part S10X001460 Not Found	Frank Chemoul	France
Part	4535	Part S10X001451 Not Found	Frank Chemoul	France
Part	4540	Part S10X001456 Not Found	Jan Muller	Germany
Part	4544	Part S10X001460 Not Found	Jan Muller	Germany
Part	4545	Part S10X001460 Not Found	Jan Muller	Germany
Part	4556	Part S10X001452 Not Found	Mario Colli	Italy
Part	4557	Part S10X001458 Not Found	Mario Colli	Italy
Part	4558	Part S10X001453 Not Found	Mario Colli	Italy
Part	4562	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	4568	Part S10X001452 Not Found	Georges Delaville	France
Part	4569	Part S10X001460 Not Found	Georges Delaville	France
Part	4573	Part S10X001454 Not Found	Frank Chemoul	France
Part	4577	Part S10X001453 Not Found	Victoria Adams	Italy
Part	4578	Part S10X001455 Not Found	Victoria Adams	Italy
Part	4583	Part S10X001457 Not Found	Georges Delaville	France
Part	4585	Part S10X001459 Not Found	Georges Delaville	France
Part	4587	Part S10X001453 Not Found	Mario Colli	Italy
Part	4589	Part S10X001460 Not Found	Mario Colli	Italy
Part	4605	Part S10X001453 Not Found	Maria Martin	France
Part	4610	Part S10X001456 Not Found	Maria Martin	France
Part	4634	Part S10X001460 Not Found	Georges Delaville	France
Part	4635	Part S10X001460 Not Found	Georges Delaville	France
Part	4640	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	4654	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	4655	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	4670	Part S10X001451 Not Found	Jan Muller	Germany
Part	4674	Part S10X001456 Not Found	Maria Martin	France
Part	4675	Part S10X001451 Not Found	Maria Martin	France
Part	4681	Part S10X001452 Not Found	Victoria Adams	Italy
Part	4692	Part S10X001457 Not Found	Frank Chemoul	France
Part	4694	Part S10X001452 Not Found	Mario Colli	Italy
Part	4709	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	4710	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	4716	Part S10X001452 Not Found	Mario Colli	Italy
Part	4726	Part S10X001456 Not Found	Jan Muller	Germany
Part	4729	Part S10X001452 Not Found	Jan Muller	Germany
Part	4737	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	4742	Part S10X001453 Not Found	Mario Colli	Italy
Part	4749	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	4754	Part S10X001459 Not Found	Frank Chemoul	France
Part	4757	Part S10X001456 Not Found	Frank Chemoul	France
Part	4768	Part S10X001455 Not Found	Jan Muller	Germany
Part	4771	Part S10X001453 Not Found	Mario Colli	Italy
Date	4774	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	4776	Part S10X001455 Not Found	Frank Chemoul	France
Part	4779	Part S10X001456 Not Found	Jan Muller	Germany
Date	4781	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	4782	Part S10X001454 Not Found	Rudi Projnow	Germany
Date	4783	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	4789	Part S10X001458 Not Found	Frank Chemoul	France
Part	4791	Part S10X001452 Not Found	Jan Muller	Germany
Part	4792	Part S10X001457 Not Found	Jan Muller	Germany
Date	4800	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	4804	Part S10X001455 Not Found	Frank Chemoul	France
Part	4810	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	4817	Part S10X001459 Not Found	Georges Delaville	France
Part	4818	Part S10X001456 Not Found	Georges Delaville	France
Part	4819	Part S10X001454 Not Found	Georges Delaville	France
Part	4821	Part S10X001454 Not Found	Frank Chemoul	France
Part	4823	Part S10X001456 Not Found	Frank Chemoul	France
Part	4827	Part S10X001455 Not Found	Victoria Adams	Italy
Part	4830	Part S10X001458 Not Found	Victoria Adams	Italy
Date	4831	Date 2011-12-01 Not Found	Georges Delaville	France
Part	4832	Part S10X001454 Not Found	Georges Delaville	France
Date	4833	Date 2011-12-01 Not Found	Georges Delaville	France
Part	4834	Part S10X001460 Not Found	Georges Delaville	France
Part	4835	Part S10X001454 Not Found	Georges Delaville	France
Date	4840	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	4845	Part S10X001454 Not Found	Frank Chemoul	France
Date	4847	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	4848	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	4850	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	4851	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	4855	Part S10X001459 Not Found	Maria Martin	France
Part	4867	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	4869	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	4870	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	4871	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	4872	Part S10X001454 Not Found	Frank Chemoul	France
Part	4878	Part S10X001457 Not Found	Mario Colli	Italy
Part	4880	Part S10X001456 Not Found	Mario Colli	Italy
Part	4886	Part S10X001451 Not Found	Georges Delaville	France
Part	4887	Part S10X001451 Not Found	Georges Delaville	France
Date	4889	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	4893	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	4897	Part S10X001457 Not Found	Rudi Projnow	Germany
Date	4898	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	4899	Part S10X001454 Not Found	Rudi Projnow	Germany
Date	4900	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	4904	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	4905	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	4906	Part S10X001456 Not Found	Jan Muller	Germany
Part	4907	Part S10X001458 Not Found	Jan Muller	Germany
Part	4908	Part S10X001452 Not Found	Jan Muller	Germany
Date	4925	Date 2011-12-01 Not Found	Maria Martin	France
Part	4927	Part S10X001459 Not Found	Maria Martin	France
Date	4929	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	4930	Part S10X001458 Not Found	Victoria Adams	Italy
Part	4936	Part S10X001457 Not Found	Maria Martin	France
Part	4948	Part S10X001452 Not Found	Jan Muller	Germany
Date	4949	Date 2011-12-01 Not Found	Georges Delaville	France
Part	4954	Part S10X001460 Not Found	Jan Muller	Germany
Part	4955	Part S10X001454 Not Found	Jan Muller	Germany
Part	4956	Part S10X001455 Not Found	Jan Muller	Germany
Date	4959	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	4963	Part S10X001456 Not Found	Rudi Projnow	Germany
Date	4965	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	4970	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	4973	Part S10X001455 Not Found	Jan Muller	Germany
Part	4974	Part S10X001452 Not Found	Jan Muller	Germany
Part	4976	Part S10X001455 Not Found	Jan Muller	Germany
Part	4977	Part S10X001459 Not Found	Jan Muller	Germany
Part	4978	Part S10X001452 Not Found	Jan Muller	Germany
Part	4992	Part S10X001457 Not Found	Mario Colli	Italy
Date	4993	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	4999	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	5001	Part S10X001453 Not Found	Mario Colli	Italy
Date	5005	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	5011	Date 2011-12-01 Not Found	Georges Delaville	France
Date	5016	Date 2011-12-01 Not Found	Maria Martin	France
Part	5018	Part S10X001460 Not Found	Jan Muller	Germany
Part	5022	Part S10X001453 Not Found	Mario Colli	Italy
Part	5024	Part S10X001454 Not Found	Frank Chemoul	France
Part	5029	Part S10X001456 Not Found	Jan Muller	Germany
Part	5030	Part S10X001452 Not Found	Jan Muller	Germany
Date	5033	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	5039	Part S10X001453 Not Found	Frank Chemoul	France
Part	5041	Part S10X001460 Not Found	Jan Muller	Germany
Date	5043	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	5052	Part S10X001454 Not Found	Frank Chemoul	France
Date	5053	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5054	Part S10X001457 Not Found	Frank Chemoul	France
Part	5057	Part S10X001451 Not Found	Mario Colli	Italy
Part	5058	Part S10X001453 Not Found	Mario Colli	Italy
Part	5061	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	5063	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	5065	Part S10X001453 Not Found	Georges Delaville	France
Part	5069	Part S10X001459 Not Found	Georges Delaville	France
Part	5070	Part S10X001452 Not Found	Frank Chemoul	France
Part	5071	Part S10X001456 Not Found	Frank Chemoul	France
Date	5072	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5074	Part S10X001453 Not Found	Martin Lemieux	France
Part	5079	Part S10X001453 Not Found	Victoria Adams	Italy
Part	5083	Part S10X001458 Not Found	Georges Delaville	France
Part	5084	Part S10X001451 Not Found	Georges Delaville	France
Part	5086	Part S10X001455 Not Found	Mario Colli	Italy
Date	5100	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	5101	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	5104	Part S10X001451 Not Found	Maria Martin	France
Part	5107	Part S10X001459 Not Found	Maria Martin	France
Part	5108	Part S10X001457 Not Found	Maria Martin	France
Part	5112	Part S10X001453 Not Found	Mario Colli	Italy
Date	5113	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5114	Part S10X001459 Not Found	Mario Colli	Italy
Part	5116	Part S10X001453 Not Found	Mario Colli	Italy
Part	5121	Part S10X001451 Not Found	Luigi Massimo	Italy
Date	5122	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5123	Part S10X001453 Not Found	Frank Chemoul	France
Part	5125	Part S10X001454 Not Found	Frank Chemoul	France
Part	5132	Part S10X001453 Not Found	Mario Colli	Italy
Date	5135	Date 2011-12-01 Not Found	Georges Delaville	France
Date	5136	Date 2011-12-01 Not Found	Georges Delaville	France
Part	5141	Part S10X001452 Not Found	Luigi Massimo	Italy
Date	5148	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	5150	Part S10X001454 Not Found	Frank Chemoul	France
Part	5158	Part S10X001457 Not Found	Jan Muller	Germany
Part	5159	Part S10X001456 Not Found	Jan Muller	Germany
Part	5160	Part S10X001452 Not Found	Jan Muller	Germany
Part	5165	Part S10X001451 Not Found	Maria Martin	France
Part	5169	Part S10X001460 Not Found	Jan Muller	Germany
Part	5171	Part S10X001451 Not Found	Maria Martin	France
Date	5172	Date 2011-12-01 Not Found	Maria Martin	France
Date	5179	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	5185	Part S10X001455 Not Found	Maria Martin	France
Date	5191	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	5204	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	5215	Part S10X001458 Not Found	Mario Colli	Italy
Part	5216	Part S10X001452 Not Found	Mario Colli	Italy
Part	5217	Part S10X001453 Not Found	Mario Colli	Italy
Part	5223	Part S10X001451 Not Found	Jan Muller	Germany
Date	5225	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	5228	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	5233	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5236	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	5238	Part S10X001454 Not Found	Mario Colli	Italy
Date	5239	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5241	Part S10X001451 Not Found	Mario Colli	Italy
Date	5245	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5247	Part S10X001458 Not Found	Mario Colli	Italy
Part	5251	Part S10X001457 Not Found	Mario Colli	Italy
Part	5252	Part S10X001453 Not Found	Victoria Adams	Italy
Part	5254	Part S10X001457 Not Found	Frank Chemoul	France
Part	5255	Part S10X001456 Not Found	Frank Chemoul	France
Part	5257	Part S10X001452 Not Found	Frank Chemoul	France
Part	5261	Part S10X001455 Not Found	Georges Delaville	France
Part	5266	Part S10X001454 Not Found	Maria Martin	France
Part	5269	Part S10X001458 Not Found	Jan Muller	Germany
Part	5271	Part S10X001457 Not Found	Mario Colli	Italy
Part	5276	Part S10X001454 Not Found	Frank Chemoul	France
Date	5278	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	5279	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	5280	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	5285	Part S10X001459 Not Found	Frank Chemoul	France
Part	5286	Part S10X001453 Not Found	Frank Chemoul	France
Part	5287	Part S10X001458 Not Found	Frank Chemoul	France
Part	5290	Part S10X001458 Not Found	Jan Muller	Germany
Date	5291	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	5292	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	5294	Part S10X001456 Not Found	Jan Muller	Germany
Part	5295	Part S10X001451 Not Found	Jan Muller	Germany
Part	5299	Part S10X001452 Not Found	Jan Muller	Germany
Part	5302	Part S10X001452 Not Found	Frank Chemoul	France
Part	5307	Part S10X001455 Not Found	Mario Colli	Italy
Part	5308	Part S10X001452 Not Found	Mario Colli	Italy
Part	5314	Part S10X001453 Not Found	Georges Delaville	France
Part	5316	Part S10X001460 Not Found	Georges Delaville	France
Date	5319	Date 2011-12-01 Not Found	Georges Delaville	France
Part	5320	Part S10X001455 Not Found	Frank Chemoul	France
Date	5323	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5326	Part S10X001458 Not Found	Martin Lemieux	France
Part	5333	Part S10X001460 Not Found	Georges Delaville	France
Part	5336	Part S10X001456 Not Found	Mario Colli	Italy
Part	5337	Part S10X001459 Not Found	Mario Colli	Italy
Part	5342	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	5344	Part S10X001455 Not Found	Frank Chemoul	France
Part	5349	Part S10X001455 Not Found	Rudi Projnow	Germany
Date	5354	Date 2011-12-01 Not Found	Maria Martin	France
Part	5358	Part S10X001457 Not Found	Maria Martin	France
Part	5359	Part S10X001452 Not Found	Maria Martin	France
Part	5360	Part S10X001454 Not Found	Maria Martin	France
Part	5362	Part S10X001455 Not Found	Mario Colli	Italy
Part	5366	Part S10X001458 Not Found	Mario Colli	Italy
Part	5374	Part S10X001460 Not Found	Frank Chemoul	France
Part	5375	Part S10X001456 Not Found	Frank Chemoul	France
Part	5377	Part S10X001454 Not Found	Mario Colli	Italy
Part	5378	Part S10X001454 Not Found	Mario Colli	Italy
Part	5380	Part S10X001458 Not Found	Mario Colli	Italy
Part	5381	Part S10X001457 Not Found	Mario Colli	Italy
Part	5387	Part S10X001457 Not Found	Georges Delaville	France
Part	5395	Part S10X001453 Not Found	Rudi Projnow	Germany
Part	5398	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	5400	Part S10X001454 Not Found	Frank Chemoul	France
Part	5405	Part S10X001454 Not Found	Luigi Massimo	Italy
Date	5407	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	5412	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	5413	Part S10X001451 Not Found	Maria Martin	France
Part	5415	Part S10X001453 Not Found	Maria Martin	France
Part	5424	Part S10X001457 Not Found	Maria Martin	France
Part	5428	Part S10X001456 Not Found	Maria Martin	France
Part	5430	Part S10X001458 Not Found	Victoria Adams	Italy
Part	5438	Part S10X001451 Not Found	Maria Martin	France
Part	5439	Part S10X001455 Not Found	Maria Martin	France
Part	5442	Part S10X001458 Not Found	Frank Chemoul	France
Date	5449	Date 2011-12-01 Not Found	Georges Delaville	France
Part	5463	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	5471	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	5476	Part S10X001458 Not Found	Jan Muller	Germany
Date	5485	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	5490	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5501	Part S10X001455 Not Found	Mario Colli	Italy
Date	5503	Date 2011-12-01 Not Found	Victoria Adams	Italy
Date	5504	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5513	Part S10X001456 Not Found	Georges Delaville	France
Part	5514	Part S10X001451 Not Found	Georges Delaville	France
Date	5519	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	5522	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5526	Part S10X001451 Not Found	Frank Chemoul	France
Part	5528	Part S10X001451 Not Found	Frank Chemoul	France
Part	5529	Part S10X001458 Not Found	Jan Muller	Germany
Date	5531	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	5537	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	5538	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5548	Part S10X001456 Not Found	Jan Muller	Germany
Part	5549	Part S10X001458 Not Found	Jan Muller	Germany
Date	5554	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5555	Part S10X001452 Not Found	Mario Colli	Italy
Date	5556	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5557	Part S10X001458 Not Found	Mario Colli	Italy
Part	5558	Part S10X001452 Not Found	Mario Colli	Italy
Part	5559	Part S10X001454 Not Found	Mario Colli	Italy
Part	5562	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	5569	Part S10X001457 Not Found	Georges Delaville	France
Date	5571	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5581	Part S10X001452 Not Found	Georges Delaville	France
Part	5583	Part S10X001454 Not Found	Georges Delaville	France
Part	5584	Part S10X001456 Not Found	Georges Delaville	France
Part	5586	Part S10X001452 Not Found	Mario Colli	Italy
Date	5587	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	5588	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	5589	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	5595	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5596	Part S10X001459 Not Found	Frank Chemoul	France
Part	5598	Part S10X001455 Not Found	Frank Chemoul	France
Part	5599	Part S10X001458 Not Found	Rudi Projnow	Germany
Date	5607	Date 2011-12-01 Not Found	Maria Martin	France
Part	5609	Part S10X001451 Not Found	Maria Martin	France
Part	5615	Part S10X001454 Not Found	Mario Colli	Italy
Date	5616	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5625	Part S10X001451 Not Found	Frank Chemoul	France
Part	5626	Part S10X001452 Not Found	Frank Chemoul	France
Date	5627	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5633	Part S10X001460 Not Found	Georges Delaville	France
Part	5634	Part S10X001452 Not Found	Georges Delaville	France
Part	5639	Part S10X001456 Not Found	Luigi Massimo	Italy
Date	5645	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	5646	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	5647	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	5651	Part S10X001458 Not Found	Frank Chemoul	France
Part	5659	Part S10X001460 Not Found	Jan Muller	Germany
Part	5660	Part S10X001460 Not Found	Jan Muller	Germany
Date	5665	Date 2011-12-01 Not Found	Maria Martin	France
Date	5667	Date 2011-12-01 Not Found	Maria Martin	France
Part	5671	Part S10X001458 Not Found	Maria Martin	France
Date	5676	Date 2011-12-01 Not Found	Maria Martin	France
Part	5677	Part S10X001453 Not Found	Maria Martin	France
Date	5678	Date 2011-12-01 Not Found	Maria Martin	France
Part	5679	Part S10X001456 Not Found	Victoria Adams	Italy
Part	5680	Part S10X001455 Not Found	Victoria Adams	Italy
Date	5684	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	5689	Part S10X001452 Not Found	Maria Martin	France
Part	5691	Part S10X001454 Not Found	Frank Chemoul	France
Date	5694	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5697	Part S10X001451 Not Found	Jan Muller	Germany
Part	5699	Part S10X001454 Not Found	Georges Delaville	France
Date	5701	Date 2011-12-01 Not Found	Georges Delaville	France
Part	5705	Part S10X001460 Not Found	Jan Muller	Germany
Part	5706	Part S10X001453 Not Found	Jan Muller	Germany
Part	5710	Part S10X001457 Not Found	Rudi Projnow	Germany
Part	5716	Part S10X001453 Not Found	Mario Colli	Italy
Date	5720	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	5721	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5723	Part S10X001453 Not Found	Jan Muller	Germany
Date	5725	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	5726	Part S10X001458 Not Found	Jan Muller	Germany
Date	5732	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5741	Part S10X001452 Not Found	Mario Colli	Italy
Date	5743	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5745	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	5748	Part S10X001456 Not Found	Mario Colli	Italy
Part	5750	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	5752	Part S10X001453 Not Found	Victoria Adams	Italy
Part	5755	Part S10X001451 Not Found	Frank Chemoul	France
Part	5768	Part S10X001460 Not Found	Jan Muller	Germany
Date	5771	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5774	Part S10X001453 Not Found	Frank Chemoul	France
Date	5775	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	5784	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5786	Part S10X001453 Not Found	Frank Chemoul	France
Part	5792	Part S10X001459 Not Found	Jan Muller	Germany
Part	5793	Part S10X001457 Not Found	Jan Muller	Germany
Part	5798	Part S10X001459 Not Found	Jan Muller	Germany
Part	5800	Part S10X001453 Not Found	Frank Chemoul	France
Part	5802	Part S10X001457 Not Found	Frank Chemoul	France
Date	5803	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	5805	Part S10X001460 Not Found	Mario Colli	Italy
Part	5809	Part S10X001455 Not Found	Mario Colli	Italy
Part	5821	Part S10X001453 Not Found	Frank Chemoul	France
Part	5825	Part S10X001459 Not Found	Martin Lemieux	France
Date	5830	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	5832	Part S10X001455 Not Found	Georges Delaville	France
Date	5838	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	5846	Part S10X001460 Not Found	Frank Chemoul	France
Part	5847	Part S10X001457 Not Found	Frank Chemoul	France
Part	5851	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	5853	Part S10X001456 Not Found	Maria Martin	France
Date	5856	Date 2011-12-01 Not Found	Maria Martin	France
Part	5860	Part S10X001453 Not Found	Maria Martin	France
Part	5861	Part S10X001451 Not Found	Maria Martin	France
Part	5862	Part S10X001457 Not Found	Mario Colli	Italy
Part	5871	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	5877	Part S10X001458 Not Found	Mario Colli	Italy
Part	5879	Part S10X001451 Not Found	Mario Colli	Italy
Part	5883	Part S10X001458 Not Found	Georges Delaville	France
Part	5887	Part S10X001452 Not Found	Georges Delaville	France
Date	5892	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5893	Part S10X001454 Not Found	Rudi Projnow	Germany
Part	5895	Part S10X001453 Not Found	Rudi Projnow	Germany
Date	5899	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	5900	Part S10X001458 Not Found	Frank Chemoul	France
Part	5903	Part S10X001460 Not Found	Luigi Massimo	Italy
Date	5911	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	5912	Part S10X001454 Not Found	Jan Muller	Germany
Date	5913	Date 2011-12-01 Not Found	Maria Martin	France
Part	5914	Part S10X001453 Not Found	Maria Martin	France
Part	5919	Part S10X001451 Not Found	Jan Muller	Germany
Part	5920	Part S10X001453 Not Found	Jan Muller	Germany
Date	5921	Date 2011-12-01 Not Found	Maria Martin	France
Part	5923	Part S10X001458 Not Found	Maria Martin	France
Part	5931	Part S10X001452 Not Found	Victoria Adams	Italy
Date	5933	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	5935	Part S10X001451 Not Found	Maria Martin	France
Part	5947	Part S10X001456 Not Found	Jan Muller	Germany
Part	5952	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	5967	Part S10X001456 Not Found	Mario Colli	Italy
Part	5969	Part S10X001458 Not Found	Luigi Massimo	Italy
Date	5972	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5975	Part S10X001458 Not Found	Jan Muller	Germany
Part	5976	Part S10X001456 Not Found	Jan Muller	Germany
Part	5979	Part S10X001456 Not Found	Jan Muller	Germany
Part	5986	Part S10X001456 Not Found	Rudi Projnow	Germany
Date	5993	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	5997	Part S10X001455 Not Found	Mario Colli	Italy
Date	5999	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	6000	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	6002	Part S10X001454 Not Found	Victoria Adams	Italy
Date	6004	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6007	Part S10X001455 Not Found	Frank Chemoul	France
Part	6012	Part S10X001455 Not Found	Georges Delaville	France
Part	6013	Part S10X001456 Not Found	Georges Delaville	France
Part	6016	Part S10X001452 Not Found	Maria Martin	France
Part	6017	Part S10X001453 Not Found	Maria Martin	France
Part	6019	Part S10X001456 Not Found	Jan Muller	Germany
Part	6020	Part S10X001460 Not Found	Mario Colli	Italy
Part	6022	Part S10X001452 Not Found	Mario Colli	Italy
Date	6028	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6032	Part S10X001452 Not Found	Rudi Projnow	Germany
Date	6034	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	6038	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6042	Part S10X001456 Not Found	Jan Muller	Germany
Part	6045	Part S10X001451 Not Found	Jan Muller	Germany
Part	6050	Part S10X001451 Not Found	Frank Chemoul	France
Part	6053	Part S10X001457 Not Found	Frank Chemoul	France
Date	6061	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	6070	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	6071	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6072	Part S10X001451 Not Found	Frank Chemoul	France
Part	6073	Part S10X001451 Not Found	Frank Chemoul	France
Part	6076	Part S10X001451 Not Found	Martin Lemieux	France
Date	6077	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	6079	Part S10X001456 Not Found	Victoria Adams	Italy
Part	6086	Part S10X001457 Not Found	Mario Colli	Italy
Date	6087	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	6088	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6090	Part S10X001460 Not Found	Mario Colli	Italy
Part	6095	Part S10X001451 Not Found	Frank Chemoul	France
Part	6101	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	6103	Part S10X001456 Not Found	Maria Martin	France
Date	6105	Date 2011-12-01 Not Found	Maria Martin	France
Part	6109	Part S10X001459 Not Found	Maria Martin	France
Part	6113	Part S10X001455 Not Found	Mario Colli	Italy
Part	6123	Part S10X001456 Not Found	Frank Chemoul	France
Part	6126	Part S10X001451 Not Found	Frank Chemoul	France
Part	6127	Part S10X001456 Not Found	Mario Colli	Italy
Part	6129	Part S10X001458 Not Found	Mario Colli	Italy
Part	6131	Part S10X001452 Not Found	Mario Colli	Italy
Part	6134	Part S10X001454 Not Found	Georges Delaville	France
Part	6137	Part S10X001460 Not Found	Georges Delaville	France
Part	6138	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	6139	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	6140	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	6157	Part S10X001457 Not Found	Jan Muller	Germany
Date	6158	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6161	Part S10X001457 Not Found	Jan Muller	Germany
Part	6166	Part S10X001457 Not Found	Maria Martin	France
Date	6167	Date 2011-12-01 Not Found	Maria Martin	France
Part	6168	Part S10X001455 Not Found	Jan Muller	Germany
Date	6169	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6171	Part S10X001453 Not Found	Maria Martin	France
Part	6172	Part S10X001456 Not Found	Maria Martin	France
Date	6174	Date 2011-12-01 Not Found	Maria Martin	France
Part	6176	Part S10X001452 Not Found	Maria Martin	France
Part	6178	Part S10X001457 Not Found	Maria Martin	France
Part	6180	Part S10X001452 Not Found	Victoria Adams	Italy
Part	6183	Part S10X001454 Not Found	Victoria Adams	Italy
Part	6184	Part S10X001456 Not Found	Victoria Adams	Italy
Date	6186	Date 2011-12-01 Not Found	Maria Martin	France
Date	6189	Date 2011-12-01 Not Found	Maria Martin	France
Part	6193	Part S10X001454 Not Found	Frank Chemoul	France
Part	6198	Part S10X001456 Not Found	Jan Muller	Germany
Date	6199	Date 2011-12-01 Not Found	Georges Delaville	France
Part	6200	Part S10X001458 Not Found	Georges Delaville	France
Date	6201	Date 2011-12-01 Not Found	Georges Delaville	France
Part	6206	Part S10X001451 Not Found	Jan Muller	Germany
Part	6211	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	6213	Part S10X001455 Not Found	Rudi Projnow	Germany
Part	6225	Part S10X001452 Not Found	Jan Muller	Germany
Part	6228	Part S10X001452 Not Found	Jan Muller	Germany
Part	6250	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	6255	Part S10X001454 Not Found	Frank Chemoul	France
Date	6256	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6257	Part S10X001456 Not Found	Frank Chemoul	France
Part	6258	Part S10X001451 Not Found	Frank Chemoul	France
Part	6261	Part S10X001458 Not Found	Georges Delaville	France
Part	6265	Part S10X001456 Not Found	Maria Martin	France
Date	6266	Date 2011-12-01 Not Found	Maria Martin	France
Part	6270	Part S10X001459 Not Found	Mario Colli	Italy
Part	6271	Part S10X001460 Not Found	Mario Colli	Italy
Date	6273	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6276	Part S10X001453 Not Found	Frank Chemoul	France
Date	6283	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	6285	Part S10X001459 Not Found	Frank Chemoul	France
Part	6288	Part S10X001455 Not Found	Frank Chemoul	France
Part	6291	Part S10X001452 Not Found	Jan Muller	Germany
Part	6293	Part S10X001456 Not Found	Jan Muller	Germany
Part	6297	Part S10X001451 Not Found	Jan Muller	Germany
Date	6304	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6306	Part S10X001455 Not Found	Mario Colli	Italy
Part	6307	Part S10X001454 Not Found	Mario Colli	Italy
Date	6308	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6309	Part S10X001456 Not Found	Mario Colli	Italy
Part	6310	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	6312	Part S10X001453 Not Found	Luigi Massimo	Italy
Date	6316	Date 2011-12-01 Not Found	Georges Delaville	France
Part	6318	Part S10X001456 Not Found	Georges Delaville	France
Date	6336	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	6343	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	6348	Part S10X001454 Not Found	Frank Chemoul	France
Part	6353	Part S10X001459 Not Found	Maria Martin	France
Part	6354	Part S10X001453 Not Found	Maria Martin	France
Part	6356	Part S10X001454 Not Found	Maria Martin	France
Part	6357	Part S10X001460 Not Found	Maria Martin	France
Part	6358	Part S10X001456 Not Found	Maria Martin	France
Part	6360	Part S10X001455 Not Found	Maria Martin	France
Date	6362	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6363	Part S10X001457 Not Found	Mario Colli	Italy
Part	6368	Part S10X001457 Not Found	Luigi Massimo	Italy
Date	6370	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	6372	Part S10X001452 Not Found	Frank Chemoul	France
Part	6380	Part S10X001460 Not Found	Mario Colli	Italy
Part	6382	Part S10X001459 Not Found	Mario Colli	Italy
Date	6383	Date 2011-12-01 Not Found	Georges Delaville	France
Part	6390	Part S10X001455 Not Found	Luigi Massimo	Italy
Date	6396	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	6407	Part S10X001458 Not Found	Jan Muller	Germany
Part	6411	Part S10X001454 Not Found	Jan Muller	Germany
Date	6418	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	6419	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6420	Part S10X001453 Not Found	Jan Muller	Germany
Part	6421	Part S10X001454 Not Found	Maria Martin	France
Part	6425	Part S10X001452 Not Found	Maria Martin	France
Part	6426	Part S10X001458 Not Found	Maria Martin	France
Part	6431	Part S10X001457 Not Found	Victoria Adams	Italy
Part	6432	Part S10X001457 Not Found	Victoria Adams	Italy
Part	6438	Part S10X001455 Not Found	Maria Martin	France
Part	6445	Part S10X001460 Not Found	Mario Colli	Italy
Part	6449	Part S10X001456 Not Found	Georges Delaville	France
Part	6451	Part S10X001454 Not Found	Georges Delaville	France
Date	6456	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	6457	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	6460	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	6461	Part S10X001452 Not Found	Rudi Projnow	Germany
Date	6472	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	6474	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	6476	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	6485	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	6490	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6493	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	6498	Part S10X001455 Not Found	Mario Colli	Italy
Date	6501	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6506	Part S10X001457 Not Found	Frank Chemoul	France
Part	6507	Part S10X001460 Not Found	Frank Chemoul	France
Part	6510	Part S10X001456 Not Found	Georges Delaville	France
Part	6511	Part S10X001451 Not Found	Georges Delaville	France
Part	6513	Part S10X001457 Not Found	Georges Delaville	France
Part	6518	Part S10X001459 Not Found	Jan Muller	Germany
Part	6519	Part S10X001451 Not Found	Jan Muller	Germany
Part	6520	Part S10X001455 Not Found	Mario Colli	Italy
Part	6522	Part S10X001460 Not Found	Mario Colli	Italy
Part	6523	Part S10X001458 Not Found	Mario Colli	Italy
Part	6551	Part S10X001459 Not Found	Frank Chemoul	France
Date	6552	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6554	Part S10X001451 Not Found	Frank Chemoul	France
Date	6558	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6564	Part S10X001455 Not Found	Georges Delaville	France
Date	6567	Date 2011-12-01 Not Found	Georges Delaville	France
Part	6569	Part S10X001452 Not Found	Georges Delaville	France
Date	6570	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	6574	Date 2011-12-01 Not Found	Martin Lemieux	France
Part	6576	Part S10X001453 Not Found	Martin Lemieux	France
Part	6579	Part S10X001452 Not Found	Victoria Adams	Italy
Part	6580	Part S10X001452 Not Found	Victoria Adams	Italy
Part	6583	Part S10X001451 Not Found	Georges Delaville	France
Date	6585	Date 2011-12-01 Not Found	Georges Delaville	France
Date	6586	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	6595	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	6596	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6610	Part S10X001451 Not Found	Maria Martin	France
Part	6614	Part S10X001451 Not Found	Mario Colli	Italy
Part	6615	Part S10X001451 Not Found	Mario Colli	Italy
Part	6616	Part S10X001453 Not Found	Mario Colli	Italy
Date	6619	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	6620	Part S10X001451 Not Found	Luigi Massimo	Italy
Date	6628	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6631	Part S10X001460 Not Found	Mario Colli	Italy
Part	6650	Part S10X001455 Not Found	Frank Chemoul	France
Date	6651	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6653	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	6660	Part S10X001460 Not Found	Jan Muller	Germany
Part	6662	Part S10X001459 Not Found	Jan Muller	Germany
Date	6668	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6670	Part S10X001457 Not Found	Jan Muller	Germany
Part	6672	Part S10X001455 Not Found	Maria Martin	France
Part	6685	Part S10X001457 Not Found	Maria Martin	France
Part	6686	Part S10X001458 Not Found	Maria Martin	France
Part	6687	Part S10X001456 Not Found	Maria Martin	France
Part	6691	Part S10X001455 Not Found	Frank Chemoul	France
Part	6692	Part S10X001453 Not Found	Frank Chemoul	France
Date	6694	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6712	Part S10X001455 Not Found	Rudi Projnow	Germany
Date	6717	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6725	Part S10X001456 Not Found	Jan Muller	Germany
Part	6730	Part S10X001459 Not Found	Luigi Massimo	Italy
Part	6733	Part S10X001460 Not Found	Luigi Massimo	Italy
Date	6734	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	6738	Part S10X001459 Not Found	Mario Colli	Italy
Part	6739	Part S10X001452 Not Found	Mario Colli	Italy
Part	6742	Part S10X001458 Not Found	Mario Colli	Italy
Date	6745	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	6748	Part S10X001456 Not Found	Mario Colli	Italy
Part	6752	Part S10X001451 Not Found	Victoria Adams	Italy
Part	6755	Part S10X001459 Not Found	Frank Chemoul	France
Part	6756	Part S10X001452 Not Found	Frank Chemoul	France
Part	6768	Part S10X001454 Not Found	Jan Muller	Germany
Date	6770	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6777	Part S10X001460 Not Found	Frank Chemoul	France
Part	6778	Part S10X001458 Not Found	Frank Chemoul	France
Part	6780	Part S10X001451 Not Found	Jan Muller	Germany
Date	6782	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	6784	Part S10X001452 Not Found	Frank Chemoul	France
Part	6787	Part S10X001454 Not Found	Frank Chemoul	France
Date	6790	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6791	Part S10X001455 Not Found	Jan Muller	Germany
Part	6800	Part S10X001457 Not Found	Frank Chemoul	France
Date	6801	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	6806	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	6807	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	6814	Date 2011-12-01 Not Found	Georges Delaville	France
Date	6815	Date 2011-12-01 Not Found	Georges Delaville	France
Date	6825	Date 2011-12-01 Not Found	Martin Lemieux	France
Part	6830	Part S10X001455 Not Found	Victoria Adams	Italy
Part	6833	Part S10X001456 Not Found	Georges Delaville	France
Date	6834	Date 2011-12-01 Not Found	Georges Delaville	France
Part	6839	Part S10X001459 Not Found	Mario Colli	Italy
Part	6840	Part S10X001453 Not Found	Mario Colli	Italy
Date	6842	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	6843	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Date	6844	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	6848	Part S10X001454 Not Found	Frank Chemoul	France
Part	6849	Part S10X001460 Not Found	Rudi Projnow	Germany
Date	6852	Date 2011-12-01 Not Found	Maria Martin	France
Part	6855	Part S10X001456 Not Found	Maria Martin	France
Date	6858	Date 2011-12-01 Not Found	Maria Martin	France
Part	6860	Part S10X001458 Not Found	Maria Martin	France
Part	6873	Part S10X001457 Not Found	Frank Chemoul	France
Part	6877	Part S10X001453 Not Found	Mario Colli	Italy
Date	6882	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6890	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	6906	Part S10X001459 Not Found	Jan Muller	Germany
Date	6907	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6911	Part S10X001459 Not Found	Jan Muller	Germany
Part	6912	Part S10X001452 Not Found	Jan Muller	Germany
Part	6916	Part S10X001453 Not Found	Maria Martin	France
Part	6921	Part S10X001459 Not Found	Maria Martin	France
Date	6923	Date 2011-12-01 Not Found	Maria Martin	France
Part	6925	Part S10X001458 Not Found	Maria Martin	France
Part	6930	Part S10X001455 Not Found	Victoria Adams	Italy
Date	6932	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	6935	Part S10X001459 Not Found	Maria Martin	France
Date	6936	Date 2011-12-01 Not Found	Maria Martin	France
Part	6937	Part S10X001459 Not Found	Maria Martin	France
Date	6938	Date 2011-12-01 Not Found	Maria Martin	France
Date	6940	Date 2011-12-01 Not Found	Maria Martin	France
Date	6947	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6955	Part S10X001460 Not Found	Jan Muller	Germany
Part	6957	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	6959	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	6961	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	6972	Part S10X001453 Not Found	Luigi Massimo	Italy
Date	6974	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	6977	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	6981	Part S10X001457 Not Found	Luigi Massimo	Italy
Date	6984	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	6986	Part S10X001452 Not Found	Rudi Projnow	Germany
Date	6989	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	6991	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	6995	Part S10X001456 Not Found	Luigi Massimo	Italy
Part	6999	Part S10X001456 Not Found	Luigi Massimo	Italy
Date	7005	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	7008	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7009	Part S10X001457 Not Found	Georges Delaville	France
Part	7012	Part S10X001455 Not Found	Georges Delaville	France
Part	7013	Part S10X001454 Not Found	Georges Delaville	France
Part	7017	Part S10X001456 Not Found	Maria Martin	France
Part	7024	Part S10X001456 Not Found	Frank Chemoul	France
Date	7027	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	7028	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	7031	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	7036	Part S10X001458 Not Found	Frank Chemoul	France
Part	7037	Part S10X001458 Not Found	Frank Chemoul	France
Date	7041	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	7042	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	7045	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	7047	Part S10X001455 Not Found	Jan Muller	Germany
Part	7048	Part S10X001455 Not Found	Jan Muller	Germany
Part	7050	Part S10X001455 Not Found	Frank Chemoul	France
Part	7051	Part S10X001453 Not Found	Frank Chemoul	France
Part	7053	Part S10X001456 Not Found	Frank Chemoul	France
Part	7056	Part S10X001460 Not Found	Mario Colli	Italy
Part	7065	Part S10X001458 Not Found	Georges Delaville	France
Part	7067	Part S10X001456 Not Found	Georges Delaville	France
Part	7070	Part S10X001457 Not Found	Frank Chemoul	France
Part	7077	Part S10X001458 Not Found	Victoria Adams	Italy
Part	7078	Part S10X001451 Not Found	Victoria Adams	Italy
Part	7082	Part S10X001457 Not Found	Georges Delaville	France
Date	7088	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	7090	Part S10X001453 Not Found	Mario Colli	Italy
Part	7100	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	7105	Part S10X001454 Not Found	Maria Martin	France
Part	7106	Part S10X001460 Not Found	Maria Martin	France
Part	7107	Part S10X001453 Not Found	Maria Martin	France
Part	7108	Part S10X001459 Not Found	Maria Martin	France
Date	7114	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	7119	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	7124	Part S10X001460 Not Found	Frank Chemoul	France
Part	7125	Part S10X001455 Not Found	Frank Chemoul	France
Part	7145	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	7153	Part S10X001460 Not Found	Luigi Massimo	Italy
Date	7154	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	7159	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	7160	Part S10X001460 Not Found	Jan Muller	Germany
Part	7167	Part S10X001453 Not Found	Maria Martin	France
Part	7168	Part S10X001457 Not Found	Jan Muller	Germany
Part	7176	Part S10X001457 Not Found	Maria Martin	France
Part	7182	Part S10X001458 Not Found	Victoria Adams	Italy
Date	7184	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	7186	Part S10X001459 Not Found	Maria Martin	France
Part	7189	Part S10X001454 Not Found	Maria Martin	France
Part	7191	Part S10X001452 Not Found	Frank Chemoul	France
Part	7194	Part S10X001458 Not Found	Mario Colli	Italy
Date	7195	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	7203	Part S10X001458 Not Found	Rudi Projnow	Germany
Part	7205	Part S10X001454 Not Found	Jan Muller	Germany
Part	7213	Part S10X001460 Not Found	Rudi Projnow	Germany
Date	7214	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	7217	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	7218	Part S10X001455 Not Found	Mario Colli	Italy
Part	7219	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	7227	Part S10X001451 Not Found	Jan Muller	Germany
Part	7233	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	7242	Part S10X001459 Not Found	Mario Colli	Italy
Part	7243	Part S10X001457 Not Found	Luigi Massimo	Italy
Date	7249	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	7255	Part S10X001458 Not Found	Frank Chemoul	France
Part	7263	Part S10X001453 Not Found	Georges Delaville	France
Part	7264	Part S10X001460 Not Found	Georges Delaville	France
Date	7265	Date 2011-12-01 Not Found	Maria Martin	France
Part	7268	Part S10X001460 Not Found	Jan Muller	Germany
Part	7271	Part S10X001453 Not Found	Mario Colli	Italy
Date	7273	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	7278	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7280	Part S10X001451 Not Found	Jan Muller	Germany
Part	7282	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	7287	Part S10X001456 Not Found	Frank Chemoul	France
Date	7288	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7292	Part S10X001458 Not Found	Jan Muller	Germany
Part	7304	Part S10X001459 Not Found	Frank Chemoul	France
Date	7308	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	7311	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	7315	Part S10X001455 Not Found	Georges Delaville	France
Part	7316	Part S10X001453 Not Found	Georges Delaville	France
Part	7318	Part S10X001460 Not Found	Georges Delaville	France
Part	7334	Part S10X001459 Not Found	Georges Delaville	France
Date	7353	Date 2011-12-01 Not Found	Maria Martin	France
Date	7355	Date 2011-12-01 Not Found	Maria Martin	France
Part	7358	Part S10X001452 Not Found	Maria Martin	France
Date	7359	Date 2011-12-01 Not Found	Maria Martin	France
Part	7364	Part S10X001451 Not Found	Mario Colli	Italy
Part	7365	Part S10X001460 Not Found	Mario Colli	Italy
Date	7368	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	7376	Part S10X001457 Not Found	Frank Chemoul	France
Part	7378	Part S10X001460 Not Found	Mario Colli	Italy
Part	7380	Part S10X001455 Not Found	Mario Colli	Italy
Date	7382	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	7384	Date 2011-12-01 Not Found	Georges Delaville	France
Part	7388	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	7394	Part S10X001459 Not Found	Rudi Projnow	Germany
Date	7397	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	7400	Part S10X001453 Not Found	Frank Chemoul	France
Part	7401	Part S10X001460 Not Found	Frank Chemoul	France
Part	7406	Part S10X001460 Not Found	Jan Muller	Germany
Part	7407	Part S10X001457 Not Found	Jan Muller	Germany
Date	7416	Date 2011-12-01 Not Found	Maria Martin	France
Part	7418	Part S10X001459 Not Found	Jan Muller	Germany
Date	7420	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	7425	Part S10X001452 Not Found	Maria Martin	France
Date	7429	Date 2011-12-01 Not Found	Victoria Adams	Italy
Date	7430	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	7431	Part S10X001460 Not Found	Victoria Adams	Italy
Part	7432	Part S10X001457 Not Found	Victoria Adams	Italy
Date	7436	Date 2011-12-01 Not Found	Maria Martin	France
Part	7437	Part S10X001459 Not Found	Maria Martin	France
Date	7439	Date 2011-12-01 Not Found	Maria Martin	France
Date	7442	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7448	Part S10X001455 Not Found	Jan Muller	Germany
Part	7454	Part S10X001452 Not Found	Jan Muller	Germany
Part	7462	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	7463	Part S10X001451 Not Found	Rudi Projnow	Germany
Date	7472	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	7476	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	7477	Part S10X001451 Not Found	Jan Muller	Germany
Part	7479	Part S10X001451 Not Found	Jan Muller	Germany
Part	7480	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	7484	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	7485	Part S10X001459 Not Found	Rudi Projnow	Germany
Part	7486	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	7487	Part S10X001456 Not Found	Rudi Projnow	Germany
Part	7488	Part S10X001453 Not Found	Mario Colli	Italy
Part	7489	Part S10X001451 Not Found	Mario Colli	Italy
Part	7490	Part S10X001459 Not Found	Mario Colli	Italy
Part	7491	Part S10X001452 Not Found	Mario Colli	Italy
Part	7492	Part S10X001458 Not Found	Mario Colli	Italy
Part	7494	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	7498	Part S10X001460 Not Found	Mario Colli	Italy
Part	7502	Part S10X001458 Not Found	Victoria Adams	Italy
Date	7503	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	7505	Part S10X001458 Not Found	Frank Chemoul	France
Date	7508	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	7509	Date 2011-12-01 Not Found	Georges Delaville	France
Date	7511	Date 2011-12-01 Not Found	Georges Delaville	France
Part	7516	Part S10X001458 Not Found	Maria Martin	France
Date	7517	Date 2011-12-01 Not Found	Maria Martin	France
Part	7518	Part S10X001454 Not Found	Jan Muller	Germany
Date	7520	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	7532	Part S10X001451 Not Found	Rudi Projnow	Germany
Part	7533	Part S10X001459 Not Found	Rudi Projnow	Germany
Date	7537	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7539	Part S10X001454 Not Found	Frank Chemoul	France
Part	7546	Part S10X001453 Not Found	Jan Muller	Germany
Part	7547	Part S10X001455 Not Found	Jan Muller	Germany
Part	7551	Part S10X001453 Not Found	Frank Chemoul	France
Part	7552	Part S10X001455 Not Found	Frank Chemoul	France
Date	7553	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7556	Part S10X001451 Not Found	Mario Colli	Italy
Part	7563	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	7565	Part S10X001454 Not Found	Georges Delaville	France
Part	7572	Part S10X001459 Not Found	Frank Chemoul	France
Date	7574	Date 2011-12-01 Not Found	Martin Lemieux	France
Part	7581	Part S10X001459 Not Found	Georges Delaville	France
Part	7582	Part S10X001456 Not Found	Georges Delaville	France
Part	7583	Part S10X001454 Not Found	Georges Delaville	France
Part	7588	Part S10X001458 Not Found	Mario Colli	Italy
Part	7589	Part S10X001457 Not Found	Mario Colli	Italy
Part	7590	Part S10X001455 Not Found	Mario Colli	Italy
Part	7591	Part S10X001460 Not Found	Rudi Projnow	Germany
Date	7594	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7601	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	7602	Part S10X001460 Not Found	Maria Martin	France
Part	7603	Part S10X001460 Not Found	Maria Martin	France
Date	7606	Date 2011-12-01 Not Found	Maria Martin	France
Part	7607	Part S10X001456 Not Found	Maria Martin	France
Part	7608	Part S10X001452 Not Found	Maria Martin	France
Part	7612	Part S10X001459 Not Found	Mario Colli	Italy
Part	7619	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	7620	Part S10X001456 Not Found	Luigi Massimo	Italy
Date	7621	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	7625	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7636	Part S10X001455 Not Found	Georges Delaville	France
Date	7639	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	7641	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	7645	Part S10X001451 Not Found	Rudi Projnow	Germany
Date	7648	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	7651	Part S10X001453 Not Found	Frank Chemoul	France
Part	7654	Part S10X001451 Not Found	Luigi Massimo	Italy
Part	7655	Part S10X001453 Not Found	Luigi Massimo	Italy
Part	7658	Part S10X001455 Not Found	Jan Muller	Germany
Part	7660	Part S10X001456 Not Found	Jan Muller	Germany
Date	7664	Date 2011-12-01 Not Found	Maria Martin	France
Part	7666	Part S10X001454 Not Found	Maria Martin	France
Part	7668	Part S10X001453 Not Found	Jan Muller	Germany
Part	7669	Part S10X001454 Not Found	Jan Muller	Germany
Part	7673	Part S10X001454 Not Found	Maria Martin	France
Part	7679	Part S10X001460 Not Found	Victoria Adams	Italy
Part	7682	Part S10X001454 Not Found	Victoria Adams	Italy
Part	7684	Part S10X001453 Not Found	Victoria Adams	Italy
Date	7685	Date 2011-12-01 Not Found	Maria Martin	France
Part	7686	Part S10X001456 Not Found	Maria Martin	France
Part	7687	Part S10X001457 Not Found	Maria Martin	France
Part	7689	Part S10X001455 Not Found	Maria Martin	France
Part	7691	Part S10X001455 Not Found	Frank Chemoul	France
Part	7694	Part S10X001457 Not Found	Mario Colli	Italy
Part	7695	Part S10X001460 Not Found	Mario Colli	Italy
Part	7700	Part S10X001458 Not Found	Georges Delaville	France
Part	7701	Part S10X001457 Not Found	Georges Delaville	France
Date	7709	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	7710	Part S10X001452 Not Found	Rudi Projnow	Germany
Date	7713	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	7716	Part S10X001456 Not Found	Mario Colli	Italy
Date	7722	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	7723	Part S10X001456 Not Found	Jan Muller	Germany
Part	7724	Part S10X001458 Not Found	Jan Muller	Germany
Part	7735	Part S10X001451 Not Found	Rudi Projnow	Germany
Date	7738	Date 2011-12-01 Not Found	Mario Colli	Italy
Part	7742	Part S10X001460 Not Found	Mario Colli	Italy
Part	7743	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	7747	Part S10X001451 Not Found	Mario Colli	Italy
Part	7751	Part S10X001457 Not Found	Mario Colli	Italy
Date	7756	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7763	Part S10X001458 Not Found	Georges Delaville	France
Date	7776	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7778	Part S10X001460 Not Found	Frank Chemoul	France
Date	7784	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	7788	Part S10X001458 Not Found	Frank Chemoul	France
Part	7797	Part S10X001458 Not Found	Jan Muller	Germany
Date	7798	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	7804	Part S10X001459 Not Found	Frank Chemoul	France
Part	7807	Part S10X001457 Not Found	Mario Colli	Italy
Part	7808	Part S10X001456 Not Found	Mario Colli	Italy
Date	7817	Date 2011-12-01 Not Found	Georges Delaville	France
Part	7821	Part S10X001453 Not Found	Frank Chemoul	France
Part	7829	Part S10X001458 Not Found	Victoria Adams	Italy
Part	7834	Part S10X001457 Not Found	Georges Delaville	France
Part	7840	Part S10X001454 Not Found	Mario Colli	Italy
Part	7844	Part S10X001451 Not Found	Frank Chemoul	France
Part	7847	Part S10X001453 Not Found	Frank Chemoul	France
Part	7852	Part S10X001460 Not Found	Maria Martin	France
Part	7856	Part S10X001458 Not Found	Maria Martin	France
Part	7857	Part S10X001454 Not Found	Maria Martin	France
Part	7860	Part S10X001456 Not Found	Maria Martin	France
Part	7865	Part S10X001456 Not Found	Mario Colli	Italy
Part	7867	Part S10X001460 Not Found	Luigi Massimo	Italy
Date	7868	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	7869	Part S10X001457 Not Found	Luigi Massimo	Italy
Part	7870	Part S10X001452 Not Found	Luigi Massimo	Italy
Part	7871	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	7872	Part S10X001453 Not Found	Frank Chemoul	France
Part	7883	Part S10X001458 Not Found	Georges Delaville	France
Part	7884	Part S10X001451 Not Found	Georges Delaville	France
Part	7885	Part S10X001458 Not Found	Georges Delaville	France
Date	7888	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	7890	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	7894	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	7897	Part S10X001452 Not Found	Rudi Projnow	Germany
Part	7901	Part S10X001454 Not Found	Frank Chemoul	France
Part	7903	Part S10X001458 Not Found	Luigi Massimo	Italy
Part	7906	Part S10X001453 Not Found	Jan Muller	Germany
Date	7907	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	7912	Part S10X001452 Not Found	Jan Muller	Germany
Part	7914	Part S10X001455 Not Found	Maria Martin	France
Part	7919	Part S10X001457 Not Found	Jan Muller	Germany
Part	7922	Part S10X001458 Not Found	Maria Martin	France
Date	7924	Date 2011-12-01 Not Found	Maria Martin	France
Part	7926	Part S10X001455 Not Found	Maria Martin	France
Part	7927	Part S10X001453 Not Found	Maria Martin	France
Part	7929	Part S10X001457 Not Found	Victoria Adams	Italy
Part	7932	Part S10X001451 Not Found	Victoria Adams	Italy
Part	7933	Part S10X001451 Not Found	Victoria Adams	Italy
Part	7939	Part S10X001457 Not Found	Maria Martin	France
Part	7945	Part S10X001458 Not Found	Mario Colli	Italy
Part	7949	Part S10X001460 Not Found	Georges Delaville	France
Part	7955	Part S10X001453 Not Found	Jan Muller	Germany
Part	7970	Part S10X001454 Not Found	Luigi Massimo	Italy
Part	7971	Part S10X001458 Not Found	Luigi Massimo	Italy
Date	7973	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	7975	Part S10X001451 Not Found	Jan Muller	Germany
Part	7976	Part S10X001459 Not Found	Jan Muller	Germany
Part	7980	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	7981	Part S10X001455 Not Found	Luigi Massimo	Italy
Part	7986	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	7990	Part S10X001452 Not Found	Mario Colli	Italy
Part	7991	Part S10X001455 Not Found	Mario Colli	Italy
Part	7996	Part S10X001452 Not Found	Luigi Massimo	Italy
Date	7999	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Date	8002	Date 2011-12-01 Not Found	Victoria Adams	Italy
Date	8011	Date 2011-12-01 Not Found	Georges Delaville	France
Part	8014	Part S10X001460 Not Found	Georges Delaville	France
Part	8015	Part S10X001460 Not Found	Maria Martin	France
Part	8016	Part S10X001460 Not Found	Maria Martin	France
Part	8020	Part S10X001460 Not Found	Mario Colli	Italy
Part	8024	Part S10X001460 Not Found	Frank Chemoul	France
Date	8025	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	8030	Part S10X001460 Not Found	Jan Muller	Germany
Part	8033	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	8035	Part S10X001460 Not Found	Frank Chemoul	France
Part	8036	Part S10X001460 Not Found	Frank Chemoul	France
Date	8048	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	8049	Part S10X001460 Not Found	Jan Muller	Germany
Part	8053	Part S10X001460 Not Found	Frank Chemoul	France
Date	8063	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	8066	Part S10X001460 Not Found	Georges Delaville	France
Part	8068	Part S10X001460 Not Found	Georges Delaville	France
Date	8070	Date 2011-12-01 Not Found	Frank Chemoul	France
Part	8071	Part S10X001460 Not Found	Frank Chemoul	France
Date	8074	Date 2011-12-01 Not Found	Martin Lemieux	France
Part	8080	Part S10X001460 Not Found	Victoria Adams	Italy
Part	8083	Part S10X001460 Not Found	Georges Delaville	France
Part	8089	Part S10X001460 Not Found	Mario Colli	Italy
Part	8090	Part S10X001460 Not Found	Mario Colli	Italy
Part	8092	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	8098	Part S10X001460 Not Found	Frank Chemoul	France
Part	8120	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	8125	Part S10X001460 Not Found	Frank Chemoul	France
Part	8127	Part S10X001460 Not Found	Mario Colli	Italy
Part	8129	Part S10X001460 Not Found	Mario Colli	Italy
Part	8131	Part S10X001460 Not Found	Mario Colli	Italy
Part	8135	Part S10X001460 Not Found	Georges Delaville	France
Part	8139	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	8141	Part S10X001460 Not Found	Luigi Massimo	Italy
Date	8150	Date 2011-12-01 Not Found	Frank Chemoul	France
Date	8155	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	8162	Part S10X001460 Not Found	Jan Muller	Germany
Part	8163	Part S10X001460 Not Found	Maria Martin	France
Date	8165	Date 2011-12-01 Not Found	Maria Martin	France
Part	8169	Part S10X001460 Not Found	Jan Muller	Germany
Part	8171	Part S10X001460 Not Found	Maria Martin	France
Part	8178	Part S10X001460 Not Found	Maria Martin	France
Part	8179	Part S10X001460 Not Found	Victoria Adams	Italy
Date	8180	Date 2011-12-01 Not Found	Victoria Adams	Italy
Date	8181	Date 2011-12-01 Not Found	Victoria Adams	Italy
Part	8186	Part S10X001460 Not Found	Maria Martin	France
Part	8188	Part S10X001460 Not Found	Maria Martin	France
Part	8190	Part S10X001460 Not Found	Maria Martin	France
Date	8197	Date 2011-12-01 Not Found	Jan Muller	Germany
Date	8199	Date 2011-12-01 Not Found	Georges Delaville	France
Date	8200	Date 2011-12-01 Not Found	Georges Delaville	France
Part	8204	Part S10X001460 Not Found	Jan Muller	Germany
Part	8205	Part S10X001460 Not Found	Jan Muller	Germany
Date	8210	Date 2011-12-01 Not Found	Rudi Projnow	Germany
Part	8211	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	8215	Part S10X001460 Not Found	Mario Colli	Italy
Date	8216	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	8219	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	8222	Part S10X001460 Not Found	Luigi Massimo	Italy
Date	8223	Date 2011-12-01 Not Found	Jan Muller	Germany
Part	8237	Part S10X001460 Not Found	Rudi Projnow	Germany
Part	8242	Part S10X001460 Not Found	Mario Colli	Italy
Part	8243	Part S10X001460 Not Found	Luigi Massimo	Italy
Part	8247	Part S10X001460 Not Found	Mario Colli	Italy
Date	8248	Date 2011-12-01 Not Found	Mario Colli	Italy
Date	8249	Date 2011-12-01 Not Found	Luigi Massimo	Italy
Part	8251	Part S10X001460 Not Found	Mario Colli	Italy
Agency	8252	Agency SAX1000103 Not Found	Unknow	Unknow
Agency	8253	Agency SAX1000104 Not Found	Unknow	Unknow
Agency	8254	Agency SAX1000105 Not Found	Unknow	Unknow
Agency	8255	Agency SAX1000106 Not Found	Unknow	Unknow
Agency	8256	Agency SAX1000107 Not Found	Unknow	Unknow
Agency	8257	Agency SAX1000108 Not Found	Unknow	Unknow
Agency	8258	Agency SAX1000109 Not Found	Unknow	Unknow
Agency	8259	Agency SAX1000110 Not Found	Unknow	Unknow
Agency	8260	Agency SAX1000111 Not Found	Unknow	Unknow
Agency	8261	Agency SAX1000112 Not Found	Unknow	Unknow
Agency	8262	Agency SAX1000113 Not Found	Unknow	Unknow
Agency	8263	Agency SAX1000114 Not Found	Unknow	Unknow
Agency	8264	Agency SAX1000115 Not Found	Unknow	Unknow
Agency	8265	Agency SAX1000116 Not Found	Unknow	Unknow
Agency	8266	Agency SAX1000123 Not Found	Unknow	Unknow
Agency	8267	Agency SAX1000124 Not Found	Unknow	Unknow
Agency	8268	Agency SAX1000125 Not Found	Unknow	Unknow
Agency	8269	Agency SAX1000126 Not Found	Unknow	Unknow
Agency	8270	Agency SAX1000127 Not Found	Unknow	Unknow
Agency	8271	Agency SAX1000133 Not Found	Unknow	Unknow
Agency	8272	Agency SAX1000134 Not Found	Unknow	Unknow
Agency	8273	Agency SAX1000135 Not Found	Unknow	Unknow
Agency	8274	Agency SAX1000136 Not Found	Unknow	Unknow
Agency	8275	Agency SAX1000137 Not Found	Unknow	Unknow
Agency	8276	Agency SAX1000138 Not Found	Unknow	Unknow
Agency	8277	Agency SAX1000149 Not Found	Unknow	Unknow
Agency	8278	Agency SAX1000150 Not Found	Unknow	Unknow
Agency	8279	Agency SAX1000151 Not Found	Unknow	Unknow
Agency	8280	Agency SAX1000152 Not Found	Unknow	Unknow
Agency	8281	Agency SAX1000153 Not Found	Unknow	Unknow
Agency	8282	Agency SAX1000163 Not Found	Unknow	Unknow
Agency	8283	Agency SAX1000164 Not Found	Unknow	Unknow
Agency	8284	Agency SAX1000165 Not Found	Unknow	Unknow
Agency	8285	Agency SAX1000166 Not Found	Unknow	Unknow
Agency	8286	Agency SAX1000167 Not Found	Unknow	Unknow
Agency	8287	Agency SAX1000168 Not Found	Unknow	Unknow
Agency	8288	Agency SAX1000169 Not Found	Unknow	Unknow
Agency	8289	Agency SAX1000170 Not Found	Unknow	Unknow
Agency	8290	Agency SAX1000171 Not Found	Unknow	Unknow
Agency	8291	Agency SAX1000172 Not Found	Unknow	Unknow
Agency	8292	Agency SAX1000173 Not Found	Unknow	Unknow
Agency	8293	Agency SAX1000174 Not Found	Unknow	Unknow
Agency	8294	Agency SAX1000175 Not Found	Unknow	Unknow
Agency	8295	Agency SAX1000180 Not Found	Unknow	Unknow
Agency	8296	Agency SAX1000181 Not Found	Unknow	Unknow
Agency	8297	Agency SAX1000182 Not Found	Unknow	Unknow
Agency	8298	Agency SAX1000183 Not Found	Unknow	Unknow
Agency	8299	Agency SAX1000184 Not Found	Unknow	Unknow
Agency	8300	Agency SAX1000193 Not Found	Unknow	Unknow
Agency	8301	Agency SAX1000194 Not Found	Unknow	Unknow
Agency	8302	Agency SAX1000195 Not Found	Unknow	Unknow
Agency	8303	Agency SAX1000196 Not Found	Unknow	Unknow
Agency	8304	Agency SAX1000197 Not Found	Unknow	Unknow
Agency	8305	Agency SAX1000201 Not Found	Unknow	Unknow
Agency	8306	Agency SAX1000202 Not Found	Unknow	Unknow
Agency	8307	Agency SAX1000203 Not Found	Unknow	Unknow
Agency	8308	Agency SAX1000204 Not Found	Unknow	Unknow
Agency	8309	Agency SAX1000205 Not Found	Unknow	Unknow
Agency	8310	Agency SAX1000206 Not Found	Unknow	Unknow
Agency	8311	Agency SAX1000207 Not Found	Unknow	Unknow
Agency	8312	Agency SAX1000208 Not Found	Unknow	Unknow
Agency	8313	Agency SAX1000209 Not Found	Unknow	Unknow
Agency	8314	Agency SAX1000210 Not Found	Unknow	Unknow
Agency	8315	Agency SAX1000221 Not Found	Unknow	Unknow
Agency	8316	Agency SAX1000222 Not Found	Unknow	Unknow
Agency	8317	Agency SAX1000223 Not Found	Unknow	Unknow
Agency	8318	Agency SAX1000224 Not Found	Unknow	Unknow
Agency	8319	Agency SAX1000225 Not Found	Unknow	Unknow
Agency	8320	Agency SAX1000232 Not Found	Unknow	Unknow
Agency	8321	Agency SAX1000233 Not Found	Unknow	Unknow
Agency	8322	Agency SAX1000234 Not Found	Unknow	Unknow
Agency	8323	Agency SAX1000235 Not Found	Unknow	Unknow
Agency	8324	Agency SAX1000236 Not Found	Unknow	Unknow
Agency	8325	Agency SAX1000249 Not Found	Unknow	Unknow
Agency	8326	Agency SAX1000250 Not Found	Unknow	Unknow
Agency	8327	Agency SAX1000251 Not Found	Unknow	Unknow
Agency	8328	Agency SAX1000262 Not Found	Unknow	Unknow
Agency	8329	Agency SAX1000263 Not Found	Unknow	Unknow
Agency	8330	Agency SAX1000264 Not Found	Unknow	Unknow
Agency	8331	Agency SAX1000265 Not Found	Unknow	Unknow
Agency	8332	Agency SAX1000266 Not Found	Unknow	Unknow
Agency	8333	Agency SAX1000270 Not Found	Unknow	Unknow
Agency	8334	Agency SAX1000271 Not Found	Unknow	Unknow
Agency	8335	Agency SAX1000272 Not Found	Unknow	Unknow
Agency	8336	Agency SAX1000273 Not Found	Unknow	Unknow
Agency	8337	Agency SAX1000274 Not Found	Unknow	Unknow
Agency	8338	Agency SAX1000275 Not Found	Unknow	Unknow
Agency	8339	Agency SAX1000276 Not Found	Unknow	Unknow
Agency	8340	Agency SAX1000277 Not Found	Unknow	Unknow
Agency	8341	Agency SAX1000284 Not Found	Unknow	Unknow
Agency	8342	Agency SAX1000285 Not Found	Unknow	Unknow
Agency	8343	Agency SAX1000286 Not Found	Unknow	Unknow
Agency	8344	Agency SAX1000287 Not Found	Unknow	Unknow
Agency	8345	Agency SAX1000288 Not Found	Unknow	Unknow
Agency	8346	Agency SAX1000289 Not Found	Unknow	Unknow
Agency	8347	Agency SAX1000290 Not Found	Unknow	Unknow
Agency	8348	Agency SAX1000291 Not Found	Unknow	Unknow
Agency	8349	Agency SAX1000292 Not Found	Unknow	Unknow
Agency	8350	Agency SAX1000298 Not Found	Unknow	Unknow
Agency	8351	Agency SAX1000299 Not Found	Unknow	Unknow
Agency	8352	Agency SAX1000300 Not Found	Unknow	Unknow
\.


--
-- Data for Name: time; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "time" (time_id, date, year, quarter, month_of_year, fiscal_period) FROM stdin;
51	2012-01-01 00:00:00	2012	Q1	1	1
52	2012-02-01 00:00:00	2012	Q1	2	1
53	2012-03-01 00:00:00	2012	Q1	3	2
54	2012-04-01 00:00:00	2012	Q2	4	3
55	2012-05-01 00:00:00	2012	Q2	5	3
56	2012-06-01 00:00:00	2012	Q2	6	4
57	2012-07-01 00:00:00	2012	Q3	7	5
58	2012-08-01 00:00:00	2012	Q3	8	6
59	2012-09-01 00:00:00	2012	Q3	9	6
60	2012-10-01 00:00:00	2012	Q4	10	7
61	2012-11-01 00:00:00	2012	Q4	11	8
62	2012-12-01 00:00:00	2012	Q4	12	8
63	2013-01-01 00:00:00	2013	Q1	1	1
\.


--
-- Name: agency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agency
    ADD CONSTRAINT agency_pkey PRIMARY KEY (agency_id);


--
-- Name: time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (time_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

