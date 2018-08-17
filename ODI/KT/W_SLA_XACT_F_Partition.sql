--
-- Partition Table Script for W_Sla_Xact_F
-- Created by Accenture offshore
-- Execute directly on warehouse schema TCGIT3


-- ================================================
-- Step 1:  Backup Table
-- ================================================
RENAME W_SLA_XACT_F TO W_SLA_XACT_F_BKP_ORG;


-- ================================================
-- Step 2:  Create Partitioned Table
-- ================================================

CREATE TABLE tcgit3_Dw.W_Sla_Xact_F

(

   Gl_Account_Wid           NUMBER (1
, Ledger_Wid               NUMBER (10)
, Company_Org_Wid          NUMBER (10)
, Balancing_Segment_Wid    NUMBER (10)
, Cost_Center_Wid          NUMBER (10)
, Customer_Wid             NUMBER (10)
, Customer_Acct_Wid        NUMBER (10)
, Supplier_Wid             NUMBER (10)
, Supplier_Acct_Wid        NUMBER (10)
, Receivables_Org_Wid      NUMBER (10)
, Payables_Org_Wid         NUMBER (10)
, Gl_Segment1_Wid          NUMBER (10)
, Gl_Segment2_Wid          NUMBER (10)
, Support_Ref1_Wid         NUMBER (10)
, Support_Ref2_Wid         NUMBER (10)
, Support_Ref3_Wid         NUMBER (10)
, Support_Ref4_Wid         NUMBER (10)
, Support_Ref5_Wid         NUMBER (10)
, Support_Ref6_Wid         NUMBER (10)
, Support_Ref7_Wid         NUMBER (10)
, Support_Ref8_Wid         NUMBER (10)
, Support_Ref9_Wid         NUMBER (10)
, Support_Ref10_Wid        NUMBER (10)
, Mcal_Cal_Wid             NUMBER (10)
, Acct_Period_End_Dt_Wid   NUMBER (15)
, Journal_Line_Num         NUMBER (15)
, Accounting_Class_Code    VARCHAR2 (30 CHAR)
, Journal_Category         VARCHAR2 (30 CHAR)
, Event_Class_Code         VARCHAR2 (30 CHAR)
, Event_Type_Code          VARCHAR2 (30 CHAR)
, Accounting_Source        VARCHAR2 (50 CHAR)
, Source_Transaction_Num   VARCHAR2 (280 CHAR)
, Source_Distribution_Id   VARCHAR2 (80 CHAR)
, Applied_To_Txn_Number    VARCHAR2 (280 CHAR)
, Sla_Doc_Amt              NUMBER
, Sla_Loc_Amt              NUMBER
, Db_Cr_Ind                VARCHAR2 (30 CHAR)
, Doc_Curr_Code            VARCHAR2 (30 CHAR)
, Loc_Curr_Code            VARCHAR2 (30 CHAR)
, Loc_Exchange_Rate        NUMBER
, Global1_Exchange_Rate    NUMBER
, Global2_Exchange_Rate    NUMBER
, Global3_Exchange_Rate    NUMBER
, Created_By_Wid           NUMBER (10)
, Changed_By_Wid           NUMBER (10)
, Created_On_Dt            DATE
, Changed_On_Dt            DATE
, Aux1_Changed_On_Dt       DATE
, Aux2_Changed_On_Dt       DATE
, Aux3_Changed_On_Dt       DATE
, Aux4_Changed_On_Dt       DATE
, Delete_Flg               CHAR (1 CHAR)
, W_Insert_Dt              DATE
, W_Update_Dt              DATE
, Datasource_Num_Id        NUMBER (10) NOT NULL
, Etl_Proc_Wid             NUMBER (10) NOT NULL
, Integration_Id           VARCHAR2 (300 CHAR) NOT NULL
, Tenant_Id                VARCHAR2 (80 CHAR)
, X_Custom                 VARCHAR2 (10 CHAR)
, Natural_Account_Wid      NUMBER (10)
, Gl_Status_Wid            NUMBER (10)
, Accounting_Dt_Wid        NUMBER (10)
, Gl_Transfer_Dt_Wid       NUMBER (10)
, Balance_Type_Wid         NUMBER (10)
, Journal_Source_Wid       NUMBER (10)
, Journal_Header_Descr     VARCHAR2 (2000 CHAR)
, Journal_Line_Descr       VARCHAR2 (2000 CHAR)
, Gl_Segment3_Wid          NUMBER (10)
, Gl_Segment4_Wid          NUMBER (10)
, Gl_Segment5_Wid          NUMBER (10)
, Gl_Segment6_Wid          NUMBER (10)
, Gl_Segment7_Wid          NUMBER (10)
, Gl_Segment8_Wid          NUMBER (10)
, Gl_Segment9_Wid          NUMBER (10)
, Gl_Segment10_Wid         NUMBER (10)
, Gl_Dataset_Sec_Wid       NUMBER (10)
, Budget_Wid               NUMBER (10)
, Acct_Period_End_Dt_Key   NUMBER (10)
, X_Cod_Yr_WEEK_Pkey        INTEGER  
                               AS (TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(CHANGED_ON_DT,'DD-MON-RR')),'YYYYWW')))
							   
