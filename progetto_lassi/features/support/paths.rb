# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the login page/
      '/users/sign_in'

    when /^admin homepage/
      '/'
    
    
    when /^travels/
      '/travels'
      
    when /^Offri un passaggio/
      '/travels/new'
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
      
    when /^the home\s?page$/
      '/'
    when /^Viaggi disponibili page$/
      '/travels'
    when /^the travel page$/
      '/travels/'+ @travels.id.to_s

    when /^Dettagli Viaggio$/
      '/travels/'+ @travels.id.to_s

    when /^the new travels/
      '/travels/new'
    when /^my profile page/
      '/user'
    when /^the login page/
      '/users/sign_in'
    when /^Lista viaggi/
      '/travels'
    when /^Lista utenti/
      '/users'
    
    when /^users/
      '/users'
    when /^Torna alla homepage/
      '/'
    when /^Prova prova/
      '/users/2'


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
