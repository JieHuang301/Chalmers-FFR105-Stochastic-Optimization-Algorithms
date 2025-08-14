x1Input = linspace(-5,5);
x2Input = linspace(-5,5);
[X1temp, X2temp] = meshgrid(x1Input, x2Input);
functionValue = log(0.01 + GetFunctionValue(X1temp, X2temp));
contour(X1temp, X2temp, functionValue, 100);
xlabel('x_1');
ylabel('x_2');
title('Contour Plot of Function Value');
colorbar;