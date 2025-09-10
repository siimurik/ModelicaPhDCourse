within TrainingPack.Day3.W3.Experiments;
model Experiment1
    .TrainingPack.Day3.W3.Components.HeatingDemand heatingDemand(nBui = 1) annotation(Placement(transformation(extent = {{-27.56,50.5},{-7.56,70.5}},origin = {0.0,0.0},rotation = 0.0)));
    .TrainingPack.Day3.W3.Components.Substation substation(deltaT = 20,m_flow_nom = 0.04) annotation(Placement(transformation(extent = {{46.6,16.4},{66.6,36.4}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.HeatExchangers.Heater_T hea(dp_nominal = 100,redeclare package Medium = Buildings.Media.Water,m_flow_nominal = 0.04) annotation(Placement(transformation(extent = {{-14.46,-13.3},{5.54,6.7}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.Constant const(k = 273.15 + 80) annotation(Placement(transformation(extent = {{-76.63,1.42},{-56.63,21.42}},origin = {0.0,0.0},rotation = 0.0)));
    .Buildings.Fluid.Sources.Boundary_pT bou(nPorts = 1,redeclare package Medium = Buildings.Media.Water) annotation(Placement(transformation(extent = {{-21.99,-65.0},{-1.99,-45.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(heatingDemand.y,substation.heaDem) annotation(Line(points = {{-5.62,60.55},{52.57,60.55},{52.57,38.41}},color = {0,0,127}));
    connect(substation.port_a,hea.port_b) annotation(Line(points = {{46.55,30.38},{25.77,30.38},{25.77,-3.3},{5.54,-3.3}},color = {0,127,255}));
    connect(substation.port_b,bou.ports[1]) annotation(Line(points = {{46.61,22.37},{37.54,22.37},{37.54,-55},{-1.99,-55}},color = {0,127,255}));
    connect(hea.port_a,substation.port_b) annotation(Line(points = {{-14.46,-3.3},{-20.46,-3.3},{-20.46,-28.2},{31.8,-28.2},{31.8,22.37},{46.61,22.37}},color = {0,127,255}));
    connect(const.y,hea.TSet) annotation(Line(points = {{-55.63,11.42},{-34.99,11.42},{-34.99,4.7},{-16.46,4.7}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment1;
