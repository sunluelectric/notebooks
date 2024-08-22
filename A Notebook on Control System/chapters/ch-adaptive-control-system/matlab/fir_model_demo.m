% 2nd order system demo
wn = 1;
dampn = 0.5;
sys = tf(wn^2, [1, 2*dampn*wn, wn^2]);
impulse(sys)
grid on
xlabel('$t$', 'interpreter', 'latex')
ylabel('$y(t)$', 'interpreter', 'latex')