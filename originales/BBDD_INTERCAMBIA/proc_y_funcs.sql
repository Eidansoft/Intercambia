--------------------------------------------------------
--  DDL for Function SQUIRREL_GET_ERROR_OFFSET
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "INPXXADM"."SQUIRREL_GET_ERROR_OFFSET" (query IN varchar2) return number authid current_user is      l_theCursor     integer default dbms_sql.open_cursor;      l_status        integer; begin          begin          dbms_sql.parse(  l_theCursor, query, dbms_sql.native );          exception                  when others then l_status := dbms_sql.last_error_position;          end;          dbms_sql.close_cursor( l_theCursor );          return l_status; end; 
/
--------------------------------------------------------
--  DDL for Package SMP_MAINTENANCE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_MAINTENANCE" AS
	procedure RESET_SYSMAN;
end;

/
--------------------------------------------------------
--  DDL for Package SMP_VDD
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDD" as

/* constant for type like JOB */
jobType constant varchar2(32) := 'VdjJob';
/* constants for sub type like submit job */
jobSubTypeDelete constant varchar2(32) := 'DeleteJob';
jobSubTypeSubmit constant varchar2(32) := 'SubmitJob';
jobSubTypeModify constant varchar2(32) := 'ModifyJob';
jobSubTypeClearHistoryTrunc constant varchar2(32) := 'ClearHistoryTrunc';
jobSubTypeClearHistoryMark constant varchar2(32) := 'ClearHistoryMark';

/* constant for call back name like vdj */
jobCallBackName constant varchar2(32) := 'vdj';

/* constant for whether the operation is an outgoing operation */
outGoingOperationYes constant varchar2(1) := 'Y';
outGoingOperationNo constant varchar2(1) := 'N';

eventType constant varchar2(32) := 'EVENT';

eventSubTypeReg constant varchar2(32) := '1';
eventSubTypeDeReg constant varchar2(32) := '2';
eventSubTypeModify constant varchar2(32) := '3';
eventSubTypeTryRemove constant varchar2(32) := '5';
eventSubTypeChkNodeUpDn constant varchar2(32) := '9';
eventSubTypeNodeUpDn constant varchar2(32) := '10';
eventSubTypeEventUpDn constant varchar2(32) := '11';
eventSubTypeClearHistory constant varchar2(32) := '12';

eventCallBackName constant varchar2(32) := 'vde';

/* Submit the specified array of operations. outgoingOp indicated
 * whether the operations are outgoing ('N') or local ('Y').
 */
procedure submitOperations(ops SMP_VDD_OP_ARRAY, outgoingOp char);

end SMP_VDD;

/
--------------------------------------------------------
--  DDL for Package SMP_VDE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDE" AS

/* Constants for event states and severities */
eventSeverityAlert constant integer := 25;
eventSeverityWarning constant integer := 20;
eventSeverityError constant integer := 18;
eventSeverityClear constant integer := 15;
eventSeverityNodeDown constant integer := 303;
eventSeverityUnmonitored constant integer := 1;

eventOccStatusOpen constant integer := 1;
eventOccStatusClose constant integer := 0;

eventStateRegistrationPending constant integer := 204;
eventStateRegistered constant integer := 205;
eventStateRegFailed constant integer := 206;
eventStateDeregPending constant integer := 207;
eventStateDeregistered constant integer := 208;
eventStateDeregFailed constant integer := 209;
eventStateModifyPending constant integer := 210;
eventStateModified constant integer := 211;
eventStateModifyFailed constant integer := 212;

eventOperationNone constant integer := -1;
eventOperationAdd constant integer := 1;
eventOperationDelete constant integer := 2;
eventOperationModify constant integer := 3;
eventOperationNoop constant integer := 4;

eventStateNodeUp constant integer := 302;
eventStateNodeDown constant integer := 303;

registerEventOp constant varchar2(128) := '1';
checkNodeUpdownOp constant varchar2(128) := '9';

objectTypeEvent constant varchar2(6) := 'EVENT';

/* Error codes returned by insertEvent and other procedures */
/* A registered event with the same name and owner exists */
activeEventExistsError constant integer := -1;
/* A library event with the same name and owner exists */
libEventExistsError constant integer := -2;
/* Preferred credentials were not set for some targets */
prefCredsNotSetError constant integer := -3;
/* The specified event id was invalid */
illegalEventIdError constant integer := -4;

/* Event notification type */
notificationTypeEvent constant integer := 2;

/* Return the event states given a set of targets and groups. Only consider */
/* events that the specified user has permissions to view. */
procedure getTargetEventStates(targetNames in SMP_VD_STRINGARRAY,
                               targetTypes in SMP_VD_STRINGARRAY,
                               groupNames in SMP_VD_STRINGARRAY,
                               groupOwners in SMP_VD_STRINGARRAY,
                               userName in varchar2,
                               isSuperUser in integer,
                               targetStates OUT SMP_VD_INTEGERARRAY,
                               groupStates OUT SMP_VD_INTEGERARRAY);

/* Return the event states, along with targets and groups, of */
/* all members of the specified group. Note that groupNames */
/* are returned in fully-qualified form, ie OWNER:GROUP. Only events */
/* that the specified user has permissions to view are considered. */
procedure getGroupTargetEventStates(groupName in varchar2,
                                    groupOwner in varchar2,
                                    userName in varchar2,
                                    isSuperUser in integer,
                                    targetNames out SMP_VD_STRINGARRAY,
                                    targetTypes out SMP_VD_STRINGARRAY,
                                    groupNames out SMP_VD_STRINGARRAY,
                                    targetStates out SMP_VD_INTEGERARRAY,
                                    groupStates out SMP_VD_INTEGERARRAY); 

/**
 * Insert a notification for the fevent specified by id of the specified
 * subtype for all targets of the event, sent to all users that have
 * permissions over the event. Two name-value pairs will be generated:
 * a "name" pair, and an "owner" pair
 */
procedure insertNotifications(eventId in integer,
                              subtype in integer,
                              timeIn in integer,
                              timeZone in integer,
                              names in SMP_VD_STRINGARRAY,
                              valueLengths in SMP_VD_INTEGERARRAY,
                              valueData in SMP_VD_RAWARRAY);

/**
 * Insert the event with the specified parameters into the
 * repository. if saveToLib is true, then the event is saved
 * in the library. If submit is true (1), then the event is
 * saved as a registered event. Both submit and saveToLib could
 * be true. On success, this method returns > 0. The event id's 
 * are returned through libEventId and activeEventId, respectively.
 * the following error codes (<0):
 *    activeEventExistsError
 *    libEventExistsError
 *    prefCredsNotSetError
 */
function insertEvent(eventName in varchar2,
                     eventOwner in varchar2,
                     eventDescription in varchar2,
                     targetType in varchar2,
                     eventSchedule in varchar2,
                     saveToLib in integer,
                     submit in integer,
                     fixitJobId in integer,
                     fixitJobName in varchar2,
                     fixitJobOwner in varchar2,
                     isUnSolicited in integer,
                     incompleteStatus in integer,
                     snmpAttr in integer,
                     timeIn in date,
                     timeZone in integer,
                     targetNames in SMP_VD_STRINGARRAY,
                     groupNames in SMP_VD_STRINGARRAY,
                     groupOwners in SMP_VD_STRINGARRAY,
                     nodePropNames in SMP_VD_STRINGARRAY,
                     nodePropValues in SMP_VD_STRINGARRAY,
                     targetPropNames in SMP_VD_STRINGARRAY,
                     targetPropValues in SMP_VD_STRINGARRAY,
                     testNames in SMP_VD_STRINGARRAY,
                     nlsTestNames in SMP_VD_STRINGARRAY,
                     insertNodeUpdown in integer,
                     isNodeUpDownOnly in integer,
                     nodeUpdownNlsName in varchar2,
                     isSuperUser in integer,
                     checkTargetCreds in integer,
                     checkNodeCreds in integer,
                     targetsWithoutCreds OUT SMP_VD_STRINGARRAY,
                     nodesWithoutCreds OUT SMP_VD_STRINGARRAY,
                     numTargets OUT integer,
                     numTargetsWithoutAgents OUT integer,
                     libEventId OUT integer,
                     activeEventId OUT integer) return integer;

/*
Get the active registered event target names for the given fixit job - jId
This function first determines if the given jId is a fixit job. If it is
a fixit job then this function will find out all the target names that
the given fixit job is running on and that have events registered on 
them and are active.
Note that this function will return a string array of such target names
found. This function returns an empty string array in two cases - one when
this is not a fixit job and the other when this is a fixit job but there are
no active events registered on any of the target names on which this fixit
job is running.
*/                                         
function getActiveRegEvtTNames( jId INTEGER ) return SMP_VD_STRINGARRAY;

/*
Delete events against all targets for the list of event ids passed in eventIds
For a given event id, this procedure will delete the event against all targets
if the forceRemove value is 1 meaning that the event will be deleted against
all targets event if there are active event occurrences on some of those
targets. However, if forceRemove value is 0, then the event will be deleted
only on those targets on which there are no active event occurrences.
*/
procedure deleteEventsAgainstTargets( 
                                userName                IN VARCHAR2,                                    
                                isSuperUser             IN INTEGER,
                                forceRemove             IN INTEGER,
                                eventIds                IN SMP_VD_INTEGERARRAY,
                                timeStampVal            IN INTEGER,
                                timeStampValAsDate      IN DATE,
                                timeZoneVal             IN INTEGER,
                                domainVal               IN VARCHAR2,
                                targetNames             IN SMP_VD_STRINGARRAY,
                                allTargets              IN VARCHAR2,
                                targetCount             IN SMP_VD_INTEGERARRAY,
                                noPermissionsArray      OUT SMP_VD_INTEGERARRAY,
                                eventIdTargetNameArray  OUT SMP_VDE_EVT_OCC_ARRAY,
                                busyEventIdTNameArray   OUT SMP_VDE_EVT_OCC_ARRAY,
                                invalidEventIdArray     OUT SMP_VD_INTEGERARRAY);

/*
Determine if the event id is invalid
This function takes in the event id, the user name and does a select statement 
on smp_vde_event_target_info to determine the validity of the event id though a 
select on any other appropriate event table could also have been used
This function will return a negative value if the event id is invalid and a
positive value(the event id value itself) if the event id is valid
*/                                
function isEventIdValid(
                        eId INTEGER,
                        userName VARCHAR2) return INTEGER;                                                   
                                                    
/*
Get the privilege for the event with the given event id and the given 
user name. 
This function returns the privilege of the user - userName for the event -
event_id. The privilege returned is NONE OR VIEW OR MODIFY OR FULL
*/
function getPrivilegeForEvent( 
                                event_id INTEGER,
                                userName VARCHAR2) return VARCHAR;

/*
Populate the activeEvtOccTNames array.
This procedure populates the array with the target names on which there are
active events occurrences for this event
The event against such targets, if found, will not be deleted if forceRemove is
0
*/
procedure populateActEvtOccTNames(
                        eId IN INTEGER,
                        deleteTNames       IN SMP_VD_STRINGARRAY,
                        allTargets         IN VARCHAR2,
                        activeEvtOccTNames OUT SMP_VD_STRINGARRAY);

/*
Populate the eventIdTNameArray array.
For each target name found and populated in activeEvtOccTNames array,
this array is also populated with the target names in activeEvtOccTNames array
only if forceRemove = 0
*/
procedure populateEvtIdTNameArray(
                        eId IN INTEGER,
                        forceRemove IN INTEGER,
                        activeEvtOccTNames IN SMP_VD_STRINGARRAY,
                        eventIdTargetNameArray IN OUT SMP_VDE_EVT_OCC_ARRAY);
                                                                        
/*
Populate the toDeleteTNames array
This procedure populates the array with the target names against which this event
will be deleted. Note that this procedure will populate the toDeleteTNames
array considering the target names in the activeEvtOccTNames array. 
The length of activeEvtOccTNames can be = 0 or > 0. If the size of this array
is = 0 or forceRemove = 1, then this event will be deleted against all targets.
However, if the the size of activeEvtOccTNames > 0 then this event will be
deleted against all targets populated in toDeleteTNames
Note: this function only populates the array - toDeleteTNames with the target 
names and later this event will be deleted against the targets whose names are 
populated in the toDeleteTNamesFinal array which in turn is populated based
on the target names in toDeleteTNames. This happens in the lockRows procedure
target deletion.
*/
procedure populateToDeleteTNames(
                        eId IN INTEGER,
                        forceRemove IN INTEGER,
                        activeEvtOccTNames IN SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY);

procedure populateToDeleteTNamesSubset(
 
                        eId IN INTEGER,
                        forceRemove IN INTEGER,
                        deleteTNames IN SMP_VD_STRINGARRAY,
                        activeEvtOccTNames IN OUT SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY);
/*
Lock the rows on those targets against which the event will
be deleted. In the process of locking the rows, this procedure also gets the
node names and the target type, stores them in the respective
arrays and returns them as out parameters. The node names, target type 
are used later in the other steps.
Note that while trying to obtain a lock, a no wait is used because the event
could stay in deregistration pending state for a long time and trying to obtain 
a lock on such a row will cause a deadlock. So in the process of obtaining lock
on targets in toDeleteTNames, only if the row lock can be obtained on a specific
target, that target will be added to toDeleteTNamesFinal. If the row lock cannot
be obtained, the event id and target name will be added to busyEventIdTNameArray.
The array toDeleteTNamesFinal will then consist of the final list of targets on 
which this event will be deleted.
*/
procedure lockRows(
                eId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                todeleteTNamesFinal OUT SMP_VD_STRINGARRAY,
                nodeNames OUT SMP_VD_STRINGARRAY,
                targetType OUT VARCHAR2,
                busyEventIdTNameArray IN OUT SMP_VDE_EVT_OCC_ARRAY);

/*
Determines if the event - eId is a node up down only event.
returns 1 if the event is node up down only, 0 otherwise
*/
function isNodeUpDownOnly( eId IN INTEGER ) return INTEGER;
                                
/*
Update the status of the event against those targets that this event will be 
deleted. The target names are taken from the toDeleteTNamesFinal array that has 
the list of all targets against which this event will be deleted. 
The status will be updated to 208 if this event is a node up down only or to 207
otherwise
*/
procedure updateStatus(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                toDeleteTNamesFinal IN SMP_VD_STRINGARRAY );
                                
/*
Move the active event occurrences to history. The target names are taken from
the activeEvtOccTNames array that has the list of all targets against which
this event has active event occurrences. The active event occurrences will
be moved to history only if forceRemove=1 and the event is node up down only
and size of activeEvtOccTNames is more than 0
*/
procedure moveEvtOccToHist(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                forceRemove IN INTEGER,
                activeEvtOccTNames IN SMP_VD_STRINGARRAY );

/*
Submit operations on those targets against which the event will be deleted. The
target names are taken from the toDeleteTNamesFinal array that has the list of
all targets against which this event will be deleted. 
Operations of type SMP_VDD.eventSubTypeTryRemove will be submitted if the
event is node up down only or of type SMP_VDD.eventSubTypeDeReg otherwise
*/
procedure submitOperations(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                toDeleteTNamesFinal IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                userName IN VARCHAR2,
                targetType IN VARCHAR2);

/*
Insert UI notifications for those targets that this event will be deleted 
against. The target names are taken from the toDeleteTNamesFinal array that 
has the list of all targets against which this event will be deleted.
*/
procedure insertUINotifications(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                userName IN VARCHAR2,
                toDeleteTNamesFinal IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                targetType IN VARCHAR2,
                timeStampVal IN INTEGER,
                timeZoneVal IN INTEGER,
                domainVal IN VARCHAR2);

/**
 * Remove the specified event occurrences from history, cleaning
 * up entries in the smp_vde_event and smp_vde_event_target_info
 * tables as necessary. Each occurrence to delete is specified
 * by (eventid, targetname, occurrenceNo) which is specified
 * via the passed-in arrays. counts(2) is set to the number
 * of occurrences that were actually deleted. counts(1) is set to the
 * number of occurrences that were not deleted because the user did not
 * have permissions to delete them.
 * For efficiency, this method expects that the input list is
 * sorted by event_id and target name.
 * Returns 1 on success, the following error codes (<0) on failure:
 *    illegalEventIdError One or more event ids specified were illegal
 */
function removeEventLogs(userName in varchar2,
                         isSuperUser IN integer,
                         timeIn integer,
                         timeZone integer,                       
                         occsToRemove SMP_VDI_OBJ_OCC_ARRAY,
                         counts out SMP_VD_INTEGERARRAY) return integer;

/**
 * Remove all occurrences in history that the specified user has permission
 * to remove. counts(2) is set to the number
 * of occurrences that were actually deleted. counts(1) is set to the
 * number of occurrences that were not deleted because the user did not
 * have permissions to delete them.
 * Returns 1 on success, the following error codes (<0) on failure:
 */
function clearEventHistory(userName in varchar2,
                           isSuperUser in integer,
                           timeIn integer,
                           timeZone integer,
                           counts out SMP_VD_INTEGERARRAY) return integer;
/**
 * This is called when a clear history operation is processed. This deletes
 * all occurrences that are marked for delete and cleans up event entries
 * if required.
 */
procedure processClearHistory(batchSize integer);
                
end smp_vde;

/
--------------------------------------------------------
--  DDL for Package SMP_VDG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDG" AS

  TYPE VDG_CURSOR IS REF CURSOR;

  /* error codes returned by package routines */
  NO_ERR constant integer := 0;
  INVALID_FIXITJOB_ERR constant integer := -1;
  AGENT_STATE_BAD_ERR constant integer := -2;
  ALREADY_REGISTERED_ERR constant integer := -3;
  INVALID_AGENTID_ERR constant integer := -4;
  STALE_NOTIFS_ERR constant integer := -5;

  /* Registration states of event */
  REGN_PENDING_STAT constant integer := -1;
  REGN_COMPLETE_STAT constant integer := 1;
  DEREGN_PENDING_STAT constant integer := -2;
  INVALID_REGN_STAT constant integer := -3;

  /* Agent Operation states of modify event */
  ADD_AGENT_OPN constant integer := 1;
  REMOVE_AGENT_OPN constant integer := 2;
  MODIFY_AGENT_OPN constant integer := 3;
  NOOP_AGENT_OPN constant integer := 4;

  UNSOL_EVENT_NAME constant VARCHAR2(150) := '/oracle/host/unsolicited_event/unsolicited_event';

  /* states of job */
  JOB_NOT_SCHEDULED_STAT constant integer := -1;
  JOB_SCHEDULED_STAT constant integer := 0; /* job is scheduled at agent */
  JOB_SCHEDULED_NOTIF_STAT constant integer := 1; /* job is scheduled and */
                                                  /* notif is succefully sent */

  PROCEDURE add_agent_node(
    name IN VARCHAR2,
    nameatagent IN VARCHAR2,
    newAgentVersion IN VARCHAR2,
    timezone IN NUMBER);

  PROCEDURE remove_agent_node(
    name IN VARCHAR2);

  FUNCTION get_job_info(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    agent_id OUT INTEGER,
    agent_tz OUT INTEGER,
    schedule_timestamp OUT VARCHAR2)
    RETURN INTEGER;

  FUNCTION add_job(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    agent_id IN INTEGER,
    agent_tz IN INTEGER,
    schedule_timestamp IN VARCHAR2)
    RETURN INTEGER;

  FUNCTION add_event(
    modify IN INTEGER,
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    mas_fixit_jobid IN INTEGER,
    eventTestIds IN SMP_VD_INTEGERARRAY,
    unsolFilters IN SMP_VD_INTEGERARRAY,
    deletedTestIds IN SMP_VD_INTEGERARRAY,
    agentIds OUT SMP_VD_INTEGERARRAY,
    agentEventTestNames OUT SMP_VD_STRINGARRAY,
    agent_fixit_jobid OUT INTEGER) 
    RETURN INTEGER;

  PROCEDURE add_event_test(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    mas_testid IN INTEGER,
    unsol_filter IN INTEGER,
    agent_id OUT INTEGER,
    agent_event_name OUT VARCHAR2);

  FUNCTION update_event_test(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    mas_testid IN INTEGER,
    event_name IN VARCHAR2,
    agent_event_name IN VARCHAR2,
    event_args IN VARCHAR2,
    agent_id IN INTEGER,
    agent_opn IN INTEGER)
    RETURN INTEGER;

  FUNCTION update_event(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    eventTests IN SMP_VDG_EVENT_TEST_ARRAY,
    deleteTestIds IN SMP_VD_INTEGERARRAY)
    RETURN INTEGER;

  PROCEDURE update_event_tests_reg_status(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    testIds IN SMP_VD_INTEGERARRAY,
    reg_status INTEGER);

  PROCEDURE update_event_reg_status(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    reg_status INTEGER);

  PROCEDURE unregister_event(
    node_name IN VARCHAR2,
    mas_id IN INTEGER, 
    target_name IN VARCHAR2, 
    target_type IN VARCHAR2,
    agentIds OUT SMP_VD_INTEGERARRAY);

  PROCEDURE remove_event_tests(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    deleteTestIds IN SMP_VD_INTEGERARRAY);

  PROCEDURE remove_event(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER);

  PROCEDURE get_event_agentids(
    node_name IN VARCHAR2,
    agentIds OUT SMP_VD_INTEGERARRAY);

  FUNCTION get_event_notif_list(
    agent_id IN INTEGER, 
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    agent_event_name IN VARCHAR2,
    notifCursor OUT VDG_CURSOR) 
    RETURN INTEGER;

  FUNCTION is_already_registered(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER)
    RETURN INTEGER;

  FUNCTION get_fixitjob_agentid(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER)
    RETURN INTEGER;

END;

/
--------------------------------------------------------
--  DDL for Package SMP_VDI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDI" AS
  PROCEDURE checkAndUpdateVersion(
    oname IN VARCHAR2,
    objOwner IN VARCHAR2,
    otype IN VARCHAR2,
    inversion IN INTEGER,
    outversion OUT INTEGER); 

  /* Given a MAS object identified by object_name, type and owner,
   * return a list of all users that have at least view permissions
   * on the object. Note that these would be all super-users plus
   * non-super-users that have at least view permission.
   */
  procedure getUsersWithAccess(objname IN varchar2,
                               objowner IN varchar2,
                               objtype IN varchar2,
                               usersWithAccess OUT SMP_VD_STRINGARRAY);
END;

/
--------------------------------------------------------
--  DDL for Package SMP_VDJ
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDJ" as 
type VdjCr is ref cursor;

/* Error codes */
/* An active job with the same name and owner exists */
activeJobExistsError constant integer := -1;
/* A library job with the same name and owner exists */
libJobExistsError constant integer := -2;
/* Preferred credentials were not set for some targets */
prefCredsNotSet constant integer := -3;
/* The job id specified does not exist */
illegalJobIdError constant integer := -4;

/* Job states */
jobStatusSubmitted constant integer := 1;
jobStatusScheduled constant integer := 2;
jobStatusStarted constant integer := 4;
jobStatusCompleted constant integer := 9;
jobStatusFailed constant integer := 11;
jobStatusDeleting constant INTEGER := 13;
jobStatusDeleted constant INTEGER := 14;
jobStatusExpired constant INTEGER := 15;
jobStatusMarkedForDelete constant INTEGER := 17;

jobStatusCLearHistory constant INTEGER := 102;

/* job notification type */
notificationTypeJob constant integer := 1;

/* job operations */
submitJobOp constant varchar2(20) := 'SubmitJob';

/* The job subtype in the vdu/vdi objects table */
objectTypeJob constant varchar2(5) := 'JOB';


/* Clear history and return a list of users to send notifications */
/* to. counts(1) is set to the number of rows that were actually */
/* deleted. counts(2) is set to the number of  */
/* rows in history that this user has permissions to view */
/* but were not deleted because the user did not have permissions */
/* to delete them. This information is not relevant for super-users, */
/* so will be set to 0. */
procedure removeAllJobLogs(userName IN varchar2,
                           isSuperUser IN integer,
                           counts OUT SMP_VD_INTEGERARRAY);

/**
 * Remove the specified job logs from job history, cleaning
 * up entries in the smp_vdj_job and smp_vdj_job_per_target
 * tables as necessary. Each job log to delete is specified
 * by the triple (jobid, targetname, execNum) which is specified
 * via the passed-in arrays. counts(2) is set to the number
 * of logs that were actually deleted. counts(1) is set to the
 * number of logs that were not deleted because the user did not
 * have permissions to delete them.
 * For efficiency, this method expects that the input list is
 * sorted by job_id. 
 * Returns 1 on success, the following error codes (<0) on failure:
 *    illegaljobIdError One or more job ids specified were illegal
 */
function removeJobLogs(userName in varchar2,
                       isSuperUser IN integer,
                       timeIn integer,
                       timeZone integer,                       
                       occsToRemove SMP_VDI_OBJ_OCC_ARRAY,
                       counts out SMP_VD_INTEGERARRAY) return integer;

/**
 * Insert a notification for the job specified by id of the specified
 * subtype for all targets of the job, sent to all users that have
 * permissions over the job. No name-value pairs will be generated
 * in the notification
 */
procedure insertNotifications(id in integer,
                              subtype in integer,
                              timeIn in integer,
                              timeZone in integer,
                              names in SMP_VD_STRINGARRAY,
                              valueLengths in SMP_VD_INTEGERARRAY,
                              valueData in SMP_VD_RAWARRAY);

/* Create all the schema entries for a new job. Returns the job id. The parameter
 * numTargetsWithoutAgents will be set to the number of targets in the
 * flattened list that were ignored because they did not have agents.
 * Returns the following error codes:
 *      activeJobExistsError 
 *      libJobExistsError 
 * If either checkTargets or checkNodes is set to true (1), then the flattened
 * targets and/or nodes are checked for preferred credentials. If preferred
 * credentials have not been set, the list of targets/nodes for which credentials
 * have not been set are returned through the out parameters targetsWithoutCreds
 * and nodesWithoutCreds.
 */
function insertJob(jobName in varchar2,
                   jobOwner in varchar2,
                   isSuperUser in integer,
                   jobDescription in varchar2,
                   targetType in varchar2,
                   jobSchedule in varchar2,
                   isFixit in integer,
                   lastModifiedBy in varchar2,
                   isLibrary in integer,
                   incompleteStatus in integer,
                   timeIn in date,
                   timeZone in integer,
                   targetNames in SMP_VD_STRINGARRAY,
                   groupNames in SMP_VD_STRINGARRAY,
                   groupOwners in SMP_VD_STRINGARRAY,
                   nodePropNames in SMP_VD_STRINGARRAY,
                   nodePropValues in SMP_VD_STRINGARRAY,
                   targetPropNames in SMP_VD_STRINGARRAY,
                   targetPropValues in SMP_VD_STRINGARRAY,
                   checkTargetCreds in integer,
                   checkNodeCreds in integer,
                   targetsWithoutCreds OUT SMP_VD_STRINGARRAY,
                   nodesWithoutCreds OUT SMP_VD_STRINGARRAY,
                   numTargets OUT integer,
                   numTargetsWithoutAgents out integer) return integer;

/*
Delete jobs against all targets for the list of job ids passed in jobIds
For a non-fixit job, this procedure will delete the job against all the targets
However, for a fixit job, the procedure first finds the list of targets
on which there are active events registered and then deletes this job
against all the targets on which there are no active events registered
*/
procedure deleteJobsAgainstTargets( 
                                userName             IN VARCHAR2,                                    
                                isSuperUser          IN INTEGER,
                                jobIds               IN SMP_VD_INTEGERARRAY,
                                timeStampVal         IN INTEGER,
                                timeStampValAsDate   IN DATE,
                                timeZoneVal          IN INTEGER,
                                domainVal            IN VARCHAR2,
                                targetNames          IN SMP_VD_STRINGARRAY,
                                allTargets           IN VARCHAR2,
                                targetCount          IN SMP_VD_INTEGERARRAY,
                                noPermissionsArray   OUT SMP_VD_INTEGERARRAY,
                                activeFixitJobsArray OUT SMP_VD_INTEGERARRAY,
                                invalidJobIdsArray   OUT SMP_VD_INTEGERARRAY);

/*
Determine if the job id is invalid
This function takes in the job id, the user name and does a select statement 
on smp_vdj_job_per_target to determine the validity of the job id though a 
select on any other appropriate job table could also have been used
This function will return a negative value if the job id is invalid and a
positive value(the job id value itself) if the job id is valid
*/                                
function isJobIdValid(
                        jId INTEGER,
                        userName VARCHAR2) return INTEGER;
                                                    
/*
Get the privilege for the job with the given job id and the given 
user name. 
This function returns the privilege of the user - userName for the job -
job_id. The privilege returned is NONE OR VIEW OR MODIFY OR FULL
*/
function getPrivilegeForJob( 
                                jId INTEGER,
                                userName VARCHAR2) return VARCHAR;

/*
Determine if the job is fixit
Returns 1 is the job is fixit, 0 otherwise
*/
function isJobFixit(
                    jId INTEGER ) return VARCHAR;
                    
/*
Populate the toDeleteTNames array
This procedure populates the array with the target names against which this job
will be deleted. Note that this procedure will populate the toDeleteTNames
array considering the target names in the activeEvtTNames array. For a non-fixit
job, the activeEvtTNames array will be empty and so the job against all the 
targets for this job will be deleted. However, for a fixit job, the length of
activeEvtTNames array can be = 0 or > 0. If the size of activeEvtTNames=0, then
for this fixit job too, the job will be deleted against all the targets. However
if the size of activeEvtTNames>0, then this fixit job will be deleted only
against those targets populated in toDeleteTNames
Note: this function only populates the array - toDeleteTNames with the target 
names and later this job will be deleted against the targets whose names are 
populated in the toDeleteTNames array
*/
procedure populateToDeleteTNames(
                        jId IN INTEGER,
                        isFixit IN VARCHAR2,
                        activeEvtTNames IN SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY,
                        toDeleteTNamesExpired OUT SMP_VD_STRINGARRAY);
                        
procedure populateToDeleteTNamesSubset(
                        jId IN INTEGER,
                        isFixit IN VARCHAR2,
                        activeEvtTNames IN SMP_VD_STRINGARRAY,
                        deleteTNames IN SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY,
                        toDeleteTNamesExpired OUT SMP_VD_STRINGARRAY);
                        
/*
Lock the rows on those targets against which the job(fixit or non fixit) will
be deleted. In the process of locking the rows, this procedure also gets the
node names, execution number and the target type, stores them in the respective
arrays and returns them as out parameters. The node names, target type, 
execution numbers are used later in the other steps
*/
procedure lockRows(
                jId IN INTEGER,
                toDeleteTNames IN OUT SMP_VD_STRINGARRAY,
                nodeNames OUT SMP_VD_STRINGARRAY,
                execNumArray OUT SMP_VD_INTEGERARRAY,
                targetType OUT VARCHAR2);

/*
Update the status of the job against those targets that this job will be deleted
The target names are taken from the toDeleteTNames array that has the list of
all targets against which this job(fixit or non-fixit) will be deleted. 
The status will be updated to 13(job status deleting)
*/
procedure updateStatus(
                jId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                toDeleteTNamesExpired IN SMP_VD_STRINGARRAY );
                                
/*
Submit operations on those targets against which the job will be deleted. The
target names are taken from the toDeleteTNames array that has the list of
all targets against which this job(fixit or non-fixit) will be deleted. 
Operations of type "DeleteJob" will be submitted
*/
procedure submitOperations(
                jId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                userName IN VARCHAR2);


/*
Insert UI notifications for those targets that this job will be deleted against.
The target names are taken from the toDeleteTNames array that has the list of
all targets against which this job(fixit or non-fixit) will be deleted.
*/
procedure insertUINotifications(
                jId IN INTEGER,
                userName IN VARCHAR2,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                targetType IN VARCHAR2,
                timeStampVal IN INTEGER,
                timeZoneVal IN INTEGER,
                domainVal IN VARCHAR2);
                
/*
Insert log entry for those targets that this job will be deleted against.
The target names are taken from the toDeleteTNames array that has the list of
all targets against which this job(fixit or non-fixit) will be deleted.
*/
procedure insertLogEntry(
                jId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                execNumArray IN SMP_VD_INTEGERARRAY,
                timeStampValAsDate IN DATE,
                timeZoneVal IN INTEGER);

/**
 * This method is called when a clearHistoryTruncate operation is processed after
 * the job_log and job_output tables are truncated.
 * This cleans up all entries corresponding to the deleted logs.
 */
procedure processClearHistoryAfterTrunc(batchSize IN integer);

/**
 * This method is called when a clearHistoryMark operation is processed after
 * entries in the job_log and job_output tables are marked for deletion.
 * This deletes the marked entries, and cleans up all entries corresponding 
 * to the deleted logs.
 */
procedure processClearHistoryAfterMark(batchSize IN integer);

end SMP_VDJ;

/
--------------------------------------------------------
--  DDL for Package SMP_VDM_NOTIFICATION_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDM_NOTIFICATION_PKG" 
AS
    /* constants for verbose flag  */
    verboseValueTrue  constant INTEGER := 1;
    verboseValueFalse constant INTEGER := 0;
    /* constants for enhanced notification info */
    enhancedNotifTrue  constant INTEGER := 1;
    enhancedNotifFalse constant INTEGER := 0;
    /* constants for notification type */
    badNotification constant INTEGER      := -1;
    jobNotification constant INTEGER      := 1;
    eventNotification constant INTEGER    := 2;
    targetNotification constant INTEGER   := 3;
    appNotification constant INTEGER      := 4;
    testNotification constant INTEGER     := 5;
    securityNotification constant INTEGER := 6;

    TYPE STRINGARRAY_INDXD IS TABLE OF smp_vdm_address.username%TYPE
                              INDEX BY BINARY_INTEGER;
    TYPE UI_NOTIFICATIONS_CR IS REF CURSOR;
    TYPE NOTIFICATIONS_CR IS REF CURSOR;
    SUBTYPE STRING IS smp_vdm_notification.node_name%TYPE;

    PROCEDURE insert_uinotifications (user_list        IN SMP_VD_STRINGARRAY,
                                      notificationId   IN INTEGER,
                                      notificationType IN INTEGER,
                                      subtype          IN INTEGER,
                                      nodeName         IN STRING,
                                      serviceName      IN STRING,
                                      serviceType      IN STRING,
                                      timeStamp        IN INTEGER,
                                      timeZone         IN INTEGER,
                                      verbose          IN SMALLINT,
                                      domain           IN STRING,
                                      enhancedNotif    IN SMALLINT,
                                      notif_seq_num    OUT INTEGER);

    /**
     * Like insert_uinotifications above, but allows the caller to
     * insert a set of name/value pairs. Notice that since the values
     * passed in are of type RAW, there is a limit of 2000 bytes on
     * the size of the value. This procedure cannot be used to insert
     * values larger than 2k.
     */
    PROCEDURE insert_uinotifications (user_list        IN SMP_VD_STRINGARRAY,
                                      notificationId   IN INTEGER,
                                      notificationType IN INTEGER,
                                      subtype          IN INTEGER,
                                      nodeName         IN STRING,
                                      serviceName      IN STRING,
                                      serviceType      IN STRING,
                                      timeStamp        IN INTEGER,
                                      timeZone         IN INTEGER,
                                      verbose          IN SMALLINT,
                                      domain           IN STRING,
                                      enhancedNotif    IN SMALLINT,
                                      names            IN SMP_VD_STRINGARRAY,
                                      valueLengths     IN SMP_VD_INTEGERARRAY,
                                      valueData       IN SMP_VD_RAWARRAY,
                                      notif_seq_num    OUT INTEGER);

    PROCEDURE fetch_uinotifications( sessionId IN INTEGER,
                                     batchSize IN INTEGER,
                                     notificationSequences IN OUT SMP_VD_INTEGERARRAY,
                                     newNotifications OUT SMALLINT,
                                     notifications OUT UI_NOTIFICATIONS_CR
                                   );

    FUNCTION fetch_notifications ( notificationType       INTEGER,
                                   notificationSubTypeStr VARCHAR2,
                                   notificationIdStr      VARCHAR2,
                                   notificationSeq     INTEGER  )
             RETURN NOTIFICATIONS_CR;

    FUNCTION getSQLString( user_list SMP_VD_STRINGARRAY )
             RETURN VARCHAR2;

    PROCEDURE purge_ui_notification;

    PROCEDURE reg_notif_interest(sessionId        IN INTEGER,
                                 notificationType IN SMP_VD_INTEGERARRAY);

    PROCEDURE dereg_notif_interest(sessionId        IN INTEGER,
                                   notificationType IN SMP_VD_INTEGERARRAY);
END;

