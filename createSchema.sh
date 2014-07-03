#*********************************************************************
#   File            :     createSchema.sh
#   Abstract        :     To Create set of related database
#   Date            :     20-July-2013
#   Author(s)       :     Subhajit Mukherjee
#   References      :
#   Module          :      
# ======================================================================

Mesg()
{
 echo "Enter schema creation purpose"
 echo "<createSchema.sh> <options> <schema_name> <connectionstring>"
 echo " Options are :       "
 echo "   Integration    "
 echo "   CompileObjects   "
 echo "   Production "
 exit
}

cleanUp()
{
#Log files are operated in append mode as a log file can be used by multiple file
#inside the same module.
rm $CRPSCRIPTS_DIR/tmp/tmpGrantScript.sh
rm $CRPSCRIPTS_DIR/tmp/tmpCreateSynonym.sh
rm $CRPSCRIPTS_DIR/tmp/tmpCreateViewScript.sh
rm $CRPSCRIPTS_DIR/tmp/tmpcreateTriggerInApp.sh

rm $CRPSCRIPTS_DIR/logs/appschemaSynonyms.log
rm $CRPSCRIPTS_DIR/logs/appschemaAuto_apptriggers.log
rm $CRPSCRIPTS_DIR/logs/appschemaViews.log
rm $CRPSCRIPTS_DIR/logs/appschemaUserGrants.log

rm $CRPSCRIPTS_DIR/logs/auditschemaGrants.log
rm $CRPSCRIPTS_DIR/logs/auditschemaSynonyms.log

rm $CRPSCRIPTS_DIR/logs/commonscriptsCompileobjects.log
rm $CRPSCRIPTS_DIR/logs/commonscriptsSchemaobjects.log
rm $CRPSCRIPTS_DIR/logs/commonscriptsTableSpaces.log
rm $CRPSCRIPTS_DIR/logs/commonscriptsUserCreation.log

rm $CRPSCRIPTS_DIR/logs/mainschemaGrants.log

rm $CRPSCRIPTS_DIR/logs/mainschemaadditionsGrants.log
rm $CRPSCRIPTS_DIR/logs/mainschemaadditionsSynonyms.log
}

SetSchemaParameters()
{ 
 #export CRP_HOME=$HOME/MTL-MALAWI	#Commented by Subhajit Mukherjee.
 export CRP_HOME=$HOME/CBS41		#Added by Subhajit Mukherjee.
 #export CRPSCRIPTS_DIR=`pwd`
 #export CRPSCRIPTS_DIR=$HOME/Deployment/crpscripts	#Commented by Subhajit Mukherjee.
 export CRPSCRIPTS_DIR=$HOME/SCHEMA_CREATION/crpscripts	#Added by Subhajit Mukherjee.
 export RELATIONSHIP=$1

 $CRPSCRIPTS_DIR/commonscripts/createTableSpaces.sh
}

CreateTypeSchemaObjects()
{
 $CRPSCRIPTS_DIR/typeschema/createTypeSchemaObjects.sh
}

CreateEprintSchemaObjects()
{
 $CRPSCRIPTS_DIR/eprintschema/createEprintSchemaObjects.sh
}

CreateMainSchemaObjects()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaObjects.sh
}

CreateLoyaltySchemaObjects()
{
 $CRPSCRIPTS_DIR/loyaltyschema/createLoyaltySchemaObjects.sh
}

CreateFFASchemaObjects()
{
 $CRPSCRIPTS_DIR/ffaschema/createFFASchemaObjects.sh
}

CreateViewSchemaObjects()
{
 $CRPSCRIPTS_DIR/viewschema/createViewSchemaObjects.sh
}

CompileTypeSchemaObjects()
{
 $CRPSCRIPTS_DIR/typeschema/compileTypeSchemaObjects.sh
}

CompileEprintSchemaObjects()
{
 $CRPSCRIPTS_DIR/eprintschema/compileEprintSchemaObjects.sh
}

CompileMainSchemaObjects()
{
 $CRPSCRIPTS_DIR/mainschema/compileMainSchemaObjects.sh
}

CompileFFASchemaObjects()
{
 $CRPSCRIPTS_DIR/ffaschema/compileFFASchemaObjects.sh
}

CompileLoyaltySchemaObjects()
{
 $CRPSCRIPTS_DIR/loyaltyschema/compileLoyaltySchemaObjects.sh
}

CompileViewSchemaObjects()
{
 $CRPSCRIPTS_DIR/viewschema/compileViewSchemaObjects.sh
}

CreateTypeSchemaGrantsToMainSchema()
{
 $CRPSCRIPTS_DIR/typeschema/createTypeSchemaGrantsToMainSchema.sh
}

CreateTypeSchemaSynonymsInMainSchema()
{
 $CRPSCRIPTS_DIR/typeschema/createTypeSchemaSynonymsInMainSchema.sh
}

CreateEprintSchemaGrantsToMainSchema()
{
 $CRPSCRIPTS_DIR/eprintschema/createEprintSchemaGrantsToMainSchema.sh
}

CreateEprintSchemaSynonymsInMainSchema()
{
 $CRPSCRIPTS_DIR/eprintschema/createEprintSchemaSynonymsInMainSchema.sh
}

CreateMainSchemaGrantsToLoayltySchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaGrantsToLoyaltySchema.sh
}

CreateMainSchemaSynonymsInLoyaltySchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaSynonymsInLoyaltySchema.sh
}

CreateTypeSchemaGrantsToLoayltySchema()
{
 $CRPSCRIPTS_DIR/typeschema/createTypeSchemaGrantsToLoyaltySchema.sh
}

