--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.spectacles_representation DROP CONSTRAINT spectacles_repre_lieu_id_58f1477fe9100be6_fk_spectacles_lieu_id;
ALTER TABLE ONLY public.spectacles_artiste_association DROP CONSTRAINT spectacles_artiste_id_5a18e7d786ff5afb_fk_spectacles_artiste_id;
ALTER TABLE ONLY public.spectacles_spectacle_participants DROP CONSTRAINT spectacles_artiste_id_4f4c58530e6e6c51_fk_spectacles_artiste_id;
ALTER TABLE ONLY public.spectacles_artiste_allowed_users DROP CONSTRAINT spectacles_artiste_id_43f234f9fa83a9c0_fk_spectacles_artiste_id;
ALTER TABLE ONLY public.spectacles_representation_allowed_users DROP CONSTRAINT spectacles__customuser_id_74337a878a29c160_fk_crm_customuser_id;
ALTER TABLE ONLY public.spectacles_artiste_allowed_users DROP CONSTRAINT spectacles__customuser_id_5d40b12a4791b9a7_fk_crm_customuser_id;
ALTER TABLE ONLY public.spectacles_spectacle_allowed_user DROP CONSTRAINT spectacles__customuser_id_3a2ec833d989bd00_fk_crm_customuser_id;
ALTER TABLE ONLY public.spectacles_representation_festival DROP CONSTRAINT spectacl_festival_id_40333618331147cb_fk_spectacles_festival_id;
ALTER TABLE ONLY public.spectacles_spectacle_participants DROP CONSTRAINT specta_spectacle_id_5df655e2441a76f2_fk_spectacles_spectacle_id;
ALTER TABLE ONLY public.spectacles_spectacle_associations DROP CONSTRAINT specta_spectacle_id_4ffe4e28a33af5f1_fk_spectacles_spectacle_id;
ALTER TABLE ONLY public.spectacles_spectacle_allowed_user DROP CONSTRAINT specta_spectacle_id_4a9ffbdfad00e544_fk_spectacles_spectacle_id;
ALTER TABLE ONLY public.spectacles_representation DROP CONSTRAINT specta_spectacle_id_14778bcb4823f4bf_fk_spectacles_spectacle_id;
ALTER TABLE ONLY public.spectacles_lieu DROP CONSTRAINT spec_region_id_3746ba12140196b6_fk_associations_regionchild2_id;
ALTER TABLE ONLY public.spectacles_spectacle_parent DROP CONSTRAINT spe_to_spectacle_id_66ecc548bf8b07b4_fk_spectacles_spectacle_id;
ALTER TABLE ONLY public.spectacles_spectacle_parent DROP CONSTRAINT s_from_spectacle_id_609abc9adceb2413_fk_spectacles_spectacle_id;
ALTER TABLE ONLY public.spectacles_spectacle_associations DROP CONSTRAINT s_association_id_9db26d0133cd73d_fk_associations_association_id;
ALTER TABLE ONLY public.spectacles_artiste_association DROP CONSTRAINT s_association_id_863a425ce6017bc_fk_associations_association_id;
ALTER TABLE ONLY public.spectacles_categoriespectacle DROP CONSTRAINT parent_id_7204bc82c5b15b36_fk_spectacles_categoriespectacle_id;
ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_user_id_fkey;
ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_permission_id_fkey;
ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_content_type_id_fkey;
ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_permission_id_fkey;
ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_group_id_fkey;
ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_content_type_id_fkey;
ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatpage_site_site_id_6549701f5c39659c_fk_django_site_id;
ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatp_flatpage_id_727e27942073c4d4_fk_django_flatpage_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_68ffdc180783ded0_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT djan_content_type_id_4a6fe69c215995bb_fk_django_content_type_id;
ALTER TABLE ONLY public.associations_categorieassociation DROP CONSTRAINT d9a91e3cb4b30e25f3274a1a6dcb62ae;
ALTER TABLE ONLY public.crm_customuser DROP CONSTRAINT crm_customuser_user_id_539f1908ae6b5133_fk_auth_user_id;
ALTER TABLE ONLY public.associations_categorieassociation DROP CONSTRAINT ca4f62903df581ffddc422b8f63d2c6a;
ALTER TABLE ONLY public.associations_association DROP CONSTRAINT c167f9d7bf801da24b1ac6bf8921bb37;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permiss_user_id_3922460c01950169_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_u_permission_id_b1c6f8c682278f4_fk_auth_permission_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6b9239efb216dd3e_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_1005b7a7d861ea2d_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permission_id_5feda0dfea2609e2_fk_auth_permission_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_group_id_4aa11bf2b135e9a4_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_content_type_id_632d7cc91fd28baf_fk_django_content_type_id;
ALTER TABLE ONLY public.associations_regionchild DROP CONSTRAINT associatio_region_id_76e585f9632b98bf_fk_associations_region_id;
ALTER TABLE ONLY public.associations_association DROP CONSTRAINT "D746f71e77205178b685dbbfab9a0b50";
ALTER TABLE ONLY public.associations_regionchild2 DROP CONSTRAINT "D73fb89d7e3179b9cc18d07d15c1e6f9";
ALTER TABLE ONLY public.spectacles_representation_festival DROP CONSTRAINT "D5b1a9df863c6edd748505a64266c86f";
ALTER TABLE ONLY public.spectacles_representation_allowed_users DROP CONSTRAINT "D10410d9d8f0d22335f61ea74ce0fe88";
ALTER TABLE ONLY public.spectacles_spectacle DROP CONSTRAINT "D08e4ac1db13895c15a8a7c0241f4724";
DROP INDEX public.spectacles_spectacle_participants_24fa59d8;
DROP INDEX public.spectacles_spectacle_participants_0053364f;
DROP INDEX public.spectacles_spectacle_parent_a3ce12ad;
DROP INDEX public.spectacles_spectacle_parent_8f337348;
DROP INDEX public.spectacles_spectacle_associations_da6195d4;
DROP INDEX public.spectacles_spectacle_associations_0053364f;
DROP INDEX public.spectacles_spectacle_allowed_user_721e74b0;
DROP INDEX public.spectacles_spectacle_allowed_user_0053364f;
DROP INDEX public.spectacles_spectacle_2dbcba41;
DROP INDEX public.spectacles_spectacle_0a1d6b76;
DROP INDEX public.spectacles_representation_festival_8fbcecd5;
DROP INDEX public.spectacles_representation_festival_3da12c3a;
DROP INDEX public.spectacles_representation_allowed_users_721e74b0;
DROP INDEX public.spectacles_representation_allowed_users_3da12c3a;
DROP INDEX public.spectacles_representation_8fbcc0f2;
DROP INDEX public.spectacles_representation_0053364f;
DROP INDEX public.spectacles_lieu_2dbcba41;
DROP INDEX public.spectacles_lieu_0f442f96;
DROP INDEX public.spectacles_festival_2dbcba41;
DROP INDEX public.spectacles_categoriespectacle_6be37982;
DROP INDEX public.spectacles_categoriespectacle_2dbcba41;
DROP INDEX public.spectacles_artiste_association_da6195d4;
DROP INDEX public.spectacles_artiste_association_24fa59d8;
DROP INDEX public.spectacles_artiste_allowed_users_721e74b0;
DROP INDEX public.spectacles_artiste_allowed_users_24fa59d8;
DROP INDEX public.spectacles_artiste_2dbcba41;
DROP INDEX public.moderation_moderatedobject_moderated_by_id;
DROP INDEX public.moderation_moderatedobject_content_type_id;
DROP INDEX public.moderation_moderatedobject_changed_by_id;
DROP INDEX public.guardian_userobjectpermission_user_id;
DROP INDEX public.guardian_userobjectpermission_permission_id;
DROP INDEX public.guardian_userobjectpermission_content_type_id;
DROP INDEX public.guardian_groupobjectpermission_permission_id;
DROP INDEX public.guardian_groupobjectpermission_group_id;
DROP INDEX public.guardian_groupobjectpermission_content_type_id;
DROP INDEX public.django_session_de54fa62;
DROP INDEX public.django_flatpage_sites_c3368d3a;
DROP INDEX public.django_flatpage_sites_9365d6e7;
DROP INDEX public.django_flatpage_572d4e42;
DROP INDEX public.django_admin_log_e8701ad4;
DROP INDEX public.django_admin_log_417f1b1c;
DROP INDEX public.crm_customuser_e8701ad4;
DROP INDEX public.auth_user_user_permissions_e8701ad4;
DROP INDEX public.auth_user_user_permissions_8373b171;
DROP INDEX public.auth_user_groups_e8701ad4;
DROP INDEX public.auth_user_groups_0e939a4f;
DROP INDEX public.auth_permission_417f1b1c;
DROP INDEX public.auth_group_permissions_8373b171;
DROP INDEX public.auth_group_permissions_0e939a4f;
DROP INDEX public.associations_regionchild_2dbcba41;
DROP INDEX public.associations_regionchild_0f442f96;
DROP INDEX public.associations_regionchild2_86cb45cc;
DROP INDEX public.associations_regionchild2_2dbcba41;
DROP INDEX public.associations_region_2dbcba41;
DROP INDEX public.associations_categorieassociation_c8a65be8;
DROP INDEX public.associations_categorieassociation_6be37982;
DROP INDEX public.associations_categorieassociation_2dbcba41;
DROP INDEX public.associations_association_c8a65be8;
DROP INDEX public.associations_association_2dbcba41;
DROP INDEX public.associations_association_0a1d6b76;
ALTER TABLE ONLY public.spectacles_spectacle DROP CONSTRAINT spectacles_spectacle_pkey;
ALTER TABLE ONLY public.spectacles_spectacle_participants DROP CONSTRAINT spectacles_spectacle_participants_spectacle_id_artiste_id_key;
ALTER TABLE ONLY public.spectacles_spectacle_participants DROP CONSTRAINT spectacles_spectacle_participants_pkey;
ALTER TABLE ONLY public.spectacles_spectacle_parent DROP CONSTRAINT spectacles_spectacle_parent_pkey;
ALTER TABLE ONLY public.spectacles_spectacle_parent DROP CONSTRAINT spectacles_spectacle_parent_from_spectacle_id_to_spectacle__key;
ALTER TABLE ONLY public.spectacles_spectacle_associations DROP CONSTRAINT spectacles_spectacle_associations_pkey;
ALTER TABLE ONLY public.spectacles_spectacle_associations DROP CONSTRAINT spectacles_spectacle_associatio_spectacle_id_association_id_key;
ALTER TABLE ONLY public.spectacles_spectacle_allowed_user DROP CONSTRAINT spectacles_spectacle_allowed_user_pkey;
ALTER TABLE ONLY public.spectacles_spectacle_allowed_user DROP CONSTRAINT spectacles_spectacle_allowed_use_spectacle_id_customuser_id_key;
ALTER TABLE ONLY public.spectacles_representation DROP CONSTRAINT spectacles_representation_pkey;
ALTER TABLE ONLY public.spectacles_representation_festival DROP CONSTRAINT spectacles_representation_festival_pkey;
ALTER TABLE ONLY public.spectacles_representation_festival DROP CONSTRAINT spectacles_representation_fes_representation_id_festival_id_key;
ALTER TABLE ONLY public.spectacles_representation_allowed_users DROP CONSTRAINT spectacles_representation_allowed_users_pkey;
ALTER TABLE ONLY public.spectacles_representation_allowed_users DROP CONSTRAINT spectacles_representation_all_representation_id_customuser__key;
ALTER TABLE ONLY public.spectacles_lieu DROP CONSTRAINT spectacles_lieu_pkey;
ALTER TABLE ONLY public.spectacles_festival DROP CONSTRAINT spectacles_festival_pkey;
ALTER TABLE ONLY public.spectacles_categoriespectacle DROP CONSTRAINT spectacles_categoriespectacle_pkey;
ALTER TABLE ONLY public.spectacles_artiste DROP CONSTRAINT spectacles_artiste_pkey;
ALTER TABLE ONLY public.spectacles_artiste_association DROP CONSTRAINT spectacles_artiste_association_pkey;
ALTER TABLE ONLY public.spectacles_artiste_association DROP CONSTRAINT spectacles_artiste_association_artiste_id_association_id_key;
ALTER TABLE ONLY public.spectacles_artiste_allowed_users DROP CONSTRAINT spectacles_artiste_allowed_users_pkey;
ALTER TABLE ONLY public.spectacles_artiste_allowed_users DROP CONSTRAINT spectacles_artiste_allowed_users_artiste_id_customuser_id_key;
ALTER TABLE ONLY public.moderation_moderatedobject DROP CONSTRAINT moderation_moderatedobject_pkey;
ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_user_id_permission_id_object__key;
ALTER TABLE ONLY public.guardian_userobjectpermission DROP CONSTRAINT guardian_userobjectpermission_pkey;
ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermission_pkey;
ALTER TABLE ONLY public.guardian_groupobjectpermission DROP CONSTRAINT guardian_groupobjectpermissio_group_id_permission_id_object_key;
ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatpage_sites_pkey;
ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatpage_sites_flatpage_id_site_id_key;
ALTER TABLE ONLY public.django_flatpage DROP CONSTRAINT django_flatpage_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_59e9f58253171fbd_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.crm_customuser DROP CONSTRAINT crm_customuser_user_id_78e0581b94a74ff2_uniq;
ALTER TABLE ONLY public.crm_customuser DROP CONSTRAINT crm_customuser_user_id_539f1908ae6b5133_uniq;
ALTER TABLE ONLY public.crm_customuser DROP CONSTRAINT crm_customuser_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_key;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_key;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE ONLY public.associations_regionchild DROP CONSTRAINT associations_regionchild_pkey;
ALTER TABLE ONLY public.associations_regionchild2 DROP CONSTRAINT associations_regionchild2_pkey;
ALTER TABLE ONLY public.associations_region DROP CONSTRAINT associations_region_pkey;
ALTER TABLE ONLY public.associations_categorieassociation DROP CONSTRAINT associations_categorieassociation_pkey;
ALTER TABLE ONLY public.associations_association DROP CONSTRAINT associations_association_pkey;
ALTER TABLE public.spectacles_spectacle_participants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_spectacle_parent ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_spectacle_associations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_spectacle_allowed_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_spectacle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_representation_festival ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_representation_allowed_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_representation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_lieu ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_festival ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_categoriespectacle ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_artiste_association ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_artiste_allowed_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.spectacles_artiste ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.moderation_moderatedobject ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.guardian_userobjectpermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.guardian_groupobjectpermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_flatpage_sites ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_flatpage ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.crm_customuser ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.associations_regionchild2 ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.associations_regionchild ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.associations_region ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.associations_categorieassociation ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.associations_association ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.spectacles_spectacle_participants_id_seq;
DROP TABLE public.spectacles_spectacle_participants;
DROP SEQUENCE public.spectacles_spectacle_parent_id_seq;
DROP TABLE public.spectacles_spectacle_parent;
DROP SEQUENCE public.spectacles_spectacle_id_seq;
DROP SEQUENCE public.spectacles_spectacle_associations_id_seq;
DROP TABLE public.spectacles_spectacle_associations;
DROP SEQUENCE public.spectacles_spectacle_allowed_user_id_seq;
DROP TABLE public.spectacles_spectacle_allowed_user;
DROP TABLE public.spectacles_spectacle;
DROP SEQUENCE public.spectacles_representation_id_seq;
DROP SEQUENCE public.spectacles_representation_festival_id_seq;
DROP TABLE public.spectacles_representation_festival;
DROP SEQUENCE public.spectacles_representation_allowed_users_id_seq;
DROP TABLE public.spectacles_representation_allowed_users;
DROP TABLE public.spectacles_representation;
DROP SEQUENCE public.spectacles_lieu_id_seq;
DROP TABLE public.spectacles_lieu;
DROP SEQUENCE public.spectacles_festival_id_seq;
DROP TABLE public.spectacles_festival;
DROP SEQUENCE public.spectacles_categoriespectacle_id_seq;
DROP TABLE public.spectacles_categoriespectacle;
DROP SEQUENCE public.spectacles_artiste_id_seq;
DROP SEQUENCE public.spectacles_artiste_association_id_seq;
DROP TABLE public.spectacles_artiste_association;
DROP SEQUENCE public.spectacles_artiste_allowed_users_id_seq;
DROP TABLE public.spectacles_artiste_allowed_users;
DROP TABLE public.spectacles_artiste;
DROP SEQUENCE public.moderation_moderatedobject_id_seq;
DROP TABLE public.moderation_moderatedobject;
DROP SEQUENCE public.guardian_userobjectpermission_id_seq;
DROP TABLE public.guardian_userobjectpermission;
DROP SEQUENCE public.guardian_groupobjectpermission_id_seq;
DROP TABLE public.guardian_groupobjectpermission;
DROP SEQUENCE public.django_site_id_seq;
DROP TABLE public.django_site;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_flatpage_sites_id_seq;
DROP TABLE public.django_flatpage_sites;
DROP SEQUENCE public.django_flatpage_id_seq;
DROP TABLE public.django_flatpage;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.crm_customuser_id_seq;
DROP TABLE public.crm_customuser;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP SEQUENCE public.associations_regionchild_id_seq;
DROP SEQUENCE public.associations_regionchild2_id_seq;
DROP TABLE public.associations_regionchild2;
DROP TABLE public.associations_regionchild;
DROP SEQUENCE public.associations_region_id_seq;
DROP TABLE public.associations_region;
DROP SEQUENCE public.associations_categorieassociation_id_seq;
DROP TABLE public.associations_categorieassociation;
DROP SEQUENCE public.associations_association_id_seq;
DROP TABLE public.associations_association;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: associations_association; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE associations_association (
    id integer NOT NULL,
    name character varying(2048) NOT NULL,
    website character varying(512),
    direction character varying(512),
    president character varying(512),
    contact_name character varying(2048) NOT NULL,
    contact_phone character varying(512),
    contact_email character varying(512),
    contact_adress character varying(512),
    contact_city character varying(512),
    "contact_NPA" character varying(512),
    description text,
    remarques text,
    categorie_id integer NOT NULL,
    region_child2_id integer,
    slug character varying(50)
);