/
--------------------------------------------------------
--  DDL for Package SMP_VDN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDN" AS
    type VdnCursor is ref cursor;

    /* Constants for length of target type */
    targetTypeLength constant integer := 256;
    
    groupTargetType constant varchar2(32) := 'oracle_sysman_group';

    /** Error Codes **/
    /* An attempt was made to add a group that already exists */
    groupAlreadyExists constant integer := -1;
    /* An attempt was made to add/modify a group member that does not exist */
    invalidGroupMember constant integer := -2;
    /* An attempt was made to add a group to itself */
    cycleInGroup constant integer := -3;
    /* An attempt was made to add or modify a group that does not exist */
    groupNotExist constant integer := -4;
    
    /* Return a list of  flattened targets of the specified target type */
    /* for the specified set of targets and groups. Filter out */
    /* targets that are in groups that the user has no permissions over. */
    /* If the arrays representing properties are non-empty, then only */
    /* return targets that satisfy the specified set of node and */
    /* target properties. */
    function flattenTargetList(targetNames SMP_VD_STRINGARRAY,
                               groupNames SMP_VD_STRINGARRAY, 
                               groupOwners SMP_VD_STRINGARRAY,
                               userName varchar2, 
                               isSuperUser integer,
                               targetType varchar2,
                               nodePropNames SMP_VD_STRINGARRAY,
                               nodePropValues SMP_VD_STRINGARRAY,
                               targetPropNames SMP_VD_STRINGARRAY,
                               targetPropValues SMP_VD_STRINGARRAY) 
               return VdnCursor;

    /* Like flattenTargetList, above, but returns the flattened target names
     * and node names in the specified OUT parameters. This method only
     * returns flattened targets that have an agent; the number of targets
     * that are manually configured in the flat list is returned in the
     * OUT parameter numTargetsWithoutAgents
     */
    procedure getFlatTargetsWithAgent(targetNames SMP_VD_STRINGARRAY,
                                      groupNames SMP_VD_STRINGARRAY, 
                                      groupOwners SMP_VD_STRINGARRAY,
                                      userName varchar2, 
                                      isSuperUser integer,
                                      targetType varchar2,
                                      nodePropNames SMP_VD_STRINGARRAY,
                                      nodePropValues SMP_VD_STRINGARRAY,
                                      targetPropNames SMP_VD_STRINGARRAY,
                                      targetPropValues SMP_VD_STRINGARRAY,
                                      flatTargetNames OUT SMP_VD_STRINGARRAY,
                                      nodeNames OUT SMP_VD_STRINGARRAY,
                                      numTargetsWithoutAgents OUT integer);
                                

    /* Create a new group with the specified attributes. groupNamesToAdd */
    /* is an array containing the groups to be added to this group.  */
    /* targetNamesToAdd is an array of targets to be added to this group. */
    /* */
    /* This function returns the group id (>0) on success.  */
    /* It returns the following error codes (<0) on failure: */
    /*   groupAlreadyExists  */
    /*   invalidGroupMember */
    /*   cycleInGroup  */
    /* In case of errors, the OUT parameter errorValues will contain 
       more details about the errors: 
            invalidGroupMember: errorValues(1): target name; 
                                errorValues(2): target type
    */
    function createGroup(groupName varchar2, groupOwner varchar2,
                         groupDescription varchar2, 
                         groupURL varchar2,
                         groupIconSize varchar2,
                         groupNamesToAdd SMP_VD_STRINGARRAY,
                         groupOwnersToAdd SMP_VD_STRINGARRAY,
                         groupX SMP_VD_INTEGERARRAY,
                         groupY SMP_VD_INTEGERARRAY,
                         targetNamesToAdd SMP_VD_STRINGARRAY,
                         targetTypesToAdd SMP_VD_STRINGARRAY,
                         targetX SMP_VD_INTEGERARRAY,
                         targetY SMP_VD_INTEGERARRAY,
                         errorValues OUT SMP_VD_STRINGARRAY) return integer;

    /* Modify an existing group with the specified members to be added, */
    /* modified or deleted from the group. Returns >0 on success, the */
    /* following error codes upon failure: */
    /*   invalidGroupMember */
    /*   cycleInGroup */
    /*   groupNotExist */
    /* In case of errors, the OUT parameter errorValues will contain 
       more details about the errors: 
            invalidGroupMember: errorValues(1): target name; 
                                errorValues(2): target type
    */
    function modifyGroupMembers(groupToModifyId integer,
                                groupNamesToAdd SMP_VD_STRINGARRAY,
                                groupOwnersToAdd SMP_VD_STRINGARRAY,
                                groupXToAdd SMP_VD_INTEGERARRAY,
                                groupYToAdd SMP_VD_INTEGERARRAY,
                                targetNamesToAdd SMP_VD_STRINGARRAY,
                                targetTypesToAdd SMP_VD_STRINGARRAY,
                                targetXToAdd SMP_VD_INTEGERARRAY,
                                targetYToAdd SMP_VD_INTEGERARRAY,
                                groupNamesToModify SMP_VD_STRINGARRAY,
                                groupOwnersToModify SMP_VD_STRINGARRAY,
                                groupXToModify SMP_VD_INTEGERARRAY,
                                groupYToModify SMP_VD_INTEGERARRAY,
                                targetNamesToModify SMP_VD_STRINGARRAY,
                                targetTypesToModify SMP_VD_STRINGARRAY,
                                targetXToModify SMP_VD_INTEGERARRAY,
                                targetYToModify SMP_VD_INTEGERARRAY,
                                groupNamesToDelete SMP_VD_STRINGARRAY,
                                groupOwnersToDelete SMP_VD_STRINGARRAY,
                                targetNamesToDelete SMP_VD_STRINGARRAY,
                                targetTypesToDelete SMP_VD_STRINGARRAY,
                                errorValues OUT SMP_VD_STRINGARRAY)
               return integer;

    /* Modify a group, its attributes and members to be added, modified */
    /* or deleted from the group. Returns >0 on success, the */
    /* following error codes upon failure: */
    /*   invalidGroupMember */
    /*   cycleInGroup */
    /*   groupNotExist */
    /* In case of errors, the OUT parameter errorValues will contain 
       more details about the errors: 
            invalidGroupMember: errorValues(1): target name; 
                                errorValues(2): target type
    */
    function modifyGroup(groupToModifyId integer, 
                         groupOwner varchar2,
                         groupDescription varchar2, 
                         groupURL varchar2,
                         groupIconSize varchar2,
                         groupNamesToAdd SMP_VD_STRINGARRAY,
                         groupOwnersToAdd SMP_VD_STRINGARRAY,
                         groupXToAdd SMP_VD_INTEGERARRAY,
                         groupYToAdd SMP_VD_INTEGERARRAY,
                         targetNamesToAdd SMP_VD_STRINGARRAY,
                         targetTypesToAdd SMP_VD_STRINGARRAY,
                         targetXToAdd SMP_VD_INTEGERARRAY,
                         targetYToAdd SMP_VD_INTEGERARRAY,
                         groupNamesToModify SMP_VD_STRINGARRAY,
                         groupOwnersToModify SMP_VD_STRINGARRAY,
                         groupXToModify SMP_VD_INTEGERARRAY,
                         groupYToModify SMP_VD_INTEGERARRAY,
                         targetNamesToModify SMP_VD_STRINGARRAY,
                         targetTypesToModify SMP_VD_STRINGARRAY,
                         targetXToModify SMP_VD_INTEGERARRAY,
                         targetYToModify SMP_VD_INTEGERARRAY,
                         groupNamesToDelete SMP_VD_STRINGARRAY,
                         groupOwnersToDelete SMP_VD_STRINGARRAY,
                         targetNamesToDelete SMP_VD_STRINGARRAY,
                         targetTypesToDelete SMP_VD_STRINGARRAY,
                         errorValues OUT SMP_VD_STRINGARRAY)
                 return integer;

    /* Return a string of all groups that the specified username */
    /* has permissions over. The string is of the form */
    /* "(id1)(id2)(id3)....." */
    function getAccessibleGroups(userName varchar2) return varchar2;

    /*  get_node_state  */
    /* input:   target name and target type for which to get the state  */
    /*  output:  1. whether this node is manually configured     */
    /*           2. the status of the node if the node is NOT manually */
    /*               configured */
    /*           3. the last checked ping time if the node is NOT manually */
    /*              configured and the status is 'Y' */
    /*           4. the down time if the node is NOT manually configured and */
    /*                the status is 'N' */
  PROCEDURE get_node_state(
                           oms_name           IN  VARCHAR2,
                           target_name        IN  VARCHAR2,
                           target_type        IN  VARCHAR2,
                           is_manual_cfgd     OUT INTEGER,
                           is_agent_bad       OUT INTEGER,
                           is_node_monitored  OUT INTEGER,
                           node_status        OUT VARCHAR2,
                           node_region_name   OUT VARCHAR2,
                           is_same_region     OUT INTEGER,
                           last_checked_since OUT INTEGER,
                           node_down_time     OUT DATE
                          );
END;

/
--------------------------------------------------------
--  DDL for Package SMP_VDP
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDP" AS

  DEFAULT_REGION constant VARCHAR2(8) := 'DEFAULT';

  PROCEDURE on_new_oms(new_oms IN VARCHAR2);
  PROCEDURE on_failed_oms(failed_oms IN VARCHAR2);

  PROCEDURE on_new_node(new_node in VARCHAR2, curr_oms IN VARCHAR2);
  PROCEDURE on_remove_node(remove_node in VARCHAR2);

  PROCEDURE move_node_to_region(node_name IN VARCHAR2, new_region_name IN VARCHAR2);
  PROCEDURE move_oms_to_region(oms_name IN VARCHAR2, new_region_name IN VARCHAR2);

  PROCEDURE create_region(rgn_name IN VARCHAR2);
  PROCEDURE delete_region(rgn_name IN VARCHAR2);
  PROCEDURE assign_oms_to_region(oms_name IN VARCHAR2, rgn_name IN VARCHAR2);

  /* 
     This procedure boot starps the OMS startup in DEFAULT region.
     If the OMS is already assigned to a region, it returns the regionname.
     Otherwise, if there is only one region in the enterprise and that
     DEFAULT region, then the OMS is added to that region and 
     DEFAULT is returned as reigon name
  */
  PROCEDURE check_and_add_oms(oms_name IN VARCHAR2, rgn_name OUT VARCHAR2, is_oms_assigned OUT INTEGER);

  /* Paging server procedures */
  PROCEDURE assign_pgsrv_to_region(pgsrv_name IN VARCHAR2, oms_name IN VARCHAR2);
  PROCEDURE remove_pgsrv_fm_region(pgsrv_name IN VARCHAR2);
END;

/
--------------------------------------------------------
--  DDL for Package SMP_VDS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDS" as
       -- Insert a principal named pname of the specified type
       -- ptype. pIOR is the principal IOR, and poms is the OMS
       -- the principal is logged in to.
       function insertPrincipal(pname IN varchar2,
                                ptype IN varchar2,
                                pIOR IN varchar2,
                                poms IN varchar2) return INTEGER;
end SMP_VDS;

/
--------------------------------------------------------
--  DDL for Package SMP_VDU
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDU" as

       type VduCr is REF CURSOR;

       -- Return the details for the specified set of users.
       -- Returns < 0 if one or more specified user names were
       -- incorrect, and returns the illegal user name through the
       -- out parameter illegalAdminName. If all goes well, return 0
       function getListUserDetails(users IN SMP_VD_STRINGARRAY,
                                   isSuperUser OUT SMP_VD_INTEGERARRAY,
                                   hasAccessToJob OUT SMP_VD_INTEGERARRAY,
                                   hasAccessToEvent OUT SMP_VD_INTEGERARRAY,
                                   illegalAdminName OUT varchar2) return integer;

       -- Return details for all users, returning the names in the "users"
       -- array
       procedure getAllUserDetails(users OUT SMP_VD_STRINGARRAY,
                                   isSuperUser OUT SMP_VD_INTEGERARRAY,
                                   hasAccessToJob OUT SMP_VD_INTEGERARRAY,
                                   hasAccessToEvent OUT SMP_VD_INTEGERARRAY);

       -- Return details in the OUT parameters for the specified user
       -- Returns 0 if details for the user were found, <0 otherwise
       function getUserDetail(username IN varchar2,
                              isSuperUser OUT integer,
                              hasAccessToJob OUT integer,
                              hasAccessToEvent OUT integer,
                              typeout OUT varchar2,
                              passwd OUT raw) return INTEGER;


       -- Return true if the user specified by userName has full permissions
       -- over the object specified by (objName, owner, objType).
       function hasFullPermission(userName IN varchar2,
                                  objName IN varchar2,
                                  owner IN varchar2,
                                  objType IN varchar2) return boolean;
end SMP_VDU;

/
--------------------------------------------------------
--  DDL for Package SMP_VD_UTIL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VD_UTIL" 
AS

-- constant defining the max number of elements in a single clause
maxElementsForInClause constant integer := 255;

--
-- Creates an in clause of the form ' IN ('TOKEN1', 'TOKEN2', 'TOKEN3' ...)'
--
-- IMPORTANT NOTES : 
-- 1. CONVERTS THE TOKENS TO UPPER CASE
-- 2. If the string array is empty, the IN clause is created something
--    like 'IN ( NULL )' ; Means the query will using the sql will 
--    not fail at the same time may not return any rows.
--

    FUNCTION getInList( tokens SMP_VD_STRINGARRAY )
             RETURN VARCHAR2;

--
-- Creates an in clause of the form ' IN (1, 2, 3 ...)'
--
-- IMPORTANT NOTES : 
-- 1. If the string array is empty, the IN clause is created something
--    like 'IN ( NULL )' ; Means the query will using the sql will 
--    not fail at the same time may not return any rows.
--
--
    FUNCTION getInList( tokens SMP_VD_INTEGERARRAY )
             RETURN VARCHAR2;

    -- Assign the element given by entry to the currentIndex-th element
    -- in strArray. Make space in the strArray as needed. slotsAvailable
    -- indicates the number of slots currently available in strArray.
    procedure populateStrArray(entry IN varchar2,
                            strArray IN OUT SMP_VD_STRINGARRAY,
                            slotsAvailable IN OUT integer,
                            currentIndex IN OUT integer);

    -- Assign the element given by entry to the indexObject.currentIndex-th 
    -- element in strArray. Make space in the strArray as needed. 
    -- indexObject.slotsAvailable indicates the number of slots currently 
    -- available in strArray. indexObject.numberToExtend is optional and can 
    -- be supplied by the callee and which is the size by which the strArray 
    -- gets extended when the available slots become 0. The advantage this
    -- procedure has over the previous one is that this procedure encapsulates
    -- the indexing variables from the callee/user and so results in less
    -- book keeping by the user of this procedure
    procedure populateStrArray(entry IN varchar2,
                            strArray IN OUT SMP_VD_STRINGARRAY,
                            indexObject IN OUT SMP_VD_INDEX_OBJECT);

    -- Assign the element given by entry to the currentIndex-th element
    -- in intArray. Make space in the intArray as needed. slotsAvailable
    -- indicates the number of slots currently available in intArray.
    procedure populateIntArray(entry IN integer,
                            intArray IN OUT SMP_VD_INTEGERARRAY,
                            slotsAvailable IN OUT integer,
                            currentIndex IN OUT integer);

    -- Assign the element given by entry to the indexObject.currentIndex-th 
    -- element in intArray. Make space in the intArray as needed. 
    -- indexObject.slotsAvailable indicates the number of slots currently 
    -- available in intArray. indexObject.numberToExtend is optional and can 
    -- be supplied by the callee and which is the size by which the intArray 
    -- gets extended when the available slots become 0. The advantage this
    -- procedure has over the previous one is that this procedure encapsulates
    -- the indexing variables from the callee/user and so results in less
    -- book keeping by the user of this procedure
    procedure populateIntArray(entry IN integer,
                            intArray IN OUT SMP_VD_INTEGERARRAY,
                            indexObject IN OUT SMP_VD_INDEX_OBJECT);

    -- Populate an array of SMP_VDI_OBJ_OCC. The parameters have the
    -- same meanings as in populateIntArray() above.
    procedure populateOccObjArray(entry IN SMP_VDI_OBJ_OCC,
                                  objArray IN OUT SMP_VDI_OBJ_OCC_ARRAY,
                                  indexObject IN OUT SMP_VD_INDEX_OBJECT);


    -- Trims the string array - strArray based on the value of
    -- slotsAvailable
    procedure trimStrArray(strArray IN OUT SMP_VD_STRINGARRAY,
                           slotsAvailable IN OUT INTEGER);                        

    -- Trims the string array - strArray based on the value of
    -- indexObject.slotsAvailable
    procedure trimStrArray(strArray IN OUT SMP_VD_STRINGARRAY,
                           indexObject IN OUT SMP_VD_INDEX_OBJECT);                        

    -- This takes two arrays, determines the elements of array A that
    -- are in array B and returns the resulting subset of A
    procedure getAInBArray(AArray IN SMP_VD_STRINGARRAY,
          BArray IN SMP_VD_STRINGARRAY, 
          resultArray OUT SMP_VD_STRINGARRAY,
          ignoreCase IN CHAR);

    -- This takes two arrays, determines the elements of array A that
    -- are not in array B and returns the resulting subset of A
    procedure getANotInBArray(AArray IN SMP_VD_STRINGARRAY,
          BArray IN SMP_VD_STRINGARRAY, 
          resultArray OUT SMP_VD_STRINGARRAY,
          ignoreCase IN CHAR);

    -- Sorts and returns the string array
    procedure sortStrArray(strArray IN OUT SMP_VD_STRINGARRAY,
           ignoreCase IN CHAR);

    procedure sortStrArrayRecurse(strArray IN OUT SMP_VD_STRINGARRAY,
           beginIndex IN OUT INTEGER, 
           endIndex IN OUT INTEGER,
           ignoreCase IN CHAR); 

    -- Trims the integer array - intArray based on the value of
    -- slotsAvailable
    procedure trimIntArray(intArray IN OUT SMP_VD_INTEGERARRAY,
                           slotsAvailable IN OUT INTEGER);                        

    -- Trims the integer array - intArray based on the value of
    -- indexObject.slotsAvailable
    procedure trimIntArray(intArray IN OUT SMP_VD_INTEGERARRAY,
                           indexObject IN OUT SMP_VD_INDEX_OBJECT);

    -- Trims the occurrence object array
    procedure trimOccObjArray(objArray IN OUT SMP_VDI_OBJ_OCC_ARRAY,
                              indexObject IN OUT SMP_VD_INDEX_OBJECT);

    
    -- Generate the in(or not in) clause for the given string array - strArray
    -- The user can also define other parameters in the inclauseObject.
    -- The inClauseObject can be constructed with values for the current index,
    -- number of elements to process, the column name and whether this is a
    -- "in" or "not in" clause. Look in omstypescre.sql for the definition
    -- of SMP_VD_INCLAUSE_OBJECT
    -- For a given string array which has the strings for the given column
    -- name, this function, for example, for "in" clause, generates a IN clause
    -- of the form:
    --      ( columnName IN ( item1, item2, item3, item4, ..., item255) OR
    --        columnName IN ( item256, item257, ..., item(510) ) ... )
    -- Look in procedure updateStatus in vdepkgscre.sql for a concrete
    -- usage of this function for the generation of the "in" clause
    -- If the array passed is an empty one, this function returns string of
    -- length 0
    -- NOTE: The treatment for a "not in" clause is very different from that
    -- for a "in" clause. Note that while for generating "in" clause, this 
    -- function can return more than one "IN" clause, however, for a "not in"
    -- clause, this function will return only one single "NOT IN" clause
    -- constructed out of all the elements of the string array - strArray
    -- So, for a "not in" clause, the generated "NOT IN" clause would be of the
    -- form:
    --      ( columnName NOT IN ( item1, item2, item3, item4, ..., item255) AND
    --        columnName NOT IN ( item256, item257, ..., item(510) ) ... )
    -- Look in procedure populateToDeleteTNames in vdepkgscre.sql for a 
    -- concrete usage of this function for the generation of the "not in" clause
    function getInClause( strArray SMP_VD_STRINGARRAY,
                          inClauseObject IN OUT SMP_VD_INCLAUSE_OBJECT ) RETURN VARCHAR2;

    /**
     * Works exactly like getInClause(strArray, inClauseObject), but operates
     * on integer arguments.
     */
    function getInClause(intArray SMP_VD_INTEGERARRAY,
                         inClauseObject IN OUT SMP_VD_INCLAUSE_OBJECT ) RETURN VARCHAR2;

END;

/
--------------------------------------------------------
--  DDL for Package SMP_VDV
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "INPXXADM"."SMP_VDV" as

/**
 * Check the specified list of targets and nodes to see whether their
 * preferred credentials are set. If preferred credentials are set for
 * all targets, then return true.Otherwise, return false and return 
 * the names of the targets and/or nodes for which credentials have not 
 * been set through the out parameters targetsWithNoCreds and nodesWithNoCreds.
 * Note: if default credentials for the target type have been set, then this    
 * method returns true.
 */
function checkForPreferredCredentials(userName in varchar2,
                                      targets SMP_VD_STRINGARRAY,
                                      nodes SMP_VD_STRINGARRAY,
                                      targetType varchar2,
                                      targetsWithNoCreds OUT SMP_VD_STRINGARRAY,
                                      nodesWithNoCreds OUT SMP_VD_STRINGARRAY)
       return integer;

end SMP_VDV;

/
--------------------------------------------------------
--  DDL for Package Body SMP_MAINTENANCE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_MAINTENANCE" AS


/*-------------------------------------------------------------------*/
/* Reset Sysman			                                             */
/* This procedure resets the sysman password to its initial state.   */
/* the initial value is the same as the encrypted form found in      */
/* the em base creation scripts.                                     */
/*-------------------------------------------------------------------*/
PROCEDURE reset_sysman IS
	BEGIN
		update SMP_VDU_PRINCIPALS_TABLE set password = '9ed0fa64a76b4bd912310580f74926ca'
		where principal_name = UPPER('SYSMAN');
		commit;
	END;

end SMP_MAINTENANCE;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDD
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDD" as

procedure submitOperations(ops SMP_VDD_OP_ARRAY, outgoingOp char) IS
currentTime integer;
begin
    currentTime := to_char(sysdate, 'J');

    for i in 1..ops.count loop
        insert into SMP_VDD_OPERATIONS_TABLE (request_id, request_subtype, 
               request_type, target, node, user_name, callback, timestamp, 
               outgoing, owner, sequence_num) 
         select ops(i).id, ops(i).subType, ops(i).type, ops(i).targetName, 
                 ops(i).nodeName, ops(i).userName, ops(i).callbackName, 
                 currentTime, outgoingOp, 'OP_UNALLOCATED', smp_vdd_op_seq.nextval
            from dual where rownum=1;
    end loop;
end;

end SMP_VDD;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDE" AS

/* Given the number of node downs, alerts, warnings, errors */
/* and clears for a target compute the overall severity of the */
/* target. */
function computeSeverity(numNodeDowns integer,
                         numAlerts integer,
                         numWarnings integer,
                         numErrors integer,
                         numClears integer)
    return integer IS
begin
    if numNodeDowns > 0 then return eventSeverityNodeDown; end if;
    if numAlerts > 0 then return eventSeverityAlert; end if;
    if numWarnings > 0 then return eventSeverityWarning; end if;
    if numErrors > 0 then return eventSeverityError; end if;        
    if numClears > 0 then return eventSeverityClear; end if;
    return eventSeverityUnmonitored;
end;

/* Return the overall state of all registered events for the */
/* specified target, only considering events that the specified */
/* user has permissions to view. */
function getTargetEventState(targetName in varchar2,
                             targetType in varchar2,
                             userName in varchar2,
                             isSuperUser in integer)
    return integer IS
numNodeDowns integer;

begin
    if isSuperUser = 1 then
        for crec in (SELECT 
                     SUM(DECODE(node_state, eventSeverityNodeDown, 1, 0)) "NODE_DOWN",  
                     SUM(DECODE(agent_severity, eventSeverityAlert, 1, 0)) "ALERT",  
                     SUM(DECODE(agent_severity, eventSeverityWarning, 1, 0)) "WARNING",  
                     SUM(DECODE(agent_severity, eventSeverityError, 1, 0)) "ERROR",  
                     SUM(DECODE(agent_severity, eventSeverityClear, 1, 0)) "CLEAR"  
                     FROM SMP_VDE_EVENT e, 
                          smp_vde_event_target_info i, 
                          smp_vde_event_target_state s  
                     WHERE (e.id = s.event_id) AND (s.event_id = i.event_id) 
                        AND (s.target_name = i.target_name) 
                        AND (s.target_type = i.target_type) 
                        AND (agent_status IN (eventStateRegistered, eventStateModified))
                        AND i.target_name=targetName
                        AND i.target_type=targetType) loop

            if crec.node_down is null then 
                numNodeDowns := 0;
            else 
                numNodeDowns := crec.node_down; 
            end if;

            return computeSeverity(numNodeDowns, crec.alert, crec.warning,
                                   crec.error, crec.clear);

        end loop;
        return eventSeverityUnmonitored;
    else
        for crec in (SELECT 
                     SUM(DECODE(node_state, eventSeverityNodeDown, 1, 0)) "NODE_DOWN",  
                     SUM(DECODE(agent_severity, eventSeverityAlert, 1, 0)) "ALERT",  
                     SUM(DECODE(agent_severity, eventSeverityWarning, 1, 0)) "WARNING",  
                     SUM(DECODE(agent_severity, eventSeverityError, 1, 0)) "ERROR",  
                     SUM(DECODE(agent_severity, eventSeverityClear, 1, 0)) "CLEAR"  
                     FROM SMP_VIEW_VDE_PRIV_EVENT e, 
                          smp_vde_event_target_info i, 
                          smp_vde_event_target_state s  
                     WHERE (e.id = s.event_id) AND (s.event_id = i.event_id) 
                        AND (s.target_name = i.target_name) 
                        AND (s.target_type = i.target_type) 
                        AND (agent_status IN (eventStateRegistered, eventStateModified))
                        AND e.principal_name=upper(userName)
                        AND i.target_name=targetName
                        AND i.target_type=targetType) loop

            if crec.node_down is null then 
                numNodeDowns := 0;
            else 
                numNodeDowns := crec.node_down; 
            end if;
            return computeSeverity(crec.node_down, crec.alert, crec.warning,
                                   crec.error, crec.clear);

        end loop;
        return eventSeverityUnmonitored;
    end if;
end;

function getGroupEventState(groupIdIn integer,
                            userName varchar2,
                            isSuperUser integer)
    return integer IS
numNodeDowns integer;
accessibleGidStr varchar2(20000);
begin
    if isSuperUser = 1 then
        for crec in
        (SELECT 
                sum(decode(node_state, eventSeverityNodeDown, 1, 0)) "NODE_DOWN",
                sum(decode(agent_severity, eventSeverityAlert, 1, 0)) "ALERT",
                sum(decode(agent_severity, eventSeverityWarning, 1, 0)) "WARNING",
                sum(decode(agent_severity, eventSeverityError, 1, 0)) "ERROR",
                sum(decode(agent_severity, eventSeverityClear, 1, 0)) "CLEAR"
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_TARGET_TYPE_DEFN tt,
                          SMP_VDE_EVENT e, 
                          SMP_VDE_EVENT_TARGET_INFO i, 
                          SMP_VDE_EVENT_TARGET_STATE s
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      gl1.id = groupIdIn
             AND      tl.typeid=tt.id
             AND      e.id=s.event_id
             AND      s.event_id=i.event_id
             AND      s.target_name=i.target_name
             AND      s.target_type=i.target_type
             AND      (agent_status IN (eventStateRegistered, eventStateModified))
             AND      tt.name=i.target_type
             AND      tl.name=i.target_name) loop

             if crec.node_down is null then 
                numNodeDowns := 0;
            else 
                numNodeDowns := crec.node_down; 
            end if;
            return computeSeverity(crec.node_down, crec.alert, crec.warning,
                                   crec.error, crec.clear);
        end loop;
        return eventSeverityUnmonitored;
    else
        accessibleGidStr := SMP_VDN.getAccessibleGroups(userName);

        for crec in
        (SELECT 
                sum(decode(node_state, eventSeverityNodeDown, 1, 0)) "NODE_DOWN",
                sum(decode(agent_severity, eventSeverityAlert, 1, 0)) "ALERT",
                sum(decode(agent_severity, eventSeverityWarning, 1, 0)) "WARNING",
                sum(decode(agent_severity, eventSeverityError, 1, 0)) "ERROR",
                sum(decode(agent_severity, eventSeverityClear, 1, 0)) "CLEAR"
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_TARGET_TYPE_DEFN tt,
                          SMP_VIEW_VDE_PRIV_EVENT e, 
                          SMP_VDE_EVENT_TARGET_INFO i, 
                          SMP_VDE_EVENT_TARGET_STATE s
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid AND
                      INSTR(accessibleGidStr, '('||to_char(gg.groupid)||')')>0)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      INSTR(accessibleGidStr, '('||to_char(gl2.id)||')')>0
             AND      gt.targetid = tl.id
             AND      gl1.id = groupIdIn
             AND      tl.typeid=tt.id
             AND      e.id=s.event_id
             AND      s.event_id=i.event_id
             AND      s.target_name=i.target_name
             AND      s.target_type=i.target_type
             AND      (agent_status IN (eventStateRegistered, eventStateModified))
             AND      e.principal_name=upper(userName)
             AND      tt.name=i.target_type
             AND      tl.name=i.target_name) loop

             if crec.node_down is null then 
                numNodeDowns := 0;
            else 
                numNodeDowns := crec.node_down; 
            end if;
            return computeSeverity(crec.node_down, crec.alert, crec.warning,
                                   crec.error, crec.clear);
        end loop;
        return eventSeverityUnmonitored;
                
    end if;
end;

procedure getGroupTargetEventStates(groupName in varchar2,
                                    groupOwner in varchar2,
                                    userName in varchar2,
                                    isSuperUser in integer,
                                    targetNames out SMP_VD_STRINGARRAY,
                                    targetTypes out SMP_VD_STRINGARRAY,
                                    groupNames out SMP_VD_STRINGARRAY,
                                    targetStates out SMP_VD_INTEGERARRAY,
                                    groupStates out SMP_VD_INTEGERARRAY) IS
targetNamesIndex integer := 1;
targetNamesSlotsAvail integer := 0;
targetTypesIndex integer := 1;
targetTypesSlotsAvail integer := 0;
groupNamesIndex integer := 1;
groupNamesSlotsAvail integer := 0;
targetStatesIndex integer := 1;
targetStatesSlotsAvail integer := 0;
groupStatesIndex integer := 1;
groupStatesSlotsAvail integer := 0;
targetState integer;
begin
    targetNames := SMP_VD_STRINGARRAY();
    targetTypes := SMP_VD_STRINGARRAY();
    groupNames := SMP_VD_STRINGARRAY();
    targetStates := SMP_VD_INTEGERARRAY();
    groupStates := SMP_VD_INTEGERARRAY();

    /* Loop through the targets of the group */
    for crec in (select targetName, targetType from SMP_VDN_VIEW_GROUP_TARGET
                    where lower(parentGrpName)=lower(groupName) and
                          lower(parentGrpOwner)=lower(groupOwner)) loop
        targetState := getTargetEventState(crec.targetName, crec.targetType,
                                           userName, isSuperUser);
        SMP_VD_UTIL.populateStrArray(crec.targetName, targetNames,
                                     targetNamesSlotsAvail, targetNamesIndex);
        SMP_VD_UTIL.populateStrArray(crec.targetType, targetTypes,
                                     targetTypesSlotsAvail, targetTypesIndex);
        SMP_VD_UTIL.populateIntArray(targetState, targetStates,
                                     targetStatesSlotsAvail, targetStatesIndex);
    end loop;

    /* Loop through the groups of the group */
    for crec in (select memberGrpId, memberGrpName, memberGrpOwner
                  from SMP_VDN_VIEW_GROUP_GROUP
                    where lower(parentGrpName)=lower(groupName) and
                          lower(parentGrpOwner)=lower(groupOwner)) loop
        targetState := getGroupEventState(crec.memberGrpId, 
                                          userName, isSuperUser);
        SMP_VD_UTIL.populateStrArray(upper(crec.memberGrpOwner) || ':' ||
                                     crec.memberGrpName,
                                     groupNames,
                                     groupNamesSlotsAvail,
                                     groupNamesIndex);

        SMP_VD_UTIL.populateIntArray(targetState, groupStates,
                                     groupStatesSlotsAvail,
                                     groupStatesIndex);
    end loop;

    /* Trim arrays if necessary */
    if targetNamesSlotsAvail > 0 then targetNames.trim(targetNamesSlotsAvail); end if;
    if targetTypesSlotsAvail > 0 then targetTypes.trim(targetTypesSlotsAvail); end if;
    if groupNamesSlotsAvail > 0 then groupNames.trim(groupNamesSlotsAvail); end if;
    if targetStatesSlotsAvail > 0 then targetStates.trim(targetStatesSlotsAvail); end if;
    if groupStatesSlotsAvail > 0 then groupStates.trim(groupStatesSlotsAvail); end if;

end;

procedure getTargetEventStates(targetNames in SMP_VD_STRINGARRAY,
                               targetTypes in SMP_VD_STRINGARRAY,
                               groupNames in SMP_VD_STRINGARRAY,
                               groupOwners in SMP_VD_STRINGARRAY,
                               userName in varchar2,
                               isSuperUser in integer,
                               targetStates OUT SMP_VD_INTEGERARRAY,
                               groupStates OUT SMP_VD_INTEGERARRAY) IS
groupId integer;
begin
    targetStates := SMP_VD_INTEGERARRAY();
    targetStates.extend(targetNames.count);
    groupStates := SMP_VD_INTEGERARRAY();
    groupStates.extend(groupNames.count);

    /* Loop through the targets, obtain their states */
    if targetNames.count > 0 then
        for i in 1..targetNames.count loop
            targetStates(i) := getTargetEventState(targetNames(i),
                                                   targetTypes(i),
                                                   userName, isSuperUser);
        end loop;

    end if;

    /* Loop through the groups, obtain their states */
    if groupNames.count > 0 then
        for i in 1..groupNames.count loop
            groupId := -1;
            for crec in (select id from smp_vdn_group_list where
                            name=groupNames(i) and owner=groupOwners(i)) loop
                groupId := crec.id;
                exit;
            end loop;
            groupStates(i) := getGroupEventState(groupId,
                                                 userName, isSuperUser);
        end loop;
    end if;

end;

/* Given an array of testnames in the form /company/org/prod/fname,
 * break them up into their individual components
 * Returns >0 on success, -1 on failure
 */
function getTestNameComponents(testNames IN SMP_VD_STRINGARRAY,
                               company OUT SMP_VD_STRINGARRAY,
                               org OUT SMP_VD_STRINGARRAY,
                               prod OUT SMP_VD_STRINGARRAY,
                               fname OUT SMP_VD_STRINGARRAY) return integer IS
i1 integer;
i2 integer;
i3 integer;
i4 integer;
errorIndex integer;

begin
    errorIndex := 0;
    company := SMP_VD_STRINGARRAY();
    company.extend(testNames.count);

    org := SMP_VD_STRINGARRAY();
    org.extend(testNames.count);

    prod := SMP_VD_STRINGARRAY();
    prod.extend(testNames.count);

    fname := SMP_VD_STRINGARRAY();
    fname.extend(testNames.count);

    if testNames.count > 0 then
        for i in 1..testNames.count loop
            i1 := instr(testNames(i), '/');
            if i1 = 0 then return -1; end if;

            i2 := instr(testNames(i), '/', i1+1);
            if i2 = 0 then return -1; end if;

            i3 := instr(testNames(i), '/', i2+1);
            if i3 = 0 then return -1; end if;

            i4 := instr(testNames(i), '/', i3+1);
            if i4 = 0 then return -1; end if;

            company(i) := substr(testNames(i), i1+1, i2-i1-1);
            org(i) := substr(testNames(i), i2+1, i3-i2-1);
            prod(i) := substr(testNames(i), i3+1, i4-i3-1);
            fname(i) := substr(testNames(i), i4+1);
        end loop;

    end if;
    return 1;
end;

/* Insert all necessary entries for an active (registered) event.
 * Returns 1 on success, the following error codes on failure:
 *    prefCredsNotSetError
 * If checkTargetCreds and/or checkNodeCreds is true(1) the flat target
 * list and/or node list is checked to see whether preferred credentials
 * have been set for all flat targets/nodes. If there are targets or
 * nodes that do not have preferred credentials set, then prefCredsNotSetError
 * is returned; the names of the targets/nodes are returned via the OUT
 * parameters targetsWithoutCreds and nodesWithoutCreds.
 */
function insertActiveEvent(eventName in varchar2,
                            eventId in integer,
                            eventOwner in varchar2,
                            targetType in varchar2, 
                            timeIn in DATE, 
                            timeZone in integer,
                            targetNames in SMP_VD_STRINGARRAY, 
                            groupNames in SMP_VD_STRINGARRAY, 
                            groupOwners in SMP_VD_STRINGARRAY,
                            nodePropNames in SMP_VD_STRINGARRAY, 
                            nodePropValues in SMP_VD_STRINGARRAY, 
                            targetPropNames in SMP_VD_STRINGARRAY, 
                            targetPropValues in SMP_VD_STRINGARRAY,
                            comp in SMP_VD_STRINGARRAY,
                            org in SMP_VD_STRINGARRAY,
                            prod in SMP_VD_STRINGARRAY,
                            fname in SMP_VD_STRINGARRAY,
                            nlsTestNames in SMP_VD_STRINGARRAY,
                            insertNodeUpdown in integer,
                            isNodeUpDownOnly in integer,
                            nodeUpdownNlsName in varchar2,
                            isSuperUser in integer,
                            checkTargetCreds in integer,
                            checkNodeCreds in integer,
                            targetsWithoutCreds OUT SMP_VD_STRINGARRAY,
                            nodesWithoutCreds OUT SMP_VD_STRINGARRAY,
                            numTargets OUT integer,
                            numTargetsWithoutAgents OUT integer) return integer IS
c SMP_VDN.VdnCursor;
testIndex integer := 1;
opsArray SMP_VDD_OP_ARRAY;
op varchar2(128);
targetList varchar2(32000);
cid integer;
ignore integer;
sqlStatement varchar2(32000);

flatTargetNames SMP_VD_STRINGARRAY;
nodeNames SMP_VD_STRINGARRAY;
outgoing char(1);

begin
    /* Flatten out the target list */
    SMP_VDN.getFlatTargetsWithAgent(targetNames,
                                    groupNames,
                                    groupOwners,
                                    eventOwner,
                                    isSuperUser,
                                    targetType,
                                    nodePropNames,
                                    nodePropValues,
                                    targetPropNames,
                                    targetPropValues,
                                    flatTargetNames,
                                    nodeNames,
                                    numTargetsWithoutAgents);

    if flatTargetNames.count < 1 then
       return 1;
    end if;

    targetList := smp_vd_util.getInList( flatTargetNames );
    sqlStatement := 'SELECT id FROM smp_vde_event e, ' ||
                        'smp_vde_event_target_info t ' ||
                     'WHERE e.id = t.event_id AND ' ||
                        'lower(e.name) = lower(' || '''' || eventName || '''' || ') AND ' ||
                        'lower(e.owner) = lower(' || '''' || eventOwner || '''' || ') AND ' ||
                        ' upper(t.target_name) ' || targetList  || ' AND ' ||
                        ' e.is_library = ' || '''' || 'N' || '''' || ' AND ' ||
                        ' t.agent_status != ' || eventStateDeregistered ;
    cid := dbms_sql.open_cursor;
    dbms_sql.parse(cid, sqlStatement, dbms_sql.native);

    ignore := dbms_sql.execute(cid);

    if dbms_sql.fetch_rows(cid) > 0 then
           return activeEventExistsError;
    end if;

    /* Check for preferred credentials if we have been asked to do so */
    begin
    declare targetList SMP_VD_STRINGARRAY;
            nodeList SMP_VD_STRINGARRAY;
            credsSet integer;
    begin
        if checkTargetCreds > 0 then
            targetList := flatTargetNames;
        else
            targetList := SMP_VD_STRINGARRAY();
            targetsWithoutCreds := SMP_VD_STRINGARRAY(); 
        end if;
    
        if checkNodeCreds > 0 then
            nodeList := nodeNames;
        else
            nodeList := SMP_VD_STRINGARRAY();
            nodesWithoutCreds := SMP_VD_STRINGARRAY();
        end if;

        if checkTargetCreds > 0 or checkNodeCreds > 0 then
            credsSet := SMP_VDV.checkForPreferredCredentials(eventOwner,
                                                             targetList,
                                                             nodeList,
                                                             targetType,
                                                             targetsWithoutCreds,
                                                             nodesWithoutCreds);
    
            if credsSet = 0 then return prefCredsNotSetError; end if;
        end if;
    end;
    end;

    /* Note that we do not explicitly check here for the case where 
     * flatTargetNames.count = 0. If we ended up with a flat target list, 
     * the calling code will detect the situation and throw the appropriate 
     * exception.
     */
    numTargets := flatTargetNames.count;
    opsArray := SMP_VDD_OP_ARRAY();
    opsArray.extend(flatTargetNames.count);

    for i in 1..flatTargetNames.count
    loop
       /* Insert into the SMP_VDE_EVENT_TARGET_INFO table */
       INSERT INTO smp_vde_event_target_info (event_id, 
            target_name, target_type, node_name, agent_status, 
            timestamp, timezone)
                VALUES (eventId, flatTargetNames(i), targetType, 
                        nodeNames(i), eventStateRegistrationPending, 
                        timeIn, timeZone);

        /* Insert into the SMP_VDE_EVENT_TARGET_STATE table */
        INSERT INTO smp_vde_event_target_state (event_id, target_name, 
                target_type, node_name, agent_severity, node_state)
                VALUES (eventId, flatTargetNames(i), targetType, 
                        nodeNames(i), eventSeverityClear, eventStateNodeUp);


        /* Insert into the SMP_VDE_EVENT_TARGET_DETAILS table for each task */
        if comp.count > 0 then
            testIndex := 1;
            for j in 1..comp.count loop
                INSERT INTO smp_vde_event_target_details (event_id, 
                       event_test_id, target_name, target_type, node_name, 
                       company, organization, product, filename, test_name, 
                       severity, operation)
                       VALUES (eventId, testIndex, flatTargetNames(i), 
                               targetType, 
                               nodeNames(i), comp(j), org(j), prod(j), fname(j), 
                               nlsTestNames(j), 
                               eventSeverityClear, eventOperationNone);
  
                testIndex := testIndex + 1;
            end loop;

            /* Insert the additional node updown if necessary */
            if insertNodeUpdown = 1 then
                INSERT INTO smp_vde_event_target_details (event_id, 
                       event_test_id, target_name, target_type, node_name, 
                       company, organization, product, filename, test_name, 
                       severity, operation)
                       VALUES (eventId, testIndex, flatTargetNames(i), 
                               targetType, 
                               nodeNames(i), 'oracle', 'host', 'fault', 'updown',
                               nodeUpdownNlsName,
                               eventSeverityClear, eventOperationNone);
            end if;
        end if;

        /* Create an operation for this target */
        if isNodeUpDownOnly = 1 then
            op := checkNodeUpdownOp;
            outgoing := SMP_VDD.outGoingOperationNo;
        else
            op := registerEventOp;
            outgoing := SMP_VDD.outGoingOperationYes;
        end if;

        opsArray(i) := SMP_VDD_OPERATION(eventId, 'EVENT', op,
                                 flatTargetNames(i) || '|' || targetType,
                                             nodeNames(i),
                                             eventOwner, 'vde');
                                             
    end loop;

    /* Submit operations for all these targets */
    SMP_VDD.submitOperations(opsArray, outgoing);

    return 1;
