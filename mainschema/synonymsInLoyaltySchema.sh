sqlplus $1 <<EOF >> $CRPSCRIPTS_DIR/logs/mainschemaUserSynonyms.log
DECLARE
    l_owner_v     VARCHAR2(32):= '<<OWNER>>';
    l_to_user_v   VARCHAR2(32):= '<<TARGET>>';
BEGIN
    FOR REC IN (SELECT 'CREATE OR REPLACE SYNONYM '|| l_to_user_v || '.' || OBJECT_NAME || ' FOR '||l_owner_v || '.' || OBJECT_NAME L_COMMAND 
                FROM ALL_OBJECTS 
                WHERE OWNER=UPPER(l_owner_v) 
                AND OBJECT_NAME IN ('CB_RECEIPTS','CB_SERV_BILL_PROCESS','CB_INVOICE','CB_ACCOUNT_MASTER','CB_ACCOUNT_SERVICE_LIST','CB_ACCS_RECEIVE_PAY_ADJUST','CB_USERS','CB_EMAIL#LETTER_DATA','CB_EMAIL_TEMPLATES','CB_SEND_MESGS','SMS_MESSAGE_QUEUE','FXL_RATED_CDRS','ISP_RATED_CDRS','FXL_PREPAID_UPLD_CDRS','CB_REASON_MASTER','CB_POS_TRANSACTIONS','CB_RETAIL_OUTLETS','CB_SPECIAL_RIGHTS','CB_USER_SPECIAL_RIGHTS','CB_COUNTRIES','CB_STATES','GET_NEXT_API_REFERENCE_NO','GET_GSM_SERVICE_DETAILS','BULK_OFFER_INSERT','POST_ADJUSTMENT','T_FXL_SERVICE_DETAILS','T_ISP_SERVICE_DETAILS','T_GSM_SERVICE_DETAILS','GET_FXL_SERVICE_DETAILS','GET_ISP_SERVICE_DETAILS','PARTITION_MASTER','PARTITION_DETAILS','GNL_ERROR_LOG_PRC','GNL_CREATE_DEL_PARTITION_PRC'))
    LOOP 
        BEGIN
		EXECUTE IMMEDIATE REC.L_COMMAND;
        EXCEPTION
		WHEN OTHERS THEN
			NULL;
        END;
    END LOOP;
END;
/
EOF
