within ImpactTrainingSolutions.Day2.W4.Debugging.CausationNonLinear;

model Simple
    Real x;
    Real y;
    Real z;

    equation
    x+2*y+5*z=3;
    2*x+3*y+3*z=2;
    4*x^2+2*y+12*z=12;
 
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Simple;
