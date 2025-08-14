function output = RunFFNN(weightIH, weightHO, input, constantOfActivationFunction)
    localFieldIH = weightIH * [input; -1];
    valueHidden = 1./(1+exp(-constantOfActivationFunction * localFieldIH));
    localFieldHO = weightHO * [valueHidden; -1];
    output = 1./(1+exp(-constantOfActivationFunction * (localFieldHO)));
end

