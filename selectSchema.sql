----Run the below script as sys user 
----********************************************************************
-- FOLLOWING SCRIPT FOR CREATING API SCHEMAS.
-- FOR EVERY NEW INTERFACE A NEW SCHEMA HAS TO BE CREATED
-- FOR EVERY NEW INTERCONNECTION, NEW SCHEMA HAS TO BE CREATED.
-- GIVE THE SHARED SERVER TNS DETAILS.
DROP USER JANUS_MONITOR  CASCADE ;
CREATE USER JANUS_MONITOR IDENTIFIED BY JANUS_MONITOR DEFAULT TABLESPACE JANUS_PROD;
GRANT RESOURCE TO JANUS_MONITOR;
GRANT CONNECT TO JANUS_MONITOR;
GRANT SELECT ON JANUS.INT_COMMAND_MASTER TO JANUS_MONITOR;
GRANT SELECT ON JANUS.CDR_BLOCK TO JANUS_MONITOR;
GRANT SELECT ON JANUS.CDR_KEY_INFO TO JANUS_MONITOR;
GRANT SELECT ON JANUS.CDR_PARTITION_DETAILS TO JANUS_MONITOR;
GRANT SELECT ON JANUS.APP_LOG_DETAILS TO JANUS_MONITOR;
GRANT SELECT ON JANUS.PAYER_WALLETS TO JANUS_MONITOR;
GRANT SELECT ON JANUS.PAYERS TO JANUS_MONITOR;


CREATE OR REPLACE SYNONYM JANUS_MONITOR.INT_COMMAND_MASTER FOR JANUS.INT_COMMAND_MASTER;
CREATE OR REPLACE SYNONYM JANUS_MONITOR.CDR_BLOCK FOR JANUS.CDR_BLOCK;
CREATE OR REPLACE SYNONYM JANUS_MONITOR.CDR_KEY_INFO FOR JANUS.CDR_KEY_INFO;
CREATE OR REPLACE SYNONYM JANUS_MONITOR.CDR_PARTITION_DETAILS FOR JANUS.CDR_PARTITION_DETAILS;
CREATE OR REPLACE SYNONYM JANUS_MONITOR.APP_LOG_DETAILS FOR JANUS.APP_LOG_DETAILS;
CREATE OR REPLACE SYNONYM JANUS_MONITOR.PAYER_WALLETS FOR JANUS.PAYER_WALLETS;
CREATE OR REPLACE SYNONYM JANUS_MONITOR.PAYERS FOR JANUS.PAYERS;