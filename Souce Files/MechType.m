function MechType(object_handle,event)
   global Dropdown;
   s = get(Dropdown,'value');
   if( s == 3)
        SliderCrankGUI();
   else
       if( s == 2)
          FourBarGUI(); 
       end    
   end
end