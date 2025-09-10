within ImpactTrainingSolutions.Day1.W2.HeatingSystem.Components;
model Valve
  extends .Modelica.Fluid.Valves.ValveIncompressible(
    CvData=.Modelica.Fluid.Types.CvTypes.OpPoint,
    m_flow_nominal=0.01,
    show_T=true,
    allowFlowReversal=false,
    dp_start=18000,
    dp_nominal=10000);
end Valve;