ALTER TABLE public.associations_association OWNER TO valaisfestival;

--
-- Name: associations_association_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE associations_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associations_association_id_seq OWNER TO valaisfestival;

--
-- Name: associations_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE associations_association_id_seq OWNED BY associations_association.id;


--
-- Name: associations_categorieassociation; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE associations_categorieassociation (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    parent_id integer,
    region_child2_id integer,
    slug character varying(50)
);


ALTER TABLE public.associations_categorieassociation OWNER TO valaisfestival;

--
-- Name: associations_categorieassociation_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE associations_categorieassociation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associations_categorieassociation_id_seq OWNER TO valaisfestival;

--
-- Name: associations_categorieassociation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE associations_categorieassociation_id_seq OWNED BY associations_categorieassociation.id;


--
-- Name: associations_region; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE associations_region (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    slug character varying(50)
);


ALTER TABLE public.associations_region OWNER TO valaisfestival;

--
-- Name: associations_region_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE associations_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associations_region_id_seq OWNER TO valaisfestival;

--
-- Name: associations_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE associations_region_id_seq OWNED BY associations_region.id;


--
-- Name: associations_regionchild; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE associations_regionchild (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    region_id integer NOT NULL,
    slug character varying(50)
);


ALTER TABLE public.associations_regionchild OWNER TO valaisfestival;

