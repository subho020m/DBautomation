export PROCESS_SCHEMA_NAME=$TYPE_SCHEMA
export PROCESS_SCHEMA_PASS=$TYPE_SCHEMA_PASS
export PROCESS_SCHEMA_TABLESPACE=$TYPE_SCHEMA_TABLESPACE
$CRPSCRIPTS_DIR/commonscripts/createUser.sh

export PROCESS_SCHEMA_DIR=$CRP_HOME/TypeSchema/Source
$CRPSCRIPTS_DIR/commonscripts/prepareDBObjectscript.sh CreateTypes CreateTables
$CRPSCRIPTS_DIR/commonscripts/createDBobjects.sh