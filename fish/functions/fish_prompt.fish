function fish_prompt
  if test $USER = root
    set pwd_color $fish_color_cwd_root
    set char '# '
  else
    set pwd_color $fish_color_cwd
    set char '> '
  end
    
  set_color $pwd_color
  echo -n (prompt_pwd)
  set_color normal
  echo -n $char
end
