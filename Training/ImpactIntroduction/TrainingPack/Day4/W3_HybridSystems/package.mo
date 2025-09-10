within TrainingPack.Day4;
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
end W3_HybridSystems;
