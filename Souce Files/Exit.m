function Exit(object_handle,event)
    global e1;
    e1 = 1;
    global gcf;
    close(gcf);
end