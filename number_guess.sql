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

DROP DATABASE accounts;
--
-- Name: accounts; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE accounts WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE accounts OWNER TO freecodecamp;

\connect accounts

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.accounts (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.accounts OWNER TO freecodecamp;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.accounts VALUES ('angel', 2, 6);
INSERT INTO public.accounts VALUES ('user_1720878595086', 2, 15);
INSERT INTO public.accounts VALUES ('user_1720878595087', 5, 107);
INSERT INTO public.accounts VALUES ('user_1720878625200', 2, 452);
INSERT INTO public.accounts VALUES ('user_1720878625201', 5, 10);
INSERT INTO public.accounts VALUES ('user_1720878664210', 2, 68);
INSERT INTO public.accounts VALUES ('user_1720878664211', 5, 190);


--
-- Name: accounts accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

