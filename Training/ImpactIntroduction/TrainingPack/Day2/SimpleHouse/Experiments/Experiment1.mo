within TrainingPack.Day2.SimpleHouse.Experiments;
model Experiment1
    .TrainingPack.Day2.SimpleHouse.Building.HouseWall houseWall(scale = 1 / 10) annotation(Placement(transformation(extent = {{48.0,-10.0},{68.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(Placement(transformation(extent = {{-10,-10},{10,10}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.Sine OutAirT(amplitude = 5,f = 1 / 86400,phase = -1.57079632679489499834,offset = 273.15) annotation(Placement(transformation(extent = {{-66.0,-10.0},{-46.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(prescribedTemperature.port,houseWall.outside) annotation(Line(points = {{10,0},{48,0}},color = {191,0,0}));
    connect(OutAirT.y,prescribedTemperature.T) annotation(Line(points = {{-45,0},{-12,0}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment1;
