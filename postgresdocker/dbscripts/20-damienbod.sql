--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

-- Started on 2017-01-27 10:44:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2148 (class 1262 OID 24576)
-- Name: damienbod; Type: DATABASE; Schema: -; Owner: damienbod
--

CREATE DATABASE damienbod WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE damienbod OWNER TO damienbod;

\connect damienbod

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 189 (class 1259 OID 24595)
-- Name: DataEventRecords; Type: TABLE; Schema: public; Owner: damienbod
--

CREATE TABLE "DataEventRecords" (
    "DataEventRecordId" bigint NOT NULL,
    "Description" text,
    "Name" text,
    "SourceInfoId" bigint NOT NULL,
    "Timestamp" timestamp without time zone NOT NULL,
    "UpdatedTimestamp" timestamp without time zone NOT NULL
);


ALTER TABLE "DataEventRecords" OWNER TO damienbod;

--
-- TOC entry 188 (class 1259 OID 24593)
-- Name: DataEventRecords_DataEventRecordId_seq; Type: SEQUENCE; Schema: public; Owner: damienbod
--

CREATE SEQUENCE "DataEventRecords_DataEventRecordId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "DataEventRecords_DataEventRecordId_seq" OWNER TO damienbod;

--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 188
-- Name: DataEventRecords_DataEventRecordId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damienbod
--

ALTER SEQUENCE "DataEventRecords_DataEventRecordId_seq" OWNED BY "DataEventRecords"."DataEventRecordId";


--
-- TOC entry 187 (class 1259 OID 24584)
-- Name: SourceInfos; Type: TABLE; Schema: public; Owner: damienbod
--

CREATE TABLE "SourceInfos" (
    "SourceInfoId" bigint NOT NULL,
    "Description" text,
    "Name" text,
    "Timestamp" timestamp without time zone NOT NULL,
    "UpdatedTimestamp" timestamp without time zone NOT NULL
);


ALTER TABLE "SourceInfos" OWNER TO damienbod;

--
-- TOC entry 186 (class 1259 OID 24582)
-- Name: SourceInfos_SourceInfoId_seq; Type: SEQUENCE; Schema: public; Owner: damienbod
--

CREATE SEQUENCE "SourceInfos_SourceInfoId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "SourceInfos_SourceInfoId_seq" OWNER TO damienbod;

--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 186
-- Name: SourceInfos_SourceInfoId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: damienbod
--

ALTER SEQUENCE "SourceInfos_SourceInfoId_seq" OWNED BY "SourceInfos"."SourceInfoId";


--
-- TOC entry 185 (class 1259 OID 24577)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: damienbod
--

CREATE TABLE "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE "__EFMigrationsHistory" OWNER TO damienbod;

--
-- TOC entry 2018 (class 2604 OID 24598)
-- Name: DataEventRecords DataEventRecordId; Type: DEFAULT; Schema: public; Owner: damienbod
--

ALTER TABLE ONLY "DataEventRecords" ALTER COLUMN "DataEventRecordId" SET DEFAULT nextval('"DataEventRecords_DataEventRecordId_seq"'::regclass);


--
-- TOC entry 2017 (class 2604 OID 24587)
-- Name: SourceInfos SourceInfoId; Type: DEFAULT; Schema: public; Owner: damienbod
--

ALTER TABLE ONLY "SourceInfos" ALTER COLUMN "SourceInfoId" SET DEFAULT nextval('"SourceInfos_SourceInfoId_seq"'::regclass);


--
-- TOC entry 2025 (class 2606 OID 24603)
-- Name: DataEventRecords PK_DataEventRecords; Type: CONSTRAINT; Schema: public; Owner: damienbod
--

ALTER TABLE ONLY "DataEventRecords"
    ADD CONSTRAINT "PK_DataEventRecords" PRIMARY KEY ("DataEventRecordId");


--
-- TOC entry 2022 (class 2606 OID 24592)
-- Name: SourceInfos PK_SourceInfos; Type: CONSTRAINT; Schema: public; Owner: damienbod
--

ALTER TABLE ONLY "SourceInfos"
    ADD CONSTRAINT "PK_SourceInfos" PRIMARY KEY ("SourceInfoId");


--
-- TOC entry 2020 (class 2606 OID 24581)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: damienbod
--

ALTER TABLE ONLY "__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 2023 (class 1259 OID 24609)
-- Name: IX_DataEventRecords_SourceInfoId; Type: INDEX; Schema: public; Owner: damienbod
--

CREATE INDEX "IX_DataEventRecords_SourceInfoId" ON "DataEventRecords" USING btree ("SourceInfoId");


--
-- TOC entry 2026 (class 2606 OID 24604)
-- Name: DataEventRecords FK_DataEventRecords_SourceInfos_SourceInfoId; Type: FK CONSTRAINT; Schema: public; Owner: damienbod
--

ALTER TABLE ONLY "DataEventRecords"
    ADD CONSTRAINT "FK_DataEventRecords_SourceInfos_SourceInfoId" FOREIGN KEY ("SourceInfoId") REFERENCES "SourceInfos"("SourceInfoId") ON DELETE CASCADE;


-- Completed on 2017-01-27 10:44:09

--
-- PostgreSQL database dump complete
--

