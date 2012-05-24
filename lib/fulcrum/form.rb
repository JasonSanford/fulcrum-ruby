module Fulcrum
  class Form < Api
    def all(opts = {})
      params = {}.tap do |p|
        p[:page] = opts.delete(:page) if opts[:page]
        p[:schema] = opts.delete(:schema) if opts[:schema]
        p[:per_page] = opts.delete(:per_page) if opts[:per_page]
      end
      resp = @connection.get('forms.json')
      raise ApiError.new(resp.body, resp.status) if !resp.success?
      resp.body
    end
    
    def retrieve(id)
      resp = @connection.get("forms/#{id}.json")
      raise ApiError.new(resp.body, resp.status) if !resp.success?
      resp.body
    end
    
    def create(attributes = {})
      validation = FormValidator.new(attributes)
      if validation.valid?
        #resp = @connection.post("forms.json")
      else
        validation.errors
      end
    end
    
    def update(id, attributes = {})
      resp = @connection.put("forms/#{id}.json")
    end
    
    def delete(id)
    end
  end
end