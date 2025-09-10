within ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components;
model Pipe
  extends .Modelica.Fluid.Pipes.DynamicPipe(
    use_T_start=true,
    T_start=.Modelica.Units.Conversions.from_degC(80),
    redeclare model HeatTransfer =
        .Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
    diameter=0.01,
    redeclare model FlowModel =
        .Modelica.Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
    length=10,
    p_a_start=130000);

end Pipe;
