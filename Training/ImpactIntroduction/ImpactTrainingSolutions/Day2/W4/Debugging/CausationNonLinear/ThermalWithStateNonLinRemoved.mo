within ImpactTrainingSolutions.Day2.W4.Debugging.CausationNonLinear;

model ThermalWithStateNonLinRemoved
    .Modelica.Thermal.HeatTransfer.Components.BodyRadiation bodyRadiation(Gr = 1) annotation(Placement(transformation(extent = {{-37.17455621301775,-3.00295857988165},{-17.174556213017752,16.99704142011835}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor mass(T(start = 373.15,fixed = true),C = 15) annotation(Placement(transformation(extent = {{-84.72555413691458,31.27444586308542},{-63.27444586308542,52.72555413691458}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor mass2(T(start = 273.15,fixed = true),C = 15) annotation(Placement(transformation(extent = {{37.27444586308542,29.27444586308542},{58.72555413691458,50.72555413691458}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Thermal.HeatTransfer.Components.BodyRadiation bodyRadiation2(Gr = 1) annotation(Placement(transformation(extent = {{-2.1834319526627333,-2.997041420118336},{17.816568047337267,17.002958579881664}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor mass3(C = 15,T(start = 373.15,fixed = true)) annotation(Placement(transformation(extent = {{-18.72555413691458,43.27444586308542},{2.7255541369145817,64.72555413691458}},rotation = 0,origin = {0,0})));
equation
    connect(mass.port,bodyRadiation.port_a) annotation(Line(points = {{-74,31.27444586308542},{-74,6.99704142011835},{-37.17455621301775,6.99704142011835}},color = {191,0,0}));
    connect(bodyRadiation.port_b,bodyRadiation2.port_a) annotation(Line(points = {{-17.17455621301775,6.99704142011835},{-5.61094674556214,6.99704142011835},{-5.61094674556214,7.002958579881664},{-2.1834319526627333,7.002958579881664}},color = {191,0,0}));
    connect(mass2.port,bodyRadiation2.port_b) annotation(Line(points = {{48,29.27444586308542},{48,7.002958579881664},{17.816568047337267,7.002958579881664}},color = {191,0,0}));
    connect(mass3.port,bodyRadiation.port_b) annotation(Line(points = {{-8,43.27444586308542},{-8,6.99704142011835},{-17.174556213017752,6.99704142011835}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end ThermalWithStateNonLinRemoved;
