LOAD DATA 
INTO TABLE "PAYER_WALLETS_BAK"
APPEND
FIELDS TERMINATED BY ','
 OPTIONALLY ENCLOSED BY ' " '
(
PAYER_ID_N,
WALLET_ID_N,
BALANCE_N,
EXPIRY_DATE_D "to_date(:EXPIRY_DATE_D,'YYYYMMDD')",
MINIMUM_BALANCE_N
)
