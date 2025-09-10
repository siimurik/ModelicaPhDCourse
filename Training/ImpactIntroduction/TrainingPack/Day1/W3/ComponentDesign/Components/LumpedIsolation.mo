within TrainingPack.Day1.W3.ComponentDesign.Components;
model LumpedIsolation
    .Modelica.Thermal.HeatTransfer.Components.ThermalConductor outerLayer(G = G_inner) annotation(Placement(transformation(extent = {{-50.0,-10.0},{-30.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.ThermalConductor innerLayer(G = G_outer) annotation(Placement(transformation(extent = {{32.0,-10.0},{52.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor isolationHeatCapacity(C = C_isolation) annotation(Placement(transformation(extent = {{-10,30},{10,50}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(Placement(transformation(extent = {{-110,-10},{-90,10}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(Placement(transformation(extent = {{90.0,-10.0},{110.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    parameter .Modelica.Units.SI.ThermalConductance G_inner "Thermal conductance on inner side of wall segment" annotation(Dialog(group = "Thermal"));
    parameter .Modelica.Units.SI.ThermalConductance G_outer "Thermal conductance on outer side of wall segment" annotation(Dialog(group = "Thermal"));
    parameter .Modelica.Units.SI.HeatCapacity C_isolation "Heat capacity of isolation" annotation(Dialog(group = "Thermal"));
equation
    connect(isolationHeatCapacity.port,innerLayer.port_a) annotation(Line(points = {{0,30},{0,0},{32,0}},color = {191,0,0}));
    connect(outerLayer.port_b,innerLayer.port_a) annotation(Line(points = {{-30,0},{32,0}},color = {191,0,0}));
    connect(outerLayer.port_a,port_a) annotation(Line(points = {{-50,0},{-100,0}},color = {191,0,0}));
    connect(innerLayer.port_b,port_b) annotation(Line(points = {{52,0},{100,0}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/wall-thermal-insulation-layer-outline-icon-vector.jpg",origin={0,-2},extent={{-108,-88},{108,88}})}),Documentation(info = "<html><p>A custom-made isolation component.</p></html>"));
end LumpedIsolation;
