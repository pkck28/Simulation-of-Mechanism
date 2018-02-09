function del(i)
    global len1 len2 len3 len4 leng leng1 leng2 Radius;
    global Omega start_button Pause_button Exit_window;
    if( i ~= 0)
            if(i == 1)
                delete(Radius);
                delete(leng);
                delete(Omega);
                delete(start_button);
                delete(Pause_button);
                delete(Exit_window);
            else if(i == 3)
                    delete(Radius);
                    delete(leng1);
                    delete(leng2);
                    delete(Omega);
                    delete(Pause_button);
                    delete(start_button);
                    delete(Exit_window);
                 end
            end
    end
end