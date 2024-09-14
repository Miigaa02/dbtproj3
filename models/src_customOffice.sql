WITH CustomsOffice AS (
    SELECT
        *
    FROM devdb_tcais.TCMMCSTM3
)
SELECT
    Cst_Cd,
    Cstm_Nm,
    Exp_Inspct_Team_Mgr_Cnt,
    Imp_Inspct_Team_Mgr_Cnt,
    Imp_Inspctor_Cnt
FROM
    CustomsOffice
