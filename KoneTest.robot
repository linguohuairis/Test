*** Settings ***
Library           /usr/local/lib/python2.7/dist-packages/JMeterLib.py
Library           Collections

*** Test Cases ***
cardoor
    ${logPath}=    set variable    ./KoneTestResult/jmeterlog.jtl
    run jmeter    /root/apache-jmeter-3.2/bin/jmeter    ./kone_GetCarDoor.jmx    ${logPath}
    analyse jtl convert    ${logPath}
    ${result}    analyse jtl convert    ${logPath}
    log    ${result}
    : FOR    ${ELEMENT}    IN    @{result}
    \    log dictionary    ${ELEMENT}
    \    ${value}=    Get from dictionary    ${ELEMENT}    samplesSuccessRateInclAssert
    \    Should Be True    ${value}==100
