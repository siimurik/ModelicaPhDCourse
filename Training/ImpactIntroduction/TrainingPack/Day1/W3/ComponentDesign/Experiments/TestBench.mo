within TrainingPack.Day1.W3.ComponentDesign.Experiments;
model TestBench
    .TrainingPack.Day1.W3.ComponentDesign.Components.LumpedIsolation lumpedIsolation(G_inner = 0.12 * 1 / (0.15),G_outer = 0.12 * 1 / (0.15),C_isolation = 0.8 * 0.3e3) annotation(Placement(transformation(extent = {{10.0,-10.0},{30.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293.15) annotation(Placement(transformation(extent = {{68.0,10.0},{48.0,-10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(Placement(transformation(extent = {{-32.0,-10.0},{-12.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine sine(amplitude = 8,f = 1 / 86400,offset = 273.15) annotation(Placement(transformation(extent = {{-68.0,-10.0},{-48.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(sine.y,prescribedTemperature.T) annotation(Line(points = {{-47,0},{-34,0}},color = {0,0,127}));
    connect(prescribedTemperature.port,lumpedIsolation.port_a) annotation(Line(points = {{-12,0},{10,0}},color = {191,0,0}));
    connect(lumpedIsolation.port_b,fixedTemperature.port) annotation(Line(points = {{30,0},{48,0}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end TestBench;
