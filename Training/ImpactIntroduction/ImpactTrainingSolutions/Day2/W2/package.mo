within ImpactTrainingSolutions.Day2;
package W2
    model DegreesOfFreedom1
        .Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(Placement(transformation(extent = {{-50,-10},{-30,10}})));
        .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
        .Modelica.Mechanics.Rotational.Components.Inertia inertia2 annotation(Placement(transformation(extent = {{30,-10},{50,10}})));
    equation
        connect(springDamper.flange_a,inertia1.flange_b) annotation(Line(points = {{-10,0},{-30,0}},color = {0,0,0},smooth = Smooth.None));
        connect(inertia2.flange_a,springDamper.flange_b) annotation(Line(points = {{30,0},{10,0}},color = {0,0,0},smooth = Smooth.None));
        annotation(Diagram(graphics));
    end DegreesOfFreedom1;
    model DegreesOfFreedom2
        .Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(Placement(transformation(extent = {{-50,-10},{-30,10}})));
        .Modelica.Mechanics.Rotational.Components.IdealGear gear annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
        .Modelica.Mechanics.Rotational.Components.Inertia inertia2 annotation(Placement(transformation(extent = {{30,-10},{50,10}})));
    equation
        connect(gear.flange_a,inertia1.flange_b) annotation(Line(points = {{-10,0},{-30,0}},color = {0,0,0},smooth = Smooth.None));
        connect(inertia2.flange_a,gear.flange_b) annotation(Line(points = {{30,0},{10,0}},color = {0,0,0},smooth = Smooth.None));
        annotation(Diagram(graphics));
    end DegreesOfFreedom2;
    model DegreesOfFreedom3
        .Modelica.Mechanics.Rotational.Components.Inertia inertia1 annotation(Placement(transformation(extent = {{-50,-10},{-30,10}})));
        .Modelica.Mechanics.Rotational.Components.IdealPlanetary gear annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
        .Modelica.Mechanics.Rotational.Components.Inertia inertia2 annotation(Placement(transformation(extent = {{30,-10},{50,10}})));
        .Modelica.Mechanics.Rotational.Components.Inertia inertia3 annotation(Placement(transformation(extent = {{-40,10},{-20,30}})));
    equation
        connect(inertia1.flange_b,gear.sun) annotation(Line(points = {{-30,0},{-10,0}},color = {0,0,0},smooth = Smooth.None));
        connect(gear.ring,inertia2.flange_a) annotation(Line(points = {{10,0},{30,0}},color = {0,0,0},smooth = Smooth.None));
        connect(inertia3.flange_b,gear.carrier) annotation(Line(points = {{-20,20},{-16,20},{-16,4},{-10,4}},color = {0,0,0},smooth = Smooth.None));
        annotation(Diagram(graphics));
    end DegreesOfFreedom3;
    model DegreesOfFreedom4
        .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
        .Modelica.Mechanics.Rotational.Components.Fixed fixed1 annotation(Placement(transformation(extent = {{-50,-10},{-30,10}})));
        .Modelica.Mechanics.Rotational.Components.Fixed fixed2 annotation(Placement(transformation(extent = {{30,-10},{50,10}})));
    equation
        connect(fixed1.flange,springDamper.flange_a) annotation(Line(points = {{-40,0},{-10,0}},color = {0,0,0},smooth = Smooth.None));
        connect(fixed2.flange,springDamper.flange_b) annotation(Line(points = {{40,0},{10,0}},color = {0,0,0},smooth = Smooth.None));
        annotation(Diagram(graphics));
    end DegreesOfFreedom4;
    model InverseModel
        .Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 0.1) annotation(Placement(transformation(extent = {{-40,-10},{-20,10}})));
        .Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c = 10,d = 0.1) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
        .Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1) annotation(Placement(transformation(extent = {{20,-10},{40,10}})));
        .Modelica.Mechanics.Rotational.Sources.Torque torque annotation(Placement(transformation(extent = {{-70,-10},{-50,10}})));
        .Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(Placement(transformation(extent = {{50,-10},{70,10}})));
        .Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints annotation(Placement(transformation(extent = {{-20,-10},{20,10}},rotation = 180,origin = {0,-40})));
        .Modelica.Blocks.Sources.ExpSine expSine(f = 2,damping = 0.5) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 180,origin = {50,-40})));
    equation
        connect(springDamper.flange_a,inertia1.flange_b) annotation(Line(points = {{-10,0},{-20,0}},color = {0,0,0},smooth = Smooth.None));
        connect(inertia2.flange_a,springDamper.flange_b) annotation(Line(points = {{20,0},{10,0}},color = {0,0,0},smooth = Smooth.None));
        connect(torque.flange,inertia1.flange_a) annotation(Line(points = {{-50,0},{-40,0}},color = {0,0,0},smooth = Smooth.None));
        connect(angleSensor.flange,inertia2.flange_b) annotation(Line(points = {{50,0},{40,0}},color = {0,0,0},smooth = Smooth.None));
        connect(inverseBlockConstraints.y2,torque.tau) annotation(Line(points = {{-17,-40},{-14,-40},{-14,-20},{-80,-20},{-80,0},{-72,0}},color = {0,0,127},smooth = Smooth.None));
        connect(inverseBlockConstraints.u2,angleSensor.phi) annotation(Line(points = {{16,-40},{10,-40},{10,-20},{80,-20},{80,0},{71,0}},color = {0,0,127},smooth = Smooth.None));
        connect(expSine.y,inverseBlockConstraints.u1) annotation(Line(points = {{39,-40},{22,-40}},color = {0,0,127},smooth = Smooth.None));
        annotation(Diagram(graphics));
    end InverseModel;
    package MechanicalTrack
        model MassInGravityField
            inner .Modelica.Mechanics.MultiBody.World world annotation(Placement(transformation(extent = {{-60,-40},{-40,-20}})));
            .Modelica.Mechanics.MultiBody.Parts.Body mass(m = 1) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 0,origin = {10,10})));
            annotation(Diagram(graphics));
        end MassInGravityField;
        model MassWithForce
            extends ImpactTrainingSolutions.Day2.W2.MechanicalTrack.MassInGravityField;
            .Modelica.Mechanics.MultiBody.Forces.WorldForce force annotation(Placement(transformation(extent = {{-30,0},{-10,20}})));
            .Modelica.Blocks.Sources.RealExpression realExpression[3](y = f) annotation(Placement(transformation(extent = {{-60,0},{-40,20}})));
            .Modelica.Units.SI.Force f[3];
        equation
            mass.frame_a.r_0={sin(time),0.1 * time,cos(time)};
            connect(force.frame_b,mass.frame_a) annotation(Line(points = {{-10,10},{0,10}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            connect(realExpression.y,force.force) annotation(Line(points = {{-39,10},{-32,10}},color = {0,0,127}));
            annotation(Diagram(graphics));
        end MassWithForce;
        model MassInPointGravityField
            extends ImpactTrainingSolutions.Day2.W2.MechanicalTrack.MassInGravityField(world(gravityType = .Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity,mu = 1),mass(r_0(fixed = true,start = {0,1,0}),v_0(fixed = true,start = {1,0,0})));
        end MassInPointGravityField;
        model SuspendedMass
            extends ImpactTrainingSolutions.Day2.W2.MechanicalTrack.MassInGravityField(mass(r_0(start = {0,0.1,0},fixed = true),enforceStates = true));
            .Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {-20,70})));
            .Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamper(c = 25,d = 1) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 90,origin = {-20,30})));
        equation
            connect(springDamper.frame_b,fixed.frame_b) annotation(Line(points = {{-20,40},{-20,50},{-20,60},{-20,60}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            connect(springDamper.frame_a,mass.frame_a) annotation(Line(points = {{-20,20},{-20,10},{0,10}},color = {95,95,95},thickness = 0.5,smooth = Smooth.None));
            annotation(Diagram(graphics));
        end SuspendedMass;
        model SuspendedMassSteadyState
            extends ImpactTrainingSolutions.Day2.W2.MechanicalTrack.SuspendedMass(mass(a_0(fixed = true),v_0(fixed = true),r_0(fixed = false),angles_fixed = true,w_0_fixed = true));
        end SuspendedMassSteadyState;
    end MechanicalTrack;
    package ThermalTrack
        model ValveOpening
            Real opening = 1 "Valve opening";
            inner .Modelica.Fluid.System system annotation(Placement(transformation(extent = {{-60,40},{-40,60}})));
            .Modelica.Fluid.Sources.Boundary_pT inlet(p = 200000,nPorts = 1,redeclare replaceable package Medium = .Modelica.Media.Water.WaterIF97_ph) annotation(Placement(transformation(extent = {{-66,-10},{-46,10}})));
            .Modelica.Fluid.Sources.Boundary_pT outlet(nPorts = 1,redeclare replaceable package Medium = Modelica.Media.Water.WaterIF97_ph) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {28,48})));
            .Modelica.Fluid.Valves.ValveCompressible valve(m_flow_nominal = 1,redeclare replaceable package Medium = Modelica.Media.Water.WaterIF97_ph,dp_nominal = 100000,p_nominal = 100000) annotation(Placement(transformation(extent = {{-22,-10},{-2,10}})));
            .Modelica.Blocks.Sources.RealExpression realExpression(y = opening) annotation(Placement(transformation(extent = {{-40,10},{-20,30}})));
            .Modelica.Fluid.Pipes.DynamicPipe pipe(length = 10,diameter = 0.1,height_ab = 10,modelStructure = .Modelica.Fluid.Types.ModelStructure.av_b,redeclare replaceable package Medium = Modelica.Media.Water.WaterIF97_ph,T_start = 293.15) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 90,origin = {28,18})));
        equation
            connect(inlet.ports[1],valve.port_a) annotation(Line(points = {{-46,0},{-22,0}},color = {0,127,255}));
            connect(realExpression.y,valve.opening) annotation(Line(points = {{-19,20},{-12,20},{-12,8}},color = {0,0,127}));
            connect(valve.port_b,pipe.port_a) annotation(Line(points = {{-2,0},{28,0},{28,8}},color = {0,127,255}));
            connect(pipe.port_b,outlet.ports[1]) annotation(Line(points = {{28,28},{28,28},{28,38}},color = {0,127,255}));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false,extent = {{-100,-100},{100,100}})));
        end ValveOpening;
        model ValveMassFlow
            Real opening "Valve opening";
            inner .Modelica.Fluid.System system annotation(Placement(transformation(extent = {{-60,40},{-40,60}})));
            .Modelica.Fluid.Sources.Boundary_pT inlet(p = 200000,nPorts = 1,redeclare replaceable package Medium = .Modelica.Media.Water.WaterIF97_ph) annotation(Placement(transformation(extent = {{-66,-10},{-46,10}})));
            .Modelica.Fluid.Sources.Boundary_pT outlet(nPorts = 1,redeclare replaceable package Medium = Modelica.Media.Water.WaterIF97_ph) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {28,48})));
            .Modelica.Fluid.Valves.ValveCompressible valve(m_flow_nominal = 1,redeclare replaceable package Medium = Modelica.Media.Water.WaterIF97_ph,dp_nominal = 100000,p_nominal = 100000) annotation(Placement(transformation(extent = {{-22,-10},{-2,10}})));
            .Modelica.Fluid.Pipes.DynamicPipe pipe(length = 10,diameter = 0.1,height_ab = 10,modelStructure = .Modelica.Fluid.Types.ModelStructure.av_b,redeclare replaceable package Medium = Modelica.Media.Water.WaterIF97_ph,T_start = 293.15) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 90,origin = {28,18})));
            .Modelica.Blocks.Sources.RealExpression realExpression(y = opening) annotation(Placement(transformation(extent = {{-40,10},{-20,30}})));
        equation
            valve.m_flow=0.1;
            connect(inlet.ports[1],valve.port_a) annotation(Line(points = {{-46,0},{-22,0}},color = {0,127,255}));
            connect(valve.port_b,pipe.port_a) annotation(Line(points = {{-2,0},{28,0},{28,8}},color = {0,127,255}));
            connect(pipe.port_b,outlet.ports[1]) annotation(Line(points = {{28,28},{28,28},{28,38}},color = {0,127,255}));
            connect(realExpression.y,valve.opening) annotation(Line(points = {{-19,20},{-12,20},{-12,8}},color = {0,0,127}));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false,extent = {{-100,-100},{100,100}})));
        end ValveMassFlow;
        model ValveMassFlowAir
            Real opening "Valve opening";
            inner .Modelica.Fluid.System system annotation(Placement(transformation(extent = {{-60,40},{-40,60}})));
            .Modelica.Fluid.Sources.Boundary_pT inlet(p = 200000,nPorts = 1,redeclare package Medium = .Modelica.Media.IdealGases.MixtureGases.CombustionAir) annotation(Placement(transformation(extent = {{-64,-10},{-44,10}})));
            .Modelica.Fluid.Sources.Boundary_pT outlet(nPorts = 1,redeclare package Medium = .Modelica.Media.IdealGases.MixtureGases.CombustionAir) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {28,48})));
            .Modelica.Fluid.Valves.ValveCompressible valve(m_flow_nominal = 1,dp_nominal = 100000,p_nominal = 100000,redeclare package Medium = .Modelica.Media.IdealGases.MixtureGases.CombustionAir) annotation(Placement(transformation(extent = {{-22,-10},{-2,10}})));
            .Modelica.Fluid.Pipes.DynamicPipe pipe(length = 10,diameter = 0.1,height_ab = 10,modelStructure = .Modelica.Fluid.Types.ModelStructure.av_b,T_start = 293.15,redeclare package Medium = .Modelica.Media.IdealGases.MixtureGases.CombustionAir) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 90,origin = {28,18})));
            .Modelica.Blocks.Sources.RealExpression realExpression(y = opening) annotation(Placement(transformation(extent = {{-40,10},{-20,30}})));
        equation
            valve.m_flow=0.1;
            connect(inlet.ports[1],valve.port_a) annotation(Line(points = {{-44,0},{-22,0}},color = {0,127,255}));
            connect(valve.port_b,pipe.port_a) annotation(Line(points = {{-2,0},{28,0},{28,8}},color = {0,127,255}));
            connect(pipe.port_b,outlet.ports[1]) annotation(Line(points = {{28,28},{28,28},{28,38}},color = {0,127,255}));
            connect(realExpression.y,valve.opening) annotation(Line(points = {{-19,20},{-12,20},{-12,8}},color = {0,0,127}));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false,extent = {{-100,-100},{100,100}})));
        end ValveMassFlowAir;
        model ValveOpeningMoon
            extends ValveOpening(system(g = 1.622));
        end ValveOpeningMoon;
        model ValveOpeningSteadyStateInit
            Real opening = 1 "Valve opening";
            inner .Modelica.Fluid.System system(energyDynamics = .Modelica.Fluid.Types.Dynamics.SteadyStateInitial) annotation(Placement(transformation(extent = {{-60,40},{-40,60}})));
            .Modelica.Fluid.Sources.Boundary_pT inlet(p = 200000,nPorts = 1,redeclare package Medium = .Modelica.Media.Water.WaterIF97_pT) annotation(Placement(transformation(extent = {{-66,-10},{-46,10}})));
            .Modelica.Fluid.Sources.Boundary_pT outlet(nPorts = 1,redeclare package Medium = .Modelica.Media.Water.WaterIF97_pT) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {28,48})));
            .Modelica.Fluid.Valves.ValveCompressible valve(m_flow_nominal = 1,redeclare package Medium = .Modelica.Media.Water.WaterIF97_pT,dp_nominal = 100000,p_nominal = 100000) annotation(Placement(transformation(extent = {{-22,-10},{-2,10}})));
            .Modelica.Fluid.Pipes.DynamicPipe pipe(length = 10,diameter = 0.1,height_ab = 10,modelStructure = .Modelica.Fluid.Types.ModelStructure.av_b,redeclare package Medium = .Modelica.Media.Water.WaterIF97_pT,T_start = 293.15) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 90,origin = {28,18})));
            .Modelica.Blocks.Sources.RealExpression realExpression(y = opening) annotation(Placement(transformation(extent = {{-40,10},{-20,30}})));
        equation
            connect(inlet.ports[1],valve.port_a) annotation(Line(points = {{-46,0},{-22,0}},color = {0,127,255}));
            connect(valve.port_b,pipe.port_a) annotation(Line(points = {{-2,0},{28,0},{28,8}},color = {0,127,255}));
            connect(pipe.port_b,outlet.ports[1]) annotation(Line(points = {{28,28},{28,28},{28,38}},color = {0,127,255}));
            connect(realExpression.y,valve.opening) annotation(Line(points = {{-19,20},{-12,20},{-12,8}},color = {0,0,127}));
            annotation(Diagram(coordinateSystem(preserveAspectRatio = false,extent = {{-100,-100},{100,100}})));
        end ValveOpeningSteadyStateInit;
    end ThermalTrack;
end W2;
