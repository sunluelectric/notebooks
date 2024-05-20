x = 1:15;
y = 2 - 0.5.^(x-1);

figure 
hold on
plot(x, y, 'b.','markersize',15)
grid on
xlabel('$n$','interpreter','latex')
ylabel('$a_n$','interpreter','latex')
axis([1,15,0.5,2.5])
xticks(1:15)
yticks(0.5:0.25:2.5)