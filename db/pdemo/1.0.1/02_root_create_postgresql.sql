-- Table: business_gray_relation

DROP TABLE business_gray_relation;

CREATE TABLE business_gray_relation
(
  id bigserial NOT NULL,
  gray_name character varying(100) NOT NULL DEFAULT ''::character varying, -- 灰度名
  gray_type character varying(100) NOT NULL DEFAULT ''::character varying, -- 灰度类型，project, pipeline, or something
  gray_key character varying(500) NOT NULL DEFAULT ''::character varying, -- 灰度键，灰度类型所对应的ID
  gray_value character varying(1000) NOT NULL DEFAULT ''::character varying, -- 灰度值，灰度键所对应的值
  gray_desc character varying(1000), -- 描述
  creator character varying(100),
  create_time timestamp without time zone,
  modifier character varying(100),
  modify_time timestamp without time zone,
  CONSTRAINT business_gray_relation_pkey PRIMARY KEY (id),
  CONSTRAINT business_gray_relation_uniq UNIQUE (gray_name, gray_type, gray_key)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE business_gray_relation
  OWNER TO dev_root;
COMMENT ON TABLE business_gray_relation
  IS '业务灰度关系表，可以按业务数据ID进行灰度';
COMMENT ON COLUMN business_gray_relation.gray_name IS '灰度名';
COMMENT ON COLUMN business_gray_relation.gray_type IS '灰度类型，project, pipeline, or something';
COMMENT ON COLUMN business_gray_relation.gray_key IS '灰度键，灰度类型所对应的ID';
COMMENT ON COLUMN business_gray_relation.gray_value IS '灰度值，灰度键所对应的值';
COMMENT ON COLUMN business_gray_relation.gray_desc IS '描述';


-- Trigger: trigger_create_time on business_gray_relation

-- DROP TRIGGER trigger_create_time ON business_gray_relation;

CREATE TRIGGER trigger_create_time
  BEFORE INSERT
  ON business_gray_relation
  FOR EACH ROW
  EXECUTE PROCEDURE update_create_time();

-- Trigger: trigger_modify_time on business_gray_relation

-- DROP TRIGGER trigger_modify_time ON business_gray_relation;

CREATE TRIGGER trigger_modify_time
  BEFORE UPDATE
  ON business_gray_relation
  FOR EACH ROW
  EXECUTE PROCEDURE update_modify_time();

