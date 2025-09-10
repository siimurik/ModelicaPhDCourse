within TrainingPack.Day2.SimpleHouse.Building;
model HouseWallWinRad
    .TrainingPack.Day2.SimpleHouse.Components.Wall wall(scale = scale) annotation(Placement(transformation(extent = {{-44.44,9.33},{-24.44,29.33}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airheatCapacitor(C = 77760,T(start = 278.15)) annotation(Placement(transformation(extent = {{61.56,51.33},{81.56,71.33}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside annotation(Placement(transformation(extent = {{-110.44,9.33},{-90.44,29.33}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(Placement(transformation(extent = {{17.56,9.33},{37.56,29.33}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression con(y = 2 * 1.5 * 14.2) annotation(Placement(transformation(extent = {{-8.44,49.33},{11.56,69.33}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day2.SimpleHouse.Components.Window window annotation(Placement(transformation(extent = {{-68.44,-44.67},{-48.44,-24.67}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.Convection convection2 annotation(Placement(transformation(extent = {{15.56,-38.67},{35.56,-18.67}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.RealExpression realExpression(y = 3.0 * 2.0) annotation(Placement(transformation(extent = {{-20.44,-12.67},{-0.44,7.33}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput u annotation(Placement(transformation(extent = {{-140.44,-60.67},{-100.44,-20.67}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a rad annotation(Placement(transformation(extent = {{62.0,-110.0},{82.0,-90.0}},origin = {0.0,0.0},rotation = 0.0)));
    parameter Real scale = 1;
equation
    connect(wall.inside,convection.solid) annotation(Line(points = {{-24.65,19.34},{17.55,19.34}},color = {191,0,0}));
    connect(convection.fluid,airheatCapacitor.port) annotation(Line(points = {{37.55,19.34},{71.55,19.34},{71.55,51.34}},color = {191,0,0}));
    connect(wall.outside,outside) annotation(Line(points = {{-44.45,19.34},{-100.45,19.34}},color = {191,0,0}));
    connect(con.y,convection.Gc) annotation(Line(points = {{12.55,59.34},{27.55,59.34},{27.55,29.34}},color = {0,0,127}));
    connect(window.solRad,u) annotation(Line(points = {{-70.45,-40.66},{-120.45,-40.66}},color = {0,0,127}));
    connect(window.outside,wall.outside) annotation(Line(points = {{-68.65,-28.66},{-74.65,-28.66},{-74.65,19.34},{-44.45,19.34}},color = {191,0,0}));
    connect(realExpression.y,convection2.Gc) annotation(Line(points = {{0.55,-2.66},{25.55,-2.66},{25.55,-18.66}},color = {0,0,127}));
    connect(window.inside,convection2.solid) annotation(Line(points = {{-48.45,-28.66},{15.55,-28.66}},color = {191,0,0}));
    connect(window.inside1,airheatCapacitor.port) annotation(Line(points = {{-48.45,-40.66},{-30,-40.66},{-30,-48},{71.55,-48},{71.55,51.34}},color = {191,0,0}));
    connect(convection2.fluid,airheatCapacitor.port) annotation(Line(points = {{35.55,-28.66},{71.55,-28.66},{71.55,51.34}},color = {191,0,0}));
    connect(rad,airheatCapacitor.port) annotation(Line(points = {{72,-100},{72,-24.335},{71.56,-24.335},{71.56,51.33}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Bitmap(fileName="modelica://TrainingPack/Resources/house-heating-related-icon-outline-260nw-2300134957.png",origin={-1,0},extent={{-103,-98},{103,98}})}));
end HouseWallWinRad;