--
-- Name: associations_regionchild2; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE associations_regionchild2 (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    "order" character varying(512) NOT NULL,
    old_id integer,
    region_child_id integer NOT NULL,
    slug character varying(50)
);


ALTER TABLE public.associations_regionchild2 OWNER TO valaisfestival;

--
-- Name: associations_regionchild2_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE associations_regionchild2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associations_regionchild2_id_seq OWNER TO valaisfestival;

--
-- Name: associations_regionchild2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE associations_regionchild2_id_seq OWNED BY associations_regionchild2.id;


--
-- Name: associations_regionchild_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE associations_regionchild_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associations_regionchild_id_seq OWNER TO valaisfestival;

--
-- Name: associations_regionchild_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE associations_regionchild_id_seq OWNED BY associations_regionchild.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO valaisfestival;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO valaisfestival;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO valaisfestival;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO valaisfestival;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO valaisfestival;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO valaisfestival;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO valaisfestival;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO valaisfestival;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO valaisfestival;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO valaisfestival;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO valaisfestival;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO valaisfestival;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: crm_customuser; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE crm_customuser (
    id integer NOT NULL,
    phone character varying(50),
    user_id integer
);


ALTER TABLE public.crm_customuser OWNER TO valaisfestival;

--
-- Name: crm_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE crm_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crm_customuser_id_seq OWNER TO valaisfestival;

--
-- Name: crm_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE crm_customuser_id_seq OWNED BY crm_customuser.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO valaisfestival;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO valaisfestival;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO valaisfestival;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO valaisfestival;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO valaisfestival;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE django_flatpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO valaisfestival;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE django_flatpage_id_seq OWNED BY django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO valaisfestival;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO valaisfestival;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE django_flatpage_sites_id_seq OWNED BY django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO valaisfestival;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO valaisfestival;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO valaisfestival;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO valaisfestival;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO valaisfestival;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.guardian_groupobjectpermission OWNER TO valaisfestival;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_groupobjectpermission_id_seq OWNER TO valaisfestival;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guardian_userobjectpermission OWNER TO valaisfestival;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_userobjectpermission_id_seq OWNER TO valaisfestival;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


--
-- Name: moderation_moderatedobject; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE moderation_moderatedobject (
    id integer NOT NULL,
    content_type_id integer,
    object_pk integer,
    date_created timestamp with time zone NOT NULL,
    moderation_state smallint NOT NULL,
    moderation_status smallint NOT NULL,
    moderated_by_id integer,
    moderation_date timestamp with time zone,
    moderation_reason text,
    changed_object text NOT NULL,
    changed_by_id integer,
    CONSTRAINT moderation_moderatedobject_object_pk_check CHECK ((object_pk >= 0))
);


ALTER TABLE public.moderation_moderatedobject OWNER TO valaisfestival;

--
-- Name: moderation_moderatedobject_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE moderation_moderatedobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moderation_moderatedobject_id_seq OWNER TO valaisfestival;

--
-- Name: moderation_moderatedobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE moderation_moderatedobject_id_seq OWNED BY moderation_moderatedobject.id;


--
-- Name: spectacles_artiste; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_artiste (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    role character varying(512),
    fonction character varying(512),
    status smallint,
    slug character varying(50)
);


ALTER TABLE public.spectacles_artiste OWNER TO valaisfestival;

--
-- Name: spectacles_artiste_allowed_users; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_artiste_allowed_users (
    id integer NOT NULL,
    artiste_id integer NOT NULL,
    customuser_id integer NOT NULL
);


ALTER TABLE public.spectacles_artiste_allowed_users OWNER TO valaisfestival;

--
-- Name: spectacles_artiste_allowed_users_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_artiste_allowed_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_artiste_allowed_users_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_artiste_allowed_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_artiste_allowed_users_id_seq OWNED BY spectacles_artiste_allowed_users.id;


--
-- Name: spectacles_artiste_association; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_artiste_association (
    id integer NOT NULL,
    artiste_id integer NOT NULL,
    association_id integer NOT NULL
);


ALTER TABLE public.spectacles_artiste_association OWNER TO valaisfestival;

--
-- Name: spectacles_artiste_association_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_artiste_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_artiste_association_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_artiste_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_artiste_association_id_seq OWNED BY spectacles_artiste_association.id;


--
-- Name: spectacles_artiste_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_artiste_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_artiste_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_artiste_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_artiste_id_seq OWNED BY spectacles_artiste.id;


--
-- Name: spectacles_categoriespectacle; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_categoriespectacle (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    parent_id integer,
    slug character varying(40)
);


ALTER TABLE public.spectacles_categoriespectacle OWNER TO valaisfestival;

--
-- Name: spectacles_categoriespectacle_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_categoriespectacle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_categoriespectacle_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_categoriespectacle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_categoriespectacle_id_seq OWNED BY spectacles_categoriespectacle.id;


--
-- Name: spectacles_festival; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_festival (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    slug character varying(40)
);


ALTER TABLE public.spectacles_festival OWNER TO valaisfestival;

--
-- Name: spectacles_festival_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_festival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_festival_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_festival_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_festival_id_seq OWNED BY spectacles_festival.id;


--
-- Name: spectacles_lieu; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_lieu (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    "phoneNumber" character varying(512),
    city character varying(512) NOT NULL,
    "zipCode" character varying(64),
    adress character varying(512) NOT NULL,
    adress2 character varying(512),
    website character varying(200),
    status smallint,
    lat double precision,
    long double precision,
    old_id integer,
    region_id integer,
    slug character varying(50)
);


ALTER TABLE public.spectacles_lieu OWNER TO valaisfestival;

--
-- Name: spectacles_lieu_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_lieu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_lieu_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_lieu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_lieu_id_seq OWNED BY spectacles_lieu.id;


--
-- Name: spectacles_representation; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_representation (
    id integer NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status smallint,
    lieu_id integer,
    spectacle_id integer NOT NULL,
    date date NOT NULL
);