PARTITION BY RANGE (X_Cod_Yr_WEEK_Pkey) 
INTERVAL(01) 
(
PARTITION p0 VALUES LESS THAN (201401)
) 
TABLESPACE TCGI13_DW_DATA ENABLE ROW MOVEMENT;

 -- ================================================
-- Step 3:  Analyze Partitioned Table
-- ================================================  

EXEC DBMS_STATS.GATHER_TABLE_STATS('TCGIT3_DW.','W_SLA_XACT_F');

CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F1
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_ACCOUNT_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F10
   ON Tcgit3_Dw.W_SLA_XACT_F (JOURNAL_SOURCE_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F11
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT1_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F12
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT2_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F13
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT3_WID);

CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F14
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT4_WID);

CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F16
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT6_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F17
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT7_WID);

CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F18
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT8_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F19
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT9_WID);
  
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F2
   ON Tcgit3_Dw.W_SLA_XACT_F (LEDGER_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F20
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_SEGMENT10_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F21
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF1_WID);
      
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F22
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF2_WID);
      
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F23
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF3_WID);
     
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F24
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF4_WID);
     
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F25
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF5_WID);
     
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F26
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF6_WID);
     
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F27
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF7_WID);
     
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F28
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF8_WID);
     
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F29
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF9_WID);
     
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F3
   ON Tcgit3_Dw.W_SLA_XACT_F (COMPANY_ORG_WID);
  
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F30 
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPORT_REF10_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F31
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_DATASET_SEC_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F32
   ON Tcgit3_Dw.W_SLA_XACT_F (BUDGET_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F33
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPLIER_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F34
   ON Tcgit3_Dw.W_SLA_XACT_F (SUPPLIER_ACCT_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F35
   ON Tcgit3_Dw.W_SLA_XACT_F (CUSTOMER_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F36
   ON Tcgit3_Dw.W_SLA_XACT_F (CUSTOMER_ACCT_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F37
   ON Tcgit3_Dw.W_SLA_XACT_F (ACCOUNTING_DT_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F38
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_TRANSFER_DT_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F39
   ON Tcgit3_Dw.W_SLA_XACT_F (GL_STATUS_WID);
    
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F4
   ON Tcgit3_Dw.W_SLA_XACT_F (BALANCING_SEGMENT_WID);
  
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F40
   ON Tcgit3_Dw.W_SLA_XACT_F (CREATED_BY_WID);

CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F41
   ON Tcgit3_Dw.W_SLA_XACT_F (CHANGED_BY_WID);

CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F5
   ON Tcgit3_Dw.W_SLA_XACT_F (NATURAL_ACCOUNT_WID);
 
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F6
   ON Tcgit3_Dw.W_SLA_XACT_F (COST_CENTER_WID);

CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F7
   ON Tcgit3_Dw.W_SLA_XACT_F (MCAL_CAL_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F8
   ON Tcgit3_Dw.W_SLA_XACT_F (ACCT_PERIOD_END_DT_WID);
   
CREATE BITMAP INDEX Tcgit3_Dw.W_SLA_XACT_F_F9
   ON Tcgit3_Dw.W_SLA_XACT_F (BALANCE_TYPE_WID);
   
CREATE UNIQUE INDEX Tcgit3_Dw.W_SLA_XACT_F_U1 
  ON Tcgit3_Dw.W_SLA_XACT_F (INTEGRATION_ID, DATASOURCE_NUM_ID);
   
exit;