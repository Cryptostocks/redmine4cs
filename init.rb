Redmine::Plugin.register :redmine4cs do
  name 'Cryptostocks plugin'
  author 'Cryptostocks'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  permission :info, { :info=>[:index]}, :public=>true
  menu :project_menu, :info, {:controller=>'info', :action=>'index'}, :caption=>'Ticker', :after=>:activity, :param=>:project_id, :if=>Proc.new{|x|Cryptostocks.show_ticker(x)}
end
