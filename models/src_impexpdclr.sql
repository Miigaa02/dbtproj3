WITH IMPEXPDCLR AS (
    SELECT
        *
    FROM devdb_tcais.TCRNIMPEXPDCLR
        
)
SELECT
    (FROM_UNIXTIME(team_mgr_inspct_date/1000)) as DATE,
    IMP_EXP_DCLR_NO,
    CSTM_CD,
    TOT_CSTM_DUTY_AMT
FROM
    IMPEXPDCLR