CreateTypeSchemaSynonymsInLoyaltySchema()
{
 $CRPSCRIPTS_DIR/typeschema/createTypeSchemaSynonymsInLoyaltySchema.sh
}

CreateMainSchemaGrantsToFFASchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaGrantsToFFASchema.sh
}

CreateMainSchemaGrantsToViewSchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaGrantsToViewSchema.sh
}

CreateMainSchemaSynonymsInFFASchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaSynonymsInFFASchema.sh
}

CreateMainSchemaSynonymsInViewSchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaSynonymsInViewSchema.sh
}

CreateLoyaltySchemaGrantsToMainSchema()
{
 $CRPSCRIPTS_DIR/loyaltyschema/createLoyaltySchemaGrantsToMainSchema.sh
}

CreateLoyaltySchemaSynonymsInMainSchema()
{
 $CRPSCRIPTS_DIR/loyaltyschema/createLoyaltySchemaSynonymsInMainSchema.sh
}

CreateFFASchemaGrantsToMainSchema()
{
 $CRPSCRIPTS_DIR/ffaschema/createFFASchemaGrantsToMainSchema.sh
}

CreateFFASchemaSynonymsInMainSchema()
{
 $CRPSCRIPTS_DIR/ffaschema/createFFASchemaSynonymsInMainSchema.sh
}

CreateMainSchemaGrantsToTypeSchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaGrantsToTypeSchema.sh
}
CreateMainSchemaSynonymsInTypeSchema()
{
 $CRPSCRIPTS_DIR/mainschema/createMainSchemaSynonymsInTypeSchema.sh
}


CreateSchema()
{
  local schemaRelationship=$1

  case $schemaRelationship in
          Integration) 
		 echo `date`
		 echo "CreateTypeSchemaObjects"
                 CreateTypeSchemaObjects
		 echo "CreateEprintSchemaObjects"
		 CreateEprintSchemaObjects
		 echo "CreateMainSchemaObjects"
		 CreateMainSchemaObjects
		 echo "CreateLoyaltySchemaObjects"
		 CreateLoyaltySchemaObjects
		 echo "CreateFFASchemaObjects"
		 CreateFFASchemaObjects
		 echo "CreateViewSchemaObjects"		
		 CreateViewSchemaObjects
		 echo "CreateEprintSchemaGrantsToMainSchema"
		 CreateEprintSchemaGrantsToMainSchema
		 echo "CreateEprintSchemaSynonymsInMainSchema"
		 CreateEprintSchemaSynonymsInMainSchema
		 echo "CreateTypeSchemaGrantsToMainSchema"
		 CreateTypeSchemaGrantsToMainSchema
		 echo "CreateTypeSchemaSynonymsInMainSchema"
		 CreateTypeSchemaSynonymsInMainSchema
		 echo "CreateTypeSchemaGrantsToLoayltySchema"
		 CreateTypeSchemaGrantsToLoayltySchema
		 echo "CreateTypeSchemaSynonymsInLoyaltySchema"
		 CreateTypeSchemaSynonymsInLoyaltySchema
		 echo "CreateMainSchemaGrantsToTypeSchema"
		 CreateMainSchemaGrantsToTypeSchema
		 echo "CreateMainSchemaSynonymsInTypeSchema"
		 CreateMainSchemaSynonymsInTypeSchema
		 echo "CreateMainSchemaGrantsToLoayltySchema"
		 CreateMainSchemaGrantsToLoayltySchema
		 echo "CreateMainSchemaSynonymsInLoyaltySchema"
		 CreateMainSchemaSynonymsInLoyaltySchema
		 echo "CreateMainSchemaGrantsToFFASchema"
		 CreateMainSchemaGrantsToFFASchema
		 echo "CreateMainSchemaSynonymsInFFASchema"
		 CreateMainSchemaSynonymsInFFASchema
		 echo "CreateMainSchemaGrantsToViewSchema"
		 CreateMainSchemaGrantsToViewSchema
		 echo "CreateMainSchemaSynonymsInViewSchema"
		 CreateMainSchemaSynonymsInViewSchema
		 echo "CreateLoyaltySchemaGrantsToMainSchema"
		 CreateLoyaltySchemaGrantsToMainSchema
		 echo "CreateLoyaltySchemaSynonymsInMainSchema"
		 CreateLoyaltySchemaSynonymsInMainSchema
		 echo "CreateFFASchemaGrantsToMainSchema"
		 CreateFFASchemaGrantsToMainSchema
		 echo "CreateFFASchemaSynonymsInMainSchema"
		 CreateFFASchemaSynonymsInMainSchema
		 echo "CompileTypeSchemaObjects"
		 CompileTypeSchemaObjects
		 echo "CompileEprintSchemaObjects"
		 CompileEprintSchemaObjects
		 echo "CompileMainSchemaObjects"
		 CompileMainSchemaObjects
		 echo "CompileLoyaltySchemaObjects"
		 CompileLoyaltySchemaObjects
		 echo "CompileFFASchemaObjects"
		 CompileFFASchemaObjects
		 echo "CompileViewSchemaObjects"
		 CompileViewSchemaObjects
		 echo `date`;;
	  CompileObjects)
		 CompileMainSchemaObjects;;
          *) echo "Invalid Schema creation purpose entered!" ;;
  esac

}

startCreation()
{
  SetSchemaParameters $1
  #cleanUp
  CreateSchema $RELATIONSHIP
}

export RELATIONSHIP=$1
source $HOME/Deployment/crpscripts/conf/schemaConf.txt $2 $3

if [ $# != 3 ]
  then
  Mesg  
  startCreation $1
else
  startCreation $1
fi
