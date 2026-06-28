--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Patrick', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1782638316715', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1782638316714', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1782638460138', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1782638460137', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1782638652473', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1782638652472', 0, NULL);
INSERT INTO public.users VALUES (8, 'Alexander', 0, NULL);
INSERT INTO public.users VALUES (9, 'user_1782639023387', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1782639023386', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1782642193902', 2, 149);
INSERT INTO public.users VALUES (29, 'user_1782644410589', 2, 360);
INSERT INTO public.users VALUES (11, 'user_1782642193903', 5, 83);
INSERT INTO public.users VALUES (13, 'Liane', 0, NULL);
INSERT INTO public.users VALUES (14, 'X', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1782642968936', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1782642968935', 0, NULL);
INSERT INTO public.users VALUES (17, 'A', 0, NULL);
INSERT INTO public.users VALUES (28, 'user_1782644410590', 5, 245);
INSERT INTO public.users VALUES (19, 'user_1782643424479', 2, 639);
INSERT INTO public.users VALUES (18, 'user_1782643424480', 5, 87);
INSERT INTO public.users VALUES (21, 'user_1782643565568', 2, 235);
INSERT INTO public.users VALUES (20, 'user_1782643565569', 5, 19);
INSERT INTO public.users VALUES (23, 'user_1782643700963', 2, 352);
INSERT INTO public.users VALUES (22, 'user_1782643700964', 5, 129);
INSERT INTO public.users VALUES (25, 'user_1782644176594', 2, 237);
INSERT INTO public.users VALUES (24, 'user_1782644176595', 5, 136);
INSERT INTO public.users VALUES (27, 'user_1782644293139', 2, 284);
INSERT INTO public.users VALUES (26, 'user_1782644293140', 5, 367);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

