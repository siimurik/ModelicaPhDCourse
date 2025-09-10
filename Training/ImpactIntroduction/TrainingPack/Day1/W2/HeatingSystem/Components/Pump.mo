within TrainingPack.Day1.W2.HeatingSystem.Components;
model Pump
  extends .Modelica.Fluid.Machines.ControlledPump(
    N_nominal=1500,
    use_T_start=true,
    T_start=.Modelica.Units.Conversions.from_degC(40),
    m_flow_start=0.01,
    m_flow_nominal=0.01,
    control_m_flow=false,
    allowFlowReversal=false,
    p_a_start=110000,
    p_b_start=130000,
    p_a_nominal=110000,
    p_b_nominal=130000);
end Pump;
