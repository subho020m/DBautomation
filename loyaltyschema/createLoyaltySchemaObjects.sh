export PROCESS_SCHEMA_NAME=$LOYALTY_SCHEMA
export PROCESS_SCHEMA_PASS=$LOYALTY_SCHEMA_PASS
export PROCESS_SCHEMA_TABLESPACE=$LOYALTY_SCHEMA_TABLESPACE
$CRPSCRIPTS_DIR/commonscripts/createUser.sh

export PROJECT_MASTER_DATA_DIR=$CRP_HOME/LoyaltySchema/Source
export PROJECT_REFERENCE_DATA_DIR=$CRP_HOME/LoyaltySchema/Source
export PROCESS_SCHEMA_DIR=$CRP_HOME/LoyaltySchema/Source
$CRPSCRIPTS_DIR/commonscripts/prepareDBObjectscript.sh CreateTypes CreateTables CreateTriggerViews InsertMasterData
$CRPSCRIPTS_DIR/commonscripts/createDBobjects.sh