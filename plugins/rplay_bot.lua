do 

local function run(msg, matches) 

if ( msg.text ) then

  if ( msg.to.type == "user" ) then

     return "للتحدث مع المطور معرفه @D_1_T \n  👾 "
     
  end 
   
end 

-- #DEV @Th3_BOOS

end 

return { 
  patterns = { 
       "(.*)$"
  }, 
  run = run, 
} 

end 
-- By @D_1_T
