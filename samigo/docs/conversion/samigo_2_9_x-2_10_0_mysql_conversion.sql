-- SAM-2063
alter table SAM_ASSESSMENTGRADING_T add HASAUTOSUBMISSIONRUN bit not null DEFAULT false;

-- Start SAM-2087
alter table SAM_ANSWER_T CHANGE SCORE SCORE double;
alter table SAM_ANSWER_T CHANGE DISCOUNT DISCOUNT double;
alter table SAM_ANSWER_T CHANGE PARTIAL_CREDIT PARTIAL_CREDIT double;

alter table SAM_ASSESSMENTGRADING_T CHANGE TOTALAUTOSCORE TOTALAUTOSCORE double;
alter table SAM_ASSESSMENTGRADING_T CHANGE TOTALOVERRIDESCORE TOTALOVERRIDESCORE double;
alter table SAM_ASSESSMENTGRADING_T CHANGE FINALSCORE FINALSCORE double;

alter table SAM_GRADINGSUMMARY_T CHANGE SUMOF_AUTOSCOREFORGRADE SUMOF_AUTOSCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE AVERAGE_AUTOSCOREFORGRADE AVERAGE_AUTOSCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE HIGHEST_AUTOSCOREFORGRADE HIGHEST_AUTOSCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE LOWEST_AUTOSCOREFORGRADE LOWEST_AUTOSCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE LAST_AUTOSCOREFORGRADE LAST_AUTOSCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE SUMOF_OVERRIDESCOREFORGRADE SUMOF_OVERRIDESCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE AVERAGE_OVERRIDESCOREFORGRADE AVERAGE_OVERRIDESCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE HIGHEST_OVERRIDESCOREFORGRADE HIGHEST_OVERRIDESCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE LOWEST_OVERRIDESCOREFORGRADE LOWEST_OVERRIDESCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE LAST_OVERRIDESCOREFORGRADE LAST_OVERRIDESCOREFORGRADE double;
alter table SAM_GRADINGSUMMARY_T CHANGE FINALASSESSMENTSCORE FINALASSESSMENTSCORE double;

alter table SAM_ITEMGRADING_T CHANGE AUTOSCORE AUTOSCORE double;
alter table SAM_ITEMGRADING_T CHANGE OVERRIDESCORE OVERRIDESCORE double;

alter table SAM_ITEM_T CHANGE SCORE SCORE double;
alter table SAM_ITEM_T CHANGE DISCOUNT DISCOUNT double;

alter table SAM_PUBLISHEDANSWER_T CHANGE SCORE SCORE double;
alter table SAM_PUBLISHEDANSWER_T CHANGE DISCOUNT DISCOUNT double;
alter table SAM_PUBLISHEDANSWER_T CHANGE PARTIAL_CREDIT PARTIAL_CREDIT double;

alter table SAM_PUBLISHEDITEM_T CHANGE SCORE SCORE double;
alter table SAM_PUBLISHEDITEM_T CHANGE DISCOUNT DISCOUNT double;
-- End SAM-2087

-- SAM-1943
alter table SAM_ATTACHMENT_T add ITEMTEXTID bigint(20) DEFAULT NULL;
alter table SAM_ITEMTEXT_T add REQUIRED_OPTIONS_COUNT int(11) DEFAULT NULL;
alter table SAM_ITEM_T add ANSWER_OPTIONS_RICH_COUNT int(11) DEFAULT NULL;
alter table SAM_ITEM_T add ANSWER_OPTIONS_SIMPLE_OR_RICH int(11) DEFAULT NULL;

create index SAM_ATTACH_ITEMTEXTID_I ON SAM_ATTACHMENT_T (ITEMTEXTID);
alter table SAM_ATTACHMENT_T add CONSTRAINT FOREIGN KEY (ITEMTEXTID) REFERENCES SAM_ITEMTEXT_T (ITEMTEXTID);

alter table SAM_PUBLISHEDATTACHMENT_T add ITEMTEXTID bigint(20) DEFAULT NULL;
alter table SAM_PUBLISHEDITEMTEXT_T add REQUIRED_OPTIONS_COUNT int(11) DEFAULT NULL;
alter table SAM_PUBLISHEDITEM_T add ANSWER_OPTIONS_RICH_COUNT int(11) DEFAULT NULL;
alter table SAM_PUBLISHEDITEM_T add ANSWER_OPTIONS_SIMPLE_OR_RICH int(11) DEFAULT NULL;

create index SAM_PUBATTACH_ITEMTEXTID_I ON SAM_PUBLISHEDATTACHMENT_T (ITEMTEXTID);
alter table SAM_PUBLISHEDATTACHMENT_T add CONSTRAINT FOREIGN KEY (ITEMTEXTID) REFERENCES SAM_PUBLISHEDITEMTEXT_T (ITEMTEXTID);

INSERT INTO SAM_TYPE_T (TYPEID ,AUTHORITY ,DOMAIN, KEYWORD, DESCRIPTION,
    STATUS, CREATEDBY, CREATEDDATE, LASTMODIFIEDBY, LASTMODIFIEDDATE )
    VALUES (14 , 'stanford.edu' ,'assessment.item' ,'Extended Matching Items' ,NULL ,1 ,1 ,
    '2009-11-23 12:00:00',1 ,'2009-11-23 12:00:00');