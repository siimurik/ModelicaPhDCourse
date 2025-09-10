within ImpactTrainingSolutions.Day4;
package W3_HybridSystems
    package BouncingBall
        model BouncingBall_advanced
            parameter Real e = 0.7 "bounce coeff";
            parameter Real g = 9.81 "gravity acc.";
            Real h(start = 1) "height of ball";
            Real v "velocity of ball";
            Boolean flying(start = true);
            Boolean impact;
            Real v_new;
        equation
            impact=h <= 0.0;
            der(v)=if flying then -g else 0;
            der(h)=v;
            when {impact and v <= 0.0} then
                v_new=if edge(impact) then -e * pre(v) else 0;
                flying=v_new > 0;
                reinit(v,v_new);
            end when;
            annotation(uses(Modelica(version = "3.1")));
        end BouncingBall_advanced;
        model BouncingBall_simple
            parameter Real e = 0.7 "bounce coeff";
            parameter Real g = 9.81 "gravity acc.";
            Real h(start = 1) "height of ball";
            Real v "velocity of ball";
        equation
            der(h)=v;
            der(v)=-g;
            when h < 0 then
                reinit(v,-e * v);
            end when;
        end BouncingBall_simple;
    end BouncingBall;
    package HybridExamples "Some more hybrid examples"
        model Saturation1
            Real x;
            Real y;
            Real y_saturated;
            parameter Real y_min = -0.5;
            parameter Real y_max = 0.5;
            parameter Real f = 200;
        equation
            der(x)=1;
            y=sin(f * x);
            y_saturated=if y < y_min then y_min elseif y > y_max then y_max else y;
            annotation(experiment(StopTime = 1,NumberOfIntervals = 5000,Tolerance = 1e-006),experimentSetupOutput);
        end Saturation1;
        model Saturation2
            Real x;
            Real y;
            Real y_saturated;
            parameter Real y_min = -0.5;
            parameter Real y_max = 0.5;
            parameter Real f = 200;
        equation
            der(x)=1;
            y=sin(f * x);
            y_saturated=noEvent(if y < y_min then y_min elseif y > y_max then y_max else y);
            annotation(experiment(StopTime = 1,NumberOfIntervals = 5000,Tolerance = 1e-006),experimentSetupOutput);
        end Saturation2;
        model Saturation3
            Real x;
            Real y;
            Real y_saturated;
            parameter Real y_min = -0.5;
            parameter Real y_max = 0.5;
            parameter Real f = 200;
        equation
            der(x)=1;
            y=sin(f * x);
            y_saturated=min(y_max,max(y_min,y));
            annotation(experiment(StopTime = 1,NumberOfIntervals = 5000,Tolerance = 1e-006),experimentSetupOutput);
        end Saturation3;
        model Sqrt
            Real x(start = 1,fixed = true);
            Real y;
        equation
            der(x)=-1;
            y=if x > 0 then sqrt(x) else 0;
        end Sqrt;
        model WhenDemo
            parameter Real A = 1.5,w = 4;
            Real x;
            Boolean y;
        equation
            x=A * sin(w * time);
            when x > 0 then
                y=not pre(y);
            end when;
        end WhenDemo;
    end HybridExamples;
end W3_HybridSystems;
