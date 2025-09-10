within ImpactTrainingSolutions.Day2.W4.Debugging.CausationSimple;

model ThermalWithStateInitSS
    .Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor(R = 1) annotation(Placement(transformation(extent = {{-50.28530499933013,9.71469500066987},{-37.71469500066987,22.28530499933013}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResistor2(R = 1) annotation(Placement(transformation(extent = {{7.71469500066987,9.71469500066987},{20.28530499933013,22.28530499933013}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293) annotation(Placement(transformation(extent = {{-40.44378812087442,44.26775022129195},{-60.44378812087442,64.26775022129195}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 292) annotation(Placement(transformation(extent = {{16.204142287308343,41.99556050488084},{36.20414228730834,61.99556050488086}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 10,der_T(fixed = true)) annotation(Placement(transformation(extent = {{-26.0,28.0},{-6.0,48.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(fixedTemperature.port,thermalResistor.port_a) annotation(Line(points = {{-60.44378812087442,54.26775022129195},{-72.13905452161833,54.26775022129195},{-72.13905452161833,16},{-50.28530499933013,16}},color = {191,0,0}));
    connect(fixedTemperature2.port,thermalResistor2.port_b) annotation(Line(points = {{36.20414228730834,51.99556050488085},{42.20414228730834,51.99556050488085},{42.20414228730834,16},{20.28530499933013,16}},color = {191,0,0}));
    connect(thermalResistor.port_b,heatCapacitor.port) annotation(Line(points = {{-37.71469500066987,16},{-16,16},{-16,28}},color = {191,0,0}));
    connect(thermalResistor2.port_a,heatCapacitor.port) annotation(Line(points = {{7.71469500066987,16},{-16,16},{-16,28}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ThermalWithStateInitSS;
