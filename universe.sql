--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comets_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comets_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    description text,
    size character varying(10)
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
    name character varying(30) NOT NULL,
    age integer,
    planet_id integer,
    size character varying(10)
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
    name character varying(30) NOT NULL,
    age integer,
    has_life boolean,
    is_spherical boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    age integer,
    size numeric(4,2),
    galaxy_id integer
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
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comets_id_seq'::regclass);


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
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'Kat', 10);
INSERT INTO public.comets VALUES (2, 'Kat-bebe', 20);
INSERT INTO public.comets VALUES (3, 'Kat-g', 30);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Ati', 30000, 'The first', 'Big');
INSERT INTO public.galaxy VALUES (2, 'Zequi', 25000, 'The second', 'Big');
INSERT INTO public.galaxy VALUES (3, 'Mica', 22500, 'The third', 'medium');
INSERT INTO public.galaxy VALUES (4, 'Agus', 27500, 'The fourth', 'Big');
INSERT INTO public.galaxy VALUES (5, 'Xavi', 20000, 'The fifth', 'Big');
INSERT INTO public.galaxy VALUES (6, 'Merce', 17500, 'The Sixth', 'Medium');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ati-m', 30, 1, 'Medium');
INSERT INTO public.moon VALUES (2, 'Zequi-m', 25, 2, 'Medium');
INSERT INTO public.moon VALUES (3, 'Mica-m', 22, 3, 'Medium');
INSERT INTO public.moon VALUES (4, 'Agus-m', 27, 4, 'Small');
INSERT INTO public.moon VALUES (5, 'Xavi-m', 20, 5, 'Big');
INSERT INTO public.moon VALUES (6, 'Merce-m', 15, 6, 'Big');
INSERT INTO public.moon VALUES (7, 'Ati-m1', 30, 1, 'Medium');
INSERT INTO public.moon VALUES (8, 'Zequi-m1', 25, 2, 'Medium');
INSERT INTO public.moon VALUES (9, 'Mica-m1', 22, 3, 'Medium');
INSERT INTO public.moon VALUES (10, 'Agus-m1', 27, 4, 'Small');
INSERT INTO public.moon VALUES (11, 'Xavi-m1', 20, 5, 'Big');
INSERT INTO public.moon VALUES (12, 'Merce-m1', 15, 6, 'Big');
INSERT INTO public.moon VALUES (13, 'Ati-m2', 30, 1, 'Medium');
INSERT INTO public.moon VALUES (14, 'Zequi-m2', 25, 2, 'Medium');
INSERT INTO public.moon VALUES (15, 'Mica-m2', 22, 3, 'Medium');
INSERT INTO public.moon VALUES (16, 'Agus-m2', 27, 4, 'Small');
INSERT INTO public.moon VALUES (17, 'Xavi-m2', 20, 5, 'Big');
INSERT INTO public.moon VALUES (18, 'Merce-m2', 15, 6, 'Big');
INSERT INTO public.moon VALUES (19, 'Ati-m3', 30, 1, 'Medium');
INSERT INTO public.moon VALUES (20, 'Zequi-m3', 25, 2, 'Medium');
INSERT INTO public.moon VALUES (21, 'Mica-m3', 22, 3, 'Medium');
INSERT INTO public.moon VALUES (22, 'Agus-m3', 27, 4, 'Small');
INSERT INTO public.moon VALUES (23, 'Xavi-m3', 20, 5, 'Big');
INSERT INTO public.moon VALUES (24, 'Merce-m3', 15, 6, 'Big');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Ati-p', 300, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Zequi-P', 250, true, false, 2);
INSERT INTO public.planet VALUES (3, 'Mica-p', 225, false, true, 3);
INSERT INTO public.planet VALUES (4, 'Agus-p', 275, false, false, 4);
INSERT INTO public.planet VALUES (5, 'Xavi-s', 200, true, true, 5);
INSERT INTO public.planet VALUES (6, 'Merce', 175, true, true, 6);
INSERT INTO public.planet VALUES (7, 'Ati-p2', 300, true, true, 1);
INSERT INTO public.planet VALUES (8, 'Zequi-P2', 250, true, false, 2);
INSERT INTO public.planet VALUES (9, 'Mica-p3', 225, false, true, 3);
INSERT INTO public.planet VALUES (10, 'Agus-p4', 275, false, false, 4);
INSERT INTO public.planet VALUES (11, 'Xavi-P5', 200, true, true, 5);
INSERT INTO public.planet VALUES (12, 'MerceP2', 175, true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Ati-s', 3000, 99.00, 1);
INSERT INTO public.star VALUES (2, 'Zequi-s', 2500, 90.00, 2);
INSERT INTO public.star VALUES (3, 'Mica-s', 2250, 80.00, 2);
INSERT INTO public.star VALUES (4, 'Agus-s', 2750, 70.00, 4);
INSERT INTO public.star VALUES (5, 'Xavi-s', 2000, 70.00, 5);
INSERT INTO public.star VALUES (6, 'Merce', 17500, 60.30, 6);


--
-- Name: comets_comets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comets_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comets comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

