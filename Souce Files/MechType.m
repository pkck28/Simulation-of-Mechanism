function MechType(object_handle,event)
   global Dropdown;
   global k;
   s = get(Dropdown,'value');
   if( s == 2)
        del(k);
        SliderCrankGUI();
        k = 1;
   else
           if(s == 3)
                del(k);
                WWGUI();
                k = 3;
           end   
   end
end