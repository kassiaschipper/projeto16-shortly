--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "createAt" timestamp without time zone DEFAULT now() NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: ranking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ranking (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "countVisit" integer DEFAULT 0 NOT NULL,
    "urlId" integer NOT NULL
);


--
-- Name: ranking_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ranking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ranking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ranking_id_seq OWNED BY public.ranking.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
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
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: ranking id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking ALTER COLUMN id SET DEFAULT nextval('public.ranking_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (24, 18, 'https://www.youtube.com/watch?v=2vjPBrBU-TM', '2022-10-15 00:00:00', 'QhqQbXcE', 4);
INSERT INTO public.links VALUES (6, 16, 'https://i.pinimg.com/736x/46/8f/68/468f68b7078b57810391793a7ec542cc.jpg', '2022-10-15 00:00:00', 'inK7YB2u', 5);
INSERT INTO public.links VALUES (9, 17, 'https://i.pinimg.com/736x/46/8f/68/468f68b7078b57810391793a7ec542cc.jpg', '2022-10-15 00:00:00', 'l9eGqwp1', 1);
INSERT INTO public.links VALUES (8, 17, 'https://i.pinimg.com/736x/46/8f/68/468f68b7078b57810391793a7ec542cc.jpg', '2022-10-15 00:00:00', 'mUFNRTPs', 2);
INSERT INTO public.links VALUES (7, 17, 'https://i.pinimg.com/736x/46/8f/68/468f68b7078b57810391793a7ec542cc.jpg', '2022-10-15 00:00:00', 'cvXsbd8s', 1);
INSERT INTO public.links VALUES (10, 25, 'https://www.postgresql.org/docs/current/sql-insert.html', '2022-10-15 00:00:00', '4fyBYual', 1);
INSERT INTO public.links VALUES (12, 25, 'https://www.youtube.com/watch?v=PEnJbjBuxnw', '2022-10-15 00:00:00', 'Tm4Ueu9a', 2);
INSERT INTO public.links VALUES (13, 25, 'https://www.google.com/search?q=insert+or+update+postgres&oq=insert+ou+update+pos&aqs=chrome.1.69i57j0i13i512l2j0i13i30j0i22i30l2j0i5i13i30l4.15545j1j7&sourceid=chrome&ie=UTF-8', '2022-10-15 00:00:00', '8Bivv49d', 2);
INSERT INTO public.links VALUES (11, 25, 'https://www.youtube.com/watch?v=PEnJbjBuxnw', '2022-10-15 00:00:00', 'XhYKLiKd', 3);
INSERT INTO public.links VALUES (14, 21, 'https://www.google.com/search?q=insert+or+update+postgres&oq=insert+ou+update+pos&aqs=chrome.1.69i57j0i13i512l2j0i13i30j0i22i30l2j0i5i13i30l4.15545j1j7&sourceid=chrome&ie=UTF-8', '2022-10-15 00:00:00', 'BxyJSexu', NULL);
INSERT INTO public.links VALUES (15, 21, 'https://www.youtube.com/watch?v=09R8_2nJtjg', '2022-10-15 00:00:00', 'B0rd-m92', 3);
INSERT INTO public.links VALUES (16, 20, 'https://www.youtube.com/watch?v=YaEG2aWJnZ8', '2022-10-15 00:00:00', 'uG-v4kol', NULL);
INSERT INTO public.links VALUES (17, 20, 'https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-upsert/', '2022-10-15 00:00:00', 'PDqHb4Se', NULL);
INSERT INTO public.links VALUES (18, 19, 'https://www.youtube.com/watch?v=YaEG2aWJnZ8', '2022-10-15 00:00:00', 'Be9x2QSz', 7);
INSERT INTO public.links VALUES (4, 15, 'https://i.pinimg.com/736x/46/8f/68/468f68b7078b57810391793a7ec542cc.jpg', '2022-10-14 00:00:00', '0ezD_g-P', 7);
INSERT INTO public.links VALUES (19, 22, 'https://www.youtube.com/watch?v=YaEG2aWJnZ8', '2022-10-15 00:00:00', '3UEo2CsQ', NULL);
INSERT INTO public.links VALUES (3, 15, 'https://i.pinimg.com/736x/46/8f/68/468f68b7078b57810391793a7ec542cc.jpg', '2022-10-14 00:00:00', 'mo_HSD9c', 6);
INSERT INTO public.links VALUES (20, 22, 'https://www.youtube.com/watch?v=YaEG2aWJnZ8', '2022-10-15 00:00:00', 'F9BqZoHH', NULL);
INSERT INTO public.links VALUES (5, 15, 'https://i.pinimg.com/736x/46/8f/68/468f68b7078b57810391793a7ec542cc.jpg', '2022-10-14 00:00:00', 'wKpQA8jj', 18);
INSERT INTO public.links VALUES (21, 22, 'https://www.youtube.com/watch?v=YaEG2aWJnZ8', '2022-10-15 00:00:00', 'ms4yPeYD', NULL);
INSERT INTO public.links VALUES (1, 14, 'https://www.gerarmemes.com.br/meme/850574-central-gay-de-cancelamento-boa-tarde-com-q', '2022-10-14 00:00:00', '4IY68lre', 14);
INSERT INTO public.links VALUES (22, 23, 'https://www.youtube.com/watch?v=2vjPBrBU-TM', '2022-10-15 00:00:00', 'x9E8pwOv', 6);
INSERT INTO public.links VALUES (23, 24, 'https://www.youtube.com/watch?v=2vjPBrBU-TM', '2022-10-15 00:00:00', 'cn0Kodjc', NULL);


--
-- Data for Name: ranking; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ranking VALUES (9, 15, 7, 4);
INSERT INTO public.ranking VALUES (10, 15, 6, 3);
INSERT INTO public.ranking VALUES (11, 15, 18, 5);
INSERT INTO public.ranking VALUES (12, 14, 14, 1);
INSERT INTO public.ranking VALUES (13, 16, 5, 6);
INSERT INTO public.ranking VALUES (15, 17, 1, 9);
INSERT INTO public.ranking VALUES (14, 17, 2, 8);
INSERT INTO public.ranking VALUES (16, 25, 1, 10);
INSERT INTO public.ranking VALUES (18, 25, 2, 12);
INSERT INTO public.ranking VALUES (19, 25, 2, 13);
INSERT INTO public.ranking VALUES (17, 25, 3, 11);
INSERT INTO public.ranking VALUES (20, 21, 0, 14);
INSERT INTO public.ranking VALUES (21, 21, 3, 15);
INSERT INTO public.ranking VALUES (22, 20, 0, 16);
INSERT INTO public.ranking VALUES (23, 20, 0, 17);
INSERT INTO public.ranking VALUES (24, 19, 7, 18);
INSERT INTO public.ranking VALUES (25, 22, 0, 19);
INSERT INTO public.ranking VALUES (26, 22, 0, 20);
INSERT INTO public.ranking VALUES (27, 22, 0, 21);
INSERT INTO public.ranking VALUES (28, 23, 6, 22);
INSERT INTO public.ranking VALUES (29, 24, 0, 23);
INSERT INTO public.ranking VALUES (30, 18, 4, 24);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (9, 14, '02874300-bd49-4504-97ed-8933df540fb3');
INSERT INTO public.sessions VALUES (10, 15, '46e37510-2bb4-4fb6-b197-c7dee47cbe13');
INSERT INTO public.sessions VALUES (11, 16, '0648c79d-62b5-4b0a-b45a-41df42d0d106');
INSERT INTO public.sessions VALUES (12, 17, '75a212fd-3744-470f-badd-ad7bb273e32e');
INSERT INTO public.sessions VALUES (13, 17, '171bf488-011d-4245-9869-b89e8eb26b3a');
INSERT INTO public.sessions VALUES (14, 25, 'a081d7a2-c1e1-4b76-b291-56a009e2ac16');
INSERT INTO public.sessions VALUES (15, 21, 'f9c1ac2a-e129-4634-81d9-605c43482fee');
INSERT INTO public.sessions VALUES (16, 20, '5f1eeb19-3baa-4c31-ab12-a635b74b88d5');
INSERT INTO public.sessions VALUES (17, 19, '51c7ef51-97e6-4d62-9193-8738b4ce2d27');
INSERT INTO public.sessions VALUES (18, 21, 'a6578c1b-8fca-43e2-bd7b-15d84d7e737e');
INSERT INTO public.sessions VALUES (19, 22, '994ebffe-a88d-49a2-9ebb-f750861a14f9');
INSERT INTO public.sessions VALUES (20, 23, '492bd519-06d6-4dae-b55b-5386b952b010');
INSERT INTO public.sessions VALUES (21, 24, '53e7bbae-e54d-4a1f-83f1-4d4b0f7d351a');
INSERT INTO public.sessions VALUES (22, 18, '4bd68906-20e7-40f8-bd21-ce447076b2d9');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (14, 'testinho', 'meajuda@teste.com', '$2b$10$nseO8U.Z/qK24SZnLNCj9.OFvujui2zegl1x6rmcIB.dY87zk1G/G');
INSERT INTO public.users VALUES (15, 'teste2', 'testinhooseuamiguinho@bol.com', '$2b$10$0AfMIE9Eo2VsZfZiqCMna.psGI5SyNd2WARxImz/qcOaLzWVxhudi');
INSERT INTO public.users VALUES (16, 'teste2', 'testando@bol.com', '$2b$10$yH.NzZfNd4wa0iftWJp70OI1EST7gDkofUWSRCMyq9LvAfMi324ka');
INSERT INTO public.users VALUES (17, 'fulaninha', 'testandinho@bol.com', '$2b$10$tvDRuWCjXttls/lKDwHs6ORZS1RTlw4gjOz0QL/SP8lFHlsvVbt1q');
INSERT INTO public.users VALUES (18, 'Ana', 'bia@popy.com', '$2b$10$iw0Ljjeljl6uAw2EzbV3.eHZ.3qj6m04mtgv6E8SfXOcGYnieSH6O');
INSERT INTO public.users VALUES (19, 'bia', 'ana@popy.com', '$2b$10$jHEyQTbI9wrspv.ct6ESkeqldDJc8Wf3yG4tfHX0Fe3wT8bhOckea');
INSERT INTO public.users VALUES (20, 'carla', 'dea@popy.com', '$2b$10$lLegkqtGU47K.fakEygvXu/XFQgvpliqFyNFX33zz2ZkrHPRTGcE6');
INSERT INTO public.users VALUES (21, 'Dea', 'carla@popy.com', '$2b$10$Kx4w5F1YDwNuEfixqg1RTuK8KWH.LY3Aw6gqqAqILCClyHQvCNszC');
INSERT INTO public.users VALUES (22, 'Eleonor', 'Heloisa@popy.com', '$2b$10$oe7BlSTLS4EwhApZeKN0zutfgHy2T1RoiY3yC9q60fYRpAJsFUEZ2');
INSERT INTO public.users VALUES (23, 'Heloisa', 'Eleonor@popy.com', '$2b$10$owurpDaUKltvHBKy2WVEBe1LkcaHQ7Cr.SuhtwUrEzpUPSxiRKbxK');
INSERT INTO public.users VALUES (24, 'Fernando', 'gloria@popy.com', '$2b$10$wowb1nwAjQ/zNkktsHBQR.A0nt86NOZx.sCj8aUMWNX.DdPZrtTYu');
INSERT INTO public.users VALUES (25, 'Gloria', 'fernando@popy.com', '$2b$10$uzUmC0qRMc5BYiXdkX73a.QuUF17puDlP8wqkX28VrCuVxNbPxzq.');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 24, true);


--
-- Name: ranking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ranking_id_seq', 30, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 22, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: ranking ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: links links_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: ranking ranking_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT "ranking_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.links(id);


--
-- Name: ranking ranking_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ranking
    ADD CONSTRAINT "ranking_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

