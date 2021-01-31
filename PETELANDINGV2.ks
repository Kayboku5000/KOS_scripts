//hellolaunch
core:part:getmodule("kosprocessor"):doevent("open terminal").
//First, we'll clear the terminal screen to make it look nice
CLEARSCREEN.

//Next, we'll lock our throttle to 100%.
LOCK THROTTLE TO 1.0.   // 1.0 is the max, 0.0 is idle.

SAS ON. // same as SET SAS TO TRUE.



//This is our countdown loop, which cycles from 10 to 0
PRINT "Counting down:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

UNTIL SHIP:MAXTHRUST > 0 {
    WAIT 0.5. // pause half a second between stage attempts.
    PRINT "Stage activated.".
    STAGE. // same as hitting the spacebar.
}

WAIT UNTIL SHIP:ALTITUDE > 500.
PRINT "500 METRES HEIGHT ACHEIVED".
lOCK THROTTLE TO 0.
LEGS ON.
PRINT "LEGS EXTEND".

{ wait until ship:verticalspeed<-100.

PRINT "5 SECOND BURN AT FULL THRUST".
lock throttle to 0.8.
wait 5.

until ship:verticalspeed<-10.} 

lock throttle to 0.15.

WAIT  until ship:verticalspeed-10.

 
LOCK THROTTLE TO 0.
PRINT "SUCCESS!".
wait until false.

// NOTE that it is vital to not just let the script end right away
// here.  Once a kOS script just ends, it releases all the controls
// back to manual piloting so that you can fly the ship by hand again.
// If the program just ended here, then that would cause the throttle
// to turn back off again right away and nothing would happen.