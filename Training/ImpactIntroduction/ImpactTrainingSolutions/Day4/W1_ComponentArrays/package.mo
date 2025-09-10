within ImpactTrainingSolutions.Day4;
package W1_ComponentArrays
    extends .Modelica.Icons.Package;
    model DistributedHeatTransfer "Segmented heat transfer model of cylinder of some material"
        .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Heat port" annotation(Placement(transformation(extent = {{-108,-10},{-88,10}})));
        .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b "Heat port" annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
        .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a ambient "Heat port to ambient" annotation(Placement(transformation(extent = {{-10,-108},{10,-88}})));
        parameter .Modelica.Units.SI.Length L = 1 "Length of cylinder";
        parameter .Modelica.Units.SI.Length d = 0.05 "Diameter of cylinder";
        final parameter .Modelica.Units.SI.Area A = d * .Modelica.Constants.pi * L "Outer area of cylinder (excluding edges)";
        parameter .Modelica.Units.SI.HeatCapacity C = 0.3 "Heat capacity of material";
        parameter .Modelica.Units.SI.CoefficientOfHeatTransfer h = 12 "Heat transfer coefficient between ambient and material";
        parameter .Modelica.Units.SI.ThermalConductance G_internal = 1.2 "Constant internal thermal conductance of material";
        final parameter .Modelica.Units.SI.ThermalConductance Gc_ambient = A * h "Constant thermal conductance of material to ambient";
        parameter .Modelica.Units.SI.Temperature T0 = 293.15 "Start temperature of material";
        .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor capacitance annotation(Placement(transformation(extent = {{-10,32},{10,52}})));
        .Modelica.Thermal.HeatTransfer.Components.ThermalConductor conductorInternal annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
        .Modelica.Thermal.HeatTransfer.Components.Convection convectionAmbient annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {0,-40})));
    equation
        annotation(Icon(coordinateSystem(preserveAspectRatio = false),graphics = {Rectangle(extent={{-100,40},{100,-40}},fillColor={192,192,192},fillPattern=FillPattern.Backward),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={46,-65},rotation=90),Line(points={{40,-40},{40,-76}},color={191,0,0}),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={36,-67},rotation=90),Line(points={{-100,-60},{100,-60}},color={0,127,255}),Line(points={{9.89609e-17,-9},{-6,11}},color={0,127,255},origin={89,-66},rotation=270),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={6,-65},rotation=90),Line(points={{0,-40},{0,-76}},color={191,0,0}),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,-54},rotation=270),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={-4,-67},rotation=90),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={-34,-65},rotation=90),Line(points={{-40,-40},{-40,-76}},color={191,0,0}),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={-44,-67},rotation=90),Line(points={{-100,-80},{100,-80}},color={0,127,255}),Line(points={{-1.23084e-16,-9},{-6,11}},color={0,127,255},origin={89,-86},rotation=270),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,-74},rotation=270),Line(points={{-100,80},{100,80}},color={0,127,255}),Line(points={{9.89609e-17,-9},{-6,11}},color={0,127,255},origin={89,74},rotation=270),Line(points={{-40,76},{-40,40}},color={191,0,0}),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,86},rotation=270),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={-38,77},rotation=90),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={-40,75},rotation=90),Line(points={{-100,60},{100,60}},color={0,127,255}),Line(points={{-1.23084e-16,-9},{-6,11}},color={0,127,255},origin={89,54},rotation=270),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,66},rotation=270),Line(points={{0,76},{0,40}},color={191,0,0}),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={2,77},rotation=90),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={0,75},rotation=90),Line(points={{40,76},{40,40}},color={191,0,0}),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={42,77},rotation=90),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={40,75},rotation=90),Text(extent={{-98,120},{100,94}},lineColor={0,0,255},textString="%name")}),Diagram(coordinateSystem(preserveAspectRatio = false)));
    end DistributedHeatTransfer;
    package Solution
        extends .Modelica.Icons.Package;
        model DistributedHeatTransfer "Segmented heat transfer model of cylinder of some material"
            .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Heat port" annotation(Placement(transformation(extent = {{-108,-10},{-88,10}})));
            .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b "Heat port" annotation(Placement(transformation(extent = {{90,-10},{110,10}})));
            .Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a ambient "Heat port to ambient" annotation(Placement(transformation(extent = {{-10,-108},{10,-88}})));
            parameter Integer N(min = 2) = 3 "Number of segments, minimum of 2";
            parameter .Modelica.Units.SI.Length L = 1 "Length of cylinder";
            parameter .Modelica.Units.SI.Length d = 0.05 "Diameter of cylinder";
            final parameter .Modelica.Units.SI.Area A_n = d * .Modelica.Constants.pi * L / N "Outer area of cylinder element (excluding edges)";
            parameter .Modelica.Units.SI.HeatCapacity C = 0.3 "Heat capacity of material";
            parameter .Modelica.Units.SI.CoefficientOfHeatTransfer h = 12 "Heat transfer coefficient between ambient and material";
            parameter .Modelica.Units.SI.ThermalConductance G_internal = 1.2 "Constant internal thermal conductance of material";
            final parameter .Modelica.Units.SI.ThermalConductance Gc_ambient = A_n * h "Constant thermal conductance of one element to ambient";
            parameter .Modelica.Units.SI.Temperature T0 = 293.15 "Start temperature of material";
            .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor capacitance[N](each C = C / N,each T(fixed = true,start = T0)) annotation(Placement(transformation(extent = {{-10,32},{10,52}})));
            .Modelica.Thermal.HeatTransfer.Components.ThermalConductor conductorInternal[N - 1](each G = G_internal * (N - 1)) annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
            .Modelica.Thermal.HeatTransfer.Components.Convection convectionAmbient[N] annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {0,-40})));
        equation
            for i in 1:N - 1 loop
                connect(conductorInternal[i].port_a,capacitance[i].port);
                connect(conductorInternal[i].port_b,capacitance[i + 1].port);
            end for;
            for i in 1:N loop
                connect(capacitance[i].port,convectionAmbient[i].solid);
                connect(ambient,convectionAmbient[i].fluid);
                convectionAmbient[i].Gc=Gc_ambient;
            end for;
            connect(port_a,capacitance[1].port);
            connect(port_b,capacitance[N].port);
            annotation(Icon(coordinateSystem(preserveAspectRatio = false),graphics = {Rectangle(extent={{-100,40},{100,-40}},fillColor={192,192,192},fillPattern=FillPattern.Backward),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={46,-65},rotation=90),Line(points={{40,-40},{40,-76}},color={191,0,0}),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={36,-67},rotation=90),Line(points={{-100,-60},{100,-60}},color={0,127,255}),Line(points={{9.89609e-17,-9},{-6,11}},color={0,127,255},origin={89,-66},rotation=270),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={6,-65},rotation=90),Line(points={{0,-40},{0,-76}},color={191,0,0}),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,-54},rotation=270),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={-4,-67},rotation=90),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={-34,-65},rotation=90),Line(points={{-40,-40},{-40,-76}},color={191,0,0}),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={-44,-67},rotation=90),Line(points={{-100,-80},{100,-80}},color={0,127,255}),Line(points={{-1.23084e-16,-9},{-6,11}},color={0,127,255},origin={89,-86},rotation=270),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,-74},rotation=270),Line(points={{-100,80},{100,80}},color={0,127,255}),Line(points={{9.89609e-17,-9},{-6,11}},color={0,127,255},origin={89,74},rotation=270),Line(points={{-40,76},{-40,40}},color={191,0,0}),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,86},rotation=270),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={-38,77},rotation=90),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={-40,75},rotation=90),Line(points={{-100,60},{100,60}},color={0,127,255}),Line(points={{-1.23084e-16,-9},{-6,11}},color={0,127,255},origin={89,54},rotation=270),Line(points={{-1.23084e-16,-9},{6,11}},color={0,127,255},origin={89,66},rotation=270),Line(points={{0,76},{0,40}},color={191,0,0}),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={2,77},rotation=90),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={0,75},rotation=90),Line(points={{40,76},{40,40}},color={191,0,0}),Line(points={{-11,6},{-1,2}},color={191,0,0},origin={42,77},rotation=90),Line(points={{-9,-4},{1,6.12323e-17}},color={191,0,0},origin={40,75},rotation=90),Text(extent={{-98,120},{100,94}},lineColor={0,0,255},textString="%name")}),Diagram(coordinateSystem(preserveAspectRatio = false)));
        end DistributedHeatTransfer;
        model DistributedHeatTransferNoArrays
            parameter Integer N(min = 2) = 3 "Number of segments, minimum of 2";
            parameter .Modelica.Units.SI.ThermalConductance G_internal = 1.2 "Constant thermal conductance of material";
            final parameter .Modelica.Units.SI.ThermalConductance G_internal_n = G_internal * (N - 1);
            parameter .Modelica.Units.SI.Length L = 1 "Length of cylinder";
            parameter .Modelica.Units.SI.Length d = 0.05 "Diameter of cylinder";
            final parameter .Modelica.Units.SI.Area A_n = d * .Modelica.Constants.pi * L / N "Outer area of cylinder element (excluding edges)";
            parameter .Modelica.Units.SI.CoefficientOfHeatTransfer h = 12 "Heat transfer coefficient between air and material";
            final parameter .Modelica.Units.SI.ThermalConductance Gc_ambient = A_n * h "Constant thermal conductance of one element to ambient";
            parameter .Modelica.Units.SI.HeatCapacity C = 0.1 "Heat capacity of material";
            parameter .Modelica.Units.SI.Temperature T0 = 293.15 "Start temperature";
            .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor capacitance1(each C = C,T(fixed = true)) annotation(Placement(transformation(extent = {{-70.0,20.0},{-50.0,40.0}},rotation = 0.0,origin = {0.0,0.0})));
            .Modelica.Thermal.HeatTransfer.Components.Convection convectionAmbient1 annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {-60,-30})));
            .Modelica.Thermal.HeatTransfer.Components.ThermalConductor conductorInternal1(each G = G_internal_n) annotation(Placement(transformation(extent = {{-38,-10},{-18,10}})));
            .Modelica.Thermal.HeatTransfer.Components.ThermalConductor conductorInternal2(each G = G_internal_n) annotation(Placement(transformation(extent = {{22,-10},{42,10}})));
            .Modelica.Thermal.HeatTransfer.Components.Convection convectionAmbient2 annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {0,-30})));
            .Modelica.Thermal.HeatTransfer.Components.Convection convectionAmbient3 annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 270,origin = {60,-30})));
            .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor capacitance2(each C = C,T(fixed = true,start = T0)) annotation(Placement(transformation(extent = {{-10.0,20.0},{10.0,40.0}},rotation = 0.0,origin = {0.0,0.0})));
            .Modelica.Thermal.HeatTransfer.Components.HeatCapacitor capacitance3(each C = C,T(fixed = true,start = T0)) annotation(Placement(transformation(extent = {{50,20},{70,40}})));
            .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293.15) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 90,origin = {0,-90})));
            .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(Placement(transformation(extent = {{-58,60},{-38,80}})));
            .Modelica.Blocks.Sources.Step step(height = 10,startTime = 0.5) annotation(Placement(transformation(extent = {{-100,60},{-80,80}})));
            .Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(Placement(transformation(extent = {{80,-10},{100,10}})));
            .Modelica.Blocks.Sources.RealExpression realExpression(y = Gc_ambient) annotation(Placement(transformation(extent = {{-10,-10},{10,10}},rotation = 180,origin = {90,-64})));
        equation
            connect(capacitance1.port,conductorInternal1.port_a) annotation(Line(points = {{-60,20},{-60,0},{-38,0}},color = {191,0,0}));
            connect(conductorInternal1.port_b,capacitance2.port) annotation(Line(points = {{-18,0},{0,0},{0,20}},color = {191,0,0}));
            connect(conductorInternal2.port_a,capacitance2.port) annotation(Line(points = {{22,0},{0,0},{0,20}},color = {191,0,0}));
            connect(conductorInternal2.port_b,capacitance3.port) annotation(Line(points = {{42,0},{60,0},{60,20}},color = {191,0,0}));
            connect(temperatureSensor.port,capacitance3.port) annotation(Line(points = {{80,0},{60,0},{60,20}},color = {191,0,0}));
            connect(prescribedHeatFlow.port,conductorInternal1.port_a) annotation(Line(points = {{-38,70},{-20,70},{-20,50},{-80,50},{-80,0},{-38,0}},color = {191,0,0}));
            connect(prescribedHeatFlow.Q_flow,step.y) annotation(Line(points = {{-58,70},{-79,70}},color = {0,0,127}));
            connect(convectionAmbient3.fluid,fixedTemperature.port) annotation(Line(points = {{60,-40},{60,-58},{4.44089e-16,-58},{4.44089e-16,-80}},color = {191,0,0}));
            connect(convectionAmbient2.fluid,fixedTemperature.port) annotation(Line(points = {{-1.77636e-15,-40},{5.55112e-16,-80}},color = {191,0,0}));
            connect(convectionAmbient1.fluid,fixedTemperature.port) annotation(Line(points = {{-60,-40},{-60,-58},{4.44089e-16,-58},{4.44089e-16,-80}},color = {191,0,0}));
            connect(convectionAmbient2.solid,capacitance2.port) annotation(Line(points = {{1.77636e-15,-20},{0,-20},{0,20}},color = {191,0,0}));
            connect(convectionAmbient1.solid,conductorInternal1.port_a) annotation(Line(points = {{-60,-20},{-60,0},{-38,0}},color = {191,0,0}));
            connect(convectionAmbient3.solid,capacitance3.port) annotation(Line(points = {{60,-20},{60,20}},color = {191,0,0}));
            connect(realExpression.y,convectionAmbient3.Gc) annotation(Line(points = {{79,-64},{76,-64},{76,-30},{70,-30}},color = {0,0,127}));
            connect(realExpression.y,convectionAmbient2.Gc) annotation(Line(points = {{79,-64},{76,-64},{76,-50},{22,-50},{22,-30},{10,-30}},color = {0,0,127}));
            connect(realExpression.y,convectionAmbient1.Gc) annotation(Line(points = {{79,-64},{76,-64},{76,-50},{-44,-50},{-44,-30},{-50,-30}},color = {0,0,127}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false)),Diagram(coordinateSystem(preserveAspectRatio = false)));
        end DistributedHeatTransferNoArrays;
        model TestDistributedHeatTransfer
            DistributedHeatTransfer distributedHeatTransferConvectionArray annotation(Placement(transformation(extent = {{-10,-10},{10,10}})));
            .Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(Placement(transformation(extent = {{-48,-10},{-28,10}})));
            .Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T = 293.15) annotation(Placement(transformation(extent = {{-40.0,-60.0},{-20.0,-40.0}},rotation = 0.0,origin = {0.0,0.0})));
            .Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(Placement(transformation(extent = {{32.0,-10.0},{52.0,10.0}},rotation = 0.0,origin = {0.0,0.0})));
            .Modelica.Blocks.Sources.Step step(height = 10,startTime = 0.5) annotation(Placement(transformation(extent = {{-90,-10},{-70,10}})));
        equation
            connect(fixedTemperature.port,distributedHeatTransferConvectionArray.ambient) annotation(Line(points = {{-20,-50},{0,-50},{0,-9.8}},color = {191,0,0}));
            connect(temperatureSensor.port,distributedHeatTransferConvectionArray.port_b) annotation(Line(points = {{32,0},{10,0}},color = {191,0,0}));
            connect(prescribedHeatFlow.Q_flow,step.y) annotation(Line(points = {{-48,0},{-69,0}},color = {0,0,127}));
            connect(prescribedHeatFlow.port,distributedHeatTransferConvectionArray.port_a) annotation(Line(points = {{-28,0},{-9.8,0}},color = {191,0,0}));
            annotation(Icon(coordinateSystem(preserveAspectRatio = false)),Diagram(coordinateSystem(preserveAspectRatio = false)));
        end TestDistributedHeatTransfer;
    end Solution;
end W1_ComponentArrays;
