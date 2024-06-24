SET SERVEROUTPUT ON

BEGIN
    DBMS_CREDENTIAL.create_credential(
        credential_name => 'backup_credential',
        username => 'ADMIN',
        password => '181222'
    );
END;
/

begin
    DBMS_CREDENTIAL.drop_credential(
        credential_name => 'backup_credential'
        );
end;
/

begin 
    DBMS_SCHEDULER.CREATE_SCHEDULE(
        schedule_name=> 'FULL_BACKUP_SCHEDULE',
        start_date=> systimestamp,
        repeat_interval=> 'FREQ=WEEKLY; 
                        BYDAY=THU; BYHOUR=9;
                        BYMINUTE=10; BYSECOND=0',
        end_date=> null,
        comments => 'Full back up once a week at 9:10 in thursday'
    );    
end;
/

begin
    DBMS_SCHEDULER.CREATE_PROGRAM(
        program_name => 'FULL_BACKUP_PROGRAM',
        program_type => 'BACKUP_SCRIPT',
        program_action => q'[connect target /
            RUN {
                BACKUP INCREMENTAL LEVEL 0 DATABASE;
            }]',
        enabled  => TRUE
    );
end;
/
BEGIN
    DBMS_SCHEDULER.create_job (
    job_name => 'FULL_BACKUP_JOB',
    program_name => 'FULL_BACKUP_PROGRAM',
    schedule_name => 'FULL_BACKUP_SCHEDULE',
    credential_name => 'backup_credential',
    enabled => TRUE
    );
end;
/


begin 
    DBMS_SCHEDULER.CREATE_SCHEDULE(
        schedule_name=> 'INCREDENTIAL_BACKUP_SCHEDULE',
        start_date=> systimestamp,
        repeat_interval=>   'FREQ=WEEKLY;
                            BYDAY=MON,TUE,WED,THU,FRI,SAT; 
                            BYHOUR=2; 
                            BYMINUTE=45;
                            BYSECOND=0',
        end_date=> null,
        comments => 'Incredential backup at 3AM in weekdays'
    );    
end;
/


begin 
    DBMS_SCHEDULER.CREATE_PROGRAM(
        program_name => 'INCREDENTIAL_BACKUP_PROGRAM',
        program_type => 'BACKUP_SCRIPT',
        program_action => q'[connect target /
                RUN {
                    BACKUP INCREMENTAL LEVEL 1 DATABASE;
                }]',
        enabled  => TRUE
    );
end;
/
begin
    DBMS_SCHEDULER.create_job (
    job_name => 'INCREMENTAL_BACKUP_JOB',
    program_name => 'INCREDENTIAL_BACKUP_PROGRAM',
    
    schedule_name =>   'INCREDENTIAL_BACKUP_SCHEDULE',
    credential_name => 'backup_credential',
    enabled => TRUE
    );
END;
/

--execute DBMS_SCHEDULER.drop_job('FULL_BACKUP_JOB');
--execute DBMS_SCHEDULER.drop_schedule('FULL_BACKUP_SCHEDULE');
--execute dbms_scheduler.drop_program('FULL_BACKUP_PROGRAM');
--
--execute DBMS_SCHEDULER.drop_job('INCREMENTAL_BACKUP_JOB');
--execute DBMS_SCHEDULER.drop_schedule('INCREDENTIAL_BACKUP_SCHEDULE');
--execute dbms_scheduler.drop_program('INCREDENTIAL_BACKUP_PROGRAM');

SELECT JOB_NAME, STATE, REPEAT_INTERVAL, NEXT_RUN_DATE
FROM USER_SCHEDULER_JOBS;
SELECT *
FROM USER_SCHEDULER_JOBS
WHERE JOB_NAME = 'INCREMENTAL_BACKUP_JOB';
SELECT JOB_NAME, STATE, REPEAT_INTERVAL, NEXT_RUN_DATE
FROM USER_SCHEDULER_JOBS
WHERE JOB_NAME = 'INCREMENTAL_BACKUP_JOB';
SELECT JOB_NAME, STATE, REPEAT_INTERVAL, NEXT_RUN_DATE
FROM USER_SCHEDULER_JOBS
WHERE JOB_NAME = 'FULL_BACKUP_JOB';
SELECT *
FROM USER_SCHEDULER_JOB_RUN_DETAILS
WHERE JOB_NAME = 'FULL_BACKUP_JOB'
ORDER BY LOG_DATE;
SELECT *
FROM USER_SCHEDULER_PROGRAMS;

select * FROM   dba_scheduler_job_run_details;