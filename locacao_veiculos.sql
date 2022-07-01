--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)

-- Started on 2022-07-01 13:57:36 -03

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
-- TOC entry 214 (class 1259 OID 17090)
-- Name: carros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carros (
    id integer NOT NULL,
    id_modelos integer NOT NULL,
    descricao character varying(200) NOT NULL,
    placa character varying(100) NOT NULL,
    valor_diaria numeric(15,2) NOT NULL,
    renavam character varying(100),
    ano_lancamento character varying(4) NOT NULL
);


ALTER TABLE public.carros OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17078)
-- Name: modelos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelos (
    id integer NOT NULL,
    id_marcas integer NOT NULL,
    nome character varying(200) NOT NULL
);


ALTER TABLE public.modelos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17188)
-- Name: ano_lancamento_maior_igual_2000; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ano_lancamento_maior_igual_2000 AS
 SELECT m.nome,
    c.ano_lancamento,
    c.descricao
   FROM (public.carros c
     JOIN public.modelos m ON ((c.id_modelos = m.id)))
  WHERE ((c.ano_lancamento)::text >= '2000'::text);


ALTER TABLE public.ano_lancamento_maior_igual_2000 OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17184)
-- Name: ano_lancamento_menor_2000; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ano_lancamento_menor_2000 AS
 SELECT m.nome,
    c.ano_lancamento,
    c.descricao
   FROM (public.carros c
     JOIN public.modelos m ON ((c.id_modelos = m.id)))
  WHERE ((c.ano_lancamento)::text < '2000'::text);


ALTER TABLE public.ano_lancamento_menor_2000 OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17089)
-- Name: carros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carros_id_seq OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 213
-- Name: carros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carros_id_seq OWNED BY public.carros.id;


--
-- TOC entry 222 (class 1259 OID 17143)
-- Name: cliente_enderecos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_enderecos (
    id integer NOT NULL,
    id_clientes integer NOT NULL,
    id_enderecos integer NOT NULL
);


ALTER TABLE public.cliente_enderecos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17142)
-- Name: cliente_enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_enderecos_id_seq OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 221
-- Name: cliente_enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_enderecos_id_seq OWNED BY public.cliente_enderecos.id;


--
-- TOC entry 216 (class 1259 OID 17106)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    cpf character varying(20) NOT NULL,
    telefone character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    rg character varying(20) NOT NULL,
    data_nasc date NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17105)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 218 (class 1259 OID 17117)
-- Name: enderecos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enderecos (
    id integer NOT NULL,
    cep character varying(100) NOT NULL,
    cidade character varying(200) NOT NULL,
    bairro character varying(200) NOT NULL,
    rua character varying(200) NOT NULL,
    estado character varying(100) NOT NULL
);


ALTER TABLE public.enderecos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17116)
-- Name: enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enderecos_id_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 217
-- Name: enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enderecos_id_seq OWNED BY public.enderecos.id;


--
-- TOC entry 220 (class 1259 OID 17126)
-- Name: locacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locacao (
    id integer NOT NULL,
    id_clientes integer NOT NULL,
    id_carros integer NOT NULL,
    data_inicial date NOT NULL,
    data_final date NOT NULL
);


ALTER TABLE public.locacao OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17125)
-- Name: locacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locacao_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 219
-- Name: locacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locacao_id_seq OWNED BY public.locacao.id;


--
-- TOC entry 210 (class 1259 OID 17071)
-- Name: marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marcas (
    id integer NOT NULL,
    nome character varying(200) NOT NULL
);


ALTER TABLE public.marcas OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 17070)
-- Name: marcas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marcas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marcas_id_seq OWNER TO postgres;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 209
-- Name: marcas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marcas_id_seq OWNED BY public.marcas.id;


--
-- TOC entry 211 (class 1259 OID 17077)
-- Name: modelos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.modelos_id_seq OWNER TO postgres;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 211
-- Name: modelos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelos_id_seq OWNED BY public.modelos.id;


--
-- TOC entry 230 (class 1259 OID 17201)
-- Name: nome_clientes_alugaram_mes_5; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.nome_clientes_alugaram_mes_5 AS
 SELECT c.nome,
    c.telefone,
    c.email,
    c.cpf
   FROM (public.locacao l
     JOIN public.clientes c ON ((l.id_clientes = c.id)))
  WHERE ((l.data_inicial >= '2022-05-01'::date) AND (l.data_inicial <= '2022-05-31'::date));


ALTER TABLE public.nome_clientes_alugaram_mes_5 OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17197)
-- Name: nome_telefone_pelo_ddd; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.nome_telefone_pelo_ddd AS
 SELECT clientes.nome,
    clientes.telefone
   FROM public.clientes
  WHERE ((clientes.telefone)::text ~~ '(55)%'::text);


ALTER TABLE public.nome_telefone_pelo_ddd OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17192)
-- Name: valor_diaria_menor_preço; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."valor_diaria_menor_preço" AS
 SELECT ma.nome AS nome_marca,
    m.nome AS nome_modelo,
    c.ano_lancamento,
    c.placa,
    c.valor_diaria
   FROM ((public.carros c
     JOIN public.modelos m ON ((c.id_modelos = m.id)))
     JOIN public.marcas ma ON ((m.id_marcas = ma.id)))
  WHERE (c.valor_diaria < (200)::numeric)
  ORDER BY c.valor_diaria;


