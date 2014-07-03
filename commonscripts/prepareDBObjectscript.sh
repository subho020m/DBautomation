find $PROCESS_SCHEMA_DIR/Functions -type f > $CRPSCRIPTS_DIR/list.sql
find $PROCESS_SCHEMA_DIR/Procedures -type f >> $CRPSCRIPTS_DIR/list.sql
find $PROCESS_SCHEMA_DIR/Packages -type f >> $CRPSCRIPTS_DIR/list.sql
find $PROCESS_SCHEMA_DIR/Triggers -type f >> $CRPSCRIPTS_DIR/list.sql
find $PROCESS_SCHEMA_DIR/Views -type f >> $CRPSCRIPTS_DIR/list.sql

if [ "$1" = "CreateTypes" ]
then
    if [ -e $PROCESS_SCHEMA_DIR/TypeScript/types.sql ]
    then
        cp $PROCESS_SCHEMA_DIR/TypeScript/types.sql $PROCESS_SCHEMA_DIR/TypeScript/tempTypes.sql
    fi
fi

if [ "$2" = "CreateTables" ]
then

    if [ -e $PROCESS_SCHEMA_DIR/TableScript/additionaltables.sql ]
    then
	cat $PROCESS_SCHEMA_DIR/TableScript/tables.sql $PROCESS_SCHEMA_DIR/TableScript/additionaltables.sql > $PROCESS_SCHEMA_DIR/TableScript/tempTables.sql
    else
	cp $PROCESS_SCHEMA_DIR/TableScript/tables.sql $PROCESS_SCHEMA_DIR/TableScript/tempTables.sql
    fi

    $CRPSCRIPTS_DIR/commonscripts/replaceTablespace.sh $PROCESS_SCHEMA_DIR/TableScript/tempTables.sql

    if [ -e $PROCESS_SCHEMA_DIR/TableScript/additionalforeignkeys.sql ]
    then
	cat $PROCESS_SCHEMA_DIR/TableScript/foreignkeys.sql $PROCESS_SCHEMA_DIR/TableScript/additionalforeignkeys.sql > $CRPSCRIPTS_DIR/tmp/tempForeignkeys.sql

    elif [ -e $PROCESS_SCHEMA_DIR/TableScript/foreignkeys.sql ]
    then
	cp $PROCESS_SCHEMA_DIR/TableScript/foreignkeys.sql $CRPSCRIPTS_DIR/tmp/tempForeignkeys.sql
    else
        touch $CRPSCRIPTS_DIR/tmp/tempForeignkeys.sql
    fi

fi

if [ "$4" = "InsertMasterData" ]
then

    find $PROJECT_MASTER_DATA_DIR/MasterData -maxdepth 1 -type f | sort > $CRPSCRIPTS_DIR/masterdata.sql

    perl -pi -e "s/^/\@/g" $CRPSCRIPTS_DIR/masterdata.sql
    
    if [ -d $PROJECT_MASTER_DATA_DIR/AdditionalMasterData ]
    then
        find $PROJECT_MASTER_DATA_DIR/AdditionalMasterData -maxdepth 1 -type f | sort > $CRPSCRIPTS_DIR/additionalmasterdata.sql
        perl -pi -e "s/^/\@/g" $CRPSCRIPTS_DIR/additionalmasterdata.sql
    else
        touch $CRPSCRIPTS_DIR/additionalmasterdata.sql
    fi
fi

if [ "$5" = "InsertReferenceData" ]
then
find $PROJECT_REFERENCE_DATA_DIR/ReferenceData -maxdepth 1 -type f > $CRPSCRIPTS_DIR/referencedata.sql
perl -pi -e "s/^/\@/g" $CRPSCRIPTS_DIR/referencedata.sql
fi

perl -pi -e "s/^/\@/g" $CRPSCRIPTS_DIR/list.sql