end;

procedure insertLibEvent(newEventId in integer,
                         targetType in varchar2, 
                         timeIn in date, 
                         timeZone in integer, 
                         targetNames in SMP_VD_STRINGARRAY, 
                         groupNames in SMP_VD_STRINGARRAY, 
                         groupOwners in SMP_VD_STRINGARRAY,
                         testNames in SMP_VD_STRINGARRAY) is
begin
    if targetNames.count > 0 then
        for i in 1..targetNames.count
        loop
           INSERT INTO smp_vde_event_target_info (event_id, 
                target_name, target_type, node_name, agent_status, 
                timestamp, timezone)
                    VALUES (newEventId, targetNames(i), targetType, 
                            '', -1, timeIn, timeZone);
        end loop;
    end if;

    if groupNames.count > 0 then
        for i in 1..groupNames.count 
        loop
           INSERT INTO smp_vde_event_target_info (event_id, 
                target_name, target_type, node_name, agent_status, 
                timestamp, timezone)
                    VALUES (newEventId, groupOwners(i) || ':' || groupNames(i), 
                            'oracle_sysman_group', 
                            '', -1, timeIn, timeZone);
        end loop;
    end if;

end;

/* Insert basic information and tests about an event, return
 * the new event id
 */
function insertBasicInfo(eventName varchar2,
                         eventOwner varchar2,
                         eventDescription varchar2,
                         targetType varchar2,
                         eventSchedule varchar2,
                         isLibStr varchar2,
                         fixitJobId integer,
                         fixitJobName varchar2,
                         fixitJobOwner varchar2,
                         isUnSolicited integer,
                         incompleteStatus integer,
                         snmpAttr integer,
                         testNames SMP_VD_STRINGARRAY,
                         comp OUT SMP_VD_STRINGARRAY,
                         org OUT SMP_VD_STRINGARRAY,
                         prod OUT SMP_VD_STRINGARRAY,
                         fname OUT SMP_VD_STRINGARRAY) return integer IS
newEventId integer;
isUnSolicitedStr varchar2(2);
snmpAttrStr varchar2(2);

begin
    SELECT smp_vde_event_seq.NEXTVAL into newEventId FROM DUAL where rownum=1;

    if isUnSolicited = 0 then
        isUnSolicitedStr := 'N';
    else
        isUnSolicitedStr := 'Y';
    end if;

    if snmpAttr = 0 then
        snmpAttrStr := 'N';
    else
        snmpAttrStr := 'Y';
    end if;

    /* Insert entries into the master event table */
    INSERT INTO smp_vde_event (id, name, owner, description, target_type, 
                               schedule, is_library, fixit_job_id, 
                               fixit_job_name, fixit_job_owner, 
                               is_unsolicited, incomplete, 
                               snmp_trap_attribute)
                   VALUES (newEventId, eventName, upper(eventOwner),
                           eventDescription, targetType, eventSchedule, 
                           isLibStr, fixitJobId, fixitJobName, 
                           upper(fixitJobOwner), isUnSolicitedStr, 
                           incompleteStatus, 
                           snmpAttrStr);

    /* Break up the test name into components */
    if getTestNameComponents(testNames, comp, org, prod, fname) < 0 then
        /* This should never happen; if it does, it's a bug */
        raise_application_error(-20001, 'Incorrect test format');
    end if;

    /* Insert tests */
    if testNames.count > 0 then
        for i in 1..testNames.count loop
            insert into smp_vde_event_details(event_id, test_id, company,
                                              organization, product, filename)
               values(newEventId, i, comp(i), org(i), prod(i), fname(i));
        end loop;
    end if;
    return newEventId;
end;

function insertEvent(eventName in varchar2,
                     eventOwner in varchar2,
                     eventDescription in varchar2,
                     targetType in varchar2,
                     eventSchedule in varchar2,
                     saveToLib in integer,
                     submit in integer,
                     fixitJobId in integer,
                     fixitJobName in varchar2,
                     fixitJobOwner in varchar2,
                     isUnSolicited in integer,
                     incompleteStatus in integer,
                     snmpAttr in integer,
                     timeIn in date,
                     timeZone in integer,
                     targetNames in SMP_VD_STRINGARRAY,
                     groupNames in SMP_VD_STRINGARRAY,
                     groupOwners in SMP_VD_STRINGARRAY,
                     nodePropNames in SMP_VD_STRINGARRAY,
                     nodePropValues in SMP_VD_STRINGARRAY,
                     targetPropNames in SMP_VD_STRINGARRAY,
                     targetPropValues in SMP_VD_STRINGARRAY,
                     testNames in SMP_VD_STRINGARRAY,
                     nlsTestNames in SMP_VD_STRINGARRAY,
                     insertNodeUpdown in integer,
                     isNodeUpDownOnly in integer,
                     nodeUpdownNlsName in varchar2,
                     isSuperUser in integer,
                     checkTargetCreds in integer,
                     checkNodeCreds in integer,
                     targetsWithoutCreds OUT SMP_VD_STRINGARRAY,
                     nodesWithoutCreds OUT SMP_VD_STRINGARRAY,
                     numTargets OUT integer,
                     numTargetsWithoutAgents OUT integer,
                     libEventId OUT integer,
                     activeEventId OUT integer) return integer IS
duplicateEventId integer := -1;
isLibStr varchar2(2);

/* Components of each test */
comp SMP_VD_STRINGARRAY;
org SMP_VD_STRINGARRAY;
prod SMP_VD_STRINGARRAY;
fname SMP_VD_STRINGARRAY;

ret integer;
begin
    /* Lock the event table to serialize the updates */
    lock table smp_vde_event_lock_tab in exclusive mode;

    if saveToLib = 1 then
        isLibStr := 'Y';

        /* Check whether another event exists with the same name/owner */
        for crec in (select id from smp_vde_event
                     WHERE lower(name) = lower(eventName) and
                     lower(owner) = lower(eventOwner) and
                     (is_library = 'Y')) loop
            duplicateEventId := crec.id;
            exit;
        end loop;
        
        if duplicateEventId > 0 then return libEventExistsError; end if;
        libEventId := insertBasicInfo(eventName, eventOwner, eventDescription,
                                      targetType, eventSchedule, isLibStr,
                                      fixitJobId, fixitJobName, fixitJobOwner,
                                      isUnSolicited, incompleteStatus,
                                      snmpAttr, testNames, comp, org,
                                      prod, fname);
    end if;

    if submit = 1 then
        isLibStr := 'N';

        activeEventId := insertBasicInfo(eventName, eventOwner, eventDescription,
                                         targetType, eventSchedule, isLibStr,
                                         fixitJobId, fixitJobName, fixitJobOwner,
                                         isUnSolicited, incompleteStatus,
                                         snmpAttr, testNames, comp, org,
                                         prod, fname);
    end if;

    if saveToLib = 1 then
        insertLibEvent(libEventId, targetType, timeIn, timeZone, 
                       targetNames, groupNames, groupOwners,
                       testNames);
    end if;

    if submit = 1 then
        ret := insertActiveEvent( eventName, activeEventId, eventOwner, 
                                 targetType, timeIn, 
                                 timeZone, targetNames, groupNames, groupOwners,
                                 nodePropNames, nodePropValues, 
                                 targetPropNames, targetPropValues,
                                 comp, org, prod, fname, nlsTestNames, 
                                 insertNodeUpdown,
                                 isNodeUpDownOnly, nodeUpdownNlsName, isSuperUser,
                                 checkTargetCreds, checkNodeCreds,
                                 targetsWithoutCreds, nodesWithoutCreds,
                                 numtargets,
                                 numTargetsWithoutAgents);

        if ret < 0 then return ret; end if;
    end if;

    return 1;
end;

procedure insertNotifications(eventId in integer,
                              subtype in integer,
                              timeIn in integer,
                              timeZone in integer,
                              names in SMP_VD_STRINGARRAY,
                              valueLengths in SMP_VD_INTEGERARRAY,
                              valueData in SMP_VD_RAWARRAY) IS
userList SMP_VD_STRINGARRAY;
notId integer;
eventOwner varchar2(128);

begin
    select owner into eventOwner from smp_vde_event where id=eventId;

    /* Get all users that have permissions to access the event */
    SMP_VDI.getUsersWithAccess(to_char(eventId), eventOwner, objectTypeEvent, 
                               userList);

    /* Get the targets of the event and insert notifications */
    for crec in (select target_name, target_type, node_name from 
                 smp_vde_event_target_info
                    where event_id=eventId and agent_status = subtype) loop

        SMP_VDM_NOTIFICATION_PKG.insert_uinotifications(userList, eventId,
                                                        notificationTypeEvent,
                                                        subtype, crec.node_name,
                                                        crec.target_name, 
                                                        crec.target_type,
                                                        timeIn, timeZone,
                                                        0, 'OEM', 0, 
                                                        names, valueLengths,
                                                        valueData,
                                                        notId);

    end loop;
     
end;

function isJobFixit(
                    jId INTEGER ) return VARCHAR IS
    
    isFixit VARCHAR2(1);
    
    begin
    
        /*
        initialize parameters            
        */
        isFixit := '0';
        
        for record in (
        
            select is_fixit
                from smp_vdj_job
                where job_id=jId ) loop
                    
                isFixit := record.is_fixit;
                exit;
                                    
        end loop;                      
        
        return isFixit;
        
    end;                    

function getActiveRegEvtTNames( jId INTEGER ) return SMP_VD_STRINGARRAY IS
    
    isFixit VARCHAR2(1);
    activeEvtTNames SMP_VD_STRINGARRAY;
    activeEvtIndexObject SMP_VD_INDEX_OBJECT;
    
    begin
        
        /*
        initialize parameters
        */
        activeEvtTNames := SMP_VD_STRINGARRAY();
        activeEvtIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
            
        /*
        first check to see if this is a fixit job ...
        */
        isFixit := isJobFixit( jId );    
        
        /*
        now find all the target names that the given fixit job is running on
        and that have active events registered on them and are active
        */
        if( isFixit = '1' ) then
            
            for record in (
                        
                select i.target_name
                    from smp_vde_event e,
                         smp_vde_event_target_info i
                    where e.fixit_job_id=jId and
                          e.id=i.event_id and
                          i.agent_status!=SMP_VDE.eventStateRegFailed and
                          i.agent_status!=SMP_VDE.eventStateDeregistered and
                          i.agent_status!=SMP_VDE.eventStateDeregFailed and
                          i.agent_status!=SMP_VDE.eventStateModifyFailed) loop 
                    
                    smp_vd_util.populateStrArray(record.target_name,
                                                 activeEvtTNames,
                                                 activeEvtIndexObject);
                        
            end loop;                                                                   
                                        
            /* now trim the activeEvtTNames array ... */
            smp_vd_util.trimStrArray( activeEvtTNames, activeEvtIndexObject );
        
        end if;
        
        return activeEvtTNames;
    
    end;        
    
procedure deleteEventsAgainstTargets( 
                                userName                IN VARCHAR2,                                    
                                isSuperUser             IN INTEGER,
                                forceRemove             IN INTEGER,
                                eventIds                IN SMP_VD_INTEGERARRAY,
                                timeStampVal            IN INTEGER,
                                timeStampValAsDate      IN DATE,
                                timeZoneVal             IN INTEGER,
                                domainVal               IN VARCHAR2,
                                targetNames             IN SMP_VD_STRINGARRAY,
                                allTargets              IN VARCHAR2,
                                targetCount             IN SMP_VD_INTEGERARRAY,
                                noPermissionsArray      OUT SMP_VD_INTEGERARRAY,
                                eventIdTargetNameArray  OUT SMP_VDE_EVT_OCC_ARRAY,
                                busyEventIdTNameArray   OUT SMP_VDE_EVT_OCC_ARRAY,
                                invalidEventIdArray     OUT SMP_VD_INTEGERARRAY) IS
    
    eventIdValue INTEGER;                                
    eventPriv VARCHAR2(10);
    nodeUpDownOnly INTEGER;
    tempValue INTEGER;
    noPermIndexObject SMP_VD_INDEX_OBJECT;
    invalidEvtIdIndexObject SMP_VD_INDEX_OBJECT;
    activeEvtOccTNames SMP_VD_STRINGARRAY;
    toDeleteTNames SMP_VD_STRINGARRAY;
    deleteTNames SMP_VD_STRINGARRAY;
    toDeleteTNamesFinal SMP_VD_STRINGARRAY;
    nodeNames SMP_VD_STRINGARRAY;
    targetType VARCHAR2(256);
    thisTargetIndex INTEGER;
    thisTargetCount INTEGER;
    deleteIndex INTEGER;
    j INTEGER;

    begin

        /*
        initialize OUT parameters
        */
        noPermissionsArray := SMP_VD_INTEGERARRAY();
        eventIdTargetNameArray := SMP_VDE_EVT_OCC_ARRAY();
        busyEventIdTNameArray := SMP_VDE_EVT_OCC_ARRAY();
        invalidEventIdArray := SMP_VD_INTEGERARRAY();

        /*
        initialize other parameters            
        */
        noPermIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        invalidEvtIdIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        thisTargetIndex := 1;

        for i in 1..eventIds.count loop
                                    
            /* ///////////////////////// */
            /* DETERMINE EVENT VALIDITY  */
            /* ///////////////////////// */
            eventIdValue := isEventIdValid( eventIds(i),
                                            userName );
            if( eventIdValue < 0 ) then
            
                /* 
                the event id is invalid, therefore, store the event id in the
                array which will be returned and skip the remaining steps ...
                */                
                smp_vd_util.populateIntArray( eventIds(i), 
                                              invalidEventIdArray,
                                              invalidEvtIdIndexObject );
            
            else                                              
            
                /* 
                the event id is valid, therefore, perform the remaining 
                steps ...
                */                                    
            
                /* ////////////////// */
                /* GET THE PRIVILEGE  */
                /* ////////////////// */
                /* 
                for each event id, first check for the permission
                if not super user, get privilege of user on event 
                */
                if( isSuperUser != 1 ) then

                    /* find out the privilege of the user for this event */                    
                    eventPriv := getPrivilegeForEvent( eventIds(i), 
                                                       userName);                
                                                              
                end if;

                /*
                proceed with the remaining steps only if the user is a super 
                user or the privilege is full if the user is not a super user
                */                
                if( (isSuperUser=1) or ((isSuperUser=0) and (eventPriv='FULL')) ) then
                
                    /* 
                    the user has full permissions on this event ...
                    */                
                    /* //////////////////////////////////////////////// */
                    /* DETERMINE ACTIVE EVENT OCCURRENCES TARGET NAMES  */
                    /* //////////////////////////////////////////////// */
                    if(allTargets = 'N') then
                       thisTargetCount := targetCount(i);
                       deleteTNames := SMP_VD_STRINGARRAY();
                       j := 1;
                       deleteIndex := 0;
                       while ( j <= thisTargetCount) loop
                          smp_vd_util.populateStrArray(targetNames(thisTargetIndex),
                              deleteTNames,
                              deleteIndex,
                              j);
                          thisTargetIndex := thisTargetIndex + 1;
                       end loop;
                       smp_vd_util.trimStrArray( deleteTNames, deleteIndex );
                    end if;
 
                    /*
                    now populate the activeEvtOccTNames and 
                    eventIdTargetNameArray array. 
                    the activeEvtOccTNames array will have the target names 
                    on which there are active event occurrences. 
                    */                    
                    populateActEvtOccTNames( eventIds(i), 
                                             deleteTNames,
                                             allTargets,
                                             activeEvtOccTNames );

                    /* //////////////////////////////////////////////// */
                    /* POPULATE EVENTIDTARGETNAMEARRAY ARRAY            */
                    /* //////////////////////////////////////////////// */
                    /*
                    the eventIdTargetNameArray array will have VDE_EVT_OCC_OBJECT
                    objects for those targets that have active event occurrences 
                    on them.
                    note that eventIdTargetNameArray will be populated only
                    if forceRemove=0
                    */
                    populateEvtIdTNameArray( eventIds(i),
                                             forceRemove,
                                             activeEvtOccTNames,
                                             eventIdTargetNameArray );

                    /* ///////////////////////////////// */
                    /* DETERMINE TO DELETE TARGET NAMES  */
                    /* ///////////////////////////////// */
                    /*
                    populate the target name array - toDeleteTNames.
                    this array will have target names against which the event
                    can be deleted. this target is built based on the target
                    names in array activeEvtOccTNames and on value of forceRemove
                    */
                    if (allTargets = 'Y') then
                      populateToDeleteTNames( eventIds(i), 
                                            forceRemove,
                                            activeEvtOccTNames,
                                            toDeleteTNames );
                    else
                      populateToDeleteTNamesSubset( eventIds(i), 
                                            forceRemove,
                                            deleteTNames,
                                            activeEvtOccTNames,
                                            toDeleteTNames );
                    end if;

                    /* ////////// */
                    /* LOCK ROWS  */
                    /* ////////// */
                    /* 
                    now lock the rows for those targets against which the event
                    can be deleted
                    */
                    lockRows( eventIds(i),
                              toDeleteTNames,
                              toDeleteTNamesFinal,
                              nodeNames,
                              targetType,
                              busyEventIdTNameArray );
                                                            
                    /* //////////////////////////////////////// */
                    /* DETERMINE IF EVENT IS NODE UP DOWN ONLY  */
                    /* //////////////////////////////////////// */
                    nodeUpDownOnly := isNodeUpDownOnly( eventIds(i) );
                    
                    /* ////////////// */
                    /* UPDATE STATUS  */
                    /* ////////////// */
                    /*
                    set the status of the events that are to be deleted
                    */
                    updateStatus( eventIds(i),
                                  nodeUpDownOnly,
                                  toDeleteTNamesFinal );
                    
                    /* ////////////////////////////////// */
                    /* MOVE EVENT OCCURRENCES TO HISTORY  */
                    /* ////////////////////////////////// */
                    /*
                    move event occurrences to history
                    */                                  
                    moveEvtOccToHist( eventIds(i),
                                      nodeUpDownOnly,
                                      forceRemove,
                                      activeEvtOccTNames );
                                      
                    /* ////////////////// */
                    /* SUBMIT OPERATIONS  */
                    /* ////////////////// */
                    /*
                    submit delete event operations
                    */
                    submitOperations( eventIds(i),
                                      nodeUpDownOnly,
                                      toDeleteTNamesFinal,
                                      nodeNames,
                                      userName,
                                      targetType );
          
                    /* //////////////////////// */
                    /* INSERT UI NOTIFICATIONS  */
                    /* //////////////////////// */
                    /*
                    insert ui notifications
                    */                                      
                    insertUINotifications( eventIds(i),
                                           nodeUpDownOnly,
                                           userName,
                                           toDeleteTNamesFinal,
                                           nodeNames,
                                           targetType,
                                           timeStampVal,
                                           timeZoneVal,
                                           domainVal );
                                           
                else
                
                    /* 
                    the user has no full permissions on this event, therefore, 
                    store the event id in the array which will be returned ...
                    */                
                    smp_vd_util.populateIntArray( eventIds(i),
                                                  noPermissionsArray,
                                                  noPermIndexObject );

                end if; /* end if for privilege check */
            
            end if;  /* end if for invalid event id check */
            
        end loop;            
            
        /*
        we have finished processing all the event ids, so finally trim the four 
        out arrays ...
        */
        /* trim the no permissions array */
        smp_vd_util.trimIntArray( noPermissionsArray, noPermIndexObject );
        
        /* trim the invalid event ids array */
        smp_vd_util.trimIntArray( invalidEventIdArray, invalidEvtIdIndexObject );
        
        /* no need to trim the busy event id array */
        
        /* no need to trim the event id target name array */
        
    end;

function isEventIdValid(
                        eId INTEGER,
                        userName VARCHAR2) return INTEGER IS
    
    id_value INTEGER;
    
    begin
    
        /*
        initialize parameters            
        */
        id_value := -1;

        /* 
        find out if the event id is valid 
        note, a select statement on smp_vde_event_target_info is used here to 
        determine the validity of the event id though a select on any other 
        appropriate event table could also have been used
        */                    
        for record in (
                    
            select event_id
                from smp_vde_event_target_info
                where event_id=eId and
                agent_status!=SMP_VDE.eventStateDeregistered ) loop
                
            id_value := record.event_id;
            exit;
                    
        end loop;
        
        return id_value;
        
    end;
                            
function getPrivilegeForEvent( 
                                event_id INTEGER,
                                userName VARCHAR2) return VARCHAR IS

    event_priv VARCHAR2(10);
    
    begin
 
        /*
        initialize parameters            
        */
        event_priv := 'NONE';

        /* find out the privilege of the user for this event */                    
        for record in (
                    
            select privilege
                from smp_view_vde_priv_event
                where to_char(id)=to_char(event_id) and
                      upper(principal_name)=upper(userName) ) loop
                
            event_priv := record.privilege;
            exit;
                    
        end loop;
        
        return event_priv;
                                                              
    end;                                                                                    

procedure populateActEvtOccTNames(
                        eId IN INTEGER,
                        deleteTNames       IN SMP_VD_STRINGARRAY,
                        allTargets         IN VARCHAR2,
                        activeEvtOccTNames OUT SMP_VD_STRINGARRAY) IS
    
    evtOccIndexObject SMP_VD_INDEX_OBJECT;
    inClauseObj SMP_VD_INCLAUSE_OBJECT;
    result VARCHAR2(32767);
    cid INTEGER;
    tName VARCHAR(256);
    ignore INTEGER;
    
    begin
        
        /*
        initialize OUT parameters
        */
        activeEvtOccTNames := SMP_VD_STRINGARRAY();
        
        /*
        initialize other parameters            
        */
        evtOccIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        cid := -1;
        /*
        populate the activeEvtOccTNames array 
        note that we populate the activeEvtOccTNames always because when
        moving the active evt occ to history, we need this array
        */        
        if (allTargets = 'N') then
          /*
          select only targets from the array passed in
          */
          inClauseObj := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
          result := smp_vd_util.getInClause( deleteTNames,
                                               inClauseObj );

          result := ltrim(result);
          result := rtrim(result);
           
          while( length(result) > 0 ) loop
             cid := dbms_sql.open_cursor;

             dbms_sql.parse(cid,
                 'select target_name ' ||
                 'from smp_vde_event_occurrence ' ||
                 'where event_id=' || eId || ' and ' ||
                 ' status!=' || SMP_VDE.eventOccStatusClose  || 
                 ' and ' || result, dbms_sql.native);

             dbms_sql.define_column(cid, 1, tName, 256);
             ignore := dbms_sql.execute(cid);

             loop
                if dbms_sql.fetch_rows(cid) > 0 then
                   dbms_sql.column_value(cid, 1, tName);
                   smp_vd_util.populateStrArray(tName,
                                          activeEvtOccTNames,
                                          evtOccIndexObject ); 
                else
                   exit;
                end if;
             end loop;                          
             dbms_sql.close_cursor(cid);
             cid := -1;
             /* now get the in clause again */
             result := smp_vd_util.getInClause( deleteTNames,
                                               inClauseObj );
             result := ltrim(result);
             result := rtrim(result);
          end loop;                          
        else
          for record in (
                
            select target_name
                from smp_vde_event_occurrence
                where event_id=eId and
                      status!=SMP_VDE.eventOccStatusClose ) loop
                
            smp_vd_util.populateStrArray( record.target_name,
                                          activeEvtOccTNames,
                                          evtOccIndexObject ); 

          end loop;                          
        end if;
  
        /* now trim the activeEvtOccTNames array ... */
        smp_vd_util.trimStrArray( activeEvtOccTNames, evtOccIndexObject );            

        exception
            when OTHERS then

            if (DBMS_SQL.is_open( cid )) then
                DBMS_SQL.close_cursor( cid );
            end if;

            raise;
    end;                        

procedure populateEvtIdTNameArray(
                        eId IN INTEGER,
                        forceRemove IN INTEGER,
                        activeEvtOccTNames IN SMP_VD_STRINGARRAY,
                        eventIdTargetNameArray IN OUT SMP_VDE_EVT_OCC_ARRAY) IS
    
    evtOccObject SMP_VDE_EVT_OCC_OBJECT;
    currIndex INTEGER;

    begin
    
        /*
        initialize parameters            
        */
        currIndex := eventIdTargetNameArray.count+1;
        
        if( forceRemove = 0 ) then
        
            for i in 1..activeEvtOccTNames.count loop
        
                evtOccObject := SMP_VDE_EVT_OCC_OBJECT( eId, activeEvtOccTNames(i) );
                eventIdTargetNameArray.extend(1);
                eventIdTargetNameArray(currIndex) := evtOccObject;
                currIndex := currIndex + 1;
                           
            end loop;
        
        end if;
            
    end;                            

procedure populateToDeleteTNamesSubset(
                        eId IN INTEGER,
                        forceRemove IN INTEGER,
                        deleteTNames IN SMP_VD_STRINGARRAY,
                        activeEvtOccTNames IN OUT SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY) IS

    toDeleteIndexObject SMP_VD_INDEX_OBJECT;
    inClauseObj SMP_VD_INCLAUSE_OBJECT;
    inResult VARCHAR2(32767);
    targetNamesClause VARCHAR2(32767);
    noOccTNames SMP_VD_STRINGARRAY;
    cid INTEGER;
    tName VARCHAR(256);
    ignore INTEGER;

    begin

        /*
        initialize OUT parameters
        */
        toDeleteTNames := SMP_VD_STRINGARRAY();
        noOccTNames := SMP_VD_STRINGARRAY();
        
        /*
        initialize other parameters            
        */
        toDeleteIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);        
        inClauseObj := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
        cid := -1;

        inResult := smp_vd_util.getInClause( deleteTNames, inClauseObj );
        inResult := ltrim(inResult);
        inResult := rtrim(inResult);        

        while( length(inResult) > 0 ) loop
           cid := dbms_sql.open_cursor;
           dbms_sql.parse(cid,
              'select target_name ' ||
              ' from smp_vde_event_target_info ' ||
              ' where event_id=' || eId ||
              ' and agent_status!=' || SMP_VDE.eventStateDeregistered ||
              ' and agent_status!=' || SMP_VDE.eventStateDeregPending ||
              ' and ' || inResult,
              dbms_sql.native);

           dbms_sql.define_column(cid, 1, tName, 256);
           ignore := dbms_sql.execute(cid);
                    
           loop
              if dbms_sql.fetch_rows(cid) > 0 then
                dbms_sql.column_value(cid, 1, tName);
                smp_vd_util.populateStrArray(tName,
                                          toDeleteTNames,
                                          toDeleteIndexObject);
              else
                exit;
              end if;
           end loop;
           dbms_sql.close_cursor(cid);
           cid := -1;
           inResult := smp_vd_util.getInClause( deleteTNames, inClauseObj );
           inResult := ltrim(inResult);
           inResult := rtrim(inResult);        
        end loop;

        smp_vd_util.trimStrArray( toDeleteTNames, toDeleteIndexObject );
            
        if( (activeEvtOccTNames.count>0) and
            (forceRemove=0) ) then
           smp_vd_util.getANotInBArray(toDeleteTNames, activeEvtOccTNames, noOccTNames, 'Y');
           toDeleteTNames := noOccTNames;
        end if;

        exception
            when OTHERS then

            if (DBMS_SQL.is_open( cid )) then
                DBMS_SQL.close_cursor( cid );
            end if;

            raise;

    end;                        

                                                                        
procedure populateToDeleteTNames(
                        eId IN INTEGER,
                        forceRemove IN INTEGER,
                        activeEvtOccTNames IN SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY) IS
    
    toDeleteIndexObject SMP_VD_INDEX_OBJECT;
    tempTNames SMP_VD_STRINGARRAY;
    result VARCHAR2(32767);
    targetNamesClause VARCHAR2(32767);
    cid INTEGER;
    tName VARCHAR(256);
    ignore INTEGER;
                    
    begin

        /*
        initialize OUT parameters
        */
        toDeleteTNames := SMP_VD_STRINGARRAY();
        
        /*
        initialize other parameters            
        */
        toDeleteIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);        
        cid := -1;
        
        cid := dbms_sql.open_cursor;
        dbms_sql.parse(cid, 
                    'select target_name ' ||
                    ' from smp_vde_event_target_info ' ||
                    ' where event_id=' || eId || 
                    ' and agent_status!=' || SMP_VDE.eventStateDeregistered ||
                    ' and agent_status!=' || SMP_VDE.eventStateDeregPending,
                    dbms_sql.native);

        dbms_sql.define_column(cid, 1, tName, 256);
        ignore := dbms_sql.execute(cid);
                    
        loop
            if dbms_sql.fetch_rows(cid) > 0 then

                dbms_sql.column_value(cid, 1, tName);
                smp_vd_util.populateStrArray(tName,
                                                 toDeleteTNames,
                                                 toDeleteIndexObject);

            else

                exit;

            end if;

        end loop;

        dbms_sql.close_cursor(cid);
        cid := -1;            

        /* now trim the toDeleteTNames array */
        smp_vd_util.trimStrArray( toDeleteTNames, toDeleteIndexObject );
    
        
        if( (activeEvtOccTNames.count>0) and 
            (forceRemove=0) ) then
            smp_vd_util.getANotInBArray(toDeleteTNames, activeEvtOccTNames, tempTNames, 'Y');                   
            toDeleteTNames := tempTNames;
        end if;

        exception 
            when OTHERS then

            if DBMS_SQL.is_open( cid ) then
                DBMS_SQL.close_cursor( cid ); 
            end if;

            raise;

    end;                        

procedure lockRows(
                eId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                todeleteTNamesFinal OUT SMP_VD_STRINGARRAY,
                nodeNames OUT SMP_VD_STRINGARRAY,
                targetType OUT VARCHAR2, 
                busyEventIdTNameArray IN OUT SMP_VDE_EVT_OCC_ARRAY ) IS
    
    toDeleteIndexObject SMP_VD_INDEX_OBJECT;
    nodeNamesIndexObject SMP_VD_INDEX_OBJECT;
    busyEvtObject SMP_VDE_EVT_OCC_OBJECT;
    currIndex INTEGER;
    errNum INTEGER;
        
    begin
    
        /*
        initialize OUT parameters
        */
        toDeleteTNamesFinal := SMP_VD_STRINGARRAY();
        nodeNames := SMP_VD_STRINGARRAY();
        targetType := '';
        currIndex := busyEventIdTNameArray.count+1;
                
        /*
        initialize other parameters            
        */
        toDeleteIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        nodeNamesIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
            
        for i in 1..toDeleteTNames.count loop
        
            begin
                            
                for record in (
                
                    select target_name, node_name, target_type
                        from smp_vde_event_target_info
                        where event_id=eId and
                              target_name=toDeleteTNames(i) and
                              agent_status!=SMP_VDE.eventStateDeregistered  
                              for update nowait ) loop                
                
                    smp_vd_util.populateStrArray( record.target_name,
                                                  toDeleteTNamesFinal,
                                                  toDeleteIndexObject );
                    smp_vd_util.populateStrArray( record.node_name,
                                                  nodeNames,
                                                  nodeNamesIndexObject );
                    targetType := record.target_type;
                    exit;                                                                                            

                end loop;
            
                exception 
                    when OTHERS then

                    /* get the error code */
                    errNum := SQLCODE;
                
                    if( errNum = -54 ) then

                        /* 
                        the event is busy, so add the event id and target name 
                        to the array 
                        */
                        busyEvtObject := SMP_VDE_EVT_OCC_OBJECT( eId, toDeleteTNames(i) );
                        busyEventIdTNameArray.extend(1);
                        busyEventIdTNameArray(currIndex) := busyEvtObject;
                        currIndex := currIndex + 1;
                        
                    else

                        raise;

                    end if;                        
                            
            end;
        end loop;
        
        /* now trim the toDeleteTNamesFinal array ... */
        smp_vd_util.trimStrArray( toDeleteTNamesFinal, toDeleteIndexObject );            

        /* now trim the nodeNames array ... */
        smp_vd_util.trimStrArray( nodeNames, nodeNamesIndexObject );            

    end;
                    
function isNodeUpDownOnly( eId IN INTEGER ) return INTEGER IS
    
    nudo INTEGER;
    
    begin
        
        /*
        initialize parameters
        */
        nudo := 0;
        
        select count(*) into nudo
            from smp_vde_event_details
            where (event_id=eId) and
                  ((upper(company)!='ORACLE') or
                   (upper(organization)!='HOST') or
                   (upper(product)!='FAULT') or
                   (upper(filename)!='UPDOWN'));
            
        if ( nudo = 0 ) then
            return 1;
        else
            return 0;
        end if;                                                                      
            
    end;

procedure updateStatus(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                toDeleteTNamesFinal IN SMP_VD_STRINGARRAY ) IS
    
    inClauseObject SMP_VD_INCLAUSE_OBJECT;
    result VARCHAR2(32767);
    targetNamesClause VARCHAR2(32767);
    cid INTEGER;
    ignore INTEGER;                    
    eventStatus INTEGER;
    
    begin
    
        /*
        initialize parameters            
        */
        inClauseObject := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
        cid := -1;
        
        if( toDeleteTNamesFinal.count > 0 ) then
        
            if( testNodeUpDownOnly = 1 ) then
                eventStatus := SMP_VDE.eventStateDeregistered;                    
            else
                eventStatus := SMP_VDE.eventStateDeregPending;        
            end if;
            
            result := smp_vd_util.getInClause( toDeleteTNamesFinal,
                                               inClauseObject );
        
            result := ltrim(result);
            result := rtrim(result);        
            while( length(result) > 0 ) loop
            
                targetNamesClause := '';
                cid :=  -1;
            
                /* construct the complete "and" clause */
                targetNamesClause := ' and ' || result;                    
            
                cid := dbms_sql.open_cursor;
                dbms_sql.parse(cid, 
                        'update smp_vde_event_target_info ' ||
                        ' set agent_status=' || eventStatus ||
                        ' where event_id=' || eId || 
                        ' and agent_status!=' || SMP_VDE.eventStateDeregistered ||
                        targetNamesClause, 
                        dbms_sql.native);

                ignore := dbms_sql.execute(cid);
                    
                dbms_sql.close_cursor(cid);
                cid := -1;            
                
                result := smp_vd_util.getInClause( toDeleteTNamesFinal,
                                                   inClauseObject );
                result := ltrim(result);
                result := rtrim(result);
            end loop;
    
        end if;
                
        exception 
            when OTHERS then

            if DBMS_SQL.is_open( cid ) then
                DBMS_SQL.close_cursor( cid ); 
            end if;

            raise;
                            
    end;                
                                
procedure moveEvtOccToHist(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                forceRemove IN INTEGER,
                activeEvtOccTNames IN SMP_VD_STRINGARRAY ) IS
                
    inClauseObject SMP_VD_INCLAUSE_OBJECT;
    result VARCHAR2(32767);
    targetNamesClause VARCHAR2(32767);
    cid INTEGER;
    ignore INTEGER;                    
    
    begin
    
        /*
        initialize parameters            
        */
        inClauseObject := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
        cid := -1;
        
        if( (forceRemove = 1) and 
            (testNodeUpDownOnly = 1) and 
            (activeEvtOccTNames.count > 0 ) ) then
        
            result := smp_vd_util.getInClause( activeEvtOccTNames,
                                               inClauseObject );
        
            result := ltrim(result);
            result := rtrim(result);        
            while( length(result) > 0 ) loop
            
                targetNamesClause := '';
                cid :=  -1;
            
                /* construct the complete "and" clause */
                targetNamesClause := ' and ' || result;                    
            
                cid := dbms_sql.open_cursor;
                dbms_sql.parse(cid, 
                        'update smp_vde_event_occurrence ' ||
                        ' set status=' || SMP_VDE.eventOccStatusClose ||
                        ' , severity=' || SMP_VDE.eventSeverityClear ||
                        ' where event_id=' || eId || 
                        ' and status!=' || SMP_VDE.eventOccStatusClose ||
                        targetNamesClause, 
                        dbms_sql.native);

                ignore := dbms_sql.execute(cid);
                    
                dbms_sql.close_cursor(cid);
                cid := -1;            
                
                /* now get the in clause again */                    
                result := smp_vd_util.getInClause( activeEvtOccTNames,
                                                   inClauseObject );
                result := ltrim(result);
                result := rtrim(result);

            end loop;        
        
        end if;
                
        exception 
            when OTHERS then

            if DBMS_SQL.is_open( cid ) then
                DBMS_SQL.close_cursor( cid ); 
            end if;

            raise;
                                    
    end;

procedure submitOperations(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                toDeleteTNamesFinal IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                userName IN VARCHAR2,
                targetType IN VARCHAR2 ) IS
    
    operation SMP_VDD_OPERATION;
    opArray SMP_VDD_OP_ARRAY;
    eventSubType VARCHAR2(32);
    outGoingOp VARCHAR2(1);
    
    begin
            
        if( toDeleteTNamesFinal.count > 0 ) then
        
            /*
            initialize parameters            
            */
            opArray := SMP_VDD_OP_ARRAY();
        
            if( testNodeUpDownOnly = 1 ) then
                eventSubType := SMP_VDD.eventSubTypeTryRemove;
                outGoingOp := SMP_VDD.outGoingOperationNo;
            else
                eventSubType := SMP_VDD.eventSubTypeDeReg;
                outGoingOp := SMP_VDD.outGoingOperationYes;
            end if;

            opArray.extend(toDeleteTNamesFinal.count);  

            for i in 1..toDeleteTNamesFinal.count loop

                operation := SMP_VDD_OPERATION( eId,
                                                SMP_VDD.eventType,
                                                eventSubType,
                                                toDeleteTNamesFinal(i) || '|' || targetType,
                                                nodeNames(i),
                                                userName,
                                                SMP_VDD.eventCallBackName );
                
                opArray(i) := operation;                            
                
            end loop;
            
            /* now finally call the SMP_VDD's submitOperations method */
            SMP_VDD.submitOperations( opArray, outGoingOp );
                                            
        end if;
                    
    end;                