ALTER TABLE public."valor_diaria_menor_preço" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17176)
-- Name: vw_nome_endereco_cliente_uf_rs; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_nome_endereco_cliente_uf_rs AS
 SELECT c.nome,
    e.estado
   FROM ((public.cliente_enderecos ce
     JOIN public.clientes c ON ((ce.id_clientes = c.id)))
     JOIN public.enderecos e ON ((ce.id_enderecos = e.id)))
  WHERE ((e.estado)::text = 'RS'::text);


ALTER TABLE public.vw_nome_endereco_cliente_uf_rs OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17180)
-- Name: vw_nome_endereco_cliente_uf_sc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_nome_endereco_cliente_uf_sc AS
 SELECT c.nome,
    e.estado
   FROM ((public.cliente_enderecos ce
     JOIN public.clientes c ON ((ce.id_clientes = c.id)))
     JOIN public.enderecos e ON ((ce.id_enderecos = e.id)))
  WHERE ((e.estado)::text = 'SC'::text);


ALTER TABLE public.vw_nome_endereco_cliente_uf_sc OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17171)
-- Name: vw_total_pagar; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_total_pagar AS
 SELECT cl.nome,
    md.nome AS veiculo,
    c.placa,
    c.ano_lancamento,
    c.valor_diaria,
    l.data_inicial,
    l.data_final,
    concat('R$ ', (((l.data_final - l.data_inicial))::numeric * c.valor_diaria)) AS total_pagar
   FROM (((public.locacao l
     JOIN public.carros c ON ((l.id_carros = c.id)))
     JOIN public.clientes cl ON ((l.id_clientes = cl.id)))
     JOIN public.modelos md ON ((c.id_modelos = md.id)));


ALTER TABLE public.vw_total_pagar OWNER TO postgres;

