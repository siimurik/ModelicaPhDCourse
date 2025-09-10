within TrainingPack.Day1.W2.ManualCode;
model HelloWorld
    Real x "State variable";
    initial equation
        x = 5.0;
    equation
        der(x) = 3.0 - 2.0*x;
end HelloWorld;
