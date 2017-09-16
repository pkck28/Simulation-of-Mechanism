function Slider_crank(object_handle,event,Radius,leng)
        global e1;  
        rstr = get(Radius,'string');
        lstr = get(leng,'string');
        r = str2double(rstr);
        l = str2double(lstr);
        for thetha = 0:0.1:10*pi;
            if e1 == 0 ; % For closing the window
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
                subplot('Position',[0.2 0.1 0.75 0.35]);
                plot(x,y,'-b*','LineWidth',5);
                hold on;
                plot(x1,y1,'-g*','LineWidth',5) 
                hold off;
                title('Simulation');
                axis([-r-1 r+l+1 -r-1 r+1]);
                axis equal
                %Position Vector Plot
                subplot('Position',[0.2 0.55 0.35 0.4]);
                quiver(X,Y,u,v,'AutoScale','off','Color',[1 0 0]);
                title('Positon Vector');
                axis([-r-1 r+l+1 -r-1 r+1]);
                %Velocity Vector Plot
                subplot('Position',[0.6 0.55 0.35 0.4]);
                quiver([0,0,-r*sin(thetha)],[0,0,r*cos(thetha)],...
                    [-r*sin(thetha),(-r*sin(thetha) - ((r^2)*sin(thetha)*cos(thetha)/(sqrt(l^2-(r*sin(thetha))^2)))),(-(((r^2)*sin(thetha)*cos(thetha)/(sqrt(l^2-(r*sin(thetha))^2)))))],...
                    [r*cos(thetha),0,-r*cos(thetha)],'AutoScale','off');
                title('Velocity Vector');
                axis([-r-1 r+1 -r-1 r+1]);
                pause(0.000001);
            else
                break;
            end
        end
end