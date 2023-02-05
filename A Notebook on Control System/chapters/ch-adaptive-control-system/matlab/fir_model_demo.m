% 2nd order system demo
wn = 1;
dampn = 0.5;
sys = tf(wn^2, [1, 2*dampn*wn, wn^2]);