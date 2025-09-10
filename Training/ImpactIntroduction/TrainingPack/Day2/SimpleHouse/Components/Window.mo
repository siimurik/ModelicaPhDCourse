within TrainingPack.Day2.SimpleHouse.Components;
model Window
    .Modelica.Thermal.HeatTransfer.Components.ThermalConductor winConductor(G = 3) annotation(Placement(transformation(extent = {{-10.0,50.0},{10.0,70.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside annotation(Placement(transformation(extent = {{-112,50},{-92,70}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b inside annotation(Placement(transformation(extent = {{90,50},{110,70}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b inside1 annotation(Placement(transformation(extent = {{90.0,-70.0},{110.0,-50.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput solRad annotation(Placement(transformation(extent = {{-140.0,-80.0},{-100.0,-40.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain areaWin(k = 2.0 * 1.0) annotation(Placement(transformation(extent = {{-66,-70},{-46,-50}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Math.Gain gFactor(k = 0.5) annotation(Placement(transformation(extent = {{-8,-70},{12,-50}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow solGains annotation(Placement(transformation(extent = {{48,-70},{68,-50}},origin = {0,0},rotation = 0)));
equation
    connect(solGains.port,inside1) annotation(Line(points = {{68,-60},{100,-60}},color = {191,0,0}));
    connect(gFactor.y,solGains.Q_flow) annotation(Line(points = {{13,-60},{48,-60}},color = {0,0,127}));
    connect(areaWin.y,gFactor.u) annotation(Line(points = {{-45,-60},{-10,-60}},color = {0,0,127}));
    connect(solRad,areaWin.u) annotation(Line(points = {{-120,-60},{-68,-60}},color = {0,0,127}));
    connect(winConductor.port_b,inside) annotation(Line(points = {{10,60},{100,60}},color = {191,0,0}));
    connect(winConductor.port_a,outside) annotation(Line(points = {{-10,60},{-102,60}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/3731921.png",origin={0,8},extent={{-99,-105},{99,105}})}));
end Window;
