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
-- Name: funfacts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.funfacts (
    funfacts_id integer NOT NULL,
    fact text,
    habitable boolean NOT NULL,
    has_been_explored boolean NOT NULL,
    name character varying(50),
    planet_id integer,
    moon_id integer,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.funfacts OWNER TO freecodecamp;

--
-- Name: funfacts_funfacts_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.funfacts_funfacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funfacts_funfacts_id_seq OWNER TO freecodecamp;

--
-- Name: funfacts_funfacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.funfacts_funfacts_id_seq OWNED BY public.funfacts.funfacts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    avg_temp_celcius numeric(5,1) NOT NULL,
    is_spiral boolean DEFAULT false NOT NULL
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
    name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    avg_temp_celcius numeric(5,1) NOT NULL,
    is_tidally_locked boolean DEFAULT false NOT NULL,
    planet_id integer
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
    name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    avg_temp_celcius numeric(5,1) NOT NULL,
    has_rings boolean DEFAULT false NOT NULL,
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
    name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    avg_temp_celcius numeric(5,1) NOT NULL,
    is_dwarf boolean DEFAULT false NOT NULL,
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
-- Name: funfacts funfacts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts ALTER COLUMN funfacts_id SET DEFAULT nextval('public.funfacts_funfacts_id_seq'::regclass);


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
-- Data for Name: funfacts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.funfacts VALUES (1, 'Earth is the only known planet with life', true, true, 'Earth', 3, NULL, NULL, NULL);
INSERT INTO public.funfacts VALUES (2, 'The Moon is slowly drifting away from Earth', false, true, 'Moon', NULL, 1, NULL, NULL);
INSERT INTO public.funfacts VALUES (3, 'The Sun makes up 99.8% of the solar system mass', false, true, 'Sun', NULL, NULL, 1, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 15.0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 12.5, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 10.0, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 75000, 18.3, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 50000, 22.1, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 170000, 9.5, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, -5.3, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, -4.1, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, -4.0, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 3642, -1.8, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3122, -16.0, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, -15.3, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, -13.9, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, -17.9, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, -19.8, false, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, -20.1, true, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 1527, -18.4, true, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 1123, -18.0, true, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 1062, -17.5, true, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 1578, -21.0, true, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 1523, -21.2, true, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 1158, -21.5, true, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1169, -21.3, true, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 2707, -23.5, true, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 340, -22.8, false, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 418, -22.5, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 16.7, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 46.2, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 15.0, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, -6.3, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, -14.5, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, -17.8, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, -19.9, true, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, -21.3, true, 2);
INSERT INTO public.planet VALUES (9, 'Kepler', 11000, 22.4, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima b', 13000, 11.0, false, 2);
INSERT INTO public.planet VALUES (11, 'Gliese', 15000, 18.5, false, 2);
INSERT INTO public.planet VALUES (12, 'Trappist', 11500, 9.9, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1392000, 15.0, false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2390000, 27.3, false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 900000000, 32.5, false, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 97000000, 18.0, false, 2);
INSERT INTO public.star VALUES (5, 'Vega', 3800000, 24.1, false, 2);
INSERT INTO public.star VALUES (6, 'Aldebaran', 61000000, 20.0, false, 2);


--
-- Name: funfacts_funfacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.funfacts_funfacts_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: funfacts funfacts_fact_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_fact_key UNIQUE (fact);


--
-- Name: funfacts funfacts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_pkey PRIMARY KEY (funfacts_id);


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
-- Name: funfacts funfacts_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: funfacts funfacts_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: funfacts funfacts_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: funfacts funfacts_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.funfacts
    ADD CONSTRAINT funfacts_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