procedure insertUINotifications(
                eId IN INTEGER,
                testNodeUpDownOnly IN INTEGER,
                userName IN VARCHAR2,
                toDeleteTNamesFinal IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                targetType IN VARCHAR2,
                timeStampVal IN INTEGER,
                timeZoneVal IN INTEGER,
                domainVal IN VARCHAR2) IS

    usersToNotify SMP_VD_STRINGARRAY;
    toNotifyIndexObject SMP_VD_INDEX_OBJECT;
    sequenceNum INTEGER;
    eventStatus INTEGER;
                        
    begin
    
        if( toDeleteTNamesFinal.count > 0 ) then
        
            /*
            initialize parameters            
            */
            usersToNotify := SMP_VD_STRINGARRAY();
            toNotifyIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
            sequenceNum := 0;
            
            /*
            first get the users to notify
            */
            for record in (

                select distinct principal_name user_name
                    from smp_view_vde_priv_event
                    where to_char(id)=to_char(eId)
                union
                select principal_name user_name
                    from smp_view_vdu_administrators
                    where superuser=1 ) loop
            
                smp_vd_util.populateStrArray( record.user_name,
                                              usersToNotify,
                                              toNotifyIndexObject );                    
                                              
            end loop;                                         
            
            /* trim the usersToNotify array */            
            smp_vd_util.trimStrArray( usersToNotify,
                                      toNotifyIndexObject );
                                                  
            /* 
            no need to insert ui notifications if  there are no 
            users interested in listening to them
            */
            if( usersToNotify.count > 0 ) then
    
                /* 
                the event status depends on whether the test is a node up down
                only ...
                */                
                if( testNodeUpDownOnly = 1 ) then
                    eventStatus := SMP_VDE.eventStateDeregistered;                    
                else
                    eventStatus := SMP_VDE.eventStateDeregPending;        
                end if;

                for i in 1..toDeleteTNamesFinal.count loop
                
                    sequenceNum := 0;
                    SMP_VDM_NOTIFICATION_PKG.insert_uinotifications(
                            usersToNotify,
                            eId,
                            SMP_VDM_NOTIFICATION_PKG.eventNotification,
                            eventStatus,
                            nodeNames(i),
                            toDeleteTNamesFinal(i),
                            targetType,
                            timeStampVal,
                            timeZoneVal,
                            SMP_VDM_NOTIFICATION_PKG.verboseValueFalse,
                            domainVal,
                            SMP_VDM_NOTIFICATION_PKG.enhancedNotifFalse,
                            sequenceNum );
                                                                                
                end loop;
                
            end if;
                        
        end if;
                    
    end;                        



/**
 * Recompute event states for the set of (eventid, target) pairs provided
 */
procedure recomputeEventStates IS
begin
    /* Since there are be at most one occurrence that has an overall severity
     * that is greater than clear, it is enough to clear the state table for
     * all (event, target) entries that have at least one occurrence with
     * a severity > clear that is marked for delete. Any other occurrence
     * (whose severity is clear) will not affect the state computation.
     */
    update smp_vde_event_target_state set agent_severity=15 where 
           (event_id, target_name) in 
        (select e.event_id, e.target_name from smp_vde_event_occurrence e,
            smp_vde_event_target_info i where
                i.agent_status != 208 and 
                e.event_id=i.event_id and e.target_name=i.target_name and
                e.markedForDelete=1 and e.severity > eventSeverityClear);

/*****                
    for i in 1..events.count loop
        select event_id into dummy from smp_vde_event_target_state where
            event_id=events(i).eventId and 
            lower(target_name)=lower(events(i).targetName) for update;

        SELECT  SUM(DECODE(severity, eventSeverityAlert, 1, 0)) "ALERT", 
                SUM(DECODE(severity, eventSeverityWarning, 1, 0)) "WARNING",
                SUM(DECODE(severity, eventSeverityError, 1, 0)) "ERROR"
                  into numAlerts, numWarnings, numErrors
                  FROM smp_vde_event_occurrence 
                   WHERE (markedForDelete=0) AND 
                         (event_id = events(i).eventId) AND 
                         (lower(target_name) = lower(events(i).targetName));

        if numAlerts > 0 then
            newSeverity := eventSeverityAlert;
        elsif numWarnings > 0 then
            newSeverity := eventSeverityWarning;
        elsif numErrors > 0 then
            newSeverity := eventSeverityError;
        else
            newSeverity := eventSeverityClear;
        end if;

        update smp_vde_event_target_state set agent_severity=newSeverity
            where event_id=events(i).eventId and 
                  lower(target_name) = lower(events(i).targetName);
    end loop;
*****/
end;


/**
 * Return the owner of the specified event, empty string on error
 */
function getEventOwner(eventId integer) return varchar2 IS
owner varchar2(128) := '';
begin 
    for crec in (select owner from smp_vde_event where id=eventId) loop
        owner := crec.owner;
        exit;
    end loop;

    return owner;
end;

function removeEventLogs(userName in varchar2,
                         isSuperUser IN integer,
                         timeIn integer,
                         timeZone integer,                       
                         occsToRemove SMP_VDI_OBJ_OCC_ARRAY,
                         counts out SMP_VD_INTEGERARRAY) return integer IS
inClause varchar2(30000);
cid integer;
ignore integer;
currEventId integer := -1;
currTargetName varchar2(128) := '';

/* Occurrences that the user has permissions to remove */
occsWithPerms SMP_VDI_OBJ_OCC_ARRAY := SMP_VDI_OBJ_OCC_ARRAY();
includeCurrentEventId boolean := false;
indexObject SMP_VD_INDEX_OBJECT := SMP_VD_INDEX_OBJECT(10, 0, 1);
operation SMP_VDD_OPERATION;
opArray SMP_VDD_OP_ARRAY;
eventOwner varchar2(32);
updateInClauseObject SMP_VD_INCLAUSE_OBJECT := SMP_VD_INCLAUSE_OBJECT(1, 250, 'event_occurrence_id', 1);
eventOccIds SMP_VD_INTEGERARRAY := SMP_VD_INTEGERARRAY();
begin
    /* First filter out occurrences that the user does not have 
     * permissions to remove
     */
    counts := SMP_VD_INTEGERARRAY();
    counts.extend(2);
    counts(1) := 0;
    counts(2) := 0;
    for i in 1..occsToRemove.count loop
        if currEventId != occsToRemove(i).objId then
            currEventId := occsToRemove(i).objId;
            eventOwner := getEventOwner(currEventId);
            if eventOwner = '' then
                /* The event id is invalid: the event may have been already
                 * deleted. Ignore it
                 */
                includeCurrentEventId := false;
            elsif isSuperUser = 1 then
                includeCurrentEventId := true;
            else
                includeCurrentEventId := 
                    SMP_VDU.hasFullPermission(userName, currEventId,
                                              eventOwner, 'EVENT');
            end if;

        end if;


        if includeCurrentEventId then
            SMP_VD_UTIL.populateOccObjArray(occsToRemove(i), occsWithPerms,
                                            indexObject);
            counts(2) := counts(2)+1;
        else
            counts(1) := counts(1)+1;
        end if;
    end loop;
    SMP_VD_UTIL.trimOccObjArray(occsWithPerms, indexObject);

    /* Mark all permissible occurrences for deletion */
    /* Note: we do not need the event id here since occurrence ids are
     * globally unique
     */
    eventOccIds.extend(occsWithPerms.count);
    for i in 1..occsWithPerms.count
    loop
        eventOccIds(i) := occsWithPerms(i).execNum;
    end loop;

    updateInClauseObject := SMP_VD_INCLAUSE_OBJECT(1, 250, 
                                                   'event_occurrence_id', 1);
    inClause := SMP_VD_UTIL.getInClause(eventOccIds, updateInClauseObject);

    while length(inClause) > 0 loop
        cid := dbms_sql.open_cursor();
        dbms_sql.parse(cid, 
                   'update smp_vde_event_occurrence set markedForDelete=1 ' ||
                   ' where ' || inClause,
                   dbms_sql.native);

        ignore := dbms_sql.execute(cid);
        dbms_sql.close_cursor(cid);
        cid := -1;

        /* Get the inClause for the next iteration */
        inClause := SMP_VD_UTIL.getInClause(eventOccIds, updateInClauseObject);
    end loop;

    /* Recompute states for each affected (eventid, targetname) */
    recomputeEventStates;

    /* Submit an operation to handle the actual deletion */
    operation := SMP_VDD_OPERATION(0, SMP_VDD.eventType,
                                   SMP_VDD.eventSubTypeClearHistory,
                                   'dummy',
                                   'dummy',
                                   userName,
                                   SMP_VDD.eventCallBackName);
    opArray := SMP_VDD_OP_ARRAY();
    opArray.extend(1);
    opArray(1) := operation;
    SMP_VDD.submitOperations(opArray, SMP_VDD.outGoingOperationNo);
                    
    return 1;

exception
    when others then
        if cid != -1 then
            dbms_sql.close_cursor(cid);
        end if;
        raise;
end;

procedure processClearHistory(batchSize integer) IS
numRowsDeleted integer;
secId integer;
historyPresent exception;  /* Indicates occurrences are still present */
pragma exception_init(historyPresent, -20000);
begin
    /* Delete notification details corresponding to marked logs */
    delete from smp_vdm_notification_details d
        where d.type=SMP_VDM_NOTIFICATION_PKG.eventNotification and 
            d.execnum in 
               (select event_occurrence_id from smp_vde_event_occurrence
                   where markedForDelete=1);
    commit;

    /* Delete all occurrences that are marked for delete */
    numRowsDeleted := batchSize;
    while numRowsDeleted >= batchSize loop
        delete from smp_vde_event_occurrence where markedForDelete=1
           and rownum <= batchSize;
        numRowsDeleted := SQL%rowcount;
        commit;
    end loop;

    /* Now attempt cascade delete of all events that do not have history */
    for crec in (select id from smp_vde_event e where is_library='N' and
                  not exists 
                  (select event_id from smp_vde_event_target_info where 
                    event_id=e.id and agent_status != eventStateDeregistered)
                 and not exists (select event_id from smp_vde_event_occurrence 
                     where event_id=e.id))
    loop
        begin
            delete from smp_vde_event where id=crec.id;
            delete from smp_vdi_pos where type='EVENT' and id=crec.id;
            delete from smp_vdi_target_properties where object_type='EVENT' and
                   object_id=crec.id;
            delete from smp_vdi_object_table where type='EVENT' and 
                   object_name=to_char(crec.id);
            select object_id into secId from smp_vdu_objects_table  where 
                   object_name=to_char(crec.id) and type='EVENT';
            delete from smp_vdu_privilege_table where object_oid=secId;
            delete from smp_vdu_objects_table where object_id=secId;

        exception
            /* Since it's possible that an occurrence was created between
             * when we checked and when we attempted to delete, we check
             * for this and ignore the exception
             */
            when historyPresent then
                secId:=0;  /* Dummy */

            when others then
                raise;
        end;
    end loop;
end;

function clearEventHistory(userName in varchar2,
                           isSuperUser in integer,
                           timeIn integer,
                           timeZone integer,
                           counts out SMP_VD_INTEGERARRAY) return integer IS
operation SMP_VDD_OPERATION;
opArray SMP_VDD_OP_ARRAY;
eventIdsToRemove SMP_VD_INTEGERARRAY;
begin
    counts := SMP_VD_INTEGERARRAY();
    counts.extend(2);
    if isSuperUser=1 then
        /* Mark for delete all occurrences in history */
        update smp_vde_event_occurrence set markedForDelete=1 where
          status=0;
        counts(2) := SQL%rowcount;
        counts(1) := 0;
    else
        update smp_vde_event_occurrence set markedForDelete=1 where
          status=0 and event_id in 
             (select o.object_name from smp_vdu_principals_table p,
                     smp_vdu_objects_table o, smp_vdu_privilege_table priv where
                     p.principal_name=upper(userName) and 
                     o.type='EVENT' and o.object_id=priv.object_oid and
                     p.principal_id=priv.principal_oid and
                     priv.privilege_string='FULL');
        counts(2) := SQL%rowcount;
        
        /* Get the number of records we did not delete in the previous query */
        select count(*) into counts(1) from smp_vde_event_occurrence where 
               status=0 and markedForDelete=0;
    end if;

    /* Recompute states for all events we marked */
    recomputeEventStates;

    /* Submit an operation to actually process the deletions */
    operation := SMP_VDD_OPERATION(0, SMP_VDD.eventType,
                                   SMP_VDD.eventSubTypeClearHistory,
                                   'dummy',
                                   'dummy',
                                   userName,
                                   SMP_VDD.eventCallBackName);
    opArray := SMP_VDD_OP_ARRAY();
    opArray.extend(1);
    opArray(1) := operation;
    SMP_VDD.submitOperations(opArray, SMP_VDD.outGoingOperationNo);
    return 1;
end;

end smp_vde;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDG" AS

/*-------------------------------------------------*/
/*  add_agent_node                                 */
/*    input:   host name of the node to be added   */
/*    output:  updated node table                  */
/*-------------------------------------------------*/

PROCEDURE add_agent_node(
  name IN VARCHAR2,
  nameatagent IN VARCHAR2,
  newAgentVersion IN VARCHAR2,
  timezone IN NUMBER) IS

    countnode NUMBER(6);
    countnode_lock NUMBER(6);

    BEGIN

        lock table smp_vdg_gateway_map in exclusive mode;

        select count(*) into countnode_lock 
        from smp_vdg_node_lock_table where lower(nodename) = lower(name);

        if (countnode_lock = 0) then
          insert into smp_vdg_node_lock_table values(name, SYSDATE,'');
        end if;

        select count(*) into countnode 
        from smp_vdg_node_list where lower(nodename) = lower(name);

        if (countnode = 0) then
          insert into smp_vdg_node_list 
            values (name, SYSDATE, 'none', 'UP', NULL, 0, 
                      nameatagent, timezone, 'UNK', newAgentVersion);
        else
          if not nameatagent IS NULL then
            update smp_vdg_node_list 
              set agentname = nameatagent,
                  agentversion = newAgentVersion
            where(nodename = name);
          end if;
        end if;
    END;


/*-------------------------------------------------*/
/*  remove_agent_node                              */
/*    input:   host name of the node to be deleted */
/*    output:  updated node table                  */
/*-------------------------------------------------*/

PROCEDURE remove_agent_node(name IN VARCHAR2) IS

    BEGIN
        lock table smp_vdg_gateway_map in exclusive mode;

         delete from smp_vdg_node_lock_table where lower(nodename) = lower(name);
         delete from smp_vdg_node_list where lower(nodename) = lower(name);

         /* Clean up jobs and events, if any, on the node */ 
         delete from smp_vdg_jobid_map where lower(nodename) = lower(name);
         delete from smp_vdg_eventid_map where lower(nodename) = lower(name);
    END;


PROCEDURE unregister_event(
  node_name IN VARCHAR2,
  mas_id IN INTEGER, 
  target_name IN VARCHAR2, 
  target_type IN VARCHAR2,
  agentIds OUT SMP_VD_INTEGERARRAY) IS

  agentIdIndex SMP_VD_INDEX_OBJECT;

  BEGIN
    agentIds := SMP_VD_INTEGERARRAY();

    /* 
      Mark the event as de-registered so that event notifications
      sent by agent during the de-registration are rejected.
      Those notifications will be sinked in as orphans after 
      the completion of de-registration.
    */
    update_event_reg_status(
      node_name, target_name, target_type, mas_id, DEREGN_PENDING_STAT);

    /* Remove unsolicited event entries that represent duplicate events for
       this (masid, target).  The sub-query select (agentid, nodename)
       pairs that represent duplicates.  Consequently, the first SQL
       statement removes from the eventid_map those entries that
       represent duplicates.  You don't need to contact the V1 agent
       if the test is a duplicate because somebody else is still
       interested in that test.  For those rows that are not removed
       by the first statement, they represent event tests that needs to
       be unregistered against the V1 agent. */

    DELETE FROM smp_vdg_eventid_map
    WHERE (lower(nodename) = lower(node_name)) AND
          (lower(targetname) = lower(target_name)) AND
          (lower(targettype) = lower(target_type)) AND
          (masid = mas_id) AND
          (unsolfilter > 0) AND
          (agentid, nodename) IN (SELECT m.agentid, m.nodename
                                  FROM smp_vdg_eventid_map m
                                  WHERE (lower(m.nodename) = lower(node_name))
                                        AND (m.unsolfilter > 0)
                                  GROUP BY m.agentid, m.nodename
                                  HAVING COUNT(*) > 1);

    agentIdIndex := SMP_VD_INDEX_OBJECT(10, 0, 1);
    FOR crec IN (SELECT agentid FROM smp_vdg_eventid_map 
                  WHERE (lower(nodename) = lower(node_name)) AND
                        (lower(targetname) = lower(target_name)) AND
                        (lower(targettype) = lower(target_type)) AND
                        (masid = mas_id)
                ) 
    LOOP
      smp_vd_util.populateIntArray(crec.agentid, agentIds, agentIdIndex);
    END LOOP;

    smp_vd_util.trimIntArray( agentIds, agentIdIndex );

  END;


FUNCTION get_event_notif_list(
  agent_id IN INTEGER, 
  node_name IN VARCHAR2,
  target_name IN VARCHAR2,
  agent_event_name IN VARCHAR2,
  notifCursor OUT VDG_CURSOR) 
  RETURN INTEGER IS

  ret INTEGER := NO_ERR;
  agent_id_match INTEGER := 0;
  exact_match INTEGER := 0;
  prev_reg_complete INTEGER;

  BEGIN

    /* 
       During regn we register only one unsolicited event 
       for all the unsolicited events regn requests against the agent.
       This is due to the limitation that more than one unsolicited
       event cannot be registered against pre 9i agents.
       So we have to fan out the notification to 
       all the unsolicited events registered against this agent.  
       Also unsolicited event notifs from pre9i agents come with agentid as 
       zero. So we can't validate them.
    */
    IF (agent_id = 0) THEN
      OPEN notifCursor FOR
        SELECT targetname, targettype, masid, 
               event_index, eventname, eventargs
        FROM smp_vdg_eventid_map
        WHERE (lower(nodename) = lower(node_name)) AND 
              (reg_complete = REGN_COMPLETE_STAT) AND 
              (unsolfilter > 0);
    ELSE

      /* pre-9i non-unsol notifs and 9i unsol and non-unsol notifs will be
         handled here */
      agent_id_match := 0;
      exact_match := 0;
      /* Check if the agent id is valid */
      FOR crec IN (SELECT agentid, targetname, agenteventname, 
                          reg_complete, eventname
                   FROM smp_vdg_eventid_map 
                   WHERE (lower(nodename) = lower(node_name)) AND 
                    (agentid = agent_id)
                  ) 
      LOOP
        agent_id_match := agent_id_match + 1;

        /* DBMS_OUTPUT.put_line('agent_id_match = '||agent_id_match); */

        /* For 9i unsol notifs we can't compare the agenteventname because
           it will not be UNSOL_EVENT_NAME. It will be whatever four part name
           the notifs was triggered with */
        IF ((lower(crec.targetname) = lower(target_name)) AND 
            ((lower(crec.agenteventname) = lower(agent_event_name))
              OR (lower(crec.eventname) = UNSOL_EVENT_NAME))
           ) THEN

          exact_match := exact_match + 1;

          IF (exact_match = 1) THEN 

            prev_reg_complete := crec.reg_complete;

          ELSIF (crec.reg_complete != DEREGN_PENDING_STAT) THEN

            /* For notifs from pre9i agent the following scenario can happen
             because the agent reuses event ids.
             If agentid matches more than one notif records
               then the records has to match these criterions
               1) There can be one or more de-regn pending records OR
               2) There can be only one regn pending record and one or more
                  deregn pending records OR
               3) There can be only one regn complete record and one or more
                  deregn pending records

               Modify the saved reg state only if the new reg status
               is not deregn pending.
               This will result in a stale notification getting mapped to the
               regn complete record. For the regn pending record the stale
               notification will get rejected until the record becomes complete
               and then it will get mapped to it.
            */
            prev_reg_complete := crec.reg_complete;

          END IF;

        END IF;
      END LOOP;

      /* DBMS_OUTPUT.put_line('exact_match = '||exact_match); */
      /* DBMS_OUTPUT.put_line('prev_reg_complete = '||prev_reg_complete); */

      IF (agent_id_match = 0) THEN

        ret := INVALID_AGENTID_ERR;

      ELSIF ((exact_match = 0) OR 
              (prev_reg_complete = DEREGN_PENDING_STAT)) THEN
        /* We will come here if
             1) there are no matching records OR
             2) there is a matching record and is in deregn pending state
           Just sink the stale notification.
        */
        ret := STALE_NOTIFS_ERR;

      END IF;

      /* Regardless of return value because an out cursor should be 
        always returned from pl/sql */
      OPEN notifCursor FOR
        SELECT targetname, targettype, masid, 
               event_index, eventname, eventargs
        FROM smp_vdg_eventid_map
        WHERE (lower(nodename) = lower(node_name)) AND (agentid = agent_id) AND
              (lower(targetname) = lower(target_name)) AND
              ( 
                (lower(agenteventname) = lower(agent_event_name)) OR 
                (lower(eventname) = UNSOL_EVENT_NAME)
              ) AND
              (reg_complete = REGN_COMPLETE_STAT);

    END IF;

    RETURN ret;
  END;


FUNCTION is_already_registered(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER)
    RETURN INTEGER IS

  row_cnt INTEGER;

  BEGIN
    row_cnt := 0;

    SELECT count(*) INTO row_cnt
    FROM smp_vdg_eventid_map
    WHERE (lower(nodename) = lower(node_name)) AND
          (lower(targetname) = lower(target_name)) AND
          (lower(targettype) = lower(target_type)) AND
          (masid = mas_id) AND
          (reg_complete = REGN_COMPLETE_STAT);

    RETURN row_cnt;

  END;

FUNCTION get_fixitjob_agentid(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER)
    RETURN INTEGER IS

  agent_id INTEGER;

  BEGIN
    agent_id := -1;

    FOR crec IN (SELECT agentid FROM smp_vdg_jobid_map 
                  WHERE (lower(nodename) = lower(node_name)) AND
                        (lower(targetname) = lower(target_name)) AND
                        (lower(targettype) = lower(target_type)) AND
                        (masid = mas_id)
                ) 
    LOOP
      agent_id := crec.agentid;
    END LOOP;

    RETURN agent_id;
  END;

FUNCTION add_event(
    modify IN INTEGER,
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    mas_fixit_jobid IN INTEGER,
    eventTestIds IN SMP_VD_INTEGERARRAY,
    unsolFilters IN SMP_VD_INTEGERARRAY,
    deletedTestIds IN SMP_VD_INTEGERARRAY,
    agentIds OUT SMP_VD_INTEGERARRAY,
    agentEventTestNames OUT SMP_VD_STRINGARRAY,
    agent_fixit_jobid OUT INTEGER) 
    RETURN INTEGER IS

  BEGIN

    agentIds := SMP_VD_INTEGERARRAY();
    agentIds.extend(eventTestIds.count);

    agentEventTestNames := SMP_VD_STRINGARRAY();
    agentEventTestNames.extend(eventTestIds.count);

    IF (modify > 0) THEN
      update_event_reg_status(
        node_name, target_name, target_type, mas_id, REGN_PENDING_STAT);
      update_event_tests_reg_status( node_name, target_name, target_type, 
        mas_id, deletedTestIds, DEREGN_PENDING_STAT);
    ELSIF (is_already_registered(
            node_name, target_name, target_type, mas_id) > 0) THEN
      RETURN ALREADY_REGISTERED_ERR;
    END IF;

    IF (mas_fixit_jobid > 0) THEN
      agent_fixit_jobid := get_fixitjob_agentid( 
            node_name, target_name, target_type, mas_fixit_jobid);
      IF (agent_fixit_jobid < 0) THEN
        RETURN INVALID_FIXITJOB_ERR;
      END IF;
    END IF;

    IF (eventTestIds.count > 0) THEN
      FOR i in 1..eventTestIds.count LOOP
        add_event_test(node_name, target_name, target_type, mas_id,
        eventTestIds(i), unsolFilters(i), agentIds(i), 
        agentEventTestNames(i));
      END LOOP;
    END IF;

    RETURN NO_ERR;
  END;

PROCEDURE add_event_test(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    mas_testid IN INTEGER,
    unsol_filter IN INTEGER,
    agent_id OUT INTEGER,
    agent_event_name OUT VARCHAR2) IS

  BEGIN

    agent_id := -2;

    FOR crec IN (SELECT agentid, agenteventname FROM smp_vdg_eventid_map 
                  WHERE (lower(targetname) = lower(target_name)) AND
                    (lower(targettype) = lower(target_type)) AND
                    (masid = mas_id) AND
                    (event_index = mas_testid)
                ) 
    LOOP
      agent_id := crec.agentid;
      agent_event_name := crec.agenteventname;
    END LOOP;

    IF (agent_id = -2) THEN
      /* The event test hasnot been registered yet */
      agent_id := -1;
      IF (unsol_filter > 0) THEN
        FOR crec IN (SELECT UNIQUE agentid FROM smp_vdg_eventid_map 
                      WHERE (lower(nodename) = lower(node_name)) AND 
                            (unsolfilter > 0)
                    ) 
        LOOP
          agent_id := crec.agentid;
        END LOOP;
      END IF;

      /* The event test is not previously registered */
      INSERT INTO smp_vdg_eventid_map
        (nodename, targetname, targettype, masid, agentid, eventname, 
          agenteventname, eventargs, event_index, unsolfilter)
      VALUES
        (node_name, target_name, target_type, mas_id, agent_id, NULL, 
          NULL, NULL, mas_testid, unsol_filter);

    END IF;

    /*
     agent_id will be 
      -1 if the event test has not been registered with agent yet.
      > 0 and is the registration id of the event test which has been
          already registered with the agent.
    */
  END;

FUNCTION update_event_test(
  node_name IN VARCHAR2,
  target_name IN VARCHAR2,
  target_type IN VARCHAR2,
  mas_id IN INTEGER,
  mas_testid IN INTEGER,
  event_name IN VARCHAR2,
  agent_event_name IN VARCHAR2,
  event_args IN VARCHAR2,
  agent_id IN INTEGER,
  agent_opn IN INTEGER) 
  RETURN INTEGER IS

  cnt INTEGER;

  BEGIN

    IF (agent_opn = ADD_AGENT_OPN) THEN
      cnt := -1;
      /* Check if the agent id is already in use  only for non 
         unsolicited event because all unsol events against a agent will
         have the same agent id
      */
      SELECT COUNT(*) INTO cnt 
      FROM smp_vdg_eventid_map
      WHERE (lower(nodename) = lower(node_name)) AND
            (agentid = agent_id) AND
            (reg_complete != DEREGN_PENDING_STAT) AND
            (unsolfilter = 0);

      IF (cnt > 0) THEN

        UPDATE smp_vdg_node_list
        SET agentstate = 'BAD'
        WHERE (lower(nodename) = lower(node_name));

        RETURN AGENT_STATE_BAD_ERR;
      END IF;
    END IF;

    UPDATE smp_vdg_eventid_map
    SET eventname = event_name, agenteventname = agent_event_name,
        eventargs = NULL, agentid = agent_id
    WHERE (lower(nodename) = lower(node_name)) AND
          (lower(targetname) = lower(target_name)) AND
          (lower(targettype) = lower(target_type)) AND
          (masid = mas_id) AND
          (event_index = mas_testid);

    /* Store the args only for unsol events, because we need them to filter */
    UPDATE smp_vdg_eventid_map
    SET eventargs = event_args
    WHERE (lower(nodename) = lower(node_name)) AND
          (lower(targetname) = lower(target_name)) AND
          (lower(targettype) = lower(target_type)) AND
          (masid = mas_id) AND
          (event_index = mas_testid) AND
          (unsolfilter > 0);

    RETURN NO_ERR;
  END;


PROCEDURE update_event_tests_reg_status(
  node_name IN VARCHAR2,
  target_name IN VARCHAR2,
  target_type IN VARCHAR2,
  mas_id IN INTEGER,
  testIds IN SMP_VD_INTEGERARRAY,
  reg_status INTEGER) IS

  cid INTEGER := -1;
  ignore INTEGER := -1;
  ids dbms_sql.number_table;

  BEGIN

    IF (testIds.count = 0) THEN
      RETURN;
    END IF;

    FOR i in 1..testIds.count LOOP
      ids(i) := testIds(i);
    END LOOP;

    cid := DBMS_SQL.OPEN_CURSOR;

    DBMS_SQL.PARSE(cid, 
      'UPDATE smp_vdg_eventid_map ' ||
      'SET reg_complete = :rg ' ||
      'WHERE (lower(nodename) = lower(:nn)) AND ' ||
      '(lower(targetname) = lower(:tn)) AND ' ||
      '(lower(targettype) = lower(:tt)) AND ' ||
      '(masid = :mid) AND (event_index in (:ei))',
      DBMS_SQL.NATIVE);
    
    DBMS_SQL.BIND_VARIABLE(cid, ':rg', reg_status);
    DBMS_SQL.BIND_VARIABLE(cid, ':nn', node_name);
    DBMS_SQL.BIND_VARIABLE(cid, ':tn', target_name);
    DBMS_SQL.BIND_VARIABLE(cid, ':tt', target_type);
    DBMS_SQL.BIND_VARIABLE(cid, ':mid', mas_id);
    DBMS_SQL.BIND_ARRAY(cid, ':ei', ids, 1, testIds.count);
    ignore := DBMS_SQL.EXECUTE(cid);

    DBMS_SQL.CLOSE_CURSOR(cid);

    EXCEPTION
      WHEN OTHERS THEN
        IF ( DBMS_SQL.IS_OPEN(cid) ) THEN
           DBMS_SQL.CLOSE_CURSOR(cid);
        END IF;
      RAISE;

  END;

PROCEDURE update_event_reg_status(
  node_name IN VARCHAR2,
  target_name IN VARCHAR2,
  target_type IN VARCHAR2,
  mas_id IN INTEGER,
  reg_status INTEGER) IS

  BEGIN
    
    UPDATE smp_vdg_eventid_map
    SET reg_complete = reg_status
    WHERE (lower(nodename) = lower(node_name)) AND
          (lower(targetname) = lower(target_name)) AND
          (lower(targettype) = lower(target_type)) AND
          (masid = mas_id);
  END;

PROCEDURE remove_event(
  node_name IN VARCHAR2,
  target_name IN VARCHAR2,
  target_type IN VARCHAR2,
  mas_id IN INTEGER) IS

  BEGIN
    DELETE FROM smp_vdg_eventid_map
    WHERE (lower(nodename) = lower(node_name)) AND (masid = mas_id) AND 
          (lower(targetname) = lower(target_name)) AND 
          (lower(targettype) = lower(target_type));

  END;

PROCEDURE remove_event_tests(
  node_name IN VARCHAR2,
  target_name IN VARCHAR2,
  target_type IN VARCHAR2,
  mas_id IN INTEGER,
  deleteTestIds IN SMP_VD_INTEGERARRAY) IS

  cid INTEGER := -1;
  ignore INTEGER := -1;
  ids dbms_sql.number_table;

  BEGIN

    IF (deleteTestIds.count = 0) THEN
      RETURN;
    END IF;

    FOR i in 1..deleteTestIds.count LOOP
      ids(i) := deleteTestIds(i);
    END LOOP;

    cid := DBMS_SQL.OPEN_CURSOR;

    DBMS_SQL.PARSE(cid, 
      'DELETE FROM smp_vdg_eventid_map ' ||
      'WHERE (lower(nodename) = lower(:nn)) AND ' ||
      '(lower(targetname) = lower(:tn)) AND ' ||
      '(lower(targettype) = lower(:tt)) AND ' ||
      '(masid = :mid) AND (event_index in (:ei))',
      DBMS_SQL.NATIVE);
    
    DBMS_SQL.BIND_VARIABLE(cid, ':nn', node_name);
    DBMS_SQL.BIND_VARIABLE(cid, ':tn', target_name);
    DBMS_SQL.BIND_VARIABLE(cid, ':tt', target_type);
    DBMS_SQL.BIND_VARIABLE(cid, ':mid', mas_id);
    DBMS_SQL.BIND_ARRAY(cid, ':ei', ids, 1, deleteTestIds.count);
    ignore := DBMS_SQL.EXECUTE(cid);

    DBMS_SQL.CLOSE_CURSOR(cid);

    EXCEPTION
      WHEN OTHERS THEN
        IF ( DBMS_SQL.IS_OPEN(cid) ) THEN
           DBMS_SQL.CLOSE_CURSOR(cid);
        END IF;
      RAISE;

  END;

FUNCTION update_event(
  node_name IN VARCHAR2,
  target_name IN VARCHAR2,
  target_type IN VARCHAR2,
  mas_id IN INTEGER,
  eventTests IN SMP_VDG_EVENT_TEST_ARRAY,
  deleteTestIds IN SMP_VD_INTEGERARRAY) 
  RETURN INTEGER IS

  ret INTEGER := NO_ERR;
  BEGIN

    IF (eventTests.count > 0) THEN
      FOR i in 1..eventTests.count LOOP
        ret := update_event_test(node_name, target_name, target_type, mas_id,
          eventTests(i).id, eventTests(i).name, eventTests(i).agentName, 
          eventTests(i).args, eventTests(i).agentId, eventTests(i).agentOpn);
        IF (ret != NO_ERR) THEN
          EXIT;
        END IF;
      END LOOP;
    END IF;

    IF (ret = NO_ERR) THEN
      update_event_reg_status(
        node_name, target_name, target_type, mas_id, REGN_COMPLETE_STAT);
    END IF;

    IF (deleteTestIds.count > 0) THEN
      remove_event_tests(
        node_name, target_name, target_type, mas_id, deleteTestIds);
    END IF;

    RETURN ret;

  END;

  FUNCTION get_job_info(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    agent_id OUT INTEGER,
    agent_tz OUT INTEGER,
    schedule_timestamp OUT VARCHAR2)
    RETURN INTEGER IS

    jobstat INTEGER := JOB_NOT_SCHEDULED_STAT;

  BEGIN
    FOR crec IN (SELECT agentid, status, schedule_ts
                  FROM smp_vdg_jobid_map 
                  WHERE (lower(nodename) = lower(node_name)) AND 
                        (lower(targetname) = lower(target_name)) AND
                        (lower(targettype) = lower(target_type)) AND
                        (masid = mas_id)
                ) 
    LOOP
      agent_id := crec.agentid;
      schedule_timestamp := crec.schedule_ts;
      jobstat := crec.status;
    END LOOP;

    FOR crec IN (SELECT agenttz FROM smp_vdg_node_list 
                  WHERE (lower(nodename) = lower(node_name))
                ) 
    LOOP
      agent_tz := crec.agenttz;
    END LOOP;

    RETURN jobstat;
  END;

  FUNCTION add_job(
    node_name IN VARCHAR2,
    target_name IN VARCHAR2,
    target_type IN VARCHAR2,
    mas_id IN INTEGER,
    agent_id IN INTEGER,
    agent_tz IN INTEGER,
    schedule_timestamp IN VARCHAR2)
    RETURN INTEGER IS

    max_agentid INTEGER := -1;

    BEGIN

      SELECT MAX(agentid) INTO max_agentid
      FROM smp_vdg_jobid_map 
      WHERE (lower(nodename) = lower(node_name));

      /* id of a most recent job submitted with a agent should be
      always greater than the id of any of the submitted jobs currently 
      stored in gw, because agent generates job id by incrementing a 
      sequence no and the ids are not re-used if a job is deleted. */

      IF ((max_agentid  > 0) AND (agent_id <= max_agentid)) THEN
        UPDATE smp_vdg_node_list
        SET agentstate = 'BAD'
        WHERE (lower(nodename) = lower(node_name));

        RETURN AGENT_STATE_BAD_ERR;
      END IF;

      INSERT INTO smp_vdg_jobid_map
        (nodename, targetname, targettype, masid, agentid, 
          status, schedule_ts)
      VALUES
        (node_name, target_name, target_type, mas_id, agent_id, 
          JOB_SCHEDULED_STAT, schedule_timestamp);

      /* Update the timezone of the agent */
      /* This is needed because this is the only way to get timezone
         from pre9i agents. 9i and later agents send the timezone info
         with each notification */
      
      UPDATE smp_vdg_node_list
        SET agenttz = agent_tz
        WHERE (lower(nodename) = lower(node_name));

      RETURN NO_ERR;
    END;

  PROCEDURE get_event_agentids(
    node_name IN VARCHAR2,
    agentIds OUT SMP_VD_INTEGERARRAY) IS

    agentIdIndex SMP_VD_INDEX_OBJECT;

  BEGIN
    agentIds := SMP_VD_INTEGERARRAY();
    agentIdIndex := SMP_VD_INDEX_OBJECT(10, 0, 1);

    FOR crec IN (SELECT DISTINCT agentid FROM smp_vdg_eventid_map 
                  WHERE (lower(nodename) = lower(node_name)) AND 
                      (agentid > 0) AND (reg_complete != DEREGN_PENDING_STAT)
                  ORDER BY agentid
                ) 
    LOOP
        smp_vd_util.populateIntArray(crec.agentid, agentIds, agentIdIndex);
    END LOOP;

    smp_vd_util.trimIntArray( agentIds, agentIdIndex );
  END;

END smp_vdg;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDI" AS

/*----------------------------------------------------------------*/
/*  checkAndUpdateVersion                                         */
/*    Provides versioning control for objects during editing      */
/*    input: name - the unique id for this object                 */
/*           current object version.  Will be -1 if we want to    */
/*           object type (EVENT, JOB, GROUP etc)                  */
/*    output: outversion - the current version or -1 if fail      */
/*    operation: If the inversion is -1, check to see if an entry */
/*           exists.  If not, set outversion to -1 (error) else   */
/*           return the current version.  If the inversion is not */
/*           -1, compare the inversion with the version in the    */
/*           table.  If they differ, return -1.  If not,          */
/*           increment the version.                               */     
/*----------------------------------------------------------------*/
PROCEDURE checkAndUpdateVersion(
    oname IN VARCHAR2,
    objOwner IN VARCHAR2,
    otype IN VARCHAR2,
    inversion IN INTEGER,
    outversion OUT INTEGER) IS 

    c NUMBER(6);

    BEGIN

    outversion := 0;

    if(inversion < 0) then
       select count(*) into c from smp_vdi_object_table
          WHERE (lower(object_name) = lower(oname)) 
          and (lower(owner) = lower(objOwner))
          and (lower(type) = lower(otype)); 
       if(c = 0) then
          outversion := -1;
       else
          select version into outversion  from smp_vdi_object_table 
             WHERE (lower(object_name) = lower(oname)) 
             and (lower(owner) = lower(objOwner))
             and (lower(type) = lower(otype)) for update; 
       end if;
    else
        select version into outversion  from smp_vdi_object_table 
             WHERE (lower(object_name) = lower(oname)) 
             and (lower(owner) = lower(objOwner))
             and (lower(type) = lower(otype)) for update;

       if(inversion != outversion) then
          outversion := -1;
       else
          update smp_vdi_object_table
            set version = version+1
            WHERE (lower(object_name) = lower(oname)) 
            and (lower(owner) = lower(objOwner))
            and (lower(type) = lower(otype)); 
          outversion := outversion+1;
       end if; 
    end if;

 end;


