function Pause(object_handle,event)
    global gcf;
    global p;
    global Pause_button;
    if p == 1;
        p = 0;
        set(Pause_button,'String','Resume',...
            'ToolTip','Press to Resume the simulation')
        uiwait(gcf);
    else
        p = 1;
        set(Pause_button,'String','Pause',...
            'ToolTip','Press to Pause the simulation')
        uiresume(gcf);
    end
end