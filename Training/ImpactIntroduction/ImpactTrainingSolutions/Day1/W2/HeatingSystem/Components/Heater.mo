within ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components;
model Heater
  extends .Modelica.Fluid.Pipes.DynamicPipe(
    use_T_start=true,
    T_start=.Modelica.Units.Conversions.from_degC(80),
    length=2,
    redeclare model HeatTransfer =
        .Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer,
    diameter=0.01,
    nNodes=1,
    redeclare model FlowModel =
        .Modelica.Fluid.Pipes.BaseClasses.FlowModels.DetailedPipeFlow,
    use_HeatTransfer=true,
    modelStructure=.Modelica.Fluid.Types.ModelStructure.a_v_b,
    p_a_start=130000);

end Heater;
