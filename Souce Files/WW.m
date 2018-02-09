function WW(object_handle,event,Radius,leng1,leng2)
        global e1 w Pause_button;
        rstr = get(Radius,'string');
        lstr = get(leng1,'string');
        l1str = get(leng2,'string');
        r = str2double(rstr);
        l = str2double(lstr);
        l1 = str2double(l1str);
        thetha = 0;
        s = 20 + l + r;
        set(Pause_button,'String','Pause',...
            'ToolTip','Press to Pause the simulation');
        while thetha >  -10*pi
            if e1 == 0  % if conditon for exit function 
                % For getting points in space
                Ax = r * cos(thetha);
                Ay = r * sin(thetha);
                k = sqrt( 50^2 + r^2 - 2*sin(thetha)*50*r );
                O4A4 = sqrt(50^2 + r^2 + (2*r*50*cos(pi/3)));
                phi = asin(r * sin(pi/2 - thetha) / k);
                Bx = l*cos(pi/2+phi);
                By = l*sin(pi/2+phi) + 50;
                Cx = s*cos(phi-pi/2);
                Cy = s*sin(phi-pi/2) + 50;
                Dx = sqrt(l1^2 - ((l*sin(pi/2-phi))-20)^2) + Bx;
                Dy = 20+50;
                A4x = O4A4*cos(pi/2 - phi);
                A4y = 50 - O4A4*sin(pi/2 - phi);
                x = [0,Ax];
                y = [0,Ay];
                x1 = [Cx,Bx];
                y1 = [Cy,By];
                x2 = [Bx,Dx];
                y2 = [By,Dy];
                %Simulation Plot
                subplot('Position',[0.2 0.075 0.35 0.4]); 
                plot(x,y,'-bo','LineWidth',3);
                hold on
                plot(0,50,'-go','LineWidth',3);
                plot(x1,y1,'-ro','LineWidth',3);
                rectangle('Position',[(Dx-10) (Dy-5) 20 10],...
                    'FaceColor',[1 0 0],...
                    'LineWidth',0.01,...
                    'curvature',0.5);
                plot(x2,y2,'-g','LineWidth',3);
                text(1,0.5,'O_{2}');
                text(A4x,A4y,'A_{4}');
                text(Ax +0.7,Ay,'A_{3}');
                text(1,50,'O_{4}');
                text(Bx+1,By+1,'B');
                text(Dx+1,Dy+1,'C');
                hold off
                title('Simulation');
                axis([-r-(l/3) r+(l/3) -s s+r]);
                axis equal
                %Position Vector Plot
                subplot('Position',[0.2 0.55 0.35 0.4]);
                quiver(0,0,Ax,Ay,'AutoScale','off');
                hold on;
                quiver(0,0,A4x,A4y,'AutoScale','off');
                quiver(Ax,Ay,A4x-Ax,A4y-Ay,'AutoScale','off');
                quiver(0,0,Bx,By-50,'AutoScale','off');
                quiver(0,0,Dx,0,'AutoScale','off');
                quiver(Bx,By-50,Dx-Bx,50-By,'AutoScale','off');
                text(1,1,'O');
                text(Ax,Ay,'A_{3}');
                text(A4x,A4y,'A_{4}');
                text(Bx+1,By-49,'B');
                text(Dx+1,0,'C');
                hold off;
                title('Positon Vector');
                axis([-100 100 -100 100]);
                %axis equal
                %Velocity Vector Plot
                subplot('Position',[0.6 0.55 0.35 0.4]);
                w4 = -(r*sin(thetha)*w)/(k*cos(phi));
                quiver(0,0,w*r*sin(thetha),-w*r*cos(thetha),'AutoScale','off');   %for Va3
                hold on;
                quiver(0,0,w4*O4A4*sin(pi/2 - phi) + 2*w*r*sin(thetha),-w4*O4A4*cos(pi/2 - phi),'AutoScale','off'); %for Va4
                quiver(w*r*sin(thetha),-w*r*cos(thetha),w4*O4A4*sin(pi/2 - phi) + w*r*sin(thetha),-w4*O4A4*cos(pi/2-phi) + w*r*cos(thetha),'AutoScale','off');  %for Va4a3
                quiver(0,0,w4*l*cos(phi),w4*l*sin(phi),'AutoScale','off');  %for Vb
                quiver(0,0,(w4*l*cos(phi)) - (w4*l*cos(pi/2 - phi)*l*sin(pi/2 - phi)/sqrt(l1^2 - ((l*sin(pi/2-phi))-20)^2)),0,'AutoScale','off');  %for Vc
                quiver(w4*l*cos(phi),w4*l*sin(phi),-(w4*l*cos(pi/2 - phi)*l*sin(pi/2 - phi)/sqrt(l1^2 - ((l*sin(pi/2-phi))-20)^2)),...
                -w4*l*sin(phi),'AutoScale','off'); % for Vcb
                text(-0.25,-0.25,'O');
                text(w*r*sin(thetha)-0.1,-w*r*cos(thetha)-0.1,'A3');
                text(w4*k*sin(phi-pi/2)-0.1,-w4*k*cos(pi/2-phi)-0.1,'A4');
                text(w4*l*cos(phi),w4*l*sin(phi),'B');
                text((w4*l*cos(phi)) - (w4*l*cos(pi/2 - phi)*l*sin(pi/2 - phi)/sqrt(l1^2 - ((l*sin(pi/2-phi))-20)^2)),0,'C');
                hold off;
                title('Velocity Vector');
                axis([-100*w 100*w -100*w 100*w]);
                axis equal
                %Acceleration Plot
                subplot('Position',[0.6 0.075 0.35 0.4]);
                title('Accelearation Vector');
                alpha4 = (w4^2)*tan(phi) - ((w^2)*r*cos(thetha)/(k*cos(phi)));
                quiver(0,0,w^2*r*cos(pi + thetha),w^2*r*sin(pi + thetha),'AutoScale','off');  %for Aa3T
                hold on;
                quiver(0,0,w4*w4*O4A4*cos(pi/2 + phi),w4*w4*O4A4*sin(pi/2 + phi),'AutoScale','off');   %for A4n
                quiver(w4*w4*O4A4*cos(pi/2 + phi),w4*w4*O4A4*sin(pi/2 + phi),alpha4*O4A4*cos(phi),alpha4*O4A4*sin(phi),'AutoScale','off'); % A4t
                quiver(0,0, alpha4*O4A4*cos(phi) + w4*w4*O4A4*cos(pi/2 + phi),w4*w4*O4A4*sin(pi/2 + phi) + alpha4*O4A4*sin(phi),'AutoScale','off','LineStyle','--');% for A4T
                quiver(w^2*r*cos(pi + thetha),w^2*r*sin(pi + thetha), alpha4*O4A4*cos(phi) + w4*w4*O4A4*cos(pi/2 + phi) - w^2*r*cos(pi + thetha),...
                w4*w4*O4A4*sin(pi/2 + phi) + alpha4*O4A4*sin(phi) - w^2*r*sin(pi + thetha),'AutoScale','off'); %for Aa4a3
                text(1,1,'O');
                text(w^2*r*cos(pi + thetha)+1,w^2*r*sin(pi + thetha)+1,'A_{3}');
                text(w4*w4*O4A4*cos(pi/2 + phi),w4*w4*O4A4*sin(pi/2 + phi),'A_{4*}');
                text(alpha4*O4A4*cos(phi) + w4*w4*O4A4*cos(pi/2 + phi),w4*w4*O4A4*sin(pi/2 + phi) + alpha4*O4A4*sin(phi),'A_{4}');
                hold off;
                axis([-50*w*w 50*w*w -50*w*w 50*w*w]);
                axis equal
                thetha = thetha - (0.1*w); 
                pause(0.1);
            else
                break;
            end
        end
end