ALTER TABLE public.spectacles_representation OWNER TO valaisfestival;

--
-- Name: spectacles_representation_allowed_users; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_representation_allowed_users (
    id integer NOT NULL,
    representation_id integer NOT NULL,
    customuser_id integer NOT NULL
);


ALTER TABLE public.spectacles_representation_allowed_users OWNER TO valaisfestival;

--
-- Name: spectacles_representation_allowed_users_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_representation_allowed_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_representation_allowed_users_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_representation_allowed_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_representation_allowed_users_id_seq OWNED BY spectacles_representation_allowed_users.id;


--
-- Name: spectacles_representation_festival; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_representation_festival (
    id integer NOT NULL,
    representation_id integer NOT NULL,
    festival_id integer NOT NULL
);


ALTER TABLE public.spectacles_representation_festival OWNER TO valaisfestival;

--
-- Name: spectacles_representation_festival_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_representation_festival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_representation_festival_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_representation_festival_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_representation_festival_id_seq OWNED BY spectacles_representation_festival.id;


--
-- Name: spectacles_representation_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_representation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_representation_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_representation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_representation_id_seq OWNED BY spectacles_representation.id;


--
-- Name: spectacles_spectacle; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_spectacle (
    id integer NOT NULL,
    name character varying(512) NOT NULL,
    website character varying(512),
    presentation_cahier text,
    presentation text,
    phone character varying(25),
    photo character varying(100),
    status smallint,
    old_id integer,
    categorie_id integer NOT NULL,
    slug character varying(50)
);


ALTER TABLE public.spectacles_spectacle OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_allowed_user; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_spectacle_allowed_user (
    id integer NOT NULL,
    spectacle_id integer NOT NULL,
    customuser_id integer NOT NULL
);


ALTER TABLE public.spectacles_spectacle_allowed_user OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_allowed_user_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_spectacle_allowed_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_spectacle_allowed_user_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_allowed_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_spectacle_allowed_user_id_seq OWNED BY spectacles_spectacle_allowed_user.id;


--
-- Name: spectacles_spectacle_associations; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_spectacle_associations (
    id integer NOT NULL,
    spectacle_id integer NOT NULL,
    association_id integer NOT NULL
);


ALTER TABLE public.spectacles_spectacle_associations OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_spectacle_associations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_spectacle_associations_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_spectacle_associations_id_seq OWNED BY spectacles_spectacle_associations.id;


--
-- Name: spectacles_spectacle_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_spectacle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_spectacle_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_spectacle_id_seq OWNED BY spectacles_spectacle.id;


--
-- Name: spectacles_spectacle_parent; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_spectacle_parent (
    id integer NOT NULL,
    from_spectacle_id integer NOT NULL,
    to_spectacle_id integer NOT NULL
);


ALTER TABLE public.spectacles_spectacle_parent OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_parent_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_spectacle_parent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_spectacle_parent_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_parent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_spectacle_parent_id_seq OWNED BY spectacles_spectacle_parent.id;


--
-- Name: spectacles_spectacle_participants; Type: TABLE; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE TABLE spectacles_spectacle_participants (
    id integer NOT NULL,
    spectacle_id integer NOT NULL,
    artiste_id integer NOT NULL
);


ALTER TABLE public.spectacles_spectacle_participants OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: valaisfestival
--

CREATE SEQUENCE spectacles_spectacle_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectacles_spectacle_participants_id_seq OWNER TO valaisfestival;

--
-- Name: spectacles_spectacle_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: valaisfestival
--