--
-- TOC entry 3273 (class 2604 OID 17093)
-- Name: carros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carros ALTER COLUMN id SET DEFAULT nextval('public.carros_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 17146)
-- Name: cliente_enderecos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_enderecos ALTER COLUMN id SET DEFAULT nextval('public.cliente_enderecos_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 17109)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 17120)
-- Name: enderecos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos ALTER COLUMN id SET DEFAULT nextval('public.enderecos_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 17129)
-- Name: locacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao ALTER COLUMN id SET DEFAULT nextval('public.locacao_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 17074)
-- Name: marcas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas ALTER COLUMN id SET DEFAULT nextval('public.marcas_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 17081)
-- Name: modelos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelos ALTER COLUMN id SET DEFAULT nextval('public.modelos_id_seq'::regclass);


--
-- TOC entry 3456 (class 0 OID 17090)
-- Dependencies: 214
-- Data for Name: carros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carros VALUES (1, 1, 'Branco', 'NCF-0572', 120.00, '84630511447', '1993');
INSERT INTO public.carros VALUES (2, 2, 'Azul', 'HLS-0163', 180.00, '99603504409', '1991');
INSERT INTO public.carros VALUES (3, 3, 'Preto', 'IDH-4080', 250.00, '20449423985', '2006');
INSERT INTO public.carros VALUES (4, 4, 'Cinza', 'LWN-4684', 80.00, '01498532656', '1993');
INSERT INTO public.carros VALUES (5, 5, 'Prata', 'KQG-4351', 150.00, '89371501166', '1998');


--
-- TOC entry 3464 (class 0 OID 17143)
-- Dependencies: 222
-- Data for Name: cliente_enderecos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente_enderecos VALUES (1, 1, 1);
INSERT INTO public.cliente_enderecos VALUES (2, 2, 2);
INSERT INTO public.cliente_enderecos VALUES (3, 3, 3);
INSERT INTO public.cliente_enderecos VALUES (4, 4, 4);
INSERT INTO public.cliente_enderecos VALUES (5, 5, 5);
INSERT INTO public.cliente_enderecos VALUES (6, 6, 6);
INSERT INTO public.cliente_enderecos VALUES (7, 7, 7);
INSERT INTO public.cliente_enderecos VALUES (8, 8, 8);
INSERT INTO public.cliente_enderecos VALUES (9, 9, 9);
INSERT INTO public.cliente_enderecos VALUES (10, 10, 10);
INSERT INTO public.cliente_enderecos VALUES (11, 11, 11);
INSERT INTO public.cliente_enderecos VALUES (12, 12, 12);
INSERT INTO public.cliente_enderecos VALUES (13, 13, 13);
INSERT INTO public.cliente_enderecos VALUES (14, 14, 14);
INSERT INTO public.cliente_enderecos VALUES (15, 15, 15);
INSERT INTO public.cliente_enderecos VALUES (16, 16, 16);
INSERT INTO public.cliente_enderecos VALUES (17, 17, 17);
INSERT INTO public.cliente_enderecos VALUES (18, 18, 18);
INSERT INTO public.cliente_enderecos VALUES (19, 19, 19);
INSERT INTO public.cliente_enderecos VALUES (20, 20, 20);
INSERT INTO public.cliente_enderecos VALUES (21, 21, 21);
INSERT INTO public.cliente_enderecos VALUES (22, 22, 22);
INSERT INTO public.cliente_enderecos VALUES (23, 23, 23);
INSERT INTO public.cliente_enderecos VALUES (24, 24, 24);
INSERT INTO public.cliente_enderecos VALUES (25, 25, 25);
INSERT INTO public.cliente_enderecos VALUES (26, 26, 26);
INSERT INTO public.cliente_enderecos VALUES (27, 27, 27);
INSERT INTO public.cliente_enderecos VALUES (28, 28, 28);
INSERT INTO public.cliente_enderecos VALUES (29, 29, 29);
INSERT INTO public.cliente_enderecos VALUES (30, 30, 30);
INSERT INTO public.cliente_enderecos VALUES (31, 31, 31);
INSERT INTO public.cliente_enderecos VALUES (32, 32, 32);
INSERT INTO public.cliente_enderecos VALUES (33, 33, 33);
INSERT INTO public.cliente_enderecos VALUES (34, 34, 34);
INSERT INTO public.cliente_enderecos VALUES (35, 35, 35);
INSERT INTO public.cliente_enderecos VALUES (36, 36, 36);
INSERT INTO public.cliente_enderecos VALUES (37, 37, 37);
INSERT INTO public.cliente_enderecos VALUES (38, 38, 38);
INSERT INTO public.cliente_enderecos VALUES (39, 39, 39);
INSERT INTO public.cliente_enderecos VALUES (40, 40, 40);
INSERT INTO public.cliente_enderecos VALUES (41, 41, 41);
INSERT INTO public.cliente_enderecos VALUES (42, 42, 42);
INSERT INTO public.cliente_enderecos VALUES (43, 43, 43);
INSERT INTO public.cliente_enderecos VALUES (44, 44, 44);
INSERT INTO public.cliente_enderecos VALUES (45, 45, 45);
INSERT INTO public.cliente_enderecos VALUES (46, 46, 46);
INSERT INTO public.cliente_enderecos VALUES (47, 47, 47);
INSERT INTO public.cliente_enderecos VALUES (48, 48, 48);
INSERT INTO public.cliente_enderecos VALUES (49, 49, 49);
INSERT INTO public.cliente_enderecos VALUES (50, 50, 50);
INSERT INTO public.cliente_enderecos VALUES (51, 51, 51);
INSERT INTO public.cliente_enderecos VALUES (52, 52, 52);
INSERT INTO public.cliente_enderecos VALUES (53, 53, 53);
INSERT INTO public.cliente_enderecos VALUES (54, 54, 54);
INSERT INTO public.cliente_enderecos VALUES (55, 55, 55);
INSERT INTO public.cliente_enderecos VALUES (56, 56, 56);
INSERT INTO public.cliente_enderecos VALUES (57, 57, 57);
INSERT INTO public.cliente_enderecos VALUES (58, 58, 58);
INSERT INTO public.cliente_enderecos VALUES (59, 59, 59);
INSERT INTO public.cliente_enderecos VALUES (60, 60, 60);


--
-- TOC entry 3458 (class 0 OID 17106)
-- Dependencies: 216
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (1, 'Tiago Tiago Felipe Fogaça', '261.694.985-79', '(99) 99453-0854', 'tiago_fogaca@br.ibm.com', '25.177.883-6', '2003-01-25');
INSERT INTO public.clientes VALUES (2, 'Anthony Breno Assunção', '352.393.382-05', '(68) 98941-8316', 'anthony-assuncao80@kof.com.mx', '40.899.266-9', '1978-02-24');
INSERT INTO public.clientes VALUES (3, 'Pietro Osvaldo Theo Novaes', '705.631.859-29', '(81) 99641-9661', 'pietro.osvaldo.novaes@jetstar.com.br', '45.132.208-3', '1962-06-02');
INSERT INTO public.clientes VALUES (4, 'Lavínia Carla Aparecida Assis', '326.275.765-93', '(61) 98849-0851', 'lavinia_assis@hotmail.it', '23.150.630-2', '1988-03-02');
INSERT INTO public.clientes VALUES (5, 'Andrea Cristiane Regina Jesus', '731.881.443-50', '(79) 99849-8496', 'andreacristianejesus@policiamilitar.sp.gov.br', '15.280.616-7', '2001-06-24');
INSERT INTO public.clientes VALUES (6, 'Fernando Otávio Bernardes', '018.014.702-19', '(62) 98314-3773', 'fernando_bernardes@dpi.indl.com.br', '34.912.389-5', '1988-05-18');
INSERT INTO public.clientes VALUES (7, 'Heloise Nair Isabel Cavalcanti', '381.158.727-76', '(63) 99631-9215', 'heloise-cavalcanti92@rcstechnology.com.br', '35.512.339-3', '1943-05-04');
INSERT INTO public.clientes VALUES (8, 'Adriana Giovanna Lara Almada', '740.070.887-21', '(71) 99254-4590', 'adriana_almada@redhouse.com.br', '34.266.247-8', '2001-03-23');
INSERT INTO public.clientes VALUES (9, 'Nicolas Roberto Farias', '108.885.261-05', '(75) 99577-3648', 'nicolasrobertofarias@agacapital.com.br', '17.915.278-6', '1962-02-17');
INSERT INTO public.clientes VALUES (10, 'Benedito Gustavo Pereira', '479.636.609-14', '(83) 99233-8871', 'benedito.gustavo.pereira@db9.com.br', '41.992.682-3', '1975-06-28');
INSERT INTO public.clientes VALUES (11, 'Renata Nina Teixeira', '456.716.736-82', '(63) 99757-7654', 'renata-teixeira77@marcenariamagno.com.br', '11.154.691-6', '1989-02-24');
INSERT INTO public.clientes VALUES (12, 'Jéssica Isabelle Alessandra de Paula', '924.056.961-85', '(98) 99456-8938', 'jessicaisabelledepaula@ceuazul.ind.br', '44.397.717-3', '1965-04-05');
INSERT INTO public.clientes VALUES (13, 'Gustavo Mário Viana', '105.620.841-42', '(84) 98170-6386', 'gustavo.mario.viana@dominiozeladoria.com.br', '47.096.872-2', '1954-04-19');
INSERT INTO public.clientes VALUES (14, 'Pietra Mariane Stefany Ramos', '315.772.347-23', '(86) 99967-5254', 'pietra.mariane.ramos@aguabr.com.br', '38.992.016-2', '1976-06-16');
INSERT INTO public.clientes VALUES (15, 'Elias Fernando Gael Lopes', '311.530.592-31', '(11) 98514-7921', 'elias_fernando_lopes@vitaonline.com.br', '19.328.393-1', '1989-03-16');
INSERT INTO public.clientes VALUES (16, 'Eloá Débora da Cruz', '759.202.895-62', '(95) 98119-4070', 'eloa-dacruz99@cursomarcato.com.br', '13.360.597-8', '2003-06-07');
INSERT INTO public.clientes VALUES (17, 'Tiago Eduardo Nunes', '012.404.792-04', '(81) 99568-6187', 'tiago.eduardo.nunes@raizen.com', '19.883.226-6', '2002-01-01');
INSERT INTO public.clientes VALUES (18, 'Danilo Noah Rodrigues', '245.750.771-51', '(47) 98172-0516', 'danilo-rodrigues99@osite.com.br', '23.655.523-6', '1954-04-01');
INSERT INTO public.clientes VALUES (19, 'Brenda Milena da Luz', '831.271.196-15', '(61) 99951-2517', 'brenda_daluz@adiretoria.com.br', '40.826.172-9', '1965-01-17');
INSERT INTO public.clientes VALUES (20, 'Ayla Sandra Priscila Silveira', '439.955.658-75', '(86) 98250-0328', 'aylasandrasilveira@bemarius.com.br', '21.030.012-7', '1993-01-05');
INSERT INTO public.clientes VALUES (21, 'Igor Filipe Aragão', '702.168.470-36', '(65) 98534-2869', 'igorfilipearagao@fertau.com.br', '32.853.753-6', '1973-04-08');
INSERT INTO public.clientes VALUES (22, 'Isaac Mateus Tomás Barbosa', '576.071.533-06', '(86) 98778-6888', 'isaacmateusbarbosa@almaquinas.com.br', '12.809.824-7', '1965-05-07');
INSERT INTO public.clientes VALUES (23, 'Marcos Vinicius Yago Henry Vieira', '223.344.161-34', '(47) 99969-0210', 'marcos.vinicius.vieira@r7.com', '39.936.866-8', '1942-05-26');
INSERT INTO public.clientes VALUES (24, 'Francisco Geraldo Bernardo Santos', '193.545.238-03', '(83) 98731-4125', 'francisco_santos@lphbrasil.com.br', '42.182.897-3', '1997-04-19');
INSERT INTO public.clientes VALUES (25, 'Antônia Andrea das Neves', '015.637.604-01', '(79) 99890-1139', 'antonia_andrea_dasneves@engemed.com', '26.613.891-3', '1971-02-14');
INSERT INTO public.clientes VALUES (26, 'Giovana Rosa Raimunda Pinto', '518.485.630-78', '(66) 99960-7256', 'giovanarosapinto@riobc.com.br', '29.811.935-3', '1970-01-06');
INSERT INTO public.clientes VALUES (27, 'Emilly Débora da Cunha', '125.386.302-40', '(63) 99148-3850', 'emilly-dacunha70@carvajal.com', '47.143.504-1', '1982-04-04');
INSERT INTO public.clientes VALUES (28, 'Francisco Anderson Castro', '745.662.238-84', '(44) 99356-3011', 'franciscoandersoncastro@dgh.com.br', '23.828.367-7', '1977-01-16');
INSERT INTO public.clientes VALUES (29, 'Tatiane Vitória Lavínia Moraes', '736.057.681-48', '(41) 99970-3059', 'tatiane-moraes84@uniara.com.br', '19.999.977-6', '1984-05-23');
INSERT INTO public.clientes VALUES (30, 'Marcela Márcia Rezende', '402.281.780-10', '(95) 99649-2023', 'marcela-rezende87@vivax.com.br', '39.257.929-7', '1988-04-12');
INSERT INTO public.clientes VALUES (31, 'Marina Alana Caroline Barros', '328.872.590-83', '(48) 98149-2334', 'marinaalanabarros@tahoo.com.br', '41.423.312-8', '1975-06-17');
INSERT INTO public.clientes VALUES (32, 'Lucca Mário Ferreira', '575.336.074-22', '(98) 99359-9420', 'lucca.mario.ferreira@unink.com.br', '43.717.151-6', '1998-02-12');
INSERT INTO public.clientes VALUES (33, 'Elza Marina Marli Farias', '782.262.140-84', '(11) 99127-9068', 'elzamarinafarias@megasurgical.com.br', '14.989.117-9', '1948-06-15');
INSERT INTO public.clientes VALUES (34, 'Bento Cauã Carvalho', '366.161.997-70', '(91) 98541-1867', 'bento_caua_carvalho@chiba.net.br', '30.857.353-5', '1974-02-16');
INSERT INTO public.clientes VALUES (35, 'Hugo Arthur Souza', '248.402.728-16', '(41) 99547-5018', 'hugo.arthur.souza@bbcreative.org', '50.459.604-4', '2000-03-05');
INSERT INTO public.clientes VALUES (36, 'Raimundo César Sales', '858.680.140-22', '(63) 98964-2564', 'raimundocesarsales@novotempo.com', '49.554.238-6', '1990-05-08');
INSERT INTO public.clientes VALUES (37, 'Antonio Gustavo Cauê de Paula', '542.463.294-79', '(69) 98521-3646', 'antonio_depaula@yahool.com', '22.191.102-9', '1958-03-09');
INSERT INTO public.clientes VALUES (38, 'Augusto Felipe Manoel da Mota', '262.256.560-73', '(91) 98851-1480', 'augusto.felipe.damota@mixfmmanaus.com.br', '14.513.235-3', '1981-04-15');
INSERT INTO public.clientes VALUES (39, 'Julia Isadora Alícia Assis', '986.803.375-60', '(86) 99755-6694', 'julia_assis@hormail.com', '12.335.034-7', '1976-03-02');
INSERT INTO public.clientes VALUES (40, 'Murilo Enzo Enrico Mendes', '292.570.973-74', '(55) 98806-5457', 'murilo_enzo_mendes@br.flextronics.com', '11.772.877-9', '1983-03-08');
INSERT INTO public.clientes VALUES (41, 'Rosa Giovanna Oliveira', '389.423.755-45', '(81) 99100-3760', 'rosa-oliveira84@gmail.com', '33.330.022-1', '1978-01-05');
INSERT INTO public.clientes VALUES (42, 'Sophia Carolina Márcia Novaes', '225.442.199-98', '(83) 99988-2716', 'sophiacarolinanovaes@rgsa.com.br', '30.422.891-6', '1982-05-13');
INSERT INTO public.clientes VALUES (43, 'Sueli Eduarda Lavínia Peixoto', '521.376.011-25', '(67) 99584-0879', 'suelieduardapeixoto@hotrmail.com', '37.178.076-7', '1986-02-04');
INSERT INTO public.clientes VALUES (44, 'Ana Luciana Rodrigues', '485.039.061-71', '(41) 98261-7162', 'ana_luciana_rodrigues@mega.com.br', '31.269.493-3', '1988-04-14');
INSERT INTO public.clientes VALUES (45, 'Débora Sophia da Costa', '901.126.371-59', '(41) 99221-6937', 'deborasophiadacosta@maiamaquinas.com.br', '26.258.726-9', '1950-02-05');
INSERT INTO public.clientes VALUES (46, 'Manuela Maitê Márcia Almeida', '471.403.807-91', '(67) 98203-6898', 'manuelamaitealmeida@roche.com', '25.493.704-4', '1970-01-12');
INSERT INTO public.clientes VALUES (47, 'Henry Tiago Anderson Aragão', '078.389.293-42', '(63) 99513-8018', 'henrytiagoaragao@dpi.ig.br', '41.213.367-2', '1961-05-10');
INSERT INTO public.clientes VALUES (48, 'Agatha Sueli Emilly da Mata', '694.152.430-82', '(86) 99412-6880', 'agatha.sueli.damata@gm.com', '22.125.706-8', '1969-04-19');
INSERT INTO public.clientes VALUES (49, 'Bernardo Geraldo Gustavo Baptista', '144.570.240-15', '(48) 98269-9436', 'bernardo-baptista96@mnproducoes.com', '16.267.221-4', '1959-03-18');
INSERT INTO public.clientes VALUES (50, 'Clara Bianca da Rocha', '783.346.703-03', '(84) 98335-4461', 'clara-darocha82@gracomonline.com.br', '49.457.652-2', '1953-03-20');
INSERT INTO public.clientes VALUES (51, 'Mateus Vinicius Bernardo Moreira', '893.265.762-99', '(95) 98474-0955', 'mateus-moreira75@pierproj.com.br', '46.855.920-6', '1996-02-09');
INSERT INTO public.clientes VALUES (52, 'Letícia Gabrielly Viana', '740.403.832-49', '(61) 98745-9857', 'leticia-viana97@suzano.com.br', '34.338.146-1', '1963-06-29');
INSERT INTO public.clientes VALUES (53, 'Francisco Hugo Calebe Costa', '167.044.333-76', '(21) 98714-8698', 'francisco_hugo_costa@l3ambiental.com.br', '42.094.294-4', '1999-03-26');
INSERT INTO public.clientes VALUES (54, 'Stella Brenda Rezende', '292.799.620-27', '(19) 98863-5532', 'stella-rezende96@andrediaz.com', '40.282.440-4', '2003-03-06');
INSERT INTO public.clientes VALUES (55, 'Mariane Patrícia Vera Cavalcanti', '805.430.393-90', '(21) 99752-1174', 'mariane.patricia.cavalcanti@purkyt.com', '21.500.837-6', '1967-04-09');
INSERT INTO public.clientes VALUES (56, 'Henry Enzo Edson Moura', '505.800.145-41', '(81) 98830-7985', 'henry-moura70@tce.sp.gov.br', '14.719.544-5', '1947-03-15');
INSERT INTO public.clientes VALUES (57, 'Milena Sônia Cardoso', '400.423.927-30', '(79) 99857-9011', 'milena_cardoso@santacasasjc.com.br', '11.776.387-1', '1978-03-09');
INSERT INTO public.clientes VALUES (58, 'Heitor Sérgio Martin Aparício', '005.004.433-86', '(51) 98841-8787', 'heitor.sergio.aparicio@easytechconsultoria.com.br', '16.064.096-9', '1949-06-04');
INSERT INTO public.clientes VALUES (59, 'Clara Ayla Moraes', '828.957.507-69', '(63) 98928-1684', 'clara_moraes@huios.com.br', '19.935.941-6', '1960-02-10');
INSERT INTO public.clientes VALUES (60, 'Tiago Ian Márcio Ramos', '128.883.124-25', '(41) 98376-2008', 'tiago-ramos72@emerson.com', '28.645.577-8', '1951-04-18');


--
-- TOC entry 3460 (class 0 OID 17117)
-- Dependencies: 218
-- Data for Name: enderecos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.enderecos VALUES (1, '88070-101', 'Florianópolis', 'Estreito', 'Rua Santos Saraiva', 'SC');
INSERT INTO public.enderecos VALUES (2, '65025-840', 'São Luís', 'Apicum', 'Rua Dom Xisto Albano', 'MA');
INSERT INTO public.enderecos VALUES (3, '08373-210', 'São Paulo', 'Jardim Nova Vitória I', 'Rua Valdete', 'SP');
INSERT INTO public.enderecos VALUES (4, '67113-035', 'Ananindeua', 'Coqueiro', 'Rua C', 'PA');
INSERT INTO public.enderecos VALUES (5, '83005-170', 'São José dos Pinhais', 'Centro', 'Rua Doutor Motta Júnior', 'PR');
INSERT INTO public.enderecos VALUES (6, '77001-718', 'Palmas', 'Plano Diretor Norte', 'Quadra 607 Norte Alameda 4', 'TO');
INSERT INTO public.enderecos VALUES (7, '76908-480', 'Ji-Paraná', 'Nova Brasília', 'Rua João Batista Neto', 'RO');
INSERT INTO public.enderecos VALUES (8, '66812-222', 'Belém', 'Ponta Grossa (Icoaraci)', 'Passagem Beira Mar', 'PA');
INSERT INTO public.enderecos VALUES (9, '64040-265', 'Teresina', 'Angelim', 'Rua Santo Amaro', 'PI');
INSERT INTO public.enderecos VALUES (10, '97502-548', 'Uruguaiana', 'São João', 'Rua Ministro Joaquim Murtinho', 'RS');
INSERT INTO public.enderecos VALUES (11, '53550-670', 'Abreu e Lima', 'Planalto', 'Rua Heróis da Restauração', 'PE');
INSERT INTO public.enderecos VALUES (12, '58073-327', 'João Pessoa', 'Cidade dos Colibris', 'Rua Romualdo Anizio da Costa', 'PB');
INSERT INTO public.enderecos VALUES (13, '79044-570', 'Campo Grande', 'Jardim Samambaia', 'Rua das Embauvas', 'MS');
INSERT INTO public.enderecos VALUES (14, '83401-520', 'Colombo', 'Arruda', 'Rodovia da Uva', 'PR');
INSERT INTO public.enderecos VALUES (15, '83508-556', 'Almirante Tamandaré', 'Loteamento Marinoni', 'Rua João Sander Vanzin', 'PR');
INSERT INTO public.enderecos VALUES (16, '79062-642', 'Campo Grande', 'Jardim Itamaracá', 'Rua Lageado', 'MS');
INSERT INTO public.enderecos VALUES (17, '77015-260', 'Palmas', 'Plano Diretor Sul', 'Quadra 205 Sul Avenida LO 5', 'TO');
INSERT INTO public.enderecos VALUES (18, '64027-576', 'Teresina', 'Distrito Industrial', 'Rua Uganda', 'PI');
INSERT INTO public.enderecos VALUES (19, '88820-970', 'Içara', 'Centro', 'Avenida Dílcio Esmael da Silva 796', 'SC');
INSERT INTO public.enderecos VALUES (20, '59155-725', 'Parnamirim', 'Liberdade', 'Rua Herondina Moreira de Souza', 'RN');
INSERT INTO public.enderecos VALUES (21, '69315-258', 'Boa Vista', 'Distrito Industrial Governador Aquilino Mota Duarte', 'Rua DI-X', 'RR');
INSERT INTO public.enderecos VALUES (22, '72927-081', 'Águas Lindas de Goiás', 'Mansões Camargo', 'Quadra Quadra 25', 'GO');
INSERT INTO public.enderecos VALUES (23, '26178-060', 'Belford Roxo', 'Vila Verde', 'Alameda Belford Roxo', 'RJ');
INSERT INTO public.enderecos VALUES (24, '13477-708', 'Americana', 'Jardim Boer I', 'Rua Progresso', 'SP');
INSERT INTO public.enderecos VALUES (25, '24420-463', 'São Gonçalo', 'Rocha', 'Travessa Luiza de Almeida', 'RJ');
INSERT INTO public.enderecos VALUES (26, '53110-610', 'Olinda', 'Salgadinho', 'Rua Cláudio Nigro', 'PE');
INSERT INTO public.enderecos VALUES (27, '49044-260', 'Aracaju', 'Santa Maria', 'Travessa Um', 'SE');
INSERT INTO public.enderecos VALUES (28, '94480-540', 'Viamão', 'Santa Isabel', 'Rua Doutor Nilo', 'RS');
INSERT INTO public.enderecos VALUES (29, '77022-088', 'Palmas', 'Plano Diretor Sul', 'Quadra 612 Sul Avenida LO 15', 'TO');
INSERT INTO public.enderecos VALUES (30, '83212-320', 'Paranaguá', 'Jardim Samambaia', 'Rua dos Guapezeiros', 'PR');
INSERT INTO public.enderecos VALUES (31, '74475-171', 'Goiânia', 'Setor Morada do Sol', 'Rua Coronel L. L. Sobrinho', 'GO');
INSERT INTO public.enderecos VALUES (32, '68908-871', 'Macapá', 'Infraero', 'Avenida Brigadeiro Araripe Macedo', 'AP');
INSERT INTO public.enderecos VALUES (33, '69317-269', 'Boa Vista', 'Alvorada', 'Rua Raimundo Pessoa de Almeida', 'RR');
INSERT INTO public.enderecos VALUES (34, '68903-595', 'Macapá', 'Universidade', 'Travessa Segunda', 'AP');
INSERT INTO public.enderecos VALUES (35, '08593-213', 'Itaquaquecetuba', 'Vila Augusta', 'Rua Antônio Dias Adorno', 'SP');
INSERT INTO public.enderecos VALUES (36, '29175-587', 'Serra', 'das Laranjeiras', 'Avenida Nossa Senhora dos Navegantes', 'ES');
INSERT INTO public.enderecos VALUES (37, '25615-138', 'Petrópolis', 'Provisória', 'Vila Hipólito Hermogênio', 'RJ');
INSERT INTO public.enderecos VALUES (38, '78128-511', 'Várzea Grande', 'Costa Verde', 'Rua São Benedito', 'MT');
INSERT INTO public.enderecos VALUES (39, '97573-628', 'Santana do Livramento', 'Centro', 'Rua Silveira Martins', 'RS');
INSERT INTO public.enderecos VALUES (40, '74356-315', 'Goiânia', 'Residencial Santa Fé', 'Alameda das Imbaúbas', 'GO');
INSERT INTO public.enderecos VALUES (41, '49042-455', 'Aracaju', 'São Conrado', 'Rua Josué de Carvalho Cunha', 'SE');
INSERT INTO public.enderecos VALUES (42, '26311-170', 'Queimados', 'Parque Valdairosa', 'Rua Angelina Figueira', 'RJ');
INSERT INTO public.enderecos VALUES (43, '68925-001', 'Santana', 'Comercial', 'Avenida Souza Mar', 'AP');
INSERT INTO public.enderecos VALUES (44, '74973-810', 'Aparecida de Goiânia', 'Residencial Andrade Reis', 'Rua 99', 'GO');
INSERT INTO public.enderecos VALUES (45, '54720-360', 'São Lourenço da Mata', 'Muribara', 'Rua Assis Ribeiro', 'PE');
INSERT INTO public.enderecos VALUES (46, '49065-100', 'Aracaju', 'Industrial', 'Rua Anatólio Garcia Moreno', 'SE');
INSERT INTO public.enderecos VALUES (47, '57073-464', 'Maceió', 'Cidade Universitária', 'Travessa Magno', 'AL');
INSERT INTO public.enderecos VALUES (48, '88132-350', 'Palhoça', 'Caminho Novo', 'Rua Cinco de Abril', 'SC');
INSERT INTO public.enderecos VALUES (49, '58424-210', 'Campina Grande', 'Três Irmãs', 'Rua Professor Gilberlan Monteiro', 'PB');
INSERT INTO public.enderecos VALUES (50, '76814-066', 'Porto Velho', 'Marcos Freire', 'Rua Framboesa', 'RO');
INSERT INTO public.enderecos VALUES (51, '67124-130', 'Ananindeua', 'Icuí-Laranjeira', 'Travessa Ligação', 'PA');
INSERT INTO public.enderecos VALUES (52, '59614-660', 'Mossoró', 'Santa Delmira', 'Rua Santa Joana D''Arc', 'RN');
INSERT INTO public.enderecos VALUES (53, '69915-726', 'Rio Branco', 'Portal da Amazônia', 'Rua José Mario Junqueira', 'AC');
INSERT INTO public.enderecos VALUES (54, '29060-080', 'Vitória', 'Jardim da Penha', 'Rua Maria Amélia Teixeira de Jesus', 'ES');
INSERT INTO public.enderecos VALUES (55, '74691-670', 'Goiânia', 'Condomínio Parque dos Cisnes', 'Estrada dos Cravos', 'GO');
INSERT INTO public.enderecos VALUES (56, '57310-405', 'Arapiraca', 'Santa Edwiges', 'Rodovia AL-220', 'AL');
INSERT INTO public.enderecos VALUES (57, '41510-010', 'Salvador', 'São Cristóvão', 'Rua Osvaldo Gordilho', 'BA');
INSERT INTO public.enderecos VALUES (58, '76870-774', 'Ariquemes', 'BNH', 'Rua Porto Velho', 'RO');
INSERT INTO public.enderecos VALUES (59, '89221-570', 'Joinville', 'Saguaçu', 'Rua Cabral', 'SC');
INSERT INTO public.enderecos VALUES (60, '66813-030', 'Belém', 'Campina de Icoaraci (Icoaraci)', 'Passagem Furo do Maguari', 'PA');


--
-- TOC entry 3462 (class 0 OID 17126)
-- Dependencies: 220
-- Data for Name: locacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locacao VALUES (1, 1, 1, '2022-04-06', '2022-04-10');
INSERT INTO public.locacao VALUES (2, 2, 2, '2022-02-05', '2022-05-12');
INSERT INTO public.locacao VALUES (3, 3, 3, '2022-04-01', '2022-04-20');
INSERT INTO public.locacao VALUES (4, 4, 4, '2022-05-07', '2022-05-15');
INSERT INTO public.locacao VALUES (5, 5, 5, '2022-05-22', '2022-05-28');


--
-- TOC entry 3452 (class 0 OID 17071)
-- Dependencies: 210
-- Data for Name: marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.marcas VALUES (1, 'Cross Lander');
INSERT INTO public.marcas VALUES (3, 'Wake');
INSERT INTO public.marcas VALUES (4, 'Envemo');
INSERT INTO public.marcas VALUES (5, 'Porsche');
INSERT INTO public.marcas VALUES (2, 'Suzuki');


--
-- TOC entry 3454 (class 0 OID 17078)
-- Dependencies: 212
-- Data for Name: modelos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.modelos VALUES (1, 1, 'Panamera Turbo S 4.8');
INSERT INTO public.modelos VALUES (2, 2, 'Xantia Activa 3.0 V6 Mec');
INSERT INTO public.modelos VALUES (3, 3, 'Vantage 6.0 V12 510cv');
INSERT INTO public.modelos VALUES (4, 4, 'Camper GL/GLS 4x4 4.0 Diesel');
INSERT INTO public.modelos VALUES (5, 5, 'Grand Vitara 2.0 16V 4x2/4x4 5p Mec');


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 213
-- Name: carros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carros_id_seq', 3, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 221
-- Name: cliente_enderecos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_enderecos_id_seq', 60, true);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 60, true);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 217
-- Name: enderecos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enderecos_id_seq', 60, true);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 219
-- Name: locacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locacao_id_seq', 5, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 209
-- Name: marcas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marcas_id_seq', 6, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 211
-- Name: modelos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modelos_id_seq', 7, true);


--
-- TOC entry 3283 (class 2606 OID 17097)
-- Name: carros carros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carros
    ADD CONSTRAINT carros_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 17099)
-- Name: carros carros_placa_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carros
    ADD CONSTRAINT carros_placa_key UNIQUE (placa);


--
-- TOC entry 3297 (class 2606 OID 17148)
-- Name: cliente_enderecos cliente_enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_enderecos
    ADD CONSTRAINT cliente_enderecos_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 17113)
-- Name: clientes clientes_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_key UNIQUE (cpf);


--
-- TOC entry 3289 (class 2606 OID 17111)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 17115)
-- Name: clientes clientes_telefone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_telefone_key UNIQUE (telefone);


--
-- TOC entry 3293 (class 2606 OID 17124)
-- Name: enderecos enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enderecos
    ADD CONSTRAINT enderecos_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 17131)
-- Name: locacao locacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 17076)
-- Name: marcas marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marcas
    ADD CONSTRAINT marcas_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 17083)
