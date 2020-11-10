#  BatchInsertAndUniqueConstraints

This sample code study the issue related to Core Data batch insert.

When unique constraint is set to multiple attributes (compound key), batch insert fails.

You can refer to `EventSession` for unique constraint configuration with multiple attributes (`eventID` and `sessionID`)

This is a [screen recording](https://drive.google.com/file/d/1yWBf3pxrpP5p0spfHyjbZSs7yEcyLCRO/view?usp=sharing) of the problem.

## How to use the sample code?

* Run the app target
* To batch insert "events", click "Event Batch Insert"
* To batch insert "sessions", click "Session Batch Insert"

Test Result

* "event" insert always succeeds.
* "session" insert succeeds the first time. All subsequent attempt will fail with error.

> Error Domain=NSCocoaErrorDomain Code=134050 "(null)" UserInfo={NSExceptionOmitCallstacks=true, _NSCoreDataOptimisticLockingFailureConflictsKey=(
> )}

Now... to eliminate the error...

* Remove `eventID` from unique constraint in EventSession entity.
* Run the sample code again.
* Now, clicking "Session Batch Insert" multiple times. Batch insert will go through. No Core Data error.

## Possible further investigation

Enable Core Data debug log: `-com.apple.CoreData.SQLDebug 1`