procedure getUsersWithAccess(objname IN varchar2,
                             objowner IN varchar2,
                             objtype IN varchar2,
                             usersWithAccess OUT SMP_VD_STRINGARRAY) IS

indexObj SMP_VD_INDEX_OBJECT := SMP_VD_INDEX_OBJECT(10, 0, 1);
begin
    usersWithAccess := SMP_VD_STRINGARRAY();
    for crec in  (SELECT usr.principal_name "USERNAME"
         FROM   SMP_VDU_PRIVILEGE_TABLE priv, 
                SMP_VDU_PRIVILEGE_TABLE pr1, 
                (SELECT objs.object_id, objs.owner, admn.principal_id, 
                 admn.principal_name 
                  FROM SMP_VDU_OBJECTS_TABLE objs, SMP_VDU_PRINCIPALS_TABLE admn 
                    WHERE  upper(objs.object_name) = upper(objname) 
                     AND  upper(objs.TYPE)        = upper(objtype) 
                     AND  upper(objs.owner)       = upper(objowner) 
                 ) usr 
         WHERE  usr.principal_id = priv.principal_oid (+) 
          AND  usr.object_id = priv.object_oid (+) 
          AND  usr.principal_id = pr1.principal_oid (+) 
          AND  1 = pr1.object_oid (+) 
          AND  (pr1.privilege_string='IS' or 
                 (priv.privilege_string is not null 
                   and priv.privilege_string != 'NONE')) )
    loop
        SMP_VD_UTIL.populateStrArray(crec.username, usersWithAccess, indexObj);
    end loop;
    SMP_VD_UTIL.trimStrArray(usersWithAccess, indexObj);
end;

END smp_vdi;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDJ
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDJ" as

                                   
procedure removeAllJobLogs(userName IN varchar2,
                          isSuperUser IN integer,
                          counts OUT SMP_VD_INTEGERARRAY) IS

cid integer := -1;
ignore integer;
opSubType varchar2(32);
operation SMP_VDD_OPERATION;
opArray SMP_VDD_OP_ARRAY;
                
begin
        counts := SMP_VD_INTEGERARRAY(-1,-1);

        if isSuperUser = 1 then

           /* For super-users, just truncate the job log and job output */
           /* tables. Since this is DDL, use dbms_sql */
           cid := dbms_sql.open_cursor;
           dbms_sql.parse(cid, 'truncate table SMP_VDJ_JOB_OUTPUT',
                          dbms_sql.native);
           ignore := dbms_sql.execute(cid);
           dbms_sql.parse(cid, 'truncate table SMP_VDJ_JOB_LOG',
                          dbms_sql.native);
           ignore := dbms_sql.execute(cid);
           dbms_sql.close_cursor(cid);
           cid := -1;
           opSubType := SMP_VDD.jobSubTypeClearHistoryTrunc;
        else                                         
           /* Mark all rows to be removed for deletion */
           update SMP_VDJ_JOB_LOG set status=17 where
                  job_id in (select job_id from smp_view_vdj_priv_job
                             where privilege='FULL' and
                             upper(principal_name)=upper(userName));
                             
            counts(1) := SQL%rowcount;

            /* Get the number of viewable rows still in history */
            select count(*) into counts(2) from smp_vdj_job_log
               where status != 17 and job_id in 
                     (select job_id from smp_view_vdj_priv_job
                             where privilege in ('VIEW', 'MODIFY') and
                                   (status=9 or status=11) and
                             upper(principal_name)=upper(userName));
           opSubType := SMP_VDD.jobSubTypeClearHistoryMark;
        end if;

        /* Submit an operation to handle the actual deletion */
        operation := SMP_VDD_OPERATION(0, SMP_VDD.jobType,
                                       opSubType,
                                       'dummy',
                                       'dummy',
                                       userName,
                                       SMP_VDD.jobCallBackName);
        opArray := SMP_VDD_OP_ARRAY();
        opArray.extend(1);
        opArray(1) := operation;
        SMP_VDD.submitOperations(opArray, SMP_VDD.outGoingOperationNo);

EXCEPTION
    WHEN OTHERS THEN
        if cid <> -1 then
            dbms_sql.close_cursor(cid);
        end if;

        raise;
end;

function insertJob(jobName in varchar2,
                   jobOwner in varchar2,
                   isSuperUser in integer,
                   jobDescription in varchar2,
                   targetType in varchar2,
                   jobSchedule in varchar2,
                   isFixit in integer,
                   lastModifiedBy in varchar2,
                   isLibrary in integer,
                   incompleteStatus in integer,
                   timeIn in date,
                   timeZone in integer,
                   targetNames in SMP_VD_STRINGARRAY,
                   groupNames in SMP_VD_STRINGARRAY,
                   groupOwners in SMP_VD_STRINGARRAY,
                   nodePropNames in SMP_VD_STRINGARRAY,
                   nodePropValues in SMP_VD_STRINGARRAY,
                   targetPropNames in SMP_VD_STRINGARRAY,
                   targetPropValues in SMP_VD_STRINGARRAY,
                   checkTargetCreds in integer,
                   checkNodeCreds in integer,
                   targetsWithoutCreds OUT SMP_VD_STRINGARRAY,
                   nodesWithoutCreds OUT SMP_VD_STRINGARRAY,
                   numTargets OUT integer,
                   numTargetsWithoutAgents OUT integer) return integer IS
numJobs integer;
jid integer;
ignore integer;
jobFound integer;
newJobId integer;
targetNameList varchar2(20000);
c SMP_VDN.VdnCursor;

flatTargetNames SMP_VD_STRINGARRAY;
nodeNames SMP_VD_STRINGARRAY;
begin
    numTargetsWithoutAgents := 0;

    /* Lock the job table to block other updates */
    lock table smp_vdj_job_lock in exclusive mode;

    if isLibrary = 1 then
        /* Check whether there is another job with the same name/owner */
        select count(*) into numJobs from smp_vdj_job where is_lib=1
               and lower(job_name)=lower(jobName) and 
                   lower(owner)=lower(jobOwner);
        if numJobs > 0 then return libJobExistsError; end if;
    else 
        begin
        declare 
        activeJobId integer := -1;
        cursor activeJobCursor is (
               select AllJobs.job_id "JOB_ID" 
                      from 
             	    SMP_VDJ_JOB_PER_TARGET AllJobs,
             	    SMP_VDJ_JOB JobList 
                      WHERE 
                         lower(JobList.owner) = lower(jobOwner) and
             	         JobList.job_id = AllJobs.job_id  and 
             	         lower(AllJobs.job_name) = lower(jobName) and
                         lower(JobList.target_type) = lower(targetType)  and
                         AllJobs.status != jobStatusExpired and
             	         AllJobs.status != jobStatusDeleted);
        begin    

            /* Check whether there is another active job with the same 
             *  name/owner currently running
             */
            for crec in activeJobCursor loop
                activeJobId := crec.job_id;
                exit;   -- No need to loop through the whole data
            end loop;

            if activeJobId <> -1 then return activeJobExistsError; end if;
            
            /* Flatten out the target list */
            SMP_VDN.getFlatTargetsWithAgent(targetNames,
                                            groupNames,
                                            groupOwners,
                                            jobOwner,
                                            isSuperUser,
                                            targetType,
                                            nodePropNames,
                                            nodePropValues,
                                            targetPropNames,
                                            targetPropValues,
                                            flatTargetNames,
                                            nodeNames,
                                            numTargetsWithoutAgents);
        end;
        end;

    end if;

    /* Obtain a new job id */
    select smp_vdj_job_id_seq.nextval into newJobId from dual where rownum=1;

    /* Insert a row into the SMP_VDJ_JOB table */
    INSERT into SMP_VDJ_JOB  
            (job_id,              
             job_name,            
             owner,               
             description,         
             app_name,            
             target_type,         
             schedule,            
             submit_time,         
             is_fixit,            
             is_lib,              
             last_mod_by,         
             last_mod_time,       
             time_zone,           
             incomplete)
         values             
            (newJobId, jobName, jobOwner, jobDescription, 'OEM', 
            targetType, jobSchedule, timeIn, isFixit, isLibrary, 
            lastModifiedBy, timeIn, timeZone, incompleteStatus);

    if isLibrary = 1 then
        /* Insert targets into the SMP_VDJ_JOB_TARGET table */
        if targetNames.count > 0 then
            for i in 1..targetNames.count loop
                INSERT into SMP_VDJ_JOB_TARGET  
                (job_id,       
                 target_name,       
                 target_type)  
                values            
                (newJobId, targetNames(i), targetType);
            end loop;
        end if;

        /* Insert groups */
        if groupNames.count > 0 then
            for i in 1..groupNames.count loop
                insert into smp_vdj_job_target(job_id, target_name, target_type)
                       values(newJobId, 
                              groupOwners(i) || ':'|| groupNames(i), 
                              'oracle_sysman_group');
            end loop;

        end if;
    else
    begin
        declare targetList SMP_VD_STRINGARRAY;
                nodeList SMP_VD_STRINGARRAY;
                credsSet integer;
                opsArray SMP_VDD_OP_ARRAY;
        begin
        /* Check to see whether preferred credentials have been set */
        if checkTargetCreds > 0 then
            targetList := flatTargetNames;
        else
            targetList := SMP_VD_STRINGARRAY();
            targetsWithoutCreds := SMP_VD_STRINGARRAY(); 
        end if;

        if checkNodeCreds > 0 then
            nodeList := nodeNames;
        else
            nodeList := SMP_VD_STRINGARRAY();
            nodesWithoutCreds := SMP_VD_STRINGARRAY();
        end if;

        if checkTargetCreds > 0 or checkNodeCreds > 0 then
            credsSet := SMP_VDV.checkForPreferredCredentials(jobOwner,
                                                             targetList,
                                                             nodeList,
                                                             targetType,
                                                             targetsWithoutCreds,
                                                             nodesWithoutCreds);

            if credsSet = 0 then return prefCredsNotSet; end if;
        end if;
            
        numTargets := flatTargetNames.count;

        /* Insert targets into the SMP_VDJ_JOB_PER_TARGET table. Also insert
         * a log entry for each target.
         */
        if flatTargetNames.count > 0 then
            opsArray := SMP_VDD_OP_ARRAY();
            opsArray.extend(flatTargetNames.count);
            for i in 1..flatTargetNames.count loop
                INSERT into SMP_VDJ_JOB_PER_TARGET
                (job_id,          
                 target_name,     
                 job_name,        
                 target_type,     
                 node_name,       
                 exec_num,        
                 occur_time,      
                 time_zone,       
                 status)          
               values           
               (newJobId, flatTargetNames(i), jobName, targetType, 
                nodeNames(i), 0, timeIn, timeZone, jobStatusSubmitted);

                opsArray(i) := SMP_VDD_OPERATION(newJobId, 'JOB', submitJobOp,
                                                 flatTargetNames(i),
                                                 nodeNames(i),
                                                 jobOwner, 'vdj');

                insert into SMP_VDJ_JOB_LOG(job_id, target_name, exec_num,
                                            status, time_stamp, time_zone, 
                                            output_id) values
                    (newJobId, flatTargetNames(i), 0, jobStatusSubmitted,
                     timeIn, timeZone, 0);
                
            end loop;
            /* Submit operations for all these targets */
            SMP_VDD.submitOperations(opsArray, 'Y');

        end if;        
        end;
    end;
    end if;

    /* Return the job id */
    return newJobId;
end;

procedure insertNotifications(id in integer,
                              subtype in integer,
                              timeIn in integer,
                              timeZone in integer,
                              names in SMP_VD_STRINGARRAY,
                              valueLengths in SMP_VD_INTEGERARRAY,
                              valueData in SMP_VD_RAWARRAY) IS

userList SMP_VD_STRINGARRAY;
ignore integer;
jobOwner varchar2(128);
begin
    select owner into jobOwner from smp_vdj_job where job_id=id;

    /* Get all users that have permissions to access the job */
    SMP_VDI.getUsersWithAccess(to_char(id), jobOwner, objectTypeJob, 
                               userList);

    /* Obtain all the targets that the job is actively submitted against
     * and insert notifications for them
     */
    for crec in (select target_name, target_type, node_name from 
                 smp_vdj_job_per_target
                    where job_id=id and status = subtype) loop

        SMP_VDM_NOTIFICATION_PKG.insert_uinotifications(userList, id, 
                                                        notificationTypeJob,
                                                        subtype, crec.node_name,
                                                        crec.target_name, 
                                                        crec.target_type,
                                                        timeIn, timeZone,
                                                        0, 'OEM', 0, 
                                                        names, valueLengths,
                                                        valueData,
                                                        ignore);
    end loop;

end;

procedure deleteJobsAgainstTargets( 
                                userName             IN VARCHAR2,                                    
                                isSuperUser          IN INTEGER,
                                jobIds               IN SMP_VD_INTEGERARRAY,
                                timeStampVal         IN INTEGER,
                                timeStampValAsDate   IN DATE,
                                timeZoneVal          IN INTEGER,
                                domainVal            IN VARCHAR2,
                                targetNames          IN SMP_VD_STRINGARRAY,
                                allTargets           IN VARCHAR2,
                                targetCount          IN SMP_VD_INTEGERARRAY,
                                noPermissionsArray   OUT SMP_VD_INTEGERARRAY,
                                activeFixitJobsArray OUT SMP_VD_INTEGERARRAY,
                                invalidJobIdsArray   OUT SMP_VD_INTEGERARRAY) IS

    jobIdValue INTEGER;
    jobPriv VARCHAR2(10);
    isFixit VARCHAR2(1);
    noPermIndexObject SMP_VD_INDEX_OBJECT;
    activeFixitIndexObject SMP_VD_INDEX_OBJECT;
    invalidJobIndexObject SMP_VD_INDEX_OBJECT;
    activeEvtTNames SMP_VD_STRINGARRAY;
    tempActiveEvtTNames SMP_VD_STRINGARRAY;
    toDeleteTNames SMP_VD_STRINGARRAY;
    deleteTNames SMP_VD_STRINGARRAY;
    toDeleteTNamesExpired SMP_VD_STRINGARRAY;
    nodeNames SMP_VD_STRINGARRAY;
    execNumArray SMP_VD_INTEGERARRAY;
    targetType VARCHAR2(256);
    thisTargetIndex INTEGER;
    thisTargetCount INTEGER;
    deleteIndex INTEGER;
    j INTEGER;

    begin

        /*
        initialize OUT parameters
        */
        noPermissionsArray := SMP_VD_INTEGERARRAY();
        activeFixitJobsArray := SMP_VD_INTEGERARRAY();
        invalidJobIdsArray := SMP_VD_INTEGERARRAY();
        
        /*
        initialize other parameters            
        */
        noPermIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        activeFixitIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        invalidJobIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);

        thisTargetIndex := 1;
        
        for i in 1..jobIds.count loop
            
            /* /////////////////////// */
            /* DETERMINE JOB VALIDITY  */
            /* /////////////////////// */
            /*
            first deletermine if this job id is a valid one ...
            */
            jobIdValue := isJobIdValid( jobIds(i),
                                        userName );
            
            if( jobIdValue < 0 ) then
            
                /* 
                the job id is invalid, therefore, store the job id in the
                array which will be returned and skip the remaining steps ...
                */                
                smp_vd_util.populateIntArray( jobIds(i), 
                                              invalidJobIdsArray,
                                              invalidJobIndexObject );
            
            else
            
                /* 
                the job id is valid, therefore, perform the remaining 
                steps ...
                */                                    
            
                /* ////////////////// */
                /* GET THE PRIVILEGE  */
                /* ////////////////// */
                /* 
                for each job id, first check for the permission
                if not super user, get privilege of user on this job 
                */
                if( isSuperUser != 1 ) then

                    /* find out the privilege of the user for this job */                    
                    jobPriv := getPrivilegeForJob( jobIds(i), 
                                                   userName);                
                                                              
                end if;

                /*
                proceed with the remaining steps only if the user is a super 
                user or the privilege is full if the user is not a super user
                */                
                if( (isSuperUser=1) or ((isSuperUser=0) and (jobPriv='FULL')) ) then
                
                    if(allTargets = 'N') then
                       thisTargetCount := targetCount(i);
                       deleteTNames := SMP_VD_STRINGARRAY();
                       j := 1;
                       deleteIndex := 0;
                       while ( j <= thisTargetCount) loop
                          smp_vd_util.populateStrArray(targetNames(thisTargetIndex),
                              deleteTNames,
                              deleteIndex,
                              j);
                          thisTargetIndex := thisTargetIndex + 1;
                       end loop;
                       smp_vd_util.trimStrArray( deleteTNames, deleteIndex );
                    end if;
                    /* 
                    the user has full permissions on this job ...
                    */                
                    
                    /* ////////////////////////// */
                    /* DETERMINE IF JOB IS FIXIT  */
                    /* ////////////////////////// */
                    /*
                    determine if the job is a fixit job
                    */
                    isFixit := isJobFixit( jobIds(i) );
                                                
                    /* //////////////////////////////////// */
                    /* DETERMINE ACTIVE EVENT TARGET NAMES  */
                    /* //////////////////////////////////// */
                    /*
                    now first populate the activeEvtTNames array. this array
                    will consist(if this is a fixit job) of all those targets
                    on which there are active events registered. for any such
                    target found, the fixit job on that target cannnot be
                    deleted
                    */
                    activeEvtTNames := SMP_VDE.getActiveRegEvtTNames( jobIds(i) );
                                             
                    if(allTargets = 'N') then  
                       smp_vd_util.getAInBArray( deleteTNames, activeEvtTNames,
                                           tempActiveEvtTNames, 'Y' );
                       activeEvtTNames := tempActiveEvtTNames;
                    end if;
                    if( isFixit='1' and activeEvtTNames.count>0 ) then
                        /* 
                        the job is an active fixit job, therefore, store the 
                        job id in the array which will be returned ...
                        */                
                        smp_vd_util.populateIntArray(jobIDs(i),
                                                     activeFixitJobsArray,
                                                     activeFixitIndexObject);
                    
                    end if;
                    
                    /* ///////////////////////////////// */
                    /* DETERMINE TO DELETE TARGET NAMES  */
                    /* ///////////////////////////////// */
                    /*
                    populate the target name array - toDeleteTNames.
                    this array will have target names against which the job
                    can be deleted. this target is build based on the target
                    names in array activeEvtTNames and on value of isFixit
                    */
                    if(allTargets = 'Y') then
                       populateToDeleteTNames( jobIds(i), 
                                            isFixit,
                                            activeEvtTNames,
                                            toDeleteTNames,
                                            toDeleteTNamesExpired );
                    else
                       populateToDeleteTNamesSubset( jobIds(i), 
                                            isFixit,
                                            activeEvtTNames,
                                            deleteTNames,
                                            toDeleteTNames,
                                            toDeleteTNamesExpired );

                    end if;

                    /* ////////// */
                    /* LOCK ROWS  */
                    /* ////////// */
                    /* 
                    now lock the rows for those targets against which the job
                    can be deleted based on the target names in toDeleteTNames
                    array
                    */
                    lockRows( jobIds(i),
                              toDeleteTNames,
                              nodeNames,
                              execNumArray,
                              targetType );

                    /* ////////////// */
                    /* UPDATE STATUS  */
                    /* ////////////// */
                    /*
                    set the status of the jobs that are to be deleted based on
                    the target names in toDeleteTNames array
                    */
                    updateStatus( jobIds(i),
                                  toDeleteTNames,
                                  toDeleteTNamesExpired );
                    
                    /* ////////////////// */
                    /* SUBMIT OPERATIONS  */
                    /* ////////////////// */
                    /*
                    submit delete job operations based on the target names in 
                    toDeleteTNames array
                    */
                    submitOperations( jobIds(i),
                                      toDeleteTNames,
                                      nodeNames,
                                      userName);
          
                    /* //////////////////////// */
                    /* INSERT UI NOTIFICATIONS  */
                    /* //////////////////////// */
                    /*
                    insert ui notifications based on the target names in 
                    toDeleteTNames array
                    */                                      
                    insertUINotifications( jobIds(i),
                                           userName,
                                           toDeleteTNames,
                                           nodeNames,
                                           targetType,
                                           timeStampVal,
                                           timeZoneVal,
                                           domainVal );
                                           
                    /* ///////////////// */
                    /* INSERT LOG ENTRY  */
                    /* ///////////////// */
                    /*
                    insert log entry based on the target names in 
                    toDeleteTNames array
                    */                                      
                    insertLogEntry( jobIds(i),
                                    toDeleteTNames,
                                    execNumArray,
                                    timeStampValAsDate,
                                    timeZoneVal );

              else
                
                    /* 
                    the user has no full permissions on this job, therefore, 
                    store the job id in the array which will be returned ...
                    */                
                    smp_vd_util.populateIntArray( jobIds(i),
                                                  noPermissionsArray,
                                                  noPermIndexObject );

                end if; /* end if for privilege check */
                            
            end if;  /* end if for invalid job id check */
            
        end loop;

        /*
        we have finished processing all the job ids, so finally trim the three 
        out arrays ...
        */

        /* trim the invalid job ids array */
        smp_vd_util.trimIntArray( invalidJobIdsArray, invalidJobIndexObject );
                
        /* trim the active fixit job ids array */
        smp_vd_util.trimIntArray( activeFixitJobsArray, activeFixitIndexObject );
        
        /* trim the no permissions array */
        smp_vd_util.trimIntArray( noPermissionsArray, noPermIndexObject );        
        
    end;

/*
TODO: Batching of determining job ids validity to improve perf. Carry over to
other functions too
*/
function isJobIdValid(
                        jId INTEGER,
                        userName VARCHAR2) return INTEGER IS
    id_value INTEGER;
    
    begin
    
        /*
        initialize parameters            
        */
        id_value := -1;

        /* 
        find out if the job id is valid 
        note, a select statement on smp_vdj_job_per_target is used here to 
        determine the validity of the job id though a select on any other 
        appropriate job table could also have been used
        */                    
        for record in (
                    
            select job_id
                from smp_vdj_job_per_target
                where job_id=jId and
                status!=jobStatusDeleted and
                status!=jobStatusExpired ) loop
                
            id_value := record.job_id;
            exit;
                    
        end loop;
        
        return id_value;
        
    end;
          
function getPrivilegeForJob( 
                            jId INTEGER,
                            userName VARCHAR2) return VARCHAR IS
    job_priv VARCHAR2(10);
    
    begin
 
        /*
        initialize parameters            
        */
        job_priv := 'NONE';

        /* find out the privilege of the user for this job */                    
        for record in (
                    
            select privilege
                from smp_view_vdj_priv_job
                where to_char(job_id)=to_char(jId) and
                      upper(principal_name)=upper(userName) ) loop
                
            job_priv := record.privilege;
            exit;
                    
        end loop;
        
        return job_priv;
                                                              
    end;                                                                                    

function isJobFixit(
                    jId INTEGER ) return VARCHAR IS
    
    isFixit VARCHAR2(1);
    
    begin
    
        /*
        initialize parameters            
        */
        isFixit := '0';
        
        for record in (
        
            select is_fixit
                from smp_vdj_job
                where job_id=jId ) loop
                    
                isFixit := record.is_fixit;
                exit;
                                    
        end loop;                      
        
        return isFixit;
        
    end;                    
                    
procedure populateToDeleteTNames(
                        jId IN INTEGER,
                        isFixit IN VARCHAR2,
                        activeEvtTNames IN SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY, 
                        toDeleteTNamesExpired OUT SMP_VD_STRINGARRAY) IS
    
    toDeleteIndexObject SMP_VD_INDEX_OBJECT;
    toDeleteExpiredIndexObject SMP_VD_INDEX_OBJECT;
    tempResult SMP_VD_STRINGARRAY;
    result VARCHAR2(32767);
    cid INTEGER;
    tName VARCHAR(256);
    ignore INTEGER;
                    
    begin

        /*
        initialize OUT parameters
        */
        toDeleteTNames := SMP_VD_STRINGARRAY();
        toDeleteTNamesExpired := SMP_VD_STRINGARRAY();
        
        /*
        initialize other parameters            
        */
        toDeleteIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);        
        toDeleteExpiredIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);        
        cid := -1;
        
        cid := dbms_sql.open_cursor;
        dbms_sql.parse(cid, 
                    'select target_name ' ||
                    ' from smp_vdj_job_per_target ' ||
                    ' where job_id=' || jId || 
                    ' and status!=' || jobStatusDeleted || 
                    ' and status!=' || jobStatusExpired,
                    dbms_sql.native);

        dbms_sql.define_column(cid, 1, tName, 256);
        ignore := dbms_sql.execute(cid);
                    
        loop
            if dbms_sql.fetch_rows(cid) > 0 then

                dbms_sql.column_value(cid, 1, tName);
                smp_vd_util.populateStrArray(tName,
                                                 toDeleteTNames,
                                                 toDeleteIndexObject);

            else

                exit;
 
            end if;

        end loop;

        dbms_sql.close_cursor(cid);
        cid := -1;            
        
        /* now trim the toDeleteTNames array */
        smp_vd_util.trimStrArray( toDeleteTNames, toDeleteIndexObject );

        /* Since fixit jobs do not expire, this is bypassed for them */
        if(isFixit='0') then
           /* Get the list with expired targets to allow them to be set to deleted status */
           cid := dbms_sql.open_cursor;
           dbms_sql.parse(cid,
                    'select target_name ' ||
                    ' from smp_vdj_job_per_target ' ||
                    ' where job_id=' || jId ||
                    ' and status=' || jobStatusExpired,
                    dbms_sql.native);

           dbms_sql.define_column(cid, 1, tName, 256);
           ignore := dbms_sql.execute(cid);
                   
           loop
              if dbms_sql.fetch_rows(cid) > 0 then
                 dbms_sql.column_value(cid, 1, tName);
                 smp_vd_util.populateStrArray(tName,
                                                 toDeleteTNamesExpired,
                                                 toDeleteExpiredIndexObject);
              else
                 exit;
              end if;
           end loop;
           dbms_sql.close_cursor(cid);
           cid := -1;
           smp_vd_util.trimStrArray( toDeleteTNamesExpired, toDeleteExpiredIndexObject );
        else
           if(activeEvtTNames.count > 0) then 
              smp_vd_util.getANotInBArray( toDeleteTNames, activeEvtTNames,
                                               tempResult, 'Y' );
              toDeleteTNames := tempResult; 
           end if;
        end if;

        exception 
            when OTHERS then

            if (DBMS_SQL.is_open( cid )) then
                DBMS_SQL.close_cursor( cid ); 
            end if;

            raise;

    end;                        
 
procedure populateToDeleteTNamesSubset(
                        jId IN INTEGER,
                        isFixit IN VARCHAR2,
                        activeEvtTNames IN SMP_VD_STRINGARRAY,
                        deleteTNames IN SMP_VD_STRINGARRAY,
                        toDeleteTNames OUT SMP_VD_STRINGARRAY,
                        toDeleteTNamesExpired OUT SMP_VD_STRINGARRAY) IS
   
    toDeleteIndexObject SMP_VD_INDEX_OBJECT;
    toDeleteExpiredIndexObject SMP_VD_INDEX_OBJECT;
    inClauseObject SMP_VD_INCLAUSE_OBJECT;
    tempResult SMP_VD_STRINGARRAY;
    tempActiveEvtTNames SMP_VD_STRINGARRAY;
    result VARCHAR2(32767);
    cid INTEGER;
    cid1 INTEGER;
    tName VARCHAR(256);
    ignore INTEGER;

    begin

        /*
        initialize OUT parameters
        */
        toDeleteTNames := SMP_VD_STRINGARRAY();
        toDeleteTNamesExpired := SMP_VD_STRINGARRAY();

        /*
        initialize other parameters
        */
        toDeleteIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        toDeleteExpiredIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        inClauseObject := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
        cid := -1;
        cid1 := -1;

        result := smp_vd_util.getInClause( deleteTNames, inClauseObject );
        result := ltrim(result);
        result := rtrim(result);
 
        /* 
        This loop retrieves both the array containing the expired targets
        and the one without the expired targets since they use the same inclause
        */
        while( length(result) > 0 ) loop
           cid := dbms_sql.open_cursor;
           dbms_sql.parse(cid,
                    'select target_name ' ||
                    ' from smp_vdj_job_per_target ' ||
                    ' where job_id=' || jId ||
                    ' and status!=' || jobStatusDeleted ||
                    ' and status!=' || jobStatusExpired ||
                    ' and ' || result,
                    dbms_sql.native);

           dbms_sql.define_column(cid, 1, tName, 256);
           ignore := dbms_sql.execute(cid);

           loop
               if (dbms_sql.fetch_rows(cid) > 0) then

                  dbms_sql.column_value(cid, 1, tName);
                  smp_vd_util.populateStrArray(tName,
                                                 toDeleteTNames,
                                                 toDeleteIndexObject);
               else
                   exit;
               end if;
           end loop;

           dbms_sql.close_cursor(cid);
           cid := -1;

           /* Since fixit jobs do not expire, this is bypassed for them */
           if( isFixit='0') then
              cid1 := dbms_sql.open_cursor;
              dbms_sql.parse(cid1,
                    'select target_name ' ||
                    ' from smp_vdj_job_per_target ' ||
                    ' where job_id=' || jId ||
                    ' and status=' || jobStatusExpired ||
                    ' and ' || result, 
                    dbms_sql.native);

              dbms_sql.define_column(cid1, 1, tName, 256);
              ignore := dbms_sql.execute(cid1);

              loop
                  if (dbms_sql.fetch_rows(cid1) > 0) then

                     dbms_sql.column_value(cid1, 1, tName);
                     smp_vd_util.populateStrArray(tName,
                                                 toDeleteTNamesExpired,
                                                 toDeleteExpiredIndexObject);
                  else
                      exit;
                  end if;
              end loop;

              dbms_sql.close_cursor(cid1);
              cid1 := -1;
           end if;

           result := smp_vd_util.getInClause( deleteTNames, inClauseObject );
           result := ltrim(result);
           result := rtrim(result);
        end loop;

        /* now trim the toDeleteTNames array */
        smp_vd_util.trimStrArray( toDeleteTNames, toDeleteIndexObject );

        if(( isFixit='1' ) and (activeEvtTNames.count > 0)) then
           smp_vd_util.getANotInBArray( toDeleteTNames, activeEvtTNames,
                                               tempResult, 'Y' );
           toDeleteTNames := tempResult;
        else
           smp_vd_util.trimStrArray( toDeleteTNamesExpired, toDeleteExpiredIndexObject );
        end if;

        exception
            when OTHERS then

            if (DBMS_SQL.is_open( cid )) then
                DBMS_SQL.close_cursor( cid );
            end if;
            if (DBMS_SQL.is_open( cid1 )) then
                DBMS_SQL.close_cursor( cid1 );
            end if;

            raise;

    end;  

                        
procedure lockRows(
                jId IN INTEGER,
                toDeleteTNames IN OUT SMP_VD_STRINGARRAY,
                nodeNames OUT SMP_VD_STRINGARRAY,
                execNumArray OUT SMP_VD_INTEGERARRAY,
                targetType OUT VARCHAR2) IS

    targetNamesIndexObject SMP_VD_INDEX_OBJECT;
    nodeNamesIndexObject SMP_VD_INDEX_OBJECT;
    execNumIndexObject SMP_VD_INDEX_OBJECT;
    inClauseObject SMP_VD_INCLAUSE_OBJECT;
    deleteTNames SMP_VD_STRINGARRAY;
    result VARCHAR2(32767);
    targetNamesClause VARCHAR2(32767);
    cid INTEGER;
    tName VARCHAR(256);
    nName VARCHAR(256);
    execNum INTEGER;
    tType VARCHAR(256);
    ignore INTEGER;
    
    begin
        
        /*
        initialize OUT parameters
        */
        nodeNames := SMP_VD_STRINGARRAY();
        execNumArray := SMP_VD_INTEGERARRAY();
        targetType := '';
        deleteTNames := SMP_VD_STRINGARRAY();
                
        /*
        initialize other parameters            
        */
        targetNamesIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        nodeNamesIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        execNumIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
        inClauseObject := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
        cid := -1;
          
        if( toDeleteTNames.count > 0 ) then
        
            result := smp_vd_util.getInClause( toDeleteTNames,
                                               inClauseObject );
        
            result := ltrim(result);
            result := rtrim(result);
            while( length(result) > 0 ) loop
            
                targetNamesClause := '';
                cid :=  -1;
            
                /* construct the complete "and" clause */
                targetNamesClause := ' and ' || result;                    
            
                cid := dbms_sql.open_cursor;
                                
                dbms_sql.parse(cid, 
                        'select target_name, node_name, exec_num, target_type  ' ||
                        ' from smp_vdj_job_per_target ' ||
                        ' where job_id=' || jId || 
                        ' and status!=' || jobStatusDeleted || 
                        targetNamesClause || ' for update ',
                        dbms_sql.native);

                dbms_sql.define_column(cid, 1, tName, 256);
                dbms_sql.define_column(cid, 2, nName, 256);
                dbms_sql.define_column(cid, 3, execNum);
                dbms_sql.define_column(cid, 4, tType, 256);
                ignore := dbms_sql.execute(cid);
                    
                loop
            
                    if dbms_sql.fetch_rows(cid) > 0 then

                        dbms_sql.column_value(cid, 1, tName);
                        smp_vd_util.populateStrArray(tName,
                                                     deleteTNames,
                                                     targetNamesIndexObject);

                        dbms_sql.column_value(cid, 2, nName);
                        smp_vd_util.populateStrArray(nName,
                                                     nodeNames,
                                                     nodeNamesIndexObject);

                        dbms_sql.column_value(cid, 3, execNum);
                        smp_vd_util.populateIntArray(execNum,
                                                     execNumArray,
                                                     execNumIndexObject);

                        dbms_sql.column_value(cid, 4, tType);
                        targetType := tType;

                    else

                        exit;
 
                    end if;

                end loop;
            
                dbms_sql.close_cursor(cid);
                cid := -1;            

                /* now get the in clause again */                    
                result := smp_vd_util.getInClause( toDeleteTNames,
                                                   inClauseObject );

            end loop;        
    
        end if;
                
        /* now trim the targetNames array and replace the toDeleteTNames array
           to prevent array out of bounds errors */
        smp_vd_util.trimStrArray( deleteTNames, targetNamesIndexObject );
        toDeleteTNames := deleteTNames;

        /* now trim the nodeNames array */
        smp_vd_util.trimStrArray( nodeNames, nodeNamesIndexObject );
    
        /* now trim the execNumArray array */
        smp_vd_util.trimIntArray( execNumArray, execNumIndexObject );
    
        exception 
            when OTHERS then

            if DBMS_SQL.is_open( cid ) then
                DBMS_SQL.close_cursor( cid ); 
            end if;

            raise;                            
    
    end;

procedure updateStatus(
                jId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                toDeleteTNamesExpired IN SMP_VD_STRINGARRAY ) IS

    inClauseObject SMP_VD_INCLAUSE_OBJECT;
    inClauseObjectExpired SMP_VD_INCLAUSE_OBJECT;
    result VARCHAR2(32767);
    resultExpired VARCHAR2(32767);
    targetNamesClause VARCHAR2(32767);
    cid INTEGER;
    ignore INTEGER;                    
    
    begin
    
        /*
        initialize parameters            
        */
        inClauseObject := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
        inClauseObjectExpired := SMP_VD_INCLAUSE_OBJECT(1, 250, 'target_name', 1);
        cid := -1;
        
        if( toDeleteTNames.count > 0 ) then
        
            result := smp_vd_util.getInClause( toDeleteTNames,
                                               inClauseObject );
        
            result := ltrim(result);
            result := rtrim(result);
            while( length(result) > 0 ) loop
            
                targetNamesClause := '';
                cid :=  -1;
            
                /* construct the complete "and" clause */
                targetNamesClause := ' and ' || result;                    
            
                cid := dbms_sql.open_cursor;
                dbms_sql.parse(cid, 
                        'update smp_vdj_job_per_target ' ||
                        ' set status=' || jobStatusDeleting ||
                        ' where job_id=' || jId || 
                        ' and status!=' || jobStatusDeleted ||
                        ' and status!=' || jobStatusExpired ||
                        targetNamesClause, 
                        dbms_sql.native);

                ignore := dbms_sql.execute(cid);
                    
                dbms_sql.close_cursor(cid);
                cid := -1;            

                /* now get the in clause again */                    
                result := smp_vd_util.getInClause( toDeleteTNames,
                                                   inClauseObject );
                result := ltrim(result);
                result := rtrim(result);
            end loop;        

            resultExpired := smp_vd_util.getInClause( toDeleteTNamesExpired,
                                               inClauseObjectExpired );
            resultExpired := ltrim(resultExpired);
            resultExpired := rtrim(resultExpired);
            while( length(resultExpired) > 0 ) loop
                targetNamesClause := '';
                cid :=  -1;
           
                /* construct the complete "and" clause */
                targetNamesClause := ' and ' || resultExpired;                   
           
                /* Set expired targets to deleted */
                cid := dbms_sql.open_cursor;
                dbms_sql.parse(cid,
                        'update smp_vdj_job_per_target ' ||
                        ' set status=' || jobStatusDeleted ||
                        ' where job_id=' || jId ||
                        ' and status=' || jobStatusExpired ||
                        targetNamesClause,
                        dbms_sql.native);

                ignore := dbms_sql.execute(cid);

                dbms_sql.close_cursor(cid);
                cid := -1;

                /* now get the in clause again */                   
                resultExpired := smp_vd_util.getInClause( toDeleteTNamesExpired,
                                                   inClauseObjectExpired );
                resultExpired := ltrim(resultExpired);
                resultExpired := rtrim(resultExpired);
            end loop;       
        end if;
                
        exception 
            when OTHERS then

            if DBMS_SQL.is_open( cid ) then
                DBMS_SQL.close_cursor( cid ); 
            end if;

            raise;
                            
    end;                
                                                
procedure submitOperations(
                jId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                userName IN VARCHAR2) IS

    operation SMP_VDD_OPERATION;
    opArray SMP_VDD_OP_ARRAY;
    
    begin
            
        if( toDeleteTNames.count > 0 ) then
        
            /*
            initialize parameters            
            */
            opArray := SMP_VDD_OP_ARRAY();
        
            opArray.extend(toDeleteTNames.count);  

            for i in 1..toDeleteTNames.count loop

                operation := SMP_VDD_OPERATION( jId,
                                                SMP_VDD.jobType,
                                                SMP_VDD.jobSubTypeDelete,
                                                toDeleteTNames(i),
                                                nodeNames(i),
                                                userName,
                                                SMP_VDD.jobCallBackName );
                
                opArray(i) := operation;                            
                
            end loop;
            
            /* now finally call the SMP_VDD's submitOperations method */
            SMP_VDD.submitOperations( opArray, SMP_VDD.outGoingOperationYes );
                                            
        end if;
                    
    end;                

