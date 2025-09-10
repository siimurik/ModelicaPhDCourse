within TrainingPack.Day3.W3.Components;
model HeatingDemand
    .Modelica.Blocks.Sources.CombiTimeTable SpaceHeating(tableOnFile = true,fileName = Modelica.Utilities.Files.loadResource("modelica://TrainingPack/Resources/ImportDataForDay3/HeaDem_Hourly.txt"),tableName = "tab1") annotation(Placement(transformation(extent = {{-59.82,19.12},{-39.82,39.12}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain gain(k = nBui) annotation(Placement(transformation(extent = {{39.77,-9.59},{59.77,10.41}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{-10.01,-9.56},{9.99,10.44}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant DomesticHotWater(k = 200) annotation(Placement(transformation(extent = {{-60.4,-39.37},{-40.4,-19.37}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent = {{99.75,-19.19},{139.11,20.17}},origin = {0.0,0.0},rotation = 0.0)));
    parameter Real nBui = 3;
equation
    connect(add.y,gain.u) annotation(Line(points = {{10.99,0.44},{24.38,0.44},{24.38,0.41},{37.77,0.41}},color = {0,0,127}));
    connect(gain.y,y) annotation(Line(points = {{60.77,0.41},{90.25,0.41},{90.25,0.49},{119.43,0.49}},color = {0,0,127}));
    connect(DomesticHotWater.y,add.u2) annotation(Line(points = {{-39.4,-29.37},{-25.7,-29.37},{-25.7,-5.56},{-12.01,-5.56}},color = {0,0,127}));
    connect(SpaceHeating.y[1],add.u1) annotation(Line(points = {{-38.82,29.12},{-25.41,29.12},{-25.41,6.44},{-12.01,6.44}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Rectangle(origin={-1,-30},extent={{-77.53445901747831,70.52644196254306},{77,-70}},fillPattern=FillPattern.Solid),Polygon(origin={0,70},points={{0,30.519344968290994},{-100,-30},{100,-30}},fillPattern=FillPattern.Solid),Rectangle(origin={-2,-19},extent={{-59.082357013594226,59.52644196254305},{60,-59}},fillPattern=FillPattern.Solid,fillColor={255,255,255})}));
end HeatingDemand;
