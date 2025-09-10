within TrainingPack.Day1.W2.ManualCode;
model CoolingARockWithAir
    Real T "State variable";
    parameter Real r=0.1 "m"; 
    parameter Real rho=2230 "kg/m3";
    parameter Real c=880 "J/kg K";
    parameter Real h=1000 "W/m2K";
    parameter Real T_a=273.15+10 "K";
    parameter Real T_0=273.15+20 "K";
    constant Real pi = 4.0 * atan(1.0);
    parameter Real V = 4.0 * pi * r^3 / 3.0 "Volume";
    parameter Real A = 4.0 * pi * r^2 "Area";
    
    // T(t=0) T_0
    initial equation
        T = T_0;
    
    equation
        rho * V * c * der(T) = h * A * (T_a - T);
    
end CoolingARockWithAir;
