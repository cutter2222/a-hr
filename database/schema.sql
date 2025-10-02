--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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

--
-- Name: _realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA _realtime;


ALTER SCHEMA _realtime OWNER TO supabase_admin;

--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pg_net; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_net; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_net IS 'Async HTTP';


--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: supabase_functions; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA supabase_functions;


ALTER SCHEMA supabase_functions OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: event_status; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.event_status AS ENUM (
    'pending',
    'in_progress',
    'completed',
    'moderation'
);


ALTER TYPE public.event_status OWNER TO supabase_admin;

--
-- Name: global_role; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.global_role AS ENUM (
    'candidate',
    'employee',
    'all'
);


ALTER TYPE public.global_role OWNER TO supabase_admin;

--
-- Name: logbook_entity_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.logbook_entity_type AS ENUM (
    'purchase',
    'mission',
    'reward',
    'skill',
    'rank',
    'level',
    'event'
);


ALTER TYPE public.logbook_entity_type OWNER TO supabase_admin;

--
-- Name: mission_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.mission_type AS ENUM (
    'start',
    'take_photo_video',
    'gallery_photo_video',
    'file',
    'quiz',
    'questionnaire',
    'unused1',
    'unused2',
    'unused3',
    'unused4',
    'unused5'
);


ALTER TYPE public.mission_type OWNER TO supabase_admin;

--
-- Name: user_gender; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.user_gender AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.user_gender OWNER TO supabase_admin;

--
-- Name: user_mission_status; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.user_mission_status AS ENUM (
    'pending',
    'completed',
    'failed'
);


ALTER TYPE public.user_mission_status OWNER TO supabase_admin;

--
-- Name: user_mission_status2; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.user_mission_status2 AS ENUM (
    'in_progress',
    'completed',
    'failed',
    'archived',
    'submitted',
    'test3'
);


ALTER TYPE public.user_mission_status2 OWNER TO supabase_admin;

--
-- Name: user_purchase_status; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.user_purchase_status AS ENUM (
    'paid',
    'fulfilled',
    'refunded'
);


ALTER TYPE public.user_purchase_status OWNER TO supabase_admin;

--
-- Name: user_reward_source; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.user_reward_source AS ENUM (
    'mission',
    'shop',
    'event',
    'admin'
);


ALTER TYPE public.user_reward_source OWNER TO supabase_admin;

--
-- Name: user_role; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.user_role AS ENUM (
    'candidate',
    'employee',
    'admin',
    'organizer',
    'hr'
);


