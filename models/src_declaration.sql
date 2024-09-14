WITH Declaration AS (
    SELECT
        *
    FROM devdb_tcais.TCRNIMPEXPDCLR
        
)
SELECT
    (FROM_UNIXTIME(team_mgr_inspct_date/1000)) as DATE,
    IMP_EXP_DCLR_NO,
    CSTM_CD,
    DCLR_TYPE_CD,
    TOT_ITEM_CNT,
    TAX_PAYER_COMP_NM,
    INSPCTOR_ID1,
    TOT_STATVAL,
    LOAD_PLACE_NM,
    DCLR_YMD,
    TRNSP_METH_CD,
    TOT_CSTM_DUTY_AMT
FROM
    Declaration