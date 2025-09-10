within ImpactTrainingSolutions.Day1.W3;
package ComponentDesign
    package Components
        model ElasticShaft
            .Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = J1) annotation(Placement(transformation(extent = {{-50,-10},{-30,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c=c,d=d) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = J2) annotation(Placement(transformation(extent = {{30,-10},{50,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(transformation(extent = {{-110,-10},{-90,10}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(transformation(extent = {{90,-10},{110,10}},origin = {0,0},rotation = 0)));
            parameter .Modelica.Units.SI.Inertia J1 = 0.1 "Inertia 1";
            parameter .Modelica.Units.SI.Inertia J2 = 0.3;
            parameter .Modelica.Units.SI.RotationalSpringConstant c = 1000;
            parameter .Modelica.Units.SI.RotationalDampingConstant d = 1;
        equation
            connect(inertia1.flange_b,springDamper.flange_a) annotation(Line(points = {{-30,0},{-10,0}},color = {0,0,0}));
            connect(springDamper.flange_b,inertia2.flange_a) annotation(Line(points = {{10,0},{30,0}},color = {0,0,0}));
            connect(inertia2.flange_b,flange_b) annotation(Line(points = {{50,0},{100,0}},color = {0,0,0}));
            connect(inertia1.flange_a,flange_a) annotation(Line(points = {{-50,0},{-100,0}},color = {0,0,0}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Rectangle(origin={0,-3},extent={{-86.79775280898876,15.00684600868917},{86,-15}},fillPattern=FillPattern.Solid,fillColor={155,155,155})}),Documentation(info = "<html><p>This is an elastic shaft.</p></html>"));
        end ElasticShaft;
model LumpedIsolation
    .Modelica.Thermal.HeatTransfer.Components.ThermalConductor innerLayer(G = G_inner) annotation(Placement(transformation(extent = {{22.0,-10.0},{42.0,10.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Thermal.HeatTransfer.Components.ThermalConductor outerLayer(G = G_outer) annotation(Placement(transformation(extent = {{-46.0,-10.0},{-26.0,10.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor isolationHeatCapacity(T(start = 283.15),C = C_isolation) annotation(Placement(transformation(extent = {{-10.0,8.0},{10.0,28.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(Placement(transformation(extent = {{-110.0,-10.0},{-90.0,10.0}},rotation = 0.0,origin = {0.0,0.0})));
    .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(Placement(transformation(extent = {{90.0,-10.0},{110.0,10.0}},rotation = 0.0,origin = {0.0,0.0})));
            parameter .Modelica.Units.SI.ThermalConductance G_inner "Thermal conductance on inner side of material" annotation(Dialog(group = Thermal));
            parameter .Modelica.Units.SI.ThermalConductance G_outer "Thermal conductance on outer side of material" annotation(Dialog(group = Thermal));
            parameter .Modelica.Units.SI.HeatCapacity C_isolation annotation(Dialog(group = Thermal));
   
equation
    connect(outerLayer.port_b,isolationHeatCapacity.port) annotation(Line(points = {{-26,0},{0,0},{0,8}},color = {191,0,0}));
    connect(isolationHeatCapacity.port,innerLayer.port_a) annotation(Line(points = {{0,8},{0,0},{22,0}},color = {191,0,0}));
    connect(port_a,outerLayer.port_a) annotation(Line(points = {{-100,0},{-46,0}},color = {191,0,0}));
    connect(innerLayer.port_b,port_b) annotation(Line(points = {{42,0},{100,0}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name"),Rectangle(origin={1,-1},extent={{-69,89},{69,-89}},lineColor={208,2,27},fillPattern=FillPattern.VerticalCylinder),Rectangle(origin={0,-1},extent={{-32,89},{32,-89}},fillPattern=FillPattern.Solid,fillColor={155,155,155}),Line(origin={0,57},points={{31.64250533837,25.227864763300786},{-32,-25}}),Line(origin={0,20},points={{31.64250533837,25.227864763300786},{-32,-25}}),Line(origin={0,-16},points={{31.64250533837,25.227864763300786},{-32,-25}}),Line(origin={0,-52},points={{31.64250533837,25.227864763300786},{-32,-25}}),Line(origin={11.765419456838124,-74.61540496963522},points={{19.877085881531876,15.843269732936008},{-19.877085881531876,-15.843269732935994}}),Line(origin={-16.876477405489982,76.15871151812804},points={{15.000608476041894,12.001981251064038},{-15.000608476041894,-12.001981251064038}})}));
end LumpedIsolation;
    end Components;
    package Experiments
        model TestShaft
            .Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{-50,-8},{-30,12}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(Placement(transformation(extent = {{16,-12},{36,8}},origin = {0,0},rotation = 0)));
            .Modelica.Blocks.Sources.Sine sine(amplitude = 100,f = 2) annotation(Placement(transformation(extent = {{-82,-8},{-62,12}},origin = {0,0},rotation = 0)));
            .ImpactTrainingSolutions.Day1.W3.ComponentDesign.Components.ElasticShaft elasticShaft(J1 = 0.6,J2 = 0.4,c = 100000) annotation(Placement(transformation(extent = {{-14.0,-8.0},{6.0,12.0}},origin = {0.0,0.0},rotation = 0.0)));
        equation
            connect(sine.y,torque.tau) annotation(Line(points = {{-61,2},{-52,2}},color = {0,0,127}));
            connect(torque.flange,elasticShaft.flange_a) annotation(Line(points = {{-30,2},{-14,2}},color = {0,0,0}));
            connect(elasticShaft.flange_b,fixed.flange) annotation(Line(points = {{6,2},{26,2},{26,-2}},color = {0,0,0}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
        end TestShaft;
model TestBench
    .ImpactTrainingSolutions.Day1.W3.ComponentDesign.Components.LumpedIsolation wallSegment(G_inner = 0.12 * 1 / 0.15,G_outer = 0.12 * 1 / 0.15,C_isolation = 0.8 * 0.3e6) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Sine sine(amplitude = 8,f = 1 / 86400,offset = 273.15) annotation(Placement(transformation(extent = {{-100,-10},{-80,10}},origin = {0,0},rotation = 0)));
    .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature innerTemperature(T = 293.15) annotation(Placement(transformation(extent = {{-10.0,-10.0},{10.0,10.0}},origin = {44.0,0.0},rotation = -180.0)));
    .Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outsideTemperature annotation(Placement(transformation(extent = {{-60,-10},{-40,10}},origin = {0,0},rotation = 0)));
equation
    connect(sine.y,outsideTemperature.T) annotation(Line(points = {{-79,0},{-62,0}},color = {0,0,127}));
    connect(innerTemperature.port,wallSegment.port_b) annotation(Line(points = {{34,-1.2246467991473533e-15},{10,-1.2246467991473533e-15},{10,0}},color = {191,0,0}));
    connect(outsideTemperature.port,wallSegment.port_a) annotation(Line(points = {{-40,0},{-10,0}},color = {191,0,0}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end TestBench;
    end Experiments;
end ComponentDesign;
