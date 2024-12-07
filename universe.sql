--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: full_joined_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.full_joined_table (
    star_id integer,
    star_shape text,
    star_type text,
    star_has_life boolean,
    star_age_bln integer,
    star_distance_bln numeric(6,3),
    star_mass_sl integer,
    galaxy_id integer,
    galaxy_shape text,
    galaxy_type text,
    galaxy_has_life boolean,
    galaxy_age_bln integer,
    galaxy_distance_bln numeric(6,3),
    galaxy_mass_tln_sl integer,
    planet_id integer,
    planet_shape text,
    planet_type text,
    planet_has_life boolean,
    planet_age_bln integer,
    planet_distance_bln numeric(6,3),
    planet_mass_er integer,
    moon_id integer,
    moon_shape text,
    moon_type text,
    moon_has_life boolean,
    moon_age_bln integer,
    moon_distance_bln numeric(6,3),
    moon_mass_mn integer
);


ALTER TABLE public.full_joined_table OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    g_name character varying(30) NOT NULL,
    shape text NOT NULL,
    type text NOT NULL,
    has_life boolean NOT NULL,
    age_bln integer NOT NULL,
    distance_bln numeric(6,3) NOT NULL,
    mass_tln_sl integer NOT NULL
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
    m_name character varying(30) NOT NULL,
    shape text NOT NULL,
    type text NOT NULL,
    has_life boolean NOT NULL,
    age_bln integer NOT NULL,
    distance_bln numeric(6,3) NOT NULL,
    mass_mn integer NOT NULL,
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
    p_name character varying(30) NOT NULL,
    shape text NOT NULL,
    type text NOT NULL,
    has_life boolean NOT NULL,
    age_bln integer NOT NULL,
    distance_bln numeric(6,3) NOT NULL,
    mass_er integer NOT NULL,
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
    s_name character varying(30) NOT NULL,
    shape text NOT NULL,
    type text NOT NULL,
    has_life boolean NOT NULL,
    age_bln integer NOT NULL,
    distance_bln numeric(6,3) NOT NULL,
    mass_sl integer NOT NULL,
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
-- Data for Name: full_joined_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 1, 'Spherical', 'Rocky', true, 4, 0.000, 1, 1, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 2, 'Spherical', 'Rocky', false, 4, 0.000, 1, 2, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 3, 'Spherical', 'Rocky', false, 4, 0.000, 1, 3, 'Irregular', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 3, 'Spherical', 'Rocky', false, 4, 0.000, 1, 4, 'Irregular', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 4, 'Spherical', 'Gaseus', false, 4, 0.000, 95, 5, 'Spherical', 'Icy', false, 4, 0.000, 2);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 4, 'Spherical', 'Gaseus', false, 4, 0.000, 95, 6, 'Spherical', 'Icy', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 4, 'Spherical', 'Gaseus', false, 4, 0.000, 95, 7, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 4, 'Spherical', 'Gaseus', false, 4, 0.000, 95, 8, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 4, 'Spherical', 'Gaseus', false, 4, 0.000, 95, 9, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 5, 'Spherical', 'Gaseus', false, 4, 0.000, 318, 10, 'Spherical', 'Rocky', false, 4, 0.000, 3);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 5, 'Spherical', 'Gaseus', false, 4, 0.000, 318, 11, 'Spherical', 'Rocky', false, 4, 0.000, 2);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 5, 'Spherical', 'Gaseus', false, 4, 0.000, 318, 12, 'Spherical', 'Rocky', false, 4, 0.000, 2);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 6, 'Spherical', 'Gaseus', false, 4, 0.000, 17, 13, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (1, 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1, 'Spiral', 'SBc', true, 0, 13.600, 1, 7, 'Spherical', 'Gaseus', false, 4, 0.000, 14, 14, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (2, 'Spherical', 'Tidal Disruption Event', false, 10, 0.750, 1, 2, 'Elongated Elliptical', 'Starburst', false, 13, 0.012, 2, 8, 'Spherical', 'Watery', false, 4, 0.750, 1, 15, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (3, 'Spherical', 'Pulsar', false, 0, 0.012, 2, 3, 'Spiral', 'SA(s)ab', false, 13, 0.012, 1, 9, 'Spherical', 'Saucy', false, 4, 0.750, 1, 16, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (4, 'Ellipsoid', 'IIb supernova', false, 0, 0.011, 14, 4, 'Irregular', 'SA(s)ab', false, 13, 0.120, 2, 10, 'Spherical', 'Soda', false, 4, 0.750, 1, 17, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (5, 'Elliptical', 'Yellow Hypergiant', false, 0, 0.011, 32, 5, 'Elongated Spiral', 'SA(s)ab', false, 13, 0.120, 1, 11, 'Spherical', 'Juicy', false, 4, 0.750, 1, 18, 'Spherical', 'Rocky', false, 4, 0.000, 1);
INSERT INTO public.full_joined_table VALUES (6, 'Spherical', 'G-Type', true, 4, 0.000, 11, 6, 'Irregular', 'SA(s)ab', true, 13, 0.500, 3, 12, 'Spherical', 'Pulpy', true, 4, 0.750, 1, 19, 'Spherical', 'Rocky', false, 4, 0.000, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'SBc', true, 0, 13.600, 1);
INSERT INTO public.galaxy VALUES (2, 'Watery Way ', 'Elongated Elliptical', 'Starburst', false, 13, 0.012, 2);
INSERT INTO public.galaxy VALUES (3, 'Saucy Way', 'Spiral', 'SA(s)ab', false, 13, 0.012, 1);
INSERT INTO public.galaxy VALUES (4, 'Soda Way', 'Irregular', 'SA(s)ab', false, 13, 0.120, 2);
INSERT INTO public.galaxy VALUES (5, 'Juicy Way', 'Elongated Spiral', 'SA(s)ab', false, 13, 0.120, 1);
INSERT INTO public.galaxy VALUES (6, 'Pulpy Way', 'Irregular', 'SA(s)ab', true, 13, 0.500, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Spherical', 'Rocky', false, 4, 0.000, 1, 1);
INSERT INTO public.moon VALUES (2, 'Zoozve', 'Spherical', 'Rocky', false, 4, 0.000, 1, 2);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Irregular', 'Rocky', false, 4, 0.000, 1, 3);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Irregular', 'Rocky', false, 4, 0.000, 1, 3);
INSERT INTO public.moon VALUES (5, 'Titan', 'Spherical', 'Icy', false, 4, 0.000, 2, 4);
INSERT INTO public.moon VALUES (6, 'Enceladus', 'Spherical', 'Icy', false, 4, 0.000, 1, 4);
INSERT INTO public.moon VALUES (7, 'Mimas', 'Spherical', 'Rocky', false, 4, 0.000, 1, 4);
INSERT INTO public.moon VALUES (8, 'Dione', 'Spherical', 'Rocky', false, 4, 0.000, 1, 4);
INSERT INTO public.moon VALUES (9, 'Iapetus', 'Spherical', 'Rocky', false, 4, 0.000, 1, 4);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'Spherical', 'Rocky', false, 4, 0.000, 3, 5);
INSERT INTO public.moon VALUES (11, 'Europa', 'Spherical', 'Rocky', false, 4, 0.000, 2, 5);
INSERT INTO public.moon VALUES (12, 'Io', 'Spherical', 'Rocky', false, 4, 0.000, 2, 5);
INSERT INTO public.moon VALUES (13, 'Triton', 'Spherical', 'Rocky', false, 4, 0.000, 1, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'Spherical', 'Rocky', false, 4, 0.000, 1, 7);
INSERT INTO public.moon VALUES (15, 'W-moon', 'Spherical', 'Rocky', false, 4, 0.000, 1, 8);
INSERT INTO public.moon VALUES (16, 'Sa-Moon', 'Spherical', 'Rocky', false, 4, 0.000, 1, 9);
INSERT INTO public.moon VALUES (17, 'So-Moon', 'Spherical', 'Rocky', false, 4, 0.000, 1, 10);
INSERT INTO public.moon VALUES (18, 'J-Moon', 'Spherical', 'Rocky', false, 4, 0.000, 1, 11);
INSERT INTO public.moon VALUES (19, 'P-moon', 'Spherical', 'Rocky', false, 4, 0.000, 1, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Spherical', 'Rocky', true, 4, 0.000, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Spherical', 'Rocky', false, 4, 0.000, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 'Spherical', 'Rocky', false, 4, 0.000, 1, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Spherical', 'Gaseus', false, 4, 0.000, 95, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Spherical', 'Gaseus', false, 4, 0.000, 318, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Spherical', 'Gaseus', false, 4, 0.000, 17, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Spherical', 'Gaseus', false, 4, 0.000, 14, 1);
INSERT INTO public.planet VALUES (8, 'Watery-Earth', 'Spherical', 'Watery', false, 4, 0.750, 1, 2);
INSERT INTO public.planet VALUES (9, 'Saucy-Earth', 'Spherical', 'Saucy', false, 4, 0.750, 1, 3);
INSERT INTO public.planet VALUES (10, 'Soda-Earth', 'Spherical', 'Soda', false, 4, 0.750, 1, 4);
INSERT INTO public.planet VALUES (11, 'Juicy-Earth', 'Spherical', 'Juicy', false, 4, 0.750, 1, 5);
INSERT INTO public.planet VALUES (12, 'Pulpy-Earth', 'Spherical', 'Pulpy', true, 4, 0.750, 1, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Spherical', 'Yellow Dwarf', true, 5, 0.000, 1, 1);
INSERT INTO public.star VALUES (2, 'W-Sun', 'Spherical', 'Tidal Disruption Event', false, 10, 0.750, 1, 2);
INSERT INTO public.star VALUES (3, 'S-Sun', 'Spherical', 'Pulsar', false, 0, 0.012, 2, 3);
INSERT INTO public.star VALUES (4, 'Soda-Sun', 'Ellipsoid', 'IIb supernova', false, 0, 0.011, 14, 4);
INSERT INTO public.star VALUES (5, 'Juicy-Sun', 'Elliptical', 'Yellow Hypergiant', false, 0, 0.011, 32, 5);
INSERT INTO public.star VALUES (6, 'Pulpy-Sun', 'Spherical', 'G-Type', true, 4, 0.000, 11, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 19, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (g_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (m_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (p_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (s_name);


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

