function[position, period, freq] = problem2Week8( rlength, off, bobmass, grav, time    )

position = ((off)*(pi/180)) * cos(sqrt(grav/rlength)*(time));
period = (2*pi)*sqrt(rlength/grav);
freq = 1/time;

end
