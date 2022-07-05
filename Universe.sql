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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_type text,
    name character varying NOT NULL,
    is_spherical boolean DEFAULT false,
    galaxy_size numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_earth integer,
    moon_rotation text,
    moon_mass integer,
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
    name character varying(30) NOT NULL,
    planet_type text,
    description text,
    age_in_million integer,
    has_life boolean DEFAULT true,
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
-- Name: satelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelite (
    satelite_id integer NOT NULL,
    name character varying NOT NULL,
    distance numeric,
    type_of_satelite text,
    shape text,
    moon_id integer
);


ALTER TABLE public.satelite OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satelite_satelite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satelite_satelite_id_seq OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satelite_satelite_id_seq OWNED BY public.satelite.satelite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    star_size integer,
    star_mass integer,
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satelite satelite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite ALTER COLUMN satelite_id SET DEFAULT nextval('public.satelite_satelite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('spiral', 'Andromeda', false, 11, 1);
INSERT INTO public.galaxy VALUES ('spiral', 'Milky Way', false, 1100, 2);
INSERT INTO public.galaxy VALUES ('spiral', 'whirlpool', true, 76000, 3);
INSERT INTO public.galaxy VALUES ('spiral', 'black eye', true, 180000, 4);
INSERT INTO public.galaxy VALUES ('spiral', 'Messier', true, 380000, 6);
INSERT INTO public.galaxy VALUES ('hat shaped', 'Sombrero', true, 80000, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'WOLF MOON', 120000, 'revolve around at its axis at the speed of 29.5 days', 450, 1);
INSERT INTO public.moon VALUES (2, 'SNOW MOON', 345, 'spiral', 136, 2);
INSERT INTO public.moon VALUES (3, 'WORM MOON', 375, 'around its axis', 1466, 3);
INSERT INTO public.moon VALUES (4, 'PINK MOON', 7235, 'around its axis', 1346, 4);
INSERT INTO public.moon VALUES (5, 'FLOWER MOON', 56235, 'around its axis', 1346, 5);
INSERT INTO public.moon VALUES (6, 'STRAWBERRY MOON', 50000, 'around its axis', 166, 7);
INSERT INTO public.moon VALUES (8, 'STURGEON', 234, 'clockwise', 78000, 8);
INSERT INTO public.moon VALUES (9, 'full moon', 234, 'clockwise', 780003, 3);
INSERT INTO public.moon VALUES (10, 'half moon', 234, 'clockwise', 780003, 3);
INSERT INTO public.moon VALUES (11, 'last quarte  moon', 234, 'clockwise', 780003, 3);
INSERT INTO public.moon VALUES (12, 'waxing crescent moon', 234, 'clockwise', 780003, 3);
INSERT INTO public.moon VALUES (13, 'wanning gibbousmoon', 234, 'clockwise', 780003, 3);
INSERT INTO public.moon VALUES (14, 'full corn moon', 2334, 'clockwise', 7003, 5);
INSERT INTO public.moon VALUES (15, 'hunter moon', 2334, 'clockwise', 7003, 4);
INSERT INTO public.moon VALUES (16, 'Beaver moon', 2334, 'clockwise', 7003, 4);
INSERT INTO public.moon VALUES (17, 'cold  moon', 2334, 'clockwise', 7003, 4);
INSERT INTO public.moon VALUES (18, 'blue moon', 2334, 'clockwise', 7003, 4);
INSERT INTO public.moon VALUES (19, ' moon 19', 2334, 'clockwise', 7003, 4);
INSERT INTO public.moon VALUES (20, ' moon', 2334, 'clockwise', 7003, 4);
INSERT INTO public.moon VALUES (21, ' moon 20', 2334, 'clockwise', 7003, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terestrial', 'smallest planet and close to earth', 5, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Aristoteles', 'carnivores plant estimatesd to thousand meter long', 2, true, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 'Terestrial planet', 'made up of roczks and metal', 3, true, 3);
INSERT INTO public.planet VALUES (4, 'Earth', 'ellipsoid', 'densest planet in solar system', 4, true, 4);
INSERT INTO public.planet VALUES (5, 'jupiter', 'gas giant', 'solid inner core about the size of earth', 3, true, 5);
INSERT INTO public.planet VALUES (6, 'saturn', 'gas giant', 'does not have a solid surface', 4, true, 6);
INSERT INTO public.planet VALUES (7, 'uranus', 'ice giant', 'does not have a solid surface', 4, true, 2);
INSERT INTO public.planet VALUES (8, 'neptune', 'ice giant', 'does not have a solid surface', 6, true, 3);
INSERT INTO public.planet VALUES (9, 'TOOI ', 'ice giant', 'does not have a solid surface', 4, true, 2);
INSERT INTO public.planet VALUES (10, 'KOI ', 'ice giant', 'does not have a solid surface', 4, true, 2);
INSERT INTO public.planet VALUES (11, 'GJ3470 ', 'ice giant', 'does not have a solid surface', 4, true, 2);
INSERT INTO public.planet VALUES (12, 'I70 ', 'ice giant', 'does not have a solid surface', 4, true, 2);


--
-- Data for Name: satelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelite VALUES (1, 'AIM', 123, 'To study noctulent cloud', 'box shaped', 1);
INSERT INTO public.satelite VALUES (2, 'ARIEL', 123, 'To study noctulent cloud', 'box shaped', 2);
INSERT INTO public.satelite VALUES (3, 'BIOSATELITE', 123, 'BILOLOGY STUDY', 'box shaped', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Europa', 628, 1560, 186000, 2);
INSERT INTO public.star VALUES (2, 'TitTan', 633, 124, 14000, 1);
INSERT INTO public.star VALUES (3, 'Perdiita', 767, 15, 180000, 3);
INSERT INTO public.star VALUES (4, 'LEO', 345, 12345, 12000, 4);
INSERT INTO public.star VALUES (5, 'taurus', 4565, 14545, 42000, 6);
INSERT INTO public.star VALUES (6, 'canis Major', 452365, 145245, 40000, 5);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satelite_satelite_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: satelite satelite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_name_key UNIQUE (name);


--
-- Name: satelite satelite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_pkey PRIMARY KEY (satelite_id);


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
-- Name: satelite satelite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

