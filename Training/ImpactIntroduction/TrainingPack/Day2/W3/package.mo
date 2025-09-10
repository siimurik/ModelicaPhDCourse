within TrainingPack.Day2;
package W3
    package WorkflowFMU
        model FurutaPendulum
            inner .Modelica.Mechanics.MultiBody.World world(n = {0,0,-1}) annotation(Placement(transformation(extent = {{-100,-10},{-80,10}})));
            .Modelica.Mechanics.MultiBody.Parts.BodyShape Arm1(r = {L1,0,0},r_CM = {L1 / 2,0,0},m = m1) annotation(Placement(transformation(extent = {{-40,-10},{-20,10}})));
            .Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange = true,w(fixed = false),n = {1,0,0},phi(start = theta_start,fixed = true)) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
            .Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true,w(fixed = false)) annotation(Placement(transformation(extent = {{10,-10},{-10,10}},rotation = 180,origin = {-60,0})));
            .Modelica.Mechanics.MultiBody.Parts.BodyShape Arm2(r = {0,0,L2},r_CM = {0,0,L2 / 2},m = m2) annotation(Placement(transformation(extent = {{30,-10},{50,10}})));
            .Modelica.Mechanics.MultiBody.Parts.Body Mass(m = m) annotation(Placement(transformation(extent = {{70,-10},{90,10}})));
            parameter .Modelica.Units.SI.Mass m = 0.021 "Mass of rigid body";
            parameter .Modelica.Units.SI.Mass m1 = 0.072 "mass of Arm1";
            parameter .Modelica.Units.SI.Mass m2 = 0.008 "Mass of Arm2";
            parameter .Modelica.Units.SI.Length L1 = 0.25 "Length of Arm1";
            parameter .Modelica.Units.SI.Length L2 = 0.4 "Length of Arm2";
            .Modelica.Mechanics.Rotational.Sources.Torque torque(useSupport = true) annotation(Placement(transformation(extent = {{-10,10},{10,-10}},rotation = 0,origin = {-76,-60})));
            .Modelica.Blocks.Interfaces.RealInput tau "Accelerating torque acting at flange (= -flange.tau)" annotation(Placement(transformation(extent = {{-140,-80},{-100,-40}})));
            .Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{20,50},{40,70}})));
            .Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(transformation(extent = {{20,20},{40,40}})));
            .Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1 annotation(Placement(transformation(extent = {{-40,-40},{-20,-20}})));
            .Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(Placement(transformation(extent = {{-40,-70},{-20,-50}})));
            parameter .Modelica.Units.SI.Angle theta_start = 0.1;
            .Modelica.Blocks.Interfaces.RealOutput theta annotation(Placement(transformation(extent = {{100,60},{120,80}})));
            .Modelica.Blocks.Interfaces.RealOutput dtheta annotation(Placement(transformation(extent = {{100,20},{120,40}})));
            .Modelica.Blocks.Interfaces.RealOutput phi annotation(Placement(transformation(extent = {{100,-40},{120,-20}})));
            .Modelica.Blocks.Interfaces.RealOutput dphi annotation(Placement(transformation(extent = {{100,-80},{120,-60}})));
        equation
            connect(world.frame_b,revolute.frame_a) annotation(Line(points = {{-80,0},{-70,0},{-70,1.77636e-015}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            connect(revolute.frame_b,Arm1.frame_a) annotation(Line(points = {{-50,-1.77636e-015},{-50,-1.77636e-015},{-50,0},{-40,0}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            connect(Arm1.frame_b,revolute1.frame_a) annotation(Line(points = {{-20,0},{-10,0}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            connect(Arm2.frame_a,revolute1.frame_b) annotation(Line(points = {{30,0},{10,0}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            connect(Arm2.frame_b,Mass.frame_a) annotation(Line(points = {{50,0},{70,0}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            connect(torque.support,revolute.support) annotation(Line(points = {{-76,-50},{-76,-50},{-76,-24},{-76,-24},{-76,-20},{-66,-20},{-66,-10}},color = {0,0,0},smooth = Smooth.None));
            connect(torque.tau,tau) annotation(Line(points = {{-88,-60},{-120,-60}},color = {0,0,127},smooth = Smooth.None));
            connect(speedSensor1.flange,revolute.axis) annotation(Line(points = {{-40,-60},{-60,-60},{-60,-10}},color = {0,0,0},smooth = Smooth.None));
            connect(angleSensor1.flange,revolute.axis) annotation(Line(points = {{-40,-30},{-60,-30},{-60,-10}},color = {0,0,0},smooth = Smooth.None));
            connect(speedSensor.flange,revolute1.axis) annotation(Line(points = {{20,30},{0,30},{0,10}},color = {0,0,0},smooth = Smooth.None));
            connect(angleSensor.flange,revolute1.axis) annotation(Line(points = {{20,60},{0,60},{0,10}},color = {0,0,0},smooth = Smooth.None));
            connect(angleSensor.phi,theta) annotation(Line(points = {{41,60},{72,60},{72,70},{110,70}},color = {0,0,127},smooth = Smooth.None));
            connect(speedSensor.w,dtheta) annotation(Line(points = {{41,30},{110,30}},color = {0,0,127},smooth = Smooth.None));
            connect(angleSensor1.phi,phi) annotation(Line(points = {{-19,-30},{110,-30}},color = {0,0,127},smooth = Smooth.None));
            connect(speedSensor1.w,dphi) annotation(Line(points = {{-19,-60},{70,-60},{70,-70},{110,-70}},color = {0,0,127},smooth = Smooth.None));
            connect(torque.flange,revolute.axis) annotation(Line(points = {{-66,-60},{-60,-60},{-60,-10}},color = {0,0,0},smooth = Smooth.None));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false,extent = {{-100,-100},{100,100}}),graphics),Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100,-100},{100,100}})));
        end FurutaPendulum;
    end WorkflowFMU;
    package WorkflowMultiStageSim
        package DataAccess
            extends .Modelica.Icons.Package;
            model DataAccessBlock
                constant String filename = .Modelica.Utilities.Files.loadResource("modelica://TrainingPack/Resources/example.xml");
                parameter .Modelon.DataAccess.XmlFile access(filename = filename) annotation(Placement(transformation(extent = {{-20,-20},{20,20}})));
                parameter Real m = access.getReal("m");
                parameter Real c = access.getReal("c");
                parameter Real d = access.getReal("d");
                parameter Real t_write = 0.9;
                parameter Real t_store = 1;
                .Modelica.Blocks.Interfaces.RealInput value annotation(Placement(transformation(extent = {{-140,-20},{-100,20}},origin = {0,0},rotation = 0)));
            equation
                when (time >= t_write) then
                    access.putReal("distance",value);
                end when;
                when (time >= t_store) then
                    access.saveAsFile(filename);
                end when;
                annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}),experiment(StopTime = 20));
            end DataAccessBlock;
            model DataAccessBlockRead
                constant String filename = .Modelica.Utilities.Files.loadResource("modelica://TrainingPack/Resources/example.xml");
                parameter .Modelon.DataAccess.XmlFile access(filename = filename) annotation(Placement(transformation(extent = {{-20,-20},{20,20}})));
                parameter Real m = access.getReal("m");
                parameter Real c = access.getReal("c");
                parameter Real d = access.getReal("d");
                parameter Real distance = access.getReal("distance");
                annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}),experiment(StopTime = 20));
            end DataAccessBlockRead;
        end DataAccess;
        model Step1_Setup
            .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(Placement(transformation(extent = {{54.585671768707485,0.5823767006802711},{74.58567176870748,20.58237670068027}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(Placement(transformation(extent = {{-25.414328231292515,20.58237670068027},{-5.414328231292515,40.58237670068027}},origin = {0,0},rotation = 0)));
            .Modelica.Blocks.Sources.RealExpression spring_preload(y = 10) annotation(Placement(transformation(extent = {{-93.41432823129252,20.58237670068027},{-73.41432823129252,40.58237670068027}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Translational.Components.Mass mass(m = 1.2) annotation(Placement(transformation(extent = {{8.909651360544231,20.252869897959187},{28.90965136054423,40.25286989795919}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Translational.Sources.Force force annotation(Placement(transformation(extent = {{-59.414328231292515,20.58237670068027},{-39.414328231292515,40.58237670068027}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 5,d = 2) annotation(Placement(transformation(extent = {{35.57631802721089,20.252869897959187},{55.57631802721089,40.25286989795919}},origin = {0,0},rotation = 0)));
        equation
            connect(forceSensor.flange_b,mass.flange_a) annotation(Line(points = {{-5.414328231292515,30.58237670068027},{-5.414328231292515,30.252869897959187},{8.909651360544238,30.252869897959187}},color = {0,127,0}));
            connect(force.flange,forceSensor.flange_a) annotation(Line(points = {{-39.414328231292515,30.58237670068027},{-25.414328231292515,30.58237670068027}},color = {0,127,0}));
            connect(spring_preload.y,force.f) annotation(Line(points = {{-72.41432823129252,30.58237670068027},{-61.414328231292515,30.58237670068027}},color = {0,0,127}));
            connect(mass.flange_b,springDamper.flange_a) annotation(Line(points = {{28.90965136054424,30.252869897959187},{35.576318027210895,30.252869897959187}},color = {0,127,0}));
            connect(springDamper.flange_b,fixed.flange) annotation(Line(points = {{55.57631802721089,30.252869897959187},{64.58567176870748,30.252869897959187},{64.58567176870748,10.582376700680271}},color = {0,127,0}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}),experiment(StopTime = 20));
        end Step1_Setup;
        model Step2_DynamicAnalysis
            .Modelica.Mechanics.Translational.Components.Fixed fixed annotation(Placement(transformation(extent = {{54.585671768707485,0.5823767006802711},{74.58567176870748,20.58237670068027}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Translational.Components.Mass mass(m = dataAccessBlock.m,s(start = dataAccessBlock.distance,fixed = true)) annotation(Placement(transformation(extent = {{8.909651360544231,20.252869897959187},{28.90965136054423,40.25286989795919}},origin = {0,0},rotation = 0)));
            .Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = dataAccessBlock.c,d = dataAccessBlock.d) annotation(Placement(transformation(extent = {{35.57631802721089,20.252869897959187},{55.57631802721089,40.25286989795919}},origin = {0,0},rotation = 0)));
            .TrainingPack.Day2.W3.WorkflowMultiStageSim.DataAccess.DataAccessBlockRead dataAccessBlock annotation(Placement(transformation(extent = {{-20,-40},{0,-20}},origin = {0,0},rotation = 0)));
        equation
            connect(mass.flange_b,springDamper.flange_a) annotation(Line(points = {{28.90965136054424,30.252869897959187},{35.576318027210895,30.252869897959187}},color = {0,127,0}));
            connect(springDamper.flange_b,fixed.flange) annotation(Line(points = {{55.57631802721089,30.252869897959187},{64.58567176870748,30.252869897959187},{64.58567176870748,10.582376700680271}},color = {0,127,0}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}),experiment(StopTime = 20));
        end Step2_DynamicAnalysis;
    end WorkflowMultiStageSim;
    package MultiSim
        extends .Modelica.Icons.Package;
        model SeriesDriveCycle "Drive cycle experiment for a series hybrid powertrain"
          extends Electrification.Examples.SeriesDriveCycle(
            driver(
              redeclare replaceable Electrification.Utilities.DriveCycles.AccelerateDecelerate driveCycle(
                tMax=1000000,
                tPeriod=1100000,
                vMax(displayUnit="km/h") = 19.444444444444)),
            battery(
              SoC_min = 0.1, SOC_start = 0.9,
              limitActionSoC = Electrification.Utilities.Types.FaultAction.Terminate,
              redeclare replaceable Electrification.Batteries.Records.Summary summary));
          annotation (experiment(StopTime=100000, Interval=1000));
        end SeriesDriveCycle;    end MultiSim;
end W3;
