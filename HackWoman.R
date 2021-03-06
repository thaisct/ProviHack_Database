#SCRIPT: CREATE RELATIONAL DATABASE TO BE USED IN OUR PLATAFORM

#Loading necessary libraries
#Observation: if not installed, please run the following by "un-commenting" it

#install.packages(c("DBI","RSQLite"))

packages <- c("DBI","RSQLite")

lapply(packages, require, character.only = TRUE)

#Creating a database shell

con <- dbConnect(RSQLite::SQLite(), dbname = "db_ff.db")

#Adding columns and rows to our operational table ("users") in a star schema database

rs <- dbSendQuery(conn = con, "CREATE TABLE IF NOT EXISTS users
                            (
                            id              INTEGER         PRIMARY KEY,
                            email           CHAR(40)        NOT NULL UNIQUE,
                            password        CHAR(40)        NOT NULL,
                            photo           BLOB            NULL,
                            linkedin        BLOB            NULL,
                            portifolio      BLOB            NULL,
                            name            CHAR(60)        NOT NULL,
                            birthday        DATE            NOT NULL,
                            description     CHAR(250)       NULL,
                            career_id       INTEGER         NOT NULL,
                            learn_id        INTEGER         NOT NULL,
                            instruct_id     INTEGER         NOT NULL,
                            profile_id      INTEGER         NOT NULL UNIQUE
                            )")

#Freeing all resources (local and remote) associated with a result set
dbClearResult(rs)

#Creating another table ("careers") connected to "users" table

rs2 <- dbSendQuery(conn = con, "CREATE TABLE IF NOT EXISTS careers
                            (
                            career_id       INTEGER     PRIMARY KEY,
                            categories      CHAR(40)    NOT NULL,
                            FOREIGN KEY (categories) 
                            REFERENCES users (id)
                                ON UPDATE CASCADE
                                ON DELETE SET NULL
                            )")

#Freeing all resources (local and remote) associated with a result set
dbClearResult(rs2)

#Creating another table ("learns") connected to "users" table

rs3 <- dbSendQuery(conn = con, "CREATE TABLE IF NOT EXISTS learns
                            (
                            learn_id        INTEGER     PRIMARY KEY,
                            categories      CHAR(40)    NOT NULL,
                            FOREIGN KEY (categories) 
                            REFERENCES users (id)
                                ON UPDATE CASCADE
                                ON DELETE SET NULL
                            )")

#Freeing all resources (local and remote) associated with a result set
dbClearResult(rs3)

#Creating another table ("instructs") connected to "users" table

rs4 <- dbSendQuery(conn = con, "CREATE TABLE IF NOT EXISTS instructs
                            (
                            instruct_id     INTEGER     PRIMARY KEY,
                            categories      CHAR(40)    NOT NULL,
                            FOREIGN KEY (categories) 
                            REFERENCES users (id)
                                ON UPDATE CASCADE
                                ON DELETE SET NULL
                            )")

#Freeing all resources (local and remote) associated with a result set
dbClearResult(rs4)

#Creating another table ("profiles") connected to "users" table

rs5 <- dbSendQuery(conn = con, "CREATE TABLE IF NOT EXISTS profiles
                            (
                            profile_id      INTEGER     PRIMARY KEY,
                            other           CHAR(40)    NOT NULL,
                            FOREIGN KEY (other) 
                            REFERENCES users (id)
                                ON UPDATE CASCADE
                                ON DELETE SET NULL
                            )")

#Freeing all resources (local and remote) associated with a result set
dbClearResult(rs5)

#Filling Careers Table

dbSendQuery(conn = con,"INSERT INTO careers (career_id, categories)
                        VALUES(1, 'Produto')")

dbSendQuery(conn = con,"INSERT INTO careers (career_id, categories)
                        VALUES(2, 'Desenvolvimento')")

dbSendQuery(conn = con,"INSERT INTO careers (career_id, categories)
                        VALUES(3, 'Design')")

dbSendQuery(conn = con,"INSERT INTO careers (career_id, categories)
                        VALUES(4, 'Liderança')")

dbSendQuery(conn = con,"INSERT INTO careers (career_id, categories)
                        VALUES(5, 'Data')")

#Filling Learns Table

dbSendQuery(conn = con,"INSERT INTO learns (learn_id, categories)
                        VALUES(1, 'Revisão de Currículo')")

dbSendQuery(conn = con,"INSERT INTO learns (learn_id, categories)
                        VALUES(2, 'Revisão de Portifólio')")

dbSendQuery(conn = con,"INSERT INTO learns (learn_id, categories)
                        VALUES(3, 'Simulação de Entrevista')")

dbSendQuery(conn = con,"INSERT INTO learns (learn_id, categories)
                        VALUES(4, 'Conversa sobre Carreira')")

dbSendQuery(conn = con,"INSERT INTO learns (learn_id, categories)
                        VALUES(5, 'Ajuda Técnica')")

#Filling Instructs Table

dbSendQuery(conn = con,"INSERT INTO instructs (instruct_id, categories)
                        VALUES(1, 'Revisão de Currículo')")

dbSendQuery(conn = con,"INSERT INTO instructs (instruct_id, categories)
                        VALUES(2, 'Revisão de Portifólio')")

dbSendQuery(conn = con,"INSERT INTO instructs (instruct_id, categories)
                        VALUES(3, 'Simulação de Entrevista')")

dbSendQuery(conn = con,"INSERT INTO instructs (instruct_id, categories)
                        VALUES(4, 'Conversa sobre Carreira')")

dbSendQuery(conn = con,"INSERT INTO instructs (instruct_id, categories)
                        VALUES(5, 'Ajuda Técnica')")


#Disconnecting from db
dbDisconnect(con)

