export PROCESS_SCHEMA_NAME=$MAIN_SCHEMA
export PROCESS_SCHEMA_PASS=$MAIN_SCHEMA_PASS
export PROCESS_SCHEMA_TABLESPACE=$MAIN_SCHEMA_TABLESPACE

export PROJECT_REFERENCE_DATA_DIR=$CRP_HOME/database/crp/functionalTest
export PROCESS_SCHEMA_DIR=$CRP_HOME/database/crp/functionalTest

$CRPSCRIPTS_DIR/commonscripts/prepareDBObjectscript.sh CreateTables CreateTriggerViews InsertReferenceData
$CRPSCRIPTS_DIR/commonscripts/createDBobjects.sh


export PROJECT_REFERENCE_DATA_DIR=$CRP_HOME/database/crp/unitTest
export PROCESS_SCHEMA_DIR=$CRP_HOME/database/crp/unitTest

$CRPSCRIPTS_DIR/commonscripts/prepareDBObjectscript.sh CreateTables CreateTriggerViews InsertReferenceData
$CRPSCRIPTS_DIR/commonscripts/createDBobjects.sh