ALTER TYPE public.user_role OWNER TO supabase_admin;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: autocheck_nickname_about_me_photo_url(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.autocheck_nickname_about_me_photo_url(p_user_id uuid, p_mission_id bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_nickname text;
  v_about_me text;
  v_photo_url text;
  v_exists boolean;
BEGIN
  -- Проверяем существование пользователя и заполненность полей nickname, about_me и photo_url
  SELECT nickname, about_me, photo_url
  INTO v_nickname, v_about_me, v_photo_url
  FROM public.users
  WHERE id = p_user_id;

  IF NOT FOUND THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('User not found for user_id %s', p_user_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Пользователь не найден');
  END IF;

  -- Проверяем, что поля nickname, about_me и photo_url заполнены (не null и не пустые)
  IF v_nickname IS NULL OR v_nickname = '' OR 
     v_about_me IS NULL OR v_about_me = '' OR 
     v_photo_url IS NULL OR v_photo_url = '' THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('INFO', format('Nickname, about_me or photo_url not filled for user_id %s', p_user_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Поля nickname, about_me и photo_url должны быть заполнены');
  END IF;

  -- Проверяем существование миссии
  SELECT EXISTS (
    SELECT 1 FROM public.missions WHERE id = p_mission_id AND is_archived = false
  ) INTO v_exists;

  IF NOT v_exists THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Mission not found or archived for mission_id %s', p_mission_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Миссия не найдена или архивирована');
  END IF;

  -- Проверяем существование записи в user_missions
  SELECT EXISTS (
    SELECT 1 FROM public.user_missions WHERE user_id = p_user_id AND mission_id = p_mission_id
  ) INTO v_exists;

  IF v_exists THEN
    -- Если запись существует, обновляем статус на completed
    UPDATE public.user_missions
    SET status = 'completed'::user_mission_status,
        competed_at = now()
    WHERE user_id = p_user_id AND mission_id = p_mission_id;
  ELSE
    -- Если записи нет, создаем новую со статусом completed
    INSERT INTO public.user_missions (user_id, mission_id, status, started_at, competed_at)
    VALUES (p_user_id, p_mission_id, 'completed'::user_mission_status, now(), now());
  END IF;

  -- Триггер mission_complete_trigger автоматически начислит награды
  RETURN jsonb_build_object('status', 'success', 'message', 'Миссия успешно завершена');

EXCEPTION WHEN OTHERS THEN
  INSERT INTO public.logs (type, log, created_at)
  VALUES ('ERROR', format('Error in autocheck_nickname_about_me_photo_url for user_id %s, mission_id %s: %s', p_user_id, p_mission_id, SQLERRM), now());
  RETURN jsonb_build_object('status', 'error', 'message', format('Ошибка выполнения: %s', SQLERRM));
END;
$$;


ALTER FUNCTION public.autocheck_nickname_about_me_photo_url(p_user_id uuid, p_mission_id bigint) OWNER TO supabase_admin;

--
-- Name: autocheck_resume(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.autocheck_resume(p_user_id uuid, p_mission_id bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$DECLARE
  v_city text;
  v_qualities text;
  v_hobby text;
  v_training text;
  v_education text;
  v_worked text;
  v_exists boolean;
BEGIN
  -- Проверяем существование пользователя и заполненность полей city, qualities, hobby, training, education, worked
  SELECT city, qualities, hobby, training, education, worked
  INTO v_city, v_qualities, v_hobby, v_training, v_education, v_worked
  FROM public.users
  WHERE id = p_user_id;

  IF NOT FOUND THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('User not found for user_id %s', p_user_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Пользователь не найден');
  END IF;

  -- Проверяем, что поля city, qualities, hobby, training, education и worked заполнены (не null и не пустые)
  IF v_city IS NULL OR v_city = '' OR 
     v_qualities IS NULL OR v_qualities = '' OR 
     v_hobby IS NULL OR v_hobby = '' OR 
     v_training IS NULL OR v_training = '' OR 
     v_education IS NULL OR v_education = '' OR 
     v_worked IS NULL OR v_worked = '' THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('INFO', format('One or more resume fields (city, qualities, hobby, training, education, worked) not filled for user_id %s', p_user_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Поля город проживания, личные качества, хобби, доп. обучение, образование и работа должны быть заполнены');
  END IF;

  -- Проверяем существование миссии
  SELECT EXISTS (
    SELECT 1 FROM public.missions WHERE id = p_mission_id AND is_archived = false
  ) INTO v_exists;

  IF NOT v_exists THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Mission not found or archived for mission_id %s', p_mission_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Миссия не найдена или архивирована');
  END IF;

  -- Проверяем существование записи в user_missions
  SELECT EXISTS (
    SELECT 1 FROM public.user_missions WHERE user_id = p_user_id AND mission_id = p_mission_id
  ) INTO v_exists;

  IF v_exists THEN
    -- Если запись существует, обновляем статус на completed
    UPDATE public.user_missions
    SET status = 'completed'::user_mission_status,
        competed_at = now()
    WHERE user_id = p_user_id AND mission_id = p_mission_id;
  ELSE
    -- Если записи нет, создаем новую со статусом completed
    INSERT INTO public.user_missions (user_id, mission_id, status, started_at, competed_at)
    VALUES (p_user_id, p_mission_id, 'completed'::user_mission_status, now(), now());
  END IF;

  -- Триггер mission_complete_trigger автоматически начислит награды
  RETURN jsonb_build_object('status', 'success', 'message', 'Миссия успешно завершена');

EXCEPTION WHEN OTHERS THEN
  INSERT INTO public.logs (type, log, created_at)
  VALUES ('ERROR', format('Error in autocheck_resume for user_id %s, mission_id %s: %s', p_user_id, p_mission_id, SQLERRM), now());
  RETURN jsonb_build_object('status', 'error', 'message', format('Ошибка выполнения: %s', SQLERRM));
END;$$;


ALTER FUNCTION public.autocheck_resume(p_user_id uuid, p_mission_id bigint) OWNER TO supabase_admin;

--
-- Name: create_user_profile(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.create_user_profile() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
  INSERT INTO public.users (
    id,
    created_at,
    email,
    xp_points,
    level
  )
  VALUES (
    NEW.id,
    NOW(),
    NEW.email,
    0,
    0
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.create_user_profile() OWNER TO supabase_admin;

--
-- Name: level_check_can_up(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.level_check_can_up() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE
  current_xp bigint;
  current_level bigint;
  max_level bigint;
  next_xp_required bigint;
  can_level_up_result boolean;
BEGIN
  -- Получаем текущие xp_points и level из users
  SELECT xp_points, level
  INTO current_xp, current_level
  FROM public.users
  WHERE id = NEW.id;

  -- Получаем максимальный уровень
  SELECT MAX(level)
  INTO max_level
  FROM public.levels;

  -- Получаем xp_to_next для текущего уровня
  SELECT xp_to_next
  INTO next_xp_required
  FROM public.levels
  WHERE level = current_level;

  -- Проверяем, можно ли повысить уровень
  can_level_up_result := (
    current_xp IS NOT NULL AND
    next_xp_required IS NOT NULL AND
    current_level < max_level AND
    current_xp >= next_xp_required
  );

  -- Записываем лог о проверке
  INSERT INTO public.logs (type, log)
  VALUES ('CHECK_LEVEL_UP', format('User ID: %s, can_level_up: %s, current_xp: %s, next_xp_required: %s, current_level: %s, max_level: %s',
                                  NEW.id, can_level_up_result, current_xp, next_xp_required, current_level, max_level));

  -- Если повышение уровня возможно, вызываем основную функцию
  IF can_level_up_result THEN
    PERFORM public.user_level_update(NEW.id);
  END IF;

  RETURN NEW;
END;$$;


ALTER FUNCTION public.level_check_can_up() OWNER TO supabase_admin;

--
-- Name: logbook_add(uuid, public.logbook_entity_type, bigint, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.logbook_add(p_user_id uuid, p_entity_type public.logbook_entity_type, p_entity_id bigint, p_skill_points_change bigint, p_xp_points_change bigint, p_level_change bigint, p_coins_change bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$BEGIN
  -- Проверяем, есть ли изменения
  IF p_skill_points_change IS NULL
     AND p_xp_points_change IS NULL
     AND p_level_change IS NULL
     AND p_coins_change IS NULL THEN
    RETURN TRUE; -- Нет изменений, ничего не записываем
  END IF;

  -- Проверяем существование записи с комбинацией user_id, entity_type, entity_id
  IF EXISTS (
    SELECT 1
    FROM public.logbook
    WHERE user_id = p_user_id
      AND entity_type = p_entity_type
      AND (entity_id = p_entity_id OR (entity_id IS NULL AND p_entity_id IS NULL))
  ) THEN
    -- Обновляем существующую запись, суммируя изменения
    UPDATE public.logbook
    SET
      created_at = now(),
      skill_points_change = COALESCE(skill_points_change, 0) + COALESCE(p_skill_points_change, 0),
      xp_points_change = COALESCE(xp_points_change, 0) + COALESCE(p_xp_points_change, 0),
      level_change = COALESCE(level_change, 0) + COALESCE(p_level_change, 0),
      coins_change = COALESCE(coins_change, 0) + COALESCE(p_coins_change, 0)
    WHERE user_id = p_user_id
      AND entity_type = p_entity_type
      AND (entity_id = p_entity_id OR (entity_id IS NULL AND p_entity_id IS NULL));
  ELSE
    -- Создаём новую запись
    INSERT INTO public.logbook (
      created_at,
      user_id,
      entity_type,
      entity_id,
      skill_points_change,
      xp_points_change,
      level_change,
      coins_change
    )
    VALUES (
      now(),
      p_user_id,
      p_entity_type,
      p_entity_id,
      p_skill_points_change,
      p_xp_points_change,
      p_level_change,
      p_coins_change
    );
  END IF;

  RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;$$;


ALTER FUNCTION public.logbook_add(p_user_id uuid, p_entity_type public.logbook_entity_type, p_entity_id bigint, p_skill_points_change bigint, p_xp_points_change bigint, p_level_change bigint, p_coins_change bigint) OWNER TO supabase_admin;

--
-- Name: mission_complete_function(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.mission_complete_function(p_user_id uuid, p_mission_id bigint) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_is_archived boolean;
  v_success boolean;
  v_xp_points bigint;
  v_coins bigint;
  v_skill_points_change bigint;
  v_reward_id bigint;
  v_skills jsonb;
BEGIN
  -- Проверяем существование миссии и её архивный статус
  SELECT m.is_archived, COALESCE(m.xp_points, 0), COALESCE(m.coins, 0)
  INTO v_is_archived, v_xp_points, v_coins
  FROM public.missions m
  WHERE m.id = p_mission_id;

  IF NOT FOUND OR v_is_archived THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Mission not found or archived for user_id %s, mission_id %s', p_user_id, p_mission_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Миссия не найдена или архивирована');
  END IF;

  -- Проверяем, не завершена ли миссия уже
  IF EXISTS (
    SELECT 1
    FROM public.user_missions
    WHERE user_id = p_user_id AND mission_id = p_mission_id AND status = 'completed'
  ) THEN
    RETURN jsonb_build_object('status', 'error', 'message', 'Миссия уже завершена');
  END IF;

  -- Начисляем xp_points
  IF v_xp_points > 0 THEN
    SELECT public.user_xp_points_update(p_user_id, v_xp_points) INTO v_success;
    IF NOT v_success THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Failed to update xp_points for user_id %s, mission_id %s', p_user_id, p_mission_id), now());
      RETURN jsonb_build_object('status', 'error', 'message', 'Не удалось обновить xp_points');
    END IF;
  END IF;

  -- Начисляем coins
  IF v_coins > 0 THEN
    SELECT public.user_coins_update(p_user_id, v_coins) INTO v_success;
    IF NOT v_success THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Failed to update coins for user_id %s, mission_id %s', p_user_id, p_mission_id), now());
      RETURN jsonb_build_object('status', 'error', 'message', 'Не удалось обновить coins');
    END IF;
  END IF;

  -- Начисляем rewards из mission_rewards
  FOR v_reward_id IN
    SELECT reward_id
    FROM public.mission_rewards
    WHERE mission_id = p_mission_id
  LOOP
    BEGIN
      SELECT public.user_rewards_update(p_user_id, v_reward_id, 'mission'::user_reward_source) INTO v_success;
      IF NOT v_success THEN
        INSERT INTO public.logs (type, log, created_at)
        VALUES ('ERROR', format('Failed to update reward_id %s for user_id %s, mission_id %s', v_reward_id, p_user_id, p_mission_id), now());
      END IF;
    EXCEPTION WHEN OTHERS THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Exception in user_rewards_update for reward_id %s, user_id %s, mission_id %s: %s', v_reward_id, p_user_id, p_mission_id, SQLERRM), now());
    END;
  END LOOP;

  -- Формируем skills из mission_skills
  SELECT jsonb_agg(jsonb_build_object('skill_id', skill_id, 'points', COALESCE(skill_up_points, 0)))
  INTO v_skills
  FROM public.mission_skills
  WHERE mission_id = p_mission_id;

  -- Начисляем skills
  IF v_skills IS NOT NULL AND jsonb_array_length(v_skills) > 0 THEN
    SELECT public.user_skills_update(p_user_id, v_skills) INTO v_success;
    IF NOT v_success THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Failed to update skills for user_id %s, mission_id %s', p_user_id, p_mission_id), now());
      RETURN jsonb_build_object('status', 'error', 'message', 'Не удалось обновить skills');
    END IF;
  END IF;

  -- Вычисляем сумму skill_up_points для logbook
  SELECT COALESCE(SUM(COALESCE(skill_up_points, 0)), 0)::bigint
  INTO v_skill_points_change
  FROM public.mission_skills
  WHERE mission_id = p_mission_id;

  -- Записываем в logbook через logbook_add
  SELECT public.logbook_add(
    p_user_id,
    'mission'::logbook_entity_type,
    p_mission_id,
    v_skill_points_change,
    CASE WHEN v_xp_points > 0 THEN v_xp_points ELSE NULL END,
    NULL, -- level_change
    CASE WHEN v_coins > 0 THEN v_coins ELSE NULL END
  ) INTO v_success;

  IF NOT v_success THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Failed to log mission completion for user_id %s, mission_id %s', p_user_id, p_mission_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Не удалось записать в logbook');
  END IF;

  -- Обновляем статус миссии в user_missions
  UPDATE public.user_missions
  SET status = 'completed',
      competed_at = now()
  WHERE user_id = p_user_id AND mission_id = p_mission_id;

  IF NOT FOUND THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Failed to update user_missions for user_id %s, mission_id %s', p_user_id, p_mission_id), now());
    RETURN jsonb_build_object('status', 'error', 'message', 'Не удалось обновить статус миссии');
  END IF;

  RETURN jsonb_build_object('status', 'success', 'message', 'Миссия успешно завершена');

EXCEPTION WHEN OTHERS THEN
  INSERT INTO public.logs (type, log, created_at)
  VALUES ('ERROR', format('Error in mission_complete_function for user_id %s, mission_id %s: %s', p_user_id, p_mission_id, SQLERRM), now());
  RETURN jsonb_build_object('status', 'error', 'message', format('Ошибка выполнения: %s', SQLERRM));
END;
$$;


ALTER FUNCTION public.mission_complete_function(p_user_id uuid, p_mission_id bigint) OWNER TO supabase_admin;

--
-- Name: mission_complete_trigger(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.mission_complete_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE
  v_is_archived boolean;
  v_success boolean;
  v_xp_points bigint;
  v_coins bigint;
  v_skill_points_change bigint;
  v_reward_id bigint;
  v_skills jsonb;
BEGIN
  -- Проверяем существование миссии и её архивный статус
  SELECT m.is_archived, COALESCE(m.xp_points, 0), COALESCE(m.coins, 0)
  INTO v_is_archived, v_xp_points, v_coins
  FROM public.missions m
  WHERE m.id = NEW.mission_id;

  IF NOT FOUND OR v_is_archived THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Mission not found or archived for user_id %s, mission_id %s', NEW.user_id, NEW.mission_id), now());
    RETURN NULL; -- Прерываем выполнение триггера
  END IF;

  -- Начисляем xp_points
  IF v_xp_points > 0 THEN
    SELECT public.user_xp_points_update(NEW.user_id, v_xp_points) INTO v_success;
    IF NOT v_success THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Failed to update xp_points for user_id %s, mission_id %s', NEW.user_id, NEW.mission_id), now());
      RETURN NULL;
    END IF;
  END IF;

  -- Начисляем coins
  IF v_coins > 0 THEN
    SELECT public.user_coins_update(NEW.user_id, v_coins) INTO v_success;
    IF NOT v_success THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Failed to update coins for user_id %s, mission_id %s', NEW.user_id, NEW.mission_id), now());
      RETURN NULL;
    END IF;
  END IF;

  -- Начисляем rewards из mission_rewards
  FOR v_reward_id IN
    SELECT reward_id
    FROM public.mission_rewards
    WHERE mission_id = NEW.mission_id
  LOOP
    BEGIN
      SELECT public.user_rewards_update(NEW.user_id, v_reward_id, 'mission'::user_reward_source) INTO v_success;
      IF NOT v_success THEN
        INSERT INTO public.logs (type, log, created_at)
        VALUES ('ERROR', format('Failed to update reward_id %s for user_id %s, mission_id %s', v_reward_id, NEW.user_id, NEW.mission_id), now());
      END IF;
    EXCEPTION WHEN OTHERS THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Exception in user_rewards_update for reward_id %s, user_id %s, mission_id %s: %s', v_reward_id, NEW.user_id, NEW.mission_id, SQLERRM), now());
    END;
  END LOOP;

  -- Формируем skills из mission_skills
  SELECT jsonb_agg(jsonb_build_object('skill_id', skill_id, 'points', COALESCE(skill_up_points, 0)))
  INTO v_skills
  FROM public.mission_skills
  WHERE mission_id = NEW.mission_id;

  -- Начисляем skills
  IF v_skills IS NOT NULL AND jsonb_array_length(v_skills) > 0 THEN
    SELECT public.user_skills_update(NEW.user_id, v_skills) INTO v_success;
    IF NOT v_success THEN
      INSERT INTO public.logs (type, log, created_at)
      VALUES ('ERROR', format('Failed to update skills for user_id %s, mission_id %s', NEW.user_id, NEW.mission_id), now());
      RETURN NULL;
    END IF;
  END IF;

  -- Вычисляем сумму skill_up_points для logbook
  SELECT COALESCE(SUM(COALESCE(skill_up_points, 0)), 0)::bigint
  INTO v_skill_points_change
  FROM public.mission_skills
  WHERE mission_id = NEW.mission_id;

  -- Записываем в logbook через logbook_add
  SELECT public.logbook_add(
    NEW.user_id,
    'mission'::logbook_entity_type,
    NEW.mission_id,
    v_skill_points_change,
    CASE WHEN v_xp_points > 0 THEN v_xp_points ELSE NULL END,
    NULL, -- level_change
    CASE WHEN v_coins > 0 THEN v_coins ELSE NULL END
  ) INTO v_success;

  IF NOT v_success THEN
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Failed to log mission completion for user_id %s, mission_id %s', NEW.user_id, NEW.mission_id), now());
    RETURN NULL;
  END IF;

  -- Обновляем поле competed_at, если статус изменился на completed
  IF NEW.status = 'completed' THEN
    NEW.competed_at = now();
  END IF;

  RETURN NEW;

EXCEPTION WHEN OTHERS THEN
  INSERT INTO public.logs (type, log, created_at)
  VALUES ('ERROR', SQLERRM, now());
  RETURN NULL;
END;$$;


ALTER FUNCTION public.mission_complete_trigger() OWNER TO supabase_admin;

--
-- Name: purchase_shop_product(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.purchase_shop_product(in_shop_product_id bigint) RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_current_user_id UUID;
  v_product_price BIGINT;
  v_user_coins BIGINT;
  v_product_stock BIGINT;
  v_user_purchase_limit BIGINT;
  v_user_purchase_count BIGINT;
  v_purchase_id BIGINT;
  v_success BOOLEAN;
BEGIN
  -- Получаем текущего аутентифицированного пользователя
  v_current_user_id := auth.uid();
  
  -- Проверяем аутентификацию
  IF v_current_user_id IS NULL THEN
    RETURN json_build_object(
      'status', 'error',
      'message', 'Пользователь не аутентифицирован'
    );
  END IF;

  -- Проверяем существование и активность продукта
  SELECT price_coins, stock, shop_products.limit_per_user
  INTO v_product_price, v_product_stock, v_user_purchase_limit
  FROM shop_products
  WHERE shop_products.id = in_shop_product_id AND shop_products.is_active = TRUE;

  IF v_product_price IS NULL THEN
    RETURN json_build_object(
      'status', 'error',
      'message', 'Продукт не найден или не активен'
    );
  END IF;

  -- Проверяем наличие на складе
  IF v_product_stock <= 0 THEN
    RETURN json_build_object(
      'status', 'error',
      'message', 'Продукт отсутствует на складе'
    );
  END IF;

  -- Проверяем лимит покупок пользователя
  IF v_user_purchase_limit IS NOT NULL THEN
    SELECT COUNT(*)
    INTO v_user_purchase_count
    FROM user_purchases
    WHERE user_purchases.user_id = v_current_user_id 
      AND user_purchases.shop_product_id = in_shop_product_id
      AND user_purchases.status IN ('paid', 'fulfilled');

    IF v_user_purchase_count >= v_user_purchase_limit THEN
      RETURN json_build_object(
        'status', 'error',
        'message', 'Достигнут лимит покупок пользователя'
      );
    END IF;
  END IF;

  -- Проверяем, достаточно ли монет у пользователя
  SELECT coins
  INTO v_user_coins
  FROM users
  WHERE users.id = v_current_user_id
  FOR UPDATE;

  IF v_user_coins IS NULL THEN
    RETURN json_build_object(
      'status', 'error',
      'message', 'Пользователь не найден'
    );
  END IF;

  IF v_user_coins < v_product_price THEN
    RETURN json_build_object(
      'status', 'error',
      'message', 'Недостаточно монет'
    );
  END IF;

  -- Начинаем транзакцию
  BEGIN
    -- Вычитаем монеты у пользователя
    UPDATE users
    SET coins = coins - v_product_price
    WHERE users.id = v_current_user_id;

    -- Уменьшаем запас продукта
    UPDATE shop_products
    SET stock = stock - 1
    WHERE shop_products.id = in_shop_product_id;

    -- Записываем покупку со статусом 'paid'
    INSERT INTO user_purchases (user_id, price_coins, status, shop_product_id)
    VALUES (v_current_user_id, v_product_price, 'paid', in_shop_product_id)
    RETURNING id INTO v_purchase_id;

    -- Логируем транзакцию с помощью logbook_add
    SELECT public.logbook_add(
      p_user_id := v_current_user_id,
      p_entity_type := 'purchase'::logbook_entity_type,
      p_entity_id := v_purchase_id,
      p_skill_points_change := NULL::BIGINT,
      p_xp_points_change := NULL::BIGINT,
      p_level_change := NULL::BIGINT,
      p_coins_change := -v_product_price
    ) INTO v_success;

    IF NOT v_success THEN
      RAISE EXCEPTION 'Не удалось записать покупку в логбук';
    END IF;

    RETURN json_build_object(
      'status', 'success',
      'message', 'Покупка успешно завершена',
      'purchase_id', v_purchase_id,
      'coins_spent', v_product_price
    );
  EXCEPTION WHEN OTHERS THEN
    -- Откат при любой ошибке
    INSERT INTO public.logs (type, log, created_at)
    VALUES ('ERROR', format('Транзакция покупки не удалась: %s', SQLERRM), now());
    RETURN json_build_object(
      'status', 'error',
      'message', format('Покупка не удалась: %s', SQLERRM)
    );
  END;
END;
$$;


ALTER FUNCTION public.purchase_shop_product(in_shop_product_id bigint) OWNER TO supabase_admin;

--
-- Name: rank_check_can_up(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.rank_check_can_up() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  current_level bigint;
  current_rank_id bigint;
  next_rank_id bigint;
  next_rank_required_level bigint;
  all_missions_completed boolean;
  all_skills_sufficient boolean;
  can_rank_up_result boolean;
BEGIN
  -- Получаем текущий level и rank_id из users
  SELECT level, rank_id
  INTO current_level, current_rank_id
  FROM public.users
  WHERE id = NEW.id;

  -- Находим следующий ранг
  SELECT id, required_level
  INTO next_rank_id, next_rank_required_level
  FROM public.ranks
  WHERE required_level > (SELECT COALESCE((SELECT required_level FROM public.ranks WHERE id = current_rank_id), 0))
    AND required_level <= current_level
  ORDER BY required_level ASC
  LIMIT 1;

  -- Проверяем, можно ли повысить ранг
  IF next_rank_id IS NOT NULL THEN
    -- Проверяем выполнение всех необходимых миссий
    SELECT NOT EXISTS (
      SELECT 1
      FROM public.rank_required_missions rrm
      LEFT JOIN public.user_missions um ON rrm.required_mission_id = um.mission_id AND um.user_id = NEW.id
      WHERE rrm.rank_id = next_rank_id
        AND (um.status IS NULL OR um.status != 'completed')
    ) INTO all_missions_completed;

    -- Проверяем наличие достаточных skill_points для всех необходимых навыков
    SELECT NOT EXISTS (
      SELECT 1
      FROM public.rank_required_skills rrs
      LEFT JOIN public.user_skills us ON rrs.required_skill_id = us.skill_id AND us.user_id = NEW.id
      WHERE rrs.rank_id = next_rank_id
        AND (us.skill_points IS NULL OR us.skill_points < rrs.required_skill_points)
    ) INTO all_skills_sufficient;

    -- Проверяем все условия для повышения ранга
    can_rank_up_result := (
      current_level IS NOT NULL AND
      next_rank_id IS NOT NULL AND
      all_missions_completed AND
      all_skills_sufficient
    );
  ELSE
    can_rank_up_result := FALSE;
  END IF;

  -- Записываем лог о проверке
  INSERT INTO public.logs (type, log)
  VALUES ('CHECK_RANK_UP', format('User ID: %s, can_rank_up: %s, current_level: %s, current_rank_id: %s, next_rank_id: %s, next_rank_required_level: %s, all_missions_completed: %s, all_skills_sufficient: %s',
                                  NEW.id, can_rank_up_result, current_level, current_rank_id, next_rank_id, next_rank_required_level, all_missions_completed, all_skills_sufficient));

  -- Если повышение ранга возможно, вызываем функцию обновления
  IF can_rank_up_result THEN
    PERFORM public.rank_update_user(NEW.id, next_rank_id);
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.rank_check_can_up() OWNER TO supabase_admin;

--
-- Name: rank_update_user(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.rank_update_user(user_id uuid, new_rank_id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  current_rank_id bigint;
  rank_updated boolean := false;
  rr_reward_id bigint; -- Переименовано из reward_id
BEGIN
  -- Получаем текущий rank_id
  SELECT rank_id
  INTO current_rank_id
  FROM public.users
  WHERE id = user_id;

  -- Проверяем, что новый ранг отличается от текущего
  IF new_rank_id IS NOT NULL AND (current_rank_id IS NULL OR current_rank_id != new_rank_id) THEN
    -- Обновляем rank_id в users
    UPDATE public.users
    SET rank_id = new_rank_id
    WHERE id = user_id;
    
    rank_updated := true;

    -- Записываем в logbook
    INSERT INTO public.logbook (user_id, entity_type, entity_id)
    VALUES (user_id, 'rank'::public.logbook_entity_type, new_rank_id);

    -- Записываем лог о повышении ранга
    INSERT INTO public.logs (type, log)
    VALUES ('RANK_UP', format('User ID: %s, Rank updated from %s to %s', user_id, current_rank_id, new_rank_id));

    -- Добавляем награды из rank_rewards в user_rewards
    FOR rr_reward_id IN (
      SELECT reward_id
      FROM public.rank_rewards
      WHERE rank_id = new_rank_id
    ) LOOP
      INSERT INTO public.user_rewards (user_id, reward_id, source)
      VALUES (user_id, rr_reward_id, 'rank'::public.user_reward_source);

      -- Записываем лог о добавлении награды
      INSERT INTO public.logs (type, log)
      VALUES ('RANK_REWARD_ADDED', format('User ID: %s, Reward ID: %s added for rank ID: %s', user_id, rr_reward_id, new_rank_id));
    END LOOP;
  ELSE
    -- Записываем лог, если повышение невозможно
    INSERT INTO public.logs (type, log)
    VALUES ('RANK_UP_ERROR', format('User ID: %s, Cannot rank up: current_rank_id=%s, new_rank_id=%s', user_id, current_rank_id, new_rank_id));
  END IF;

  RETURN rank_updated;
END;
$$;


ALTER FUNCTION public.rank_update_user(user_id uuid, new_rank_id bigint) OWNER TO supabase_admin;

--
-- Name: user_coins_update(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.user_coins_update(p_user_id uuid, p_coins_increment bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$BEGIN
  -- Проверяем существование пользователя
  IF NOT EXISTS (
    SELECT 1
    FROM public.users
    WHERE id = p_user_id
  ) THEN
    RETURN FALSE;
  END IF;

  -- Обновляем coins
  UPDATE public.users
  SET coins = coins + p_coins_increment
  WHERE id = p_user_id;

  RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
  -- Логируем ошибку
  INSERT INTO public.error_logs (error_message, occurred_at)
  VALUES (SQLERRM, now());
  RETURN FALSE;
END;$$;


ALTER FUNCTION public.user_coins_update(p_user_id uuid, p_coins_increment bigint) OWNER TO supabase_admin;

--
-- Name: user_level_update(uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.user_level_update(user_id uuid) RETURNS boolean
    LANGUAGE plpgsql
    AS $$DECLARE
  current_xp bigint;
  current_level bigint;
  max_level bigint;
  next_xp_required bigint;
  level_updated boolean := false;
  v_success boolean;
BEGIN
  -- Получаем текущие xp_points и level из users
  SELECT 
    xp_points,
    level
  INTO 
    current_xp,
    current_level
  FROM 
    public.users
  WHERE 
    id = user_id;

  -- Получаем максимальный уровень
  SELECT MAX(level)
  INTO max_level
  FROM public.levels;

  -- Проверяем, что данные корректны
  IF current_xp IS NOT NULL AND current_level < max_level THEN
    -- Получаем xp_to_next для текущего уровня
    SELECT xp_to_next
    INTO next_xp_required
    FROM public.levels
    WHERE level = current_level;

    -- Цикл для многократного повышения уровня
    WHILE next_xp_required IS NOT NULL AND current_xp >= next_xp_required AND current_level < max_level LOOP
      -- Обновляем таблицу users: обнуляем xp_points и увеличиваем level
      UPDATE public.users
      SET 
        xp_points = 0, -- Обнуляем xp_points
        level = current_level + 1
      WHERE 
        id = user_id;
      
      level_updated := true;

      -- Записываем лог о повышении уровня в logs
      INSERT INTO public.logs (type, log)
      VALUES ('LEVEL_UP', format('User ID: %s, Level updated from %s to %s, xp_points reset to 0', user_id, current_level, current_level + 1));

      -- Записываем в logbook через logbook_add
      SELECT public.logbook_add(
        user_id,
        'level'::logbook_entity_type,
        NULL, -- entity_id
        NULL, -- skill_points_change
        NULL, -- xp_points_change
        1,    -- level_change
        NULL  -- coins_change
      ) INTO v_success;

      IF NOT v_success THEN
        INSERT INTO public.error_logs (error_message, occurred_at)
        VALUES (format('Failed to log level update for user_id %s', user_id), now());
        RETURN FALSE;
      END IF;

      -- Обновляем данные для следующей итерации
      SELECT 
        xp_points,
        level
      INTO 
        current_xp,
        current_level
      FROM 
        public.users
      WHERE 
        id = user_id;

      -- Получаем xp_to_next для нового уровня
      SELECT xp_to_next
      INTO next_xp_required
      FROM public.levels
      WHERE level = current_level;
    END LOOP;

    -- Если xp_to_next не найден или другие проблемы
    IF NOT level_updated AND (next_xp_required IS NULL OR current_level >= max_level) THEN
      INSERT INTO public.logs (type, log)
      VALUES ('LEVEL_UP_ERROR', format('User ID: %s, Cannot level up: current_xp=%s, next_xp_required=%s, current_level=%s, max_level=%s',
                                      user_id, current_xp, next_xp_required, current_level, max_level));
    END IF;
  ELSE
    -- Записываем лог, если данные некорректны
    INSERT INTO public.logs (type, log)
    VALUES ('LEVEL_UP_ERROR', format('User ID: %s, Cannot level up: current_xp=%s, current_level=%s, max_level=%s',
                                    user_id, current_xp, current_level, max_level));
  END IF;

  RETURN level_updated;
EXCEPTION WHEN OTHERS THEN
  -- Логируем ошибку
  INSERT INTO public.error_logs (error_message, occurred_at)
  VALUES (SQLERRM, now());
  RETURN FALSE;
END;$$;


ALTER FUNCTION public.user_level_update(user_id uuid) OWNER TO supabase_admin;

--
-- Name: user_rewards_update(uuid, bigint, public.user_reward_source); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.user_rewards_update(p_user_id uuid, p_reward_id bigint, p_source public.user_reward_source) RETURNS boolean
    LANGUAGE plpgsql
    AS $$BEGIN
  -- Проверяем существование пользователя
  IF NOT EXISTS (
    SELECT 1
    FROM public.users
    WHERE id = p_user_id
  ) THEN
    RETURN FALSE;
  END IF;

  -- Проверяем существование награды в таблице rewards
  IF NOT EXISTS (
    SELECT 1
    FROM public.rewards
    WHERE id = p_reward_id
  ) THEN
    RETURN FALSE;
  END IF;

  -- Проверяем, не начислена ли награда уже
  IF EXISTS (
    SELECT 1
    FROM public.user_rewards
    WHERE user_id = p_user_id AND reward_id = p_reward_id
  ) THEN
    RETURN FALSE;
  END IF;

  -- Добавляем новую запись в user_rewards
  INSERT INTO public.user_rewards (user_id, reward_id, source, earned_at)
  VALUES (p_user_id, p_reward_id, p_source, now());

  -- Логируем добавление награды в logbook
  PERFORM public.logbook_add(
    p_user_id,
    'reward'::logbook_entity_type,
    p_reward_id, -- entity_id
    NULL, -- skill_points_change
    NULL, -- xp_points_change
    NULL, -- level_change
    NULL  -- coins_change
  );

  RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
  -- Логируем ошибку
  INSERT INTO public.error_logs (error_message, occurred_at)
  VALUES (SQLERRM, now());
  RETURN FALSE;
END;$$;


ALTER FUNCTION public.user_rewards_update(p_user_id uuid, p_reward_id bigint, p_source public.user_reward_source) OWNER TO supabase_admin;

--
-- Name: user_skills_update(uuid, jsonb); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.user_skills_update(p_user_id uuid, p_skills jsonb) RETURNS boolean
    LANGUAGE plpgsql
    AS $$DECLARE
  v_skill record;
  v_updated boolean := false; -- Флаг успешного обновления/создания
BEGIN
  -- Проверяем, что передан непустой JSON-массив
  IF jsonb_array_length(p_skills) = 0 THEN
    RAISE NOTICE 'Передан пустой или некорректный массив скиллов для пользователя %.', p_user_id;
    RETURN false;
  END IF;

  -- Перебираем элементы JSON-массива
  FOR v_skill IN
    SELECT skill_id, points
    FROM jsonb_to_recordset(p_skills) AS x(skill_id bigint, points numeric)
  LOOP
    -- Проверяем, что points положительное
    IF v_skill.points <= 0 THEN
      RAISE NOTICE 'Очки для скилла % должны быть положительными, пропускаем.', v_skill.skill_id;
      CONTINUE;
    END IF;

    -- Проверяем, существует ли запись в user_skills
    IF EXISTS (
      SELECT 1
      FROM public.user_skills us
      WHERE us.user_id = p_user_id AND us.skill_id = v_skill.skill_id
    ) THEN
      -- Обновляем существующую запись: увеличиваем skill_points и обновляем updated_at
      UPDATE public.user_skills
      SET
        skill_points = skill_points + v_skill.points,
        updated_at = now()
      WHERE user_id = p_user_id AND skill_id = v_skill.skill_id;

      -- Логируем обновление в logbook
      PERFORM public.logbook_add(
        p_user_id,
        'skill'::logbook_entity_type,
        v_skill.skill_id, -- entity_id
        v_skill.points::bigint, -- skill_points_change
        NULL, -- xp_points_change
        NULL, -- level_change
        NULL  -- coins_change
      );

      v_updated := true; -- Отмечаем успешное обновление
    ELSE
      -- Создаем новую запись с указанными skill_points
      INSERT INTO public.user_skills (user_id, skill_id, skill_points, updated_at)
      VALUES (p_user_id, v_skill.skill_id, v_skill.points, now());

      -- Логируем создание в logbook
      PERFORM public.logbook_add(
        p_user_id,
        'skill'::logbook_entity_type,
        v_skill.skill_id, -- entity_id
        v_skill.points::bigint, -- skill_points_change
        NULL, -- xp_points_change
        NULL, -- level_change
        NULL  -- coins_change
      );

      v_updated := true; -- Отмечаем успешное создание
    END IF;
  END LOOP;

  -- Возвращаем true, если было хотя бы одно изменение, иначе false
  RETURN v_updated;

EXCEPTION WHEN OTHERS THEN
  -- Логируем ошибку
  INSERT INTO public.error_logs (error_message, occurred_at)
  VALUES (SQLERRM, now());
  RETURN FALSE;
END;$$;


ALTER FUNCTION public.user_skills_update(p_user_id uuid, p_skills jsonb) OWNER TO supabase_admin;

--
-- Name: user_xp_points_update(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.user_xp_points_update(p_user_id uuid, p_xp_increment bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$BEGIN
  -- Проверяем существование пользователя
  IF NOT EXISTS (
    SELECT 1
    FROM public.users
    WHERE id = p_user_id
  ) THEN
    RETURN FALSE;
  END IF;

  -- Обновляем xp_points
  UPDATE public.users
  SET xp_points = xp_points + p_xp_increment
  WHERE id = p_user_id;

  RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
  RETURN FALSE;
END;$$;


ALTER FUNCTION public.user_xp_points_update(p_user_id uuid, p_xp_increment bigint) OWNER TO supabase_admin;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  BEGIN
    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (payload, event, topic, private, extension)
    VALUES (payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      PERFORM pg_notify(
          'realtime:system',
          jsonb_build_object(
              'error', SQLERRM,
              'function', 'realtime.send',
              'event', event,
              'topic', topic,
              'private', private
          )::text
      );
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
BEGIN
    RETURN query EXECUTE
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name || '/' AS name,
                    NULL::uuid AS id,
                    NULL::timestamptz AS updated_at,
                    NULL::timestamptz AS created_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
                ORDER BY prefixes.name COLLATE "C" LIMIT $3
            )
            UNION ALL
            (SELECT split_part(name, '/', $4) AS key,
                name,
                id,
                updated_at,
                created_at,
                metadata
            FROM storage.objects
            WHERE name COLLATE "C" LIKE $1 || '%'
                AND bucket_id = $2
                AND level = $4
                AND name COLLATE "C" > $5
            ORDER BY name COLLATE "C" LIMIT $3)
        ) obj
        ORDER BY name COLLATE "C" LIMIT $3;
        $sql$
        USING prefix, bucket_name, limits, levels, start_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: http_request(); Type: FUNCTION; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;


ALTER FUNCTION supabase_functions.http_request() OWNER TO supabase_functions_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: extensions; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type text,
    settings jsonb,
    tenant_external_id text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE _realtime.extensions OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE _realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: tenants; Type: TABLE; Schema: _realtime; Owner: supabase_admin
--

CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name text,
    external_id text,
    jwt_secret text,
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default text DEFAULT 'postgres_cdc_rls'::text,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL,
    suspend boolean DEFAULT false,
    jwt_jwks jsonb,
    notify_private_alpha boolean DEFAULT false,
    private_only boolean DEFAULT false NOT NULL
);


ALTER TABLE _realtime.tenants OWNER TO supabase_admin;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: mission_required_branches; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.mission_required_branches (
    id bigint NOT NULL,
    required_branch_id bigint,
    mission_id bigint
);


ALTER TABLE public.mission_required_branches OWNER TO supabase_admin;

--
-- Name: branch_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.mission_required_branches ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.branch_missions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: branches; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.branches (
    id bigint NOT NULL,
    name text,
    description text,
    order_index bigint,
    image_url text,
    is_active boolean DEFAULT true,
    role public.global_role
);


ALTER TABLE public.branches OWNER TO supabase_admin;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.branches ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: events; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    description text,
    is_completed boolean DEFAULT false,
    status public.event_status DEFAULT 'pending'::public.event_status NOT NULL,
    min_users bigint,
    max_users bigint,
    location text,
    start_date timestamp with time zone,
    user_id uuid NOT NULL,
    image_proof_urls text[],
    video_proof_urls text[]
);


ALTER TABLE public.events OWNER TO supabase_admin;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.events ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: levels; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.levels (
    level integer NOT NULL,
    xp_to_next integer NOT NULL,
    CONSTRAINT positive_xp_to_next CHECK ((xp_to_next >= 0))
);


ALTER TABLE public.levels OWNER TO supabase_admin;

--
-- Name: logbook; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.logbook (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    entity_id bigint,
    user_id uuid,
    entity_type public.logbook_entity_type,
    skill_points_change bigint,
    xp_points_change bigint,
    level_change bigint,
    coins_change bigint
);


ALTER TABLE public.logbook OWNER TO supabase_admin;

--
-- Name: logbook_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.logbook ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.logbook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: logs; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.logs (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    type text,
    log text
);


ALTER TABLE public.logs OWNER TO supabase_admin;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.logs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mission_required_missions; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.mission_required_missions (
    id bigint NOT NULL,
    mission_id bigint,
    required_mission_id bigint
);


ALTER TABLE public.mission_required_missions OWNER TO supabase_admin;

--
-- Name: mission_required_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.mission_required_missions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mission_required_missions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mission_required_skills; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.mission_required_skills (
    id bigint NOT NULL,
    mission_id bigint,
    required_skill_id bigint,
    required_skill_points numeric
);


ALTER TABLE public.mission_required_skills OWNER TO supabase_admin;

--
-- Name: mission_required_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.mission_required_skills ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mission_required_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mission_rewards; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.mission_rewards (
    id bigint NOT NULL,
    mission_id bigint,
    reward_id bigint
);


ALTER TABLE public.mission_rewards OWNER TO supabase_admin;

--
-- Name: mission_rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.mission_rewards ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mission_rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mission_skills; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.mission_skills (
    id bigint NOT NULL,
    mission_id bigint,
    skill_id bigint,
    skill_up_points numeric DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.mission_skills OWNER TO supabase_admin;

--
-- Name: mission_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.mission_skills ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mission_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: missions; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.missions (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    description text,
    required_rank_id bigint,
    deadline_at timestamp with time zone,
    type public.mission_type,
    xp_points bigint,
    coins bigint DEFAULT '0'::bigint NOT NULL,
    role public.global_role,
    task text,
    branch_id bigint,
    order_index bigint,
    is_archived boolean DEFAULT false NOT NULL,
    archived_at timestamp with time zone,
    content jsonb,
    auto_check_enabled boolean DEFAULT false NOT NULL,
    auto_check_function_name text
);


ALTER TABLE public.missions OWNER TO supabase_admin;

--
-- Name: missions_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.missions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.missions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ranks; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.ranks (
    id bigint NOT NULL,
    title text,
    order_index bigint,
    description text,
    character_video_male_url text,
    color text,
    required_level integer,
    badge_image_url text,
    character_video_female_url text
);


ALTER TABLE public.ranks OWNER TO supabase_admin;

--
-- Name: rank_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.ranks ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rank_required_missions; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.rank_required_missions (
    id bigint NOT NULL,
    rank_id bigint,
    required_mission_id bigint
);


ALTER TABLE public.rank_required_missions OWNER TO supabase_admin;

--
-- Name: rank_required_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.rank_required_missions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rank_required_missions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rank_required_skills; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.rank_required_skills (
    id bigint NOT NULL,
    rank_id bigint,
    required_skill_id bigint,
    required_skill_points double precision
);


ALTER TABLE public.rank_required_skills OWNER TO supabase_admin;

--
-- Name: TABLE rank_required_skills; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.rank_required_skills IS 'This is a duplicate of rank_required_missions';


--
-- Name: rank_required_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.rank_required_skills ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rank_required_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rank_rewards; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.rank_rewards (
    id bigint NOT NULL,
    rank_id bigint,
    reward_id bigint
);


ALTER TABLE public.rank_rewards OWNER TO supabase_admin;

--
-- Name: rank_rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.rank_rewards ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rank_rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reward_rarities; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.reward_rarities (
    id bigint NOT NULL,
    name text,
    color text,
    info text
);


ALTER TABLE public.reward_rarities OWNER TO supabase_admin;

--
-- Name: reward_rarities_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.reward_rarities ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.reward_rarities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rewards; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.rewards (
    id bigint NOT NULL,
    name text,
    description text,
    image_url text,
    required_rank_id bigint,
    how_to_get text,
    rarity_id bigint
);


ALTER TABLE public.rewards OWNER TO supabase_admin;

--
-- Name: rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.rewards ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_categories; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.shop_categories (
    id bigint NOT NULL,
    order_index bigint,
    name text,
    is_archived boolean DEFAULT false NOT NULL
);


ALTER TABLE public.shop_categories OWNER TO supabase_admin;

--
-- Name: shop_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.shop_categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shop_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shop_products; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.shop_products (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text DEFAULT ''::text,
    description text,
    price_coins numeric,
    stock bigint,
    limit_per_user bigint,
    image_url text,
    is_active boolean DEFAULT true NOT NULL,
    cateogry_id bigint
);


ALTER TABLE public.shop_products OWNER TO supabase_admin;

--
-- Name: shop_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.shop_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.shop_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: skills; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.skills (
    id bigint NOT NULL,
    name text,
    description text,
    image_url text,
    skill_max_points numeric
);


ALTER TABLE public.skills OWNER TO supabase_admin;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.skills ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: test_users; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.test_users (
    id bigint NOT NULL,
    login text,
    password text
);


ALTER TABLE public.test_users OWNER TO supabase_admin;

--
-- Name: test_users_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.test_users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.test_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_events; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_events (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    event_id bigint
);


ALTER TABLE public.user_events OWNER TO supabase_admin;

--
-- Name: user_events_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_events ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_missions; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_missions (
    id bigint NOT NULL,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    competed_at timestamp with time zone,
    user_id uuid NOT NULL,
    mission_id bigint NOT NULL,
    playload jsonb,
    status public.user_mission_status DEFAULT 'pending'::public.user_mission_status NOT NULL
);


ALTER TABLE public.user_missions OWNER TO supabase_admin;

--
-- Name: user_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_missions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_missions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_purchases; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_purchases (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid DEFAULT gen_random_uuid(),
    price_coins numeric,
    status public.user_purchase_status,
    shop_product_id bigint
);


ALTER TABLE public.user_purchases OWNER TO supabase_admin;

--
-- Name: user_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_purchases ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_rewards; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_rewards (
    id bigint NOT NULL,
    earned_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    reward_id bigint,
    source public.user_reward_source
);


ALTER TABLE public.user_rewards OWNER TO supabase_admin;

--
-- Name: user_rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_rewards ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_skills; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_skills (
    id bigint NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid,
    skill_id bigint,
    skill_points numeric DEFAULT '0'::numeric NOT NULL
);


ALTER TABLE public.user_skills OWNER TO supabase_admin;

--
-- Name: user_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_skills ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    email text,
    xp_points bigint DEFAULT '0'::bigint NOT NULL,
    first_name text,
    last_name text,
    level bigint DEFAULT '0'::bigint NOT NULL,
    role public.user_role,
    photo_url text,
    birth_date date,
    company_name text,
    company_position text,
    company_start_date timestamp with time zone,
    skill_points bigint DEFAULT '0'::bigint NOT NULL,
    coins bigint DEFAULT '0'::bigint NOT NULL,
    rank_id bigint,
    branch_id bigint,
    gender public.user_gender,
    nickname text,
    city text,
    qualities text,
    hobby text,
    training text,
    education text,
    worked text,
    about_me text
);


ALTER TABLE public.users OWNER TO supabase_admin;

--
-- Name: view_events; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_events AS
 SELECT events.id,
    events.user_id,
    events.created_at,
    events.start_date,
    events.name,
    events.description,
    events.is_completed,
    events.status,
    events.min_users,
    events.max_users,
    events.location,
    users.first_name AS user_first_name,
    users.last_name AS user_last_name,
    users.photo_url AS user_photo_url,
    ( SELECT count(*) AS count
           FROM public.user_events user_events_1
          WHERE (user_events_1.event_id = events.id)) AS participant_count
   FROM ((public.events
     LEFT JOIN public.user_events ON ((events.id = user_events.event_id)))
     LEFT JOIN public.users ON ((events.user_id = users.id)));


ALTER TABLE public.view_events OWNER TO supabase_admin;

--
-- Name: view_logbook; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_logbook AS
 SELECT logbook.id,
    logbook.created_at,
    logbook.entity_id,
    logbook.user_id,
    logbook.entity_type,
    logbook.coins_change,
    logbook.skill_points_change,
    logbook.xp_points_change,
    logbook.level_change,
        CASE
            WHEN (logbook.entity_type = 'mission'::public.logbook_entity_type) THEN missions.title
            WHEN (logbook.entity_type = 'reward'::public.logbook_entity_type) THEN rewards.name
            WHEN (logbook.entity_type = 'skill'::public.logbook_entity_type) THEN skills.name
            WHEN (logbook.entity_type = 'rank'::public.logbook_entity_type) THEN ranks.title
            WHEN (logbook.entity_type = 'level'::public.logbook_entity_type) THEN branches.name
            WHEN (logbook.entity_type = 'purchase'::public.logbook_entity_type) THEN shop_products.name
            ELSE NULL::text
        END AS entity_name
   FROM ((((((public.logbook
     LEFT JOIN public.missions ON (((logbook.entity_id = missions.id) AND (logbook.entity_type = 'mission'::public.logbook_entity_type))))
     LEFT JOIN public.rewards ON (((logbook.entity_id = rewards.id) AND (logbook.entity_type = 'reward'::public.logbook_entity_type))))
     LEFT JOIN public.skills ON (((logbook.entity_id = skills.id) AND (logbook.entity_type = 'skill'::public.logbook_entity_type))))
     LEFT JOIN public.ranks ON (((logbook.entity_id = ranks.id) AND (logbook.entity_type = 'rank'::public.logbook_entity_type))))
     LEFT JOIN public.branches ON (((logbook.entity_id = branches.id) AND (logbook.entity_type = 'level'::public.logbook_entity_type))))
     LEFT JOIN public.shop_products ON (((logbook.entity_id = shop_products.id) AND (logbook.entity_type = 'purchase'::public.logbook_entity_type))));


ALTER TABLE public.view_logbook OWNER TO supabase_admin;

--
-- Name: view_mission_required_skills; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_mission_required_skills AS
 SELECT mrs.id,
    mrs.mission_id,
    mrs.required_skill_id,
    mrs.required_skill_points,
    s.name AS skill_name
   FROM (public.mission_required_skills mrs
     LEFT JOIN public.skills s ON ((mrs.required_skill_id = s.id)));


ALTER TABLE public.view_mission_required_skills OWNER TO supabase_admin;

--
-- Name: view_mission_skills; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_mission_skills AS
 SELECT ms.id,
    ms.mission_id,
    ms.skill_id,
    ms.skill_up_points,
    s.name AS skill_name
   FROM (public.mission_skills ms
     LEFT JOIN public.skills s ON ((ms.skill_id = s.id)));


ALTER TABLE public.view_mission_skills OWNER TO supabase_admin;

--
-- Name: view_missions; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_missions AS
 WITH user_data AS (
         SELECT users.id AS user_id,
            users.rank_id,
            users.branch_id AS user_branch_id,
            user_ranks.order_index AS user_rank_order,
            COALESCE(array_agg(user_skills.skill_id) FILTER (WHERE (user_skills.skill_id IS NOT NULL)), '{}'::bigint[]) AS user_skill_ids,
            COALESCE(array_agg(user_skills.skill_points) FILTER (WHERE (user_skills.skill_id IS NOT NULL)), '{}'::numeric[]) AS user_skill_points,
            COALESCE(array_agg(completed_missions.mission_id) FILTER (WHERE (completed_missions.mission_id IS NOT NULL)), '{}'::bigint[]) AS completed_mission_ids
           FROM (((public.users
             LEFT JOIN public.ranks user_ranks ON ((users.rank_id = user_ranks.id)))
             LEFT JOIN public.user_skills ON ((users.id = user_skills.user_id)))
             LEFT JOIN public.user_missions completed_missions ON (((users.id = completed_missions.user_id) AND (completed_missions.status = 'completed'::public.user_mission_status))))
          WHERE (users.id = auth.uid())
          GROUP BY users.id, users.rank_id, users.branch_id, user_ranks.order_index
        ), mission_requirements AS (
         SELECT missions_1.id AS mission_id,
            missions_1.required_rank_id,
            mission_ranks.order_index AS required_rank_order,
            COALESCE(array_agg(mission_required_skills.required_skill_id) FILTER (WHERE (mission_required_skills.required_skill_id IS NOT NULL)), '{}'::bigint[]) AS required_skill_ids,
            COALESCE(array_agg(mission_required_skills.required_skill_points) FILTER (WHERE (mission_required_skills.required_skill_id IS NOT NULL)), '{}'::numeric[]) AS required_skill_points,
            COALESCE(array_agg(mission_required_missions.required_mission_id) FILTER (WHERE (mission_required_missions.required_mission_id IS NOT NULL)), '{}'::bigint[]) AS required_mission_ids,
            COALESCE(array_agg(mission_required_branches.required_branch_id) FILTER (WHERE (mission_required_branches.required_branch_id IS NOT NULL)), '{}'::bigint[]) AS required_branch_ids
           FROM ((((public.missions missions_1
             LEFT JOIN public.ranks mission_ranks ON ((missions_1.required_rank_id = mission_ranks.id)))
             LEFT JOIN public.mission_required_skills ON ((missions_1.id = mission_required_skills.mission_id)))
             LEFT JOIN public.mission_required_missions ON ((missions_1.id = mission_required_missions.mission_id)))
             LEFT JOIN public.mission_required_branches ON ((missions_1.id = mission_required_branches.mission_id)))
          GROUP BY missions_1.id, missions_1.required_rank_id, mission_ranks.order_index
        )
 SELECT missions.id,
    missions.created_at,
    missions.title,
    missions.description,
    missions.required_rank_id,
    missions.deadline_at,
    missions.type,
    missions.content,
    user_missions.status AS user_missions_status,
    missions.xp_points,
    missions.coins,
    missions.role,
    missions.task,
    missions.is_archived,
    missions.archived_at,
    missions.auto_check_enabled,
    missions.auto_check_function_name,
    ranks.title AS required_rank_name,
    ranks.badge_image_url AS required_rank_image_url,
    ARRAY( SELECT branches.name
           FROM (public.mission_required_branches mission_required_branches_table
             JOIN public.branches ON ((mission_required_branches_table.required_branch_id = branches.id)))
          WHERE (mission_required_branches_table.mission_id = missions.id)) AS required_branch_names,
    ARRAY( SELECT mission_required_branches_table.required_branch_id
           FROM public.mission_required_branches mission_required_branches_table
          WHERE (mission_required_branches_table.mission_id = missions.id)) AS required_branch_ids,
    ARRAY( SELECT branches.image_url
           FROM (public.mission_required_branches mission_required_branches_table
             JOIN public.branches ON ((mission_required_branches_table.required_branch_id = branches.id)))
          WHERE (mission_required_branches_table.mission_id = missions.id)) AS required_branch_image_urls,
    COALESCE(((missions.required_rank_id IS NULL) OR (COALESCE(user_data.user_rank_order, ('-1'::integer)::bigint) >= COALESCE(mission_requirements.required_rank_order, ('-1'::integer)::bigint))), false) AS is_rank_condition_met,
    COALESCE(((mission_requirements.required_mission_ids = '{}'::bigint[]) OR (mission_requirements.required_mission_ids <@ user_data.completed_mission_ids)), false) AS is_mission_condition_met,
    COALESCE(((mission_requirements.required_skill_ids = '{}'::bigint[]) OR (EXISTS ( SELECT 1
           FROM UNNEST(mission_requirements.required_skill_ids, mission_requirements.required_skill_points) req(skill_id, points)
          WHERE ((req.skill_id = ANY (user_data.user_skill_ids)) AND (user_data.user_skill_points[array_position(user_data.user_skill_ids, req.skill_id)] >= COALESCE(req.points, (0)::numeric)))))), false) AS is_skill_condition_met,
    COALESCE(((mission_requirements.required_branch_ids = '{}'::bigint[]) OR (user_data.user_branch_id = ANY (mission_requirements.required_branch_ids))), false) AS is_branch_condition_met,
    COALESCE((COALESCE(((missions.required_rank_id IS NULL) OR (COALESCE(user_data.user_rank_order, ('-1'::integer)::bigint) >= COALESCE(mission_requirements.required_rank_order, ('-1'::integer)::bigint))), false) AND COALESCE(((mission_requirements.required_mission_ids = '{}'::bigint[]) OR (mission_requirements.required_mission_ids <@ user_data.completed_mission_ids)), false) AND COALESCE(((mission_requirements.required_skill_ids = '{}'::bigint[]) OR (EXISTS ( SELECT 1
           FROM UNNEST(mission_requirements.required_skill_ids, mission_requirements.required_skill_points) req(skill_id, points)
          WHERE ((req.skill_id = ANY (user_data.user_skill_ids)) AND (user_data.user_skill_points[array_position(user_data.user_skill_ids, req.skill_id)] >= COALESCE(req.points, (0)::numeric)))))), false) AND COALESCE(((mission_requirements.required_branch_ids = '{}'::bigint[]) OR (user_data.user_branch_id = ANY (mission_requirements.required_branch_ids))), false)), false) AS is_unlocked
   FROM ((((public.missions
     LEFT JOIN public.ranks ON ((missions.required_rank_id = ranks.id)))
     LEFT JOIN public.user_missions ON (((missions.id = user_missions.mission_id) AND (user_missions.user_id = auth.uid()))))
     LEFT JOIN user_data ON ((user_data.user_id = auth.uid())))
     LEFT JOIN mission_requirements ON ((mission_requirements.mission_id = missions.id)));


ALTER TABLE public.view_missions OWNER TO supabase_admin;

--
-- Name: view_rewards; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_rewards AS
 WITH user_specific_rewards AS (
         SELECT user_rewards.reward_id
           FROM public.user_rewards
          WHERE (user_rewards.user_id = auth.uid())
        )
 SELECT rewards.id,
    rewards.name,
    rewards.description,
    rewards.image_url,
    rewards.required_rank_id,
    rewards.how_to_get,
    rewards.rarity_id,
    reward_rarities.name AS rarity_name,
    reward_rarities.color AS rarity_color,
    reward_rarities.info AS rarity_info,
    ranks.title AS rank_title,
    ranks.order_index AS rank_order_index,
    ranks.description AS rank_description,
    ranks.character_video_male_url AS rank_character_video_url,
    ranks.color AS rank_color,
    ranks.required_level AS rank_required_level,
    ranks.badge_image_url AS rank_badge_image_url,
        CASE
            WHEN (user_specific_rewards.reward_id IS NOT NULL) THEN true
            ELSE false
        END AS is_earned
   FROM (((public.rewards
     LEFT JOIN public.reward_rarities ON ((rewards.rarity_id = reward_rarities.id)))
     LEFT JOIN public.ranks ON ((rewards.required_rank_id = ranks.id)))
     LEFT JOIN user_specific_rewards ON ((rewards.id = user_specific_rewards.reward_id)));


ALTER TABLE public.view_rewards OWNER TO supabase_admin;

--
-- Name: view_shop_products; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_shop_products AS
 SELECT shop_products.id,
    shop_products.created_at,
    shop_products.name,
    shop_products.description,
    shop_products.price_coins,
    shop_products.stock,
    shop_products.limit_per_user,
    shop_products.image_url,
    shop_products.is_active,
    shop_products.cateogry_id,
    shop_categories.name AS shop_category_name,
    shop_categories.order_index AS shop_category_order_index
   FROM (public.shop_products
     LEFT JOIN public.shop_categories ON ((shop_products.cateogry_id = shop_categories.id)));


ALTER TABLE public.view_shop_products OWNER TO supabase_admin;

--
-- Name: view_skills; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_skills AS
 SELECT skills.id,
    skills.name,
    skills.description,
    skills.image_url,
    skills.skill_max_points,
    COALESCE(user_skills.skill_points, (0)::numeric) AS user_skill_points,
    user_skills.updated_at AS user_skills_updated_at
   FROM (public.skills
     LEFT JOIN public.user_skills ON (((skills.id = user_skills.skill_id) AND (user_skills.user_id = auth.uid()))));


ALTER TABLE public.view_skills OWNER TO supabase_admin;

--
-- Name: view_top_users_month; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_top_users_month AS
 WITH user_changes AS (
         SELECT u_1.id AS user_id,
            (COALESCE(sum(l.xp_points_change), (0)::numeric))::bigint AS total_xp_change,
            (COALESCE(sum(l.coins_change), (0)::numeric))::bigint AS total_coins_change
           FROM (public.users u_1
             LEFT JOIN public.logbook l ON (((u_1.id = l.user_id) AND ((l.xp_points_change > 0) OR (l.coins_change > 0)) AND (date_trunc('month'::text, l.created_at) = date_trunc('month'::text, now())))))
          GROUP BY u_1.id
        ), ranked_users AS (
         SELECT uc.user_id,
            uc.total_xp_change,
            uc.total_coins_change,
            row_number() OVER (ORDER BY uc.total_xp_change DESC) AS rank_position_by_xp,
            row_number() OVER (ORDER BY uc.total_coins_change DESC) AS rank_position_by_coins
           FROM user_changes uc
        )
 SELECT ru.rank_position_by_xp,
    ru.user_id,
    u.first_name,
    u.last_name,
    u.photo_url,
    ru.total_xp_change,
    ru.total_coins_change,
    ru.rank_position_by_coins
   FROM (ranked_users ru
     JOIN public.users u ON ((u.id = ru.user_id)))
  ORDER BY ru.total_xp_change DESC;


ALTER TABLE public.view_top_users_month OWNER TO supabase_admin;

--
-- Name: view_top_users_week; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_top_users_week AS
 WITH user_changes AS (
         SELECT u_1.id AS user_id,
            (COALESCE(sum(l.xp_points_change), (0)::numeric))::bigint AS total_xp_change,
            (COALESCE(sum(l.coins_change), (0)::numeric))::bigint AS total_coins_change
           FROM (public.users u_1
             LEFT JOIN public.logbook l ON (((u_1.id = l.user_id) AND ((l.xp_points_change > 0) OR (l.coins_change > 0)) AND (date_trunc('week'::text, l.created_at) = date_trunc('week'::text, now())))))
          GROUP BY u_1.id
        ), ranked_users AS (
         SELECT uc.user_id,
            uc.total_xp_change,
            uc.total_coins_change,
            row_number() OVER (ORDER BY uc.total_xp_change DESC) AS rank_position_by_xp,
            row_number() OVER (ORDER BY uc.total_coins_change DESC) AS rank_position_by_coins
           FROM user_changes uc
        )
 SELECT ru.rank_position_by_xp,
    ru.user_id,
    u.first_name,
    u.last_name,
    u.photo_url,
    ru.total_xp_change,
    ru.total_coins_change,
    ru.rank_position_by_coins
   FROM (ranked_users ru
     JOIN public.users u ON ((u.id = ru.user_id)))
  ORDER BY ru.total_xp_change DESC;


ALTER TABLE public.view_top_users_week OWNER TO supabase_admin;

--
-- Name: view_top_users_year; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_top_users_year AS
 WITH user_changes AS (
         SELECT u_1.id AS user_id,
            (COALESCE(sum(l.xp_points_change), (0)::numeric))::bigint AS total_xp_change,
            (COALESCE(sum(l.coins_change), (0)::numeric))::bigint AS total_coins_change
           FROM (public.users u_1
             LEFT JOIN public.logbook l ON (((u_1.id = l.user_id) AND ((l.xp_points_change > 0) OR (l.coins_change > 0)) AND (date_trunc('year'::text, l.created_at) = date_trunc('year'::text, now())))))
          GROUP BY u_1.id
        ), ranked_users AS (
         SELECT uc.user_id,
            uc.total_xp_change,
            uc.total_coins_change,
            row_number() OVER (ORDER BY uc.total_xp_change DESC) AS rank_position_by_xp,
            row_number() OVER (ORDER BY uc.total_coins_change DESC) AS rank_position_by_coins
           FROM user_changes uc
        )
 SELECT ru.rank_position_by_xp,
    ru.user_id,
    u.first_name,
    u.last_name,
    u.photo_url,
    ru.total_xp_change,
    ru.total_coins_change,
    ru.rank_position_by_coins
   FROM (ranked_users ru
     JOIN public.users u ON ((u.id = ru.user_id)))
  ORDER BY ru.total_xp_change DESC;


ALTER TABLE public.view_top_users_year OWNER TO supabase_admin;

--
-- Name: view_user_events; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_user_events AS
 SELECT user_events.id,
    user_events.created_at,
    user_events.user_id,
    user_events.event_id,
    users.first_name AS user_first_name,
    users.last_name AS user_last_name,
    users.photo_url AS user_photo_url
   FROM (public.user_events
     LEFT JOIN public.users ON ((user_events.user_id = users.id)));


ALTER TABLE public.view_user_events OWNER TO supabase_admin;

--
-- Name: view_user_missions; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_user_missions AS
 SELECT user_missions.id,
    user_missions.started_at,
    user_missions.competed_at,
    user_missions.user_id,
    user_missions.mission_id,
    user_missions.playload,
    user_missions.status,
    missions.title AS mission_title,
    missions.type AS mission_type,
    missions.coins AS mission_coins,
    users.first_name AS user_first_name,
    users.last_name AS user_last_name,
    users.photo_url AS user_photo_url,
    ranks.title AS user_rank_name
   FROM (((public.user_missions
     LEFT JOIN public.missions ON ((user_missions.mission_id = missions.id)))
     LEFT JOIN public.users ON ((user_missions.user_id = users.id)))
     LEFT JOIN public.ranks ON ((users.rank_id = ranks.id)));


ALTER TABLE public.view_user_missions OWNER TO supabase_admin;

--
-- Name: view_user_purchases; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_user_purchases AS
 SELECT user_purchases.id,
    user_purchases.created_at,
    user_purchases.user_id,
    user_purchases.price_coins,
    user_purchases.status,
    user_purchases.shop_product_id,
    shop_products.name AS shop_product_name,
    shop_products.description AS shop_product_description,
    shop_products.price_coins AS shop_product_price_coins,
    shop_products.stock AS shop_product_stock,
    shop_products.limit_per_user AS shop_product_limit_per_user,
    shop_products.image_url AS shop_product_image_url,
    shop_products.is_active AS shop_product_is_active,
    shop_products.cateogry_id AS shop_product_category_id,
    shop_categories.name AS shop_categories_name,
    shop_categories.order_index AS shop_categories_order_index
   FROM ((public.user_purchases
     LEFT JOIN public.shop_products ON ((user_purchases.shop_product_id = shop_products.id)))
     LEFT JOIN public.shop_categories ON ((shop_products.cateogry_id = shop_categories.id)));


ALTER TABLE public.view_user_purchases OWNER TO supabase_admin;

--
-- Name: view_users; Type: VIEW; Schema: public; Owner: supabase_admin
--

CREATE VIEW public.view_users AS
 SELECT users.id,
    users.created_at,
    users.email,
    users.xp_points,
    users.first_name,
    users.last_name,
    users.nickname,
    users.about_me,
    users.gender,
    users.level,
    users.role,
    users.photo_url,
    users.birth_date,
    users.company_name,
    users.company_position,
    users.company_start_date,
    users.skill_points,
    users.coins,
    users.rank_id,
    users.branch_id,
    ranks.title AS rank_title,
    ranks.order_index AS rank_order_index,
    ranks.description AS rank_description,
    ranks.character_video_male_url AS rank_character_video_male_url,
    ranks.character_video_female_url AS rank_character_video_female_url,
    ranks.badge_image_url AS rank_badge_image_url,
    ranks.color AS rank_color,
    levels.xp_to_next AS level_xp_to_next,
    ( SELECT (count(*))::integer AS count
           FROM public.levels levels_1) AS level_total_count,
    branches.name AS branch_name,
    branches.image_url AS branch_image_url,
    branches.order_index AS branch_order_index
   FROM (((public.users
     LEFT JOIN public.ranks ON ((users.rank_id = ranks.id)))
     LEFT JOIN public.levels ON ((users.level = levels.level)))
     LEFT JOIN public.branches ON ((users.branch_id = branches.id)));


ALTER TABLE public.view_users OWNER TO supabase_admin;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: messages_2025_09_29; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_29 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_29 OWNER TO supabase_admin;

--
-- Name: messages_2025_09_30; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_09_30 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_09_30 OWNER TO supabase_admin;

--
-- Name: messages_2025_10_01; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_10_01 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_10_01 OWNER TO supabase_admin;

--
-- Name: messages_2025_10_02; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_10_02 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_10_02 OWNER TO supabase_admin;

--
-- Name: messages_2025_10_03; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_10_03 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_10_03 OWNER TO supabase_admin;

--
-- Name: messages_2025_10_04; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_10_04 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_10_04 OWNER TO supabase_admin;

--
-- Name: messages_2025_10_05; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.messages_2025_10_05 (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE realtime.messages_2025_10_05 OWNER TO supabase_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: hooks; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);


ALTER TABLE supabase_functions.hooks OWNER TO supabase_functions_admin;

--
-- Name: TABLE hooks; Type: COMMENT; Schema: supabase_functions; Owner: supabase_functions_admin
--

COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';


--
-- Name: hooks_id_seq; Type: SEQUENCE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE supabase_functions.hooks_id_seq OWNER TO supabase_functions_admin;

--
-- Name: hooks_id_seq; Type: SEQUENCE OWNED BY; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;


--
-- Name: migrations; Type: TABLE; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE supabase_functions.migrations OWNER TO supabase_functions_admin;

--
-- Name: messages_2025_09_29; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_29 FOR VALUES FROM ('2025-09-29 00:00:00') TO ('2025-09-30 00:00:00');


--
-- Name: messages_2025_09_30; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_09_30 FOR VALUES FROM ('2025-09-30 00:00:00') TO ('2025-10-01 00:00:00');


--
-- Name: messages_2025_10_01; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_10_01 FOR VALUES FROM ('2025-10-01 00:00:00') TO ('2025-10-02 00:00:00');


--
-- Name: messages_2025_10_02; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_10_02 FOR VALUES FROM ('2025-10-02 00:00:00') TO ('2025-10-03 00:00:00');


--
-- Name: messages_2025_10_03; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_10_03 FOR VALUES FROM ('2025-10-03 00:00:00') TO ('2025-10-04 00:00:00');


--
-- Name: messages_2025_10_04; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_10_04 FOR VALUES FROM ('2025-10-04 00:00:00') TO ('2025-10-05 00:00:00');


--
-- Name: messages_2025_10_05; Type: TABLE ATTACH; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages ATTACH PARTITION realtime.messages_2025_10_05 FOR VALUES FROM ('2025-10-05 00:00:00') TO ('2025-10-06 00:00:00');


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: hooks id; Type: DEFAULT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);


--
-- Name: extensions extensions_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: mission_required_branches branch_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_branches
    ADD CONSTRAINT branch_missions_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (level);


--
-- Name: logbook logbook_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.logbook
    ADD CONSTRAINT logbook_pkey PRIMARY KEY (id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: mission_required_missions mission_required_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_missions
    ADD CONSTRAINT mission_required_missions_pkey PRIMARY KEY (id);


--
-- Name: mission_required_skills mission_required_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_skills
    ADD CONSTRAINT mission_required_skills_pkey PRIMARY KEY (id);


--
-- Name: mission_rewards mission_rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_rewards
    ADD CONSTRAINT mission_rewards_pkey PRIMARY KEY (id);


--
-- Name: mission_skills mission_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_skills
    ADD CONSTRAINT mission_skills_pkey PRIMARY KEY (id);


--
-- Name: missions missions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_pkey PRIMARY KEY (id);


--
-- Name: ranks rank_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.ranks
    ADD CONSTRAINT rank_pkey PRIMARY KEY (id);


--
-- Name: rank_required_missions rank_required_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_required_missions
    ADD CONSTRAINT rank_required_missions_pkey PRIMARY KEY (id);


--
-- Name: rank_required_skills rank_required_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_required_skills
    ADD CONSTRAINT rank_required_skills_pkey PRIMARY KEY (id);


--
-- Name: rank_rewards rank_rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_rewards
    ADD CONSTRAINT rank_rewards_pkey PRIMARY KEY (id);


--
-- Name: reward_rarities reward_rarities_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.reward_rarities
    ADD CONSTRAINT reward_rarities_pkey PRIMARY KEY (id);


--
-- Name: rewards rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_pkey PRIMARY KEY (id);


--
-- Name: shop_categories shop_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.shop_categories
    ADD CONSTRAINT shop_categories_pkey PRIMARY KEY (id);


--
-- Name: shop_products shop_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_pkey PRIMARY KEY (id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: test_users test_users_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.test_users
    ADD CONSTRAINT test_users_pkey PRIMARY KEY (id);


--
-- Name: user_events user_events_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_events
    ADD CONSTRAINT user_events_pkey PRIMARY KEY (id);


--
-- Name: user_missions user_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_missions
    ADD CONSTRAINT user_missions_pkey PRIMARY KEY (id, user_id, mission_id);


--
-- Name: user_purchases user_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_purchases
    ADD CONSTRAINT user_purchases_pkey PRIMARY KEY (id);


--
-- Name: user_rewards user_rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_rewards
    ADD CONSTRAINT user_rewards_pkey PRIMARY KEY (id);


--
-- Name: user_skills user_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_09_29 messages_2025_09_29_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_29
    ADD CONSTRAINT messages_2025_09_29_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_09_30 messages_2025_09_30_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_09_30
    ADD CONSTRAINT messages_2025_09_30_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_10_01 messages_2025_10_01_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_10_01
    ADD CONSTRAINT messages_2025_10_01_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_10_02 messages_2025_10_02_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_10_02
    ADD CONSTRAINT messages_2025_10_02_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_10_03 messages_2025_10_03_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_10_03
    ADD CONSTRAINT messages_2025_10_03_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_10_04 messages_2025_10_04_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_10_04
    ADD CONSTRAINT messages_2025_10_04_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: messages_2025_10_05 messages_2025_10_05_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.messages_2025_10_05
    ADD CONSTRAINT messages_2025_10_05_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: hooks hooks_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: supabase_functions; Owner: supabase_functions_admin
--

ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- Name: extensions_tenant_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE INDEX extensions_tenant_external_id_index ON _realtime.extensions USING btree (tenant_external_id);


--
-- Name: extensions_tenant_external_id_type_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);


--
-- Name: tenants_external_id_index; Type: INDEX; Schema: _realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: idx_logbook_unique; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE UNIQUE INDEX idx_logbook_unique ON public.logbook USING btree (user_id, entity_type, COALESCE(entity_id, ('-1'::integer)::bigint));


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: supabase_functions_hooks_h_table_id_h_name_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);


--
-- Name: supabase_functions_hooks_request_id_idx; Type: INDEX; Schema: supabase_functions; Owner: supabase_functions_admin
--

CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);


--
-- Name: messages_2025_09_29_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_29_pkey;


--
-- Name: messages_2025_09_30_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_09_30_pkey;


--
-- Name: messages_2025_10_01_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_10_01_pkey;


--
-- Name: messages_2025_10_02_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_10_02_pkey;


--
-- Name: messages_2025_10_03_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_10_03_pkey;


--
-- Name: messages_2025_10_04_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_10_04_pkey;


--
-- Name: messages_2025_10_05_pkey; Type: INDEX ATTACH; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER INDEX realtime.messages_pkey ATTACH PARTITION realtime.messages_2025_10_05_pkey;


--
-- Name: users create_user_profile_trigger; Type: TRIGGER; Schema: auth; Owner: supabase_auth_admin
--

CREATE TRIGGER create_user_profile_trigger AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.create_user_profile();


--
-- Name: user_missions mission_complete_trigger; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER mission_complete_trigger AFTER INSERT OR UPDATE OF status ON public.user_missions FOR EACH ROW WHEN ((new.status = 'completed'::public.user_mission_status)) EXECUTE FUNCTION public.mission_complete_trigger();


--
-- Name: users user_level_update_trigger; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER user_level_update_trigger AFTER UPDATE OF xp_points ON public.users FOR EACH ROW WHEN ((old.xp_points IS DISTINCT FROM new.xp_points)) EXECUTE FUNCTION public.level_check_can_up();


--
-- Name: users user_rank_update_trigger; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER user_rank_update_trigger AFTER UPDATE OF level ON public.users FOR EACH ROW WHEN ((old.level IS DISTINCT FROM new.level)) EXECUTE FUNCTION public.rank_check_can_up();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: extensions extensions_tenant_external_id_fkey; Type: FK CONSTRAINT; Schema: _realtime; Owner: supabase_admin
--

ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: mission_required_branches branch_missions_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_branches
    ADD CONSTRAINT branch_missions_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: events events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: logbook logbook_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.logbook
    ADD CONSTRAINT logbook_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: mission_required_branches mission_required_branches_required_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_branches
    ADD CONSTRAINT mission_required_branches_required_branch_id_fkey FOREIGN KEY (required_branch_id) REFERENCES public.branches(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_required_missions mission_required_missions_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_missions
    ADD CONSTRAINT mission_required_missions_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_required_missions mission_required_missions_required_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_missions
    ADD CONSTRAINT mission_required_missions_required_mission_id_fkey FOREIGN KEY (required_mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_required_skills mission_required_skills_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_skills
    ADD CONSTRAINT mission_required_skills_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_required_skills mission_required_skills_required_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_required_skills
    ADD CONSTRAINT mission_required_skills_required_skill_id_fkey FOREIGN KEY (required_skill_id) REFERENCES public.skills(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_rewards mission_rewards_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_rewards
    ADD CONSTRAINT mission_rewards_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_rewards mission_rewards_reward_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_rewards
    ADD CONSTRAINT mission_rewards_reward_id_fkey FOREIGN KEY (reward_id) REFERENCES public.rewards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_skills mission_skills_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_skills
    ADD CONSTRAINT mission_skills_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: mission_skills mission_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.mission_skills
    ADD CONSTRAINT mission_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: missions missions_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON UPDATE CASCADE;


--
-- Name: missions missions_required_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_required_rank_id_fkey FOREIGN KEY (required_rank_id) REFERENCES public.ranks(id) ON UPDATE CASCADE;


--
-- Name: rank_required_missions rank_required_missions_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_required_missions
    ADD CONSTRAINT rank_required_missions_rank_id_fkey FOREIGN KEY (rank_id) REFERENCES public.ranks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rank_required_missions rank_required_missions_required_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_required_missions
    ADD CONSTRAINT rank_required_missions_required_mission_id_fkey FOREIGN KEY (required_mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rank_required_skills rank_required_skills_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_required_skills
    ADD CONSTRAINT rank_required_skills_rank_id_fkey FOREIGN KEY (rank_id) REFERENCES public.ranks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rank_required_skills rank_required_skills_required_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_required_skills
    ADD CONSTRAINT rank_required_skills_required_skill_id_fkey FOREIGN KEY (required_skill_id) REFERENCES public.skills(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rank_rewards rank_rewards_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_rewards
    ADD CONSTRAINT rank_rewards_rank_id_fkey FOREIGN KEY (rank_id) REFERENCES public.ranks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rank_rewards rank_rewards_reward_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rank_rewards
    ADD CONSTRAINT rank_rewards_reward_id_fkey FOREIGN KEY (reward_id) REFERENCES public.rewards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ranks ranks_required_level_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.ranks
    ADD CONSTRAINT ranks_required_level_fkey FOREIGN KEY (required_level) REFERENCES public.levels(level) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rewards rewards_rarity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_rarity_id_fkey FOREIGN KEY (rarity_id) REFERENCES public.reward_rarities(id) ON UPDATE RESTRICT;


--
-- Name: rewards rewards_required_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rewards
    ADD CONSTRAINT rewards_required_rank_id_fkey FOREIGN KEY (required_rank_id) REFERENCES public.ranks(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: shop_products shop_cateogry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.shop_products
    ADD CONSTRAINT shop_cateogry_id_fkey FOREIGN KEY (cateogry_id) REFERENCES public.shop_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_events user_events_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_events
    ADD CONSTRAINT user_events_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: user_events user_events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_events
    ADD CONSTRAINT user_events_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: user_missions user_missions_mission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_missions
    ADD CONSTRAINT user_missions_mission_id_fkey FOREIGN KEY (mission_id) REFERENCES public.missions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_missions user_missions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_missions
    ADD CONSTRAINT user_missions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_purchases user_purchases_shop_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_purchases
    ADD CONSTRAINT user_purchases_shop_product_id_fkey FOREIGN KEY (shop_product_id) REFERENCES public.shop_products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_purchases user_purchases_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_purchases
    ADD CONSTRAINT user_purchases_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_rewards user_rewards_reward_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_rewards
    ADD CONSTRAINT user_rewards_reward_id_fkey FOREIGN KEY (reward_id) REFERENCES public.rewards(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_rewards user_rewards_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_rewards
    ADD CONSTRAINT user_rewards_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_skills user_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_skills user_skills_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_skills
    ADD CONSTRAINT user_skills_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_rank_id_fkey FOREIGN KEY (rank_id) REFERENCES public.ranks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: objects all 1ps738_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "all 1ps738_0" ON storage.objects FOR SELECT USING ((bucket_id = 'media'::text));


--
-- Name: objects all 1ps738_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "all 1ps738_1" ON storage.objects FOR INSERT WITH CHECK ((bucket_id = 'media'::text));


--
-- Name: objects all 1ps738_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "all 1ps738_2" ON storage.objects FOR UPDATE USING ((bucket_id = 'media'::text));


--
-- Name: objects all 1ps738_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "all 1ps738_3" ON storage.objects FOR DELETE USING ((bucket_id = 'media'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: supabase_realtime_messages_publication; Type: PUBLICATION; Schema: -; Owner: supabase_admin
--

CREATE PUBLICATION supabase_realtime_messages_publication WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime_messages_publication OWNER TO supabase_admin;

--
-- Name: supabase_realtime logbook; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.logbook;


--
-- Name: supabase_realtime_messages_publication messages; Type: PUBLICATION TABLE; Schema: realtime; Owner: supabase_admin
--

ALTER PUBLICATION supabase_realtime_messages_publication ADD TABLE ONLY realtime.messages;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA net; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO postgres;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;
GRANT USAGE ON SCHEMA realtime TO anon;
GRANT USAGE ON SCHEMA realtime TO authenticated;
GRANT USAGE ON SCHEMA realtime TO service_role;
GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: SCHEMA supabase_functions; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;


--
-- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


--
-- Name: FUNCTION autocheck_nickname_about_me_photo_url(p_user_id uuid, p_mission_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.autocheck_nickname_about_me_photo_url(p_user_id uuid, p_mission_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.autocheck_nickname_about_me_photo_url(p_user_id uuid, p_mission_id bigint) TO anon;
GRANT ALL ON FUNCTION public.autocheck_nickname_about_me_photo_url(p_user_id uuid, p_mission_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.autocheck_nickname_about_me_photo_url(p_user_id uuid, p_mission_id bigint) TO service_role;


--
-- Name: FUNCTION autocheck_resume(p_user_id uuid, p_mission_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.autocheck_resume(p_user_id uuid, p_mission_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.autocheck_resume(p_user_id uuid, p_mission_id bigint) TO anon;
GRANT ALL ON FUNCTION public.autocheck_resume(p_user_id uuid, p_mission_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.autocheck_resume(p_user_id uuid, p_mission_id bigint) TO service_role;


--
-- Name: FUNCTION create_user_profile(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.create_user_profile() TO postgres;
GRANT ALL ON FUNCTION public.create_user_profile() TO anon;
GRANT ALL ON FUNCTION public.create_user_profile() TO authenticated;
GRANT ALL ON FUNCTION public.create_user_profile() TO service_role;


--
-- Name: FUNCTION level_check_can_up(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.level_check_can_up() TO postgres;
GRANT ALL ON FUNCTION public.level_check_can_up() TO anon;
GRANT ALL ON FUNCTION public.level_check_can_up() TO authenticated;
GRANT ALL ON FUNCTION public.level_check_can_up() TO service_role;


--
-- Name: FUNCTION logbook_add(p_user_id uuid, p_entity_type public.logbook_entity_type, p_entity_id bigint, p_skill_points_change bigint, p_xp_points_change bigint, p_level_change bigint, p_coins_change bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.logbook_add(p_user_id uuid, p_entity_type public.logbook_entity_type, p_entity_id bigint, p_skill_points_change bigint, p_xp_points_change bigint, p_level_change bigint, p_coins_change bigint) TO postgres;
GRANT ALL ON FUNCTION public.logbook_add(p_user_id uuid, p_entity_type public.logbook_entity_type, p_entity_id bigint, p_skill_points_change bigint, p_xp_points_change bigint, p_level_change bigint, p_coins_change bigint) TO anon;
GRANT ALL ON FUNCTION public.logbook_add(p_user_id uuid, p_entity_type public.logbook_entity_type, p_entity_id bigint, p_skill_points_change bigint, p_xp_points_change bigint, p_level_change bigint, p_coins_change bigint) TO authenticated;
GRANT ALL ON FUNCTION public.logbook_add(p_user_id uuid, p_entity_type public.logbook_entity_type, p_entity_id bigint, p_skill_points_change bigint, p_xp_points_change bigint, p_level_change bigint, p_coins_change bigint) TO service_role;


--
-- Name: FUNCTION mission_complete_function(p_user_id uuid, p_mission_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.mission_complete_function(p_user_id uuid, p_mission_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.mission_complete_function(p_user_id uuid, p_mission_id bigint) TO anon;
GRANT ALL ON FUNCTION public.mission_complete_function(p_user_id uuid, p_mission_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.mission_complete_function(p_user_id uuid, p_mission_id bigint) TO service_role;


--
-- Name: FUNCTION mission_complete_trigger(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.mission_complete_trigger() TO postgres;
GRANT ALL ON FUNCTION public.mission_complete_trigger() TO anon;
GRANT ALL ON FUNCTION public.mission_complete_trigger() TO authenticated;
GRANT ALL ON FUNCTION public.mission_complete_trigger() TO service_role;


--
-- Name: FUNCTION purchase_shop_product(in_shop_product_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.purchase_shop_product(in_shop_product_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.purchase_shop_product(in_shop_product_id bigint) TO anon;
GRANT ALL ON FUNCTION public.purchase_shop_product(in_shop_product_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.purchase_shop_product(in_shop_product_id bigint) TO service_role;


--
-- Name: FUNCTION rank_check_can_up(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.rank_check_can_up() TO postgres;
GRANT ALL ON FUNCTION public.rank_check_can_up() TO anon;
GRANT ALL ON FUNCTION public.rank_check_can_up() TO authenticated;
GRANT ALL ON FUNCTION public.rank_check_can_up() TO service_role;


--
-- Name: FUNCTION rank_update_user(user_id uuid, new_rank_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.rank_update_user(user_id uuid, new_rank_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.rank_update_user(user_id uuid, new_rank_id bigint) TO anon;
GRANT ALL ON FUNCTION public.rank_update_user(user_id uuid, new_rank_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.rank_update_user(user_id uuid, new_rank_id bigint) TO service_role;


--
-- Name: FUNCTION user_coins_update(p_user_id uuid, p_coins_increment bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.user_coins_update(p_user_id uuid, p_coins_increment bigint) TO postgres;
GRANT ALL ON FUNCTION public.user_coins_update(p_user_id uuid, p_coins_increment bigint) TO anon;
GRANT ALL ON FUNCTION public.user_coins_update(p_user_id uuid, p_coins_increment bigint) TO authenticated;
GRANT ALL ON FUNCTION public.user_coins_update(p_user_id uuid, p_coins_increment bigint) TO service_role;


--
-- Name: FUNCTION user_level_update(user_id uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.user_level_update(user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.user_level_update(user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.user_level_update(user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.user_level_update(user_id uuid) TO service_role;


--
-- Name: FUNCTION user_rewards_update(p_user_id uuid, p_reward_id bigint, p_source public.user_reward_source); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.user_rewards_update(p_user_id uuid, p_reward_id bigint, p_source public.user_reward_source) TO postgres;
GRANT ALL ON FUNCTION public.user_rewards_update(p_user_id uuid, p_reward_id bigint, p_source public.user_reward_source) TO anon;
GRANT ALL ON FUNCTION public.user_rewards_update(p_user_id uuid, p_reward_id bigint, p_source public.user_reward_source) TO authenticated;
GRANT ALL ON FUNCTION public.user_rewards_update(p_user_id uuid, p_reward_id bigint, p_source public.user_reward_source) TO service_role;


--
-- Name: FUNCTION user_skills_update(p_user_id uuid, p_skills jsonb); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.user_skills_update(p_user_id uuid, p_skills jsonb) TO postgres;
GRANT ALL ON FUNCTION public.user_skills_update(p_user_id uuid, p_skills jsonb) TO anon;
GRANT ALL ON FUNCTION public.user_skills_update(p_user_id uuid, p_skills jsonb) TO authenticated;
GRANT ALL ON FUNCTION public.user_skills_update(p_user_id uuid, p_skills jsonb) TO service_role;


--
-- Name: FUNCTION user_xp_points_update(p_user_id uuid, p_xp_increment bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.user_xp_points_update(p_user_id uuid, p_xp_increment bigint) TO postgres;
GRANT ALL ON FUNCTION public.user_xp_points_update(p_user_id uuid, p_xp_increment bigint) TO anon;
GRANT ALL ON FUNCTION public.user_xp_points_update(p_user_id uuid, p_xp_increment bigint) TO authenticated;
GRANT ALL ON FUNCTION public.user_xp_points_update(p_user_id uuid, p_xp_increment bigint) TO service_role;


--
-- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


--
-- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


--
-- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


--
-- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


--
-- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


--
-- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


--
-- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


--
-- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


--
-- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


--
-- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON FUNCTION realtime.topic() TO postgres;
GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


--
-- Name: FUNCTION http_request(); Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;


--
-- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mission_required_branches; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.mission_required_branches TO postgres;
GRANT ALL ON TABLE public.mission_required_branches TO anon;
GRANT ALL ON TABLE public.mission_required_branches TO authenticated;
GRANT ALL ON TABLE public.mission_required_branches TO service_role;


--
-- Name: SEQUENCE branch_missions_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.branch_missions_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.branch_missions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.branch_missions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.branch_missions_id_seq TO service_role;


--
-- Name: TABLE branches; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.branches TO postgres;
GRANT ALL ON TABLE public.branches TO anon;
GRANT ALL ON TABLE public.branches TO authenticated;
GRANT ALL ON TABLE public.branches TO service_role;


--
-- Name: SEQUENCE branches_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.branches_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.branches_id_seq TO anon;
GRANT ALL ON SEQUENCE public.branches_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.branches_id_seq TO service_role;


--
-- Name: TABLE events; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.events TO postgres;
GRANT ALL ON TABLE public.events TO anon;
GRANT ALL ON TABLE public.events TO authenticated;
GRANT ALL ON TABLE public.events TO service_role;


--
-- Name: SEQUENCE events_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.events_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.events_id_seq TO anon;
GRANT ALL ON SEQUENCE public.events_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.events_id_seq TO service_role;


--
-- Name: TABLE levels; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.levels TO postgres;
GRANT ALL ON TABLE public.levels TO anon;
GRANT ALL ON TABLE public.levels TO authenticated;
GRANT ALL ON TABLE public.levels TO service_role;


--
-- Name: TABLE logbook; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.logbook TO postgres;
GRANT ALL ON TABLE public.logbook TO anon;
GRANT ALL ON TABLE public.logbook TO authenticated;
GRANT ALL ON TABLE public.logbook TO service_role;


--
-- Name: SEQUENCE logbook_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.logbook_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.logbook_id_seq TO anon;
GRANT ALL ON SEQUENCE public.logbook_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.logbook_id_seq TO service_role;


--
-- Name: TABLE logs; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.logs TO postgres;
GRANT ALL ON TABLE public.logs TO anon;
GRANT ALL ON TABLE public.logs TO authenticated;
GRANT ALL ON TABLE public.logs TO service_role;


--
-- Name: SEQUENCE logs_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.logs_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.logs_id_seq TO anon;
GRANT ALL ON SEQUENCE public.logs_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.logs_id_seq TO service_role;


--
-- Name: TABLE mission_required_missions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.mission_required_missions TO postgres;
GRANT ALL ON TABLE public.mission_required_missions TO anon;
GRANT ALL ON TABLE public.mission_required_missions TO authenticated;
GRANT ALL ON TABLE public.mission_required_missions TO service_role;


--
-- Name: SEQUENCE mission_required_missions_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.mission_required_missions_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.mission_required_missions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.mission_required_missions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.mission_required_missions_id_seq TO service_role;


--
-- Name: TABLE mission_required_skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.mission_required_skills TO postgres;
GRANT ALL ON TABLE public.mission_required_skills TO anon;
GRANT ALL ON TABLE public.mission_required_skills TO authenticated;
GRANT ALL ON TABLE public.mission_required_skills TO service_role;


--
-- Name: SEQUENCE mission_required_skills_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.mission_required_skills_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.mission_required_skills_id_seq TO anon;
GRANT ALL ON SEQUENCE public.mission_required_skills_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.mission_required_skills_id_seq TO service_role;


--
-- Name: TABLE mission_rewards; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.mission_rewards TO postgres;
GRANT ALL ON TABLE public.mission_rewards TO anon;
GRANT ALL ON TABLE public.mission_rewards TO authenticated;
GRANT ALL ON TABLE public.mission_rewards TO service_role;


--
-- Name: SEQUENCE mission_rewards_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.mission_rewards_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.mission_rewards_id_seq TO anon;
GRANT ALL ON SEQUENCE public.mission_rewards_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.mission_rewards_id_seq TO service_role;


--
-- Name: TABLE mission_skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.mission_skills TO postgres;
GRANT ALL ON TABLE public.mission_skills TO anon;
GRANT ALL ON TABLE public.mission_skills TO authenticated;
GRANT ALL ON TABLE public.mission_skills TO service_role;


--
-- Name: SEQUENCE mission_skills_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.mission_skills_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.mission_skills_id_seq TO anon;
GRANT ALL ON SEQUENCE public.mission_skills_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.mission_skills_id_seq TO service_role;


--
-- Name: TABLE missions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.missions TO postgres;
GRANT ALL ON TABLE public.missions TO anon;
GRANT ALL ON TABLE public.missions TO authenticated;
GRANT ALL ON TABLE public.missions TO service_role;


--
-- Name: SEQUENCE missions_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.missions_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.missions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.missions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.missions_id_seq TO service_role;


--
-- Name: TABLE ranks; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.ranks TO postgres;
GRANT ALL ON TABLE public.ranks TO anon;
GRANT ALL ON TABLE public.ranks TO authenticated;
GRANT ALL ON TABLE public.ranks TO service_role;


--
-- Name: SEQUENCE rank_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.rank_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.rank_id_seq TO anon;
GRANT ALL ON SEQUENCE public.rank_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.rank_id_seq TO service_role;


--
-- Name: TABLE rank_required_missions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.rank_required_missions TO postgres;
GRANT ALL ON TABLE public.rank_required_missions TO anon;
GRANT ALL ON TABLE public.rank_required_missions TO authenticated;
GRANT ALL ON TABLE public.rank_required_missions TO service_role;


--
-- Name: SEQUENCE rank_required_missions_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.rank_required_missions_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.rank_required_missions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.rank_required_missions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.rank_required_missions_id_seq TO service_role;


--
-- Name: TABLE rank_required_skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.rank_required_skills TO postgres;
GRANT ALL ON TABLE public.rank_required_skills TO anon;
GRANT ALL ON TABLE public.rank_required_skills TO authenticated;
GRANT ALL ON TABLE public.rank_required_skills TO service_role;


--
-- Name: SEQUENCE rank_required_skills_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.rank_required_skills_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.rank_required_skills_id_seq TO anon;
GRANT ALL ON SEQUENCE public.rank_required_skills_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.rank_required_skills_id_seq TO service_role;


--
-- Name: TABLE rank_rewards; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.rank_rewards TO postgres;
GRANT ALL ON TABLE public.rank_rewards TO anon;
GRANT ALL ON TABLE public.rank_rewards TO authenticated;
GRANT ALL ON TABLE public.rank_rewards TO service_role;


--
-- Name: SEQUENCE rank_rewards_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.rank_rewards_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.rank_rewards_id_seq TO anon;
GRANT ALL ON SEQUENCE public.rank_rewards_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.rank_rewards_id_seq TO service_role;


--
-- Name: TABLE reward_rarities; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.reward_rarities TO postgres;
GRANT ALL ON TABLE public.reward_rarities TO anon;
GRANT ALL ON TABLE public.reward_rarities TO authenticated;
GRANT ALL ON TABLE public.reward_rarities TO service_role;


--
-- Name: SEQUENCE reward_rarities_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.reward_rarities_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.reward_rarities_id_seq TO anon;
GRANT ALL ON SEQUENCE public.reward_rarities_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.reward_rarities_id_seq TO service_role;


--
-- Name: TABLE rewards; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.rewards TO postgres;
GRANT ALL ON TABLE public.rewards TO anon;
GRANT ALL ON TABLE public.rewards TO authenticated;
GRANT ALL ON TABLE public.rewards TO service_role;


--
-- Name: SEQUENCE rewards_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.rewards_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.rewards_id_seq TO anon;
GRANT ALL ON SEQUENCE public.rewards_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.rewards_id_seq TO service_role;


--
-- Name: TABLE shop_categories; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.shop_categories TO postgres;
GRANT ALL ON TABLE public.shop_categories TO anon;
GRANT ALL ON TABLE public.shop_categories TO authenticated;
GRANT ALL ON TABLE public.shop_categories TO service_role;


--
-- Name: SEQUENCE shop_categories_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.shop_categories_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.shop_categories_id_seq TO anon;
GRANT ALL ON SEQUENCE public.shop_categories_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.shop_categories_id_seq TO service_role;


--
-- Name: TABLE shop_products; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.shop_products TO postgres;
GRANT ALL ON TABLE public.shop_products TO anon;
GRANT ALL ON TABLE public.shop_products TO authenticated;
GRANT ALL ON TABLE public.shop_products TO service_role;


--
-- Name: SEQUENCE shop_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.shop_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.shop_id_seq TO anon;
GRANT ALL ON SEQUENCE public.shop_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.shop_id_seq TO service_role;


--
-- Name: TABLE skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.skills TO postgres;
GRANT ALL ON TABLE public.skills TO anon;
GRANT ALL ON TABLE public.skills TO authenticated;
GRANT ALL ON TABLE public.skills TO service_role;


--
-- Name: SEQUENCE skills_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.skills_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.skills_id_seq TO anon;
GRANT ALL ON SEQUENCE public.skills_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.skills_id_seq TO service_role;


--
-- Name: TABLE test_users; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.test_users TO postgres;
GRANT ALL ON TABLE public.test_users TO anon;
GRANT ALL ON TABLE public.test_users TO authenticated;
GRANT ALL ON TABLE public.test_users TO service_role;


--
-- Name: SEQUENCE test_users_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.test_users_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.test_users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.test_users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.test_users_id_seq TO service_role;


--
-- Name: TABLE user_events; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_events TO postgres;
GRANT ALL ON TABLE public.user_events TO anon;
GRANT ALL ON TABLE public.user_events TO authenticated;
GRANT ALL ON TABLE public.user_events TO service_role;


--
-- Name: SEQUENCE user_events_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.user_events_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.user_events_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_events_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_events_id_seq TO service_role;


--
-- Name: TABLE user_missions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_missions TO postgres;
GRANT ALL ON TABLE public.user_missions TO anon;
GRANT ALL ON TABLE public.user_missions TO authenticated;
GRANT ALL ON TABLE public.user_missions TO service_role;


--
-- Name: SEQUENCE user_missions_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.user_missions_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.user_missions_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_missions_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_missions_id_seq TO service_role;


--
-- Name: TABLE user_purchases; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_purchases TO postgres;
GRANT ALL ON TABLE public.user_purchases TO anon;
GRANT ALL ON TABLE public.user_purchases TO authenticated;
GRANT ALL ON TABLE public.user_purchases TO service_role;


--
-- Name: SEQUENCE user_purchases_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.user_purchases_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.user_purchases_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_purchases_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_purchases_id_seq TO service_role;


--
-- Name: TABLE user_rewards; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_rewards TO postgres;
GRANT ALL ON TABLE public.user_rewards TO anon;
GRANT ALL ON TABLE public.user_rewards TO authenticated;
GRANT ALL ON TABLE public.user_rewards TO service_role;


--
-- Name: SEQUENCE user_rewards_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.user_rewards_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.user_rewards_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_rewards_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_rewards_id_seq TO service_role;


--
-- Name: TABLE user_skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_skills TO postgres;
GRANT ALL ON TABLE public.user_skills TO anon;
GRANT ALL ON TABLE public.user_skills TO authenticated;
GRANT ALL ON TABLE public.user_skills TO service_role;


--
-- Name: SEQUENCE user_skills_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.user_skills_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.user_skills_id_seq TO anon;
GRANT ALL ON SEQUENCE public.user_skills_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.user_skills_id_seq TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.users TO postgres;
GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: TABLE view_events; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_events TO postgres;
GRANT ALL ON TABLE public.view_events TO anon;
GRANT ALL ON TABLE public.view_events TO authenticated;
GRANT ALL ON TABLE public.view_events TO service_role;


--
-- Name: TABLE view_logbook; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_logbook TO postgres;
GRANT ALL ON TABLE public.view_logbook TO anon;
GRANT ALL ON TABLE public.view_logbook TO authenticated;
GRANT ALL ON TABLE public.view_logbook TO service_role;


--
-- Name: TABLE view_mission_required_skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_mission_required_skills TO postgres;
GRANT ALL ON TABLE public.view_mission_required_skills TO anon;
GRANT ALL ON TABLE public.view_mission_required_skills TO authenticated;
GRANT ALL ON TABLE public.view_mission_required_skills TO service_role;


--
-- Name: TABLE view_mission_skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_mission_skills TO postgres;
GRANT ALL ON TABLE public.view_mission_skills TO anon;
GRANT ALL ON TABLE public.view_mission_skills TO authenticated;
GRANT ALL ON TABLE public.view_mission_skills TO service_role;


--
-- Name: TABLE view_missions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_missions TO postgres;
GRANT ALL ON TABLE public.view_missions TO anon;
GRANT ALL ON TABLE public.view_missions TO authenticated;
GRANT ALL ON TABLE public.view_missions TO service_role;


--
-- Name: TABLE view_rewards; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_rewards TO postgres;
GRANT ALL ON TABLE public.view_rewards TO anon;
GRANT ALL ON TABLE public.view_rewards TO authenticated;
GRANT ALL ON TABLE public.view_rewards TO service_role;


--
-- Name: TABLE view_shop_products; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_shop_products TO postgres;
GRANT ALL ON TABLE public.view_shop_products TO anon;
GRANT ALL ON TABLE public.view_shop_products TO authenticated;
GRANT ALL ON TABLE public.view_shop_products TO service_role;


--
-- Name: TABLE view_skills; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_skills TO postgres;
GRANT ALL ON TABLE public.view_skills TO anon;
GRANT ALL ON TABLE public.view_skills TO authenticated;
GRANT ALL ON TABLE public.view_skills TO service_role;


--
-- Name: TABLE view_top_users_month; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_top_users_month TO postgres;
GRANT ALL ON TABLE public.view_top_users_month TO anon;
GRANT ALL ON TABLE public.view_top_users_month TO authenticated;
GRANT ALL ON TABLE public.view_top_users_month TO service_role;


--
-- Name: TABLE view_top_users_week; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_top_users_week TO postgres;
GRANT ALL ON TABLE public.view_top_users_week TO anon;
GRANT ALL ON TABLE public.view_top_users_week TO authenticated;
GRANT ALL ON TABLE public.view_top_users_week TO service_role;


--
-- Name: TABLE view_top_users_year; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_top_users_year TO postgres;
GRANT ALL ON TABLE public.view_top_users_year TO anon;
GRANT ALL ON TABLE public.view_top_users_year TO authenticated;
GRANT ALL ON TABLE public.view_top_users_year TO service_role;


--
-- Name: TABLE view_user_events; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_user_events TO postgres;
GRANT ALL ON TABLE public.view_user_events TO anon;
GRANT ALL ON TABLE public.view_user_events TO authenticated;
GRANT ALL ON TABLE public.view_user_events TO service_role;


--
-- Name: TABLE view_user_missions; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_user_missions TO postgres;
GRANT ALL ON TABLE public.view_user_missions TO anon;
GRANT ALL ON TABLE public.view_user_missions TO authenticated;
GRANT ALL ON TABLE public.view_user_missions TO service_role;


--
-- Name: TABLE view_user_purchases; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_user_purchases TO postgres;
GRANT ALL ON TABLE public.view_user_purchases TO anon;
GRANT ALL ON TABLE public.view_user_purchases TO authenticated;
GRANT ALL ON TABLE public.view_user_purchases TO service_role;


--
-- Name: TABLE view_users; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.view_users TO postgres;
GRANT ALL ON TABLE public.view_users TO anon;
GRANT ALL ON TABLE public.view_users TO authenticated;
GRANT ALL ON TABLE public.view_users TO service_role;


--
-- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
--

GRANT ALL ON TABLE realtime.messages TO postgres;
GRANT ALL ON TABLE realtime.messages TO dashboard_user;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


--
-- Name: TABLE messages_2025_09_29; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_29 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_29 TO dashboard_user;


--
-- Name: TABLE messages_2025_09_30; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_09_30 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_09_30 TO dashboard_user;


--
-- Name: TABLE messages_2025_10_01; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_10_01 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_10_01 TO dashboard_user;


--
-- Name: TABLE messages_2025_10_02; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_10_02 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_10_02 TO dashboard_user;


--
-- Name: TABLE messages_2025_10_03; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_10_03 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_10_03 TO dashboard_user;


--
-- Name: TABLE messages_2025_10_04; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_10_04 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_10_04 TO dashboard_user;


--
-- Name: TABLE messages_2025_10_05; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.messages_2025_10_05 TO postgres;
GRANT ALL ON TABLE realtime.messages_2025_10_05 TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


--
-- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
GRANT SELECT ON TABLE realtime.subscription TO anon;
GRANT SELECT ON TABLE realtime.subscription TO authenticated;
GRANT SELECT ON TABLE realtime.subscription TO service_role;
GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


--
-- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.prefixes TO service_role;
GRANT ALL ON TABLE storage.prefixes TO authenticated;
GRANT ALL ON TABLE storage.prefixes TO anon;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


--
-- Name: TABLE hooks; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;


--
-- Name: SEQUENCE hooks_id_seq; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;


--
-- Name: TABLE migrations; Type: ACL; Schema: supabase_functions; Owner: supabase_functions_admin
--

GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;


--
-- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,DELETE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;


--
-- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
--

GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: supabase_functions; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

