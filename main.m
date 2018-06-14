clear
clc
close all

[SENSOR,GT] = readLog();
complementaryFilterAHRS(SENSOR,GT)
temp = 1;