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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: five; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.five (
    five_id integer NOT NULL,
    name character varying(200) NOT NULL,
    size_in_km integer NOT NULL
);


ALTER TABLE public.five OWNER TO freecodecamp;

--
-- Name: five_five_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.five_five_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.five_five_id_seq OWNER TO freecodecamp;

--
-- Name: five_five_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.five_five_id_seq OWNED BY public.five.five_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(200),
    description text,
    typ character varying(200),
    radius_in_light_years integer NOT NULL,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(200) NOT NULL,
    size_in_km integer NOT NULL,
    age_in_million_of_years integer,
    distance_from_earth numeric(5,5),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(200) NOT NULL,
    radius_in_km integer NOT NULL,
    age_in_billion_years numeric(5,2),
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    typ character varying(200),
    age_in_million_years integer,
    has_life boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: five five_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.five ALTER COLUMN five_id SET DEFAULT nextval('public.five_five_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: five; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.five VALUES (1, 'Mercury', 1);
INSERT INTO public.five VALUES (2, 'Venus', 2);
INSERT INTO public.five VALUES (3, 'Earth', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way galaxy', 'Our home galaxy', 'SBbc or SbB', 52850, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda galaxy', 'Nearest large spiral', 'Sb', 110000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum galaxy', 'Member of the Local group', 'SA(s)cd', 30000, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'It is connected to the Small Magellanic Cloud via a material bridge', 'SB(s)m', 7000, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Satellite galaxies of the Milky Way', 'SB(s)m', 3500, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero galaxy', 'Known for their shape', 'Sa/Sb', 25000, false);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool galaxy', 'well-known spiral galaxy', 'SA(s)bc pec', 30000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymed', 5262, 4500, 0.00007, 1);
INSERT INTO public.moon VALUES (2, 'Titan', 5150, 4500, 0.00017, 1);
INSERT INTO public.moon VALUES (3, 'Callisto', 4821, 4000, 0.00007, 1);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 4500, 0.00007, 1);
INSERT INTO public.moon VALUES (5, 'Moon', 3476, 4460, 0.00000, 1);
INSERT INTO public.moon VALUES (6, 'Europa', 3122, 90, 0.00007, 1);
INSERT INTO public.moon VALUES (7, 'Triton', 2700, 4500, 0.00046, 1);
INSERT INTO public.moon VALUES (8, 'Triania', 1578, 4600, 0.00000, 1);
INSERT INTO public.moon VALUES (9, 'Rhea', 1528, 4000, 0.00013, 1);
INSERT INTO public.moon VALUES (10, 'Oberon', 1522, 4500, 0.00034, 1);
INSERT INTO public.moon VALUES (11, 'Iapetus', 1470, 4565, 0.00013, 1);
INSERT INTO public.moon VALUES (12, 'Charon', 1212, 4500, 0.00006, 1);
INSERT INTO public.moon VALUES (13, 'Umbriel', 1170, 4500, 0.00030, 1);
INSERT INTO public.moon VALUES (14, 'Ariel', 1158, 4500, 0.00000, 1);
INSERT INTO public.moon VALUES (15, 'Dione', 1123, 4500, 0.00000, 1);
INSERT INTO public.moon VALUES (16, 'Tethys', 1062, 4400, 0.00013, 1);
INSERT INTO public.moon VALUES (17, 'Ceres', 960, 4500, 0.00003, 1);
INSERT INTO public.moon VALUES (18, 'Enceladus', 504, 1000, 0.00013, 1);
INSERT INTO public.moon VALUES (19, 'Miranda', 472, 4500, 0.00029, 1);
INSERT INTO public.moon VALUES (20, 'Proteus', 420, 4000, 0.00047, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440, 4.60, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, 4.60, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 4.50, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3390, 4.60, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, 4.60, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 4.60, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 4.60, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, 4.60, false, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 473, 4.60, true, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 1188, 4.60, true, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 816, 4.50, false, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 715, 4.50, false, 1);
INSERT INTO public.planet VALUES (13, 'Eris', 1163, 4.50, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the central star of our solar system, a celestial body of spectral class G2V, also known as a yellow dwarf', 'G2V', 4600, false, 1);
INSERT INTO public.star VALUES (2, 'Dog Star', 'Dog Star is the brightest star in the night sky, located 8.6 light-years away in the Canis Major constellation', 'A1V', 250, false, 2);
INSERT INTO public.star VALUES (3, 'Canopus', 'is the second-brightest Canopus is the brightest star in the southern constellation of Carina and the second-brightest star in the night sky', 'A9II', 34, false, 3);
INSERT INTO public.star VALUES (4, 'Arcturus', 'is the brightest star in the northern constellation of Boötes and the fourth-brightest in the night sky', 'K1.5III', 7100, false, 4);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 'is a triple star system and the closest star system to Earth at roughly 4.37 light-years away. It is the third-brightest star in the night sky and lies in the constellation Centaurus', 'G2V', 5300, false, 5);
INSERT INTO public.star VALUES (6, 'Vega', 'Vega is the brightest star in the northern constellation of Lyra', 'A0V', 850, false, 6);


--
-- Name: five_five_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.five_five_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: five five_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.five
    ADD CONSTRAINT five_name_key UNIQUE (name);


--
-- Name: five five_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.five
    ADD CONSTRAINT five_pkey PRIMARY KEY (five_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_radius_in_km_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_radius_in_km_key UNIQUE (radius_in_km);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_star_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey1 FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

