within ImpactTrainingSolutions.Day3;
package W2
    model SolarCollector
        parameter Real a0 = 0.75;
        parameter Real a1 = 4.4;
        parameter Real a2 = 0.004;
        parameter .Modelica.Units.SI.Area A = 500;
        Real eff "Collector efficiency";
        Real F;
        .Modelica.Blocks.Interfaces.RealInput G "Global radiation incident" annotation(Placement(transformation(extent = {{-110,24},{-70,64}}),iconTransformation(extent = {{-110,20},{-70,60}})));
        parameter .Modelica.Units.SI.Temperature T_amb = .Modelica.Units.Conversions.from_degC(15) "Ambient temperature";
        .Modelica.Blocks.Interfaces.RealInput theta annotation(Placement(transformation(extent = {{-110,-62},{-70,-22}})));
        .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port annotation(Placement(transformation(extent = {{70,-10},{110,30}})));
        constant .Modelica.Units.SI.Angle theta_0 = .Modelica.Units.Conversions.from_deg(84.4);
    equation
        port.Q_flow=-eff * A * G;
        eff=F * (a0 - a1 * (port.T - T_amb) / max(G,0.0001) - a2 * (port.T - T_amb) ^ 2 / (max(G,0.0001)));
        F=if theta > theta_0 then 0.0 else 1 - 0.108 * (1 / cos(theta) - 1);
        annotation(Diagram(graphics),Icon(graphics));
    end SolarCollector;
    model PumpSystemIII
        .ImpactTrainingSolutions.Day3.W2.ElectricMotor motor(J = 10,inertia(J = J,w(start = 40))) annotation(Placement(transformation(extent = {{-4,68},{16,88}})));
        .Modelica.Blocks.Continuous.LimPID PID(yMin = 0,yMax = 500,initType = .Modelica.Blocks.Types.Init.NoInit,Td = 20,Ti = 130,controllerType = .Modelica.Blocks.Types.SimpleController.PID,k = 120) annotation(Placement(transformation(extent = {{-40,68},{-20,88}})));
        .Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{62,68},{82,88}})));
        replaceable .Modelica.Blocks.Sources.Constant speed_sp(k = 1) constrainedby .Modelica.Blocks.Interfaces.SO annotation(Placement(transformation(extent = {{-80,68},{-60,88}})));
        parameter .Modelica.Units.SI.Inertia J = 10 "Moment of inertia";
        .Modelica.Fluid.Sources.FixedBoundary source(nPorts = 1,redeclare package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater,p = 100000) annotation(Placement(transformation(extent = {{-94,-88},{-74,-68}})));
        .Modelica.Fluid.Sources.FixedBoundary sink(nPorts = 1,redeclare package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater,p = 100000) annotation(Placement(transformation(extent = {{92,-90},{72,-70}})));
        .Modelica.Fluid.Machines.Pump pump(redeclare package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater,N_nominal = 130,redeclare function flowCharacteristic = .Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0,0.1},head_nominal = {10,0})) annotation(Placement(transformation(extent = {{-58,-88},{-38,-68}})));
        .Modelica.Fluid.Vessels.OpenTank tank(nPorts = 2,redeclare package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater,height = 3,crossArea = 5,portsData = {.Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),.Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)}) annotation(Placement(transformation(extent = {{-18,-20},{22,20}})));
        .Modelica.Fluid.Pipes.DynamicPipe pipe(redeclare package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater,length = 10,diameter = 0.05,height_ab = 10,use_HeatTransfer = true,redeclare model HeatTransfer = .Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.ConstantFlowHeatTransfer(alpha0 = 2000),nNodes = 1,modelStructure = .Modelica.Fluid.Types.ModelStructure.av_b) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 90,origin = {-26,-46})));
        .Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater,dp_nominal = 5000,m_flow_nominal = 5) annotation(Placement(transformation(extent = {{30,-58},{50,-38}})));
        .Modelica.Blocks.Sources.Step step(startTime = 20,offset = 0.001,height = 0.5) annotation(Placement(transformation(extent = {{90,-4},{70,16}})));
        inner .Modelica.Fluid.System system annotation(Placement(transformation(extent = {{-92,12},{-72,32}})));
        .Modelica.Blocks.Sources.RealExpression tankLevel(y = tank.level) annotation(Placement(transformation(extent = {{-82,38},{-62,58}})));
        SolarCollector collector(A = 500,T_amb = 288.15) annotation(Placement(transformation(extent = {{-70,-58},{-50,-38}})));
        .Modelica.Blocks.Sources.Sine G(f = 1 / 86400.0,amplitude = 1000.0,phase = -1.5707963267949) annotation(Placement(transformation(extent = {{-116,-36},{-102,-22}})));
        .Modelica.Blocks.Sources.Sine theta(f = 1 / 86400.0,amplitude = 60,phase = 1.5707963267949,offset = 100) annotation(Placement(transformation(extent = {{-116,-60},{-102,-46}})));
        .Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(Placement(transformation(extent = {{-94,-60},{-78,-44}})));
    equation
        connect(PID.y,motor.u) annotation(Line(points = {{-19,78},{-5.2,78}},color = {0,0,127},smooth = Smooth.None));
        connect(speed_sp.y,PID.u_s) annotation(Line(points = {{-59,78},{-42,78}},color = {0,0,127},smooth = Smooth.None));
        connect(motor.m1,speedSensor.flange) annotation(Line(points = {{16,78},{62,78}},color = {0,0,0},smooth = Smooth.None));
        connect(motor.m1,pump.shaft) annotation(Line(points = {{16,78},{30,78},{30,38},{-48,38},{-48,-68}},color = {0,0,0},smooth = Smooth.None));
        connect(source.ports[1],pump.port_a) annotation(Line(points = {{-74,-78},{-58,-78}},color = {0,127,255},smooth = Smooth.None));
        connect(pump.port_b,pipe.port_a) annotation(Line(points = {{-38,-78},{-26,-78},{-26,-56}},color = {0,127,255},smooth = Smooth.None));
        connect(tank.ports[1],valveLinear.port_a) annotation(Line(points = {{-2,-20},{4,-20},{4,-32},{22,-32},{22,-48},{30,-48}},color = {0,127,255},smooth = Smooth.None));
        connect(pipe.port_b,tank.ports[2]) annotation(Line(points = {{-26,-36},{-26,-32},{-2,-32},{-2,-20},{6,-20}},color = {0,127,255},smooth = Smooth.None));
        connect(valveLinear.port_b,sink.ports[1]) annotation(Line(points = {{50,-48},{62,-48},{62,-80},{72,-80}},color = {0,127,255},smooth = Smooth.None));
        connect(valveLinear.opening,step.y) annotation(Line(points = {{40,-40},{40,6},{69,6}},color = {0,0,127},smooth = Smooth.None));
        connect(tankLevel.y,PID.u_m) annotation(Line(points = {{-61,48},{-30,48},{-30,66}},color = {0,0,127},smooth = Smooth.None));
        connect(G.y,collector.G) annotation(Line(points = {{-101.3,-29},{-76,-29},{-76,-44},{-69,-44}},color = {0,0,127},smooth = Smooth.None));
        connect(pipe.heatPorts[1],collector.port) annotation(Line(points = {{-30.4,-45.9},{-40.2,-45.9},{-40.2,-47},{-51,-47}},color = {127,0,0},smooth = Smooth.None));
        connect(from_deg.u,theta.y) annotation(Line(points = {{-95.6,-52},{-98.45,-52},{-98.45,-53},{-101.3,-53}},color = {0,0,127},smooth = Smooth.None));
        connect(from_deg.y,collector.theta) annotation(Line(points = {{-77.2,-52},{-73.1,-52},{-73.1,-52.2},{-69,-52.2}},color = {0,0,127},smooth = Smooth.None));
        annotation(Diagram(coordinateSystem(preserveAspectRatio = true,extent = {{-120,-100},{100,100}}),graphics),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-120,-100},{100,100}})));
    end PumpSystemIII;
    model SolarCollectorTest
        SolarCollector solarCollector annotation(Placement(transformation(extent = {{-22,2},{-2,22}})));
        .Modelica.Blocks.Sources.Sine G(f = 1 / 86400.0,amplitude = 1000.0,phase = -1.5707963267949) annotation(Placement(transformation(extent = {{-84,16},{-64,36}})));
        .Modelica.Blocks.Sources.Sine theta(f = 1 / 86400.0,amplitude = 60,offset = 100,phase = 1.5707963267949) annotation(Placement(transformation(extent = {{-84,-16},{-64,4}})));
        .Modelica.Blocks.Math.UnitConversions.From_deg from_deg annotation(Placement(transformation(extent = {{-52,-16},{-32,4}})));
        .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 288.15) annotation(Placement(transformation(extent = {{40,4},{20,24}})));
    equation
        connect(G.y,solarCollector.G) annotation(Line(points = {{-63,26},{-34,26},{-34,16},{-21,16}},color = {0,0,127},smooth = Smooth.None));
        connect(from_deg.u,theta.y) annotation(Line(points = {{-54,-6},{-63,-6}},color = {0,0,127},smooth = Smooth.None));
        connect(solarCollector.theta,from_deg.y) annotation(Line(points = {{-21,7.8},{-26,7.8},{-26,-6},{-31,-6}},color = {0,0,127},smooth = Smooth.None));
        connect(fixedTemperature.port,solarCollector.port) annotation(Line(points = {{20,14},{8.5,14},{8.5,13},{-3,13}},color = {191,0,0},smooth = Smooth.None));
        annotation(Diagram(graphics));
    end SolarCollectorTest;
end W2;