procedure insertUINotifications(
                jId IN INTEGER,
                userName IN VARCHAR2,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                nodeNames IN SMP_VD_STRINGARRAY,
                targetType IN VARCHAR2,
                timeStampVal IN INTEGER,
                timeZoneVal IN INTEGER,
                domainVal IN VARCHAR2) IS
                
    usersToNotify SMP_VD_STRINGARRAY;
    toNotifyIndexObject SMP_VD_INDEX_OBJECT;
    sequenceNum INTEGER;
                        
    begin
    
        if( toDeleteTNames.count > 0 ) then
        
            /*
            initialize parameters            
            */
            usersToNotify := SMP_VD_STRINGARRAY();
            toNotifyIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
            sequenceNum := 0;
            
            /*
            first get the users to notify
            */
            for record in (

                select distinct principal_name user_name
                    from smp_view_vdj_priv_job
                    where to_char(job_id)=to_char(jId)
                union
                select principal_name user_name
                    from smp_view_vdu_administrators
                    where superuser=1 ) loop
            
                smp_vd_util.populateStrArray( record.user_name,
                                              usersToNotify,
                                              toNotifyIndexObject );                    
                                              
            end loop;                                         
            
            /* trim the usersToNotify array */            
            smp_vd_util.trimStrArray( usersToNotify,
                                      toNotifyIndexObject );
                                                  
            /* 
            no need to insert ui notifications if there are no 
            users interested in listening to them
            */
            if( usersToNotify.count > 0 ) then
    
                for i in 1..toDeleteTNames.count loop
                
                    sequenceNum := 0;
                    SMP_VDM_NOTIFICATION_PKG.insert_uinotifications(
                            usersToNotify,
                            jId,
                            SMP_VDM_NOTIFICATION_PKG.jobNotification,
                            jobStatusDeleting,
                            nodeNames(i),
                            toDeleteTNames(i),
                            targetType,
                            timeStampVal,
                            timeZoneVal,
                            SMP_VDM_NOTIFICATION_PKG.verboseValueFalse,
                            domainVal,
                            SMP_VDM_NOTIFICATION_PKG.enhancedNotifFalse,
                            sequenceNum );
                end loop;
                
            end if;
                        
        end if;
                    
    end;                        

procedure insertLogEntry(
                jId IN INTEGER,
                toDeleteTNames IN SMP_VD_STRINGARRAY,
                execNumArray IN SMP_VD_INTEGERARRAY,
                timeStampValAsDate IN DATE,
                timeZoneVal IN INTEGER) IS
                
    begin
    
        if( toDeleteTNames.count > 0 ) then
        
            for i in 1..toDeleteTNames.count loop
                
                insert into smp_vdj_job_log
                    ( job_id, 
                      target_name, 
                      exec_num, 
                      status, 
                      time_stamp, 
                      time_zone, 
                      output_id )
                      values
                    ( jId,
                      toDeleteTNames(i),
                      execNumArray(i),
                      jobStatusDeleting,
                      timeStampValAsDate,
                      timeZoneVal,
                      0 );
                    
            end loop;
        
        end if;            

    end;


/**
 * Generate an IN clause of the form (job_id, target_name, exec_num)
 * IN ((j1,t1,e1), (j2,t2,e2)...)
 */
function generateInClauseForDelete(occsToRemove SMP_VDI_OBJ_OCC_ARRAY)
           return varchar2 IS
