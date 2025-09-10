within TrainingPack.Day2.SimpleHouse.Building;
model HouseWall
    .TrainingPack.Day2.SimpleHouse.Components.Wall wall(scale = scale ) annotation(Placement(transformation(extent = {{-44.0,-10.0},{-24.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airheatCapacitor(T(start = 278.15),C = 77760) annotation(Placement(transformation(extent = {{62.0,32.0},{82.0,52.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside annotation(Placement(transformation(extent = {{-110,-10},{-90,10}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(Placement(transformation(extent = {{18.0,-10.0},{38.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression con(y = 2 * 1.5 * 14.2) annotation(Placement(transformation(extent = {{-8,30},{12,50}},origin = {0,0},rotation = 0)));
    parameter Real scale = 1;
equation
    connect(wall.inside,convection.solid) annotation(Line(points = {{-24.2,0},{18,0}},color = {191,0,0}));
    connect(convection.fluid,airheatCapacitor.port) annotation(Line(points = {{38,0},{72,0},{72,32}},color = {191,0,0}));
    connect(wall.outside,outside) annotation(Line(points = {{-44,0},{-100,0}},color = {191,0,0}));
    connect(con.y,convection.Gc) annotation(Line(points = {{13,40},{28,40},{28,10}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/1000_F_187045571_1GPYu7GFoJzKuljKRaeowV20vskm3Hzv.jpg",extent={{-98,-96},{98,96}})}));
end HouseWall;
