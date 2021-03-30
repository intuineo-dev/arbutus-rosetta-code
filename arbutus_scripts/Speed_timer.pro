* Script  : Speed timer
* Author  : Intuineo
* Revision: 2021-03-30
* Version : 1.00
* Comment : Utilities to measure script speed. v_proc_name should be initialized before calling START

v_proc_name = UNICODE(BLANKS(100))

PROCEDURE START
  v_start = NOW()
RETURN

PROCEDURE STOP
  v_stop = NOW()
  v_elapsed =  v_stop - v_start
  SET ECHO ON
  DISPLAY "Ellapsed time for " + v_proc_name + ": " + TIME(v_elapsed)
RETURN
