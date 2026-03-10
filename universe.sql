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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    speed_in_km_per_hr integer NOT NULL,
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text
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
    planet_id integer NOT NULL,
    moon_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    description text
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
    planet_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
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
    name character varying(30) NOT NULL,
    star_type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    description text,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 252000, true, 'Famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 158000, false, 'Very bright comet');
INSERT INTO public.comet VALUES (3, 'Encke', 250000, true, 'Shortv period comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, true, true, 'Home galaxy of earth');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, false, true, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 30000000.00, false, true, 'Member of the local group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 14000, 23000000.00, false, true, 'Known for spiral structure');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 13000, 29000000.00, false, true, 'Bright central budge');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular', 500, 500000000.00, false, true, 'Ring-shaped galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Rocky', 4500, 1.00, true, false, 'Earth moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Rocky', 4500, 1.52, false, false, 'Moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Rocky', 4500, 1.52, false, false, 'Moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Volcanic', 4500, 5.20, true, false, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Icy', 4500, 5.20, true, false, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Rocky', 4500, 5.20, true, false, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Rocky', 4500, 5.20, true, false, 'Moon of Jupiter');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Icy', 4500, 9.58, true, false, 'Moon of Saturn');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Icy', 4500, 9.58, true, false, 'Moon with ice geysers');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Rocky', 4500, 9.58, true, false, 'Moon of Saturn');
INSERT INTO public.moon VALUES (11, 'Triton', 8, 'Icy', 4500, 30.05, true, false, 'Moon of Neptune');
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 'Rocky', 4500, 30.05, false, false, 'Moon of Neptune');
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 'Rocky', 4500, 19.20, true, false, 'Moon of uranus');
INSERT INTO public.moon VALUES (14, 'Titania', 7, 'Rocky', 4500, 19.20, true, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Rocky', 4500, 19.20, true, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'Rocky', 4500, 19.20, true, false, 'Moon of Uranus');
INSERT INTO public.moon VALUES (17, 'ProxMoon1', 9, 'Rocky', 4700, 4.24, true, false, 'Fictional moon');
INSERT INTO public.moon VALUES (18, 'SiriusMoon1', 10, 'Icy', 250, 8.60, true, false, 'Fictional moon');
INSERT INTO public.moon VALUES (19, 'BetelMoon1', 11, 'Rocky', 8500, 642.50, true, false, 'Fictional moon');
INSERT INTO public.moon VALUES (21, 'MirandaMoon1', 3, 'Rocky', 5500, 800.00, true, false, 'Fictional Moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 4500, 0.39, false, true, 'Closest planet of the Sun', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 4500, 0.72, false, true, 'Hot planet with thick atmosphere', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 4500, 1.00, true, true, 'Only planet known with life', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 4500, 1.52, false, true, 'Known as the red planet', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 4500, 5.20, false, true, 'Largest planet', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', 4500, 9.58, false, true, 'Known for rings', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 4500, 19.20, false, true, 'Tilted planet', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 4500, 30.05, false, true, 'Furthest major planet', 1);
INSERT INTO public.planet VALUES (9, 'Proxima B', 'Terrestrial', 4800, 4.24, false, true, 'Exoplanet orbiting Proxima Centauri', 2);
INSERT INTO public.planet VALUES (10, 'Sirius B planet', 'Gas Giant', 300, 8.60, false, true, 'Fictional Planet', 3);
INSERT INTO public.planet VALUES (11, 'Betel Prime', 'Gas Giant', 9000, 642.50, false, true, 'Fictional planet near Betelgeuse', 4);
INSERT INTO public.planet VALUES (12, 'Rigel X', 'Ice Giant', 7000, 860.00, false, true, 'Fictional planet near Rigel', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 4600, 0.00, true, false, 'Star of the solar system', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 4500, 4.24, true, false, 'Closest star to the Sun', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-type', 242, 8.60, true, false, 'Brightest star in the night sky', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant', 10000, 642.50, true, false, 'Red Large Star', 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue Supergiant', 8000, 860.00, true, false, 'Bright blue star', 1);
INSERT INTO public.star VALUES (6, 'Andromeda Star A', 'Yellow Dwarf', 5000, 2537000.00, true, false, 'Fictional star in Andromeda', 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

