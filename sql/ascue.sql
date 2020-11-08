-- Prepended SQL commands --
INSERT INTO table (cols) VALUES (values);-- ddl-end ---- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 11.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: "ASCUE" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "ASCUE";
-- CREATE DATABASE "ASCUE";
-- -- ddl-end --
-- 

-- object: public.person | type: TABLE --
-- DROP TABLE IF EXISTS public.person CASCADE;
CREATE TABLE public.person (

);
-- ddl-end --

-- object: id | type: COLUMN --
-- ALTER TABLE public.person DROP COLUMN IF EXISTS id CASCADE;
ALTER TABLE public.person ADD COLUMN id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ;
-- ddl-end --


-- object: "FisrtName" | type: COLUMN --
-- ALTER TABLE public.person DROP COLUMN IF EXISTS "FisrtName" CASCADE;
ALTER TABLE public.person ADD COLUMN "FisrtName" varchar(20) NOT NULL;
-- ddl-end --

COMMENT ON COLUMN public.person."FisrtName" IS E'FisrtName';
-- ddl-end --


-- object: "MidName" | type: COLUMN --
-- ALTER TABLE public.person DROP COLUMN IF EXISTS "MidName" CASCADE;
ALTER TABLE public.person ADD COLUMN "MidName" varchar(20) NOT NULL;
-- ddl-end --


-- object: "LastName" | type: COLUMN --
-- ALTER TABLE public.person DROP COLUMN IF EXISTS "LastName" CASCADE;
ALTER TABLE public.person ADD COLUMN "LastName" varchar(20) NOT NULL;
-- ddl-end --


-- ALTER TABLE public.person OWNER TO postgres;
-- ddl-end --

-- object: public."City" | type: TABLE --
-- DROP TABLE IF EXISTS public."City" CASCADE;
CREATE TABLE public."City" (
	id smallint NOT NULL,
	"City" varchar(40) NOT NULL,
	"fk_Region" smallint NOT NULL,
	fk_district smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	CONSTRAINT id PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)

);
-- ddl-end --
-- ALTER TABLE public."City" OWNER TO postgres;
-- ddl-end --

-- object: public."Region" | type: TABLE --
-- DROP TABLE IF EXISTS public."Region" CASCADE;
CREATE TABLE public."Region" (
	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"Region" varchar(30) NOT NULL,
	fk_country smallint NOT NULL,
	CONSTRAINT id_6 PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)

);
-- ddl-end --
-- ALTER TABLE public."Region" OWNER TO postgres;
-- ddl-end --