ALTER SEQUENCE spectacles_spectacle_participants_id_seq OWNED BY spectacles_spectacle_participants.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_association ALTER COLUMN id SET DEFAULT nextval('associations_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_categorieassociation ALTER COLUMN id SET DEFAULT nextval('associations_categorieassociation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_region ALTER COLUMN id SET DEFAULT nextval('associations_region_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_regionchild ALTER COLUMN id SET DEFAULT nextval('associations_regionchild_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_regionchild2 ALTER COLUMN id SET DEFAULT nextval('associations_regionchild2_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY crm_customuser ALTER COLUMN id SET DEFAULT nextval('crm_customuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_flatpage ALTER COLUMN id SET DEFAULT nextval('django_flatpage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('django_flatpage_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY moderation_moderatedobject ALTER COLUMN id SET DEFAULT nextval('moderation_moderatedobject_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_artiste ALTER COLUMN id SET DEFAULT nextval('spectacles_artiste_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_artiste_allowed_users ALTER COLUMN id SET DEFAULT nextval('spectacles_artiste_allowed_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_artiste_association ALTER COLUMN id SET DEFAULT nextval('spectacles_artiste_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_categoriespectacle ALTER COLUMN id SET DEFAULT nextval('spectacles_categoriespectacle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_festival ALTER COLUMN id SET DEFAULT nextval('spectacles_festival_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_lieu ALTER COLUMN id SET DEFAULT nextval('spectacles_lieu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation ALTER COLUMN id SET DEFAULT nextval('spectacles_representation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation_allowed_users ALTER COLUMN id SET DEFAULT nextval('spectacles_representation_allowed_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation_festival ALTER COLUMN id SET DEFAULT nextval('spectacles_representation_festival_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle ALTER COLUMN id SET DEFAULT nextval('spectacles_spectacle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_allowed_user ALTER COLUMN id SET DEFAULT nextval('spectacles_spectacle_allowed_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_associations ALTER COLUMN id SET DEFAULT nextval('spectacles_spectacle_associations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_parent ALTER COLUMN id SET DEFAULT nextval('spectacles_spectacle_parent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_participants ALTER COLUMN id SET DEFAULT nextval('spectacles_spectacle_participants_id_seq'::regclass);


--
-- Data for Name: associations_association; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: associations_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('associations_association_id_seq', 1, false);


--
-- Data for Name: associations_categorieassociation; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: associations_categorieassociation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('associations_categorieassociation_id_seq', 1, false);


--
-- Data for Name: associations_region; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: associations_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('associations_region_id_seq', 1, false);


--
-- Data for Name: associations_regionchild; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Data for Name: associations_regionchild2; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: associations_regionchild2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('associations_regionchild2_id_seq', 1, false);


--
-- Name: associations_regionchild_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('associations_regionchild_id_seq', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--

INSERT INTO auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO auth_permission VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO auth_permission VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO auth_permission VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO auth_permission VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO auth_permission VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO auth_permission VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission VALUES (19, 'Can add moderated object', 7, 'add_moderatedobject');
INSERT INTO auth_permission VALUES (20, 'Can change moderated object', 7, 'change_moderatedobject');
INSERT INTO auth_permission VALUES (21, 'Can delete moderated object', 7, 'delete_moderatedobject');
INSERT INTO auth_permission VALUES (22, 'Can add canton', 8, 'add_region');
INSERT INTO auth_permission VALUES (23, 'Can change canton', 8, 'change_region');
INSERT INTO auth_permission VALUES (24, 'Can delete canton', 8, 'delete_region');
INSERT INTO auth_permission VALUES (25, 'Can add district', 9, 'add_regionchild');
INSERT INTO auth_permission VALUES (26, 'Can change district', 9, 'change_regionchild');
INSERT INTO auth_permission VALUES (27, 'Can delete district', 9, 'delete_regionchild');
INSERT INTO auth_permission VALUES (28, 'Can add commune', 10, 'add_regionchild2');
INSERT INTO auth_permission VALUES (29, 'Can change commune', 10, 'change_regionchild2');
INSERT INTO auth_permission VALUES (30, 'Can delete commune', 10, 'delete_regionchild2');
INSERT INTO auth_permission VALUES (31, 'Can add categorie', 11, 'add_categorieassociation');
INSERT INTO auth_permission VALUES (32, 'Can change categorie', 11, 'change_categorieassociation');
INSERT INTO auth_permission VALUES (33, 'Can delete categorie', 11, 'delete_categorieassociation');
INSERT INTO auth_permission VALUES (34, 'Can add association', 12, 'add_association');
INSERT INTO auth_permission VALUES (35, 'Can change association', 12, 'change_association');
INSERT INTO auth_permission VALUES (36, 'Can delete association', 12, 'delete_association');
INSERT INTO auth_permission VALUES (37, 'Can add artiste', 13, 'add_artiste');
INSERT INTO auth_permission VALUES (38, 'Can change artiste', 13, 'change_artiste');
INSERT INTO auth_permission VALUES (39, 'Can delete artiste', 13, 'delete_artiste');
INSERT INTO auth_permission VALUES (40, 'Can add categorie', 14, 'add_categoriespectacle');
INSERT INTO auth_permission VALUES (41, 'Can change categorie', 14, 'change_categoriespectacle');
INSERT INTO auth_permission VALUES (42, 'Can delete categorie', 14, 'delete_categoriespectacle');
INSERT INTO auth_permission VALUES (43, 'Can add festival', 15, 'add_festival');
INSERT INTO auth_permission VALUES (44, 'Can change festival', 15, 'change_festival');
INSERT INTO auth_permission VALUES (45, 'Can delete festival', 15, 'delete_festival');
INSERT INTO auth_permission VALUES (46, 'Can add spectacle', 16, 'add_spectacle');
INSERT INTO auth_permission VALUES (47, 'Can change spectacle', 16, 'change_spectacle');
INSERT INTO auth_permission VALUES (48, 'Can delete spectacle', 16, 'delete_spectacle');
INSERT INTO auth_permission VALUES (49, 'Can add lieu', 17, 'add_lieu');
INSERT INTO auth_permission VALUES (50, 'Can change lieu', 17, 'change_lieu');
INSERT INTO auth_permission VALUES (51, 'Can delete lieu', 17, 'delete_lieu');
INSERT INTO auth_permission VALUES (52, 'Can add représentation', 18, 'add_representation');
INSERT INTO auth_permission VALUES (53, 'Can change représentation', 18, 'change_representation');
INSERT INTO auth_permission VALUES (54, 'Can delete représentation', 18, 'delete_representation');
INSERT INTO auth_permission VALUES (55, 'Can add custom user', 19, 'add_customuser');
INSERT INTO auth_permission VALUES (56, 'Can change custom user', 19, 'change_customuser');
INSERT INTO auth_permission VALUES (57, 'Can delete custom user', 19, 'delete_customuser');
INSERT INTO auth_permission VALUES (58, 'Can add site', 20, 'add_site');
INSERT INTO auth_permission VALUES (59, 'Can change site', 20, 'change_site');
INSERT INTO auth_permission VALUES (60, 'Can delete site', 20, 'delete_site');
INSERT INTO auth_permission VALUES (61, 'Can add flat page', 21, 'add_flatpage');
INSERT INTO auth_permission VALUES (62, 'Can change flat page', 21, 'change_flatpage');
INSERT INTO auth_permission VALUES (63, 'Can delete flat page', 21, 'delete_flatpage');
INSERT INTO auth_permission VALUES (64, 'Can add user object permission', 22, 'add_userobjectpermission');
INSERT INTO auth_permission VALUES (65, 'Can change user object permission', 22, 'change_userobjectpermission');
INSERT INTO auth_permission VALUES (66, 'Can delete user object permission', 22, 'delete_userobjectpermission');
INSERT INTO auth_permission VALUES (67, 'Can add group object permission', 23, 'add_groupobjectpermission');
INSERT INTO auth_permission VALUES (68, 'Can change group object permission', 23, 'change_groupobjectpermission');
INSERT INTO auth_permission VALUES (69, 'Can delete group object permission', 23, 'delete_groupobjectpermission');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('auth_permission_id_seq', 69, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--

INSERT INTO auth_user VALUES (1, 'pbkdf2_sha256$12000$0i8Jj8MCkRrE$3M1oZSgCqybxfYchUQl5AMa7U7rIDUboh3HD6j5G3Fk=', '2014-11-20 14:35:03.355466-05', true, 'spoutnik16', '', '', 'jerome@theatreinterface.ch', true, true, '2014-11-20 14:35:03.355466-05');
INSERT INTO auth_user VALUES (-1, '', '2014-11-22 04:50:06.417124-05', false, 'Gentil anonyme', '', '', '', false, true, '2014-11-22 04:50:06.417181-05');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: crm_customuser; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--

INSERT INTO crm_customuser VALUES (1, NULL, -1);


--
-- Name: crm_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('crm_customuser_id_seq', 1, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--

INSERT INTO django_content_type VALUES (1, 'log entry', 'admin', 'logentry');
INSERT INTO django_content_type VALUES (2, 'permission', 'auth', 'permission');
INSERT INTO django_content_type VALUES (3, 'group', 'auth', 'group');
INSERT INTO django_content_type VALUES (4, 'user', 'auth', 'user');
INSERT INTO django_content_type VALUES (5, 'content type', 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (6, 'session', 'sessions', 'session');
INSERT INTO django_content_type VALUES (7, 'moderated object', 'moderation', 'moderatedobject');
INSERT INTO django_content_type VALUES (8, 'canton', 'associations', 'region');
INSERT INTO django_content_type VALUES (9, 'district', 'associations', 'regionchild');
INSERT INTO django_content_type VALUES (10, 'commune', 'associations', 'regionchild2');
INSERT INTO django_content_type VALUES (11, 'categorie', 'associations', 'categorieassociation');
INSERT INTO django_content_type VALUES (12, 'association', 'associations', 'association');
INSERT INTO django_content_type VALUES (13, 'artiste', 'spectacles', 'artiste');
INSERT INTO django_content_type VALUES (14, 'categorie', 'spectacles', 'categoriespectacle');
INSERT INTO django_content_type VALUES (15, 'festival', 'spectacles', 'festival');
INSERT INTO django_content_type VALUES (16, 'spectacle', 'spectacles', 'spectacle');
INSERT INTO django_content_type VALUES (17, 'lieu', 'spectacles', 'lieu');
INSERT INTO django_content_type VALUES (18, 'représentation', 'spectacles', 'representation');
INSERT INTO django_content_type VALUES (19, 'custom user', 'crm', 'customuser');
INSERT INTO django_content_type VALUES (20, 'site', 'sites', 'site');
INSERT INTO django_content_type VALUES (21, 'flat page', 'flatpages', 'flatpage');
INSERT INTO django_content_type VALUES (22, 'user object permission', 'guardian', 'userobjectpermission');
INSERT INTO django_content_type VALUES (23, 'group object permission', 'guardian', 'groupobjectpermission');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('django_content_type_id_seq', 23, true);


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('django_flatpage_id_seq', 1, false);


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 1, false);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--

INSERT INTO django_migrations VALUES (1, 'contenttypes', '0001_initial', '2014-11-20 14:34:47.846595-05');
INSERT INTO django_migrations VALUES (2, 'auth', '0001_initial', '2014-11-20 14:34:48.043119-05');
INSERT INTO django_migrations VALUES (3, 'admin', '0001_initial', '2014-11-20 14:34:48.136317-05');
INSERT INTO django_migrations VALUES (4, 'associations', '0001_initial', '2014-11-20 14:34:48.408761-05');
INSERT INTO django_migrations VALUES (5, 'associations', '0002_auto_20140925_1031', '2014-11-20 14:34:48.494074-05');
INSERT INTO django_migrations VALUES (6, 'associations', '0003_auto_20141108_1032', '2014-11-20 14:34:48.555963-05');
INSERT INTO django_migrations VALUES (7, 'associations', '0004_auto_20141118_1455', '2014-11-20 14:34:48.676231-05');
INSERT INTO django_migrations VALUES (8, 'crm', '0001_initial', '2014-11-20 14:34:48.718301-05');
INSERT INTO django_migrations VALUES (9, 'crm', '0002_utilisateur', '2014-11-20 14:34:48.761446-05');
INSERT INTO django_migrations VALUES (10, 'crm', '0003_auto_20140925_1012', '2014-11-20 14:34:48.852627-05');
INSERT INTO django_migrations VALUES (11, 'crm', '0004_auto_20140925_1014', '2014-11-20 14:34:48.998474-05');
INSERT INTO django_migrations VALUES (12, 'crm', '0005_customuser_user', '2014-11-20 14:34:49.09813-05');
INSERT INTO django_migrations VALUES (13, 'crm', '0006_auto_20140925_1015', '2014-11-20 14:34:49.222275-05');
INSERT INTO django_migrations VALUES (14, 'sites', '0001_initial', '2014-11-20 14:34:49.238084-05');
INSERT INTO django_migrations VALUES (15, 'flatpages', '0001_initial', '2014-11-20 14:34:49.284626-05');
INSERT INTO django_migrations VALUES (16, 'sessions', '0001_initial', '2014-11-20 14:34:49.304199-05');
INSERT INTO django_migrations VALUES (17, 'spectacles', '0001_initial', '2014-11-20 14:34:49.734197-05');
INSERT INTO django_migrations VALUES (18, 'spectacles', '0002_auto_20140924_1209', '2014-11-20 14:34:50.008343-05');
INSERT INTO django_migrations VALUES (19, 'spectacles', '0003_representation_festival', '2014-11-20 14:34:50.189435-05');
INSERT INTO django_migrations VALUES (20, 'spectacles', '0004_auto_20140925_1506', '2014-11-20 14:34:50.37752-05');
INSERT INTO django_migrations VALUES (21, 'spectacles', '0005_categoriespectacle_slug', '2014-11-20 14:34:50.604536-05');
INSERT INTO django_migrations VALUES (22, 'spectacles', '0006_festivaldays', '2014-11-20 14:34:50.824985-05');
INSERT INTO django_migrations VALUES (23, 'spectacles', '0007_festivaldays_festival', '2014-11-20 14:34:51.334468-05');
INSERT INTO django_migrations VALUES (24, 'spectacles', '0008_auto_20141115_1052', '2014-11-20 14:34:51.951577-05');
INSERT INTO django_migrations VALUES (25, 'spectacles', '0009_representation_date', '2014-11-20 14:34:52.258203-05');
INSERT INTO django_migrations VALUES (26, 'spectacles', '0010_auto_20141118_1327', '2014-11-20 14:34:52.896479-05');
INSERT INTO django_migrations VALUES (27, 'spectacles', '0011_auto_20141118_1429', '2014-11-20 14:34:53.298238-05');
INSERT INTO django_migrations VALUES (28, 'spectacles', '0012_auto_20141118_1452', '2014-11-20 14:34:53.920352-05');
INSERT INTO django_migrations VALUES (29, 'crm', '0007_auto_20141121_1511', '2014-11-21 10:11:48.282165-05');
INSERT INTO django_migrations VALUES (30, 'crm', '0007_auto_20141121_1507', '2014-11-22 04:50:06.285136-05');
INSERT INTO django_migrations VALUES (31, 'crm', '0008_merge', '2014-11-22 04:50:06.381184-05');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('django_migrations_id_seq', 31, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--

INSERT INTO django_site VALUES (1, 'example.com', 'example.com');


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('guardian_groupobjectpermission_id_seq', 1, false);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('guardian_userobjectpermission_id_seq', 1, false);


--
-- Data for Name: moderation_moderatedobject; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: moderation_moderatedobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('moderation_moderatedobject_id_seq', 1, false);


--
-- Data for Name: spectacles_artiste; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Data for Name: spectacles_artiste_allowed_users; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_artiste_allowed_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_artiste_allowed_users_id_seq', 1, false);


--
-- Data for Name: spectacles_artiste_association; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_artiste_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_artiste_association_id_seq', 1, false);


--
-- Name: spectacles_artiste_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_artiste_id_seq', 1, false);


--
-- Data for Name: spectacles_categoriespectacle; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_categoriespectacle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_categoriespectacle_id_seq', 1, false);


--
-- Data for Name: spectacles_festival; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_festival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_festival_id_seq', 1, false);


--
-- Data for Name: spectacles_lieu; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_lieu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_lieu_id_seq', 1, false);


--
-- Data for Name: spectacles_representation; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Data for Name: spectacles_representation_allowed_users; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_representation_allowed_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_representation_allowed_users_id_seq', 1, false);


--
-- Data for Name: spectacles_representation_festival; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_representation_festival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_representation_festival_id_seq', 1, false);


--
-- Name: spectacles_representation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_representation_id_seq', 1, false);


--
-- Data for Name: spectacles_spectacle; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Data for Name: spectacles_spectacle_allowed_user; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_spectacle_allowed_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_spectacle_allowed_user_id_seq', 1, false);


--
-- Data for Name: spectacles_spectacle_associations; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_spectacle_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_spectacle_associations_id_seq', 1, false);


--
-- Name: spectacles_spectacle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_spectacle_id_seq', 1, false);


--
-- Data for Name: spectacles_spectacle_parent; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_spectacle_parent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_spectacle_parent_id_seq', 1, false);


--
-- Data for Name: spectacles_spectacle_participants; Type: TABLE DATA; Schema: public; Owner: valaisfestival
--



--
-- Name: spectacles_spectacle_participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: valaisfestival
--

SELECT pg_catalog.setval('spectacles_spectacle_participants_id_seq', 1, false);


--
-- Name: associations_association_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY associations_association
    ADD CONSTRAINT associations_association_pkey PRIMARY KEY (id);


--
-- Name: associations_categorieassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY associations_categorieassociation
    ADD CONSTRAINT associations_categorieassociation_pkey PRIMARY KEY (id);


--
-- Name: associations_region_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY associations_region
    ADD CONSTRAINT associations_region_pkey PRIMARY KEY (id);


--
-- Name: associations_regionchild2_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY associations_regionchild2
    ADD CONSTRAINT associations_regionchild2_pkey PRIMARY KEY (id);


--
-- Name: associations_regionchild_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY associations_regionchild
    ADD CONSTRAINT associations_regionchild_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: crm_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY crm_customuser
    ADD CONSTRAINT crm_customuser_pkey PRIMARY KEY (id);


--
-- Name: crm_customuser_user_id_539f1908ae6b5133_uniq; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY crm_customuser
    ADD CONSTRAINT crm_customuser_user_id_539f1908ae6b5133_uniq UNIQUE (user_id);


--
-- Name: crm_customuser_user_id_78e0581b94a74ff2_uniq; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY crm_customuser
    ADD CONSTRAINT crm_customuser_user_id_78e0581b94a74ff2_uniq UNIQUE (user_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_59e9f58253171fbd_uniq; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_59e9f58253171fbd_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites_flatpage_id_site_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_key UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: guardian_groupobjectpermissio_group_id_permission_id_object_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermissio_group_id_permission_id_object_key UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_permission_id_object__key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_permission_id_object__key UNIQUE (user_id, permission_id, object_pk);


--
-- Name: moderation_moderatedobject_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY moderation_moderatedobject
    ADD CONSTRAINT moderation_moderatedobject_pkey PRIMARY KEY (id);


--
-- Name: spectacles_artiste_allowed_users_artiste_id_customuser_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_artiste_allowed_users
    ADD CONSTRAINT spectacles_artiste_allowed_users_artiste_id_customuser_id_key UNIQUE (artiste_id, customuser_id);


--
-- Name: spectacles_artiste_allowed_users_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_artiste_allowed_users
    ADD CONSTRAINT spectacles_artiste_allowed_users_pkey PRIMARY KEY (id);


--
-- Name: spectacles_artiste_association_artiste_id_association_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_artiste_association
    ADD CONSTRAINT spectacles_artiste_association_artiste_id_association_id_key UNIQUE (artiste_id, association_id);


--
-- Name: spectacles_artiste_association_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_artiste_association
    ADD CONSTRAINT spectacles_artiste_association_pkey PRIMARY KEY (id);


--
-- Name: spectacles_artiste_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_artiste
    ADD CONSTRAINT spectacles_artiste_pkey PRIMARY KEY (id);


--
-- Name: spectacles_categoriespectacle_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_categoriespectacle
    ADD CONSTRAINT spectacles_categoriespectacle_pkey PRIMARY KEY (id);


--
-- Name: spectacles_festival_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_festival
    ADD CONSTRAINT spectacles_festival_pkey PRIMARY KEY (id);


--
-- Name: spectacles_lieu_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_lieu
    ADD CONSTRAINT spectacles_lieu_pkey PRIMARY KEY (id);


--
-- Name: spectacles_representation_all_representation_id_customuser__key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_representation_allowed_users
    ADD CONSTRAINT spectacles_representation_all_representation_id_customuser__key UNIQUE (representation_id, customuser_id);


--
-- Name: spectacles_representation_allowed_users_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_representation_allowed_users
    ADD CONSTRAINT spectacles_representation_allowed_users_pkey PRIMARY KEY (id);


--
-- Name: spectacles_representation_fes_representation_id_festival_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_representation_festival
    ADD CONSTRAINT spectacles_representation_fes_representation_id_festival_id_key UNIQUE (representation_id, festival_id);


--
-- Name: spectacles_representation_festival_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_representation_festival
    ADD CONSTRAINT spectacles_representation_festival_pkey PRIMARY KEY (id);


--
-- Name: spectacles_representation_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_representation
    ADD CONSTRAINT spectacles_representation_pkey PRIMARY KEY (id);


--
-- Name: spectacles_spectacle_allowed_use_spectacle_id_customuser_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_allowed_user
    ADD CONSTRAINT spectacles_spectacle_allowed_use_spectacle_id_customuser_id_key UNIQUE (spectacle_id, customuser_id);


--
-- Name: spectacles_spectacle_allowed_user_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_allowed_user
    ADD CONSTRAINT spectacles_spectacle_allowed_user_pkey PRIMARY KEY (id);


--
-- Name: spectacles_spectacle_associatio_spectacle_id_association_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_associations
    ADD CONSTRAINT spectacles_spectacle_associatio_spectacle_id_association_id_key UNIQUE (spectacle_id, association_id);


--
-- Name: spectacles_spectacle_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_associations
    ADD CONSTRAINT spectacles_spectacle_associations_pkey PRIMARY KEY (id);


--
-- Name: spectacles_spectacle_parent_from_spectacle_id_to_spectacle__key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_parent
    ADD CONSTRAINT spectacles_spectacle_parent_from_spectacle_id_to_spectacle__key UNIQUE (from_spectacle_id, to_spectacle_id);


--
-- Name: spectacles_spectacle_parent_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_parent
    ADD CONSTRAINT spectacles_spectacle_parent_pkey PRIMARY KEY (id);


--
-- Name: spectacles_spectacle_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_participants
    ADD CONSTRAINT spectacles_spectacle_participants_pkey PRIMARY KEY (id);


--
-- Name: spectacles_spectacle_participants_spectacle_id_artiste_id_key; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle_participants
    ADD CONSTRAINT spectacles_spectacle_participants_spectacle_id_artiste_id_key UNIQUE (spectacle_id, artiste_id);


--
-- Name: spectacles_spectacle_pkey; Type: CONSTRAINT; Schema: public; Owner: valaisfestival; Tablespace: 
--

ALTER TABLE ONLY spectacles_spectacle
    ADD CONSTRAINT spectacles_spectacle_pkey PRIMARY KEY (id);


--
-- Name: associations_association_0a1d6b76; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_association_0a1d6b76 ON associations_association USING btree (categorie_id);


--
-- Name: associations_association_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_association_2dbcba41 ON associations_association USING btree (slug);


--
-- Name: associations_association_c8a65be8; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_association_c8a65be8 ON associations_association USING btree (region_child2_id);


--
-- Name: associations_categorieassociation_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_categorieassociation_2dbcba41 ON associations_categorieassociation USING btree (slug);


--
-- Name: associations_categorieassociation_6be37982; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_categorieassociation_6be37982 ON associations_categorieassociation USING btree (parent_id);


--
-- Name: associations_categorieassociation_c8a65be8; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_categorieassociation_c8a65be8 ON associations_categorieassociation USING btree (region_child2_id);


--
-- Name: associations_region_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_region_2dbcba41 ON associations_region USING btree (slug);


--
-- Name: associations_regionchild2_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_regionchild2_2dbcba41 ON associations_regionchild2 USING btree (slug);


--
-- Name: associations_regionchild2_86cb45cc; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_regionchild2_86cb45cc ON associations_regionchild2 USING btree (region_child_id);


--
-- Name: associations_regionchild_0f442f96; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_regionchild_0f442f96 ON associations_regionchild USING btree (region_id);


--
-- Name: associations_regionchild_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX associations_regionchild_2dbcba41 ON associations_regionchild USING btree (slug);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: crm_customuser_e8701ad4; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX crm_customuser_e8701ad4 ON crm_customuser USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_572d4e42; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX django_flatpage_572d4e42 ON django_flatpage USING btree (url);


--
-- Name: django_flatpage_sites_9365d6e7; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX django_flatpage_sites_9365d6e7 ON django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_sites_c3368d3a; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX django_flatpage_sites_c3368d3a ON django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: guardian_groupobjectpermission_content_type_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_content_type_id ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_group_id ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_permission_id ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_content_type_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_content_type_id ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_permission_id ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_user_id ON guardian_userobjectpermission USING btree (user_id);


--
-- Name: moderation_moderatedobject_changed_by_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX moderation_moderatedobject_changed_by_id ON moderation_moderatedobject USING btree (changed_by_id);


--
-- Name: moderation_moderatedobject_content_type_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX moderation_moderatedobject_content_type_id ON moderation_moderatedobject USING btree (content_type_id);


--
-- Name: moderation_moderatedobject_moderated_by_id; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX moderation_moderatedobject_moderated_by_id ON moderation_moderatedobject USING btree (moderated_by_id);


--
-- Name: spectacles_artiste_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_artiste_2dbcba41 ON spectacles_artiste USING btree (slug);


--
-- Name: spectacles_artiste_allowed_users_24fa59d8; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_artiste_allowed_users_24fa59d8 ON spectacles_artiste_allowed_users USING btree (artiste_id);


--
-- Name: spectacles_artiste_allowed_users_721e74b0; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_artiste_allowed_users_721e74b0 ON spectacles_artiste_allowed_users USING btree (customuser_id);


--
-- Name: spectacles_artiste_association_24fa59d8; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_artiste_association_24fa59d8 ON spectacles_artiste_association USING btree (artiste_id);


--
-- Name: spectacles_artiste_association_da6195d4; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_artiste_association_da6195d4 ON spectacles_artiste_association USING btree (association_id);


--
-- Name: spectacles_categoriespectacle_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_categoriespectacle_2dbcba41 ON spectacles_categoriespectacle USING btree (slug);


--
-- Name: spectacles_categoriespectacle_6be37982; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_categoriespectacle_6be37982 ON spectacles_categoriespectacle USING btree (parent_id);


--
-- Name: spectacles_festival_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_festival_2dbcba41 ON spectacles_festival USING btree (slug);


--
-- Name: spectacles_lieu_0f442f96; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_lieu_0f442f96 ON spectacles_lieu USING btree (region_id);


--
-- Name: spectacles_lieu_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_lieu_2dbcba41 ON spectacles_lieu USING btree (slug);


--
-- Name: spectacles_representation_0053364f; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_representation_0053364f ON spectacles_representation USING btree (spectacle_id);


--
-- Name: spectacles_representation_8fbcc0f2; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_representation_8fbcc0f2 ON spectacles_representation USING btree (lieu_id);


--
-- Name: spectacles_representation_allowed_users_3da12c3a; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_representation_allowed_users_3da12c3a ON spectacles_representation_allowed_users USING btree (representation_id);


--
-- Name: spectacles_representation_allowed_users_721e74b0; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_representation_allowed_users_721e74b0 ON spectacles_representation_allowed_users USING btree (customuser_id);


--
-- Name: spectacles_representation_festival_3da12c3a; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_representation_festival_3da12c3a ON spectacles_representation_festival USING btree (representation_id);


--
-- Name: spectacles_representation_festival_8fbcecd5; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_representation_festival_8fbcecd5 ON spectacles_representation_festival USING btree (festival_id);


--
-- Name: spectacles_spectacle_0a1d6b76; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_0a1d6b76 ON spectacles_spectacle USING btree (categorie_id);


--
-- Name: spectacles_spectacle_2dbcba41; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_2dbcba41 ON spectacles_spectacle USING btree (slug);


--
-- Name: spectacles_spectacle_allowed_user_0053364f; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_allowed_user_0053364f ON spectacles_spectacle_allowed_user USING btree (spectacle_id);


--
-- Name: spectacles_spectacle_allowed_user_721e74b0; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_allowed_user_721e74b0 ON spectacles_spectacle_allowed_user USING btree (customuser_id);


--
-- Name: spectacles_spectacle_associations_0053364f; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_associations_0053364f ON spectacles_spectacle_associations USING btree (spectacle_id);


--
-- Name: spectacles_spectacle_associations_da6195d4; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_associations_da6195d4 ON spectacles_spectacle_associations USING btree (association_id);


--
-- Name: spectacles_spectacle_parent_8f337348; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_parent_8f337348 ON spectacles_spectacle_parent USING btree (from_spectacle_id);


--
-- Name: spectacles_spectacle_parent_a3ce12ad; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_parent_a3ce12ad ON spectacles_spectacle_parent USING btree (to_spectacle_id);


--
-- Name: spectacles_spectacle_participants_0053364f; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_participants_0053364f ON spectacles_spectacle_participants USING btree (spectacle_id);


--
-- Name: spectacles_spectacle_participants_24fa59d8; Type: INDEX; Schema: public; Owner: valaisfestival; Tablespace: 
--

CREATE INDEX spectacles_spectacle_participants_24fa59d8 ON spectacles_spectacle_participants USING btree (artiste_id);


--
-- Name: D08e4ac1db13895c15a8a7c0241f4724; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle
    ADD CONSTRAINT "D08e4ac1db13895c15a8a7c0241f4724" FOREIGN KEY (categorie_id) REFERENCES spectacles_categoriespectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D10410d9d8f0d22335f61ea74ce0fe88; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation_allowed_users
    ADD CONSTRAINT "D10410d9d8f0d22335f61ea74ce0fe88" FOREIGN KEY (representation_id) REFERENCES spectacles_representation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D5b1a9df863c6edd748505a64266c86f; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation_festival
    ADD CONSTRAINT "D5b1a9df863c6edd748505a64266c86f" FOREIGN KEY (representation_id) REFERENCES spectacles_representation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D73fb89d7e3179b9cc18d07d15c1e6f9; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_regionchild2
    ADD CONSTRAINT "D73fb89d7e3179b9cc18d07d15c1e6f9" FOREIGN KEY (region_child_id) REFERENCES associations_regionchild(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D746f71e77205178b685dbbfab9a0b50; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_association
    ADD CONSTRAINT "D746f71e77205178b685dbbfab9a0b50" FOREIGN KEY (region_child2_id) REFERENCES associations_regionchild2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: associatio_region_id_76e585f9632b98bf_fk_associations_region_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_regionchild
    ADD CONSTRAINT associatio_region_id_76e585f9632b98bf_fk_associations_region_id FOREIGN KEY (region_id) REFERENCES associations_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_632d7cc91fd28baf_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_632d7cc91fd28baf_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_4aa11bf2b135e9a4_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_4aa11bf2b135e9a4_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_5feda0dfea2609e2_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_5feda0dfea2609e2_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_1005b7a7d861ea2d_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_1005b7a7d861ea2d_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6b9239efb216dd3e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6b9239efb216dd3e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_u_permission_id_b1c6f8c682278f4_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_u_permission_id_b1c6f8c682278f4_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_3922460c01950169_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_3922460c01950169_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c167f9d7bf801da24b1ac6bf8921bb37; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_association
    ADD CONSTRAINT c167f9d7bf801da24b1ac6bf8921bb37 FOREIGN KEY (categorie_id) REFERENCES associations_categorieassociation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ca4f62903df581ffddc422b8f63d2c6a; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_categorieassociation
    ADD CONSTRAINT ca4f62903df581ffddc422b8f63d2c6a FOREIGN KEY (region_child2_id) REFERENCES associations_regionchild2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: crm_customuser_user_id_539f1908ae6b5133_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY crm_customuser
    ADD CONSTRAINT crm_customuser_user_id_539f1908ae6b5133_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: d9a91e3cb4b30e25f3274a1a6dcb62ae; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY associations_categorieassociation
    ADD CONSTRAINT d9a91e3cb4b30e25f3274a1a6dcb62ae FOREIGN KEY (parent_id) REFERENCES associations_categorieassociation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_4a6fe69c215995bb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_4a6fe69c215995bb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_68ffdc180783ded0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_68ffdc180783ded0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatp_flatpage_id_727e27942073c4d4_fk_django_flatpage_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatp_flatpage_id_727e27942073c4d4_fk_django_flatpage_id FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_site_site_id_6549701f5c39659c_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_site_id_6549701f5c39659c_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_7204bc82c5b15b36_fk_spectacles_categoriespectacle_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_categoriespectacle
    ADD CONSTRAINT parent_id_7204bc82c5b15b36_fk_spectacles_categoriespectacle_id FOREIGN KEY (parent_id) REFERENCES spectacles_categoriespectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: s_association_id_863a425ce6017bc_fk_associations_association_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_artiste_association
    ADD CONSTRAINT s_association_id_863a425ce6017bc_fk_associations_association_id FOREIGN KEY (association_id) REFERENCES associations_association(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: s_association_id_9db26d0133cd73d_fk_associations_association_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_associations
    ADD CONSTRAINT s_association_id_9db26d0133cd73d_fk_associations_association_id FOREIGN KEY (association_id) REFERENCES associations_association(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: s_from_spectacle_id_609abc9adceb2413_fk_spectacles_spectacle_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_parent
    ADD CONSTRAINT s_from_spectacle_id_609abc9adceb2413_fk_spectacles_spectacle_id FOREIGN KEY (from_spectacle_id) REFERENCES spectacles_spectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spe_to_spectacle_id_66ecc548bf8b07b4_fk_spectacles_spectacle_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_parent
    ADD CONSTRAINT spe_to_spectacle_id_66ecc548bf8b07b4_fk_spectacles_spectacle_id FOREIGN KEY (to_spectacle_id) REFERENCES spectacles_spectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spec_region_id_3746ba12140196b6_fk_associations_regionchild2_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_lieu
    ADD CONSTRAINT spec_region_id_3746ba12140196b6_fk_associations_regionchild2_id FOREIGN KEY (region_id) REFERENCES associations_regionchild2(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: specta_spectacle_id_14778bcb4823f4bf_fk_spectacles_spectacle_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation
    ADD CONSTRAINT specta_spectacle_id_14778bcb4823f4bf_fk_spectacles_spectacle_id FOREIGN KEY (spectacle_id) REFERENCES spectacles_spectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: specta_spectacle_id_4a9ffbdfad00e544_fk_spectacles_spectacle_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_allowed_user
    ADD CONSTRAINT specta_spectacle_id_4a9ffbdfad00e544_fk_spectacles_spectacle_id FOREIGN KEY (spectacle_id) REFERENCES spectacles_spectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: specta_spectacle_id_4ffe4e28a33af5f1_fk_spectacles_spectacle_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_associations
    ADD CONSTRAINT specta_spectacle_id_4ffe4e28a33af5f1_fk_spectacles_spectacle_id FOREIGN KEY (spectacle_id) REFERENCES spectacles_spectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: specta_spectacle_id_5df655e2441a76f2_fk_spectacles_spectacle_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_participants
    ADD CONSTRAINT specta_spectacle_id_5df655e2441a76f2_fk_spectacles_spectacle_id FOREIGN KEY (spectacle_id) REFERENCES spectacles_spectacle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacl_festival_id_40333618331147cb_fk_spectacles_festival_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation_festival
    ADD CONSTRAINT spectacl_festival_id_40333618331147cb_fk_spectacles_festival_id FOREIGN KEY (festival_id) REFERENCES spectacles_festival(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacles__customuser_id_3a2ec833d989bd00_fk_crm_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_allowed_user
    ADD CONSTRAINT spectacles__customuser_id_3a2ec833d989bd00_fk_crm_customuser_id FOREIGN KEY (customuser_id) REFERENCES crm_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacles__customuser_id_5d40b12a4791b9a7_fk_crm_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_artiste_allowed_users
    ADD CONSTRAINT spectacles__customuser_id_5d40b12a4791b9a7_fk_crm_customuser_id FOREIGN KEY (customuser_id) REFERENCES crm_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacles__customuser_id_74337a878a29c160_fk_crm_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation_allowed_users
    ADD CONSTRAINT spectacles__customuser_id_74337a878a29c160_fk_crm_customuser_id FOREIGN KEY (customuser_id) REFERENCES crm_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacles_artiste_id_43f234f9fa83a9c0_fk_spectacles_artiste_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_artiste_allowed_users
    ADD CONSTRAINT spectacles_artiste_id_43f234f9fa83a9c0_fk_spectacles_artiste_id FOREIGN KEY (artiste_id) REFERENCES spectacles_artiste(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacles_artiste_id_4f4c58530e6e6c51_fk_spectacles_artiste_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_spectacle_participants
    ADD CONSTRAINT spectacles_artiste_id_4f4c58530e6e6c51_fk_spectacles_artiste_id FOREIGN KEY (artiste_id) REFERENCES spectacles_artiste(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacles_artiste_id_5a18e7d786ff5afb_fk_spectacles_artiste_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_artiste_association
    ADD CONSTRAINT spectacles_artiste_id_5a18e7d786ff5afb_fk_spectacles_artiste_id FOREIGN KEY (artiste_id) REFERENCES spectacles_artiste(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: spectacles_repre_lieu_id_58f1477fe9100be6_fk_spectacles_lieu_id; Type: FK CONSTRAINT; Schema: public; Owner: valaisfestival
--

ALTER TABLE ONLY spectacles_representation
    ADD CONSTRAINT spectacles_repre_lieu_id_58f1477fe9100be6_fk_spectacles_lieu_id FOREIGN KEY (lieu_id) REFERENCES spectacles_lieu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

