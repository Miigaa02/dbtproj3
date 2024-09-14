{{
    config(
        materialized = 'table'
    )
}}

WITH customs_office AS (
    SELECT 
        Cst_Cd,
        Cstm_Nm,
        Exp_Inspct_Team_Mgr_Cnt,
        Imp_Inspct_Team_Mgr_Cnt,
        Imp_Inspctor_Cnt
    FROM {{ ref("src_customOffice") }}
),

customs_declaration AS (
    SELECT 
        (FROM_UNIXTIME(team_mgr_inspct_date/1000)) AS DATE,
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
    FROM {{ ref("src_declaration") }}
)

SELECT
    co.Cst_Cd,
    co.Cstm_Nm,
    co.Exp_Inspct_Team_Mgr_Cnt,
    co.Imp_Inspct_Team_Mgr_Cnt,
    co.Imp_Inspctor_Cnt,
    cd.DATE,
    cd.IMP_EXP_DCLR_NO,
    cd.DCLR_TYPE_CD,
    cd.TOT_ITEM_CNT,
    cd.TAX_PAYER_COMP_NM,
    cd.INSPCTOR_ID1,
    cd.TOT_STATVAL,
    cd.LOAD_PLACE_NM,
    cd.DCLR_YMD,
    cd.TRNSP_METH_CD,
    cd.TOT_CSTM_DUTY_AMT
FROM customs_office co
LEFT JOIN customs_declaration cd
    ON co.Cst_Cd = cd.CSTM_CD;