-- Name: modelos modelos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelos
    ADD CONSTRAINT modelos_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 17137)
-- Name: locacao fk_carros_to_locacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT fk_carros_to_locacao FOREIGN KEY (id_carros) REFERENCES public.carros(id);


--
-- TOC entry 3302 (class 2606 OID 17149)
-- Name: cliente_enderecos fk_clientes_to_cliente_enderecos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_enderecos
    ADD CONSTRAINT fk_clientes_to_cliente_enderecos FOREIGN KEY (id_clientes) REFERENCES public.clientes(id);


--
-- TOC entry 3300 (class 2606 OID 17132)
-- Name: locacao fk_clientes_to_locacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT fk_clientes_to_locacao FOREIGN KEY (id_clientes) REFERENCES public.clientes(id);


--
-- TOC entry 3303 (class 2606 OID 17154)
-- Name: cliente_enderecos fk_enderecos_to_cliente_enderecos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_enderecos
    ADD CONSTRAINT fk_enderecos_to_cliente_enderecos FOREIGN KEY (id_enderecos) REFERENCES public.enderecos(id);


--
-- TOC entry 3298 (class 2606 OID 17084)
-- Name: modelos fk_marcas_to_modelos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelos
    ADD CONSTRAINT fk_marcas_to_modelos FOREIGN KEY (id_marcas) REFERENCES public.marcas(id);


--
-- TOC entry 3299 (class 2606 OID 17100)
-- Name: carros fk_modelos_to_carros; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carros
    ADD CONSTRAINT fk_modelos_to_carros FOREIGN KEY (id_modelos) REFERENCES public.modelos(id);


-- Completed on 2022-07-01 13:57:37 -03

--
-- PostgreSQL database dump complete
--

