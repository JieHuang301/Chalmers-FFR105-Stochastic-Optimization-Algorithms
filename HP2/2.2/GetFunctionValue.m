function functionValue = GetFunctionValue(x1, x2)
    temp1 = (x1.^2 + x2 - 11).^2;
    temp2 = (x1 + x2.^2 -7).^2;
    functionValue = temp1 + temp2;    
end