-- object: public."Country" | type: TABLE --
-- DROP TABLE IF EXISTS public."Country" CASCADE;
CREATE TABLE public."Country" (
	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"Country" varchar(20),
	CONSTRAINT id_5 PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public."Country" OWNER TO postgres;
-- ddl-end --

-- object: public."Street" | type: TABLE --
-- DROP TABLE IF EXISTS public."Street" CASCADE;
CREATE TABLE public."Street" (
	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"Street" varchar(50) NOT NULL,
	fk_city smallint NOT NULL,
	CONSTRAINT id_4 PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public."Street" OWNER TO postgres;
-- ddl-end --

-- object: public."Building" | type: TABLE --
-- DROP TABLE IF EXISTS public."Building" CASCADE;
CREATE TABLE public."Building" (
	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"Number" smallint NOT NULL,
	fk_street smallint NOT NULL,
	CONSTRAINT id_3 PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public."Building" OWNER TO postgres;
-- ddl-end --

-- object: public."Address" | type: TABLE --
-- DROP TABLE IF EXISTS public."Address" CASCADE;
CREATE TABLE public."Address" (
	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"FlatNum" varchar(5) NOT NULL,
	"CorpNum" varchar(5) NOT NULL,
	fk_building smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	CONSTRAINT id_2 PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public."Address" OWNER TO postgres;
-- ddl-end --

-- object: public."District" | type: TABLE --
-- DROP TABLE IF EXISTS public."District" CASCADE;
CREATE TABLE public."District" (
	id smallint NOT NULL,
	"District" varchar(20) NOT NULL,
	"fk_Region" smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	CONSTRAINT id_1 PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public."District" OWNER TO postgres;
-- ddl-end --

-- object: public."PersonToAddress" | type: TABLE --
-- DROP TABLE IF EXISTS public."PersonToAddress" CASCADE;
CREATE TABLE public."PersonToAddress" (
	fk_person smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"fk_Address" smallint NOT NULL GENERATED ALWAYS AS IDENTITY 
);
-- ddl-end --
-- ALTER TABLE public."PersonToAddress" OWNER TO postgres;
-- ddl-end --

-- object: public."MeterPoint" | type: TABLE --
-- DROP TABLE IF EXISTS public."MeterPoint" CASCADE;
CREATE TABLE public."MeterPoint" (
	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"BoatPlace" varchar(5) NOT NULL
);
-- ddl-end --
-- ALTER TABLE public."MeterPoint" OWNER TO postgres;
-- ddl-end --

-- object: public."MeterUnit" | type: TABLE --
-- DROP TABLE IF EXISTS public."MeterUnit" CASCADE;
CREATE TABLE public."MeterUnit" (
	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"485address" smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"SerialNumber" varchar(10) NOT NULL,
	"DateBegin" date,
	"DateEnd" date,
	fk_person smallint NOT NULL GENERATED ALWAYS AS IDENTITY 
);
-- ddl-end --
-- ALTER TABLE public."MeterUnit" OWNER TO postgres;
-- ddl-end --

-- object: public."ElectricCount" | type: TABLE --
-- DROP TABLE IF EXISTS public."ElectricCount" CASCADE;
CREATE TABLE public."ElectricCount" (
	fk_point smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	fk_person smallint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	"CountData" int4,
	"CountDate" date NOT NULL,
	"fk_MeterUnit" smallint NOT NULL
);
-- ddl-end --
-- ALTER TABLE public."ElectricCount" OWNER TO postgres;
-- ddl-end --

-- object: public."Owner" | type: VIEW --
-- DROP VIEW IF EXISTS public."Owner" CASCADE;
CREATE VIEW public."Owner"
AS 

SELECT
   "vLastName"."LastName" AS vlastname,
   public.person."FisrtName",
   public.person."MidName",
   public."MeterPoint"."BoatPlace";
-- ddl-end --
-- ALTER VIEW public."Owner" OWNER TO postgres;
-- ddl-end --

-- object: "fk_Region" | type: CONSTRAINT --
-- ALTER TABLE public."City" DROP CONSTRAINT IF EXISTS "fk_Region" CASCADE;
ALTER TABLE public."City" ADD CONSTRAINT "fk_Region" FOREIGN KEY ("fk_Region")
REFERENCES public."Region" (id) MATCH FULL
ON DELETE SET DEFAULT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_region | type: CONSTRAINT --
-- ALTER TABLE public."City" DROP CONSTRAINT IF EXISTS fk_region CASCADE;
ALTER TABLE public."City" ADD CONSTRAINT fk_region FOREIGN KEY (fk_district)
REFERENCES public."District" (id) MATCH FULL
ON DELETE SET DEFAULT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_country | type: CONSTRAINT --
-- ALTER TABLE public."Region" DROP CONSTRAINT IF EXISTS fk_country CASCADE;
ALTER TABLE public."Region" ADD CONSTRAINT fk_country FOREIGN KEY (fk_country)
REFERENCES public."Country" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_street | type: CONSTRAINT --
-- ALTER TABLE public."Street" DROP CONSTRAINT IF EXISTS fk_street CASCADE;
ALTER TABLE public."Street" ADD CONSTRAINT fk_street FOREIGN KEY (fk_city)
REFERENCES public."City" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_street | type: CONSTRAINT --
-- ALTER TABLE public."Building" DROP CONSTRAINT IF EXISTS fk_street CASCADE;
ALTER TABLE public."Building" ADD CONSTRAINT fk_street FOREIGN KEY (fk_street)
REFERENCES public."Street" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_building | type: CONSTRAINT --
-- ALTER TABLE public."Address" DROP CONSTRAINT IF EXISTS fk_building CASCADE;
ALTER TABLE public."Address" ADD CONSTRAINT fk_building FOREIGN KEY (fk_building)
REFERENCES public."Building" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_region | type: CONSTRAINT --
-- ALTER TABLE public."District" DROP CONSTRAINT IF EXISTS fk_region CASCADE;
ALTER TABLE public."District" ADD CONSTRAINT fk_region FOREIGN KEY ("fk_Region")
REFERENCES public."Region" (id) MATCH FULL
ON DELETE SET DEFAULT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_person | type: CONSTRAINT --
-- ALTER TABLE public."PersonToAddress" DROP CONSTRAINT IF EXISTS fk_person CASCADE;
ALTER TABLE public."PersonToAddress" ADD CONSTRAINT fk_person FOREIGN KEY (fk_person)
REFERENCES public.person (id) MATCH FULL
ON DELETE SET DEFAULT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_address | type: CONSTRAINT --
-- ALTER TABLE public."PersonToAddress" DROP CONSTRAINT IF EXISTS fk_address CASCADE;
ALTER TABLE public."PersonToAddress" ADD CONSTRAINT fk_address FOREIGN KEY ("fk_Address")
REFERENCES public."Address" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_person | type: CONSTRAINT --
-- ALTER TABLE public."MeterUnit" DROP CONSTRAINT IF EXISTS fk_person CASCADE;
ALTER TABLE public."MeterUnit" ADD CONSTRAINT fk_person FOREIGN KEY (fk_person)
REFERENCES public.person (id) MATCH FULL
ON DELETE SET DEFAULT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_point | type: CONSTRAINT --
-- ALTER TABLE public."ElectricCount" DROP CONSTRAINT IF EXISTS fk_point CASCADE;
ALTER TABLE public."ElectricCount" ADD CONSTRAINT fk_point FOREIGN KEY (fk_point)
REFERENCES public."MeterPoint" (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_person | type: CONSTRAINT --
-- ALTER TABLE public."ElectricCount" DROP CONSTRAINT IF EXISTS fk_person CASCADE;
ALTER TABLE public."ElectricCount" ADD CONSTRAINT fk_person FOREIGN KEY (fk_person)
REFERENCES public.person (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_meterunit | type: CONSTRAINT --
-- ALTER TABLE public."ElectricCount" DROP CONSTRAINT IF EXISTS fk_meterunit CASCADE;
ALTER TABLE public."ElectricCount" ADD CONSTRAINT fk_meterunit FOREIGN KEY ("fk_MeterUnit")
REFERENCES public."MeterUnit" (id) MATCH FULL
ON DELETE SET DEFAULT ON UPDATE CASCADE;
-- ddl-end --


-- Appended SQL commands --
INSERT INTO table (cols) VALUES (values);
-- ddl-end --