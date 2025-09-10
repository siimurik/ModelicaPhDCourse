within TrainingPack.Day2.CoolingSystem.Components;
model Chiller
    .Modelica.Blocks.Sources.Constant a(k = 29.043) annotation(Placement(transformation(extent = {{-68.94,13.82},{-48.94,33.82}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.HeatExchangers.SensibleCooler_T coo(redeclare package Medium = Buildings.Media.Water,QMin_flow = -2800,m_flow_nominal = 0.15,dp_nominal = 0) annotation(Placement(transformation(extent = {{-10.09,-10.09},{9.91,9.91}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{99.63,42.68},{134.37,77.42}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput Twater annotation(Placement(transformation(extent = {{-139.83,59.99},{-99.83,99.99}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput Tsource annotation(Placement(transformation(extent = {{-139.83,20.44},{-99.83,60.44}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Fluid.Interfaces.FluidPort_a returnWat(redeclare replaceable package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{-109.84,-9.41},{-89.84,10.59}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Fluid.Interfaces.FluidPort_b supplyWat(redeclare replaceable package Medium = .Buildings.Media.Water) annotation(Placement(transformation(extent = {{89.8,-10.0},{109.8,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain Q_coo(k = -1) annotation(Placement(transformation(extent = {{24.53,16.09},{42.23,33.79}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain slope(k = -0.085) annotation(Placement(transformation(extent = {{-65.07,49.42},{-45.07,69.42}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Add COP annotation(Placement(transformation(extent = {{-14.87,40.97},{5.13,60.97}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Division P annotation(Placement(transformation(extent = {{57.96,48.76},{77.96,68.76}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(coo.TSet,Twater) annotation(Line(points = {{-12.09,7.91},{-23.64,7.91},{-23.64,79.99},{-119.83,79.99}},color = {0,0,127}));
    connect(slope.u,Tsource) annotation(Line(points = {{-67.07,59.42},{-93.44999999999999,59.42},{-93.44999999999999,40.44},{-119.83,40.44}},color = {0,0,127}));
    connect(a.y,COP.u2) annotation(Line(points = {{-47.94,23.82},{-32.58,23.82},{-32.58,44.97},{-16.87,44.97}},color = {0,0,127}));
    connect(slope.y,COP.u1) annotation(Line(points = {{-44.07,59.42},{-30.65,59.42},{-30.65,56.97},{-16.87,56.97}},color = {0,0,127}));
    connect(coo.Q_flow,Q_coo.u) annotation(Line(points = {{10.91,7.91},{16.835,7.91},{16.835,24.94},{22.76,24.94}},color = {0,0,127}));
    connect(COP.y,P.u2) annotation(Line(points = {{6.13,50.97},{30.69,50.97},{30.69,52.76},{55.96,52.76}},color = {0,0,127}));
    connect(P.y,y) annotation(Line(points = {{78.96,58.76},{97.8,58.76},{97.8,60.05},{117,60.05}},color = {0,0,127}));
    connect(Q_coo.y,P.u1) annotation(Line(points = {{43.11,24.94},{49.11,24.94},{49.11,44.85},{44.02,44.85},{44.02,64.76},{55.96,64.76}},color = {0,0,127}));
    connect(coo.port_a,returnWat) annotation(Line(points = {{-10.09,-0.09},{-99.84,-0.09},{-99.84,0.59}},color = {0,127,255}));
    connect(coo.port_b,supplyWat) annotation(Line(points = {{9.91,-0.09},{54.86,-0.09},{54.86,0},{99.8,0}},color = {0,127,255}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/outline-chiller-icon-isolated-black-simple-line-vector-28248886.png",extent={{-104,-99},{104,99}})}));
end Chiller;
