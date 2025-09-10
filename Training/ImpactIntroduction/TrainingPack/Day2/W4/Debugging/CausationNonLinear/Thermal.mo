within TrainingPack.Day2.W4.Debugging.CausationNonLinear;

model Thermal
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293) annotation(Placement(transformation(extent = {{-28.042337975122024,37.38317533619919},{-48.042337975122024,57.38317533619919}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.BodyRadiation bodyRadiation(Gr = 1) annotation(Placement(transformation(extent = {{-37.17455621301775,-3.00295857988165},{-17.17455621301775,16.99704142011835}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.BodyRadiation bodyRadiation2(Gr = 1) annotation(Placement(transformation(extent = {{-2.1834319526627333,-2.997041420118336},{17.816568047337267,17.002958579881664}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature2(T = 993) annotation(Placement(transformation(extent = {{7.884893682806847,37.83745433902211},{27.884893682806847,57.83745433902211}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(fixedTemperature.port,bodyRadiation.port_a) annotation(Line(points = {{-48.042337975122024,47.38317533619919},{-66.44378812087442,47.38317533619919},{-66.44378812087442,6.99704142011835},{-37.17455621301775,6.99704142011835}},color = {191,0,0}));
    connect(bodyRadiation.port_b,bodyRadiation2.port_a) annotation(Line(points = {{-17.17455621301775,6.99704142011835},{-5.61094674556214,6.99704142011835},{-5.61094674556214,7.002958579881664},{-2.1834319526627333,7.002958579881664}},color = {191,0,0}));
    connect(fixedTemperature2.port,bodyRadiation2.port_b) annotation(Line(points = {{27.884893682806847,47.83745433902211},{44.8504773471882,47.83745433902211},{44.8504773471882,7.002958579881664},{17.816568047337267,7.002958579881664}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Thermal;
