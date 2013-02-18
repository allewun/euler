class File
  def File.open_euler(file)
    open "#{CONFIG[:data]}#{file}"
  end
end