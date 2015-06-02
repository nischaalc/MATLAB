function [ position ] = problem1Week8(rlength, off, bobmass, grav, time)

position = ((off)*(pi/180)) * cos(sqrt(grav/rlength)*(time));

end
