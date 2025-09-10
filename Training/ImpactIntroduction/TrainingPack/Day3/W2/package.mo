within TrainingPack.Day3;
package W2
    model PumpSystemIII
        .TrainingPack.Day3.W2.ElectricMotor motor(J = 10,inertia(J = J,w(start = 40))) annotation(Placement(transformation(extent = {{-4,68},{16,88}})));
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

        annotation(Diagram(coordinateSystem(preserveAspectRatio = true,extent = {{-120,-100},{100,100}}),graphics),Icon(coordinateSystem(preserveAspectRatio = true,extent = {{-120,-100},{100,100}})));
    end PumpSystemIII;
end W2;