i integer;
j integer;
maxItems integer := 255;
retStr varchar2(30000);
begin
    if occsToRemove.count = 0 then
        return '(job_id, target_name, exec_num) in (null)';
    end if;

    retStr := '(job_id, target_name, exec_num) in ';

    i := 1;
    while i <= occsToRemove.count
    loop  
        j := 1;

        retStr := retStr || '(';
        while i <= occsToRemove.count and j <= maxItems
        loop
            if j != 1 then
                retStr := retStr || ' ,';
            end if;

            retStr := retStr || '(' || occsToRemove(i).objId || ',''' || 
                     occsToRemove(i).targetName ||
                      ''',' || occsToRemove(i).execNum || ')';

            i := i + 1;
            j := j + 1;

        end loop;

        retStr := retStr ||  ')';
        if i <= occsToRemove.count then
            retStr := retStr || ' OR (job_id, target_name, exec_num) in ';
        end if;

    end loop;
    return retStr;
end;

/**
 * Return the owner of the job whose id is jobId, '' if the job
 * does not exist
 */
function getJobOwner(jobId integer) return varchar2 IS
begin
    for c in (select owner from SMP_VDJ_JOB where job_id=jobId) loop
        return c.owner;
    end loop;

    return '';
end;



function removeJobLogs(userName in varchar2,
                       isSuperUser IN integer,
                       timeIn IN integer,
                       timeZone IN integer,
                       occsToRemove SMP_VDI_OBJ_OCC_ARRAY,
                       counts out SMP_VD_INTEGERARRAY) return integer IS

inClause varchar2(30000);
cid integer;
ignore integer;
currJobId integer := -1;

/* Job logs that the user has permissions to remove */
occsWithPerms SMP_VDI_OBJ_OCC_ARRAY := SMP_VDI_OBJ_OCC_ARRAY();
includeCurrentJobId boolean := false;
indexObject SMP_VD_INDEX_OBJECT := SMP_VD_INDEX_OBJECT(10, 0, 1);
operation SMP_VDD_OPERATION;
opArray SMP_VDD_OP_ARRAY;
jobOwner varchar2(32);

begin
    /* First filter out logs that the user does not have 
     * permissions to remove
     */
    counts := SMP_VD_INTEGERARRAY();
    counts.extend(2);
    counts(1) := 0;
    counts(2) := 0;
    for i in 1..occsToRemove.count loop
        if currJobId != occsToRemove(i).objId then
            currJobId := occsToRemove(i).objId;
            jobOwner := getJobOwner(currJobId);

            if jobOwner = '' then  
                /* Invalid job id; maybe it was already deleted. Ignore it */
                includeCurrentJobId := false;
            elsif isSuperUser = 1 then
                includeCurrentJobId := true;
            else
                includeCurrentJobId := 
                    SMP_VDU.hasFullPermission(userName, currJobId,
                                              jobOwner, 'JOB');
            end if;

        end if;

        if includeCurrentJobId then
            SMP_VD_UTIL.populateOccObjArray(occsToRemove(i), occsWithPerms,
                                            indexObject);
            counts(2) := counts(2)+1;
        else
            counts(1) := counts(1)+1;
        end if;
    end loop;
    SMP_VD_UTIL.trimOccObjArray(occsWithPerms, indexObject);

    /* Mark for deletion all rows corresponding to the specified inputs */
    inClause := generateInClauseForDelete(occsWithPerms);

    cid := dbms_sql.open_cursor();
    dbms_sql.parse(cid, 
                   'update smp_vdj_job_log set status= ' || 
                   jobStatusMarkedForDelete ||
                   ' where ' || inClause,
                   dbms_sql.native);

    ignore := dbms_sql.execute(cid);
    dbms_sql.close_cursor(cid);
    cid := -1;  
    
    /* Submit an operation to handle the actual deletion */
    operation := SMP_VDD_OPERATION(0, SMP_VDD.jobType,
                                   SMP_VDD.jobSubTypeClearHistoryMark,
                                   'dummy',
                                   'dummy',
                                   userName,
                                   SMP_VDD.jobCallBackName);
    opArray := SMP_VDD_OP_ARRAY();
    opArray.extend(1);
    opArray(1) := operation;
    SMP_VDD.submitOperations(opArray, SMP_VDD.outGoingOperationNo);
                    
    return 1;

exception
    when others then
        if cid != -1 then
            dbms_sql.close_cursor(cid);
        end if;
        raise;

end;

procedure processClearHistory IS
secId integer;
jid integer;
begin    

    /* Delete all orphaned submitted notifications (these 
     * have an execution number of zero)
     */
    delete from smp_vdj_job_log jl where exec_num=0 and
           1 = (select count(*) from smp_vdj_job_log where 
                 job_id=jl.job_id and target_name=jl.target_name) and
           (jl.job_id, jl.target_name) in 
               (select job_id, target_name from smp_vdj_job_per_target
                  where status=jobStatusDeleted or status=jobStatusExpired);
    commit;
           
    /* Delete all rows in job_per_target that are expired and
     * have no logs in history
     */
    delete from smp_vdj_job_per_target where 
        (status = jobStatusDeleted or status = jobStatusExpired) and
        (job_id, target_name) not in 
           (select distinct job_id, target_name from smp_vdj_job_log);
    commit;

    /* Clean up jobs that have no entries in job_per_target */
    for crec in (select job_id from smp_vdj_job j where is_lib=0 
                   and not exists
                   (select job_id from smp_vdj_job_per_target
                           where job_id=j.job_id)) loop
        jid := crec.job_id;
        delete from smp_vdj_job where job_id=jid;
        delete from smp_vdi_pos where type='JOB' and id=jid;
        delete from smp_vdi_target_properties where object_type='JOB' and
               object_id=jid;
        delete from smp_vdi_object_table where type='JOB' and 
               object_name=to_char(jid);
        select object_id into secId from smp_vdu_objects_table  where 
               object_name=to_char(jid) and type='JOB';
        delete from smp_vdu_privilege_table where object_oid=secId;
        delete from smp_vdu_objects_table where object_id=secId;
    end loop;
end;

procedure processClearHistoryAfterTrunc(batchSize IN integer) IS
begin
    /* Delete notification details for all deleted jobs */
    delete from smp_vdm_notification_details where 
           type=SMP_VDM_NOTIFICATION_PKG.jobNotification and
            (name, target, execnum) not in
              (select job_id, target, exec_num from smp_vdj_job_log);

    /* Clean up all obsoleted job entries */
    processClearHistory;
end;

procedure processClearHistoryAfterMark(batchSize IN integer) IS
numRowsDeleted integer := batchSize;
begin
    /* Delete all notification details corresponding to marked jobs */
    delete from smp_vdm_notification_details where 
        type=SMP_VDM_NOTIFICATION_PKG.jobNotification and
            (name, target, execnum) in
                (select job_id, target, exec_num from smp_vdj_job_log
                        where status=jobStatusMarkedForDelete);
    commit;

    /* Delete all logs that have been marked for delete */
    numRowsDeleted := batchSize;
    while numRowsDeleted >= batchSize
    loop
        delete from smp_vdj_job_log where status=jobStatusMarkedForDelete
               and rownum <= batchSize;
        numRowsDeleted := SQL%rowcount;
        commit;
    end loop;

    /* Clean up all obsoleted job entries */
    processClearHistory;
end;

                    
end SMP_VDJ;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDM_NOTIFICATION_PKG
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDM_NOTIFICATION_PKG" 
AS
     PROCEDURE fetch_uinotifications(  sessionId IN INTEGER,
                                       batchSize IN INTEGER,
                                       notificationSequences IN OUT
                                        SMP_VD_INTEGERARRAY,
                                       newNotifications OUT SMALLINT,
                                       notifications OUT UI_NOTIFICATIONS_CR
                                    )
     IS
      max_sequence_num INTEGER := -1;
      num_notifs INTEGER := 0;
      new_notifications BOOLEAN := FALSE;
     BEGIN

      FOR rec IN ( SELECT notification_type, last_notif_sequence
                   FROM SMP_VDM_LAST_NOTIF_SEQ_PERTYPE
                   ORDER BY notification_type ASC)
      LOOP
/*
* We determine new notifications arrival only for notification types in
* which there is an interest. The interest is expressed with 0 or positive
* number ( actually disinterest is expressed with a -ve number -1 ).
*/
          IF( notificationSequences(rec.notification_type) >= 0 ) THEN     

             IF(rec.last_notif_sequence <> 
                              notificationSequences(rec.notification_type)) 
             THEN
                 new_notifications := TRUE;
             END IF;
 
          ELSE
            
/*
* We record the latest notification seq. per type into the notification array
* passed by the client. This notification array is also used to set the 
* oms cache, and we piggyback the latest seq per notification type information
* on the client notification array.
*/
             notificationSequences(rec.notification_type) := 
                                                   rec.last_notif_sequence;
          END IF;

/*
* Record the max sequence num across all notification types.
*/
          IF ( rec.last_notif_sequence > max_sequence_num ) THEN
               max_sequence_num := rec.last_notif_sequence; 
          END IF;


      END LOOP;

/*
* If new_Notifications = FALSE, then we set the new notifications flag
* to false. 
* IMPORTANT NOTE : WE CANNOT RETURN A NULL CURSOR BACK. WE HAVE TO OPEN
* A CURSOR EVEN IF WE DO NOT REQUIRE IT. HENCE WE USE A SMALLER TABLE TO
* OPEN THE CURSOR AGAINST.
*/

      IF( new_notifications = FALSE ) THEN

          newNotifications := 0;
          OPEN notifications FOR
              SELECT notification_type, last_notif_sequence
                     FROM SMP_VDM_LAST_NOTIF_SEQ_PERTYPE
                     ORDER BY notification_type ASC;

      ELSE

/*
* We have to reset the max_sequence_num, since the client fetch of notifications
* is affected by the security filter and the batch size filter. After a fetch
* we have to recalculate the notificationSeqPerType array. 
*
* Note: In PLSQL we are not able to give a Top N-Query for 8.0 - hence we have
* to resort to parsing the table in the PLS code.
*/
 
          newNotifications := 1;
          max_sequence_num := -1;
      
          IF (batchSize <> -1) THEN

              FOR rec IN ( SELECT sequence_num, notification_type 
                           FROM smp_view_session_notif_map
                           WHERE (session_id = sessionId)
                           ORDER BY sequence_num ASC) 
              LOOP
                  num_notifs := num_notifs + 1;
                  max_sequence_num := rec.sequence_num;

                  notificationSequences(rec.notification_type) := 
                                   rec.sequence_num;

                  IF (num_notifs >= batchSize) THEN 
                     EXIT;
                  END IF;
              END LOOP;

          ELSE

              FOR rec IN ( SELECT sequence_num, notification_type 
                           FROM smp_view_session_notif_map
                           WHERE (session_id = sessionId)
                           ORDER BY sequence_num ASC) 
              LOOP
                  max_sequence_num := rec.sequence_num;

                  notificationSequences(rec.notification_type) := 
                                      rec.sequence_num;

              END LOOP;

          END IF;


          OPEN notifications FOR
              SELECT notifications.sequence_num, notifications.notification_id,
                     notifications.notification_type, notifications.subtype,
                     notifications.node_name, notifications.service_name,
                     notifications.service_type, notifications.time_stamp,
                     notifications.time_zone, notifications.verbose,
                     notifications.domain, nvpairs.name, nvpairs.value
              FROM
                     smp_view_session_notif_map notifications,
                     smp_vdm_notification_nvpairs nvpairs
              WHERE
                     notifications.session_id = sessionId
              AND
                     notifications.sequence_num <= max_sequence_num
              AND
                     nvpairs.sequence_num (+)= notifications.sequence_num
              ORDER BY
                     notifications.sequence_num;
      END IF; 

      IF (max_sequence_num > 0) THEN

        UPDATE smp_vdm_session_notiftype_pair
        SET last_notif_sequence = max_sequence_num
        WHERE
        session_id = sessionId;

      END IF;

     END;

       FUNCTION getSQLString( user_list SMP_VD_STRINGARRAY )
                RETURN VARCHAR2
       IS
          retStr VARCHAR2(32767);
          inStr  VARCHAR2(32767);
       BEGIN
  
          inStr := smp_vd_util.getInList( user_list );
  
          retStr := ' SELECT DISTINCT principal_name ' ||
                    ' FROM smp_vds_sessions_table sessions, ' ||
                    '      smp_vdm_session_notiftype_pair notiftype ' ||
                    ' WHERE ' ||
                    ' sessions.session_id = notiftype.session_id ' ||
                    ' AND ' ||
                    ' notification_type =  ' ||
                    ' :bind_notiftype' ||
                    ' AND ' ||
                    ' UPPER(principal_name) ' || inStr;

          RETURN retStr;
      END;
  
      PROCEDURE insert_uinotifications (user_list        IN SMP_VD_STRINGARRAY,
                                      notificationId   IN INTEGER,
                                      notificationType IN INTEGER,
                                      subtype          IN INTEGER,
                                      nodeName         IN STRING,
                                      serviceName      IN STRING,
                                      serviceType      IN STRING,
                                      timeStamp        IN INTEGER,
                                      timeZone         IN INTEGER,
                                      verbose          IN SMALLINT,
                                      domain           IN STRING,
                                      enhancedNotif    IN SMALLINT,
                                      notif_seq_num    OUT INTEGER)
      IS
          username_table STRINGARRAY_INDXD;
          num_user INTEGER := 0; 
          ignore INTEGER := 0;
          sequence_num INTEGER := -1; 
  
          sql_string VARCHAR2(32767);
          username VARCHAR2(256);
  
          cid INTEGER;
  
          BEGIN
  
              sql_string := getSQLString( user_list );
  
              cid := DBMS_SQL.open_cursor;
              DBMS_SQL.parse( cid, sql_string, dbms_sql.native);
              DBMS_SQL.bind_variable( cid, ':bind_notiftype', notificationType);

            DBMS_SQL.define_column( cid, 1, username, 256);
            ignore := DBMS_SQL.execute( cid );


            IF ( DBMS_SQL.fetch_rows(cid) > 0 ) THEN 

               SELECT SMP_VDM_SEQUENCE_NUM.NEXTVAL INTO sequence_num 
               FROM SYS.DUAL; 

               INSERT INTO SMP_VDM_NOTIFICATION
                        (sequence_num, notification_id, notification_type, 
                        subtype, node_name, service_name, service_type,
                        time_stamp, time_zone, verbose, domain)
               VALUES (sequence_num, notificationId, notificationType,
                         subtype, nodeName, serviceName, serviceType,
                         timeStamp, timeZone, verbose, domain);

               num_user := 1;
               DBMS_SQL.column_value(cid, 1, username);
               username_table(num_user) := username;

               LOOP
                    IF (DBMS_SQL.fetch_rows(cid) > 0 ) THEN 

                        num_user := num_user + 1;
                        DBMS_SQL.column_value(cid, 1, username);
                        username_table(num_user) :=  username;
                    ELSE
                        EXIT;
                    END IF;
               END LOOP;

               IF (num_user > 0 ) THEN

                FOR i IN 1..num_user LOOP
                   INSERT INTO SMP_VDM_ADDRESS
                      (sequence_num, username, enhanced_notification)
                      VALUES (sequence_num, username_table(i), enhancedNotif);
                END LOOP;

               END IF; 

            END IF;

            notif_seq_num := sequence_num;

            DBMS_SQL.close_cursor(cid);
    
        EXCEPTION WHEN OTHERS THEN

            IF DBMS_SQL.is_open( cid ) THEN
               DBMS_SQL.close_cursor( cid ); 
            END IF;

            RAISE;
        END;

    PROCEDURE insert_uinotifications (user_list        IN SMP_VD_STRINGARRAY,
                                      notificationId   IN INTEGER,
                                      notificationType IN INTEGER,
                                      subtype          IN INTEGER,
                                      nodeName         IN STRING,
                                      serviceName      IN STRING,
                                      serviceType      IN STRING,
                                      timeStamp        IN INTEGER,
                                      timeZone         IN INTEGER,
                                      verbose          IN SMALLINT,
                                      domain           IN STRING,
                                      enhancedNotif    IN SMALLINT,
                                      names            IN SMP_VD_STRINGARRAY,
                                      valueLengths     IN SMP_VD_INTEGERARRAY,
                                      valueData        IN SMP_VD_RAWARRAY,
                                      notif_seq_num    OUT INTEGER) IS
    begin
        /* First, insert the notification */
        insert_uinotifications(user_list, notificationId, notificationType,
                               subtype, nodeName, serviceName, serviceType,
                               timeStamp, timeZone, verbose, domain,
                               enhancedNotif, notif_seq_num);

        /* Now insert the name value pairs */
        if notif_seq_num > 0 and names.count > 0 then
            for i in 1..names.count loop
                insert into smp_vdm_notification_nvpairs
                   (sequence_num, name, value_length, value) values
                      (notif_seq_num, names(i), valueLengths(i), valueData(i));
            end loop;
        end if;
    end;

    PROCEDURE purge_ui_notification
    IS
      num_sessions INTEGER := 0;
    BEGIN

      SELECT COUNT(*) INTO num_sessions FROM smp_vdm_session_notiftype_pair;

      IF (num_sessions > 0 ) THEN
         
          DELETE FROM smp_vdm_notification
          WHERE 
          sequence_num <= (SELECT MIN(last_notif_sequence)
                           FROM smp_vdm_session_notiftype_pair)
          AND
          sequence_num NOT IN (SELECT notification.sequence_num FROM
                               smp_vdm_notification notification,
                               smp_vdm_address      address
                               WHERE
                               notification.sequence_num=address.sequence_num
                               AND
                               address.enhanced_notification <> 0);
      ELSE

          DELETE FROM smp_vdm_notification
          WHERE 
          sequence_num NOT IN (SELECT notification.sequence_num FROM
                               smp_vdm_notification notification,
                               smp_vdm_address      address
                               WHERE
                               notification.sequence_num=address.sequence_num
                               AND
                               address.enhanced_notification <> 0);


      END IF;

    END;


    PROCEDURE reg_notif_interest(sessionId        IN INTEGER,
                                 notificationType IN SMP_VD_INTEGERARRAY)
    IS
        max_notif_seq INTEGER := 0;
    BEGIN

        IF (notificationType.COUNT > 0 ) THEN

            SELECT smp_vdm_sequence_num.NEXTVAL INTO max_notif_seq
            FROM SYS.DUAL;
                
            FOR i in 1..notificationType.LAST LOOP
                
                INSERT INTO smp_vdm_session_notiftype_pair
                (session_id, notification_type, last_notif_sequence)
                VALUES( sessionId, notificationType(i), max_notif_seq );

            END LOOP;
        END IF;
    END;

    PROCEDURE dereg_notif_interest(sessionId        IN INTEGER,
                                   notificationType IN SMP_VD_INTEGERARRAY)
    IS
    BEGIN

        IF (notificationType.COUNT > 0 ) THEN

            FOR i in 1..notificationType.LAST LOOP
                
                DELETE FROM smp_vdm_session_notiftype_pair
                WHERE 
                session_id = sessionId 
                AND 
                notification_type = notificationType(i);
                     
            END LOOP;

        END IF;
    END;

    /*
    Fetch_notifications fetches notifications for the given
    notification type, subtype and notification id.
    NOTE : The notification subtype is a string of the form
           '(1) (2) (3)' where 1,2 and 3 are the subtypes
           The notification ids is a string of the form
           '(101) (102) (103)' where 101, 102 and 103 are
           notification ids.
           Note that the maximum length of subtype string or
           the notificationid string is 32KB. This is better than
           the 255 tokens limit for the IN clause.
    */
    FUNCTION fetch_notifications ( notificationType       INTEGER,
                                   notificationSubTypeStr VARCHAR2,
                                   notificationIdStr      VARCHAR2,
                                   notificationSeq     INTEGER  )
             RETURN NOTIFICATIONS_CR
    IS
        notifications NOTIFICATIONS_CR;
    BEGIN

        OPEN notifications FOR

          SELECT notification_id, sequence_num, subtype, node_name,
                 service_name, service_type
          FROM
          SMP_VDM_NOTIFICATION
          WHERE 
          NOTIFICATION_TYPE = notificationType
          AND
          INSTR( notificationSubTypeStr, '('||to_char(subtype)||')') > 0
          AND INSTR( notificationIdStr, '('||to_char(notification_id)||')') > 0
          AND sequence_num > notificationSeq
          ORDER BY notification_id, sequence_num;

        RETURN notifications;

    END;


END;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDN
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDN" AS

/* Return a string of all groups that the specified username */
/* has permissions over. The string is of the form */
/* "(id1)(id2)(id3)....." */
function getAccessibleGroups(userName varchar2) return varchar2 IS
retStr varchar2(20000);
begin
        for crec in (select id from SMP_VIEW_VDN_PRIV_GROUP_LIST where
            lower(principal_name)=lower(userName))
        loop
                retStr := retStr || '(' || crec.id || ')';
        end loop;

        return retStr;
end;

/* Given a list of name value pairs, generate a sql clause that */
/* can be used in queries */
function getPropsClause(tableAlias varchar2,
                        propNames SMP_VD_STRINGARRAY,
                        propValues SMP_VD_STRINGARRAY)
              return varchar2 IS
propsClause varchar2(20000);

begin
     if propNames.count > 0 then
           propsClause := ' AND (' || propNames.count || '= ' ||
                    '(select count(*) from smp_vdn_target_properties props ' ||
                    ' where props.targetid=' || tableAlias || '.id and ' ||
                    ' (lower(props.name), props.value) IN (';

           propsClause := propsClause || '(''' ||
                  lower(propNames(1)) || ''',''' ||
                  propValues(1) || ''')';
                 
           for i in 2..propNames.count 
           loop
                propsClause := propsClause || ', (''' ||
                  lower(propNames(i)) || ''',''' ||
                  propValues(i) || ''')';
           end loop;
           propsClause := propsClause || ')))';
      else
            propsClause := '';
      end if;
      
      return propsClause;
end;

/* Given an array of target names, return a string that contains */
/* the target ids in the form "(id1) (id2)...." Only return those */
/* targets that have the specified set of target and node properties. */
/* If the targetNames list is empty, then get a list of all targets */
/* that satisfy the target type and properties. Warning: this method */
/* must never be called when there are no properties. */
function getTargetIdString(targetNames SMP_VD_STRINGARRAY,
                           targetType varchar2,
                           nodePropNames SMP_VD_STRINGARRAY,
                           nodePropValues SMP_VD_STRINGARRAY,
                           targetPropNames SMP_VD_STRINGARRAY,
                           targetPropValues SMP_VD_STRINGARRAY)
           return varchar2 IS

targetNamesStr varchar2(32767);
retStr varchar2(32767);
tid integer;
cid integer := -1;
ignore integer;
targetPropsClause varchar2(20000);
nodePropsClause varchar2(20000);
tablesString varchar2(256);
nodeListJoin varchar2(50);
targetIdClause varchar2(32767);
begin

       tablesString := 'smp_vdn_target_list tl, smp_vdn_target_type_defn tt';

       if targetNames.count = 0 then
          targetIdClause := '';
       else
           targetNamesStr := '''' || lower(targetNames(1)) || '''';

           for i in 2..targetNames.last
           loop
               targetNamesStr := targetNamesStr || ', ''' ||
               lower(targetNames(i)) || '''';                
           end loop;

           targetIdClause := ' AND lower(tl.name) IN (' || targetNamesStr || ')';
        end if;

        nodeListJoin := '';

        /* Generate clauses for all node properties passed in */
        if nodePropNames.count > 0 then
           tablesString := tablesString || ', smp_vdn_node_list nl ';
           nodeListJoin := ' tl.nodeid=nl.id and ';
           nodePropsClause := getPropsClause('nl', nodePropNames, 
                                              nodePropValues);
        end if;

        /* Generate clauses for all target properties passed in */
        if targetPropNames.count > 0 then
           targetPropsClause := getPropsClause('tl', targetPropNames,
                                               targetPropValues);
        end if;
                              
        cid := dbms_sql.open_cursor;
        dbms_sql.parse(cid, 
                        'select distinct tl.id "ID" from ' || tablesString ||
                        ' where ' || nodeListJoin ||
                        ' tl.typeid = tt.id and lower(tt.name) like ''' || 
                        lower(targetType) || '''' ||
                        targetIdClause ||
                        nodePropsClause ||
                        targetPropsClause,
               dbms_sql.native);

        dbms_sql.define_column(cid, 1, tid);
        ignore := dbms_sql.execute(cid);

        loop
                if dbms_sql.fetch_rows(cid) > 0
                then
                        dbms_sql.column_value(cid, 1, tid);
                        retStr := retStr || '(' || to_char(tid) || ')';
                else
                        exit;
                end if;
        end loop;
        dbms_sql.close_cursor(cid);
        cid := -1;
        return retStr;

exception
        when others then 
        if cid <> -1 then 
           dbms_sql.close_cursor(cid);
        end if;
        raise;

end;

/* Given an array of groups and owners, return a string */
/* that contains the group ids in the form "(id1)(id2)...." */
function getGroupIdString(groupNames SMP_VD_STRINGARRAY, 
                          groupOwners SMP_VD_STRINGARRAY)
          return varchar2 IS
retStr varchar2(20000);
groupNamesStr varchar2(30000);
gid integer;
TYPE GroupIdsCursor is REF CURSOR;
groupIdsCr GroupIdsCursor;
cid integer := -1;
ignore integer;
i integer;
begin

       if groupNames.count = 0 then return '()'; end if;

       groupNamesStr := '''' || lower(groupNames(1)) || ':' 
              || lower(groupOwners(1)) || '''';

        for i in 2..groupNames.last
        loop
                groupNamesStr := groupNamesStr || ', ''' ||
                 lower(groupNames(i)) || ':' || lower(groupOwners(i)) || '''';
                
        end loop;

        cid := dbms_sql.open_cursor;
        dbms_sql.parse(cid, 'select id from SMP_VDN_GROUP_LIST where ' ||
                'lower(name) || '':'' || lower(owner) IN (' ||
               groupNamesStr || ')',
               dbms_sql.native);

        dbms_sql.define_column(cid, 1, gid);
        ignore := dbms_sql.execute(cid);

        loop
               if dbms_sql.fetch_rows(cid) > 0
               then
                        dbms_sql.column_value(cid, 1, gid);
                        retStr := retStr || '(' || to_char(gid) || ')';
                else
                        exit;
                end if;
        end loop;
        dbms_sql.close_cursor(cid);
        cid := -1;
        return retStr;

exception
        when others then 
        if cid <> -1 then 
           dbms_sql.close_cursor(cid);
        end if;
        raise;

end;

/* Return a cursor of targets from the list that have the specified */
/* properties. */
function flattenTargetsOnly(targetNames SMP_VD_STRINGARRAY,
                        targetType varchar2,
                        nodePropNames SMP_VD_STRINGARRAY,
                        nodePropValues SMP_VD_STRINGARRAY,
                        targetPropNames SMP_VD_STRINGARRAY,
                        targetPropValues SMP_VD_STRINGARRAY)
             return VdnCursor IS
rc VdnCursor;
tidStr varchar2(20000);
begin
        /* Get the string that represents the ids of all passed in */
        /* targets, that satisfy the specified set of properties */
        tidStr := getTargetIdString(targetNames, targetType,
                                    nodePropNames, nodePropValues,
                                    targetPropNames, targetPropValues);

         open rc for
         select tl.id "SERVICE_ID", tl.name "TARGET_NAME",
                    nl.name "NODE_NAME", tt.name "TARGET_TYPE", 
                    tl.withAgent "WITHAGENT", nl.status "STATUS" from
                    SMP_VDN_TARGET_LIST tl, SMP_VDN_NODE_LIST nl,
                    SMP_VDN_TARGET_TYPE_DEFN tt
                    where nl.id = tl.nodeid and
                    tt.id = tl.typeid and
                    tt.name like targetType and  
                    INSTR(tidStr, '('||to_char(tl.id) || ')')>0;

         return rc;
end;

/* Return a cursor of targets from the list of groups that have */
/* the specified target type.        */
function flattenGroups(groupNames SMP_VD_STRINGARRAY, 
                       groupOwners SMP_VD_STRINGARRAY,
                       userName varchar2,
                       isSuperUser integer,
                       targetType varchar2)
           return VdnCursor IS
rc VdnCursor;
gidStr varchar2(20000);
accessibleGidStr varchar2(20000);
begin
    gidStr := getGroupIdString(groupNames, groupOwners);

    if isSuperUser = 0 then
            accessibleGidStr := getAccessibleGroups(userName);

            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT", 
                nl.status "STATUS" 
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid AND 
                         INSTR(accessibleGidStr, '('||to_char(gg.groupid)||')')>0)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl2.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType;

    else
            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT",
                nl.status "STATUS" 
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType;

    end if;
    return rc;    
end;

/* Return a cursor of targets from the list of groups that have */
/* the specified target type and have the specified properties   */
function flattenGroupsProps(groupNames SMP_VD_STRINGARRAY, 
                            groupOwners SMP_VD_STRINGARRAY,
                            userName varchar2,
                            isSuperUser integer,
                            targetType varchar2,
                            nodePropNames SMP_VD_STRINGARRAY,
                            nodePropValues SMP_VD_STRINGARRAY,
                            targetPropNames SMP_VD_STRINGARRAY,
                            targetPropValues SMP_VD_STRINGARRAY)
           return VdnCursor IS
tidStr varchar2(20000);
gidStr varchar2(20000);
accessibleGidStr varchar2(20000);
rc VdnCursor;
begin 
    /* We first pull ids of all targets that satisfy the specified  */
    /* properties and construct a string that we substitute in the */
    /* query. */
    tidStr := getTargetIdString(SMP_VD_STRINGARRAY(), targetType,
                                nodePropNames, nodePropValues,
                                targetPropNames, targetPropValues);
    gidStr := getGroupIdString(groupNames, groupOwners);

    if isSuperUser = 0 then
            accessibleGidStr := getAccessibleGroups(userName);

            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT",
                nl.status "STATUS" 
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid AND 
                         INSTR(accessibleGidStr, '('||to_char(gg.groupid)||')')>0)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl2.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType
             AND      INSTR(tidStr, '('||to_char(gt.targetid)||')')> 0;

    else
            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT",
                nl.status "STATUS"
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType
             AND      INSTR(tidStr, '('||to_char(gt.targetid)||')')> 0;

    end if;
    return rc;    
      
end;

/* Obtain a flattened target list from the specified set of targets and */
/* groups, returning only targets that are of the specified target type. */
function flattenTargetsAndGroups(targetNames SMP_VD_STRINGARRAY,
                                 groupNames SMP_VD_STRINGARRAY, 
                                 groupOwners SMP_VD_STRINGARRAY,
                                 userName varchar2, 
                                 isSuperUser integer,
                                 targetType varchar2)
                   return VdnCursor IS

tidStr varchar2(20000);
gidStr varchar2(20000);
accessibleGidStr varchar2(20000);
rc VdnCursor;
dummyStrArray SMP_VD_STRINGARRAY;
begin
        
    dummyStrArray := SMP_VD_STRINGARRAY();
    tidStr := getTargetIdString(targetNames, targetType,
                                dummyStrArray, dummyStrArray,
                                dummyStrArray, dummyStrArray);
    gidStr := getGroupIdString(groupNames, groupOwners);

    if isSuperUser = 0 then
            accessibleGidStr := getAccessibleGroups(userName);

            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT", 
                nl.status "STATUS" 
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid AND 
                         INSTR(accessibleGidStr, '('||to_char(gg.groupid)||')')>0)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl2.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType
             UNION
             select tl.id "SERVICE_ID", tl.name "TARGET_NAME",
                    nl.name "NODE_NAME", tt.name "TARGET_TYPE", 
                    tl.withAgent "WITHAGENT", nl.status "STATUS" from
                    SMP_VDN_TARGET_LIST tl, SMP_VDN_NODE_LIST nl,
                    SMP_VDN_TARGET_TYPE_DEFN tt
                    where nl.id = tl.nodeid and
                    tt.id = tl.typeid and
                    tt.name like targetType and  
                    INSTR(tidStr, '('||to_char(tl.id) || ')')>0;

    else
            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT",
                nl.status "STATUS" 
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType
             UNION
             select tl.id "SERVICE_ID", tl.name "TARGET_NAME",
                    nl.name "NODE_NAME", tt.name "TARGET_TYPE", 
                    tl.withAgent "WITHAGENT", nl.status "STATUS" from
                    SMP_VDN_TARGET_LIST tl, SMP_VDN_NODE_LIST nl,
                    SMP_VDN_TARGET_TYPE_DEFN tt
                    where nl.id = tl.nodeid and
                    tt.id = tl.typeid and
                    tt.name like targetType and  
                    INSTR(tidStr, '('||to_char(tl.id) || ')')>0;

    end if;

    return rc;
end;

/* Obtain a flattened target list from the specified set of targets and */
/* groups, returning only targets that are of the specified target type, */
/* that satisfy the given set of node and target properties. */
function flattenTargetsAndGroupsProps(targetNames SMP_VD_STRINGARRAY,
                                      groupNames SMP_VD_STRINGARRAY, 
                                      groupOwners SMP_VD_STRINGARRAY,
                                      userName varchar2, 
                                      isSuperUser integer,
                                      targetType varchar2,
                                      nodePropNames SMP_VD_STRINGARRAY,
                                      nodePropValues SMP_VD_STRINGARRAY,
                                      targetPropNames SMP_VD_STRINGARRAY,
                                      targetPropValues SMP_VD_STRINGARRAY) 
               return VdnCursor IS
tidStr varchar2(20000);
groupsTidStr varchar2(20000);
gidStr varchar2(20000);
accessibleGidStr varchar2(20000);
rc VdnCursor;
begin
    
    /* A list of target ids among the passed-in targets that  */
    /* satisfy the specified set of properties */
    tidStr := getTargetIdString(targetNames, targetType,
                                nodePropNames, nodePropValues,
                                targetPropNames, targetPropValues);

    /* A list of all targets that satisfy the specified set of properties */
    groupsTidStr := getTargetIdString(SMP_VD_STRINGARRAY(), targetType,
                                      nodePropNames, nodePropValues,
                                      targetPropNames, targetPropValues);

    gidStr := getGroupIdString(groupNames, groupOwners);

    if isSuperUser = 0 then
            accessibleGidStr := getAccessibleGroups(userName);

            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT", 
                nl.status "STATUS" 
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid AND 
                         INSTR(accessibleGidStr, '('||to_char(gg.groupid)||')')>0)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl1.id)||')')>0
             AND      INSTR(accessibleGidStr, '('||to_char(gl2.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType
             AND      INSTR(groupsTidStr, '('||to_char(tl.id) || ')')>0
             UNION
             select tl.id "SERVICE_ID", tl.name "TARGET_NAME",
                    nl.name "NODE_NAME", tt.name "TARGET_TYPE", 
                    tl.withAgent "WITHAGENT", nl.status "STATUS" from
                    SMP_VDN_TARGET_LIST tl, SMP_VDN_NODE_LIST nl,
                    SMP_VDN_TARGET_TYPE_DEFN tt
                    where nl.id = tl.nodeid and
                    tt.id = tl.typeid and
                    tt.name like targetType and  
                    INSTR(tidStr, '('||to_char(tl.id) || ')')>0;

    else
            open rc for
            SELECT UNIQUE  gt.targetid
                "SERVICE_ID", tl.name "TARGET_NAME", nl.name "NODE_NAME",
                tt.name "TARGET_TYPE", tl.withAgent "WITHAGENT",
                nl.status "STATUS" 
                    FROM  SMP_VDN_GROUP_LIST   gl1, 
                          SMP_VDN_GROUP_LIST   gl2,
                          SMP_VDN_GROUP_TARGET gt,
                          SMP_VDN_TARGET_LIST  tl,
                          SMP_VDN_NODE_LIST nl,
                          SMP_VDN_TARGET_TYPE_DEFN tt
             WHERE    gl2.id IN 
             (   SELECT gg.membergroupid
                 FROM   SMP_VDN_GROUP_GROUP gg
                 START WITH gg.groupid = gl1.id
                 CONNECT BY (PRIOR gg.membergroupid = gg.groupid)
               UNION ALL
                 SELECT gl3.id
                 FROM   SMP_VDN_GROUP_LIST gl3
                 WHERE  gl3.id = gl1.id
             )
             AND      gl2.id = gt.groupid
             AND      gt.targetid = tl.id
             AND      INSTR(gidStr, '('||to_char(gl1.id)||')')>0
             AND      tl.nodeid=nl.id
             AND      tl.typeid = tt.id
             AND      tt.name like targetType
             AND      INSTR(groupsTidStr, '('||to_char(tl.id) || ')')>0
             UNION
             select tl.id "SERVICE_ID", tl.name "TARGET_NAME",
                    nl.name "NODE_NAME", tt.name "TARGET_TYPE", 
                    tl.withAgent "WITHAGENT", nl.status "STATUS" from
                    SMP_VDN_TARGET_LIST tl, SMP_VDN_NODE_LIST nl,
                    SMP_VDN_TARGET_TYPE_DEFN tt
                    where nl.id = tl.nodeid and
                    tt.id = tl.typeid and
                    tt.name like targetType and  
                    INSTR(tidStr, '('||to_char(tl.id) || ')')>0;

    end if;

    return rc;

end;


function flattenTargetList(targetNames SMP_VD_STRINGARRAY,
                           groupNames SMP_VD_STRINGARRAY, 
                           groupOwners SMP_VD_STRINGARRAY,
                           userName varchar2, 
                           isSuperUser integer,
                           targetType varchar2,
                           nodePropNames SMP_VD_STRINGARRAY,
                           nodePropValues SMP_VD_STRINGARRAY,
                           targetPropNames SMP_VD_STRINGARRAY,
                           targetPropValues SMP_VD_STRINGARRAY) 
               return VdnCursor IS
rc VdnCursor;

begin
     
    if targetNames.count > 0 then

       if groupNames.count > 0 then
           
           if nodePropNames.count >0 or targetPropNames.count > 0 then
               rc := flattenTargetsAndGroupsProps(targetNames,
                                                  groupNames,
                                                  groupOwners,
                                                  userName,
                                                  isSuperUser,
                                                  targetType,
                                                  nodePropNames,
                                                  nodePropValues,
                                                  targetPropNames,
                                                  targetPropValues);
           else
                rc := flattenTargetsAndGroups(targetNames,
                                              groupNames,
                                              groupOwners,
                                              userName,
                                              isSuperUser,
                                              targetType);
           end if;

       else

           rc := flattenTargetsOnly(targetNames, targetType, 
                                    nodePropNames, nodePropValues,
                                    targetPropNames, targetPropValues);

       end if;

    else
        if nodePropNames.count >0 or targetPropNames.count > 0 then
           rc := flattenGroupsProps(groupNames,
                                    groupOwners,
                                    userName,
                                    isSuperUser,
                                    targetType,
                                    nodePropNames,
                                    nodePropValues,
                                    targetPropNames,
                                    targetPropValues);
        else
           rc := flattenGroups(groupNames,
                               groupOwners,
                               userName,
                               isSuperUser,
                               targetType);
        end if;
    
    end if;

    return rc;
end;

procedure getFlatTargetsWithAgent(targetNames SMP_VD_STRINGARRAY,
                                  groupNames SMP_VD_STRINGARRAY, 
                                  groupOwners SMP_VD_STRINGARRAY,
                                  userName varchar2, 
                                  isSuperUser integer,
                                  targetType varchar2,
                                  nodePropNames SMP_VD_STRINGARRAY,
                                  nodePropValues SMP_VD_STRINGARRAY,
                                  targetPropNames SMP_VD_STRINGARRAY,
                                  targetPropValues SMP_VD_STRINGARRAY,
                                  flatTargetNames OUT SMP_VD_STRINGARRAY,
                                  nodeNames OUT SMP_VD_STRINGARRAY,
                                  numTargetsWithoutAgents OUT integer) IS
c VdnCursor;
tnamesSlotsAvailable integer;
tnamesIndex integer;
nodeNamesSlotsAvailable integer;
nodeNamesIndex integer;
targetId integer;
flatTargetName varchar2(1000);
nodeName varchar2(1000);
flatTargetType varchar2(1000);
isWithAgent integer;
nodeStatus integer;

begin
    numTargetsWithoutAgents := 0;

    /* Flatten out the target list */
    c := SMP_VDN.flattenTargetList(targetNames,
                                   groupNames,
                                   groupOwners,
                                   userName,
                                   isSuperUser,
                                   targetType,
                                   nodePropNames,
                                   nodePropValues,
                                   targetPropNames,
                                   targetPropValues);

    flatTargetNames := SMP_VD_STRINGARRAY();
    nodeNames := SMP_VD_STRINGARRAY();
    tnamesSlotsAvailable := 0;
    tnamesIndex := 1;
    nodeNamesSlotsAvailable := 0;
    nodeNamesIndex := 1;
    loop
        fetch c into targetId, flatTargetName, 
                  nodeName, flatTargetType, isWithAgent, nodeStatus;

         exit when c%NOTFOUND;

         /* Leave out targets that do not have agents */
         if isWithAgent = 1 then
             /* Ignore targets that are marked for deletion */
             if nodeStatus is null or nodeStatus != 'D' then
                 SMP_VD_UTIL.populateStrArray(flatTargetName,
                                              flatTargetNames,
                                              tnamesSlotsAvailable,
                                              tnamesIndex);
    
                  SMP_VD_UTIL.populateStrArray(nodeName,
                                               nodeNames,
                                               nodeNamesSlotsAvailable,
                                               nodeNamesIndex);
              end if;
        else
              numTargetsWithoutAgents := numTargetsWithoutAgents+1;
        end if;
    
    end loop;
    if tnamesSlotsAvailable > 0 then flatTargetNames.trim(tnamesSlotsAvailable); end if;
    if nodeNamesSlotsAvailable > 0 then nodeNames.trim(nodeNamesSlotsAvailable); end if;

end;


 
/* Add the specified targets and groups to the group specified */
/* by groupToAddId. Return >0 on success, error code on failure. */
function addMembersToGroup(groupToAddId integer,
                           groupNamesToAdd SMP_VD_STRINGARRAY,
                           groupOwnersToAdd SMP_VD_STRINGARRAY,
                           groupX SMP_VD_INTEGERARRAY,
                           groupY SMP_VD_INTEGERARRAY,
                           targetNamesToAdd SMP_VD_STRINGARRAY,
                           targetTypesToAdd SMP_VD_STRINGARRAY,
                           targetX SMP_VD_INTEGERARRAY,
                           targetY SMP_VD_INTEGERARRAY,
                           errorValues OUT SMP_VD_STRINGARRAY) return integer IS
subTargetId integer;
subGroupId integer;

begin
    errorValues := SMP_VD_STRINGARRAY();

    /* Add the passed-in targets to the group */
    if targetNamesToAdd.count > 0 then
        for i in 1..targetNamesToAdd.last
         loop
        
             -- Obtain the target id, if it exists
             subTargetId := -1;
             for crec in (select Target.id "TARGETID" from
                          smp_vdn_target_list Target,
                          smp_vdn_target_type_defn Type where 
                          Type.id=Target.typeid and
                          lower(Target.name)=lower(targetNamesToAdd(i)) and
                          lower(Type.name)=lower(targetTypesToAdd(i))) loop
                subTargetId := crec.targetId;
            end loop;

            if subTargetId = -1 then 
                errorValues.extend(2);
                errorValues(1) := targetNamesToAdd(i);
                errorValues(2) := targetTypesToAdd(i);
                return invalidGroupMember; 
            end if;

            insert into smp_vdn_group_target (groupId, targetId, X, Y)
               values (groupToAddId, subTargetId, targetX(i), targetY(i));
        end loop;
    end if;

    /* Add the sub-groups */
    if groupNamesToAdd.count > 0 then
        for i in 1..groupNamesToAdd.last
        loop
            subGroupId := -1;
            -- Obtain the id of the group, if it exists
            for crec in (select id from smp_vdn_group_list where
                   lower(name)=lower(groupNamesToAdd(i)) and 
                   lower(owner)=lower(groupOwnersToAdd(i)))
            loop
                subGroupId := crec.id;
            end loop;

            if subGroupId = -1 then 
                errorValues.extend(2);
                errorValues(1) := groupOwnersToAdd(i) || ':' || groupNamesToAdd(i);
                errorValues(2) := groupTargetType;
                return invalidGroupMember; 
            end if;

            /* Can't add a group to itself */
            if subGroupId=groupToAddId then return cycleInGroup; end if;

            insert into smp_vdn_group_group (groupId, memberGroupId, X, Y)
                   values(groupToAddId, subGroupId, groupX(i), groupY(i));
        end loop;
    end if;
    
    /* Success */
    return 1;
end;

/* Delete the specified targets and groups from the group specified */
/* by groupToRemoveId. Return >0 on success, error code on failure. */
function deleteMembersFromGroup(groupToRemoveId integer,
                                groupNamesToDelete SMP_VD_STRINGARRAY,
                                groupOwnersToDelete SMP_VD_STRINGARRAY,
                                targetNamesToDelete SMP_VD_STRINGARRAY,
                                targetTypesToDelete SMP_VD_STRINGARRAY,
                                errorValues OUT SMP_VD_STRINGARRAY)
           return integer IS

subTargetId integer;
subGroupId integer;

begin
    errorValues := SMP_VD_STRINGARRAY();

    /* Remove the passed-in targets from the group */
    if targetNamesToDelete.count > 0 then
        for i in 1..targetNamesToDelete.last
         loop
        
             -- Obtain the target id, if it exists
             subTargetId := -1;
             for crec in (select Target.id "TARGETID" from
                          smp_vdn_target_list Target,
                          smp_vdn_target_type_defn Type where 
                          Type.id=Target.typeid and
                          lower(Target.name)=lower(targetNamesToDelete(i)) and
                          lower(Type.name)=lower(targetTypesToDelete(i))) loop
                subTargetId := crec.targetId;
            end loop;

            if subTargetId = -1 then return invalidGroupMember; end if;

            delete from smp_vdn_group_target where groupId=groupToRemoveId 
                   and targetId=subTargetId;
        end loop;
    end if;

    /* Remove the sub-groups */
    if groupNamesToDelete.count > 0 then
        for i in 1..groupNamesToDelete.last
        loop
            subGroupId := -1;
            /* Obtain the id of the group, if it exists */
            for crec in (select id from smp_vdn_group_list where
                   lower(name)=lower(groupNamesToDelete(i)) and 
                   lower(owner)=lower(groupOwnersToDelete(i)))
            loop
                subGroupId := crec.id;
            end loop;

            if subGroupId = -1 then 
                errorValues.extend(2);
                errorValues(1) := groupNamesToDelete(i);
                errorValues(2) := groupOwnersToDelete(i);
                return invalidGroupMember; 
            end if;

            delete from smp_vdn_group_group where groupId=groupToRemoveId 
                   and memberGroupId=subGroupId;
        end loop;
    end if;

    /* Success */
    return 1;
end;


/* Modify the specified targets and groups to the group specified */
/* by groupToModifyId. Return >0 on success, error code on failure. */
function modifyMembersOfGroup(groupToModifyId integer,
                              groupNamesToModify SMP_VD_STRINGARRAY,
                              groupOwnersToModify SMP_VD_STRINGARRAY,
                              groupX SMP_VD_INTEGERARRAY,
                              groupY SMP_VD_INTEGERARRAY,
                              targetNamesToModify SMP_VD_STRINGARRAY,
                              targetTypesToModify SMP_VD_STRINGARRAY,
                              targetX SMP_VD_INTEGERARRAY,
                              targetY SMP_VD_INTEGERARRAY) return integer IS
subTargetId integer;
subGroupId integer;


begin
    /* Modify the passed-in targets  */
    if targetNamesToModify.count > 0 then
        for i in 1..targetNamesToModify.last
         loop
        
             /* Obtain the target id, if it exists */
             subTargetId := -1;
             for crec in (select Target.id "TARGETID" from
                          smp_vdn_target_list Target,
                          smp_vdn_target_type_defn Type where 
                          Type.id=Target.typeid and
                          lower(Target.name)=lower(targetNamesToModify(i)) and
                          lower(Type.name)=lower(targetTypesToModify(i))) loop
                subTargetId := crec.targetId;
            end loop;

            if subTargetId = -1 then return invalidGroupMember; end if;

            update smp_vdn_group_target set X=targetX(i), Y=targetY(i)
                   where groupId = groupToModifyId and
                   targetId=subTargetId;
        end loop;
    end if;

    /* Modify the sub-groups */
    if groupNamesToModify.count > 0 then
        for i in 1..groupNamesToModify.last
        loop
            subGroupId := -1;
            /* Obtain the id of the group, if it exists */
            for crec in (select id from smp_vdn_group_list where
                   lower(name)=lower(groupNamesToModify(i)) and 
                   lower(owner)=lower(groupOwnersToModify(i)))
            loop
                subGroupId := crec.id;
            end loop;

            if subGroupId = -1 then return invalidGroupMember; end if;

            update smp_vdn_group_group set X=groupX(i), Y=groupY(i)
                   where groupId = groupToModifyId and
                   membergroupid=subGroupId;
        end loop;
    end if;

    /* Success */
    return 1;
end;

function createGroup(groupName varchar2, groupOwner varchar2,
                     groupDescription varchar2, 
                     groupURL varchar2,
                     groupIconSize varchar2,
                     groupNamesToAdd SMP_VD_STRINGARRAY,
                     groupOwnersToAdd SMP_VD_STRINGARRAY,
                     groupX SMP_VD_INTEGERARRAY,
                     groupY SMP_VD_INTEGERARRAY,
                     targetNamesToAdd SMP_VD_STRINGARRAY,
                     targetTypesToAdd SMP_VD_STRINGARRAY,
                     targetX SMP_VD_INTEGERARRAY,
                     targetY SMP_VD_INTEGERARRAY,
                     errorValues OUT SMP_VD_STRINGARRAY) return integer IS
newGroupId integer;
numGroupsExisting integer;
errorCode integer;


begin
    /* First check whether the group already exists */
    select count(*) into numGroupsExisting from smp_vdn_group_list where 
           lower(name)=lower(groupName)
           and lower(owner)=lower(groupOwner);

    if numGroupsExisting > 0 then return groupAlreadyExists; end if;

    /* Create a new group entry */
    select SMP_VDN_GROUP_LIST_SEQ.NEXTVAL into newGroupId from dual
           where rownum=1;

    insert into smp_vdn_group_list(id, name, owner, description,
                                   backgroundfileurl, iconsize) values
             (newGroupId, groupName, groupOwner, groupDescription,
              groupURL, groupIconSize);

    /* Add the passed-in targets and groups to the group */
    errorCode := addMembersToGroup(newGroupId,
                                   groupNamesToAdd,
                                   groupOwnersToAdd,
                                   groupX,
                                   groupY,
                                   targetNamesToAdd,
                                   targetTypesToAdd,
                                   targetX,
                                   targetY,
                                   errorValues);

    if errorCode <= 0 then
        return errorCode;
    else 
        return newGroupId;
    end if;
end;


function modifyGroupMembers(groupToModifyId integer,
                            groupNamesToAdd SMP_VD_STRINGARRAY,
                            groupOwnersToAdd SMP_VD_STRINGARRAY,
                            groupXToAdd SMP_VD_INTEGERARRAY,
                            groupYToAdd SMP_VD_INTEGERARRAY,
                            targetNamesToAdd SMP_VD_STRINGARRAY,
                            targetTypesToAdd SMP_VD_STRINGARRAY,
                            targetXToAdd SMP_VD_INTEGERARRAY,
                            targetYToAdd SMP_VD_INTEGERARRAY,
                            groupNamesToModify SMP_VD_STRINGARRAY,
                            groupOwnersToModify SMP_VD_STRINGARRAY,
                            groupXToModify SMP_VD_INTEGERARRAY,
                            groupYToModify SMP_VD_INTEGERARRAY,
                            targetNamesToModify SMP_VD_STRINGARRAY,
                            targetTypesToModify SMP_VD_STRINGARRAY,
                            targetXToModify SMP_VD_INTEGERARRAY,
                            targetYToModify SMP_VD_INTEGERARRAY,
                            groupNamesToDelete SMP_VD_STRINGARRAY,
                            groupOwnersToDelete SMP_VD_STRINGARRAY,
                            targetNamesToDelete SMP_VD_STRINGARRAY,
                            targetTypesToDelete SMP_VD_STRINGARRAY,
                            errorValues OUT SMP_VD_STRINGARRAY)
               return integer IS
errorCode integer;

begin
    errorValues := SMP_VD_STRINGARRAY();

    /* Add the passed-in targets and groups to the group */
    errorCode := addMembersToGroup(groupToModifyId,
                                   groupNamesToAdd,
                                   groupOwnersToAdd,
                                   groupXToAdd,
                                   groupYToAdd,
                                   targetNamesToAdd,
                                   targetTypesToAdd,
                                   targetXToAdd,
                                   targetYToAdd,
                                   errorValues);

    if errorCode <0 then return errorCode; end if;

    /* modify existing targets */
    errorCode := modifyMembersOfGroup(groupToModifyId,
                                      groupNamesToModify,
                                      groupOwnersToModify,
                                      groupXToModify,
                                      groupYToModify,
                                      targetNamesToModify,
                                      targetTypesToModify,
                                      targetXToModify,
                                      targetYToModify);

    if errorCode <0 then return errorCode; end if;

    /* Delete targets */
    errorCode := deleteMembersFromGroup(groupToModifyId,
                                        groupNamesToDelete,
                                        groupOwnersToDelete,
                                        targetNamesToDelete,
                                        targetTypesToDelete,
                                        errorValues);

     if errorCode <0 then return errorCode; end if;
     return 1;   

end;

function modifyGroup(groupToModifyId integer,
                     groupOwner varchar2,
                     groupDescription varchar2, 
                     groupURL varchar2,
                     groupIconSize varchar2,
                     groupNamesToAdd SMP_VD_STRINGARRAY,
                     groupOwnersToAdd SMP_VD_STRINGARRAY,
                     groupXToAdd SMP_VD_INTEGERARRAY,
                     groupYToAdd SMP_VD_INTEGERARRAY,
                     targetNamesToAdd SMP_VD_STRINGARRAY,
                     targetTypesToAdd SMP_VD_STRINGARRAY,
                     targetXToAdd SMP_VD_INTEGERARRAY,
                     targetYToAdd SMP_VD_INTEGERARRAY,
                     groupNamesToModify SMP_VD_STRINGARRAY,
                     groupOwnersToModify SMP_VD_STRINGARRAY,
                     groupXToModify SMP_VD_INTEGERARRAY,
                     groupYToModify SMP_VD_INTEGERARRAY,
                     targetNamesToModify SMP_VD_STRINGARRAY,
                     targetTypesToModify SMP_VD_STRINGARRAY,
                     targetXToModify SMP_VD_INTEGERARRAY,
                     targetYToModify SMP_VD_INTEGERARRAY,
                     groupNamesToDelete SMP_VD_STRINGARRAY,
                     groupOwnersToDelete SMP_VD_STRINGARRAY,
                     targetNamesToDelete SMP_VD_STRINGARRAY,
                     targetTypesToDelete SMP_VD_STRINGARRAY,
                     errorValues OUT SMP_VD_STRINGARRAY)
             return integer IS

groupNotExist integer := -4;
begin
    errorValues := SMP_VD_STRINGARRAY();
    update SMP_VDN_GROUP_LIST set owner=groupOwner,
           description=groupDescription, backgroundFileURL=groupURL,
           iconsize=groupIconSize where id=groupToModifyId;

    if SQL%rowcount=0 then return groupNotExist; end if;

    return modifyGroupMembers(groupToModifyId,
                              groupNamesToAdd,
                              groupOwnersToAdd,
                              groupXToAdd,
                              groupYToAdd,
                              targetNamesToAdd,
                              targetTypesToAdd,
                              targetXToAdd,
                              targetYToAdd,
                              groupNamesToModify,
                              groupOwnersToModify,
                              groupXToModify,
                              groupYToModify,
                              targetNamesToModify,
                              targetTypesToModify,
                              targetXToModify,
                              targetYToModify,
                              groupNamesToDelete,
                              groupOwnersToDelete,
                              targetNamesToDelete,
                              targetTypesToDelete,
                              errorValues);
end;
                
/*---------------------------------------------------------------------------
  get_node_state                                                          
    input:   target name and target type for which to get the state      
    output:  is_manual_cfgd - 1 if the node is manually configured
                              0 if it is not.
             is_agent_bad   - 1 if the node is bad
                              0 otherwise
             is_node_monitored - 1 if the node is being monitored
                                 0 otherwise
             node_status    - 'Y' if the node is up and (is_manual_cfgd != 0
                               and is_agent_bad != 1 and is_node_monitored != 0)
                              'N' otherwise
             last_checked_since  - the time in seconds when the node was last 
                                   checked
             node_down_time -  the down time if the node status is 'N'                                      
---------------------------------------------------------------------------*/

  PROCEDURE get_node_state(
                           oms_name           IN  VARCHAR2,
                           target_name        IN  VARCHAR2,
                           target_type        IN  VARCHAR2,
                           is_manual_cfgd     OUT INTEGER,
                           is_agent_bad       OUT INTEGER,
                           is_node_monitored  OUT INTEGER,
                           node_status        OUT VARCHAR2,
                           node_region_name   OUT VARCHAR2,
                           is_same_region     OUT INTEGER,
                           last_checked_since OUT INTEGER,
                           node_down_time     OUT DATE
                          ) IS
    with_agent INTEGER := -1;
    agent_state VARCHAR2(4);
    monitoring_oms VARCHAR2(128);
  BEGIN
        
    /* 
      initialize the with_agent, node_status and time_stamp parameters. 
      initializing the with_agent to -1 takes care of the case
      where an incorrect target name and/or type is sent to this
      procedure
    */
    is_manual_cfgd     := -1;
    is_agent_bad       := -1;
    is_node_monitored  := -1;
    node_status        := 'N';
    node_region_name   := ' ';
    is_same_region     := -1;
    last_checked_since := -1;
    SELECT sysdate INTO node_down_time FROM dual where rownum=1;

    /* get the withagent for the given target(node in this case) */
    SELECT target.withagent INTO with_agent
    FROM smp_vdn_target_list target, smp_vdn_target_type_defn type
    WHERE (target.name = target_name) AND  
          (type.name = target_type)   AND
          (type.id = target.typeid);

    IF (with_agent > 0) THEN
      is_manual_cfgd := 0;


      /* Check if the agent state is BAD */
      SELECT agentstate INTO agent_state FROM smp_vdg_node_list
             WHERE (target_name = nodename);

      IF (agent_state = 'BAD') THEN
        is_agent_bad := 1;
      ELSE
        is_agent_bad := 0;
      END IF;

      /* Get region Name */
      SELECT region_name INTO node_region_name 
             FROM smp_vdp_nodes 
             WHERE (node = target_name);

      /* Get is_same_region */
      SELECT count(*) INTO is_same_region 
             FROM smp_vdp_nodes nodes, smp_vdp_oms_region_map omss
             WHERE (nodes.node = target_name) AND
                   (omss.region_name = nodes.region_name) AND
                   (omss.oms = oms_name);
            
      /* Check if the agent is being monitored */
      SELECT oms INTO monitoring_oms FROM smp_vdp_node_oms_map
             WHERE (node = target_name);

      IF (monitoring_oms IS NULL) THEN
        is_node_monitored := 0;
      ELSE
        is_node_monitored := 1;
      END IF;
   
      /* if the node is NOT manually configured, get the status of the node */
      IF ( (is_manual_cfgd = 0) AND (is_agent_bad = 0) AND (is_node_monitored = 1) ) THEN
        SELECT status, down_time INTO 
               node_status, node_down_time
            FROM SMP_VDP_NODE_INFO
            WHERE (node = target_name);

        SELECT (SYSDATE-timestamp)*60*60*24 INTO last_checked_since
            FROM smp_vdg_node_list
            WHERE (nodename = target_name);

      END IF;

    ELSE
      is_manual_cfgd := 1;
    END IF;
  END;

END smp_vdn;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDP
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDP" AS

  TYPE StringArray IS TABLE OF VARCHAR2(128) INDEX BY BINARY_INTEGER;
  TYPE IntegerArray IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

  PROCEDURE on_new_oms(new_oms IN VARCHAR2) IS
    existing_oms StringArray;
    count_nodes IntegerArray;
    take_away IntegerArray;
    new_oms_rgn_name SMP_VDP_REGIONS.REGION_NAME%TYPE;
    total_nodes INTEGER := 0;
    num_oms INTEGER := 0;
    my_nodes INTEGER := 0;
    total_take_away INTEGER := 0;
    goal INTEGER := 0;
    me_exists BOOLEAN := TRUE;
    CURSOR c IS SELECT num_nodes FROM smp_vdp_oms_num_nodes WHERE (oms = new_oms);
  BEGIN
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    /*  Get the region name of the new OMS */
    SELECT region_name INTO new_oms_rgn_name FROM smp_vdp_oms_region_map
        WHERE oms = new_oms;

    /* Get the list of (oms, number of nodes) pairs for all OMSs in the */
    /* current OMS region */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms <> new_oms) AND
                      (nds_per_oms.oms = rgn_map.oms) AND
                      (rgn_map.region_name = new_oms_rgn_name)
                ORDER BY num_nodes DESC) LOOP
      num_oms := num_oms + 1;
      existing_oms(num_oms) := rec.oms;
      count_nodes(num_oms) := rec.num_nodes;
      take_away(num_oms) := 0;
      total_nodes := total_nodes + count_nodes(num_oms);
    END LOOP;

    /* Get the count of nodes this OMS already handles */
    OPEN c;
    FETCH c INTO my_nodes;
    IF (c%NOTFOUND) THEN
      me_exists := FALSE;
      my_nodes := 0;
    END IF;
    CLOSE c;

    IF (num_oms = 0) THEN
      /* If there are no other OMSs, assign all nodes in this region to this OMS*/
      /* Get the count of nodes in this region */
      SELECT count(*) INTO total_nodes FROM smp_vdp_nodes WHERE region_name = new_oms_rgn_name ;

      /* Update all these nodes to be assigned to the new OMS */
      UPDATE smp_vdp_node_oms_map SET oms = new_oms WHERE node IN
          ( SELECT node FROM smp_vdp_nodes WHERE region_name = new_oms_rgn_name);

      IF (me_exists) THEN
        UPDATE smp_vdp_oms_num_nodes SET num_nodes = total_nodes WHERE (oms = new_oms);
      ELSE
        INSERT INTO smp_vdp_oms_num_nodes VALUES (new_oms, total_nodes);
      END IF;
    ELSE
      /* There are other OMS before this.. so do load balancing.. */
      total_nodes := total_nodes + my_nodes;
      goal := FLOOR(total_nodes / (num_oms + 1)) - my_nodes;
      IF (goal > 0) THEN
        total_take_away := goal;
      END IF;
      WHILE (goal > 0) LOOP
        FOR i IN 1..num_oms LOOP
          IF (count_nodes(i)-take_away(i) > 1) THEN
            take_away(i) := take_away(i) + 1;
            goal := goal - 1;
          END IF;
          IF (goal = 0) THEN
            EXIT;
          END IF;
        END LOOP;
      END LOOP;
      FOR i IN 1..num_oms LOOP
        IF (take_away(i) > 0) THEN
          UPDATE smp_vdp_node_oms_map SET oms = new_oms 
                 WHERE (oms = existing_oms(i)) AND (ROWNUM <= take_away(i));
          UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes - take_away(i) 
                 WHERE (oms = existing_oms(i));
        END IF;
      END LOOP;
      IF (me_exists) THEN
        UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes + total_take_away 
               WHERE (oms = new_oms);
      ELSE
        INSERT INTO smp_vdp_oms_num_nodes VALUES (new_oms, total_take_away);
      END IF;
    END IF;

    /*
    -- Mark the state of agents from good to unknown which were
    -- being managed by other gateways, because we can't trust
    -- the state of agents managed by the down gateways.
    -- If they are already marked bad, then we can't do much.
    -- Also mark the processing field to null, to ensure that
    -- these nodes will be ping'd regularly.
    -- */
    UPDATE smp_vdg_node_list SET agentstate = 'UNK', processing = null WHERE nodename IN
            (SELECT node FROM smp_vdp_node_oms_map WHERE oms = new_oms)
            AND (agentstate != 'BAD');
    /*
    -- Update the timestamp for all the up-nodes in the entire repository to
    -- ensure that ping service does not mark these nodes as down.
    -- NOTE : We lock smp_vdp_node_oms_map which makes ping services on all OMSs
    --       to block. If the fail-over takes more than ping threshold interval,
    --       ping services would mark them as down. To avoid these, we update the
    --       timestamps of all nodes that are up.
    -- */
    UPDATE smp_vdp_nodes SET timestamp = SYSDATE WHERE node IN
                (SELECT node FROM smp_vdp_node_info WHERE status = 'Y');
    /* DONT COMMIT THE CHANGES.. */
  END;


  PROCEDURE on_failed_oms(failed_oms IN VARCHAR2) IS
    surviving_oms StringArray;
    to_add IntegerArray;
    total_oms INTEGER := 0;
    nodes_to_distribute INTEGER := 0;
    failed_oms_rgn_name SMP_VDP_REGIONS.REGION_NAME%TYPE;
    CURSOR c IS SELECT num_nodes FROM smp_vdp_oms_num_nodes WHERE (oms = failed_oms);
  BEGIN
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    /*
      Mark the state of agents from good to unknown which were
      being managed by other gateways, because we can't trust
      the state of agents managed by the down gateways.
      If they are already marked bad, then we can't do much.
      Also mark the processing field to null, to ensure that
      these nodes will be ping'd regularly.
    */
    UPDATE smp_vdg_node_list SET agentstate = 'UNK', processing = null WHERE nodename IN
            (SELECT node FROM smp_vdp_node_oms_map WHERE oms = failed_oms)
            AND (agentstate != 'BAD');

    SELECT region_name INTO failed_oms_rgn_name FROM smp_vdp_oms_region_map 
           WHERE (oms = failed_oms);

    /* Get the list of other OMSs and their node-cnt in the same region */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms <> failed_oms) AND
                      (nds_per_oms.oms = rgn_map.oms) AND
                      (rgn_map.region_name = failed_oms_rgn_name)
                ORDER BY num_nodes ASC) LOOP
      total_oms := total_oms + 1;
      surviving_oms(total_oms) := rec.oms;
      to_add(total_oms) := 0;
    END LOOP;

    OPEN c;
    FETCH c INTO nodes_to_distribute;
    IF (c%FOUND) THEN
      /* It is possible that there are no more OMSs left in the region. So check for that */
      IF (total_oms > 0) THEN
        /* Get the counts to be given to each active OMS in this region */
        WHILE (nodes_to_distribute > 0) LOOP
          FOR i IN 1..total_oms LOOP
            to_add(i) := to_add(i) + 1;
            nodes_to_distribute := nodes_to_distribute - 1;
            IF (nodes_to_distribute = 0) THEN
              EXIT;
            END IF;
          END LOOP;
        END LOOP;
        /* Update surviving OMSs count and node maps */
        FOR i IN 1..total_oms LOOP
          IF (to_add(i) > 0) THEN
            UPDATE smp_vdp_node_oms_map SET oms = surviving_oms(i) 
                   WHERE (oms = failed_oms) AND (ROWNUM <= to_add(i));
            UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes + to_add(i) 
                   WHERE (oms = surviving_oms(i));
          END IF;
        END LOOP;
      ELSE
        UPDATE smp_vdp_node_oms_map SET oms = NULL WHERE (oms = failed_oms);
      END IF;
      DELETE FROM smp_vdp_oms_num_nodes WHERE (oms = failed_oms);
    END IF;
    CLOSE c;
    /*
      Update the timestamp for all the up-nodes in the entire repository to
      ensure that ping service does not mark these nodes as down.
      NOTE : We lock smp_vdp_node_oms_map which makes ping services on all OMSs
             to block. If the fail-over takes more than ping threshold interval,
             ping services would mark them as down. To avoid these, we update the
             timestamps of all nodes that are up.
    */
    UPDATE smp_vdp_nodes SET timestamp = SYSDATE WHERE node IN
                (SELECT node FROM smp_vdp_node_info WHERE status = 'Y');
    /* DONT COMMIT THE CHANGES.. */
  END;

  PROCEDURE on_new_node(new_node IN VARCHAR2, curr_oms IN VARCHAR2) IS
    oms_with_least_nodes SMP_VDP_OMS_REGION_MAP.OMS%TYPE;
    curr_region_name SMP_VDP_REGIONS.REGION_NAME%TYPE;
    lst_num_nodes INTEGER := -1;
    temp_oms_name SMP_VDP_OMS_REGION_MAP.OMS%TYPE;
    temp_num_nodes INTEGER := 0;
  BEGIN
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    SELECT region_name INTO curr_region_name FROM smp_vdp_oms_region_map WHERE oms = curr_oms;


    INSERT INTO smp_vdp_nodes VALUES(new_node, SYSDATE, curr_region_name);

    /* Get the OMS with the least nodes */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms = rgn_map.oms) AND
                      (rgn_map.region_name = curr_region_name)
                ORDER BY num_nodes ASC) LOOP
        temp_num_nodes := rec.num_nodes;
        temp_oms_name := rec.oms;
        IF ( (lst_num_nodes = -1) OR (temp_num_nodes < lst_num_nodes) ) THEN
            lst_num_nodes := temp_num_nodes;
            oms_with_least_nodes := temp_oms_name;
        END IF;
    END LOOP;

    INSERT INTO smp_vdp_node_oms_map VALUES (new_node, oms_with_least_nodes);
    UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes + 1 
           WHERE oms = oms_with_least_nodes;
    INSERT INTO smp_vdp_node_info VALUES (new_node, 'Y', NULL, NULL, SYSDATE);
    INSERT INTO smp_vdp_node_info_vdd VALUES (new_node, 'Y');
    /* DONT COMMIT THE CHANGES.. */

  END;


  PROCEDURE on_remove_node(remove_node in VARCHAR2) IS
    oms_with_most_nodes VARCHAR2(128);
    oms_affected        VARCHAR2(128);
    rmv_node_rgn_name   SMP_VDP_REGIONS.REGION_NAME%TYPE;
    num_oms             INTEGER := 0;
    max_num_nodes       INTEGER := -1;
    temp_oms_name       VARCHAR2(128);
    temp_num_nodes      INTEGER := 0;
  BEGIN
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    SELECT region_name INTO rmv_node_rgn_name FROM smp_vdp_nodes WHERE node = remove_node;

    /* Get the OMS with MAX number of NODES in rmv_node_rgn_name */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms = rgn_map.oms) AND
                      (rgn_map.region_name = rmv_node_rgn_name)
                ORDER BY num_nodes DESC) LOOP
        num_oms := num_oms + 1;
        temp_num_nodes := rec.num_nodes;
        temp_oms_name := rec.oms;
        IF (temp_num_nodes > max_num_nodes) THEN
            max_num_nodes := temp_num_nodes;
            oms_with_most_nodes := temp_oms_name;
        END IF;
    END LOOP;

    /* If the region has active OMSs, */
    IF (num_oms > 0) THEN
        SELECT oms INTO oms_affected FROM smp_vdp_node_oms_map WHERE node = remove_node;

        IF (oms_affected <> oms_with_most_nodes) THEN
          UPDATE smp_vdp_node_oms_map SET oms = oms_affected 
                 WHERE (oms = oms_with_most_nodes) AND (ROWNUM = 1);
        END IF;
        UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes - 1 
               WHERE oms = oms_with_most_nodes;
    END IF;

    DELETE FROM smp_vdp_node_oms_map WHERE node = remove_node;
    DELETE FROM smp_vdp_node_info WHERE node = remove_node;
    DELETE FROM smp_vdp_node_info_vdd WHERE node = remove_node;

    DELETE FROM smp_vdp_nodes where node = remove_node;
    /* DONOT COMMIT CHANGES */
  END;

  PROCEDURE move_node_to_region(node_name IN VARCHAR2, new_region_name IN VARCHAR2) IS
    old_region_name            SMP_VDP_REGIONS.REGION_NAME%TYPE;
    oms_wth_lst_nds_on_new_rgn VARCHAR2(128);
    oms_wth_mst_nds_on_old_rgn VARCHAR2(128);
    temp_oms_name              VARCHAR2(128);
    num_oms_on_old_region      INTEGER := 0;
    num_oms_on_new_region      INTEGER := 0;
    temp_num_nodes             INTEGER := 0;
    max_num_nodes              INTEGER := -1;
    min_num_nodes              INTEGER := -1;
  BEGIN
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    /* Get the old region name */
    SELECT UPPER(region_name) INTO old_region_name FROM smp_vdp_nodes WHERE node = node_name;

    /* Get the OMS with least number of nodes in the new region */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms = rgn_map.oms) AND
                      (rgn_map.region_name = UPPER(new_region_name))
                ORDER BY num_nodes DESC) LOOP
        num_oms_on_new_region := num_oms_on_new_region + 1;
        temp_num_nodes := rec.num_nodes;
        temp_oms_name := rec.oms;
        IF ( (min_num_nodes = -1) OR (temp_num_nodes < min_num_nodes) ) THEN
            min_num_nodes := temp_num_nodes;
            oms_wth_lst_nds_on_new_rgn := temp_oms_name;
        END IF;
    END LOOP;

    /* Get the OMS with MAX number of nodes in the old region */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms = rgn_map.oms) AND
                      (region_name = old_region_name)
                ORDER BY num_nodes DESC) LOOP
        num_oms_on_old_region := num_oms_on_old_region + 1;
        temp_num_nodes := rec.num_nodes;
        temp_oms_name := rec.oms;
        IF (temp_num_nodes > max_num_nodes) THEN
            max_num_nodes := temp_num_nodes;
            oms_wth_mst_nds_on_old_rgn := temp_oms_name;
        END IF;
    END LOOP;

    IF (num_oms_on_old_region > 0) THEN
        UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes - 1 
               WHERE oms = oms_wth_mst_nds_on_old_rgn;
    END IF;

    IF (num_oms_on_new_region > 0) THEN
        UPDATE smp_vdp_node_oms_map SET oms = oms_wth_lst_nds_on_new_rgn 
               WHERE (node = node_name);
        UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes + 1 
               WHERE oms = oms_wth_lst_nds_on_new_rgn;
    ELSE
        /* Set OMS to null if there are no OMSs in the new region.. */
        UPDATE smp_vdp_node_oms_map SET oms = NULL WHERE (node = node_name);
    END IF;

    /* Move the node to the new region */
    UPDATE smp_vdp_nodes SET region_name = UPPER(new_region_name) WHERE (node = node_name);

    /*
     After moving to the new region, make sure that the node is ping'd properly
     */
    UPDATE smp_vdg_node_list SET processing = null WHERE (nodename = node_name);

    /* DONT COMMIT THE CHANGES.. */
  END;


  PROCEDURE move_oms_to_region(oms_name IN VARCHAR2, new_region_name IN VARCHAR2) IS
    surviving_oms       StringArray;
    to_add              IntegerArray;
    old_rgn_name        SMP_VDP_REGIONS.REGION_NAME%TYPE;
    total_oms           INTEGER := 0;
    nodes_to_distribute INTEGER := 0;
    existing_oms        StringArray;
    count_nodes         IntegerArray;
    take_away           IntegerArray;
    region_existing     INTEGER := 0;
    total_nodes         INTEGER := 0;
    num_oms             INTEGER := 0;
    my_nodes            INTEGER := 0;
    total_take_away     INTEGER := 0;
    goal                INTEGER := 0;
    CURSOR c IS SELECT num_nodes FROM smp_vdp_oms_num_nodes WHERE (oms = oms_name);
  BEGIN
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    /* Make sure the new region exists */
    SELECT COUNT(*) INTO region_existing FROM smp_vdp_regions
                 WHERE region_name = UPPER(new_region_name);

    IF ( region_existing <= 0 ) THEN
       RETURN;
    END IF;

    /*
      Before distributing the nodes of this OMS, mark the processing field to null
      for all nodes belonging to the OMS, to ensure that these nodes will be
      ping'd regularly.
    */
    UPDATE smp_vdg_node_list SET processing = null WHERE nodename IN
            (SELECT node FROM smp_vdp_node_oms_map WHERE oms = oms_name) ;

    /* Get the old region name */
    SELECT region_name INTO old_rgn_name FROM smp_vdp_oms_region_map WHERE (oms = oms_name);

    /* Get the list of other OMSs and their node-cnt in the old_rgn_name */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms <> oms_name) AND
                      (nds_per_oms.oms = rgn_map.oms) AND
                      (rgn_map.region_name = old_rgn_name)
                ORDER BY num_nodes ASC) LOOP
      total_oms := total_oms + 1;
      surviving_oms(total_oms) := rec.oms;
      to_add(total_oms) := 0;
    END LOOP;
    OPEN c;
    FETCH c INTO nodes_to_distribute;
    /* Get the numbner of nodes to distribute */
    IF (c%FOUND) THEN
      /* It is possible that there are no more OMSs left in the region. So check for that */
      IF (total_oms > 0) THEN
        /* Get the counts to be given to each active OMS in this region */
        WHILE (nodes_to_distribute > 0) LOOP
          FOR i IN 1..total_oms LOOP
            to_add(i) := to_add(i) + 1;
            nodes_to_distribute := nodes_to_distribute - 1;
            IF (nodes_to_distribute = 0) THEN
              EXIT;
            END IF;
          END LOOP;
        END LOOP;
        /* Update surviving OMSs count and node maps */
        FOR i IN 1..total_oms LOOP
          IF (to_add(i) > 0) THEN
            UPDATE smp_vdp_node_oms_map SET oms = surviving_oms(i) 
                   WHERE (oms = oms_name) AND (ROWNUM <= to_add(i));
            UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes + to_add(i) 
                   WHERE (oms = surviving_oms(i));
          END IF;
        END LOOP;
      ELSE
        /* if there are no OMSs in old region what to do:1:2 */
        UPDATE smp_vdp_node_oms_map SET oms = NULL WHERE (oms = oms_name);
      END IF;
      /* See update later DELETE FROM smp_vdp_oms_num_nodes WHERE (oms = oms_name); */
    END IF;
    CLOSE c;

    /* Update the region name in region_map table */
    UPDATE smp_vdp_oms_region_map SET region_name = UPPER(new_region_name) 
	WHERE (oms = oms_name);

    num_oms := 0;
    total_nodes := 0;
    /* Get the list of (oms, number of nodes) pairs for all other OMSs in the */
    /* new_region */
    FOR rec IN (SELECT nds_per_oms.oms AS oms, nds_per_oms.num_nodes AS num_nodes
                FROM smp_vdp_oms_num_nodes nds_per_oms, smp_vdp_oms_region_map rgn_map
                WHERE (nds_per_oms.oms <> oms_name) AND
                      (nds_per_oms.oms = rgn_map.oms) AND
                      (rgn_map.region_name = UPPER(new_region_name))
                ORDER BY num_nodes DESC) LOOP
      num_oms := num_oms + 1;
      existing_oms(num_oms) := rec.oms;
      count_nodes(num_oms) := rec.num_nodes;
      take_away(num_oms) := 0;
      total_nodes := total_nodes + count_nodes(num_oms);
    END LOOP;

    IF (num_oms = 0) THEN
      /* If there are no other OMSs, assign all nodes in this region to this OMS*/
      /* Get the count of nodes in this region */
      SELECT count(*) INTO total_nodes FROM smp_vdp_nodes 
	  WHERE region_name = UPPER(new_region_name);

      /* Update all these nodes to be assigned to the new OMS */
      UPDATE smp_vdp_node_oms_map SET oms = oms_name WHERE node IN
          ( SELECT node FROM smp_vdp_nodes WHERE region_name = UPPER(new_region_name));

      UPDATE smp_vdp_oms_num_nodes SET num_nodes = total_nodes where (oms = oms_name);
    ELSE
      /* There are other OMSs in this region.. so do load balancing.. */
      goal := FLOOR(total_nodes / (num_oms + 1));
      IF (goal > 0) THEN
        total_take_away := goal;
      END IF;
      WHILE (goal > 0) LOOP
        FOR i IN 1..num_oms LOOP
          IF (count_nodes(i)-take_away(i) > 1) THEN
            take_away(i) := take_away(i) + 1;
            goal := goal - 1;
          END IF;
          IF (goal = 0) THEN
            EXIT;
          END IF;
        END LOOP;
      END LOOP;
      FOR i IN 1..num_oms LOOP
        IF (take_away(i) > 0) THEN
          UPDATE smp_vdp_node_oms_map SET oms = oms_name 
                 WHERE (oms = existing_oms(i)) AND (ROWNUM <= take_away(i));
          UPDATE smp_vdp_oms_num_nodes SET num_nodes = num_nodes - take_away(i) 
                 WHERE (oms = existing_oms(i));
        END IF;
      END LOOP;
      UPDATE smp_vdp_oms_num_nodes SET num_nodes = total_take_away WHERE (oms = oms_name);
    END IF;

    /*
      Mark the processing field to null for all nodes belonging to the OMS, to ensure that
      these nodes will be ping'd regularly.
    */
    UPDATE smp_vdg_node_list SET processing = null WHERE nodename IN
            (SELECT node FROM smp_vdp_node_oms_map WHERE oms = oms_name) ;

    /*
      Update the timestamp for all the up-nodes in the entire repository to
      ensure that ping service does not mark these nodes as down.
      NOTE : We lock smp_vdp_node_oms_map which makes ping services on all OMSs
             to block. If the fail-over takes more than ping threshold interval,
             ping services would mark them as down. To avoid these, we update the
             timestamps of all nodes that are up.
    */
    UPDATE smp_vdp_nodes SET timestamp = SYSDATE WHERE node IN
                (SELECT node FROM smp_vdp_node_info WHERE status = 'Y');

    /* DONT COMMIT THE CHANGES.. */

  END;

  PROCEDURE create_region(rgn_name IN VARCHAR2) IS
  BEGIN
    /* check for duplicates before inserting?? */
    INSERT INTO smp_vdp_regions VALUES(smp_vdp_region_id_seq.nextval, UPPER(rgn_name));
  END;

  /* Delete region requires the following integrity checks ...
     1. While deleting the region, make sure that no updates to that region
        takes place. Eg. Make sure no OMS is added to that region
     2. Delete Region only if there are no OMS assigned to that region.
     
     NOTE : In 9.2, if the region cannot be deleted, no error message is
            thrown. Please look at Bug 2248229 for further updates
  */
  PROCEDURE delete_region(rgn_name IN VARCHAR2) IS
    oms_existing INTEGER := 0;
  BEGIN
   
    /* Important Note : PLEASE MAINTAIN THE LOCK SEQUENCE */
    /* Since we are locking two tables, modifying the locking sequence
       will cause deadlocks. */
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    /* Count the number of oms'es mapped to the given region */
    SELECT COUNT(*) INTO oms_existing FROM smp_vdp_oms_region_map
          WHERE region_name = UPPER(rgn_name);

    IF (oms_existing = 0 ) THEN
        DELETE FROM smp_vdp_regions WHERE region_name = UPPER(rgn_name);
    END IF;
  END;

  /* Assign oms to region needs to perform referential integrity checks.
     1. It cannot assign an OMS to a non-existent region.
     2. It cannot allow the region that the oms is being assigned to be
        deleted
  */
  PROCEDURE assign_oms_to_region(oms_name IN VARCHAR2, rgn_name IN VARCHAR2) IS
    region_existing INTEGER := 0;
  BEGIN
   
    /* Important Note : PLEASE MAINTAIN THE LOCK SEQUENCE */
    /* Since we are locking two tables, modifying the locking sequence
       will cause deadlocks. */
    LOCK TABLE smp_vdg_gateway_map in EXCLUSIVE MODE;
    LOCK TABLE smp_vdp_node_oms_map IN EXCLUSIVE MODE;

    /* Check to see if the region is existing */
    SELECT COUNT(*) INTO region_existing FROM smp_vdp_regions
                 WHERE region_name = UPPER(rgn_name);

    IF ( region_existing > 0 ) then
       /* Check to see if it is not already assigned.. */
       INSERT INTO smp_vdp_oms_region_map VALUES(oms_name, UPPER(rgn_name));
    END IF;

  END;

  PROCEDURE check_and_add_oms(oms_name IN VARCHAR2, 
                              rgn_name OUT VARCHAR2,
                              is_oms_assigned OUT INTEGER) IS
    cnt_rgns INTEGER := 0;
    cnt_default_rgns INTEGER := 0;
    cnt_curr_oms_rgns INTEGER := 0;
  BEGIN
    rgn_name := ' ';
    is_oms_assigned := 0;

    /* Check whether the OMS already belongs to a region */
    SELECT COUNT(*) INTO cnt_curr_oms_rgns FROM smp_vdp_oms_region_map
        WHERE oms = oms_name;

    IF (cnt_curr_oms_rgns = 0) THEN

      SELECT COUNT(*) INTO cnt_rgns FROM smp_vdp_regions;

      SELECT COUNT(*) INTO cnt_default_rgns FROM smp_vdp_regions
                 WHERE region_name = DEFAULT_REGION ;

      IF ( (cnt_rgns = 1) AND (cnt_default_rgns = 1) ) THEN
        /* If there is only one region and that is DEFAULT region 
           Add the OMS to the default region */
        INSERT INTO smp_vdp_oms_region_map VALUES(oms_name, DEFAULT_REGION);
        is_oms_assigned := 1;
        rgn_name := DEFAULT_REGION ;
      ELSE
        /* We have either multiple regions or the DEFAULT region is delete/renamed */
        /* And our OMS is not configured to any region */
        is_oms_assigned := 0;
        rgn_name := ' ';
      END IF;

    ELSE
      /* OMS assigned to a region, get the region name */
      is_oms_assigned := 1;
      SELECT region_name INTO rgn_name FROM smp_vdp_oms_region_map
          WHERE oms = oms_name;
    END IF;

  END;

  PROCEDURE assign_pgsrv_to_region(pgsrv_name IN VARCHAR2, oms_name IN VARCHAR2) IS
    curr_region_name SMP_VDP_REGIONS.REGION_NAME%TYPE;
  BEGIN
    SELECT region_name INTO curr_region_name 
           FROM smp_vdp_oms_region_map WHERE oms = oms_name;
    INSERT INTO smp_vdp_pgsrv_region_map VALUES(pgsrv_name, curr_region_name);
  END;

  PROCEDURE remove_pgsrv_fm_region(pgsrv_name IN VARCHAR2) IS
  BEGIN
    DELETE FROM smp_vdp_pgsrv_region_map WHERE paging_server = pgsrv_name;
  END;

END smp_vdp;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDS" as

function insertPrincipal(pname IN varchar2,
                         ptype IN varchar2,
                         pIOR IN varchar2,
                         poms IN varchar2) return INTEGER
IS
        sessId INTEGER;
BEGIN
        select SMP_VDS_SESSIONS_SEQUENCE.NEXTVAL into sessId from DUAL
               where rownum=1;

        insert into SMP_VDS_SESSIONS_TABLE
               (session_id, principal_name, principal_type,
                principal_IOR, login_time, OMS)
            values (sessId, upper(pname), upper(ptype), pIOR, SYSDATE, poms);

         return sessId;
              
END;

end SMP_VDS;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDU
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDU" as

       
function getListUserDetails(users IN SMP_VD_STRINGARRAY,
                            isSuperUser OUT SMP_VD_INTEGERARRAY,
                            hasAccessToJob OUT SMP_VD_INTEGERARRAY,
                            hasAccessToEvent OUT SMP_VD_INTEGERARRAY,
                            illegalAdminName OUT varchar2)
                return integer IS
sz integer;
foundEntry integer;
begin

    isSuperUser := SMP_VD_INTEGERARRAY();
    hasAccessToJob := SMP_VD_INTEGERARRAY();
    hasAccessToEvent := SMP_VD_INTEGERARRAY();
    -- Set the sizes of each of these arrays to the size of the 
    -- users array
    sz := users.count;

    isSuperUser.extend(sz);
    hasAccessToJob.extend(sz);
    hasAccessToEvent.extend(sz);
    
    for i in 1..sz loop
        foundEntry := 0;
        for crec in (select superuser, job_system, event_system 
                         from smp_view_vdu_administrators
                         where upper(principal_name)=upper(users(i))) loop
            foundEntry := 1;
            isSuperUser(i) := crec.superuser;
            hasAccessToJob(i) := crec.job_system;
            hasAccessToEvent(i) := crec.event_system;
            exit;
        end loop;

        if foundEntry = 0 then
            illegalAdminName := users(i);
            return -1;
        end if;
    END loop;

    return 0;
end;


function getUserDetail(username IN varchar2,
                       isSuperUser OUT integer,
                       hasAccessToJob OUT integer,
                       hasAccessToEvent OUT integer,
                       typeout OUT varchar2,
                       passwd OUT raw) return integer IS


isSuArray SMP_VD_INTEGERARRAY;
hasAccessToJobArray SMP_VD_INTEGERARRAY;
hasAccessToEventArray SMP_VD_INTEGERARRAY;
userArray SMP_VD_STRINGARRAY;
illegalAdmin varchar2(128);
cursor c is (select password, type  from 
                 SMP_VDU_PRINCIPALS_TABLE
                where upper(principal_name)=upper(username));

begin

    userArray := SMP_VD_STRINGARRAY(username);

    if getListUserDetails(userArray, isSuArray, hasAccessToJobArray,
                         hasAccessToEventArray, illegalAdmin) < 0 then
        return -1;
    end if;

    isSuperUser := isSuArray(1);
    hasAccessToJob := hasAccessToJobArray(1);
    hasAccessToEvent := hasAccessToEventArray(1);

    for crec in c 
    loop
        passwd := crec.password;
        typeout := crec.type;
        return 0;
    end loop;
        
    /* If we're here, we exited out of the loop without a fetch */
    return -1;
end;

procedure getAllUserDetails(users OUT SMP_VD_STRINGARRAY,
                            isSuperUser OUT SMP_VD_INTEGERARRAY,
                            hasAccessToJob OUT SMP_VD_INTEGERARRAY,
                            hasAccessToEvent OUT SMP_VD_INTEGERARRAY) IS
slotsAvailableUsers integer := 0;
currentIndexUsers integer := 1;

slotsAvailableSu integer := 0;
currentIndexSu integer := 1;

slotsAvailableJob integer := 0;
currentIndexJob integer := 1;

slotsAvailableEvent integer := 0;
currentIndexEvent integer := 1;
begin
    users := SMP_VD_STRINGARRAY();
    isSuperUser := SMP_VD_INTEGERARRAY();
    hasAccessToJob := SMP_VD_INTEGERARRAY();
    hasAccessToEvent := SMP_VD_INTEGERARRAY();

    for crec in (select principal_name, superuser, job_system,
                  event_system from smp_view_vdu_administrators) LOOP
        smp_vd_util.populateStrArray(upper(crec.principal_name), users,
                                     slotsAvailableUsers, currentIndexUsers);
        smp_vd_util.populateIntArray(crec.superuser, isSuperUser,
                                     slotsAvailableSu, currentIndexSu);
        smp_vd_util.populateIntArray(crec.job_system, hasAccessToJob,
                                     slotsAvailableJob, currentIndexJob);
        smp_vd_util.populateIntArray(crec.event_system, hasAccessToEvent,
                                     slotsAvailableEvent, currentIndexEvent);
    end loop;
    
    if slotsAvailableUsers > 0 then users.trim(slotsAvailableUsers); end if;
    if slotsAvailableSu > 0 then isSuperUser.trim(slotsAvailableSu); end if;
    if slotsAvailableJob > 0 then hasAccessToJob.trim(slotsAvailableJob); end if;
    if slotsAvailableEvent > 0 then hasAccessToEvent.trim(slotsAvailableEvent); end if;

end;

/**
 * Return true if the user specified by username has any one of the
 * specified privileges over the object specified by (objName, owner, type)
 */
function hasPermission(userName IN varchar2,
                       objName IN varchar2,
                       owner IN varchar2,
                       objType IN varchar2,
                       perms IN SMP_VD_STRINGARRAY) return boolean IS
perm varchar2(32) := '';
begin

    for c in (select privilege_string from 
                 smp_vdu_privilege_table priv, smp_vdu_objects_table obj,
                 smp_vdu_principals_table users where
                     users.principal_name=upper(userName) and
                     obj.object_name=objName and
                     obj.type=objType and
                     obj.owner=upper(owner) and
                     obj.object_id=priv.object_oid and
                     users.principal_id=priv.principal_oid) loop
        perm := c.privilege_string;
    end loop;

    for i in 1..perms.count loop
        if perms(i) = perm then
            return true;
        end if;
    end loop;

    /* No Match */
    return false;
end;


function hasFullPermission(userName IN varchar2,
                           objName IN varchar2,
                           owner IN varchar2,
                           objType IN varchar2) return boolean IS
permsArray SMP_VD_STRINGARRAY := SMP_VD_STRINGARRAY();
begin
    permsArray.extend(1);
    permsArray(1) := 'FULL';

    return hasPermission(userName, objName, owner, objType, 
                         permsArray);
end;


end SMP_VDU;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VD_UTIL
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VD_UTIL" 
AS
    FUNCTION getInList( tokens SMP_VD_STRINGARRAY)
             RETURN VARCHAR2
    IS
        retStr VARCHAR2( 32767 );
     BEGIN

        IF (tokens.COUNT <= 0) THEN

          retStr := 'IN ( null ) ';

        ELSE

          retStr := '''' || UPPER(tokens(1)) || '''';

          FOR i IN 2..tokens.LAST
          LOOP
              retStr := retStr || ',''' || UPPER(tokens(i)) || '''';
          END LOOP;

          retStr := 'IN ( ' || retStr || ' ) ';

        END IF;

     RETURN retStr;
     END;

    FUNCTION getInList( tokens SMP_VD_INTEGERARRAY)
             RETURN VARCHAR2
    IS
        retStr VARCHAR2( 32767 );
     BEGIN

        IF (tokens.COUNT <= 0) THEN

          retStr := 'IN ( null ) ';

        ELSE

          retStr := '' || tokens(1) || ' ';

          FOR i IN 2..tokens.LAST
          LOOP
              retStr := retStr || ',' || tokens(i) || ' ';
          END LOOP;

          retStr := 'IN ( ' || retStr || ' ) ';
        END IF;

     RETURN retStr;
     END;

     procedure populateStrArray(entry IN varchar2,
                            strArray IN OUT SMP_VD_STRINGARRAY,
                            slotsAvailable IN OUT integer,
                            currentIndex IN OUT integer) IS
     numberToExtend integer := 10;

     begin
        if slotsAvailable = 0 then
            strArray.extend(numberToExtend);
            slotsAvailable := numberToExtend;
        end if;

        strArray(currentIndex) := entry;
        currentIndex := currentIndex+1;
        slotsAvailable := slotsAvailable-1;
     end;

    procedure populateStrArray(entry IN varchar2,
                               strArray IN OUT SMP_VD_STRINGARRAY,
                               indexObject IN OUT SMP_VD_INDEX_OBJECT) IS
    
        begin
    
            if( indexObject.numberToExtend = 0 ) then
                indexObject.numberToExtend := 10;
            end if;
        
            if( indexObject.slotsAvailable = 0 ) then
                indexObject.slotsAvailable := indexObject.numberToExtend;
                strArray.extend(indexObject.numberToExtend);
            end if;
        
            strArray(indexObject.currentIndex) := entry;
            indexObject.currentIndex := indexObject.currentIndex+1;
            indexObject.slotsAvailable := indexObject.slotsAvailable-1;
        
        end;                        

     procedure populateIntArray(entry IN integer,
                            intArray IN OUT SMP_VD_INTEGERARRAY,
                            slotsAvailable IN OUT integer,
                            currentIndex IN OUT integer) IS
     numberToExtend integer := 10;

     begin
        if slotsAvailable = 0 then
            intArray.extend(numberToExtend);
            slotsAvailable := numberToExtend;
        end if;

        intArray(currentIndex) := entry;
        currentIndex := currentIndex+1;
        slotsAvailable := slotsAvailable-1;
     end;

    procedure populateIntArray(entry IN integer,
                               intArray IN OUT SMP_VD_INTEGERARRAY,
                               indexObject IN OUT SMP_VD_INDEX_OBJECT) IS
    
        begin
    
            if( indexObject.numberToExtend = 0 ) then
                indexObject.numberToExtend := 10;
            end if;
        
            if( indexObject.slotsAvailable = 0 ) then
                indexObject.slotsAvailable := indexObject.numberToExtend;
                intArray.extend(indexObject.numberToExtend);
            end if;
        
            intArray(indexObject.currentIndex) := entry;
            indexObject.currentIndex := indexObject.currentIndex+1;
            indexObject.slotsAvailable := indexObject.slotsAvailable-1;
        
        end;                        

    procedure populateOccObjArray(entry IN SMP_VDI_OBJ_OCC,
                                  objArray IN OUT SMP_VDI_OBJ_OCC_ARRAY,
                                  indexObject IN OUT SMP_VD_INDEX_OBJECT) IS
    begin
        if indexObject.numberToExtend = 0  then
                indexObject.numberToExtend := 10;
        end if;
        
        if indexObject.slotsAvailable = 0  then
            indexObject.slotsAvailable := indexObject.numberToExtend;
            objArray.extend(indexObject.numberToExtend);
        end if;
        
        objArray(indexObject.currentIndex) := entry;
        indexObject.currentIndex := indexObject.currentIndex+1;
        indexObject.slotsAvailable := indexObject.slotsAvailable-1;
    end;


    procedure trimStrArray(strArray IN OUT SMP_VD_STRINGARRAY,
                           slotsAvailable IN OUT INTEGER) IS
        begin
            if( slotsAvailable > 0 ) then
                strArray.trim(slotsAvailable);
            end if;
        end;                       

    procedure trimStrArray(strArray IN OUT SMP_VD_STRINGARRAY,
                           indexObject IN OUT SMP_VD_INDEX_OBJECT) IS
        begin
            if( indexObject.slotsAvailable > 0 ) then
                strArray.trim(indexObject.slotsAvailable);
            end if;
        end;                       

    procedure trimIntArray(intArray IN OUT SMP_VD_INTEGERARRAY,
                           slotsAvailable IN OUT INTEGER) IS
        begin
            if( slotsAvailable > 0 ) then
                intArray.trim(slotsAvailable);
            end if;
        end;                       

    procedure trimIntArray(intArray IN OUT SMP_VD_INTEGERARRAY,
                           indexObject IN OUT SMP_VD_INDEX_OBJECT) IS
        begin
            if( indexObject.slotsAvailable > 0 ) then
                intArray.trim(indexObject.slotsAvailable);
            end if;
        end;                       

    procedure trimOccObjArray(objArray IN OUT SMP_VDI_OBJ_OCC_ARRAY,
                              indexObject IN OUT SMP_VD_INDEX_OBJECT) IS
    begin
        if indexObject.slotsAvailable > 0 then
            objArray.trim(indexObject.slotsAvailable);
        end if;
    end;


    function getInClause( strArray SMP_VD_STRINGARRAY,
                      inClauseObject IN OUT SMP_VD_INCLAUSE_OBJECT ) RETURN VARCHAR2 IS
        
        i INTEGER;
        j INTEGER;
        result VARCHAR2(32767);
        orAnd VARCHAR(10);
        inOrnotInChar VARCHAR(100);
        
    begin
        
        if( (inClauseObject.currIndex > strArray.count) or 
            (strArray.count=0) or 
            (inClauseObject.numToProcess=0)) then
            return '';
        end if;
        
        if( inClauseObject.inOrnotIn = 0 ) then
            orAnd := ' AND ';
            inOrnotInChar := ' not in ';
            if( inClauseObject.numToProcess != strArray.count ) then
                inClauseObject.numToProcess := strArray.count;
            end if;
        else
            orAnd := ' OR ';        
            inOrnotInChar := ' in ';
        end if;
        
        result := ' lower(' || 
                  inClauseObject.columnName || 
                  ') ' || 
                  inOrnotInChar || 
                  ' ( ' ;
        
        i := 1;
        
        while( (i<=inClauseObject.numToProcess) and 
               (inClauseObject.currIndex<=strArray.count) ) loop
                
                j := 1;

                while( (i<=inClauseObject.numToProcess) and 
                       (j<=maxElementsForInClause) and 
                       (inClauseObject.currIndex<=strArray.count) ) loop
                    
                    if( j!=1 ) then
                        result := result || ', ';
                    end if;
                    
                    result := result || 
                              '''' || 
                              lower(strArray(inClauseObject.currIndex)) || 
                              '''';
                    
                    i := i+1;
                    j := j+1;
                    inClauseObject.currIndex := inClauseObject.currIndex+1;
                                                            
                end loop;
                
                result := result || ' ) ';
                
                if( (i<=inClauseObject.numToProcess) and 
                    (inClauseObject.currIndex<=strArray.count) ) then
                    
                    result := result || 
                              orAnd || 
                              ' lower(' || 
                              inClauseObject.columnName || 
                              ') ' || 
                              inOrnotInChar || 
                              ' ( ';
                
                end if;
        end loop;
        
        result := ' ( ' || result || ' ) ';
        return result;

    end;                      

    function getInClause(intArray SMP_VD_INTEGERARRAY,
                         inClauseObject IN OUT SMP_VD_INCLAUSE_OBJECT)
                      RETURN VARCHAR2 IS
        
        i INTEGER;
        j INTEGER;
        result VARCHAR2(32767);
        orAnd VARCHAR(10);
        inOrnotInChar VARCHAR(100);
        
    begin
        
        if( (inClauseObject.currIndex > intArray.count) or 
            (intArray.count=0) or 
            (inClauseObject.numToProcess=0)) then
            return '';
        end if;
        
        if( inClauseObject.inOrnotIn = 0 ) then
            orAnd := ' AND ';
            inOrnotInChar := ' not in ';
            if( inClauseObject.numToProcess != intArray.count ) then
                inClauseObject.numToProcess := intArray.count;
            end if;
        else
            orAnd := ' OR ';        
            inOrnotInChar := ' in ';
        end if;
        
        result := inClauseObject.columnName || 
                  inOrnotInChar || '(';
        
        i := 1;
        
        while( (i<=inClauseObject.numToProcess) and 
               (inClauseObject.currIndex<=intArray.count) ) loop
                
                j := 1;

                while( (i<=inClauseObject.numToProcess) and 
                       (j<=maxElementsForInClause) and 
                       (inClauseObject.currIndex<=intArray.count) ) loop
                    
                    if( j!=1 ) then
                        result := result || ', ';
                    end if;
                    
                    result := result || 
                              intArray(inClauseObject.currIndex);
                    
                    i := i+1;
                    j := j+1;
                    inClauseObject.currIndex := inClauseObject.currIndex+1;
                                                            
                end loop;
                
                result := result || ' ) ';
                
                if( (i<=inClauseObject.numToProcess) and 
                    (inClauseObject.currIndex<=intArray.count) ) then
                    
                    result := result || 
                              orAnd || 
                              inClauseObject.columnName || 
                              inOrnotInChar || 
                              ' ( ';
                
                end if;
        end loop;
        
        result := ' ( ' || result || ' ) ';
        return result;

    end;                      

    procedure getAInBArray(AArray IN SMP_VD_STRINGARRAY,
      BArray IN SMP_VD_STRINGARRAY, resultArray OUT SMP_VD_STRINGARRAY, ignoreCase IN CHAR) IS
    
      tempAArray SMP_VD_STRINGARRAY;
      tempBArray SMP_VD_STRINGARRAY;
      resultIndexObject SMP_VD_INDEX_OBJECT;
      aIndex INTEGER;
      bIndex INTEGER;
      resultIndex INTEGER;

    begin
      tempAArray := AArray;
      tempBArray := BArray;
      resultArray := SMP_VD_STRINGARRAY();
      resultIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
      aIndex := 1;
      bIndex := 1;
      resultIndex := 1;

      if((AArray.count=0) or (BArray.count=0)) then
         return; 
      end if;
 
      sortStrArray(tempAArray, ignoreCase);
      sortStrArray(tempBArray, ignoreCase);

      loop
         if( (aIndex > tempAArray.count) or (bIndex > tempBArray.count) ) then
            exit;
         end if;

         if(ignoreCase = 'Y') then
            if(lower(tempAArray(aIndex)) = lower(tempBArray(bIndex))) then
               smp_vd_util.populateStrArray(tempAArray(aIndex),
                    resultArray, resultIndexObject);
               aIndex := aIndex + 1;
               bIndex := bIndex + 1;
            else
               if(lower(tempBArray(bIndex)) > lower(tempAArray(aIndex))) then
                   aIndex := aIndex + 1;
               else
                   bIndex := bIndex + 1;
               end if;
            end if;
         else
            if(tempAArray(aIndex) = tempBArray(bIndex)) then
               smp_vd_util.populateStrArray(tempAArray(aIndex),
                    resultArray, resultIndexObject);
               aIndex := aIndex + 1;
               bIndex := bIndex + 1;
            else
               if(tempBArray(bIndex) > tempAArray(aIndex)) then
                   aIndex := aIndex + 1;
               else
                   bIndex := bIndex + 1;
               end if;
            end if;
         end if;
      end loop;
      smp_vd_util.trimStrArray( resultArray, resultIndexObject );

    end;


    /* This procedure receives two arrays, determines the elements of the first array
       that are not in the second array, and returns the resulting 'not in' array */
    procedure getANotInBArray(AArray IN SMP_VD_STRINGARRAY, 
      BArray IN SMP_VD_STRINGARRAY, resultArray OUT SMP_VD_STRINGARRAY, ignoreCase IN CHAR) IS
     
      tempAArray SMP_VD_STRINGARRAY;
      tempBArray SMP_VD_STRINGARRAY;
      resultIndexObject SMP_VD_INDEX_OBJECT;
      aIndex INTEGER;
      bIndex INTEGER;
      resultIndex INTEGER;

    begin
      tempAArray := AArray;
      tempBArray := BArray;
      resultArray := SMP_VD_STRINGARRAY();
      resultIndexObject := SMP_VD_INDEX_OBJECT(10, 0, 1);
      aIndex := 1;
      bIndex := 1;
      resultIndex := 1;

      if(BArray.count < 1) then
         resultArray := AArray;
         return; 
      end if;
      if(AArray.count < 1) then
         return;
      end if;
      sortStrArray(tempAArray, ignoreCase);
      sortStrArray(tempBArray, ignoreCase);

      loop
         if( (aIndex > tempAArray.count) or (bIndex > tempBArray.count) ) then
            exit;
         end if;
         if(ignoreCase = 'Y') then
            if(lower(tempAArray(aIndex)) = lower(tempBArray(bIndex))) then
               aIndex := aIndex + 1;
               bIndex := bIndex + 1;
            else
               if(lower(tempBArray(bIndex)) > lower(tempAArray(aIndex))) then
                   smp_vd_util.populateStrArray(tempAArray(aIndex),
                        resultArray, resultIndexObject);
                   aIndex := aIndex + 1;
               else
                   bIndex := bIndex + 1;
               end if;
            end if;
         else
            if(tempAArray(aIndex) = tempBArray(bIndex)) then
               aIndex := aIndex + 1;
               bIndex := bIndex + 1;
            else
               if(tempBArray(bIndex) > tempAArray(aIndex)) then
                   smp_vd_util.populateStrArray(tempAArray(aIndex),
                       resultArray, resultIndexObject);
                   aIndex := aIndex + 1;
               else
                   bIndex := bIndex + 1;
               end if;
            end if;
         end if;
      end loop;
      loop
         if(aIndex > tempAArray.count) then
            exit;
         end if;
         smp_vd_util.populateStrArray(tempAArray(aIndex),
                         resultArray, resultIndexObject);
         aIndex := aIndex + 1;   
      end loop;
      smp_vd_util.trimStrArray( resultArray, resultIndexObject );

    end; 

    procedure sortStrArray(strArray IN OUT SMP_VD_STRINGARRAY, ignoreCase IN CHAR) IS                        
      beginInd INTEGER;
      endInd INTEGER;

    begin
       if(strArray.count < 2) then
          return;
       end if;

       beginInd := 1;
       endInd := strArray.count;
       sortStrArrayRecurse(strArray, beginInd, endInd, ignoreCase); 
    end;


    procedure sortStrArrayRecurse(strArray IN OUT SMP_VD_STRINGARRAY,
        beginIndex IN OUT INTEGER, endIndex IN OUT INTEGER, ignoreCase IN CHAR) IS                        
    oldLow INTEGER;
    oldHigh INTEGER;
    highStr VARCHAR2(3072);
    middleStr VARCHAR2(3072);
    lowStr VARCHAR2(3072);
    tempStr VARCHAR2(3072);
    middleIndex INTEGER;

    begin
       oldLow := beginIndex;
       oldHigh := endIndex;
       if(beginIndex < endIndex) then
          middleIndex := (beginIndex+endIndex)/2;
          middleStr := strArray(middleIndex);

          loop
             if(beginIndex >= endIndex) then
                exit;
             end if;
             /*
             Find the first string greater than or equal to the middle string 
             */
             loop
                if(beginIndex >= oldHigh) then
                   exit;
                end if;
                lowStr := strArray(beginIndex);
                if (ignoreCase = 'Y') then
                   if ( lower(lowStr) >= lower(middleStr)) then
                      exit;
                   end if;
                else
                   if ( lowStr >= middleStr) then
                      exit;
                   end if;
                end if;
                beginIndex := beginIndex +1;
             end loop;
             /*
             Find the last string less than or equal to the middle string
             */
             loop
                if(endIndex <= oldLow) then
                   exit;
                end if;
                highStr := strArray(endIndex);
                if (ignoreCase = 'Y') then
                   if( lower(highStr) <= lower(middleStr) ) then
                      exit;
                   end if;
                else
                   if( highStr <= middleStr ) then
                      exit;
                   end if;
                end if;
                endIndex := endIndex-1;
             end loop;
             /*
             If the first string greater than the middle string preceeds the
             last string less than the middle string, swap them and adjust 
             the begin and end indexes
             */
             if(beginIndex <= endIndex) then
                if (ignoreCase = 'Y') then
                   if ( lower(lowStr) > lower(highStr)) then
                      tempStr := lowStr;
                      strArray(beginIndex) := highStr;
                      strArray(endIndex) := tempStr;
                   end if;
                else 
                   if (lowStr > highStr) then
                      tempStr := lowStr;
                      strArray(beginIndex) := highStr;
                      strArray(endIndex) := tempStr;
                   end if;
                end if;
                beginIndex := beginIndex+1;
                endIndex := endIndex -1;   
             end if;
          end loop;
          if (oldLow < endIndex) then 
             sortStrArrayRecurse(strArray, oldLow, endIndex, ignoreCase);
          end if;
          if (beginIndex < oldHigh) then
             sortStrArrayRecurse(strArray, beginIndex, oldHigh, ignoreCase);
          end if;
       end if;
    end;
END;

/
--------------------------------------------------------
--  DDL for Package Body SMP_VDV
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "INPXXADM"."SMP_VDV" as

nodeTargetType constant varchar2(32) := 'oracle_sysman_node';
defaultTarget constant varchar2(20) := '<DEFAULT>';

/**
 * Check whether target credentials have been set for the specified set of 
 * targets
 */
function checkTargetsForPrefCreds(userId in varchar2,
                                  targets SMP_VD_STRINGARRAY,
                                  targetType varchar2,
                                  targetsWithNoCreds IN OUT SMP_VD_STRINGARRAY)
        return integer IS
credentialsSet integer := 0;
cid integer;
sqlStatement varchar2(32000);
targetName varchar2(128);

ignore integer;
slotsAvailable integer := 0;
currentIndex integer := 1;
begin

    /* First check whether preferred credentials have been set for the default */
    for crec in (select service_name from SMP_VDV_PREFERRED_CREDENTIALS where
                 user_id=userId and service_name=defaultTarget and
                 service_type=targetType) loop
        credentialsSet := 1;
    end loop;

    if credentialsSet = 1 then return 1; end if;

    /* Default to true, set to false if we find a target for which credentials
     * have not been set
     */
    credentialsSet := 1; 

    /* Default credentials have not been set. Check to see if they have been set
     * for each target.
     */
    sqlStatement := 'select tl.name from smp_vdn_target_list tl, ' ||
        ' smp_vdn_target_type_defn tt where upper(tt.name) = upper(' ||
        '''' || targetType || '''' || ') and ' ||
        ' tt.id=tl.typeid and upper(tl.name) ' ||
        SMP_VD_UTIL.getInList(targets) || 
        ' and not exists (select service_name from smp_vdv_preferred_credentials cred ' ||
        ' where cred.service_name=tl.name and cred.user_id = ' || userId || ' and ' ||
        ' cred.service_type=tt.name)';
                 
    cid := dbms_sql.open_cursor;
    dbms_sql.parse(cid, sqlStatement, dbms_sql.native);
    dbms_sql.define_column(cid, 1, targetName, 128);

    ignore := dbms_sql.execute(cid);

    loop
        if dbms_sql.fetch_rows(cid) > 0
        then
            credentialsSet := 0;
            dbms_sql.column_value(cid, 1, targetName);
            SMP_VD_UTIL.populateStrArray(targetName, targetsWithNoCreds,
                                         slotsAvailable, currentIndex);
        else
            exit;
        end if;
    end loop;

    if slotsAvailable > 0 then targetsWithNoCreds.trim(slotsAvailable); end if;

    dbms_sql.close_cursor(cid);
    return credentialsSet;

EXCEPTION 
    when others then

    IF DBMS_SQL.is_open(cid) THEN
        DBMS_SQL.close_cursor(cid); 
    END IF;

    raise;

end;

                                             
function checkForPreferredCredentials(userName in varchar2,
                                      targets SMP_VD_STRINGARRAY,
                                      nodes SMP_VD_STRINGARRAY,
                                      targetType varchar2,
                                      targetsWithNoCreds OUT SMP_VD_STRINGARRAY,
                                      nodesWithNoCreds OUT SMP_VD_STRINGARRAY)
       return integer IS
checkTargets integer := 1;
checkNodes integer := 1;
resultTargets integer := 1;
resultNodes integer := 1;
userId integer;
begin
    /* Initialize the OUT arrays */
    targetsWithNoCreds := SMP_VD_STRINGARRAY();
    nodesWithNoCreds := SMP_VD_STRINGARRAY();

    /* This will throw an exception if the user doesn't exist, but if that
     * happens it's a bug, so that's OK
     */
    select user_id into userId from smp_vdv_user where user_name=userName;

    if targets.count = 0 then checkTargets := 0; end if;
    if nodes.count = 0 then checkNodes := 0; end if;

    if checkTargets > 0 then
        resultTargets := checkTargetsForPrefCreds(userId,
                                                  targets, 
                                                  targetType, 
                                                  targetsWithNoCreds);

    end if;

    if checkNodes > 0 then
        resultNodes := checkTargetsForPrefCreds(userId,
                                                nodes,
                                                nodeTargetType,
                                                nodesWithNoCreds);
    end if;

    if resultTargets = 0 or resultNodes = 0 then 
        return 0;
    else
        return 1;
    end if;
end;

end SMP_VDV;

/
