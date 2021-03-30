* Script  : Fibonacci sequence
* Author  : Intuineo
* Revision: 2021-03-30
* Version : 1.00
* Comment : Implement the fibonacci sequence 

SET DEFAULT
SET SAFETY OFF
DELETE ALL OK
SET ECHO NONE

v_counter = 0
v_proc_name = 'Fibonacci_sequence'
DO SPEED_TIMER.START
DO .FIBONACI_START WHILE v_counter < 100

* PAUSE "Results of Fibonacci sequence can be viewed in Command Log"
SET ECHO ON
DISPLAY v_result_str
DO SPEED_TIMER.STOP
RETURN

PROCEDURE FIBONACI_START
  v_from = 0
  v_to = 29
  v_last = 0
  v_new = 0
  v_result = 0
  v_result_str = UNICODE(BLANKS(0))

  DO .FIBONACI_SEQUENCE WHILE v_from < v_to
  v_counter = v_counter + 1
RETURN 

PROCEDURE FIBONACI_SEQUENCE
  DO .FIBONACI_SEQUENCE_A IF (v_from >= 0) and (v_from < 2)
  DO .FIBONACI_SEQUENCE_B IF v_from >= 2
RETURN

PROCEDURE FIBONACI_SEQUENCE_A
  v_result = v_from
  v_result_str = v_result_str + ALLTRIM(STRING(v_result;10)) + ';'
  v_from = v_from + 1
RETURN

PROCEDURE FIBONACI_SEQUENCE_B
  v_last = 0
  v_result = 1
  DO .FIBONACI_SEQUENCE_C WHILE v_from <= v_to
RETURN

PROCEDURE FIBONACI_SEQUENCE_C
  v_new = v_last + v_result
  v_last = v_result
  v_result = v_new
  v_result_str = v_result_str + ALLTRIM(STRING(v_result;10)) + ';'
  v_from = v_from + 1
RETURN


