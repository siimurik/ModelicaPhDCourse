within TrainingPack.Day2.SimpleHouse.Building;

model HouseWallWin
    .TrainingPack.Day2.SimpleHouse.Components.Wall wall(scale = scale ) annotation(Placement(transformation(extent = {{-44.0,-10.0},{-24.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airheatCapacitor(T(start = 278.15),C = 77760) annotation(Placement(transformation(extent = {{62.0,32.0},{82.0,52.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside annotation(Placement(transformation(extent = {{-110,-10},{-90,10}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(Placement(transformation(extent = {{18.0,-10.0},{38.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression con(y = 2 * 1.5 * 14.2) annotation(Placement(transformation(extent = {{-8,30},{12,50}},origin = {0,0},rotation = 0)));
    parameter Real scale = 1;
    .TrainingPack.Day2.SimpleHouse.Components.Window window annotation(Placement(transformation(extent = {{-68.0,-64.0},{-48.0,-44.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(Placement(transformation(extent = {{16.0,-58.0},{36.0,-38.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression realExpression(y = 3.0 * 2.0) annotation(Placement(transformation(extent = {{-20.0,-32.0},{0.0,-12.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-140.0,-80.0},{-100.0,-40.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(wall.inside,convection.solid) annotation(Line(points = {{-24.2,0},{18,0}},color = {191,0,0}));
    connect(convection.fluid,airheatCapacitor.port) annotation(Line(points = {{38,0},{72,0},{72,32}},color = {191,0,0}));
    connect(wall.outside,outside) annotation(Line(points = {{-44,0},{-100,0}},color = {191,0,0}));
    connect(con.y,convection.Gc) annotation(Line(points = {{13,40},{28,40},{28,10}},color = {0,0,127}));
    connect(window.solRad,u) annotation(Line(points = {{-70,-60},{-120,-60}},color = {0,0,127}));
    connect(window.outside,wall.outside) annotation(Line(points = {{-68.2,-48},{-74.2,-48},{-74.2,0},{-44,0}},color = {191,0,0}));
    connect(realExpression.y,convection2.Gc) annotation(Line(points = {{1,-22},{26,-22},{26,-38}},color = {0,0,127}));
    connect(window.inside,convection2.solid) annotation(Line(points = {{-48,-48},{16,-48}},color = {191,0,0}));
    connect(window.inside1,airheatCapacitor.port) annotation(Line(points = {{-48,-60},{-48,-78},{72,-78},{72,32}},color = {191,0,0}));
    connect(convection2.fluid,airheatCapacitor.port) annotation(Line(points = {{36,-48},{72,-48},{72,32}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/house-that-looks-like-museum-with-three-windows-square-shape-icon-outline_969863-46364.jpg",origin={-1,0},extent={{-99.05390666067983,-97.7152755763577},{99,98}})}));
end HouseWallWin;
