within ImpactTrainingSolutions.Day2.W4.Debugging.CausationSimple;

model ThermalWithState
    .Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R = 1) annotation(Placement(transformation(extent = {{-36.28530499933013,3.7146950006698702},{-23.71469500066987,16.28530499933013}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor2(R = 1) annotation(Placement(transformation(extent = {{3.7146950006698702,3.7146950006698702},{16.28530499933013,16.28530499933013}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293) annotation(Placement(transformation(extent = {{-40.0,40.0},{-60.0,60.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 292) annotation(Placement(transformation(extent = {{20.0,39.99999999999999},{40.0,60.00000000000001}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 10,T(start = 300,fixed = true)) annotation(Placement(transformation(extent = {{-20.0,38.0},{0.0,58.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(fixedTemperature.port,thermalResistor.port_a) annotation(Line(points = {{-60,50},{-70,50},{-70,10},{-36.28530499933013,10}},color = {191,0,0}));
    connect(fixedTemperature2.port,thermalResistor2.port_b) annotation(Line(points = {{40,50},{48,50},{48,10},{16.28530499933013,10}},color = {191,0,0}));
    connect(thermalResistor.port_b,heatCapacitor.port) annotation(Line(points = {{-23.71469500066987,10},{-10,10},{-10,38}},color = {191,0,0}));
    connect(thermalResistor2.port_a,heatCapacitor.port) annotation(Line(points = {{3.7146950006698702,10},{-10,10},{-10,38}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ThermalWithState;
