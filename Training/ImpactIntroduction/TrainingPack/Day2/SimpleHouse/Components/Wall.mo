within TrainingPack.Day2.SimpleHouse.Components;
model Wall
    .Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R = 0.059) annotation(Placement(transformation(extent = {{-54,-10},{-34,10}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor2(R = 0.059) annotation(Placement(transformation(extent = {{34,-10},{54,10}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor WallheatCapacitor(C = 1718200 * scale,T(start = 278.15)) annotation(Placement(transformation(extent = {{-10.0,28.0},{10.0,48.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside annotation(Placement(transformation(extent = {{-110.0,-10.0},{-90.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b inside annotation(Placement(transformation(extent = {{88.0,-10.0},{108.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    parameter Real scale = 1;
equation
    connect(thermalResistor.port_b,thermalResistor2.port_a) annotation(Line(points = {{-34,0},{34,0}},color = {191,0,0}));
    connect(WallheatCapacitor.port,thermalResistor2.port_a) annotation(Line(points = {{0,28},{0,0},{34,0}},color = {191,0,0}));
    connect(thermalResistor.port_a,outside) annotation(Line(points = {{-54,0},{-100,0}},color = {191,0,0}));
    connect(thermalResistor2.port_b,inside) annotation(Line(points = {{54,0},{98,0}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/35253948-brick-wall-texture-background-in-square-ratio.jpg",origin={0,1},extent={{-100.05390666067983,99.23476202907739},{100,-99}})}));
end Wall;
