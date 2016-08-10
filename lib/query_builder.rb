require 'yaml'

class QueryBuilder
  
  def search_parameters
    @search_parameters ||= YAML.load_file('./config/search_parameters.yml')
  end

end
