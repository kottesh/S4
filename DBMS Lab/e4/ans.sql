-- Index, Sequence and Synonyms

CREATE TABLE dep (
  depno NUMBER PRIMARY KEY,
  depname VARCHAR2(50),
  loc VARCHAR2(50)
);

-- 1. Creating sequence with a different name, e.g., dep_seq
CREATE SEQUENCE dep_seq
  START WITH 5
  INCREMENT BY 5
  MAXVALUE 100
  NOCYCLE;

-- 2. Confirming the sequences
SELECT * FROM user_sequences WHERE sequence_name = 'DEP_SEQ';

-- 3. Inserting into tables using the new sequence name, dep_seq
INSERT INTO dep (depno, depname, loc) VALUES (dep_seq.nextval, 'sports', 'dc');
INSERT INTO dep (depno, depname, loc) VALUES (dep_seq.nextval, 'sales', 'newjersy');
INSERT INTO dep (depno, depname, loc) VALUES (dep_seq.nextval, 'accounts', 'newyork');

-- 4.Displaying current value of sequence (only works if nextval has been called in the session)
SELECT dep_seq.currval FROM dual;

-- 5.Altering the sequence 
ALTER SEQUENCE dep_seq INCREMENT BY 2;

-- 6.Deleting the sequence (use the correct sequence name)
DROP SEQUENCE dep_seq;

-- 7.Creating indexes (ensure the table name is correct)
CREATE INDEX dep_in ON dep(LOC);

-- 8.Confirming the index 
SELECT INDEX_NAME FROM user_indexes;

-- 9.Creating Synonym (ensure the table name is correct)
CREATE SYNONYM dep_syn FOR dep;

-- 10.Selecting using synonym 
SELECT * FROM dep_syn;

-- 11. Deleting synonym 
DROP SYNONYM dep_syn;


