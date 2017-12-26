function Slider_crank(object_handle,event,Radius,leng)
        global e1;  
        global w;
        global sp1;
        global sp2;
        global sp3;
        global sp4;
        rstr = get(Radius,'string');
        lstr = get(leng,'string');
        r = str2double(rstr);
        l = str2double(lstr);
        thetha = 0;
        while thetha < 10*pi
            if e1 == 0 
                % For closing the window
                Ax = r * cos(thetha);
                Ay = r * sin(thetha);
                By = 0;
                Bx = r*cos(thetha) + sqrt(l^2 - (r * sin(thetha))^2);
                % points for plotting
                x = [0,Ax];
                y = [0,Ay];
                x1 = [x(2),Bx];
                y1 = [y(2),By];
                X = [x,x(1)];
                Y = [y,y(1)];
                u = [Ax,Bx-Ax,Bx];
                v = [Ay,-Ay,0];
                %Simulation Plot
                sp1 = subplot('Position',[0.2 0.075 0.35 0.4]); 
                plot(x,y,'-bo','Linewidth',5);
                hold on;
                rectangle('Position',[(Bx-0.5) (By-0.3) 1 0.6],...
                    'FaceColor',[1 0 0],...
                    'LineWidth',0.01,...
                    'curvature',0.5);
                plot(x1,y1,'-go','Linewidth',5)
                text([-0.25,Ax+0.2,Bx+0.05],[-0.25,Ay+0.2,By+0.45],['O';'A';'B']);
                hold off;
                title('Simulation');
                axis([-r-1 r+l+1 -r-1 r+1]);
                axis equal
                %Position Vector Plot
                sp3 = subplot('Position',[0.2 0.55 0.35 0.4]);
                quiver(X,Y,u,v,'AutoScale','off','Color',[1 0 0]);
                text([-0.15,Ax+0.2,Bx+0.1],[-0.15,Ay+0.2,By],['O';'A';'B']);
                text([Ax/2,Bx/2],[Ay/2,0],['R_{A}';'R_{B}']);
                text(Ax+(Bx-Ax)/2,Ay/2,'R_{BA}');
                title('Positon Vector');
                axis([-r-3 r+l+3 -r-3 r+3]);
                axis equal
                %Velocity Vector Plot
                sp2 = subplot('Position',[0.6 0.55 0.35 0.4]);
                quiver([0,0,-w*r*sin(thetha)],[0,0,w*r*cos(thetha)],...
                    [-w*r*sin(thetha),((-r*w*sin(thetha)) - ((w*(r^2)*sin(thetha)*cos(thetha))/(sqrt(l^2-(r*sin(thetha))^2)))),(-(((r^2)*w*sin(thetha)*cos(thetha)/(sqrt(l^2-((r*sin(thetha))^2))))))],...
                    [w*r*cos(thetha),0,-w*r*cos(thetha)],'AutoScale','off');
                text([-0.15,((-r*w*sin(thetha)) - ((w*(r^2)*sin(thetha)*cos(thetha))/(sqrt(l^2-(r*sin(thetha))^2))))-0.15,-w*r*sin(thetha)-0.15],[-0.15,0-0.1,w*r*cos(thetha)-0.1],['O';'B';'A']);
                text([-w*r*sin(thetha)/2,((-r*w*sin(thetha)) - ((w*(r^2)*sin(thetha)*cos(thetha))/(sqrt(l^2-(r*sin(thetha))^2))))/2],[w*r*cos(thetha)/2,-0.15],['V_{A}';'V_{B}']);
                text( -w*r*sin(thetha) + ((-(((r^2)*w*sin(thetha)*cos(thetha)/(sqrt(l^2-((r*sin(thetha))^2))))))/2) ,...
                    w*r*cos(thetha)/2,'V_{BA}');
                title('Velocity Vector');
                axis([w*(-r-1) w*(r+1) w*(-r-1) w*(r+1)]);
                axis equal
                %Acceleration Plot
                sp4 = subplot('Position',[0.6 0.075 0.35 0.4]);
                w3 = ((w*r*cos(thetha)*l)/(sqrt(l*l - (r*r*sin(thetha)*sin(thetha)))))/l;
                phi = pi - (asin((r*sin(thetha))/l));
                alpha3 = ((w3*w3*l*sin(phi)) - (w*r*sin(thetha))) / (l*cos(phi));
                quiver([0,0,w*w*r*cos(pi + thetha)],[0,0,w*w*r*sin(pi + thetha)],...
                    [w*w*r*cos(pi + thetha),-( (w*w*r*cos(thetha)) + ((((w*r)^2)*cos(2*thetha))/sqrt(l*l - (r*sin(thetha))^2)) + ((w*w*r^4*sin(2*thetha)^2)/(4*(l*l - (r*sin(thetha))^2)))),...
                    -(((((w*r)^2)*cos(2*thetha))/sqrt(l*l - (r*sin(thetha))^2)) + ((w*w*r^4*sin(2*thetha)^2)/(4*(l*l - (r*sin(thetha))^2))))],...
                    [w*w*r*sin(pi + thetha),0,w*w*r*sin(thetha)],'AutoScale','off','Color',[0.5 0.5 0.5]);
                text([-0.15,w*w*r*cos(pi + thetha),-( (w*w*r*cos(thetha)) + ((((w*r)^2)*cos(2*thetha))/sqrt(l*l - (r*sin(thetha))^2)) + ((w*w*r^4*sin(2*thetha)^2)/(4*(l*l - (r*sin(thetha))^2))))-0.15],...
                    [-0.15,w*w*r*sin(pi + thetha),-0.15],...
                    ['O';'A';'B']);
                text([w*w*r*cos(pi + thetha)/2+0.1 , -( (w*w*r*cos(thetha)) + ((((w*r)^2)*cos(2*thetha))/sqrt(l*l - (r*sin(thetha))^2)) + ((w*w*r^4*sin(2*thetha)^2)/(4*(l*l - (r*sin(thetha))^2)))) /2 ],...
                    [w*w*r*sin(pi + thetha)/2,0.1],...
                    ['A_{A}';'A_{B}']);
                text( w*w*r*cos(pi + thetha) +  -(((((w*r)^2)*cos(2*thetha))/sqrt(l*l - (r*sin(thetha))^2)) + ((w*w*r^4*sin(2*thetha)^2)/(4*(l*l - (r*sin(thetha))^2)))) /2, - w*w*r*sin(thetha)/2,'A_{BA}');
                title('Accelearation Vector');
                axis([-3.2*w*w 3.2*w*w -3.2*w*w 3.2*w*w]);
                axis equal
                thetha = thetha + (0.1*w); 
                pause(0.1);
            else
                break;
            end
        end
end