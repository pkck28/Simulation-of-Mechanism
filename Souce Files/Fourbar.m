function Fourbar(len)
   global k;
   %global w;
   k1 = k;
   i = 1;
   num = (len(1)^2 + len(4)^2 - len(3)^2 - len(2)^2);
   div = (2 * len(1) * len(4));
   term = (len(2)*len(3))/(len(1)*len(4));
   toggle = [ acos(num / div + term)  acos(num / div - term)];
   if (abs(toggle(1) - toggle(2)) < pi)
     thetha = min(toggle):0.1:(max(toggle));
     while i < numel(thetha) ;
           if(k1 == k)
                % Calculation of1 Ax and Ay
                Ax = len(1)*cos(thetha(i));
                Ay = len(1)*sin(thetha(i));
                % Calculation of Bx and By
                S = (len(1)^2 - len(2)^2 + len(3)^2 - len(4)^2)/(2*(Ax - len(4)));
                P = ((Ay*Ay)/((Ax - len(4))^2)) + 1;
                Q = (2*Ay*(len(4)-S))/(Ax - len(4));
                R = ((len(4) - S)^2) - (len(3)^2);
                By = (-Q - sqrt(Q*Q - 4*P*R))/(2*P);
                Bx = S - ((2*Ay*By)/(2*(Ax - len(4))));
                %Inputs for plotting
                x = [0,Ax];
                y = [0,Ay];
                x1 = [x(2),Bx];
                y1 = [y(2),By];
                x2 = [len(4),Bx];
                y2 = [0,By];
                %plotting
                subplot('Position',[0.1 0.15 0.8 0.7]);
                plot(x,y,'-b*','LineWidth',10); hold on;
                plot(x1,y1,'-g*','LineWidth',10);
                plot(x2,y2,'-y*','LineWidth',10);hold off;
                title('Simulation');
                axis([-10 7+len(4) -5-max(len(1),len(3)) 5+max(len(1),len(3))]);
                pause(0.1);
           else
                break;
           end
           i = i + 1 ;
     end
   else
     thetha = 0:0.1:2*pi;
     while i < numel(thetha);
           if(k1 == k)
                % Calculation of1 Ax and Ay
                Ax = len(1)*cos(thetha(i));
                Ay = len(1)*sin(thetha(i));
                % Calculation of Bx and By
                S = (len(1)^2 - len(2)^2 + len(3)^2 - len(4)^2)/(2*(Ax - len(4)));
                P = ((Ay*Ay)/((Ax - len(4))^2)) + 1;
                Q = (2*Ay*(len(4)-S))/(Ax - len(4));
                R = ((len(4) - S)^2) - (len(3)^2);
                if len(1) == len(3) && len(2) == len(4);
                    if rem(thetha(i),(2*pi)) <= pi
                        By = (-Q + sqrt(Q*Q - 4*P*R))/(2*P);
                        Bx = S - ((2*Ay*By)/(2*(Ax - len(4))));
                    else
                        By = (-Q - sqrt(Q*Q - 4*P*R))/(2*P);
                        Bx = S - ((2*Ay*By)/(2*(Ax - len(4))));
                    end
                else
                    By = (-Q + sqrt(Q*Q - 4*P*R))/(2*P);
                    Bx = S - ((2*Ay*By)/(2*(Ax - len(4))));
                end 
                %Inputs for plotting
                x = [0,Ax];
                y = [0,Ay];
                x1 = [x(2),Bx];
                y1 = [y(2),By];
                x2 = [len(4),Bx];
                y2 = [0,By];
                %plotting
                subplot('Position',[0.1 0.2 0.8 0.6]);
                plot(x,y,'-b*','LineWidth',10); hold on;
                plot(x1,y1,'-g*','LineWidth',10);
                plot(x2,y2,'-y*','LineWidth',10);hold off;
                title('Simulation');
                axis([-10 7+len(4) -5-max(len(1),len(3)) 5+max(len(1),len(3))]);
                pause(0.1);
           else
                break;
           end
           i = i + 1;
     end
   end
   k = k + 1;
end